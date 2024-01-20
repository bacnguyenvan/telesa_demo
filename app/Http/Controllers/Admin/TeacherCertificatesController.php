<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Teacher\CertificatesRequest;
use App\Models\TeacherCertificates;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class TeacherCertificatesController extends Controller
{

    protected $user;
    public function __construct()
    {
        $this->user = Auth::guard('api')->user();
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($teacher_id)
    {
        $collection = TeacherCertificates::where('teacher_id', $teacher_id)->latest()->paginate(10);
        return view('admin.teacher.certificates.index', compact('teacher_id', 'collection'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($teacher_id)
    {
        $teacher = User::where(['role_id' => 2, 'id' => $teacher_id])->first();
        if ($teacher) {
            return view('admin.teacher.certificates.create', compact('teacher_id'));
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CertificatesRequest $request)
    {
        $data = $request->except(['_token']);

        if ($request->hasFile('file')) {
            $data['file'] = Storage::put('uploads/user/teacher/centificates', $request->file('file'));
        }
        TeacherCertificates::create($data);
        return redirect()->route('certificates.index', ['teacher_id' => $request->teacher_id]);
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
        $item = TeacherCertificates::where([
            'teacher_id' => $teacher_id,
            'id' => $id
        ])->first();
        if ($item) {
            return view('admin.teacher.certificates.edit', compact('item'));
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(CertificatesRequest $request, $teacher_id, $id)
    {
        $item = TeacherCertificates::where(['teacher_id' => $teacher_id, 'id' => $id])->first();
        if ($item) {
            $data = [
                'certificate' => $request->certificate,
                'description' => $request->description,
            ];

            if ($request->hasFile('file')) {
                if (!file_exists(public_path() . '/' . $item->file)) {
                    unlink(public_path() . '/' . $item->file);
                }
                $data['file'] = Storage::put('uploads/user/teacher/centificates', $request->file('file'));
            }
            TeacherCertificates::where(['teacher_id' => $teacher_id, 'id' => $id])->update($data);
        }
        return redirect()->route('certificates.index', ['teacher_id' => $teacher_id]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($teacher_id, $id)
    {
        TeacherCertificates::where([
            'id' => $id,
            'teacher_id' => $teacher_id
        ])->delete();
        return redirect()->route('certificates.index', ['teacher_id' => $teacher_id]);
    }
}
