@extends('admin.layouts.client')
@section('title')
    Phụ kiện
@endsection
@section('head')
    {{-- thêm css --}}
@endsection
@section('content')
    <div class="panel-header bg-primary-gradient">
        <div class="page-inner py-5">
            <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                <div>
                    <h2 class="text-white pb-2 fw-bold">Phụ Kiện</h2>
                </div>
            </div>
        </div>
    </div>
    <div class="page-inner mt--5">
        <div class="row mt--2">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="d-flex align-items-center">
                            <div class="col-4">
                                <h4 class="card-title">Danh sách</h4>
                            </div>
                            <div class="col-8 canphai">
                                <button class="btn btn-primary btn-round mr-2" data-toggle="modal"
                                    data-target="#themHangSanXuat">
                                    <i class="fa fa-plus"></i>
                                    &nbsp;Thêm Hãng
                                </button>
                                <button class="btn btn-primary btn-round ml-auto" data-toggle="modal"
                                    data-target="#themPhuKien">
                                    <i class="fa fa-plus"></i>
                                    &nbsp;Thêm Phụ Kiện
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        @include('admin.layouts.themhangsanxuat')
                        @include('admin.layouts.themphukien')
                        <div class="table-responsive">
                            <table id="add-row" class="display table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th width="5%">Mã</th>
                                        <th width="10%">Hình</th>
                                        <th>Tên</th>
                                        <th width="13%">Số lượng</th>
                                        <th width="20%">Giá</th>
                                        <th width="20%">Thao tác</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Mã</th>
                                        <th>Hình</th>
                                        <th>Tên</th>
                                        <th>Số lượng</th>
                                        <th>Giá</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    @if (!empty($danhSachSanPham))
                                        @foreach ($danhSachSanPham as $sanPham1)
                                            @if ($sanPham1->cat_products == 1)
                                                {{-- la phu kien --}}
                                                <tr>
                                                    <td>SP{{ $sanPham1->id_products }}</td>
                                                    @php
                                                        $thongTinPhuKien = [];
                                                        $thongTinQuaTang = [];
                                                        $thongTinHangSanXuat = [];
                                                        $thongTinThuVienHinh = [];

                                                        if (!empty($danhSachPhuKien) && !empty($sanPham1->id_accessory)) {
                                                            foreach ($danhSachPhuKien as $phuKienSua) {
                                                                if ($phuKienSua->id_accessory == $sanPham1->id_accessory) {
                                                                    $thongTinPhuKien = $phuKienSua;
                                                                    break;
                                                                }
                                                            }
                                                        }
                                                        if (!empty($danhSachHangSanXuatPhuKien)) {
                                                            foreach ($danhSachHangSanXuatPhuKien as $hangSanXuat_Sua) {
                                                                if ($hangSanXuat_Sua->id_mfg == $sanPham1->id_mfg) {
                                                                    $thongTinHangSanXuat = $hangSanXuat_Sua;
                                                                    break;
                                                                }
                                                            }
                                                        }
                                                        if (!empty($sanPham1->id_gift) && !empty($danhSachQuaTang)) {
                                                            foreach ($danhSachQuaTang as $quaTang_Sua) {
                                                                if ($quaTang_Sua->id_gift == $sanPham1->id_gift) {
                                                                    $flag = false;
                                                                    foreach ($quaTang_Sua as $giaTri) {
                                                                        if ($flag && !empty($giaTri)) {
                                                                            foreach ($danhSachSanPham as $sanPham) {
                                                                                if ($giaTri == $sanPham->id_products) {
                                                                                    $thongTinQuaTang = array_merge($thongTinQuaTang, [$sanPham]);
                                                                                }
                                                                            }
                                                                        }
                                                                        if (is_string($giaTri)) {
                                                                            $flag = true;
                                                                        }
                                                                    }
                                                                    break;
                                                                }
                                                            }
                                                        }
                                                    @endphp
                                                    @if (!empty($danhSachThuVienHinh))
                                                        @foreach ($danhSachThuVienHinh as $thuVienHinh)
                                                            @if ($thuVienHinh->id_photo == $sanPham1->id_photo)
                                                                <td><img
                                                                        src="{{ asset('img/sanpham/' . $thuVienHinh->photo_1) }}">
                                                                </td>
                                                                @php
                                                                    $thongTinThuVienHinh = $thuVienHinh;
                                                                    break;
                                                                @endphp
                                                            @endif
                                                        @endforeach
                                                    @endif
                                                    <td class="cantrai">{{ $sanPham1->name_products }}</td>
                                                    <td class="{{ $sanPham1->qty < 0 ? 'baodo' : '' }}">
                                                        {{ $sanPham1->qty }}</td>
                                                    @if (!empty($sanPham1->promotional_price))
                                                        <td
                                                            class="canphai {{ $sanPham1->promotional_price < $sanPham1->entry_price ? 'baodo' : '' }}">
                                                            {{ number_format($sanPham1->promotional_price, 0, ',') }}</td>
                                                    @else
                                                        <td class="canphai">
                                                            {{ number_format($sanPham1->sale_price, 0, ',') }}</td>
                                                    @endif
                                                    <td>
                                                        <div class="form-button-action">
                                                            <button type="button" data-toggle="modal" title="Cập nhật giá"
                                                                class="btn btn-link btn-success btn-lg"
                                                                onclick="capNhatGia('{{ $sanPham1->name_products }}','{{ $sanPham1->id_products }}','{{ $sanPham1->entry_price }}','{{ $sanPham1->sale_price }}','{{ $sanPham1->promotional_price }}')"
                                                                data-original-title="Cập nhật giá" data-target="#chinhGia">
                                                                <i class="fas fa-money-bill"></i>
                                                            </button>
                                                            <button type="button" data-toggle="modal" title="Chỉnh sửa"
                                                                class="btn btn-link btn-primary btn-lg"
                                                                data-original-title="Chỉnh sửa"
                                                                onclick='suaSanPham({!! json_encode($sanPham1) !!},{!! json_encode($thongTinPhuKien) !!},{!! json_encode($thongTinHangSanXuat) !!},{!! json_encode($thongTinThuVienHinh) !!},{!! json_encode($thongTinQuaTang) !!})'
                                                                data-target="#suaPhuKien">
                                                                <i class="fa fa-edit"></i>
                                                            </button>
                                                            <button type="button" data-toggle="modal" title="Xóa"
                                                                class="btn btn-link btn-danger" data-original-title="Xóa"
                                                                onclick="xoaSanPham('{{ $sanPham1->name_products }}','{{ $sanPham1->id_products }}')"
                                                                data-target="#xoaPhuKien">
                                                                <i class="fa fa-times"></i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endif
                                        @endforeach
                                        @include('admin.layouts.chinhgia')
                                        @include('admin.layouts.suaphukien')
                                        @include('admin.layouts.xoaphukien')
                                    @endif
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('js')
    {{-- thêm js --}}
@endsection
