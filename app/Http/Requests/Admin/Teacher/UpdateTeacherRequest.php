<?php

namespace App\Http\Requests\Admin\Teacher;

use Illuminate\Foundation\Http\FormRequest;

class UpdateTeacherRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'image' => [
                'image',
                'mimes:jpeg,png',
                'mimetypes:image/jpeg,image/png',
                'max:2048',
            ],
            'first_name' => ['required'],
            'last_name' => ['required'],
            'phone' => ['required'],
            'teaches' => ['required', 'numeric', 'min:1'],
            'speakes' => ['required', 'numeric', 'min:1'],
            'teacher_from' => ['required', 'numeric', 'min:1'],
            'description' => ['required'],
            'teaching_style' => ['required'],
            'teaching_material' => ['required'],
        ];
    }
}
