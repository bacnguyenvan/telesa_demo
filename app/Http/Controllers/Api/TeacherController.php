<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\RatingTeacherRequest;
use App\Http\Requests\Api\SaveTeacherRequest;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Resources\ApiListTeacherResource;
use App\Http\Resources\ApiRatingTeacherResource;
use App\Models\BookingTeacher;
use App\Models\RatingTeacher;
use App\Models\SaveTeacher;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class TeacherController extends Controller
{
    public function list()
    {
        $condition = ['role_id' => 2];
        $list = User::where($condition)->latest()->paginate(20);
        $data = ApiListTeacherResource::collection($list);

        return response()->json(api_success('Thông tin ds giáo viên', $data));
    }

    public function infor($id)
    {
        $teacher = User::where(['id' => $id, 'role_id' => 2])
            ->select(
                'id',
                'first_name',
                'last_name',
                'photo',
                'teaches',
                'speakes',
                'teacher_from',
                'description',
                'video',
                'teaching_style',
                'teaching_material'
            )
            ->first();
        if ($teacher) {
            $teacher->photo = $teacher->photo ? env('APP_URL')  . '/' . $teacher->photo : null;
            $teacher->teaches = $teacher->teaches != 0 ? countries()[$teacher->teaches] : "Chưa cập nhật";
            $teacher->speakes = $teacher->speakes != 0 ? countries()[$teacher->speakes] : "Chưa cập nhật";
            $teacher->teacher_from = $teacher->teacher_from != 0 ? countries()[$teacher->teacher_from] : "Chưa cập nhật";
            $teacher->video = $teacher->video ? env('APP_URL') . '/' . $teacher->video : null;
            $teacher->work_exprientce = $teacher->work_exprientce;
            $teacher->education = $teacher->education;

            //Xử lý danh sách đánh giá
            $rates = RatingTeacher::where(['teacher_id' => $teacher->id])->orderBy('updated_at')->get();
            $result_rating['list'] = ApiRatingTeacherResource::collection($rates);

            //Tính tổng số sao đc đánh giá và tính trung bình
            $result = RatingTeacher::select(
                DB::raw('COUNT(CASE WHEN star = 1 THEN 1 ELSE NULL END) AS one_star_count'),
                DB::raw('COUNT(CASE WHEN star = 2 THEN 1 ELSE NULL END) AS two_star_count'),
                DB::raw('COUNT(CASE WHEN star = 3 THEN 1 ELSE NULL END) AS three_star_count'),
                DB::raw('COUNT(CASE WHEN star = 4 THEN 1 ELSE NULL END) AS four_star_count'),
                DB::raw('COUNT(CASE WHEN star = 5 THEN 1 ELSE NULL END) AS five_star_count'),
                DB::raw('AVG(star) AS average_rating')
            )->where('teacher_id', $teacher->id)
                ->first();

            // Lấy kết quả
            $result_rating['infor'] = [
                'one_star_count' => $result->one_star_count,
                'two_star_count' => $result->two_star_count,
                'three_star_count' => $result->three_star_count,
                'four_star_count' => $result->four_star_count,
                'five_star_count' => $result->five_star_count,
                'average_rating' => $result->average_rating
            ];

            // Trả về kết quả đánh giá
            $teacher->rating = $result_rating;

            // Trả ra tình trạng booking
            // $teacher->booking = $teacher->booking;
            $teacher->booking = $this->booking($teacher->id);

            return response()->json(api_success('Thông tin giáo viên', $teacher));
        }
        return response()->json(api_error('Giáo viên không tồn tại'));
    }

    public function save(SaveTeacherRequest $request)
    {
        $teacher_id = $request->id;
        $teacher = User::where(['id' => $teacher_id, 'role_id' => 2])->first();
        if ($teacher) {
            $user = Auth::guard('api')->user();
            $saved = SaveTeacher::where(['user_id' => $user->id, 'teacher_id' => $teacher->id])->first();
            if (!$saved) {
                SaveTeacher::create([
                    'user_id' => $user->id,
                    'teacher_id' => $teacher->id,
                ]);
                $messsage = 'Lưu giáo viên thành công';
            } else {
                $saved->delete();
                $messsage = 'Bỏ lưu giáo viên thành công';
            }
            return response()->json(api_success($messsage));
        }
        return response()->json(api_error('Giáo viên không tồn tại'));
    }

    public function rating(RatingTeacherRequest $request)
    {
        $data = $request->all();
        $data['user_id'] = Auth::guard('api')->user()->id;

        $rating = RatingTeacher::where(['user_id' => $data['user_id'], 'teacher_id' => $data['teacher_id']]);
        if (!$rating->first()) {
            RatingTeacher::create($data);
        } else {
            $rating->update($data);
        }
        return response()->json(api_success("Đánh giá thành công"));
    }

    public function store_booking(Request $request, $id)
    {
        $data = $request->all();
        $user = Auth::guard('api')->user();
        $user_id = $user->id;

        $teacher = User::where(['id' => $id])->select('money')->first();
        /**
         * Công thức: Số tiền 1h của giáo viên * (tổng số ca học viên đặt * 0.5)
         * Trong đó: Tổng số ca của học viên là số bản ghi
         * 0.5 là thời gian 1 ca (30p)
         */
        $total_pay = (int)($teacher->money * (count($data) * 0.5));

        // Kiểm tra số tiền của học viên có đủ để đặt hay không
        if ($user->money >= $total_pay) {
            $total = 0;
            foreach ($data as $key => $item) {
                $booking = BookingTeacher::where([
                    'teacher_id' => $id,
                    'time_booking' => $item['time_booking'],
                    'date_booking' => $item['date_booking']
                ])->first();
                if (!$booking) {
                    BookingTeacher::create([
                        'user_id' => $user_id,
                        'teacher_id' => $id,
                        'time_booking' => $item['time_booking'],
                        'date_booking' => $item['date_booking'],
                        'weekdays' => date('w', strtotime($item['date_booking'])),
                        'type' => 0
                    ]);
                    $total++;
                }
            }

            // Tính lại số tiền thực cần phải trả
            $total_pay_real = (int)($teacher->money * ($total * 0.5));

            // Đặt xong thì trừ tiền của học viên
            User::where(['id' => $user_id])->update(['money' => $user->money - $total_pay_real]);
            return response()->json(api_success("Đặt lịch thành công"));
        } else {
            return response()->json(api_error('Bạn không đủ số dư cần thanh toán', ['money' => $user->money]));
        }
    }

    public function booking($id, $start_time = null, $end_time = null)
    {
        if (is_null($start_time) && is_null($end_time)) {
            $start_time_int = strtotime('monday this week');
            $end_time_int = strtotime('sunday this week');
        } else {
            $start_time_int = strtotime($start_time);
            $end_time_int = strtotime($end_time);
        }
        $start_time = date('d/m/Y', $start_time_int);
        $end_time = date('d/m/Y', $end_time_int);

        $booking_teacher = BookingTeacher::where('teacher_id', $id)
            ->where('date_booking', '>=', $start_time)
            ->where('date_booking', '<=', $end_time)
            ->get();
        $time_booking = time_booking();

        for ($i = $start_time_int; $i <= $end_time_int; $i += 86400) {
            $date = date('d/m/Y', $i);
            for ($j = 0; $j < 48; $j++) {
                $type_time = $time_booking[$j];
                $result[$date][$type_time] = 'free';
                foreach ($booking_teacher as $booking) {
                    if ($booking->time_booking == $j && $booking->date_booking == $date) {
                        if ($booking->type == 0) {
                            $result[$date][$type_time] = 'waiting';
                        } elseif ($booking->type == 1) {
                            $result[$date][$type_time] = 'booked';
                        } elseif ($booking->type == 2) {
                            $result[$date][$type_time] = 'busy';
                        }
                    }
                }
            }
        }

        return $result;
    }
}
