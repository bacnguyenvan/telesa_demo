<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Teacher\EducationRequest;
use App\Models\TeacherEducation;
use App\Models\User;
use Illuminate\Http\Request;

class TeacherEducationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($teacher_id)
    {
        $collection = TeacherEducation::where('teacher_id', $teacher_id)->latest()->paginate(10);
        return view('admin.teacher.education.index', compact('teacher_id', 'collection'));
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
            return view('admin.teacher.education.create', compact('teacher_id'));
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(EducationRequest $request)
    {
        $data = [
            'teacher_id' => $request->teacher_id,
            'time_start' => strtotime($request->time_start),
            'time_end' => strtotime($request->time_end),
            'school' => $request->school,
            'education' => $request->education,
        ];
        TeacherEducation::create($data);
        return redirect()->route('education.index', ['teacher_id' => $request->teacher_id]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($teacher_id, $id)
    {
        $TeacherEducation = TeacherEducation::where([
            'teacher_id' => $teacher_id,
            'id' => $id
        ])->first();
        if ($TeacherEducation) {
            return view('admin.teacher.education.edit', compact('TeacherEducation'));
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(EducationRequest $request, $teacher_id, $id)
    {
        $data = [
            'time_start' => strtotime($request->time_start),
            'time_end' => strtotime($request->time_end),
            'school' => $request->school,
            'education' => $request->education,
        ];
        TeacherEducation::where([
            'id' => $id,
            'teacher_id' => $teacher_id
        ])->update($data);
        return redirect()->route('education.index', ['teacher_id' => $teacher_id]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($teacher_id, $id)
    {
        TeacherEducation::where([
            'id' => $id,
            'teacher_id' => $teacher_id
        ])->delete();
        return redirect()->route('education.index', ['teacher_id' => $teacher_id]);
    }
}
