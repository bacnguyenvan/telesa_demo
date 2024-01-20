<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\ChangeNewPasswordForgetRequest;
use App\Http\Requests\Api\ForgetPassword;
use App\Http\Requests\Api\LoginRequest;
use App\Http\Requests\Api\RegisterRequest;
use App\Http\Requests\Api\UserRechargeRequest;
use App\Http\Requests\Api\UserUpdatePassRequest;
use App\Jobs\SendEmail;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class UserController extends Controller
{
    // Học viên Đăng nhập
    public function login(LoginRequest $request)
    {
        $creadient = $request->validated();
        $creadient['role_id'] = 5;
        if (Auth::attempt($creadient)) {
            $data = auth()->user();
            $data['token'] = $data->createToken(env('API_KEY'))->accessToken;
            if ($data['status'] == 0) {
                return response()->json(api_error('Tài khoản của bạn đang bị khóa'));
            }
            if ($data['authentic'] == 0) {
                return response()->json(api_error('Tài khoản của bạn chưa được kích hoạt, lấy token ở dưới để xác thực', [
                    'token' => $data['token']
                ]));
            }

            return response()->json(api_success('Đăng nhập thành công', $data));
        } else {
            return response()->json(api_error('Tài khoản hoặc mật khẩu không đúng'));
        }
    }

    public function register(RegisterRequest $request)
    {
        $user = new User();
        $user->first_name = $request->first_name;
        $user->last_name = $request->last_name;
        $user->username = $request->email;
        $user->role_id = 5;
        $user->email = $request->email;
        $user->phone = $request->phone;
        $user->password = Hash::make($request->password);
        $user->created_at = Carbon::now()->toDateTimeString();
        $user->authentic = 0;
        $user->save();

        $user->slug = $user->id . uniqid(10);
        if ($request->hasFile('image')) {
            $user->photo = Storage::put('uploads/user', $request->file('image'));

            // send mail

            // $message = [
            //     'type' => 'Bạn đã đăng ký tài khoản thành công',
            //     'username' => 'test',
            //     'password' => 'test',
            // ];
            // $users = User::where('id', $user->id)->get();
            // SendEmail::dispatch($message, $users);
            // ->delay(now()->addMinute(1));
        }
        $user->save();
        $user->token = $user->createToken(env('API_KEY'))->accessToken;
        $user->otp = rand(111111, 999999);
        return response()->json(api_success('Đăng nhập thành công', $user));
    }

    public function authentic()
    {
        $user = auth()->user();
        if ($user->authentic == 0) {
            $findUser = User::find($user->id);
            $findUser->authentic = 1;
            $findUser->save();
            return response()->json(api_success('Kích hoạt thành công', $findUser));
        } else {
            return response()->json(api_error('Tài khoản đã được kích hoạt'));
        }
    }

    public function forget_password(ForgetPassword $request)
    {
        $user = User::whereEmail($request->email)->first();
        if ($user) {
            $user->otp = rand(111111, 999999);
            return response()->json(api_success('Gửi mã otp thành công', $user));
        } else {
            return response()->json(api_error('Email không tồn tại'));
        }
    }

    public function change_new_password_forget(ChangeNewPasswordForgetRequest $request)
    {
        $user_id = $request->id;
        $user = User::find($user_id);
        if ($user) {
            $user->password = Hash::make($request->password);
            $user->save();

            return response()->json(api_success('Đổi mật khẩu thành công'));
        } else {
            return response()->json(api_error('Tài khoản không tồn tại'));
        }
    }

    public function infor()
    {
        $auth_user = auth()->user();
        $user = User::where('id', $auth_user->id)->first();
        $user->photo = $user->photo != null ? env('APP_URL') . $user->photo : null;
        return response()->json(api_success('Thông tin học viên', $user));
    }

    public function update(RegisterRequest $request)
    {
        $auth_user = auth()->user();
        $user = User::find($auth_user->id);
        $user->first_name = $request->first_name;
        $user->last_name = $request->last_name;
        $user->username = $request->email;
        $user->job = $request->job;
        $user->save();
        return response()->json(api_success('Cập nhật thông tin thành công'));
    }

    public function change_pass(UserUpdatePassRequest $request)
    {
        $auth_user = auth()->user();
        $user = User::find($auth_user->id);
        $user->password = Hash::make($request->password);
        $user->save();
        return response()->json(api_success('Cập nhật thông tin thành công'));
    }

    public function delete_account()
    {
        $auth_user = auth()->user();
        $user = User::find($auth_user->id);
        $user->status = 0;
        $user->save();
        return response()->json(api_success('Xóa tài khoản thành công'));
    }

    public function recharge(UserRechargeRequest $request)
    {
        $auth_user = auth()->user();
        $money = $request->money;
        User::where(['id' => $auth_user->id])->increment('money', $money);
        return response()->json(api_success('Nạp tiền thành công'));
    }
}
