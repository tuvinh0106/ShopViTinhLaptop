@extends('admin.layouts.client')
@section('title')
    Phiếu xuất
@endsection
@section('head')
    {{-- thêm css --}}
    <style>
        .form-button-action *{
            padding-left: 8px !important;
            padding-right: 8px !important;
        }
    </style>
@endsection
@section('content')
    <div class="panel-header bg-primary-gradient">
        <div class="page-inner py-5">
            <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                <div>
                    <h2 class="text-white pb-2 fw-bold">Phiếu Xuất Hàng</h2>
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
                            <h4 class="card-title">Danh sách</h4>
                            <a class="btn btn-primary btn-round ml-auto" href="{{ route('themphieuxuat') }}">
                                <i class="fa fa-plus"></i>
                                &nbsp;Lập Phiếu Xuất
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table  id="add-row" class="display table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th width="1%">Mã</th>
                                        <th width="15%">Thời gian</th>
                                        <th>Tên khách hàng</th>
                                        <th width="12%">Tình trạng giao hàng</th>
                                        <th width="12%">Trạng thái thanh toán</th>
                                        <th width="12%">Tổng tiền</th>
                                        <th width="15%">Thao tác</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Mã</th>
                                        <th>Thời gian</th>
                                        <th>Tên khách hàng</th>
                                        <th>Tình trạng giao hàng</th>
                                        <th>Trạng thái thanh toán</th>
                                        <th>Tổng tiền</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    @php
                                        if (request()->ttgh == 1) {
                                            $danhSachPhieuXuat = $danhSachPhieuXuatChoXacNhan;
                                        }
                                    @endphp
                                    @if (!empty($danhSachPhieuXuat))
                                        @foreach ($danhSachPhieuXuat as $phieuXuat)
                                            <tr>
                                                <td>PX{{ $phieuXuat->id_invoice }}</td>
                                                <td>{{ date('H:i d/m/Y', strtotime($phieuXuat->date_created)) }}</td>
                                                @if (!empty($danhSachNguoiDung))
                                                    @foreach ($danhSachNguoiDung as $nguoiDung)
                                                        @if ($nguoiDung->id_users == $phieuXuat->id_users)
                                                            <td
                                                                class="cantrai {{ $nguoiDung->status == 0 ? 'baovang' : '' }}">
                                                                {{ $nguoiDung->name_users }}</td>
                                                        @break
                                                    @endif
                                                @endforeach
                                            @endif
                                            @php
                                                $btnColor = null;
                                                $btnNoiDung = null;
                                                if ($phieuXuat->delivery_status == 0) {
                                                    $btnColor='btn-danger'; //da huy
                                                    $btnNoiDung = 'Đã hủy';
                                                } elseif ($phieuXuat->delivery_status == 1) {
                                                    $btnColor='btn-warning'; //cho xac nhan
                                                    $btnNoiDung = 'Chờ xác nhận';
                                                } elseif ($phieuXuat->delivery_status == 2) {
                                                    $btnColor='btn-info'; //dang chuan bi hang
                                                    $btnNoiDung = 'Đang chuẩn bị hàng';
                                                } elseif ($phieuXuat->delivery_status == 3) {
                                                    $btnColor='btn-primary'; // dang giao hang
                                                    $btnNoiDung = 'Đang giao hàng';
                                                } elseif ($phieuXuat->delivery_status == 4) {
                                                    $btnColor='btn-success'; // da giao thanh cong
                                                    $btnNoiDung = 'Đã giao thành công';
                                                }
                                            @endphp
                                            <td>
                                                <form action="{{ route('xulyphieuxuat') }}" method="POST"
                                                    enctype="multipart/form-data" >
                                                    <input name="maPhieuXuatDoi" type="number"
                                                        value="{{ $phieuXuat->id_invoice }}" hidden required>
                                                    <button type="submit" class="btn {{ $btnColor }} btn-border"
                                                        title="Đổi tình trạng giao hàng" style="width:99%;"
                                                        name="thaoTac" value="đổi tình trạng giao hàng" >
                                                        {{ $btnNoiDung }}
                                                    </button>
                                                    @csrf
                                                </form>
                                            </td>
                                            @if ($phieuXuat->debt == 0)
                                                <td>Đã thanh toán</td>
                                            @else
                                                <td>Công nợ</td>
                                            @endif
                                            @if (!empty($danhSachMaGiamGia) && !empty($phieuXuat->id_discount))
                                                @foreach ($danhSachMaGiamGia as $maGiamGia)
                                                    @if ($maGiamGia->id_discount == $phieuXuat->id_discount)
                                                        @php
                                                            $phieuXuat->total_money -= $maGiamGia->reduced_price;
                                                            break;
                                                        @endphp
                                                    @endif
                                                @endforeach
                                            @endif
                                            <td class="canphai">{{ number_format($phieuXuat->total_money, 0, ',') }}
                                            </td>
                                            <td>
                                                <div class="form-button-action">
                                                    <!-- <a target="_blank"
                                                        href="{{ url('inphieuxuat?mapx=' . $phieuXuat->id_invoice) }}"
                                                        title="Chỉnh sửa" class="btn btn-link btn-success btn-lg">
                                                        <i class="fa fa-print"></i>
                                                    </a> -->
                                                    <a href="{{ url('suaphieuxuat?id=' . $phieuXuat->id_invoice) }}"
                                                        title="Chỉnh sửa" class="btn btn-link btn-primary btn-lg">
                                                        <i class="fa fa-edit"></i>
                                                    </a>
                                                    <button type="button" data-toggle="modal" title="Xóa"
                                                        class="btn btn-link btn-danger" data-original-title="Xóa"
                                                        data-target="#xoaPhieuXuat{{ $phieuXuat->id_invoice }}">
                                                        <i class="fa fa-times"></i>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                        @include('admin.layouts.xoaphieuxuat')
                                    @endforeach
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
