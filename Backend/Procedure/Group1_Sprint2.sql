USE [DbPratice]
GO
/****** Object:  StoredProcedure [dbo].[LOAIXE_Group1Edit]    Script Date: 6/3/2020 12:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[LOAIXE_Group1Edit]
@Ma int = NULL,
@LoaiXe_Ten nvarchar(50) = NULL,
@LoaiXe_Hang nvarchar(50) = NULL,
@LoaiXe_DinhMucNhienLieu float = NULL,
@LoaiXe_NamSX int = NULL,
@LoaiXe_SoLuong int = NULL,
@LoaiXe_TrangThai varchar(1) = NULL,
@LoaiXe_NgayTao datetime = NULL,
@LoaiXe_NguoiTao nvarchar(50) = NULL,
@LoaiXe_LoaiNhienLieu varchar(1) = NULL
as

if(exists(select * from LoaiXe where LoaiXe_Ten = @LoaiXe_Ten))
begin
	select '-1' as Result, N'Xe đã tồn tại trong hệ thống' as ErrorDesc
end

begin transaction
begin try

	UPDATE [dbo].[LoaiXe]
	   SET [LoaiXe_Ten] = @LoaiXe_Ten
		  ,[LoaiXe_Hang] = @LoaiXe_Hang
		  ,[LoaiXe_DinhMucNhienLieu] = @LoaiXe_DinhMucNhienLieu
		  ,[LoaiXe_NamSX] = @LoaiXe_NamSX
		  ,[LoaiXe_SoLuong] = @LoaiXe_SoLuong
		  ,[LoaiXe_TrangThai] = @LoaiXe_TrangThai
		  ,[LoaiXe_NgayTao] = @LoaiXe_NgayTao
		  ,[LoaiXe_NguoiTao] = @LoaiXe_NguoiTao
		  ,[LoaiXe_LoaiNhienLieu] = @LoaiXe_LoaiNhienLieu
	WHERE Ma = @Ma
commit transaction
	select '0' as Result, N'' as ErrorDesc, @ma as MA
end try
begin catch

rollback transaction

end catch
