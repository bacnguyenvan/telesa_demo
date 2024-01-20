<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Teacher\WorkExprientceRequest;
use App\Models\TeacherWorkExprientce;
use App\Models\User;
use Illuminate\Http\Request;

class TeacherWorkExperienceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($teacher_id)
    {
        $collection = TeacherWorkExprientce::where('teacher_id', $teacher_id)->latest()->paginate(10);
        return view('admin.teacher.work_experience.index', compact('teacher_id', 'collection'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($teacher_id)
    {
        $teacher = User::where([
            'role_id' => 2,
            'id' => $teacher_id
        ])->first();
        if ($teacher) {
            return view('admin.teacher.work_experience.create', compact('teacher_id'));
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(WorkExprientceRequest $request)
    {
        $data = [
            'teacher_id' => $request->teacher_id,
            'time_start' => strtotime($request->time_start),
            'time_end' => strtotime($request->time_end),
            'school' => $request->school,
            'position' => $request->position,
            'description' => $request->description,
        ];
        TeacherWorkExprientce::create($data);
        return redirect()->route('work_experience.index', ['teacher_id' => $request->teacher_id]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($teacher_id)
    {
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($teacher_id, $id)
    {
        $TeacherWorkExprientce = TeacherWorkExprientce::where([
            'teacher_id' => $teacher_id,
            'id' => $id
        ])->first();
        if ($TeacherWorkExprientce) {
            return view('admin.teacher.work_experience.edit', compact('TeacherWorkExprientce'));
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(WorkExprientceRequest $request, $teacher_id, $id)
    {
        $data = [
            'time_start' => strtotime($request->time_start),
            'time_end' => strtotime($request->time_end),
            'school' => $request->school,
            'position' => $request->position,
            'description' => $request->description,
        ];
        TeacherWorkExprientce::where([
            'id' => $id,
            'teacher_id' => $teacher_id
        ])->update($data);
        return redirect()->route('work_experience.index', ['teacher_id' => $teacher_id]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($teacher_id, $id)
    {
        TeacherWorkExprientce::where([
            'id' => $id,
            'teacher_id' => $teacher_id
        ])->delete();
        return redirect()->route('work_experience.index', ['teacher_id' => $teacher_id]);
    }
}
