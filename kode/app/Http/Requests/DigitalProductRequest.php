<?php

namespace App\Http\Requests;

use App\Rules\General\FileExtentionCheckRule;
use App\Rules\General\FileLengthCheckRule;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\JsonResponse;
use Illuminate\Validation\Rule;
class DigitalProductRequest extends FormRequest
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

            'name'                   => 'required|max:255',
            'point' => 'required|numeric|gt:-1|max:2000000',
            'slug'                   => 'required|max:191',
            'category_id'            => 'required|exists:categories,id',
            'subcategory_id'         => 'nullable|exists:categories,id',
            'description'            => 'required',
            'featured_image'         => ['required',new FileExtentionCheckRule(file_format())],
            'attribute_option'       => 'required|array',
            'attribute_option.name'  => 'required|array',
            'attribute_option.price' => 'required|array',
            
            'tax_id'=> "nullable|array",
            'tax_id.*'=> "nullable|exists:taxes,id",
            'tax_amount'=> "nullable|array",
            'tax_amount.*'=> "nullable|numeric|gt:-1",
            'tax_type'=> "nullable|array",
            'tax_type.*'=> ["nullable",Rule::in(['0', '1'])]

   
        ];
    }


    public function messages()
    {
       return [
            'name.required' => 'Product title is required',
            'category_id.required' => 'Category is required',
            'description.required' => 'Description is required',
            'featured_image.required' => "Feature Image is required",
            'attribute_option.required' => 'Product Stock is Required',
            'attribute_option.name'     => 'Product Stock name is Required',
            'attribute_option.price'     => 'Product Stock price is Required',
        ];
    }



}
