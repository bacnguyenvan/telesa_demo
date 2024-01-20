<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Teacher\CreateTeacherRequest;
use App\Http\Requests\Admin\Teacher\UpdateTeacherRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class TeacherController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if (Auth::user()->role_id == 1) {
            $role_id = 2;
            $condition = ['role_id' => $role_id];

            if ($request->email) {
                $condition['email'] = $request->email;
            }

            $collection = User::active()
                ->with('role_information')
                ->where($condition)
                ->orderBy('created_at', 'desc')
                ->paginate(10);
            return view('admin.teacher.index', ['collection' => $collection, 'role_id' => $role_id]);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (Auth::user()->role_id == 2) {
            dd("Bạn không có quyền truy cập");
        }
        return view('admin.teacher.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateTeacherRequest $request)
    {
        $request->role_id = 2;
        User::create($request);
        return redirect()->route('admin_user_teacher');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::find($id);
        return view('admin.teacher.show', compact('user'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $teacher = User::where(['id' => $id, 'role_id' => 2])->first();
        if ($teacher) {
            return view('admin.teacher.edit', compact('teacher'));
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateTeacherRequest $request, $id)
    {
        $data = $request->all();
        unset($data['_token'], $data['_method']);
        $user = User::where('id', $id);
        if ($request->hasFile('image')) {
            unset($data['image']);
            $data['photo'] = Storage::put('uploads/user', $request->file('image'));
        }
        if ($request->hasFile('video')) {
            $data['video'] = Storage::put('uploads/user/video', $request->file('video'));
        }

        $user->update($data);
        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
