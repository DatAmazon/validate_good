create database db_ThucHanh
go
alter proc UserResgister(
@sUserName nvarchar(30),
@sPassword nvarchar(30))
as
begin
	Insert into tblUsers Values(@sUserName, @sPassword, 0)
end
exec UserResgister 'ngoc1', '0050'
go

create proc UserLogin 
@sUserName nvarchar(30),
@sPassword nvarchar(30)
as
begin
	
	select * from tblUsers
	where sUserName = @sUserName
	and sPassword = @sPassword
end
exec UserLogin 'ngoc', '0050'
go

alter proc UserUpdate
@Pk_iUserID nvarchar(30),
@sNewPass nvarchar(30)
as
begin
	update tblUsers
	set sPassword = @sNewPass
	where Pk_iUserID = @Pk_iUserID 
end
exec UserUpdate '1', '7777'

select * from tblUsers