<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\ChangeActiveLessonRequest;
use App\Http\Resources\ApiCourseListResource;
use App\Http\Resources\ApiCourseResource;
use App\Http\Resources\ApiLessonResource;
use App\Models\Course;
use App\Models\CourseLesson;
use App\Models\UserCourses;
use App\Models\Vendor;
use App\Models\VendorUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CourseController extends Controller
{
    public function index()
    {
        $courses = Course::orderBy('updated_at', 'desc')->get();
        $resourceCourses = ApiCourseResource::collection($courses);
        $data = [
            'banner' => null,
            'courses' => $resourceCourses
        ];
        return response()->json(api_success('Trang chủ danh sách khóa học', $data));
    }

    public function show($id)
    {
        $course = Course::where('courses.id', $id)
            ->select('courses.*', 'first_name', 'last_name', 'photo')
            ->leftJoin('users', 'teacher_id', '=', 'users.id')->first();
        if ($course) {
            $course->buyed = false;
            // Kiểm tra xem có đăng nhập tài khoản học viên không?
            if (Auth::guard('api')->check()) {
                $user_id = Auth::guard('api')->user()->id;
                $course_user = UserCourses::where(['user_id' => $user_id, 'course_id' => $course->id])->first();
                if ($course_user) {
                    $course->buyed = true;
                }
            }
            $course->photo = $course->photo != null ? env('APP_URL') . $course->photo : null;
            $course->price_after_discount = $course->discount != 0 ? $course->price - ($course->price * $course->discount / 100) : 0;
            return response()->json(api_success('Thông tin chi tiết khóa học', $course));
        }
        return response()->json(api_error('Khóa học không tồn tại'));
    }

    public function list()
    {
        $user = auth()->user();
        $userCourses = UserCourses::orderBy('id', 'ASC')->where('user_id', $user->id)->get();
        $collection = ApiCourseListResource::collection($userCourses);
        return response()->json(api_success('Thông tin chi tiết khóa học', $collection));
    }

    public function lessons($id)
    {
        $course_lesson = CourseLesson::where('course_id', $id)
            ->orderBy('sort_order', 'ASC')
            ->orderBy('id', 'ASC')
            ->orderBy('sort_order', 'DESC')
            ->latest()
            ->get();

        $listVendorUser = VendorUser::where('user_id', Auth::user()->id)
            ->select('lesson_id')
            ->pluck('lesson_id')
            ->all();
        foreach ($course_lesson as $key => $item) {
            $item->checkDone = in_array($item->id, $listVendorUser) ? true : false;
        }
        $collection = ApiLessonResource::collection($course_lesson);
        return response()->json(api_success('Thông tin chi tiết khóa học', $collection));
    }

    public function lessons_detail($id)
    {
        // check permission to view lesson
        $has_permission = CourseLesson::where('lesson_id', $id)
            ->leftJoin('user_courses', 'user_courses.course_id', '=', 'course_lessons.course_id')
            ->where('user_courses.user_id', Auth::user()->id)
            ->pluck('user_courses.id')
            ->first();

        if (is_null_or_empty($has_permission)) {
            return response()->json(api_error('Khóa học không tồn tại'));
        }

        $vendor = Vendor::where('id', $id)->first(); // Lession detail
        $data = ['name' => $vendor->name];
        if ($vendor->video01 != null) {
            $data['video'] = url('/' . $vendor->video01);
        }
        if ($vendor->video02 != null) {
            $data['video'] = url('/' . $vendor->video02);
        }
        if ($vendor->video03 != null) {
            $data['video'] = url('/' . $vendor->video03);
        }

        return response()->json(api_success('Thông tin chi tiết khóa học', $data));
    }

    public function change_active(ChangeActiveLessonRequest $request)
    {
        $user_id = Auth::user()->id;
        $lesson_id = $request->valueLesson;

        $lessonUser = VendorUser::where('user_id', $user_id)->where('lesson_id', $lesson_id)->first();

        if ($lessonUser == null) {
            $lessonUser = new VendorUser();
            $lessonUser->user_id = $user_id;
            $lessonUser->lesson_id = $lesson_id;
            $lessonUser->save();
        } else {
            $lessonUser->delete();
        }

        return response()->json(api_success('Cập nhật thành công'));
    }
}
