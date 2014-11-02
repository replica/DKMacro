MacroFunctions = MacroFunctions or {}

MacroOptions =
{
  szTitle="DKMacro v3.0",
  szPlace="",

  autoShout=false,
  autoSkillInterrupt=true,
  autoClearBuff=true,
  bLatencyCompensation=true,
  bChannelingLatencyCompensation=true,
  autoStopAction=false,

  autoUseWeapon=false,
  autoUseAmulet=false,
  autoUsePendant=false,

  autoSwapWeapon1=false,
  autoSwapWeapon2=false,
  szMainWeaponName1="",
  szMainWeaponName2="",
  szAuxWeaponName1="",
  szAuxWeaponName2="",
  szThirdWeaponName1="",
  szThirdWeaponName2="",
  weaponBuffID1=0,
  weaponBuffID2=0,
  weaponBuffLevel1=0,
  weaponBuffLevel2=0,
  weaponBuffStack1=0,
  weaponBuffStack2=0,
  minWeaponBuffTime1=0,
  minWeaponBuffTime2=0,
  weaponType1=0,
  weaponType2=0,
  secondWeaponBuffID1=0,
  secondWeaponBuffID2=0,
  secondWeaponBuffLevel1=0,
  secondWeaponBuffLevel2=0,
  secondWeaponBuffStack1=0,
  secondWeaponBuffStack2=0,
  secondMinWeaponBuffTime1=0,
  secondMinWeaponBuffTime2=0,
  secondWeaponType1=0,
  secondWeaponType2=0,

  swapWeaponArray = {
    PhaThuNgu={buffInfo={buffID=4764,buffLevel=1,buffStack=5,buffMinTime=1.5,weaponType=1},weaponList={"Hoàn Mang, Côn Ngữ Kiếm","Mặc Lân, Thần Uyên Di Bảo","Thiên Cương, Phi Lai Huyền Kiếm","Liệt Đào, Thần Nghệ Lực","Khiếu Nguyệt, Cô Lang Ngạo","Tử Mạch",}},
    PhaSinhHuyet={buffInfo={buffID=4764,buffLevel=2,buffStack=5,buffMinTime=1.5,weaponType=1},weaponList={}},
    PhaNaiThu={buffInfo={buffID=4764,buffLevel=3,buffStack=5,buffMinTime=1.5,weaponType=1},weaponList={"Ngân Dực, Ưng Yên Không", "Lẫm Phong, Bắc Nguyên Thanh","Phần Lãng, Thiên Bằng Nộ","Ỷ Tiên, Biệt Ly Vũ","Quy Nguyên, Thiên Nhân Cảnh","Vấn Tình, Tịch Hồn Phong","Ngục Liên, Man Tế Uy",}},
    PhaPhoSinh={buffInfo={buffID=4764,buffLevel=4,buffStack=5,buffMinTime=1.5,weaponType=1},weaponList={}},

    ThuyNhueNhan={buffInfo={buffID=4761,buffLevel=1,buffStack=10,buffMinTime=1.5,weaponType=1},weaponList={}},
    ThuyKichLuu={buffInfo={buffID=4761,buffLevel=2,buffStack=10,buffMinTime=1.5,weaponType=1},weaponList={}},
    ThuyThongThiet={buffInfo={buffID=4761,buffLevel=3,buffStack=10,buffMinTime=1.5,weaponType=1},weaponList={"Chiếu Quốc Lãng Kiếm","Lân Trạch Thanh Mang","Tiêu Cốt Độc Nỏ","Lăng Kích Cường Nỏ","Thi Trấn Ngũ Nhạc","Linh Hạt Cổ Kiếm","Đông Vô Khiên Dương","Phất Khởi Long Y","Quỷ Liễu Diệu Mặc","Thiền Tâm Phục Minh","Long Hủy Chiến Kích","Kiêu Tâm Lục","Phạn Phong Bạo",}},
    ThuyHuyetHon={buffInfo={buffID=4761,buffLevel=4,buffStack=10,buffMinTime=1.5,weaponType=1},weaponList={"Diên Thế Vương Thương","Phân Tiêu Ảnh Nhẫn","Bạt Đà La Trượng",}},
    ThuyHaiNap={buffInfo={buffID=4761,buffLevel=5,buffStack=10,buffMinTime=1.5,weaponType=1},weaponList={"Lạc Hoa Hạ Thảo","Tuần Mộng Chuyên Bút","Thu Vô Khổ Vũ",}},
    ThuyNguThu={buffInfo={buffID=4761,buffLevel=6,buffStack=10,buffMinTime=1.5,weaponType=1},weaponList={}},
    ThuyLinhDong={buffInfo={buffID=4761,buffLevel=7,buffStack=10,buffMinTime=1.5,weaponType=1},weaponList={}},
    ThuyBatKhuat={buffInfo={buffID=4761,buffLevel=8,buffStack=10,buffMinTime=1.5,weaponType=1},weaponList={}},
    ThuyVoSong={buffInfo={buffID=4761,buffLevel=9,buffStack=10,buffMinTime=1.5,weaponType=1},weaponList={}},
    ThuyTamNhan={buffInfo={buffID=4761,buffLevel=10,buffStack=10,buffMinTime=1.5,weaponType=1},weaponList={}},
    ThuyCuongCong={buffInfo={buffID=4761,buffLevel=11,buffStack=10,buffMinTime=1.5,weaponType=1},weaponList={}},
    ThuyThuDich={buffInfo={buffID=4761,buffLevel=12,buffStack=10,buffMinTime=1.5,weaponType=1},weaponList={}},
    ThuyCapToc={buffInfo={buffID=4761,buffLevel=13,buffStack=10,buffMinTime=1.5,weaponType=1},weaponList={}},

    LoiNhueNhan={buffInfo={buffID=6394,buffLevel=1,buffStack=1,buffMinTime=1,weaponType=2},weaponList={"Tề Vân Công","Thiên Tải Danh","Dị Chẩn Dực","Thiên Chướng Tỏa","Vân Ảnh Đào Thanh","Thanh Nhai Bạch Lộc Kiếm","Thừa Quang Chuyển","Thương Phong Tần Ưng","Vĩnh Gia Đạo","Bích Vân Điểm Sương","Cao Đạm Liêu","Khao Lí Hành",}},
    LoiKichLuu={buffInfo={buffID=6394,buffLevel=1,buffStack=1,buffMinTime=1,weaponType=2},weaponList={"Độc Ngộ Không Sơn","Tịch Tịnh Đế Quan","Quân Linh Phẩm","Thủy Ngọc Trường Sinh Kiếm","Thúy Liễu Nghiên","Thọ Dương Mai Hoa","Vạn Cổ Trần","Chu Minh Thừa Dạ","Phượng Điển Khúc","Cốt Dung","Vân Mạc Thâm","Giao Bác","Lăng Minh Tư","Thanh Phong Đoạn Xuyên",}},
    LoiTramThiet={buffInfo={buffID=6394,buffLevel=1,buffStack=1,buffMinTime=1,weaponType=2},weaponList={"Vân Hải Không Minh","Duy Dương","Dịch Thủy Cuồng Ca","Tử Lân Thiên Thu","Ẩm Huyết Băng Tâm","Thương Ngô Dã",}},
    LoiDietKhi={buffInfo={buffID=6394,buffLevel=1,buffStack=1,buffMinTime=1,weaponType=2},weaponList={"Đoạn Tình Độ Sinh","Minh Hồn","Loan Ca Phượng Vũ","Lăng Vân Mặc Long","Phượng Thương Hóa Vũ","Tinh Đấu Phong Lôi","Tuyệt Mạc Sương Nguyệt",}},
    LoiThongThiet={buffInfo={buffID=6394,buffLevel=1,buffStack=1,buffMinTime=1,weaponType=2},weaponList={}},
    LoiNguThu={buffInfo={buffID=6394,buffLevel=1,buffStack=1,buffMinTime=1,weaponType=2},weaponList={}},
    LoiLinhDong={buffInfo={buffID=6394,buffLevel=1,buffStack=1,buffMinTime=1,weaponType=2},weaponList={"Tịch Dương Lưu Hỏa","Lãnh Huy Ngưng","Khấp Huyết Kim Xà",}},
    LoiBatKhuat={buffInfo={buffID=6394,buffLevel=1,buffStack=1,buffMinTime=1,weaponType=2},weaponList={"Huyết Kích Chỉ Qua","Tần Hoán Ân","Thiên Uy",}},
    LoiHaiNap={buffInfo={buffID=6394,buffLevel=1,buffStack=1,buffMinTime=1,weaponType=2},weaponList={"Dao Đài Thiên Tâm","Hoa Nhan Khinh","Vô Mộng","Tuế Hoa Tây Phong","Tùy Ba Lưu Minh","Tử Ngọc Ca","Điệp Mộng Nam Hoa","Phong Trạch Diễn","U Điệp Vũ",}},
    LoiCuongCong={buffInfo={buffID=6394,buffLevel=1,buffStack=1,buffMinTime=1,weaponType=2},weaponList={}},
    LoiThuDich={buffInfo={buffID=6394,buffLevel=1,buffStack=1,buffMinTime=1,weaponType=2},weaponList={"Tịch Phàn, Tiêu Nghiệp Nhất Niệm","Phật Tôn Pháp Đế","Khoáng Vọng Thệ Thủy","Pháp Giới Bảo Diệm","Thiên Kỳ, Thiết Hoàng Nặc","Hoan Thần, thương nguyệt vẫn khí",}},
    LoiCapToc={buffInfo={buffID=6394,buffLevel=1,buffStack=1,buffMinTime=1,weaponType=2},weaponList={}},
  },

  autoSelfQC=false,
  autoToaVongVoNgaTHC=true,
  autoToaVongVoNgaTHKY=true,
  autoThaoQuangDuongHoiTHC=true,
  autoThaoQuangDuongHoiTHKY=true,
  autoTuKhiDongLaiTHC=true,
  autoTuKhiDongLaiTHKY=true,
  autoCuuChuyenQuyNhat=true,
  autoHoaTamThanhTHC=false,
  autoHoaTamThanhTHKY=false,
  autoPhaThuongKhung=true,
  autoXungAmDuong=false,
  autoSinhThaiCucTHC=false,
  autoSinhThaiCucTHKY=false,
  autoBaoNguyenThuKhuyetTHC=true,
  autoBaoNguyenThuKhuyetTHKY=true,
  MPLimitTHC=40,
  MPLimitTHKY=40,
  autoBangHuNguPhongTHC=true,
  autoBangHuNguPhongTHKY=true,
  autoTranSonHa=false,
  autoThonNhatNguyet=false,
  autoToaiTinhThan=true,
  autoLangThaiHu=false,
  autoChuyenCanKhon=true,
  autoThienDiaVoCuc=true,
  autoNguPhuongHanhTan=false,
  autoStopTTLH=false,
  autoVTBKMode=2,
  totalGasFieldTHC=0,
  totalGasFieldTHKY=0,

  autoPhuQuangLuocAnhKVQ=false,
  autoKinhHongDuLongKVQ=true,
  autoTapTrungKVQ=true,
  autoNguNguyenTien=false,
  autoPhuQuangLuocAnhTLND=false,
  autoKinhHongDuLongTLND=true,
  autoTapTrungTLND=true,
  autoTapTrungQPTC=1,
  stackNumPheTam=5,
  autoQuiPhuThanCong=true,
  autoDoCungChuyKien=true,
  autoTCB=1,
  autoTCBAttack=true,
  toggleAttackMode=1,
  toggleATSCMode=100,

  autoTatNHCY=true,
  autoDotNHCY=true,
  autoTuNhuLamNHCY=true,
  autoHamNhuLoiNHCY=true,
  autoTatNhuPhongNHCY=true,
  autoGamNhuHoNHCY=true,
  autoThuNhuSonNHCY=true,
  autoTatTLL=true,
  autoDotTLL=true,
  autoTuNhuLamTLL=true,
  autoHamNhuLoiTLL=true,
  autoTatNhuPhongTLL=true,
  autoGamNhuHoTLL=true,
  autoNguTLL=true,
  autoThuNhuSonTLL=true,
  autoNgangNhuNgac=true,
  autoDinhQuan=true,
  autoLuocNhuHoa=true,

  sunModePATQ=false,
  moonModePATQ=false,
  autoLuuQuangTuAnh=true,
  autoAoQuangBoPATQ=true,
  autoAoQuangBoMTLLT=true,
  autoAmTranDiTan=0,
  autoCucLacDanPATQ=true,
  autoThamMaThePATQ=true,
  autoQuangMinhTuongPATQ=true,
  autoSinhDietDuDoat=true,
  autoNNLN=true,
  sunModeMTLLT=true,
  moonModeMTLLT=false,
  autoCucLacDanMTLLT=true,
  autoThanhMinhHuuMTLLT=true,
  autoThamMaTheMTLLT=true,
  autoQuangMinhTuongMTLLT=true,
  autoTinhMenhHai=true,
  autoTuBiNguyen=true,
  alwaysTuBiNguyen=false,
  autoNhatNguyetTinhThe=false,

  autoTuyenNgungNguyet=true,
  autoThamMai=true,
  OMLTDK=true,
  autoOanhMinhLieu=true,
  autoTuyetDoanKieu=true,
  autoBinhHoHoangLong=true,
  autoMongTuyenHoBao=true,
  autoVanTeTung=true,
  autoPhongLaiNgoSon=true,

  autoXuanNeHoHoa=true,
  autoBichThuyThaoThien=true,
  autoThanhTamTinhKhi=true,
  autoThuyNguyetVoGian=true,
  
  autoThienDiaDeNgang=true,
  autoBaLaMon=true,
  autoLongTriNhac=true,
  autoManDuongThe=true,
  autoPhonAmCapTiet=true,
  autoKiemPhaHuKhong=true,
  autoKiemThanVoNga=true,

  autoPhuongHoangCo=true,
  autoHuyenThuyCo=true,
  autoCoTrungCuongBao=true,
  saveManaMode=false,
  autoDoatMenhCo=false,
  autoKhoTanCo=false,
  autoMeTamCo=false,
  autoSelfBuff=false,
  autoHienTe=true,
  autoThienTi=false,
  rebuffXaAnh=false,

  autoVoTuongQuyetDCK=true,
  autoDiecKhoDiecVinh=true,
  autoBatNhaQuyetDCK=true,
  autoPhatTamQuyetDCK=true,
  autoPhatTamQuyetTTK=true,
  autoKimCuongNoMuc=true,
  autoCamLongQuyetDCK=true,
  autoVoTuongQuyetTTK=true,
  autoTuNapCanKhon=true,
  autoBatNhaQuyetTTK=true,
  autoCamLongQuyetTTK=true,
  autoQuyKhuLaiCon=true,
  autoDaiSuTuHong=true,

  autoTieuTuyCuong=true,
  autoTuuTrungTien=true,
  autoBongDaCauDau1=false,
  autoBongDaCauDau2=false,
  autoYenVuHanh=true,
  autoThiemChuanKich=true,
  attackMode=1,
}
RegisterCustomData("MacroOptions.autoShout")
RegisterCustomData("MacroOptions.autoSkillInterrupt")
RegisterCustomData("MacroOptions.autoClearBuff")
RegisterCustomData("MacroOptions.bLatencyCompensation")
RegisterCustomData("MacroOptions.bChannelingLatencyCompensation")
RegisterCustomData("MacroOptions.autoStopAction")

RegisterCustomData("MacroOptions.autoUseWeapon")
RegisterCustomData("MacroOptions.autoUseAmulet")
RegisterCustomData("MacroOptions.autoUsePendant")

RegisterCustomData("MacroOptions.autoSwapWeapon1")
RegisterCustomData("MacroOptions.autoSwapWeapon2")
RegisterCustomData("MacroOptions.szMainWeaponName1")
RegisterCustomData("MacroOptions.szMainWeaponName2")
RegisterCustomData("MacroOptions.szAuxWeaponName1")
RegisterCustomData("MacroOptions.szAuxWeaponName2")
RegisterCustomData("MacroOptions.szThirdWeaponName1")
RegisterCustomData("MacroOptions.szThirdWeaponName2")
RegisterCustomData("MacroOptions.weaponBuffID1")
RegisterCustomData("MacroOptions.weaponBuffID2")
RegisterCustomData("MacroOptions.weaponBuffLevel1")
RegisterCustomData("MacroOptions.weaponBuffLevel2")
RegisterCustomData("MacroOptions.weaponBuffStack1")
RegisterCustomData("MacroOptions.weaponBuffStack2")
RegisterCustomData("MacroOptions.minWeaponBuffTime1")
RegisterCustomData("MacroOptions.minWeaponBuffTime2")
RegisterCustomData("MacroOptions.weaponType1")
RegisterCustomData("MacroOptions.weaponType2")
RegisterCustomData("MacroOptions.secondWeaponBuffID1")
RegisterCustomData("MacroOptions.secondWeaponBuffID2")
RegisterCustomData("MacroOptions.secondWeaponBuffLevel1")
RegisterCustomData("MacroOptions.secondWeaponBuffLevel2")
RegisterCustomData("MacroOptions.secondWeaponBuffStack1")
RegisterCustomData("MacroOptions.secondWeaponBuffStack2")
RegisterCustomData("MacroOptions.secondMinWeaponBuffTime1")
RegisterCustomData("MacroOptions.secondMinWeaponBuffTime2")
RegisterCustomData("MacroOptions.secondWeaponType1")
RegisterCustomData("MacroOptions.secondWeaponType2")

RegisterCustomData("MacroOptions.autoSelfQC")
RegisterCustomData("MacroOptions.autoToaVongVoNgaTHC")
RegisterCustomData("MacroOptions.autoToaVongVoNgaTHKY")
RegisterCustomData("MacroOptions.autoThaoQuangDuongHoiTHC")
RegisterCustomData("MacroOptions.autoThaoQuangDuongHoiTHKY")
RegisterCustomData("MacroOptions.autoTuKhiDongLaiTHC")
RegisterCustomData("MacroOptions.autoTuKhiDongLaiTHKY")
RegisterCustomData("MacroOptions.autoCuuChuyenQuyNhat")
RegisterCustomData("MacroOptions.autoHoaTamThanhTHC")
RegisterCustomData("MacroOptions.autoHoaTamThanhTHKY")
RegisterCustomData("MacroOptions.autoPhaThuongKhung")
RegisterCustomData("MacroOptions.autoXungAmDuong")
RegisterCustomData("MacroOptions.autoSinhThaiCucTHC")
RegisterCustomData("MacroOptions.autoSinhThaiCucTHKY")
RegisterCustomData("MacroOptions.autoBaoNguyenThuKhuyetTHC")
RegisterCustomData("MacroOptions.autoBaoNguyenThuKhuyetTHKY")
RegisterCustomData("MacroOptions.MPLimitTHC")
RegisterCustomData("MacroOptions.MPLimitTHKY")
RegisterCustomData("MacroOptions.autoBangHuNguPhongTHC")
RegisterCustomData("MacroOptions.autoBangHuNguPhongTHKY")
RegisterCustomData("MacroOptions.autoTranSonHa")
RegisterCustomData("MacroOptions.autoThonNhatNguyet")
RegisterCustomData("MacroOptions.autoToaiTinhThan")
RegisterCustomData("MacroOptions.autoLangThaiHu")
RegisterCustomData("MacroOptions.autoChuyenCanKhon")
RegisterCustomData("MacroOptions.autoThienDiaVoCuc")
RegisterCustomData("MacroOptions.autoNguPhuongHanhTan")
RegisterCustomData("MacroOptions.autoStopTTLH")
RegisterCustomData("MacroOptions.autoVTBKMode")

RegisterCustomData("MacroOptions.autoPhuQuangLuocAnhKVQ")
RegisterCustomData("MacroOptions.autoKinhHongDuLongKVQ")
RegisterCustomData("MacroOptions.autoTapTrungKVQ")
RegisterCustomData("MacroOptions.autoNguNguyenTien")
RegisterCustomData("MacroOptions.autoPhuQuangLuocAnhTLND")
RegisterCustomData("MacroOptions.autoKinhHongDuLongTLND")
RegisterCustomData("MacroOptions.autoTapTrungTLND")
RegisterCustomData("MacroOptions.autoTapTrungQPTC")
RegisterCustomData("MacroOptions.stackNumPheTam")
RegisterCustomData("MacroOptions.autoQuiPhuThanCong")
RegisterCustomData("MacroOptions.autoDoCungChuyKien")
RegisterCustomData("MacroOptions.autoTCB")
RegisterCustomData("MacroOptions.autoTCBAttack")
RegisterCustomData("MacroOptions.toggleAttackMode")
RegisterCustomData("MacroOptions.toggleATSCMode")

RegisterCustomData("MacroOptions.autoTatNHCY")
RegisterCustomData("MacroOptions.autoDotNHCY")
RegisterCustomData("MacroOptions.autoTuNhuLamNHCY")
RegisterCustomData("MacroOptions.autoHamNhuLoiNHCY")
RegisterCustomData("MacroOptions.autoTatNhuPhongNHCY")
RegisterCustomData("MacroOptions.autoGamNhuHoNHCY")
RegisterCustomData("MacroOptions.autoThuNhuSonNHCY")
RegisterCustomData("MacroOptions.autoNghenhPhongHoiLangNHCY")
RegisterCustomData("MacroOptions.autoTatTLL")
RegisterCustomData("MacroOptions.autoDotTLL")
RegisterCustomData("MacroOptions.autoTuNhuLamTLL")
RegisterCustomData("MacroOptions.autoHamNhuLoiTLL")
RegisterCustomData("MacroOptions.autoTatNhuPhongTLL")
RegisterCustomData("MacroOptions.autoGamNhuHoTLL")
RegisterCustomData("MacroOptions.autoNguTLL")
RegisterCustomData("MacroOptions.autoThuNhuSonTLL")
RegisterCustomData("MacroOptions.autoNgangNhuNgac")
RegisterCustomData("MacroOptions.autoDinhQuan")
RegisterCustomData("MacroOptions.autoLuocNhuHoa")

RegisterCustomData("MacroOptions.sunModePATQ")
RegisterCustomData("MacroOptions.moonModePATQ")
RegisterCustomData("MacroOptions.autoLuuQuangTuAnh")
RegisterCustomData("MacroOptions.autoAoQuangBoPATQ")
RegisterCustomData("MacroOptions.autoAoQuangBoMTLLT")
RegisterCustomData("MacroOptions.autoAmTranDiTan")
RegisterCustomData("MacroOptions.autoCucLacDanPATQ")
RegisterCustomData("MacroOptions.autoThamMaThePATQ")
RegisterCustomData("MacroOptions.autoQuangMinhTuongPATQ")
RegisterCustomData("MacroOptions.autoSinhDietDuDoat")
RegisterCustomData("MacroOptions.autoNNLN")
RegisterCustomData("MacroOptions.sunModeMTLLT")
RegisterCustomData("MacroOptions.moonModeMTLLT")
RegisterCustomData("MacroOptions.autoCucLacDanMTLLT")
RegisterCustomData("MacroOptions.autoThanhMinhHuuMTLLT")
RegisterCustomData("MacroOptions.autoThamMaTheMTLLT")
RegisterCustomData("MacroOptions.autoQuangMinhTuongMTLLT")
RegisterCustomData("MacroOptions.autoTinhMenhHai")
RegisterCustomData("MacroOptions.autoTuBiNguyen")
RegisterCustomData("MacroOptions.alwaysTuBiNguyen")
RegisterCustomData("MacroOptions.autoNhatNguyetTinhThe")

RegisterCustomData("MacroOptions.autoTuyenNgungNguyet")
RegisterCustomData("MacroOptions.autoThamMai")
RegisterCustomData("MacroOptions.OMLTDK")
RegisterCustomData("MacroOptions.autoOanhMinhLieu")
RegisterCustomData("MacroOptions.autoTuyetDoanKieu")
RegisterCustomData("MacroOptions.autoBinhHoHoangLong")
RegisterCustomData("MacroOptions.autoMongTuyenHoBao")
RegisterCustomData("MacroOptions.autoVanTeTung")
RegisterCustomData("MacroOptions.autoPhongLaiNgoSon")

RegisterCustomData("MacroOptions.autoXuanNeHoHoa")
RegisterCustomData("MacroOptions.autoBichThuyThaoThien")
RegisterCustomData("MacroOptions.autoThanhTamTinhKhi")
RegisterCustomData("MacroOptions.autoThuyNguyetVoGian")

RegisterCustomData("MacroOptions.autoThienDiaDeNgang")
RegisterCustomData("MacroOptions.autoBaLaMon")
RegisterCustomData("MacroOptions.autoLongTriNhac")
RegisterCustomData("MacroOptions.autoManDuongThe")
RegisterCustomData("MacroOptions.autoPhonAmCapTiet")
RegisterCustomData("MacroOptions.autoKiemPhaHuKhong")
RegisterCustomData("MacroOptions.autoKiemThanVoNga")

RegisterCustomData("MacroOptions.autoPhuongHoangCo")
RegisterCustomData("MacroOptions.autoHuyenThuyCo")
RegisterCustomData("MacroOptions.autoCoTrungCuongBao")
RegisterCustomData("MacroOptions.saveManaMode")
RegisterCustomData("MacroOptions.autoDoatMenhCo")
RegisterCustomData("MacroOptions.autoKhoTanCo")
RegisterCustomData("MacroOptions.autoMeTamCo")
RegisterCustomData("MacroOptions.autoSelfBuff")
RegisterCustomData("MacroOptions.autoHienTe")
RegisterCustomData("MacroOptions.autoThienTi")
RegisterCustomData("MacroOptions.rebuffXaAnh")

RegisterCustomData("MacroOptions.autoVoTuongQuyetDCK")
RegisterCustomData("MacroOptions.autoDiecKhoDiecVinh")
RegisterCustomData("MacroOptions.autoBatNhaQuyetDCK")
RegisterCustomData("MacroOptions.autoPhatTamQuyetDCK")
RegisterCustomData("MacroOptions.autoPhatTamQuyetTTK")
RegisterCustomData("MacroOptions.autoKimCuongNoMuc")
RegisterCustomData("MacroOptions.autoCamLongQuyetDCK")
RegisterCustomData("MacroOptions.autoVoTuongQuyetTTK")
RegisterCustomData("MacroOptions.autoTuNapCanKhon")
RegisterCustomData("MacroOptions.autoBatNhaQuyetTTK")
RegisterCustomData("MacroOptions.autoCamLongQuyetTTK")
RegisterCustomData("MacroOptions.autoQuyKhuLaiCon")
RegisterCustomData("MacroOptions.autoDaiSuTuHong")

RegisterCustomData("MacroOptions.autoTieuTuyCuong")
RegisterCustomData("MacroOptions.autoTuuTrungTien")
RegisterCustomData("MacroOptions.autoBongDaCauDau1")
RegisterCustomData("MacroOptions.autoBongDaCauDau2")
RegisterCustomData("MacroOptions.autoYenVuHanh")
RegisterCustomData("MacroOptions.autoThiemChuanKich")
RegisterCustomData("MacroOptions.attackMode")

function MacroOptions.CreateMenu()
  p=GetClientPlayer()
  local NoiCong=p.GetKungfuMount().dwSkillID
  local menu = {
    szOption = MacroOptions.szTitle,r=100,g=225,b=255,
    bCheck = false,
    bChecked = false,
  }
  local menuSkillInterrupt = {
    szOption = "Tự ngắt skill BOSS (nhấn vào skill đã có để xóa)",
    bCheck = true,
    bChecked = MacroOptions.autoSkillInterrupt,
    fnAction = function()
      if not MacroOptions.autoSkillInterrupt then
        MacroOptions.autoSkillInterrupt=true
        OutputMessage("MSG_SYS","[Tự ngắt skill BOSS] > ON\n")
        if MacroOptions.autoBongDaCauDau1 then
          MacroOptions.autoBongDaCauDau1=false
          OutputMessage("MSG_SYS","[Sử dụng Bổng Đả Cẩu Đầu để tích nội lực] > OFF\n")
        end
        if MacroOptions.autoBongDaCauDau2 then
          MacroOptions.autoBongDaCauDau2=false
          OutputMessage("MSG_SYS","[Sử dụng Bổng Đả Cẩu Đầu để áp sát] > OFF\n")
        end
      else
        MacroOptions.autoSkillInterrupt=false
        OutputMessage("MSG_SYS","[Tự ngắt skill BOSS] > OFF\n")
      end
    end,
    fnAutoClose = function() return true end
  }
  local menuBossBuffs = {
    szOption = "Tự xóa buff có lợi của BOSS (nhấn vào buff đã có để xóa)",
    bCheck = true,
    bChecked = MacroOptions.autoClearBuff,
    fnAction = function()
      if not MacroOptions.autoClearBuff then
        MacroOptions.autoClearBuff=true
        OutputMessage("MSG_SYS","[Tự xóa buff có lợi của BOSS] > ON\n")
      else
        MacroOptions.autoClearBuff=false
        OutputMessage("MSG_SYS","[Tự xóa buff có lợi của BOSS] > OFF\n")
      end
    end,
    fnAutoClose = function() return true end
  }
  for i = 1, #MacroFunctions.bossSkills do
    table.insert(menuSkillInterrupt,
      {
        szOption = Table_GetSkillName(MacroFunctions.bossSkills[i])..", ID: "..MacroFunctions.bossSkills[i],
        bCheck = false,
        bChecked = false,
        fnAction = function()
          table.remove(MacroFunctions.bossSkills,i)
        end,
        fnAutoClose = function() return true end
      }
    )
  end
  table.insert(menuSkillInterrupt,{bDevide=true})
  table.insert(menuSkillInterrupt,
    {
      szOption="Thêm ID skill mới",
      bCheck = false,
      bChecked = false,
      fnAction=function()
        GetUserInput(
          "Nhập ID skill cần ngắt:",
          function(szText)
            table.insert(MacroFunctions.bossSkills,tonumber(szText))
            OutputMessage("MSG_SYS","Đã thêm skill: \""..Table_GetSkillName(tonumber(szText)).."\", ID: "..tonumber(szText).." vào danh sách tự ngắt\n")
          end,nil,function() end,nil,nil,6
        )
      end
    }
  )
  for i = 1, #MacroFunctions.bossBuffs do
    table.insert(menuBossBuffs,
      {
        szOption = Table_GetBuffName(MacroFunctions.bossBuffs[i])..", ID: "..MacroFunctions.bossBuffs[i],
        bCheck = false,
        bChecked = false,
        fnAction = function()
          table.remove(MacroFunctions.bossBuffs,i)
        end,
        fnAutoClose = function() return true end
      }
    )
  end
  table.insert(menuBossBuffs,{bDevide=true})
  table.insert(menuBossBuffs,
    {
      szOption="Thêm ID buff mới",
      bCheck = false,
      bChecked = false,
      fnAction=function()
        GetUserInput(
          "Nhập ID buff cần tự xóa:",
          function(szText)
            table.insert(MacroFunctions.bossBuffs,tonumber(szText))
            OutputMessage("MSG_SYS","Đã thêm buff: \""..Table_GetBuffName(tonumber(szText)).."\", ID: "..tonumber(szText).." vào danh sách tự xóa\n")
          end,nil,function() end,nil,nil,6
        )
      end
    }
  )
  local menuSwapWeapon1 = {
    szOption = "Tự thay đổi vũ khí opt cam (lấy buff đặc biệt)",
    bCheck = true,
    bChecked = MacroOptions.autoSwapWeapon1,
    fnAction = function()
      if not MacroOptions.autoSwapWeapon1 then
        if (MacroOptions.szMainWeaponName1~="" and MacroOptions.szAuxWeaponName1~="" and MacroOptions.weaponBuffID1~=0 and MacroOptions.weaponBuffLevel1~=0 and MacroOptions.weaponBuffStack1~=0 and MacroOptions.minWeaponBuffTime1~=0 and MacroOptions.weaponType1~=0) or (MacroOptions.szMainWeaponName1~="" and MacroOptions.szThirdWeaponName1~="" and MacroOptions.secondWeaponBuffID1~=0 and MacroOptions.secondWeaponBuffLevel1~=0 and MacroOptions.secondWeaponBuffStack1~=0 and MacroOptions.secondMinWeaponBuffTime1~=0 and MacroOptions.secondWeaponType1~=0) then
          MacroOptions.autoSwapWeapon1=true
          OutputMessage("MSG_SYS","[Tự thay đổi vũ khí opt cam (lấy buff đặc biệt)] > ON\n")
        else
          OutputMessage("MSG_SYS","Nhập các thiết lập cần thiết trước khi kích hoạt\n")
        end
      else
        MacroOptions.autoSwapWeapon1=false
        OutputMessage("MSG_SYS","[Tự thay đổi vũ khí opt cam (lấy buff đặc biệt)] > OFF\n")
      end
    end,
    fnAutoClose = function() return true end
  }
  table.insert(menuSwapWeapon1,
    {
      szOption = "Thiết lập vũ khí đang cầm làm vũ khí chính",
      bCheck = false,
      bChecked = false,
      fnAction = function()
        MacroOptions.szMainWeaponName1=p.GetItem(INVENTORY_INDEX.EQUIP,EQUIPMENT_INVENTORY.MELEE_WEAPON).szName
        OutputMessage("MSG_SYS","Đã thiết lập \""..MacroOptions.szMainWeaponName1.."\" làm vũ khí chính\n")
      end,
      fnAutoClose = function() return true end
    }
  )
  local mainWeaponName1="Chưa có"
  if MacroOptions.szMainWeaponName1~="" then
    mainWeaponName1=MacroOptions.szMainWeaponName1
  end
  table.insert(menuSwapWeapon1,
    {
      szOption = "Vũ khí chính được thiết lập: "..mainWeaponName1,
      bCheck = false,
      bChecked = false,
      fnDisable = function() return true end
    }
  )
  table.insert(menuSwapWeapon1,{bDevide=true})
  table.insert(menuSwapWeapon1,
    {
      szOption = "Thiết lập vũ khí đang cầm làm vũ khí phụ (buff stack tầng)",
      bCheck = false,
      bChecked = false,
      fnAction = function()
        MacroOptions.szAuxWeaponName1=p.GetItem(INVENTORY_INDEX.EQUIP,EQUIPMENT_INVENTORY.MELEE_WEAPON).szName
        for _,buffNameList in pairs(MacroOptions.swapWeaponArray) do
          for _,weaponName in pairs(buffNameList.weaponList) do
            if MacroOptions.szAuxWeaponName1==weaponName then
              MacroOptions.weaponBuffID1=buffNameList.buffInfo.buffID
              MacroOptions.weaponBuffLevel1=buffNameList.buffInfo.buffLevel
              MacroOptions.weaponBuffStack1=buffNameList.buffInfo.buffStack
              MacroOptions.minWeaponBuffTime1=buffNameList.buffInfo.buffMinTime
              MacroOptions.weaponType1=buffNameList.buffInfo.weaponType
            end
          end
        end
        OutputMessage("MSG_SYS","Đã thiết lập \""..MacroOptions.szAuxWeaponName1.."\" làm vũ khí phụ\n")
      end,
      fnAutoClose = function() return true end
    }
  )
  local auxWeaponName1="Chưa có"
  if MacroOptions.szAuxWeaponName1~="" then
    auxWeaponName1=MacroOptions.szAuxWeaponName1
  end
  table.insert(menuSwapWeapon1,
    {
      szOption = "Vũ khí phụ 1 được thiết lập: "..auxWeaponName1,
      bCheck = false,
      bChecked = false,
      fnDisable = function() return true end
    }
  )
  table.insert(menuSwapWeapon1,{bDevide=true})
  local buffName1="Chưa thiết lập"
  if MacroOptions.weaponBuffID1~=0 and MacroOptions.weaponBuffLevel1~=0 then
    buffName1=Table_GetBuffName(MacroOptions.weaponBuffID1,MacroOptions.weaponBuffLevel1)..", ID: "..MacroOptions.weaponBuffID1.." - Level: "..MacroOptions.weaponBuffLevel1
  end
  table.insert(menuSwapWeapon1,
    {
      szOption = "Thiết lập buff của vũ khí: "..buffName1,
      bCheck = false,
      bChecked = false,
      fnAction=function()
        GetUserInput(
          "Nhập ID và level buff của vũ khí: (ví dụ: 4761-3)",
          function(szText)
            local strArray = SplitString(szText,"-")
            MacroOptions.weaponBuffID1=tonumber(strArray[1])
            MacroOptions.weaponBuffLevel1=tonumber(strArray[2])
            OutputMessage("MSG_SYS","Đã thiết lập buff của vũ khí: \""..Table_GetBuffName(tonumber(strArray[1]),tonumber(strArray[2])).."\", ID: "..tonumber(strArray[1]).." - Level: "..tonumber(strArray[2]).."\n")
          end,nil,function() end,nil,nil,6
        )
      end
    }
  )
  table.insert(menuSwapWeapon1,
    {
      szOption="Thiết lập số tầng buff tối đa: "..MacroOptions.weaponBuffStack1.." tầng",
      bCheck = false,
      bChecked = false,
      fnAction=function()
        GetUserInput(
          "Nhập số tầng buff tối đa:",
          function(szText)
            MacroOptions.weaponBuffStack1 = tonumber(szText)
            OutputMessage("MSG_SYS","Đã thiết lập số tầng buff tối đa: "..szText.." tầng\n")
          end,nil,function() end,nil,nil,3
        )
      end
    }
  )
  table.insert(menuSwapWeapon1,
    {
      szOption="Thiết lập thời gian tối thiểu cần duy trì buff: "..MacroOptions.minWeaponBuffTime1.." giây",
      bCheck = false,
      bChecked = false,
      fnAction=function()
        GetUserInput(
          "Nhập thời gian tối thiểu cần duy trì buff (giây):",
          function(szText)
            MacroOptions.minWeaponBuffTime1 = tonumber(szText)
            OutputMessage("MSG_SYS","Đã thiết lập thời gian tối thiểu cần duy trì buff: "..szText.." giây\n")
          end,nil,function() end,nil,nil,3
        )
      end
    }
  )
  table.insert(menuSwapWeapon1,{bDevide=true})
  table.insert(menuSwapWeapon1,
    {
      szOption = "Thiết lập vũ khí đang cầm làm vũ khí phụ (buff có tỉ lệ xuất hiện)",
      bCheck = false,
      bChecked = false,
      fnAction = function()
        MacroOptions.szThirdWeaponName1=p.GetItem(INVENTORY_INDEX.EQUIP,EQUIPMENT_INVENTORY.MELEE_WEAPON).szName
        for _,buffNameList in pairs(MacroOptions.swapWeaponArray) do
          for _,weaponName in pairs(buffNameList.weaponList) do
            if MacroOptions.szThirdWeaponName1==weaponName then
              MacroOptions.secondWeaponBuffID1=buffNameList.buffInfo.buffID
              MacroOptions.secondWeaponBuffLevel1=buffNameList.buffInfo.buffLevel
              MacroOptions.secondWeaponBuffStack1=buffNameList.buffInfo.buffStack
              MacroOptions.secondMinWeaponBuffTime1=buffNameList.buffInfo.buffMinTime
              MacroOptions.secondWeaponType1=buffNameList.buffInfo.weaponType
            end
          end
        end
        OutputMessage("MSG_SYS","Đã thiết lập \""..MacroOptions.szThirdWeaponName1.."\" làm vũ khí phụ\n")
      end,
      fnAutoClose = function() return true end
    }
  )
  local thirdWeaponName1="Chưa có"
  if MacroOptions.szThirdWeaponName1~="" then
    thirdWeaponName1=MacroOptions.szThirdWeaponName1
  end
  table.insert(menuSwapWeapon1,
    {
      szOption = "Vũ khí phụ 2 được thiết lập: "..thirdWeaponName1,
      bCheck = false,
      bChecked = false,
      fnDisable = function() return true end
    }
  )
  table.insert(menuSwapWeapon1,{bDevide=true})
  local secondBuffName1="Chưa thiết lập"
  if MacroOptions.secondWeaponBuffID1~=0 and MacroOptions.secondWeaponBuffLevel1~=0 then
    secondBuffName1=Table_GetBuffName(MacroOptions.secondWeaponBuffID1,MacroOptions.secondWeaponBuffLevel1)..", ID: "..MacroOptions.secondWeaponBuffID1.." - Level: "..MacroOptions.secondWeaponBuffLevel1
  end
  table.insert(menuSwapWeapon1,
    {
      szOption = "Thiết lập buff của vũ khí: "..secondBuffName1,
      bCheck = false,
      bChecked = false,
      fnAction=function()
        GetUserInput(
          "Nhập ID và level buff của vũ khí: (ví dụ: 6394-1)",
          function(szText)
            local strArray = SplitString(szText,"-")
            MacroOptions.secondWeaponBuffID1=tonumber(strArray[1])
            MacroOptions.secondWeaponBuffLevel1=tonumber(strArray[2])
            OutputMessage("MSG_SYS","Đã thiết lập buff của vũ khí: \""..Table_GetBuffName(tonumber(strArray[1]),tonumber(strArray[2])).."\", ID: "..tonumber(strArray[1]).." - Level: "..tonumber(strArray[2]).."\n")
          end,nil,function() end,nil,nil,6
        )
      end
    }
  )
  table.insert(menuSwapWeapon1,
    {
      szOption="Thiết lập số tầng buff tối đa: "..MacroOptions.secondWeaponBuffStack1.." tầng",
      bCheck = false,
      bChecked = false,
      fnAction=function()
        GetUserInput(
          "Nhập số tầng buff tối đa:",
          function(szText)
            MacroOptions.secondWeaponBuffStack1 = tonumber(szText)
            OutputMessage("MSG_SYS","Đã thiết lập số tầng buff tối đa: "..szText.." tầng\n")
          end,nil,function() end,nil,nil,3
        )
      end
    }
  )
  table.insert(menuSwapWeapon1,
    {
      szOption="Thiết lập thời gian tối thiểu cần duy trì buff: "..MacroOptions.secondMinWeaponBuffTime1.." giây",
      bCheck = false,
      bChecked = false,
      fnAction=function()
        GetUserInput(
          "Nhập thời gian tối thiểu cần duy trì buff (giây):",
          function(szText)
            MacroOptions.secondMinWeaponBuffTime1 = tonumber(szText)
            OutputMessage("MSG_SYS","Đã thiết lập thời gian tối thiểu cần duy trì buff: "..szText.." giây\n")
          end,nil,function() end,nil,nil,3
        )
      end
    }
  )
  table.insert(menuSwapWeapon1,{bDevide=true})
  table.insert(menuSwapWeapon1,
    {
      szOption="Xóa tất cả thiết lập 3 vũ khí",
      bCheck = false,
      bChecked = false,
      fnAction=function()
        MacroOptions.szMainWeaponName1=""
        MacroOptions.szAuxWeaponName1=""
        MacroOptions.szThirdWeaponName1=""
        MacroOptions.weaponBuffID1=0
        MacroOptions.weaponBuffLevel1=0
        MacroOptions.weaponBuffStack1=0
        MacroOptions.minWeaponBuffTime1=0
        MacroOptions.weaponType1=0
        MacroOptions.secondWeaponBuffID1=0
        MacroOptions.secondWeaponBuffLevel1=0
        MacroOptions.secondWeaponBuffStack1=0
        MacroOptions.secondMinWeaponBuffTime1=0
        MacroOptions.secondWeaponType1=0
        OutputMessage("MSG_SYS","Đã xóa tất cả thiết lập vũ khí\n")
      end
    }
  )
  local menuSwapWeapon2 = {
    szOption = "Tự thay đổi vũ khí opt cam (lấy buff đặc biệt)",
    bCheck = true,
    bChecked = MacroOptions.autoSwapWeapon2,
    fnAction = function()
      if not MacroOptions.autoSwapWeapon2 then
        if (MacroOptions.szMainWeaponName2~="" and MacroOptions.szAuxWeaponName2~="" and MacroOptions.weaponBuffID2~=0 and MacroOptions.weaponBuffLevel2~=0 and MacroOptions.weaponBuffStack2~=0 and MacroOptions.minWeaponBuffTime2~=0 and MacroOptions.weaponType2~=0) or (MacroOptions.szMainWeaponName2~="" and MacroOptions.szThirdWeaponName2~="" and MacroOptions.secondWeaponBuffID2~=0 and MacroOptions.secondWeaponBuffLevel2~=0 and MacroOptions.secondWeaponBuffStack2~=0 and MacroOptions.secondMinWeaponBuffTime2~=0 and MacroOptions.secondWeaponType2~=0) then
          MacroOptions.autoSwapWeapon2=true
          OutputMessage("MSG_SYS","[Tự thay đổi vũ khí opt cam (lấy buff đặc biệt)] > ON\n")
        else
          OutputMessage("MSG_SYS","Nhập các thiết lập cần thiết trước khi kích hoạt\n")
        end
      else
        MacroOptions.autoSwapWeapon2=false
        OutputMessage("MSG_SYS","[Tự thay đổi vũ khí opt cam (lấy buff đặc biệt)] > OFF\n")
      end
    end,
    fnAutoClose = function() return true end
  }
  table.insert(menuSwapWeapon2,
    {
      szOption = "Thiết lập vũ khí đang cầm làm vũ khí chính",
      bCheck = false,
      bChecked = false,
      fnAction = function()
        MacroOptions.szMainWeaponName2=p.GetItem(INVENTORY_INDEX.EQUIP,EQUIPMENT_INVENTORY.MELEE_WEAPON).szName
        OutputMessage("MSG_SYS","Đã thiết lập \""..MacroOptions.szMainWeaponName2.."\" làm vũ khí chính\n")
      end,
      fnAutoClose = function() return true end
    }
  )
  local mainWeaponName2="Chưa có"
  if MacroOptions.szMainWeaponName2~="" then
    mainWeaponName2=MacroOptions.szMainWeaponName2
  end
  table.insert(menuSwapWeapon2,
    {
      szOption = "Vũ khí chính được thiết lập: "..mainWeaponName2,
      bCheck = false,
      bChecked = false,
      fnDisable = function() return true end
    }
  )
  table.insert(menuSwapWeapon2,{bDevide=true})
  table.insert(menuSwapWeapon2,
    {
      szOption = "Thiết lập vũ khí đang cầm làm vũ khí phụ (buff stack tầng)",
      bCheck = false,
      bChecked = false,
      fnAction = function()
        MacroOptions.szAuxWeaponName2=p.GetItem(INVENTORY_INDEX.EQUIP,EQUIPMENT_INVENTORY.MELEE_WEAPON).szName
        for _,buffNameList in pairs(MacroOptions.swapWeaponArray) do
          for _,weaponName in pairs(buffNameList.weaponList) do
            if MacroOptions.szAuxWeaponName2==weaponName then
              MacroOptions.weaponBuffID2=buffNameList.buffInfo.buffID
              MacroOptions.weaponBuffLevel2=buffNameList.buffInfo.buffLevel
              MacroOptions.weaponBuffStack2=buffNameList.buffInfo.buffStack
              MacroOptions.minWeaponBuffTime2=buffNameList.buffInfo.buffMinTime
              MacroOptions.weaponType2=buffNameList.buffInfo.weaponType
            end
          end
        end
        OutputMessage("MSG_SYS","Đã thiết lập \""..MacroOptions.szAuxWeaponName2.."\" làm vũ khí phụ\n")
      end,
      fnAutoClose = function() return true end
    }
  )
  local auxWeaponName2="Chưa có"
  if MacroOptions.szAuxWeaponName2~="" then
    auxWeaponName2=MacroOptions.szAuxWeaponName2
  end
  table.insert(menuSwapWeapon2,
    {
      szOption = "Vũ khí phụ 1 được thiết lập: "..auxWeaponName2,
      bCheck = false,
      bChecked = false,
      fnDisable = function() return true end
    }
  )
  table.insert(menuSwapWeapon2,{bDevide=true})
  local buffName2="Chưa thiết lập"
  if MacroOptions.weaponBuffID2~=0 and MacroOptions.weaponBuffLevel2~=0 then
    buffName2=Table_GetBuffName(MacroOptions.weaponBuffID2,MacroOptions.weaponBuffLevel2)..", ID: "..MacroOptions.weaponBuffID2.." - Level: "..MacroOptions.weaponBuffLevel2
  end
  table.insert(menuSwapWeapon2,
    {
      szOption = "Thiết lập buff của vũ khí: "..buffName2,
      bCheck = false,
      bChecked = false,
      fnAction=function()
        GetUserInput(
          "Nhập ID và level buff của vũ khí: (ví dụ: 4761-3)",
          function(szText)
            local strArray = SplitString(szText,"-")
            MacroOptions.weaponBuffID2=tonumber(strArray[1])
            MacroOptions.weaponBuffLevel2=tonumber(strArray[2])
            OutputMessage("MSG_SYS","Đã thiết lập buff của vũ khí: \""..Table_GetBuffName(tonumber(strArray[1]),tonumber(strArray[2])).."\", ID: "..tonumber(strArray[1]).." - Level: "..tonumber(strArray[2]).."\n")
          end,nil,function() end,nil,nil,6
        )
      end
    }
  )
  table.insert(menuSwapWeapon2,
    {
      szOption="Thiết lập số tầng buff tối đa: "..MacroOptions.weaponBuffStack2.." tầng",
      bCheck = false,
      bChecked = false,
      fnAction=function()
        GetUserInput(
          "Nhập số tầng buff tối đa:",
          function(szText)
            MacroOptions.weaponBuffStack2 = tonumber(szText)
            OutputMessage("MSG_SYS","Đã thiết lập số tầng buff tối đa: "..szText.." tầng\n")
          end,nil,function() end,nil,nil,3
        )
      end
    }
  )
  table.insert(menuSwapWeapon2,
    {
      szOption="Thiết lập thời gian tối thiểu cần duy trì buff: "..MacroOptions.minWeaponBuffTime2.." giây",
      bCheck = false,
      bChecked = false,
      fnAction=function()
        GetUserInput(
          "Nhập thời gian tối thiểu cần duy trì buff (giây):",
          function(szText)
            MacroOptions.minWeaponBuffTime2 = tonumber(szText)
            OutputMessage("MSG_SYS","Đã thiết lập thời gian tối thiểu cần duy trì buff: "..szText.." giây\n")
          end,nil,function() end,nil,nil,3
        )
      end
    }
  )
  table.insert(menuSwapWeapon2,{bDevide=true})
  table.insert(menuSwapWeapon2,
    {
      szOption = "Thiết lập vũ khí đang cầm làm vũ khí phụ (buff có tỉ lệ xuất hiện)",
      bCheck = false,
      bChecked = false,
      fnAction = function()
        MacroOptions.szThirdWeaponName2=p.GetItem(INVENTORY_INDEX.EQUIP,EQUIPMENT_INVENTORY.MELEE_WEAPON).szName
        for _,buffNameList in pairs(MacroOptions.swapWeaponArray) do
          for _,weaponName in pairs(buffNameList.weaponList) do
            if MacroOptions.szThirdWeaponName2==weaponName then
              MacroOptions.secondWeaponBuffID2=buffNameList.buffInfo.buffID
              MacroOptions.secondWeaponBuffLevel2=buffNameList.buffInfo.buffLevel
              MacroOptions.secondWeaponBuffStack2=buffNameList.buffInfo.buffStack
              MacroOptions.secondMinWeaponBuffTime2=buffNameList.buffInfo.buffMinTime
              MacroOptions.secondWeaponType2=buffNameList.buffInfo.weaponType
            end
          end
        end
        OutputMessage("MSG_SYS","Đã thiết lập \""..MacroOptions.szThirdWeaponName2.."\" làm vũ khí phụ\n")
      end,
      fnAutoClose = function() return true end
    }
  )
  local thirdWeaponName2="Chưa có"
  if MacroOptions.szThirdWeaponName2~="" then
    thirdWeaponName2=MacroOptions.szThirdWeaponName2
  end
  table.insert(menuSwapWeapon2,
    {
      szOption = "Vũ khí phụ 2 được thiết lập: "..thirdWeaponName2,
      bCheck = false,
      bChecked = false,
      fnDisable = function() return true end
    }
  )
  table.insert(menuSwapWeapon2,{bDevide=true})
  local secondBuffName2="Chưa thiết lập"
  if MacroOptions.secondWeaponBuffID2~=0 and MacroOptions.secondWeaponBuffLevel2~=0 then
    secondBuffName2=Table_GetBuffName(MacroOptions.secondWeaponBuffID2,MacroOptions.secondWeaponBuffLevel2)..", ID: "..MacroOptions.secondWeaponBuffID2.." - Level: "..MacroOptions.secondWeaponBuffLevel2
  end
  table.insert(menuSwapWeapon2,
    {
      szOption = "Thiết lập buff của vũ khí: "..secondBuffName2,
      bCheck = false,
      bChecked = false,
      fnAction=function()
        GetUserInput(
          "Nhập ID và level buff của vũ khí: (ví dụ: 6394-1)",
          function(szText)
            local strArray = SplitString(szText,"-")
            MacroOptions.secondWeaponBuffID2=tonumber(strArray[1])
            MacroOptions.secondWeaponBuffLevel2=tonumber(strArray[2])
            OutputMessage("MSG_SYS","Đã thiết lập buff của vũ khí: \""..Table_GetBuffName(tonumber(strArray[1]),tonumber(strArray[2])).."\", ID: "..tonumber(strArray[1]).." - Level: "..tonumber(strArray[2]).."\n")
          end,nil,function() end,nil,nil,6
        )
      end
    }
  )
  table.insert(menuSwapWeapon2,
    {
      szOption="Thiết lập số tầng buff tối đa: "..MacroOptions.secondWeaponBuffStack2.." tầng",
      bCheck = false,
      bChecked = false,
      fnAction=function()
        GetUserInput(
          "Nhập số tầng buff tối đa:",
          function(szText)
            MacroOptions.secondWeaponBuffStack2 = tonumber(szText)
            OutputMessage("MSG_SYS","Đã thiết lập số tầng buff tối đa: "..szText.." tầng\n")
          end,nil,function() end,nil,nil,3
        )
      end
    }
  )
  table.insert(menuSwapWeapon2,
    {
      szOption="Thiết lập thời gian tối thiểu cần duy trì buff: "..MacroOptions.secondMinWeaponBuffTime2.." giây",
      bCheck = false,
      bChecked = false,
      fnAction=function()
        GetUserInput(
          "Nhập thời gian tối thiểu cần duy trì buff (giây):",
          function(szText)
            MacroOptions.secondMinWeaponBuffTime2 = tonumber(szText)
            OutputMessage("MSG_SYS","Đã thiết lập thời gian tối thiểu cần duy trì buff: "..szText.." giây\n")
          end,nil,function() end,nil,nil,3
        )
      end
    }
  )
  table.insert(menuSwapWeapon2,{bDevide=true})
  table.insert(menuSwapWeapon2,
    {
      szOption="Xóa tất cả thiết lập 3 vũ khí",
      bCheck = false,
      bChecked = false,
      fnAction=function()
        MacroOptions.szMainWeaponName2=""
        MacroOptions.szAuxWeaponName2=""
        MacroOptions.szThirdWeaponName2=""
        MacroOptions.weaponBuffID2=0
        MacroOptions.weaponBuffLevel2=0
        MacroOptions.weaponBuffStack2=0
        MacroOptions.minWeaponBuffTime2=0
        MacroOptions.weaponType2=0
        MacroOptions.secondWeaponBuffID2=0
        MacroOptions.secondWeaponBuffLevel2=0
        MacroOptions.secondWeaponBuffStack2=0
        MacroOptions.secondMinWeaponBuffTime2=0
        MacroOptions.secondWeaponType2=0
        OutputMessage("MSG_SYS","Đã xóa tất cả thiết lập vũ khí\n")
      end
    }
  )
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
  if p.szName=="PhongTửĐiệp" then MacroOptions.szPlace="tặng bé Điệp"
  elseif p.szName=="Kỳ_Nhi" or p.szName=="MộDungLiên" or p.szName=="NguyệtHiểu" then MacroOptions.szPlace="to my sweetie, with love!"
  else  MacroOptions.szPlace="Trường An"
  end
  table.insert(menu,
    {
      szOption = MacroOptions.szTitle.." © 2014, ĐườngKiệt - "..MacroOptions.szPlace,
      bCheck = false,
      bChecked = false,
      fnDisable = function() return true end
    }
  )
  table.insert(menu,{bDevide=true})
  table.insert(menu,
    {
      szOption = "Tự chat tên và ID skill khi BOSS đang vận công",
      bCheck = true,
      bChecked = MacroOptions.autoShout,
      fnAction = function()
        if not MacroOptions.autoShout then
          MacroOptions.autoShout=true
          OutputMessage("MSG_SYS","[Tự chat tên và ID skill khi BOSS đang vận công] > ON\n")
        else
          MacroOptions.autoShout=false
          OutputMessage("MSG_SYS","[Tự chat tên và ID skill khi BOSS đang vận công] > OFF\n")
        end
      end,
      fnAutoClose = function() return true end
    }
  )
  table.insert(menu,
    {
      szOption = "Chế độ bù trừ độ trễ của mạng (tăng 5-10% tốc độ đánh)",
      bCheck = true,
      bChecked = MacroOptions.bLatencyCompensation,
      fnAction = function()
        if not MacroOptions.bLatencyCompensation then
          MacroOptions.bLatencyCompensation=true
          MacroOptions.rebuffXaAnh=false
          OutputMessage("MSG_SYS","[Chế độ bù trừ độ trễ của mạng] > ON\n")
        else
          MacroOptions.bLatencyCompensation=false
          OutputMessage("MSG_SYS","[Chế độ bù trừ độ trễ của mạng] > OFF\n")
        end
      end,
      fnAutoClose = function() return true end
    }
  )
  table.insert(menu,
    {
      szOption = "Chế độ bù trừ độ trễ của mạng cho channeling skill",
      bCheck = true,
      bChecked = MacroOptions.bChannelingLatencyCompensation,
      fnAction = function()
        if not MacroOptions.bChannelingLatencyCompensation then
          MacroOptions.bChannelingLatencyCompensation=true
          MacroOptions.rebuffXaAnh=false
          OutputMessage("MSG_SYS","[Chế độ bù trừ độ trễ của mạng cho channeling skill] > ON\n")
        else
          MacroOptions.bChannelingLatencyCompensation=false
          OutputMessage("MSG_SYS","[Chế độ bù trừ độ trễ của mạng cho channeling skill] > OFF\n")
        end
      end,
      fnAutoClose = function() return true end
    }
  )
  table.insert(menu,
    {
      szOption = "Tự dừng đánh/sử dụng một vài skill hỗ trợ đánh BOSS",
      bCheck = true,
      bChecked = MacroOptions.autoStopAction,
      fnAction = function()
        if not MacroOptions.autoStopAction then
          MacroOptions.autoStopAction=true
          OutputMessage("MSG_SYS","[Tự dừng đánh/sử dụng một vài skill hỗ trợ đánh BOSS] > ON\n")
        else
          MacroOptions.autoStopAction=false
          OutputMessage("MSG_SYS","[Tự dừng đánh/sử dụng một vài skill hỗ trợ đánh BOSS] > OFF\n")
        end
      end,
      fnAutoClose = function() return true end
    }
  )
  if NoiCong==10014 or NoiCong==10015 then
    table.insert(menu,
      {
        szOption = "Tự cắm khí trường cho bản thân",
        bCheck = true,
        bChecked = MacroOptions.autoSelfQC,
        fnAction = function()
          if not MacroOptions.autoSelfQC then
            MacroOptions.autoSelfQC=true
            if HM_Locker.bLockFight then HM_Locker.bLockFight=false end
            OutputMessage("MSG_SYS","[Tự cắm khí trường cho bản thân] > ON\n")
          else
            MacroOptions.autoSelfQC=false
            OutputMessage("MSG_SYS","[Tự cắm khí trường cho bản thân] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
  end
  table.insert(menu,
    {
      szOption = "Chế độ combo khi đối đầu Kiếm Thánh (thử nghiệm)",
      bCheck = true,
      bChecked = MacroFunctions.KTCombo.bEnable,
      fnAction = function()
        if not MacroFunctions.KTCombo.bEnable then
          MacroFunctions.KTCombo.bEnable=true
          if HM_Locker.bLockFight then HM_Locker.bLockFight=false end
          OutputMessage("MSG_SYS","[Chế độ combo khi đối đầu Kiếm Thánh (thử nghiệm)] > ON\n")
        else
          MacroFunctions.KTCombo.bEnable=false
          MacroFunctions.KTCombo.DanChieu=false
          MacroFunctions.KTCombo.TiepChieu=false
          MacroFunctions.KTCombo.bDelay=false
          OutputMessage("MSG_SYS","[Chế độ combo khi đối đầu Kiếm Thánh (thử nghiệm)] > OFF\n")
        end
      end,
      fnAutoClose = function() return true end,
      {
        szOption = "Đánh dẫn chiêu (\"\?\" thứ tự lẻ)",
        bMCheck = true,
        bChecked = MacroFunctions.KTCombo.DanChieu==true,
        fnAction = function()
          if not MacroFunctions.KTCombo.DanChieu then
            MacroFunctions.KTCombo.DanChieu=true
            MacroFunctions.KTCombo.TiepChieu=false
            OutputMessage("MSG_SYS","[Đánh dẫn chiêu (\"\?\" thứ tự lẻ)] > ON\n")
          end
        end,
        fnAutoClose = function() return true end
      },
      {
        szOption = "Đánh tiếp chiêu (\"\?\" thứ tự chẵn)",
        bMCheck = true,
        bChecked = MacroFunctions.KTCombo.TiepChieu==true,
        fnAction = function()
          if not MacroFunctions.KTCombo.TiepChieu then
            MacroFunctions.KTCombo.TiepChieu=true
            MacroFunctions.KTCombo.DanChieu=false
            OutputMessage("MSG_SYS","[Đánh tiếp chiêu (\"\?\" thứ tự chẵn)] > ON\n")
          end
        end,
        fnAutoClose = function() return true end
      },
      {
        szOption = "Đánh phá chiêu (Phương Càn chỉ dẫn)",
        bMCheck = true,
        bChecked = MacroFunctions.KTCombo.DanChieu==false and MacroFunctions.KTCombo.TiepChieu==false,
        fnAction = function()
          if MacroFunctions.KTCombo.DanChieu or MacroFunctions.KTCombo.TiepChieu then
            MacroFunctions.KTCombo.DanChieu=false
            MacroFunctions.KTCombo.TiepChieu=false
            OutputMessage("MSG_SYS","[Đánh phá chiêu (Phương Càn chỉ dẫn)] > ON\n")
          end
        end,
        fnAutoClose = function() return true end
      },
      {bDevide=true},
      {
        szOption = "Đánh dẫn chiêu và tiếp chiêu trễ 2 giây (\"\?\" thứ 6 và 7)",
        bCheck = true,
        bChecked = MacroFunctions.KTCombo.bDelay,
        fnAction = function()
          if not MacroFunctions.KTCombo.bDelay then
            MacroFunctions.KTCombo.bDelay=true
            OutputMessage("MSG_SYS","[Đánh dẫn chiêu và tiếp chiêu trễ 2 giây] > ON\n")
          else
            MacroFunctions.KTCombo.bDelay=false
            OutputMessage("MSG_SYS","[Đánh dẫn chiêu và tiếp chiêu trễ 2 giây] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    }
  )
  table.insert(menu,menuSkillInterrupt)
  if NoiCong==10015 or NoiCong==10224 or NoiCong==10242 or NoiCong==10243 or NoiCong==10021 or NoiCong==10081 or NoiCong==10144 or NoiCong==10145 or NoiCong==10268 then
    table.insert(menu,menuBossBuffs)
  end
  table.insert(menu,
    {
      szOption = "Tự sử dụng vật phẩm tăng sức mạnh",
      bCheck = false,
      bChecked = false,
      {
        szOption = "Tự sử dụng skill đặc biệt của vũ khí chính",
        bCheck = true,
        bChecked = MacroOptions.autoUseWeapon,
        fnAction = function()
          if not MacroOptions.autoUseWeapon then
            MacroOptions.autoUseWeapon=true
            OutputMessage("MSG_SYS","[Tự sử dụng skill đặc biệt vũ khí chính] > ON\n")
          else
            MacroOptions.autoUseWeapon=false
            OutputMessage("MSG_SYS","[Tự sử dụng skill đặc biệt vũ khí chính] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      },
      {
        szOption = "Tự sử dụng dây chuyền có dòng đặc biệt (tăng sức tấn công, phòng thủ, trị liệu)",
        bCheck = true,
        bChecked = MacroOptions.autoUseAmulet,
        fnAction = function()
          if not MacroOptions.autoUseAmulet then
            MacroOptions.autoUseAmulet=true
            OutputMessage("MSG_SYS","[Tự sử dụng dây chuyền có dòng đặc biệt] > ON\n")
          else
            MacroOptions.autoUseAmulet=false
            OutputMessage("MSG_SYS","[Tự sử dụng dây chuyền có dòng đặc biệt] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      },
      {
        szOption = "Tự sử dụng yêu trụy có dòng đặc biệt (tăng sức tấn công, phòng thủ, trị liệu)",
        bCheck = true,
        bChecked = MacroOptions.autoUsePendant,
        fnAction = function()
          if not MacroOptions.autoUsePendant then
            MacroOptions.autoUsePendant=true
            OutputMessage("MSG_SYS","[Tự sử dụng yêu trụy có dòng đặc biệt] > ON\n")
          else
            MacroOptions.autoUsePendant=false
            OutputMessage("MSG_SYS","[Tự sử dụng yêu trụy có dòng đặc biệt] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    }
  )
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
  if NoiCong==10014 or NoiCong==10015 then
    MacroOptions.totalGasFieldTHC=0
    MacroOptions.totalGasFieldTHKY=0
    if MacroOptions.autoXungAmDuong==true then
      MacroOptions.totalGasFieldTHC=MacroOptions.totalGasFieldTHC+1
    end
    if MacroOptions.autoPhaThuongKhung==true then
      MacroOptions.totalGasFieldTHC=MacroOptions.totalGasFieldTHC+1
    end
    if MacroOptions.autoHoaTamThanhTHC==true then
      MacroOptions.totalGasFieldTHC=MacroOptions.totalGasFieldTHC+1
    end
    if MacroOptions.autoHoaTamThanhTHKY==true then
      MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY+1
    end
    if MacroOptions.autoSinhThaiCucTHC==true then
      MacroOptions.totalGasFieldTHC=MacroOptions.totalGasFieldTHC+1
    end
    if MacroOptions.autoSinhThaiCucTHKY==true then
      MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY+1
    end
    if MacroOptions.autoThonNhatNguyet==true then
      MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY+1
    end
    if MacroOptions.autoToaiTinhThan==true then
      MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY+1
    end
    if MacroOptions.autoLangThaiHu==true then
      MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY+1
    end
    local menuThuanDuongTHC = {
      szOption = "Thuần Dương - Tử Hà Công",
      bCheck = false,
      bChecked = false
    }
    table.insert(menuThuanDuongTHC,menuSwapWeapon1)
    table.insert(menuThuanDuongTHC,{bDevide=true})
    table.insert(menuThuanDuongTHC,
      {
        szOption = "Tự cắm Trấn Sơn Hà khi HP<30%",
        bCheck = true,
        bChecked = MacroOptions.autoTranSonHa,
        fnAction = function()
          if not MacroOptions.autoTranSonHa then
            MacroOptions.autoTranSonHa=true
            if HM_Locker.bLockFight then HM_Locker.bLockFight=false end
            OutputMessage("MSG_SYS","[Tự cắm Trấn Sơn Hà khi HP<30%] > ON\n")
          else
            MacroOptions.autoTranSonHa=false
            OutputMessage("MSG_SYS","[Tự cắm Trấn Sơn Hà khi HP<30%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThuanDuongTHC,
      {
        szOption = "Tự dùng Bão Nguyên Thủ Khuyết khi MP thấp hơn mức thiết lập",
        bCheck = true,
        bChecked = MacroOptions.autoBaoNguyenThuKhuyetTHC,
        fnAction = function()
          if not MacroOptions.autoBaoNguyenThuKhuyetTHC then
            MacroOptions.autoBaoNguyenThuKhuyetTHC=true
            OutputMessage("MSG_SYS","[Tự dùng Bão Nguyên Thủ Khuyết khi MP thấp hơn mức thiết lập] > ON\n")
          else
            MacroOptions.autoBaoNguyenThuKhuyetTHC=false
            OutputMessage("MSG_SYS","[Tự dùng Bão Nguyên Thủ Khuyết khi MP thấp hơn mức thiết lập] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThuanDuongTHC,
      {
        szOption="Thiết lập mức nội lực tự dùng Bão Nguyên Thủ Khuyết: "..MacroOptions.MPLimitTHC.."%",
        bCheck = false,
        bChecked = false,
        fnAction=function()
          GetUserInput(
            "Nhập mức phần trăm nội lực: (10-100)",
            function(szText)
              MacroOptions.MPLimitTHC = tonumber(szText)
              OutputMessage("MSG_SYS","Đã thiết lập mức nội lực: Khi thấp hơn "..szText.."% sẽ tự dùng Bão Nguyên Thủ Khuyết\n")
            end,nil,function() end,nil,nil,3
          )
        end
      }
    )
    table.insert(menuThuanDuongTHC,{bDevide=true})
    table.insert(menuThuanDuongTHC,
      {
        szOption = "Tự bật Tọa Vọng Vô Ngã",
        bCheck = true,
        bChecked = MacroOptions.autoToaVongVoNgaTHC,
        fnAction = function()
          if not MacroOptions.autoToaVongVoNgaTHC then
            MacroOptions.autoToaVongVoNgaTHC=true
            OutputMessage("MSG_SYS","[Tự bật Tọa Vọng Vô Ngã] > ON\n")
          else
            MacroOptions.autoToaVongVoNgaTHC=false
            OutputMessage("MSG_SYS","[Tự bật Tọa Vọng Vô Ngã] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThuanDuongTHC,
      {
        szOption = "Tự bật Bằng Hư Ngự Phong giảm uy hiếp",
        bCheck = true,
        bChecked = MacroOptions.autoBangHuNguPhongTHC,
        fnAction = function()
          if not MacroOptions.autoBangHuNguPhongTHC then
            MacroOptions.autoBangHuNguPhongTHC=true
            OutputMessage("MSG_SYS","[Tự bật Bằng Hư Ngự Phong giảm uy hiếp] > ON\n")
          else
            MacroOptions.autoBangHuNguPhongTHC=false
            OutputMessage("MSG_SYS","[Tự bật Bằng Hư Ngự Phong giảm uy hiếp] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThuanDuongTHC,
      {
        szOption = "Tự cắm Hóa Tam Thanh",
        bCheck = true,
        bChecked = MacroOptions.autoHoaTamThanhTHC,
        fnAction = function()
          if not MacroOptions.autoHoaTamThanhTHC and MacroOptions.totalGasFieldTHC<3 then
            MacroOptions.autoHoaTamThanhTHC=true
            MacroOptions.totalGasFieldTHC=MacroOptions.totalGasFieldTHC+1
            OutputMessage("MSG_SYS","[Tự cắm Hóa Tam Thanh] > ON\n")
          else
            MacroOptions.autoHoaTamThanhTHC=false
            MacroOptions.totalGasFieldTHC=MacroOptions.totalGasFieldTHC-1
            OutputMessage("MSG_SYS","[Tự cắm Hóa Tam Thanh] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end,
        fnDisable = function() if MacroOptions.totalGasFieldTHC<3 or MacroOptions.autoHoaTamThanhTHC then return false else return true end end
      }
    )
    table.insert(menuThuanDuongTHC,
      {
        szOption = "Tự cắm Sinh Thái Cực",
        bCheck = true,
        bChecked = MacroOptions.autoSinhThaiCucTHC,
        fnAction = function()
          if not MacroOptions.autoSinhThaiCucTHC and MacroOptions.totalGasFieldTHC<3 then
            MacroOptions.autoSinhThaiCucTHC=true
            MacroOptions.totalGasFieldTHC=MacroOptions.totalGasFieldTHC+1
            OutputMessage("MSG_SYS","[Tự cắm Sinh Thái Cực] > ON\n")
          else
            MacroOptions.autoSinhThaiCucTHC=false
            MacroOptions.totalGasFieldTHC=MacroOptions.totalGasFieldTHC-1
            OutputMessage("MSG_SYS","[Tự cắm Sinh Thái Cực] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end,
        fnDisable = function() if MacroOptions.totalGasFieldTHC<3 or MacroOptions.autoSinhThaiCucTHC then return false else return true end end
      }
    )
    table.insert(menuThuanDuongTHC,
      {
        szOption = "Tự cắm Phá Thương Khung",
        bCheck = true,
        bChecked = MacroOptions.autoPhaThuongKhung,
        fnAction = function()
          if not MacroOptions.autoPhaThuongKhung and MacroOptions.totalGasFieldTHC<3 then
            MacroOptions.autoPhaThuongKhung=true
            MacroOptions.totalGasFieldTHC=MacroOptions.totalGasFieldTHC+1
            OutputMessage("MSG_SYS","[Tự cắm Phá Thương Khung] > ON\n")
          else
            MacroOptions.autoPhaThuongKhung=false
            MacroOptions.totalGasFieldTHC=MacroOptions.totalGasFieldTHC-1
            OutputMessage("MSG_SYS","[Tự cắm Phá Thương Khung] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end,
        fnDisable = function() if MacroOptions.totalGasFieldTHC<3 or MacroOptions.autoPhaThuongKhung then return false else return true end end
      }
    )
    table.insert(menuThuanDuongTHC,
      {
        szOption = "Tự cắm Xung Âm Dương",
        bCheck = true,
        bChecked = MacroOptions.autoXungAmDuong,
        fnAction = function()
          if not MacroOptions.autoXungAmDuong and MacroOptions.totalGasFieldTHC<3 then
            MacroOptions.autoXungAmDuong=true
            MacroOptions.totalGasFieldTHC=MacroOptions.totalGasFieldTHC+1
            OutputMessage("MSG_SYS","[Tự cắm Xung Âm Dương] > ON\n")
          else
            MacroOptions.autoXungAmDuong=false
            MacroOptions.totalGasFieldTHC=MacroOptions.totalGasFieldTHC-1
            OutputMessage("MSG_SYS","[Tự cắm Xung Âm Dương] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end,
        fnDisable = function() if MacroOptions.totalGasFieldTHC<3 or MacroOptions.autoXungAmDuong then return false else return true end end
      }
    )
    table.insert(menuThuanDuongTHC,{bDevide=true})
    table.insert(menuThuanDuongTHC,
      {
        szOption = "Đánh Cửu Chuyển Quy Nhất, Tam Tài Hóa Sinh khi cách mục tiêu < 8m",
        bCheck = true,
        bChecked = MacroOptions.autoCuuChuyenQuyNhat,
        fnAction = function()
          if not MacroOptions.autoCuuChuyenQuyNhat then
            MacroOptions.autoCuuChuyenQuyNhat=true
            OutputMessage("MSG_SYS","[Đánh Cửu Chuyển Quy Nhất, Tam Tài Hóa Sinh khi cách mục tiêu < 8m] > ON\n")
          else
            MacroOptions.autoCuuChuyenQuyNhat=false
            OutputMessage("MSG_SYS","[Đánh Cửu Chuyển Quy Nhất, Tam Tài Hóa Sinh khi cách mục tiêu < 8m] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThuanDuongTHC,
      {
        szOption = "Tự dùng Ngũ Phương Hành Tận 5 ô khí (20% hiệu quả bạo kích)",
        bCheck = true,
        bChecked = MacroOptions.autoNguPhuongHanhTan,
        fnAction = function()
          if not MacroOptions.autoNguPhuongHanhTan then
            MacroOptions.autoNguPhuongHanhTan=true
            OutputMessage("MSG_SYS","[Tự dùng Ngũ Phương Hành Tận 5 ô khí] > ON\n")
          else
            MacroOptions.autoNguPhuongHanhTan=false
            OutputMessage("MSG_SYS","[Tự dùng Ngũ Phương Hành Tận 5 ô khí] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThuanDuongTHC,
      {
        szOption = "Tự bật Từ Khí Đông Lai",
        bCheck = true,
        bChecked = MacroOptions.autoTuKhiDongLaiTHC,
        fnAction = function()
          if not MacroOptions.autoTuKhiDongLaiTHC then
            MacroOptions.autoTuKhiDongLaiTHC=true
            OutputMessage("MSG_SYS","[Tự bật Từ Khí Đông Lai] > ON\n")
          else
            MacroOptions.autoTuKhiDongLaiTHC=false
            OutputMessage("MSG_SYS","[Tự bật Từ Khí Đông Lai] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThuanDuongTHC,
      {
        szOption = "Tự bật Thao Quang Dưỡng Hối",
        bCheck = true,
        bChecked = MacroOptions.autoThaoQuangDuongHoiTHC,
        fnAction = function()
          if not MacroOptions.autoThaoQuangDuongHoiTHC then
            MacroOptions.autoThaoQuangDuongHoiTHC=true
            OutputMessage("MSG_SYS","[Tự bật Thao Quang Dưỡng Hối] > ON\n")
          else
            MacroOptions.autoThaoQuangDuongHoiTHC=false
            OutputMessage("MSG_SYS","[Tự bật Thao Quang Dưỡng Hối] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThuanDuongTHC,
      {
        szOption = "Tự dừng vận công Tứ Tượng Luân Hồi khi đủ 5 ô khí",
        bCheck = true,
        bChecked = MacroOptions.autoStopTTLH,
        fnAction = function()
          if not MacroOptions.autoStopTTLH then
            MacroOptions.autoStopTTLH=true
            OutputMessage("MSG_SYS","[Tự dừng vận công Tứ Tượng Luân Hồi khi đủ 5 ô khí] > ON\n")
          else
            MacroOptions.autoStopTTLH=false
            OutputMessage("MSG_SYS","[Tự dừng vận công Tứ Tượng Luân Hồi khi đủ 5 ô khí] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThuanDuongTHC,{bDevide=true})
    table.insert(menuThuanDuongTHC,
      {
        szOption = "Không đánh Vạn Thế Bất Kiệt",
        bMCheck = true,
        bChecked = MacroOptions.autoVTBKMode==0,
        fnAction = function()
          if MacroOptions.autoVTBKMode~=0 then
            MacroOptions.autoVTBKMode=0
            OutputMessage("MSG_SYS","[Không đánh Vạn Thế Bất Kiệt] > ON\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThuanDuongTHC,
      {
        szOption = "Chỉ đánh Vạn Thế Bất Kiệt khi hết Khí Kiệt",
        bMCheck = true,
        bChecked = MacroOptions.autoVTBKMode==1,
        fnAction = function()
          if MacroOptions.autoVTBKMode~=1 then
            MacroOptions.autoVTBKMode=1
            OutputMessage("MSG_SYS","[Chỉ đánh Vạn Thế Bất Kiệt khi hết Khí Kiệt] > ON\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThuanDuongTHC,
      {
        szOption = "Luôn đánh Vạn Thế Bất Kiệt",
        bMCheck = true,
        bChecked = MacroOptions.autoVTBKMode==2,
        fnAction = function()
          if MacroOptions.autoVTBKMode~=2 then
            MacroOptions.autoVTBKMode=2
            OutputMessage("MSG_SYS","[Luôn đánh Vạn Thế Bất Kiệt] > ON\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    local menuThuanDuongTHKY = {
      szOption = "Thuần Dương - Thái Hư Kiếm Ý",
      bCheck = false,
      bChecked = false
    }
    table.insert(menuThuanDuongTHKY,menuSwapWeapon2)
    table.insert(menuThuanDuongTHKY,{bDevide=true})
    table.insert(menuThuanDuongTHKY,
      {
        szOption = "Tự bật Chuyển Càn Khôn khi HP<30%",
        bCheck = true,
        bChecked = MacroOptions.autoChuyenCanKhon,
        fnAction = function()
          if not MacroOptions.autoChuyenCanKhon then
            MacroOptions.autoChuyenCanKhon=true
            OutputMessage("MSG_SYS","[Tự bật Chuyển Càn Khôn khi HP<30%] > ON\n")
          else
            MacroOptions.autoChuyenCanKhon=false
            OutputMessage("MSG_SYS","[Tự bật Chuyển Càn Khôn khi HP<30%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThuanDuongTHKY,
      {
        szOption = "Tự dùng Bão Nguyên Thủ Khuyết khi MP thấp hơn mức thiết lập",
        bCheck = true,
        bChecked = MacroOptions.autoBaoNguyenThuKhuyetTHKY,
        fnAction = function()
          if not MacroOptions.autoBaoNguyenThuKhuyetTHKY then
            MacroOptions.autoBaoNguyenThuKhuyetTHKY=true
            OutputMessage("MSG_SYS","[Tự dùng Bão Nguyên Thủ Khuyết khi MP thấp hơn mức thiết lập] > ON\n")
          else
            MacroOptions.autoBaoNguyenThuKhuyetTHKY=false
            OutputMessage("MSG_SYS","[Tự dùng Bão Nguyên Thủ Khuyết khi MP thấp hơn mức thiết lập] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThuanDuongTHKY,
      {
        szOption="Thiết lập mức nội lực tự dùng Bão Nguyên Thủ Khuyết: "..MacroOptions.MPLimitTHKY.."%",
        bCheck = false,
        bChecked = false,
        fnAction=function()
          GetUserInput(
            "Nhập mức phần trăm nội lực: (10-100)",
            function(szText)
              MacroOptions.MPLimitTHKY = tonumber(szText)
              OutputMessage("MSG_SYS","Đã thiết lập mức nội lực: Khi thấp hơn "..szText.."% sẽ tự dùng Bão Nguyên Thủ Khuyết\n")
            end,nil,function() end,nil,nil,3
          )
        end
      }
    )
    table.insert(menuThuanDuongTHKY,{bDevide=true})
    table.insert(menuThuanDuongTHKY,
      {
        szOption = "Tự bật Tọa Vọng Vô Ngã",
        bCheck = true,
        bChecked = MacroOptions.autoToaVongVoNgaTHKY,
        fnAction = function()
          if not MacroOptions.autoToaVongVoNgaTHKY then
            MacroOptions.autoToaVongVoNgaTHKY=true
            OutputMessage("MSG_SYS","[Tự bật Tọa Vọng Vô Ngã] > ON\n")
          else
            MacroOptions.autoToaVongVoNgaTHKY=false
            OutputMessage("MSG_SYS","[Tự bật Tọa Vọng Vô Ngã] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThuanDuongTHKY,
      {
        szOption = "Tự bật Bằng Hư Ngự Phong giảm uy hiếp",
        bCheck = true,
        bChecked = MacroOptions.autoBangHuNguPhongTHKY,
        fnAction = function()
          if not MacroOptions.autoBangHuNguPhongTHKY then
            MacroOptions.autoBangHuNguPhongTHKY=true
            OutputMessage("MSG_SYS","[Tự bật Bằng Hư Ngự Phong giảm uy hiếp] > ON\n")
          else
            MacroOptions.autoBangHuNguPhongTHKY=false
            OutputMessage("MSG_SYS","[Tự bật Bằng Hư Ngự Phong giảm uy hiếp] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThuanDuongTHKY,
      {
        szOption = "Tự cắm Hóa Tam Thanh",
        bCheck = true,
        bChecked = MacroOptions.autoHoaTamThanhTHKY,
        fnAction = function()
          if not MacroOptions.autoHoaTamThanhTHKY and MacroOptions.totalGasFieldTHKY<3 then
            MacroOptions.autoHoaTamThanhTHKY=true
            MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY+1
            OutputMessage("MSG_SYS","[Tự cắm Hóa Tam Thanh] > ON\n")
          else
            MacroOptions.autoHoaTamThanhTHKY=false
            MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY-1
            OutputMessage("MSG_SYS","[Tự cắm Hóa Tam Thanh] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end,
        fnDisable = function() if MacroOptions.totalGasFieldTHKY<3 or MacroOptions.autoHoaTamThanhTHKY then return false else return true end end
      }
    )
    table.insert(menuThuanDuongTHKY,
      {
        szOption = "Tự cắm Sinh Thái Cực",
        bCheck = true,
        bChecked = MacroOptions.autoSinhThaiCucTHKY,
        fnAction = function()
          if not MacroOptions.autoSinhThaiCucTHKY and MacroOptions.totalGasFieldTHKY<3 then
            MacroOptions.autoSinhThaiCucTHKY=true
            MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY+1
            OutputMessage("MSG_SYS","[Tự cắm Sinh Thái Cực] > ON\n")
          else
            MacroOptions.autoSinhThaiCucTHKY=false
            MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY-1
            OutputMessage("MSG_SYS","[Tự cắm Sinh Thái Cực] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end,
        fnDisable = function() if MacroOptions.totalGasFieldTHKY<3 or MacroOptions.autoSinhThaiCucTHKY then return false else return true end end
      }
    )
    table.insert(menuThuanDuongTHKY,
      {
        szOption = "Tự cắm Toái Tinh Thần",
        bCheck = true,
        bChecked = MacroOptions.autoToaiTinhThan,
        fnAction = function()
          if not MacroOptions.autoToaiTinhThan and MacroOptions.totalGasFieldTHKY<3 then
            MacroOptions.autoToaiTinhThan=true
            MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY+1
            OutputMessage("MSG_SYS","[Tự cắm Toái Tinh Thần] > ON\n")
          else
            MacroOptions.autoToaiTinhThan=false
            MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY-1
            OutputMessage("MSG_SYS","[Tự cắm Toái Tinh Thần] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end,
        fnDisable = function() if MacroOptions.totalGasFieldTHKY<3 or MacroOptions.autoToaiTinhThan then return false else return true end end
      }
    )
    table.insert(menuThuanDuongTHKY,
      {
        szOption = "Tự cắm Thôn Nhật Nguyệt (ngay khi cooldown)",
        bCheck = true,
        bChecked = MacroOptions.autoThonNhatNguyet,
        fnAction = function()
          if not MacroOptions.autoThonNhatNguyet and MacroOptions.totalGasFieldTHKY<3 then
            MacroOptions.autoThonNhatNguyet=true
            MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY+1
            OutputMessage("MSG_SYS","[Tự cắm Thôn Nhật Nguyệt] > ON\n")
          else
            MacroOptions.autoThonNhatNguyet=false
            MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY-1
            OutputMessage("MSG_SYS","[Tự cắm Thôn Nhật Nguyệt] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end,
        fnDisable = function() if MacroOptions.totalGasFieldTHKY<3 or MacroOptions.autoThonNhatNguyet then return false else return true end end
      }
    )
    table.insert(menuThuanDuongTHKY,
      {
        szOption = "Tự cắm Lăng Thái Hư",
        bCheck = true,
        bChecked = MacroOptions.autoLangThaiHu,
        fnAction = function()
          if not MacroOptions.autoLangThaiHu and MacroOptions.totalGasFieldTHKY<3 then
            MacroOptions.autoLangThaiHu=true
            MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY+1
            OutputMessage("MSG_SYS","[Tự cắm Lăng Thái Hư] > ON\n")
          else
            MacroOptions.autoLangThaiHu=false
            MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY-1
            OutputMessage("MSG_SYS","[Tự cắm Lăng Thái Hư] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end,
        fnDisable = function() if MacroOptions.totalGasFieldTHKY<3 or MacroOptions.autoLangThaiHu then return false else return true end end
      }
    )
    table.insert(menuThuanDuongTHKY,{bDevide=true})
    table.insert(menuThuanDuongTHKY,
      {
        szOption = "Tự bật Từ Khí Đông Lai",
        bCheck = true,
        bChecked = MacroOptions.autoTuKhiDongLaiTHKY,
        fnAction = function()
          if not MacroOptions.autoTuKhiDongLaiTHKY then
            MacroOptions.autoTuKhiDongLaiTHKY=true
            OutputMessage("MSG_SYS","[Tự bật Từ Khí Đông Lai] > ON\n")
          else
            MacroOptions.autoTuKhiDongLaiTHKY=false
            OutputMessage("MSG_SYS","[Tự bật Từ Khí Đông Lai] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThuanDuongTHKY,
      {
        szOption = "Tự bật Thao Quang Dưỡng Hối",
        bCheck = true,
        bChecked = MacroOptions.autoThaoQuangDuongHoiTHKY,
        fnAction = function()
          if not MacroOptions.autoThaoQuangDuongHoiTHKY then
            MacroOptions.autoThaoQuangDuongHoiTHKY=true
            OutputMessage("MSG_SYS","[Tự bật Thao Quang Dưỡng Hối] > ON\n")
          else
            MacroOptions.autoThaoQuangDuongHoiTHKY=false
            OutputMessage("MSG_SYS","[Tự bật Thao Quang Dưỡng Hối] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThuanDuongTHKY,
      {
        szOption = "Đánh Thiên Địa Vô Cực trong combo",
        bCheck = true,
        bChecked = MacroOptions.autoThienDiaVoCuc,
        fnAction = function()
          if not MacroOptions.autoThienDiaVoCuc then
            MacroOptions.autoThienDiaVoCuc=true
            OutputMessage("MSG_SYS","[Đánh Thiên Địa Vô Cực trong combo] > ON\n")
          else
            MacroOptions.autoThienDiaVoCuc=false
            OutputMessage("MSG_SYS","[Đánh Thiên Địa Vô Cực trong combo] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menu,{bDevide=true})
    table.insert(menu,
      {
        szOption = "Thiết lập phím tắt cho các lựa chọn bên dưới",r=255,g=255,b=0,
        bCheck = false,
        bChecked = false,
        fnAction = function()
          HotkeyPanel_Open("Macro Thuần Dương")
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menu, menuThuanDuongTHC)
    table.insert(menu, menuThuanDuongTHKY)
  elseif NoiCong==10224 or NoiCong==10225 then
    local menuDuongMonKVQ = {
      szOption = "Đường Môn - Kinh Vũ Quyết",
      bCheck = false,
      bChecked = false
    }
    table.insert(menuDuongMonKVQ,menuSwapWeapon1)
    table.insert(menuDuongMonKVQ,{bDevide=true})
    table.insert(menuDuongMonKVQ,
      {
        szOption = "Phù Quang Lược Ảnh khi cừu hận > 70%",
        bCheck = true,
        bChecked = MacroOptions.autoPhuQuangLuocAnhKVQ,
        fnAction = function()
          if not MacroOptions.autoPhuQuangLuocAnhKVQ then
            MacroOptions.autoPhuQuangLuocAnhKVQ=true
            OutputMessage("MSG_SYS","[Phù Quang Lược Ảnh khi cừu hận > 70%] > ON\n")
          else
            MacroOptions.autoPhuQuangLuocAnhKVQ=false
            OutputMessage("MSG_SYS","[Phù Quang Lược Ảnh khi cừu hận > 70%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonKVQ,{bDevide=true})
    table.insert(menuDuongMonKVQ,
      {
        szOption = "Tự bật Kinh Hồng Du Long khi cần thiết",
        bCheck = true,
        bChecked = MacroOptions.autoKinhHongDuLongKVQ,
        fnAction = function()
          if not MacroOptions.autoKinhHongDuLongKVQ then
            MacroOptions.autoKinhHongDuLongKVQ=true
            OutputMessage("MSG_SYS","[Tự bật Kinh Hồng Du Long khi cần thiết] > ON\n")
          else
            MacroOptions.autoKinhHongDuLongKVQ=false
            OutputMessage("MSG_SYS","[Tự bật Kinh Hồng Du Long khi cần thiết] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonKVQ,
      {
        szOption = "Tự bật Tập Trung",
        bCheck = true,
        bChecked = MacroOptions.autoTapTrungKVQ,
        fnAction = function()
          if not MacroOptions.autoTapTrungKVQ then
            MacroOptions.autoTapTrungKVQ=true
            OutputMessage("MSG_SYS","[Tự bật Tập Trung] > ON\n")
          else
            MacroOptions.autoTapTrungKVQ=false
            OutputMessage("MSG_SYS","[Tự bật Tập Trung] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonKVQ,
      {
        szOption = "Dùng Ngự Nguyên Tiễn duy trì debuff Tạ Giáp",
        bCheck = true,
        bChecked = MacroOptions.autoNguNguyenTien,
        fnAction = function()
          if not MacroOptions.autoNguNguyenTien then
            MacroOptions.autoNguNguyenTien=true
            OutputMessage("MSG_SYS","[Dùng Ngự Nguyên Tiễn duy trì debuff Tạ Giáp] > ON\n")
          else
            MacroOptions.autoNguNguyenTien=false
            OutputMessage("MSG_SYS","[Dùng Ngự Nguyên Tiễn duy trì debuff Tạ Giáp] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    local menuDuongMonTLND = {
      szOption = "Đường Môn - Thiên La Ngụy Đạo",
      bCheck = false,
      bChecked = false
    }
    table.insert(menuDuongMonTLND,menuSwapWeapon2)
    table.insert(menuDuongMonTLND,{bDevide=true})
    table.insert(menuDuongMonTLND,
      {
        szOption = "Phù Quang Lược Ảnh khi cừu hận > 70%",
        bCheck = true,
        bChecked = MacroOptions.autoPhuQuangLuocAnhTLND,
        fnAction = function()
          if not MacroOptions.autoPhuQuangLuocAnhTLND then
            MacroOptions.autoPhuQuangLuocAnhTLND=true
            OutputMessage("MSG_SYS","[Phù Quang Lược Ảnh khi cừu hận > 70%] > ON\n")
          else
            MacroOptions.autoPhuQuangLuocAnhTLND=false
            OutputMessage("MSG_SYS","[Phù Quang Lược Ảnh khi cừu hận > 70%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonTLND,{bDevide=true})
    local menuPheTam = {
      szOption = "Số tầng Phệ Tâm cần stack khi bắt đầu đánh",
      bCheck = false,
      bChecked = false
    }
    table.insert(menuPheTam,
      {
        szOption = "1",
        bMCheck = true,
        bChecked = MacroOptions.stackNumPheTam==1,
        fnAction = function()
          if MacroOptions.stackNumPheTam~=1 then
            MacroOptions.stackNumPheTam=1
            OutputMessage("MSG_SYS","[Stack 1 tầng Phệ Tâm khi bắt đầu đánh]\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuPheTam,
      {
        szOption = "2",
        bMCheck = true,
        bChecked = MacroOptions.stackNumPheTam==2,
        fnAction = function()
          if MacroOptions.stackNumPheTam~=2 then
            MacroOptions.stackNumPheTam=2
            OutputMessage("MSG_SYS","[Stack 2 tầng Phệ Tâm khi bắt đầu đánh]\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuPheTam,
      {
        szOption = "3",
        bMCheck = true,
        bChecked = MacroOptions.stackNumPheTam==3,
        fnAction = function()
          if MacroOptions.stackNumPheTam~=3 then
            MacroOptions.stackNumPheTam=3
            OutputMessage("MSG_SYS","[Stack 3 tầng Phệ Tâm khi bắt đầu đánh]\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuPheTam,
      {
        szOption = "4",
        bMCheck = true,
        bChecked = MacroOptions.stackNumPheTam==4,
        fnAction = function()
          if MacroOptions.stackNumPheTam~=4 then
            MacroOptions.stackNumPheTam=4
            OutputMessage("MSG_SYS","[Stack 4 tầng Phệ Tâm khi bắt đầu đánh]\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuPheTam,
      {
        szOption = "5",
        bMCheck = true,
        bChecked = MacroOptions.stackNumPheTam==5,
        fnAction = function()
          if MacroOptions.stackNumPheTam~=5 then
            MacroOptions.stackNumPheTam=5
            OutputMessage("MSG_SYS","[Stack 5 tầng Phệ Tâm khi bắt đầu đánh]\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonTLND, menuPheTam)
    table.insert(menuDuongMonTLND,
      {
        szOption = "Tự bật Kinh Hồng Du Long khi cần thiết",
        bCheck = true,
        bChecked = MacroOptions.autoKinhHongDuLongTLND,
        fnAction = function()
          if not MacroOptions.autoKinhHongDuLongTLND then
            MacroOptions.autoKinhHongDuLongTLND=true
            OutputMessage("MSG_SYS","[Tự bật Kinh Hồng Du Long khi cần thiết] > ON\n")
          else
            MacroOptions.autoKinhHongDuLongTLND=false
            OutputMessage("MSG_SYS","[Tự bật Kinh Hồng Du Long khi cần thiết] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonTLND,
      {
        szOption = "Tự bật Tập Trung",
        bCheck = true,
        bChecked = MacroOptions.autoTapTrungTLND,
        fnAction = function()
          if not MacroOptions.autoTapTrungTLND then
            MacroOptions.autoTapTrungTLND=true
            OutputMessage("MSG_SYS","[Tự bật Tập Trung] > ON\n")
          else
            MacroOptions.autoTapTrungTLND=false
            OutputMessage("MSG_SYS","[Tự bật Tập Trung] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonTLND,
      {
        szOption = "Tự bật Quỉ Phủ Thần Công",
        bCheck = true,
        bChecked = MacroOptions.autoQuiPhuThanCong,
        fnAction = function()
          if not MacroOptions.autoQuiPhuThanCong then
            MacroOptions.autoQuiPhuThanCong=true
            OutputMessage("MSG_SYS","[Tự bật Quỉ Phủ Thần Công] > ON\n")
          else
            MacroOptions.autoQuiPhuThanCong=false
            OutputMessage("MSG_SYS","[Tự bật Quỉ Phủ Thần Công] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonTLND,
      {
        szOption = "Tự kích hoạt Đồ Cùng Chủy Kiến và đặt Thiên Tuyệt Địa Diệt",
        bCheck = true,
        bChecked = MacroOptions.autoDoCungChuyKien,
        fnAction = function()
          if not MacroOptions.autoDoCungChuyKien then
            MacroOptions.autoDoCungChuyKien=true
            OutputMessage("MSG_SYS","[Tự kích hoạt Đồ Cùng Chủy Kiến và đặt Thiên Tuyệt Địa Diệt] > ON\n")
          else
            MacroOptions.autoDoCungChuyKien=false
            OutputMessage("MSG_SYS","[Tự kích hoạt Đồ Cùng Chủy Kiến và đặt Thiên Tuyệt Địa Diệt] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonTLND,
      {
        szOption = "Tự tấn công bằng Liên Nỏ hoặc Trọng Nỏ khi đổi mục tiêu",
        bCheck = true,
        bChecked = MacroOptions.autoTCBAttack,
        fnAction = function()
          if not MacroOptions.autoTCBAttack then
            MacroOptions.autoTCBAttack=true
            OutputMessage("MSG_SYS","[Tự tấn công bằng Liên Nỏ hoặc Trọng Nỏ khi đổi mục tiêu] > ON\n")
          else
            MacroOptions.autoTCBAttack=false
            OutputMessage("MSG_SYS","[Tự tấn công bằng Liên Nỏ hoặc Trọng Nỏ khi đổi mục tiêu] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonTLND,{bDevide=true})
    table.insert(menuDuongMonTLND,
      {
        szOption = "Không tự đặt Thiên Cơ Biến",
        bMCheck = true,
        bChecked = MacroOptions.autoTCB==0,
        fnAction = function()
          if MacroOptions.autoTCB~=0 then
            MacroOptions.autoTCB=0
            OutputMessage("MSG_SYS","Đã lựa chọn [Không tự đặt Thiên Cơ Biến]\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonTLND,
      {
        szOption = "Tự đặt Thiên Cơ Biến dạng Liên Nỏ",
        bMCheck = true,
        bChecked = MacroOptions.autoTCB==1,
        fnAction = function()
          if MacroOptions.autoTCB~=1 then
            MacroOptions.autoTCB=1
            OutputMessage("MSG_SYS","Đã lựa chọn [Tự đặt Thiên Cơ Biến dạng Liên Nỏ]\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonTLND,
      {
        szOption = "Tự đặt Thiên Cơ Biến dạng Độc Sát",
        bMCheck = true,
        bChecked = MacroOptions.autoTCB==2,
        fnAction = function()
          if MacroOptions.autoTCB~=2 then
            MacroOptions.autoTCB=2
            OutputMessage("MSG_SYS","Đã lựa chọn [Tự đặt Thiên Cơ Biến dạng Độc Sát]\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonTLND,{bDevide=true})
    table.insert(menuDuongMonTLND,
      {
        szOption = "Dùng Tập Trung ngay khi cooldown xong",
        bMCheck = true,
        bChecked = MacroOptions.autoTapTrungQPTC==1,
        fnAction = function()
          if MacroOptions.autoTapTrungQPTC~=1 then
            MacroOptions.autoTapTrungQPTC=1
            OutputMessage("MSG_SYS","Đã chọn [Dùng Tập Trung ngay khi cooldown xong]\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonTLND,
      {
        szOption = "Dùng Tập Trung cùng Quỉ Phủ Thần Công",
        bMCheck = true,
        bChecked = MacroOptions.autoTapTrungQPTC==2,
        fnAction = function()
          if MacroOptions.autoTapTrungQPTC~=2 then
            MacroOptions.autoTapTrungQPTC=2
            OutputMessage("MSG_SYS","Đã chọn [Dùng Tập Trung cùng Quỉ Phủ Thần Công]\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonTLND,{bDevide=true})
    table.insert(menuDuongMonTLND,
      {
        szOption = "Đặt Ám Tàng Sát Cơ khi thần cơ >= 25",
        bMCheck = true,
        bChecked = MacroOptions.toggleATSCMode==25,
        fnAction = function()
          if MacroOptions.toggleATSCMode~=25 then
            MacroOptions.toggleATSCMode=25
            OutputMessage("MSG_SYS","Đã chọn [Đặt Ám Tàng Sát Cơ khi thần cơ >= 25]\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonTLND,
      {
        szOption = "Đặt Ám Tàng Sát Cơ khi thần cơ >= 55",
        bMCheck = true,
        bChecked = MacroOptions.toggleATSCMode==55,
        fnAction = function()
          if MacroOptions.toggleATSCMode~=55 then
            MacroOptions.toggleATSCMode=55
            OutputMessage("MSG_SYS","Đã chọn [Đặt Ám Tàng Sát Cơ khi thần cơ >= 55]\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonTLND,
      {
        szOption = "Đặt Ám Tàng Sát Cơ khi thần cơ >= 85",
        bMCheck = true,
        bChecked = MacroOptions.toggleATSCMode==85,
        fnAction = function()
          if MacroOptions.toggleATSCMode~=85 then
            MacroOptions.toggleATSCMode=85
            OutputMessage("MSG_SYS","Đã chọn [Đặt Ám Tàng Sát Cơ khi thần cơ >= 85]\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonTLND,
      {
        szOption = "Đặt Ám Tàng Sát Cơ khi thần cơ >= 100",
        bMCheck = true,
        bChecked = MacroOptions.toggleATSCMode==100,
        fnAction = function()
          if MacroOptions.toggleATSCMode~=100 then
            MacroOptions.toggleATSCMode=100
            OutputMessage("MSG_SYS","Đã chọn [Đặt Ám Tàng Sát Cơ khi thần cơ >= 100]\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonTLND,{bDevide=true})
    table.insert(menuDuongMonTLND,
      {
        szOption = "Chế độ đánh bình thường",
        bMCheck = true,
        bChecked = MacroOptions.toggleAttackMode==1,
        fnAction = function()
          if MacroOptions.toggleAttackMode~=1 then
            MacroOptions.toggleAttackMode=1
            MacroOptions.autoTCB=1
            OutputMessage("MSG_SYS","[Chế độ đánh bình thường] > ON\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonTLND,
      {
        szOption = "Chế độ đánh đối tượng di chuyển nhiều",
        bMCheck = true,
        bChecked = MacroOptions.toggleAttackMode==2,
        fnAction = function()
          if not MacroOptions.toggleAttackMode~=2 then
            MacroOptions.toggleAttackMode=2
            OutputMessage("MSG_SYS","[Chế độ đánh đối tượng di chuyển nhiều] > ON\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuDuongMonTLND,
      {
        szOption = "Chế độ đánh AOE toàn diện",
        bMCheck = true,
        bChecked = MacroOptions.toggleAttackMode==3,
        fnAction = function()
          if not MacroOptions.toggleAttackMode~=3 then
            MacroOptions.toggleAttackMode=3
            MacroOptions.autoTCB=2
            OutputMessage("MSG_SYS","[Chế độ đánh AOE toàn diện] > ON\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menu,{bDevide=true})
    table.insert(menu,
      {
        szOption = "Thiết lập phím tắt cho các lựa chọn bên dưới",r=255,g=255,b=0,
        bCheck = false,
        bChecked = false,
        fnAction = function()
          HotkeyPanel_Open("Macro Đường Môn")
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menu, menuDuongMonKVQ)
    table.insert(menu, menuDuongMonTLND)
  elseif NoiCong==10026 or NoiCong==10062 then
    local menuThienSachNHCY = {
      szOption = "Thiên Sách - Ngạo Huyết Chiến Ý",
      bCheck = false,
      bChecked = false
    }
    table.insert(menuThienSachNHCY,menuSwapWeapon1)
    table.insert(menuThienSachNHCY,{bDevide=true})
    table.insert(menuThienSachNHCY,
      {
        szOption = "Tự bật Gầm Như Hổ và Ngự khi HP<30%",
        bCheck = true,
        bChecked = MacroOptions.autoGamNhuHoNHCY,
        fnAction = function()
          if not MacroOptions.autoGamNhuHoNHCY then
            MacroOptions.autoGamNhuHoNHCY=true
            OutputMessage("MSG_SYS","[Tự bật Gầm Như Hổ và Ngự khi HP<30%] > ON\n")
          else
            MacroOptions.autoGamNhuHoNHCY=false
            OutputMessage("MSG_SYS","[Tự bật Gầm Như Hổ và Ngự khi HP<30%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThienSachNHCY,
      {
        szOption = "Tự bật Thủ Như Sơn khi HP<50%",
        bCheck = true,
        bChecked = MacroOptions.autoThuNhuSonNHCY,
        fnAction = function()
          if not MacroOptions.autoThuNhuSonNHCY then
            MacroOptions.autoThuNhuSonNHCY=true
            OutputMessage("MSG_SYS","[Tự bật Thủ Như Sơn khi HP<50%] > ON\n")
          else
            MacroOptions.autoThuNhuSonNHCY=false
            OutputMessage("MSG_SYS","[Tự bật Thủ Như Sơn khi HP<50%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThienSachNHCY,
      {
        szOption = "Tự bật Từ Như Lâm khi MP<30%",
        bCheck = true,
        bChecked = MacroOptions.autoTuNhuLamNHCY,
        fnAction = function()
          if not MacroOptions.autoTuNhuLamNHCY then
            MacroOptions.autoTuNhuLamNHCY=true
            OutputMessage("MSG_SYS","[Tự bật Từ Như Lâm khi MP<30%] > ON\n")
          else
            MacroOptions.autoTuNhuLamNHCY=false
            OutputMessage("MSG_SYS","[Tự bật Từ Như Lâm khi MP<30%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThienSachNHCY,{bDevide=true})
    table.insert(menuThienSachNHCY,
      {
        szOption = "Tự dùng Hám Như Lôi",
        bCheck = true,
        bChecked = MacroOptions.autoHamNhuLoiNHCY,
        fnAction = function()
          if not MacroOptions.autoHamNhuLoiNHCY then
            MacroOptions.autoHamNhuLoiNHCY=true
            OutputMessage("MSG_SYS","[Tự dùng Hám Như Lôi] > ON\n")
          else
            MacroOptions.autoHamNhuLoiNHCY=false
            OutputMessage("MSG_SYS","[Tự dùng Hám Như Lôi] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThienSachNHCY,{bDevide=true})
    table.insert(menuThienSachNHCY,
      {
        szOption = "Tự dùng Tật Như Phong",
        bCheck = true,
        bChecked = MacroOptions.autoTatNhuPhongNHCY,
        fnAction = function()
          if not MacroOptions.autoTatNhuPhongNHCY then
            MacroOptions.autoTatNhuPhongNHCY=true
            OutputMessage("MSG_SYS","[Tự dùng Tật Như Phong] > ON\n")
          else
            MacroOptions.autoTatNhuPhongNHCY=false
            OutputMessage("MSG_SYS","[Tự dùng Tật Như Phong] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThienSachNHCY,
      {
        szOption = "Tự sử dụng Tật để áp sát",
        bCheck = true,
        bChecked = MacroOptions.autoTatNHCY,
        fnAction = function()
          if not MacroOptions.autoTatNHCY then
            MacroOptions.autoTatNHCY=true
            OutputMessage("MSG_SYS","[Tự sử dụng Tật để áp sát] > ON\n")
          else
            MacroOptions.autoTatNHCY=false
            OutputMessage("MSG_SYS","[Tự sử dụng Tật để áp sát] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThienSachNHCY,
      {
        szOption = "Tự sử dụng Đột khi khoảng cách >8m và <25m",
        bCheck = true,
        bChecked = MacroOptions.autoDotNHCY,
        fnAction = function()
          if not MacroOptions.autoDotNHCY then
            MacroOptions.autoDotNHCY=true
            OutputMessage("MSG_SYS","[Tự sử dụng Đột khi khoảng cách >8m và <25m] > ON\n")
          else
            MacroOptions.autoDotNHCY=false
            OutputMessage("MSG_SYS","[Tự sử dụng Đột khi khoảng cách >8m và <25m] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    local menuThienSachTLL = {
      szOption = "Thiên Sách - Thiết Lao Luật",
      bCheck = false,
      bChecked = false
    }
    table.insert(menuThienSachTLL,menuSwapWeapon2)
    table.insert(menuThienSachTLL,{bDevide=true})
    table.insert(menuThienSachTLL,
      {
        szOption = "Các skill sinh tồn dưới đây được dùng tuần tự theo thứ tự từ trên xuống",
        bCheck = false,
        bChecked = false,
        fnDisable = function() return true end
      }
    )
    table.insert(menuThienSachTLL,
      {
        szOption = "Tự bật Gầm Như Hổ khi HP<30%",
        bCheck = true,
        bChecked = MacroOptions.autoGamNhuHoTLL,
        fnAction = function()
          if not MacroOptions.autoGamNhuHoTLL then
            MacroOptions.autoGamNhuHoTLL=true
            OutputMessage("MSG_SYS","[Tự bật Gầm Như Hổ khi HP<30%] > ON\n")
          else
            MacroOptions.autoGamNhuHoTLL=false
            OutputMessage("MSG_SYS","[Tự bật Gầm Như Hổ khi HP<30%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThienSachTLL,
      {
        szOption = "Tự bật Ngự khi HP<40%",
        bCheck = true,
        bChecked = MacroOptions.autoNguTLL,
        fnAction = function()
          if not MacroOptions.autoNguTLL then
            MacroOptions.autoNguTLL=true
            OutputMessage("MSG_SYS","[Tự bật Ngự khi HP<40%] > ON\n")
          else
            MacroOptions.autoNguTLL=false
            OutputMessage("MSG_SYS","[Tự bật Ngự khi HP<40%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThienSachTLL,
      {
        szOption = "Tự bật Thủ Như Sơn khi HP<60%",
        bCheck = true,
        bChecked = MacroOptions.autoThuNhuSonTLL,
        fnAction = function()
          if not MacroOptions.autoThuNhuSonTLL then
            MacroOptions.autoThuNhuSonTLL=true
            OutputMessage("MSG_SYS","[Tự bật Thủ Như Sơn khi HP<60%] > ON\n")
          else
            MacroOptions.autoThuNhuSonTLL=false
            OutputMessage("MSG_SYS","[Tự bật Thủ Như Sơn khi HP<60%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThienSachTLL,
      {
        szOption = "Tự bật Ngang Như Ngạc khi HP<30%",
        bCheck = true,
        bChecked = MacroOptions.autoNgangNhuNgac,
        fnAction = function()
          if not MacroOptions.autoNgangNhuNgac then
            MacroOptions.autoNgangNhuNgac=true
            OutputMessage("MSG_SYS","[Tự bật Ngang Như Ngạc khi HP<30%] > ON\n")
          else
            MacroOptions.autoNgangNhuNgac=false
            OutputMessage("MSG_SYS","[Tự bật Ngang Như Ngạc khi HP<30%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThienSachTLL,
      {
        szOption = "Tự bật Từ Như Lâm khi MP<30%",
        bCheck = true,
        bChecked = MacroOptions.autoTuNhuLamTLL,
        fnAction = function()
          if not MacroOptions.autoTuNhuLamTLL then
            MacroOptions.autoTuNhuLamTLL=true
            OutputMessage("MSG_SYS","[Tự bật Từ Như Lâm khi MP<30%] > ON\n")
          else
            MacroOptions.autoTuNhuLamTLL=false
            OutputMessage("MSG_SYS","[Tự bật Từ Như Lâm khi MP<30%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThienSachTLL,{bDevide=true})
    table.insert(menuThienSachTLL,
      {
        szOption = "Tự bật Hám Như Lôi",
        bCheck = true,
        bChecked = MacroOptions.autoHamNhuLoiTLL,
        fnAction = function()
          if not MacroOptions.autoHamNhuLoiTLL then
            MacroOptions.autoHamNhuLoiTLL=true
            OutputMessage("MSG_SYS","[Tự bật Hám Như Lôi] > ON\n")
          else
            MacroOptions.autoHamNhuLoiTLL=false
            OutputMessage("MSG_SYS","[Tự bật Hám Như Lôi] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThienSachTLL,
      {
        szOption = "Tự dùng Định Quân khi BOSS chuyển target khỏi bản thân",
        bCheck = true,
        bChecked = MacroOptions.autoDinhQuan,
        fnAction = function()
          if not MacroOptions.autoDinhQuan then
            MacroOptions.autoDinhQuan=true
            OutputMessage("MSG_SYS","[Tự dùng Định Quân khi BOSS chuyển target khỏi bản thân] > ON\n")
          else
            MacroOptions.autoDinhQuan=false
            OutputMessage("MSG_SYS","[Tự dùng Định Quân khi BOSS chuyển target khỏi bản thân] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThienSachTLL,
      {
        szOption = "Tự dùng Lược Như Hỏa khi cừu hận top 2 > 70%",
        bCheck = true,
        bChecked = MacroOptions.autoLuocNhuHoa,
        fnAction = function()
          if not MacroOptions.autoLuocNhuHoa then
            MacroOptions.autoLuocNhuHoa=true
            OutputMessage("MSG_SYS","[Tự dùng Lược Như Hỏa khi cừu hận hạng 2 > 70%] > ON\n")
          else
            MacroOptions.autoLuocNhuHoa=false
            OutputMessage("MSG_SYS","[Tự dùng Lược Như Hỏa khi cừu hận hạng 2 > 70%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThienSachTLL,{bDevide=true})
    table.insert(menuThienSachTLL,
      {
        szOption = "Tự dùng Tật Như Phong",
        bCheck = true,
        bChecked = MacroOptions.autoTatNhuPhongTLL,
        fnAction = function()
          if not MacroOptions.autoTatNhuPhongTLL then
            MacroOptions.autoTatNhuPhongTLL=true
            OutputMessage("MSG_SYS","[Tự dùng Tật Như Phong] > ON\n")
          else
            MacroOptions.autoTatNhuPhongTLL=false
            OutputMessage("MSG_SYS","[Tự dùng Tật Như Phong] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThienSachTLL,
      {
        szOption = "Tự sử dụng Tật để áp sát",
        bCheck = true,
        bChecked = MacroOptions.autoTatTLL,
        fnAction = function()
          if not MacroOptions.autoTatTLL then
            MacroOptions.autoTatTLL=true
            OutputMessage("MSG_SYS","[Tự sử dụng Tật để áp sát] > ON\n")
          else
            MacroOptions.autoTatTLL=false
            OutputMessage("MSG_SYS","[Tự sử dụng Tật để áp sát] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThienSachTLL,
      {
        szOption = "Tự sử dụng Đột khi khoảng cách >8m và <25m",
        bCheck = true,
        bChecked = MacroOptions.autoDotTLL,
        fnAction = function()
          if not MacroOptions.autoDotTLL then
            MacroOptions.autoDotTLL=true
            OutputMessage("MSG_SYS","[Tự sử dụng Đột khi khoảng cách >8m và <25m] > ON\n")
          else
            MacroOptions.autoDotTLL=false
            OutputMessage("MSG_SYS","[Tự sử dụng Đột khi khoảng cách >8m và <25m] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menu,{bDevide=true})
    table.insert(menu,
      {
        szOption = "Thiết lập phím tắt cho các lựa chọn bên dưới",r=255,g=255,b=0,
        bCheck = false,
        bChecked = false,
        fnAction = function()
          HotkeyPanel_Open("Macro Thiên Sách")
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menu, menuThienSachNHCY)
    table.insert(menu, menuThienSachTLL)
  elseif NoiCong==10242 or NoiCong==10243 then
    local menuMinhGiaoPATQ = {
      szOption = "Minh Giáo - Phần Ảnh Thánh Quyết",
      bCheck = false,
      bChecked = false
    }
    table.insert(menuMinhGiaoPATQ,menuSwapWeapon1)
    table.insert(menuMinhGiaoPATQ,{bDevide=true})
    table.insert(menuMinhGiaoPATQ,
      {
        szOption = "Tự bật Tham Ma Thể khi HP<30%",
        bCheck = true,
        bChecked = MacroOptions.autoThamMaThePATQ,
        fnAction = function()
          if not MacroOptions.autoThamMaThePATQ then
            MacroOptions.autoThamMaThePATQ=true
            OutputMessage("MSG_SYS","[Tự bật Tham Ma Thể khi HP<30%] > ON\n")
          else
            MacroOptions.autoThamMaThePATQ=false
            OutputMessage("MSG_SYS","[Tự bật Tham Ma Thể khi HP<30%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoPATQ,{bDevide=true})
    table.insert(menuMinhGiaoPATQ,
      {
        szOption = "Không tự bật Ám Trần Di Tán khi chiến đấu",
        bMCheck = true,
        bChecked = MacroOptions.autoAmTranDiTan==0,
        fnAction = function()
          if MacroOptions.autoAmTranDiTan~=0 then
            MacroOptions.autoAmTranDiTan=0
            OutputMessage("MSG_SYS","[Không tự bật Ám Trần Di Tán khi chiến đấu] > ON\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoPATQ,
      {
        szOption = "Tự bật Ám Trần Di Tán khi cừu hận > 70%",
        bMCheck = true,
        bChecked = MacroOptions.autoAmTranDiTan==1,
        fnAction = function()
          if MacroOptions.autoAmTranDiTan~=1 then
            MacroOptions.autoAmTranDiTan=1
            OutputMessage("MSG_SYS","[Tự bật Ám Trần Di Tán khi cừu hận > 70%] > ON\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoPATQ,
      {
        szOption = "Tự bật Ám Trần Di Tán -> Khu Dạ Đoạn Sầu",
        bMCheck = true,
        bChecked = MacroOptions.autoAmTranDiTan==2,
        fnAction = function()
          if MacroOptions.autoAmTranDiTan~=2 then
            MacroOptions.autoAmTranDiTan=2
            OutputMessage("MSG_SYS","[Tự bật Ám Trần Di Tán -> Khu Dạ Đoạn Sầu] > ON\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoPATQ,{bDevide=true})
    table.insert(menuMinhGiaoPATQ,
      {
        szOption = "Tự dùng Lưu Quang Tù Ảnh khi mục tiêu xa hơn 8m",
        bCheck = true,
        bChecked = MacroOptions.autoLuuQuangTuAnh,
        fnAction = function()
          if not MacroOptions.autoLuuQuangTuAnh then
            MacroOptions.autoLuuQuangTuAnh=true
            OutputMessage("MSG_SYS","[Tự dùng Lưu Quang Tù Ảnh khi mục tiêu xa hơn 8m] > ON\n")
          else
            MacroOptions.autoLuuQuangTuAnh=false
            OutputMessage("MSG_SYS","[Tự dùng Lưu Quang Tù Ảnh khi mục tiêu xa hơn 8m] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoPATQ,
      {
        szOption = "Tự dùng Ảo Quang Bộ khi mục tiêu xa hơn 8m",
        bCheck = true,
        bChecked = MacroOptions.autoAoQuangBoPATQ,
        fnAction = function()
          if not MacroOptions.autoAoQuangBoPATQ then
            MacroOptions.autoAoQuangBoPATQ=true
            OutputMessage("MSG_SYS","[Tự dùng Ảo Quang Bộ khi mục tiêu xa hơn 8m] > ON\n")
          else
            MacroOptions.autoAoQuangBoPATQ=false
            OutputMessage("MSG_SYS","[Tự dùng Ảo Quang Bộ khi mục tiêu xa hơn 8m] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoPATQ,
      {
        szOption = "Tự dùng Cực Lạc Dẫn (nếu có bí kíp tăng 20% tốc độ nhận Nhật Linh & Nguyệt Hồn)",
        bCheck = true,
        bChecked = MacroOptions.autoCucLacDanPATQ,
        fnAction = function()
          if not MacroOptions.autoCucLacDanPATQ then
            MacroOptions.autoCucLacDanPATQ=true
            OutputMessage("MSG_SYS","[Tự dùng Cực Lạc Dẫn] > ON\n")
          else
            MacroOptions.autoCucLacDanPATQ=false
            OutputMessage("MSG_SYS","[Tự dùng Cực Lạc Dẫn] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoPATQ,
      {
        szOption = "Tự dùng Quang Minh Tướng",
        bCheck = true,
        bChecked = MacroOptions.autoQuangMinhTuongPATQ,
        fnAction = function()
          if not MacroOptions.autoQuangMinhTuongPATQ then
            MacroOptions.autoQuangMinhTuongPATQ=true
            OutputMessage("MSG_SYS","[Tự dùng Quang Minh Tướng] > ON\n")
          else
            MacroOptions.autoQuangMinhTuongPATQ=false
            OutputMessage("MSG_SYS","[Tự dùng Quang Minh Tướng] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoPATQ,
      {
        szOption = "Tự dùng Sinh Diệt Dư Đoạt",
        bCheck = true,
        bChecked = MacroOptions.autoSinhDietDuDoat,
        fnAction = function()
          if not MacroOptions.autoSinhDietDuDoat then
            MacroOptions.autoSinhDietDuDoat=true
            OutputMessage("MSG_SYS","[Tự dùng Sinh Diệt Dư Đoạt] > ON\n")
          else
            MacroOptions.autoSinhDietDuDoat=false
            OutputMessage("MSG_SYS","[Tự dùng Sinh Diệt Dư Đoạt] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoPATQ,{bDevide=true})
    table.insert(menuMinhGiaoPATQ,
      {
        szOption = "Chế độ đánh kết hợp Nhật - Nguyệt",
        bMCheck = true,
        bChecked = MacroOptions.sunModePATQ==false and MacroOptions.moonModePATQ==false,
        fnAction = function()
          if MacroOptions.sunModePATQ then
            MacroOptions.sunModePATQ=false
            OutputMessage("MSG_SYS","[Chế độ đánh kết hợp Nhật - Nguyệt] > ON\n")
          elseif MacroOptions.moonModePATQ then
            MacroOptions.moonModePATQ=false
            OutputMessage("MSG_SYS","[Chế độ đánh kết hợp Nhật - Nguyệt] > ON\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoPATQ,
      {
        szOption = "Chế độ chỉ đánh bộ skill Nhật",
        bMCheck = true,
        bChecked = MacroOptions.sunModePATQ,
        fnAction = function()
          if not MacroOptions.sunModePATQ then
            MacroOptions.sunModePATQ=true
            OutputMessage("MSG_SYS","[Chế độ chỉ đánh bộ skill Nhật] > ON\n")
            if MacroOptions.moonModePATQ==true then
              MacroOptions.moonModePATQ=false
            end
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoPATQ,
      {
        szOption = "Chế độ chỉ đánh bộ skill Nguyệt",
        bMCheck = true,
        bChecked = MacroOptions.moonModePATQ,
        fnAction = function()
          if not MacroOptions.moonModePATQ then
            MacroOptions.moonModePATQ=true
            OutputMessage("MSG_SYS","[Chế độ chỉ đánh bộ skill Nguyệt] > ON\n")
            if MacroOptions.sunModePATQ==true then
              MacroOptions.sunModePATQ=false
            end
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoPATQ,{bDevide=true})
    table.insert(menuMinhGiaoPATQ,
      {
        szOption = "Đánh thêm Ngân Nguyệt Trảm trong combo Nhật/Liệt Nhật Trảm trong combo Nguyệt",
        bCheck = true,
        bChecked = MacroOptions.autoNNLN,
        fnAction = function()
          if not MacroOptions.autoNNLN then
            MacroOptions.autoNNLN=true
            OutputMessage("MSG_SYS","[Đánh thêm Ngân Nguyệt Trảm/Liệt Nhật Trảm] > ON\n")
          else
            MacroOptions.autoNNLN=false
            OutputMessage("MSG_SYS","[Đánh thêm Ngân Nguyệt Trảm/Liệt Nhật Trảm] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    local menuMinhGiaoMTLLT = {
      szOption = "Minh Giáo - Minh Tôn Lưu Ly Thể",
      bCheck = false,
      bChecked = false
    }
    table.insert(menuMinhGiaoMTLLT,menuSwapWeapon2)
    table.insert(menuMinhGiaoMTLLT,{bDevide=true})
    table.insert(menuMinhGiaoMTLLT,
      {
        szOption = "Tự dùng Tính Mệnh Hải khi HP<50%",
        bCheck = true,
        bChecked = MacroOptions.autoTinhMenhHai,
        fnAction = function()
          if not MacroOptions.autoTinhMenhHai then
            MacroOptions.autoTinhMenhHai=true
            OutputMessage("MSG_SYS","[Tự dùng Tính Mệnh Hải khi HP<50%] > ON\n")
          else
            MacroOptions.autoTinhMenhHai=false
            OutputMessage("MSG_SYS","[Tự dùng Tính Mệnh Hải khi HP<50%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoMTLLT,
      {
        szOption = "Tự bật Thánh Minh Hựu khi HP<50%",
        bCheck = true,
        bChecked = MacroOptions.autoThanhMinhHuuMTLLT,
        fnAction = function()
          if not MacroOptions.autoThanhMinhHuuMTLLT then
            MacroOptions.autoThanhMinhHuuMTLLT=true
            OutputMessage("MSG_SYS","[Tự bật Thánh Minh Hựu khi HP<50%] > ON\n")
          else
            MacroOptions.autoThanhMinhHuuMTLLT=false
            OutputMessage("MSG_SYS","[Tự bật Thánh Minh Hựu khi HP<50%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoMTLLT,
      {
        szOption = "Tự bật Tham Ma Thể khi HP<30%",
        bCheck = true,
        bChecked = MacroOptions.autoThamMaTheMTLLT,
        fnAction = function()
          if not MacroOptions.autoThamMaTheMTLLT then
            MacroOptions.autoThamMaTheMTLLT=true
            OutputMessage("MSG_SYS","[Tự bật Tham Ma Thể khi HP<30%] > ON\n")
          else
            MacroOptions.autoThamMaTheMTLLT=false
            OutputMessage("MSG_SYS","[Tự bật Tham Ma Thể khi HP<30%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoMTLLT,{bDevide=true})
    table.insert(menuMinhGiaoMTLLT,
      {
        szOption = "Tự dùng Ảo Quang Bộ khi mục tiêu xa hơn 8m",
        bCheck = true,
        bChecked = MacroOptions.autoAoQuangBoMTLLT,
        fnAction = function()
          if not MacroOptions.autoAoQuangBoMTLLT then
            MacroOptions.autoAoQuangBoMTLLT=true
            OutputMessage("MSG_SYS","[Tự dùng Ảo Quang Bộ khi mục tiêu xa hơn 8m] > ON\n")
          else
            MacroOptions.autoAoQuangBoMTLLT=false
            OutputMessage("MSG_SYS","[Tự dùng Ảo Quang Bộ khi mục tiêu xa hơn 8m] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoMTLLT,
      {
        szOption = "Tự dùng Từ Bi Nguyện khi BOSS chuyển target khỏi bản thân",
        bCheck = true,
        bChecked = MacroOptions.autoTuBiNguyen,
        fnAction = function()
          if not MacroOptions.autoTuBiNguyen then
            MacroOptions.autoTuBiNguyen=true
            OutputMessage("MSG_SYS","[Tự dùng Từ Bi Nguyện khi BOSS chuyển target khỏi bản thân] > ON\n")
          else
            MacroOptions.autoTuBiNguyen=false
            OutputMessage("MSG_SYS","[Tự dùng Từ Bi Nguyện khi BOSS chuyển target khỏi bản thân] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoMTLLT,
      {
        szOption = "Dùng Từ Bi Nguyện ngay khi cooldown xong",
        bCheck = true,
        bChecked = MacroOptions.alwaysTuBiNguyen,
        fnAction = function()
          if not MacroOptions.alwaysTuBiNguyen then
            MacroOptions.alwaysTuBiNguyen=true
            OutputMessage("MSG_SYS","[Dùng Từ Bi Nguyện ngay khi cooldown xong] > ON\n")
          else
            MacroOptions.alwaysTuBiNguyen=false
            OutputMessage("MSG_SYS","[Dùng Từ Bi Nguyện ngay khi cooldown xong] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoMTLLT,
      {
        szOption = "Tự dùng Cực Lạc Dẫn khi cừu hận top 2 > 70%",
        bCheck = true,
        bChecked = MacroOptions.autoCucLacDanMTLLT,
        fnAction = function()
          if not MacroOptions.autoCucLacDanMTLLT then
            MacroOptions.autoCucLacDanMTLLT=true
            OutputMessage("MSG_SYS","[Tự dùng Cực Lạc Dẫn khi cừu hận top 2 > 70%] > ON\n")
          else
            MacroOptions.autoCucLacDanMTLLT=false
            OutputMessage("MSG_SYS","[Tự dùng Cực Lạc Dẫn khi cừu hận top 2 > 70%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoMTLLT,
      {
        szOption = "Tự dùng Quang Minh Tướng",
        bCheck = true,
        bChecked = MacroOptions.autoQuangMinhTuongMTLLT,
        fnAction = function()
          if not MacroOptions.autoQuangMinhTuongMTLLT then
            MacroOptions.autoQuangMinhTuongMTLLT=true
            OutputMessage("MSG_SYS","[Tự dùng Quang Minh Tướng] > ON\n")
          else
            MacroOptions.autoQuangMinhTuongMTLLT=false
            OutputMessage("MSG_SYS","[Tự dùng Quang Minh Tướng] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoMTLLT,{bDevide=true})
    table.insert(menuMinhGiaoMTLLT,
      {
        szOption = "Chế độ chỉ đánh bộ skill Nhật",
        bMCheck = true,
        bChecked = MacroOptions.sunModeMTLLT,
        fnAction = function()
          if not MacroOptions.sunModeMTLLT then
            MacroOptions.sunModeMTLLT=true
            OutputMessage("MSG_SYS","[Chế độ chỉ đánh bộ skill Nhật] > ON\n")
            if MacroOptions.moonModeMTLLT==true then
              MacroOptions.moonModeMTLLT=false
            end
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoMTLLT,
      {
        szOption = "Chế độ chỉ đánh bộ skill Nguyệt",
        bMCheck = true,
        bChecked = MacroOptions.moonModeMTLLT,
        fnAction = function()
          if not MacroOptions.moonModeMTLLT then
            MacroOptions.moonModeMTLLT=true
            OutputMessage("MSG_SYS","[Chế độ chỉ đánh bộ skill Nguyệt] > ON\n")
            if MacroOptions.sunModeMTLLT==true then
              MacroOptions.sunModeMTLLT=false
            end
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuMinhGiaoMTLLT,{bDevide=true})
    table.insert(menuMinhGiaoMTLLT,
      {
        szOption = "Chỉ dùng skill trong bộ Nhật Nguyệt Tịnh Thế",
        bCheck = true,
        bChecked = MacroOptions.autoNhatNguyetTinhThe,
        fnAction = function()
          if not MacroOptions.autoNhatNguyetTinhThe then
            MacroOptions.autoNhatNguyetTinhThe=true
            OutputMessage("MSG_SYS","[Chỉ dùng skill trong bộ Nhật Nguyệt Tịnh Thế] > ON\n")
          else
            MacroOptions.autoNhatNguyetTinhThe=false
            OutputMessage("MSG_SYS","[Chỉ dùng skill trong bộ Nhật Nguyệt Tịnh Thế] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menu,{bDevide=true})
    table.insert(menu,
      {
        szOption = "Thiết lập phím tắt cho các lựa chọn bên dưới",r=255,g=255,b=0,
        bCheck = false,
        bChecked = false,
        fnAction = function()
          HotkeyPanel_Open("Macro Minh Giáo")
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menu, menuMinhGiaoPATQ)
    table.insert(menu, menuMinhGiaoMTLLT)
  elseif NoiCong==10144 or NoiCong==10145 then
    local menuTangKiem = {
      szOption = "Tàng Kiếm - Vấn Thủy Quyết - Sơn Cư Kiếm Ý",
      bCheck = false,
      bChecked = false
    }
-----------------------------------------------------------------------------------------------------------
    local menuSwapWeaponTK1 = {
      szOption = "Tự thay đổi khinh kiếm opt cam (lấy buff đặc biệt)",
      bCheck = true,
      bChecked = MacroOptions.autoSwapWeapon1,
      fnAction = function()
        if not MacroOptions.autoSwapWeapon1 then
          if (MacroOptions.szMainWeaponName1~="" and MacroOptions.szAuxWeaponName1~="" and MacroOptions.weaponBuffID1~=0 and MacroOptions.weaponBuffLevel1~=0 and MacroOptions.weaponBuffStack1~=0 and MacroOptions.minWeaponBuffTime1~=0 and MacroOptions.weaponType1~=0) or (MacroOptions.szMainWeaponName1~="" and MacroOptions.szThirdWeaponName1~="" and MacroOptions.secondWeaponBuffID1~=0 and MacroOptions.secondWeaponBuffLevel1~=0 and MacroOptions.secondWeaponBuffStack1~=0 and MacroOptions.secondMinWeaponBuffTime1~=0 and MacroOptions.secondWeaponType1~=0) then
            MacroOptions.autoSwapWeapon1=true
            OutputMessage("MSG_SYS","[Tự thay đổi khinh kiếm opt cam (lấy buff đặc biệt)] > ON\n")
          else
            OutputMessage("MSG_SYS","Nhập các thiết lập cần thiết trước khi kích hoạt\n")
          end
        else
          MacroOptions.autoSwapWeapon1=false
          OutputMessage("MSG_SYS","[Tự thay đổi khinh kiếm opt cam (lấy buff đặc biệt)] > OFF\n")
        end
      end,
      fnAutoClose = function() return true end
    }
    table.insert(menuSwapWeaponTK1,
      {
        szOption = "Thiết lập khinh kiếm đang cầm làm vũ khí chính",
        bCheck = false,
        bChecked = false,
        fnAction = function()
          MacroOptions.szMainWeaponName1=p.GetItem(INVENTORY_INDEX.EQUIP,EQUIPMENT_INVENTORY.MELEE_WEAPON).szName
          OutputMessage("MSG_SYS","Đã thiết lập \""..MacroOptions.szMainWeaponName1.."\" làm vũ khí chính\n")
        end,
        fnAutoClose = function() return true end
      }
    )
    local mainWeaponName1="Chưa có"
    if MacroOptions.szMainWeaponName1~="" then
      mainWeaponName1=MacroOptions.szMainWeaponName1
    end
    table.insert(menuSwapWeaponTK1,
      {
        szOption = "Vũ khí chính được thiết lập: "..mainWeaponName1,
        bCheck = false,
        bChecked = false,
        fnDisable = function() return true end
      }
    )
    table.insert(menuSwapWeaponTK1,{bDevide=true})
    table.insert(menuSwapWeaponTK1,
      {
        szOption = "Thiết lập khinh kiếm đang cầm làm vũ khí phụ (buff stack tầng)",
        bCheck = false,
        bChecked = false,
        fnAction = function()
          MacroOptions.szAuxWeaponName1=p.GetItem(INVENTORY_INDEX.EQUIP,EQUIPMENT_INVENTORY.MELEE_WEAPON).szName
          for _,buffNameList in pairs(MacroOptions.swapWeaponArray) do
            for _,weaponName in pairs(buffNameList.weaponList) do
              if MacroOptions.szAuxWeaponName1==weaponName then
                MacroOptions.weaponBuffID1=buffNameList.buffInfo.buffID
                MacroOptions.weaponBuffLevel1=buffNameList.buffInfo.buffLevel
                MacroOptions.weaponBuffStack1=buffNameList.buffInfo.buffStack
                MacroOptions.minWeaponBuffTime1=buffNameList.buffInfo.buffMinTime
                MacroOptions.weaponType1=buffNameList.buffInfo.weaponType
              end
            end
          end
          OutputMessage("MSG_SYS","Đã thiết lập \""..MacroOptions.szAuxWeaponName1.."\" làm vũ khí phụ\n")
        end,
        fnAutoClose = function() return true end
      }
    )
    local auxWeaponName1="Chưa có"
    if MacroOptions.szAuxWeaponName1~="" then
      auxWeaponName1=MacroOptions.szAuxWeaponName1
    end
    table.insert(menuSwapWeaponTK1,
      {
        szOption = "Vũ khí phụ 1 được thiết lập: "..auxWeaponName1,
        bCheck = false,
        bChecked = false,
        fnDisable = function() return true end
      }
    )
    table.insert(menuSwapWeaponTK1,{bDevide=true})
    local buffName1="Chưa thiết lập"
    if MacroOptions.weaponBuffID1~=0 and MacroOptions.weaponBuffLevel1~=0 then
      buffName1=Table_GetBuffName(MacroOptions.weaponBuffID1,MacroOptions.weaponBuffLevel1)..", ID: "..MacroOptions.weaponBuffID1.." - Level: "..MacroOptions.weaponBuffLevel1
    end
    table.insert(menuSwapWeaponTK1,
      {
        szOption = "Thiết lập buff của vũ khí: "..buffName1,
        bCheck = false,
        bChecked = false,
        fnAction=function()
          GetUserInput(
            "Nhập ID và level buff của vũ khí: (ví dụ: 4761-3)",
            function(szText)
              local strArray = SplitString(szText,"-")
              MacroOptions.weaponBuffID1=tonumber(strArray[1])
              MacroOptions.weaponBuffLevel1=tonumber(strArray[2])
              OutputMessage("MSG_SYS","Đã thiết lập buff của vũ khí: \""..Table_GetBuffName(tonumber(strArray[1]),tonumber(strArray[2])).."\", ID: "..tonumber(strArray[1]).." - Level: "..tonumber(strArray[2]).."\n")
            end,nil,function() end,nil,nil,6
          )
        end
      }
    )
    table.insert(menuSwapWeaponTK1,
      {
        szOption="Thiết lập số tầng buff tối đa: "..MacroOptions.weaponBuffStack1.." tầng",
        bCheck = false,
        bChecked = false,
        fnAction=function()
          GetUserInput(
            "Nhập số tầng buff tối đa:",
            function(szText)
              MacroOptions.weaponBuffStack1 = tonumber(szText)
              OutputMessage("MSG_SYS","Đã thiết lập số tầng buff tối đa: "..szText.." tầng\n")
            end,nil,function() end,nil,nil,3
          )
        end
      }
    )
    table.insert(menuSwapWeaponTK1,
      {
        szOption="Thiết lập thời gian tối thiểu cần duy trì buff: "..MacroOptions.minWeaponBuffTime1.." giây",
        bCheck = false,
        bChecked = false,
        fnAction=function()
          GetUserInput(
            "Nhập thời gian tối thiểu cần duy trì buff (giây):",
            function(szText)
              MacroOptions.minWeaponBuffTime1 = tonumber(szText)
              OutputMessage("MSG_SYS","Đã thiết lập thời gian tối thiểu cần duy trì buff: "..szText.." giây\n")
            end,nil,function() end,nil,nil,3
          )
        end
      }
    )
    table.insert(menuSwapWeaponTK1,{bDevide=true})
    table.insert(menuSwapWeaponTK1,
      {
        szOption = "Thiết lập khinh kiếm đang cầm làm vũ khí phụ (buff có tỉ lệ xuất hiện)",
        bCheck = false,
        bChecked = false,
        fnAction = function()
          MacroOptions.szThirdWeaponName1=p.GetItem(INVENTORY_INDEX.EQUIP,EQUIPMENT_INVENTORY.MELEE_WEAPON).szName
          for _,buffNameList in pairs(MacroOptions.swapWeaponArray) do
            for _,weaponName in pairs(buffNameList.weaponList) do
              if MacroOptions.szThirdWeaponName1==weaponName then
                MacroOptions.secondWeaponBuffID1=buffNameList.buffInfo.buffID
                MacroOptions.secondWeaponBuffLevel1=buffNameList.buffInfo.buffLevel
                MacroOptions.secondWeaponBuffStack1=buffNameList.buffInfo.buffStack
                MacroOptions.secondMinWeaponBuffTime1=buffNameList.buffInfo.buffMinTime
                MacroOptions.secondWeaponType1=buffNameList.buffInfo.weaponType
              end
            end
          end
          OutputMessage("MSG_SYS","Đã thiết lập \""..MacroOptions.szThirdWeaponName1.."\" làm vũ khí phụ\n")
        end,
        fnAutoClose = function() return true end
      }
    )
    local thirdWeaponName1="Chưa có"
    if MacroOptions.szThirdWeaponName1~="" then
      thirdWeaponName1=MacroOptions.szThirdWeaponName1
    end
    table.insert(menuSwapWeaponTK1,
      {
        szOption = "Vũ khí phụ 2 được thiết lập: "..thirdWeaponName1,
        bCheck = false,
        bChecked = false,
        fnDisable = function() return true end
      }
    )
    table.insert(menuSwapWeaponTK1,{bDevide=true})
    local secondBuffName1="Chưa thiết lập"
    if MacroOptions.secondWeaponBuffID1~=0 and MacroOptions.secondWeaponBuffLevel1~=0 then
      secondBuffName1=Table_GetBuffName(MacroOptions.secondWeaponBuffID1,MacroOptions.secondWeaponBuffLevel1)..", ID: "..MacroOptions.secondWeaponBuffID1.." - Level: "..MacroOptions.secondWeaponBuffLevel1
    end
    table.insert(menuSwapWeaponTK1,
      {
        szOption = "Thiết lập buff của vũ khí: "..secondBuffName1,
        bCheck = false,
        bChecked = false,
        fnAction=function()
          GetUserInput(
            "Nhập ID và level buff của vũ khí: (ví dụ: 6394-1)",
            function(szText)
              local strArray = SplitString(szText,"-")
              MacroOptions.secondWeaponBuffID1=tonumber(strArray[1])
              MacroOptions.secondWeaponBuffLevel1=tonumber(strArray[2])
              OutputMessage("MSG_SYS","Đã thiết lập buff của vũ khí: \""..Table_GetBuffName(tonumber(strArray[1]),tonumber(strArray[2])).."\", ID: "..tonumber(strArray[1]).." - Level: "..tonumber(strArray[2]).."\n")
            end,nil,function() end,nil,nil,6
          )
        end
      }
    )
    table.insert(menuSwapWeaponTK1,
      {
        szOption="Thiết lập số tầng buff tối đa: "..MacroOptions.secondWeaponBuffStack1.." tầng",
        bCheck = false,
        bChecked = false,
        fnAction=function()
          GetUserInput(
            "Nhập số tầng buff tối đa:",
            function(szText)
              MacroOptions.secondWeaponBuffStack1 = tonumber(szText)
              OutputMessage("MSG_SYS","Đã thiết lập số tầng buff tối đa: "..szText.." tầng\n")
            end,nil,function() end,nil,nil,3
          )
        end
      }
    )
    table.insert(menuSwapWeaponTK1,
      {
        szOption="Thiết lập thời gian tối thiểu cần duy trì buff: "..MacroOptions.secondMinWeaponBuffTime1.." giây",
        bCheck = false,
        bChecked = false,
        fnAction=function()
          GetUserInput(
            "Nhập thời gian tối thiểu cần duy trì buff (giây):",
            function(szText)
              MacroOptions.secondMinWeaponBuffTime1 = tonumber(szText)
              OutputMessage("MSG_SYS","Đã thiết lập thời gian tối thiểu cần duy trì buff: "..szText.." giây\n")
            end,nil,function() end,nil,nil,3
          )
        end
      }
    )
    table.insert(menuSwapWeaponTK1,{bDevide=true})
    table.insert(menuSwapWeaponTK1,
      {
        szOption="Xóa tất cả thiết lập 3 vũ khí",
        bCheck = false,
        bChecked = false,
        fnAction=function()
          MacroOptions.szMainWeaponName1=""
          MacroOptions.szAuxWeaponName1=""
          MacroOptions.szThirdWeaponName1=""
          MacroOptions.weaponBuffID1=0
          MacroOptions.weaponBuffLevel1=0
          MacroOptions.weaponBuffStack1=0
          MacroOptions.minWeaponBuffTime1=0
          MacroOptions.weaponType1=0
          MacroOptions.secondWeaponBuffID1=0
          MacroOptions.secondWeaponBuffLevel1=0
          MacroOptions.secondWeaponBuffStack1=0
          MacroOptions.secondMinWeaponBuffTime1=0
          MacroOptions.secondWeaponType1=0
          OutputMessage("MSG_SYS","Đã xóa tất cả thiết lập vũ khí\n")
        end
      }
    )
    local menuSwapWeaponTK2 = {
      szOption = "Tự thay đổi trọng kiếm opt cam (lấy buff đặc biệt)",
      bCheck = true,
      bChecked = MacroOptions.autoSwapWeapon2,
      fnAction = function()
        if not MacroOptions.autoSwapWeapon2 then
          if (MacroOptions.szMainWeaponName2~="" and MacroOptions.szAuxWeaponName2~="" and MacroOptions.weaponBuffID2~=0 and MacroOptions.weaponBuffLevel2~=0 and MacroOptions.weaponBuffStack2~=0 and MacroOptions.minWeaponBuffTime2~=0 and MacroOptions.weaponType2~=0) or (MacroOptions.szMainWeaponName2~="" and MacroOptions.szThirdWeaponName2~="" and MacroOptions.secondWeaponBuffID2~=0 and MacroOptions.secondWeaponBuffLevel2~=0 and MacroOptions.secondWeaponBuffStack2~=0 and MacroOptions.secondMinWeaponBuffTime2~=0 and MacroOptions.secondWeaponType2~=0) then
            MacroOptions.autoSwapWeapon2=true
            OutputMessage("MSG_SYS","[Tự thay đổi trọng kiếm opt cam (lấy buff đặc biệt)] > ON\n")
          else
            OutputMessage("MSG_SYS","Nhập các thiết lập cần thiết trước khi kích hoạt\n")
          end
        else
          MacroOptions.autoSwapWeapon2=false
          OutputMessage("MSG_SYS","[Tự thay đổi trọng kiếm opt cam (lấy buff đặc biệt)] > OFF\n")
        end
      end,
      fnAutoClose = function() return true end
    }
    table.insert(menuSwapWeaponTK2,
      {
        szOption = "Thiết lập trọng kiếm đang cầm làm vũ khí chính",
        bCheck = false,
        bChecked = false,
        fnAction = function()
          MacroOptions.szMainWeaponName2=p.GetItem(INVENTORY_INDEX.EQUIP,EQUIPMENT_INVENTORY.BIG_SWORD).szName
          OutputMessage("MSG_SYS","Đã thiết lập \""..MacroOptions.szMainWeaponName2.."\" làm vũ khí chính\n")
        end,
        fnAutoClose = function() return true end
      }
    )
    local mainWeaponName2="Chưa có"
    if MacroOptions.szMainWeaponName2~="" then
      mainWeaponName2=MacroOptions.szMainWeaponName2
    end
    table.insert(menuSwapWeaponTK2,
      {
        szOption = "Vũ khí chính được thiết lập: "..mainWeaponName2,
        bCheck = false,
        bChecked = false,
        fnDisable = function() return true end
      }
    )
    table.insert(menuSwapWeaponTK2,{bDevide=true})
    table.insert(menuSwapWeaponTK2,
      {
        szOption = "Thiết lập trọng kiếm đang cầm làm vũ khí phụ (buff stack tầng)",
        bCheck = false,
        bChecked = false,
        fnAction = function()
          MacroOptions.szAuxWeaponName2=p.GetItem(INVENTORY_INDEX.EQUIP,EQUIPMENT_INVENTORY.BIG_SWORD).szName
          for _,buffNameList in pairs(MacroOptions.swapWeaponArray) do
            for _,weaponName in pairs(buffNameList.weaponList) do
              if MacroOptions.szAuxWeaponName2==weaponName then
                MacroOptions.weaponBuffID2=buffNameList.buffInfo.buffID
                MacroOptions.weaponBuffLevel2=buffNameList.buffInfo.buffLevel
                MacroOptions.weaponBuffStack2=buffNameList.buffInfo.buffStack
                MacroOptions.minWeaponBuffTime2=buffNameList.buffInfo.buffMinTime
                MacroOptions.weaponType2=buffNameList.buffInfo.weaponType
              end
            end
          end
          OutputMessage("MSG_SYS","Đã thiết lập \""..MacroOptions.szAuxWeaponName2.."\" làm vũ khí phụ\n")
        end,
        fnAutoClose = function() return true end
      }
    )
    local auxWeaponName2="Chưa có"
    if MacroOptions.szAuxWeaponName2~="" then
      auxWeaponName2=MacroOptions.szAuxWeaponName2
    end
    table.insert(menuSwapWeaponTK2,
      {
        szOption = "Vũ khí phụ 1 được thiết lập: "..auxWeaponName2,
        bCheck = false,
        bChecked = false,
        fnDisable = function() return true end
      }
    )
    table.insert(menuSwapWeaponTK2,{bDevide=true})
    local buffName2="Chưa thiết lập"
    if MacroOptions.weaponBuffID2~=0 and MacroOptions.weaponBuffLevel2~=0 then
      buffName2=Table_GetBuffName(MacroOptions.weaponBuffID2,MacroOptions.weaponBuffLevel2)..", ID: "..MacroOptions.weaponBuffID2.." - Level: "..MacroOptions.weaponBuffLevel2
    end
    table.insert(menuSwapWeaponTK2,
      {
        szOption = "Thiết lập buff của vũ khí: "..buffName2,
        bCheck = false,
        bChecked = false,
        fnAction=function()
          GetUserInput(
            "Nhập ID và level buff của vũ khí: (ví dụ: 4761-3)",
            function(szText)
              local strArray = SplitString(szText,"-")
              MacroOptions.weaponBuffID2=tonumber(strArray[1])
              MacroOptions.weaponBuffLevel2=tonumber(strArray[2])
              OutputMessage("MSG_SYS","Đã thiết lập buff của vũ khí: \""..Table_GetBuffName(tonumber(strArray[1]),tonumber(strArray[2])).."\", ID: "..tonumber(strArray[1]).." - Level: "..tonumber(strArray[2]).."\n")
            end,nil,function() end,nil,nil,6
          )
        end
      }
    )
    table.insert(menuSwapWeaponTK2,
      {
        szOption="Thiết lập số tầng buff tối đa: "..MacroOptions.weaponBuffStack2.." tầng",
        bCheck = false,
        bChecked = false,
        fnAction=function()
          GetUserInput(
            "Nhập số tầng buff tối đa:",
            function(szText)
              MacroOptions.weaponBuffStack2 = tonumber(szText)
              OutputMessage("MSG_SYS","Đã thiết lập số tầng buff tối đa: "..szText.." tầng\n")
            end,nil,function() end,nil,nil,3
          )
        end
      }
    )
    table.insert(menuSwapWeaponTK2,
      {
        szOption="Thiết lập thời gian tối thiểu cần duy trì buff: "..MacroOptions.minWeaponBuffTime2.." giây",
        bCheck = false,
        bChecked = false,
        fnAction=function()
          GetUserInput(
            "Nhập thời gian tối thiểu cần duy trì buff (giây):",
            function(szText)
              MacroOptions.minWeaponBuffTime2 = tonumber(szText)
              OutputMessage("MSG_SYS","Đã thiết lập thời gian tối thiểu cần duy trì buff: "..szText.." giây\n")
            end,nil,function() end,nil,nil,3
          )
        end
      }
    )
    table.insert(menuSwapWeaponTK2,{bDevide=true})
    table.insert(menuSwapWeaponTK2,
      {
        szOption = "Thiết lập trọng kiếm đang cầm làm vũ khí phụ (buff có tỉ lệ xuất hiện)",
        bCheck = false,
        bChecked = false,
        fnAction = function()
          MacroOptions.szThirdWeaponName2=p.GetItem(INVENTORY_INDEX.EQUIP,EQUIPMENT_INVENTORY.MELEE_WEAPON).szName
          for _,buffNameList in pairs(MacroOptions.swapWeaponArray) do
            for _,weaponName in pairs(buffNameList.weaponList) do
              if MacroOptions.szThirdWeaponName2==weaponName then
                MacroOptions.secondWeaponBuffID2=buffNameList.buffInfo.buffID
                MacroOptions.secondWeaponBuffLevel2=buffNameList.buffInfo.buffLevel
                MacroOptions.secondWeaponBuffStack2=buffNameList.buffInfo.buffStack
                MacroOptions.secondMinWeaponBuffTime2=buffNameList.buffInfo.buffMinTime
                MacroOptions.secondWeaponType2=buffNameList.buffInfo.weaponType
              end
            end
          end
          OutputMessage("MSG_SYS","Đã thiết lập \""..MacroOptions.szThirdWeaponName2.."\" làm vũ khí phụ\n")
        end,
        fnAutoClose = function() return true end
      }
    )
    local thirdWeaponName2="Chưa có"
    if MacroOptions.szThirdWeaponName2~="" then
      thirdWeaponName2=MacroOptions.szThirdWeaponName2
    end
    table.insert(menuSwapWeaponTK2,
      {
        szOption = "Vũ khí phụ 2 được thiết lập: "..thirdWeaponName2,
        bCheck = false,
        bChecked = false,
        fnDisable = function() return true end
      }
    )
    table.insert(menuSwapWeaponTK2,{bDevide=true})
    local secondBuffName2="Chưa thiết lập"
    if MacroOptions.secondWeaponBuffID2~=0 and MacroOptions.secondWeaponBuffLevel2~=0 then
      secondBuffName2=Table_GetBuffName(MacroOptions.secondWeaponBuffID2,MacroOptions.secondWeaponBuffLevel2)..", ID: "..MacroOptions.secondWeaponBuffID2.." - Level: "..MacroOptions.secondWeaponBuffLevel2
    end
    table.insert(menuSwapWeaponTK2,
      {
        szOption = "Thiết lập buff của vũ khí: "..secondBuffName2,
        bCheck = false,
        bChecked = false,
        fnAction=function()
          GetUserInput(
            "Nhập ID và level buff của vũ khí: (ví dụ: 6394-1)",
            function(szText)
              local strArray = SplitString(szText,"-")
              MacroOptions.secondWeaponBuffID2=tonumber(strArray[1])
              MacroOptions.secondWeaponBuffLevel2=tonumber(strArray[2])
              OutputMessage("MSG_SYS","Đã thiết lập buff của vũ khí: \""..Table_GetBuffName(tonumber(strArray[1]),tonumber(strArray[2])).."\", ID: "..tonumber(strArray[1]).." - Level: "..tonumber(strArray[2]).."\n")
            end,nil,function() end,nil,nil,6
          )
        end
      }
    )
    table.insert(menuSwapWeaponTK2,
      {
        szOption="Thiết lập số tầng buff tối đa: "..MacroOptions.secondWeaponBuffStack2.." tầng",
        bCheck = false,
        bChecked = false,
        fnAction=function()
          GetUserInput(
            "Nhập số tầng buff tối đa:",
            function(szText)
              MacroOptions.secondWeaponBuffStack2 = tonumber(szText)
              OutputMessage("MSG_SYS","Đã thiết lập số tầng buff tối đa: "..szText.." tầng\n")
            end,nil,function() end,nil,nil,3
          )
        end
      }
    )
    table.insert(menuSwapWeaponTK2,
      {
        szOption="Thiết lập thời gian tối thiểu cần duy trì buff: "..MacroOptions.secondMinWeaponBuffTime2.." giây",
        bCheck = false,
        bChecked = false,
        fnAction=function()
          GetUserInput(
            "Nhập thời gian tối thiểu cần duy trì buff (giây):",
            function(szText)
              MacroOptions.secondMinWeaponBuffTime2 = tonumber(szText)
              OutputMessage("MSG_SYS","Đã thiết lập thời gian tối thiểu cần duy trì buff: "..szText.." giây\n")
            end,nil,function() end,nil,nil,3
          )
        end
      }
    )
    table.insert(menuSwapWeaponTK2,{bDevide=true})
    table.insert(menuSwapWeaponTK2,
      {
        szOption="Xóa tất cả thiết lập 3 vũ khí",
        bCheck = false,
        bChecked = false,
        fnAction=function()
          MacroOptions.szMainWeaponName2=""
          MacroOptions.szAuxWeaponName2=""
          MacroOptions.szThirdWeaponName2=""
          MacroOptions.weaponBuffID2=0
          MacroOptions.weaponBuffLevel2=0
          MacroOptions.weaponBuffStack2=0
          MacroOptions.minWeaponBuffTime2=0
          MacroOptions.weaponType2=0
          MacroOptions.secondWeaponBuffID2=0
          MacroOptions.secondWeaponBuffLevel2=0
          MacroOptions.secondWeaponBuffStack2=0
          MacroOptions.secondMinWeaponBuffTime2=0
          MacroOptions.secondWeaponType2=0
          OutputMessage("MSG_SYS","Đã xóa tất cả thiết lập vũ khí\n")
        end
      }
    )
-----------------------------------------------------------------------------------------------------------
    table.insert(menuTangKiem,menuSwapWeaponTK1)
    table.insert(menuTangKiem,menuSwapWeaponTK2)
    table.insert(menuTangKiem,{bDevide=true})
    table.insert(menuTangKiem,
      {
        szOption = "Tự bật Tuyền Ngưng Nguyệt - Vân Tê Tùng khi HP<30%",
        bCheck = true,
        bChecked = MacroOptions.autoTuyenNgungNguyet,
        fnAction = function()
          if not MacroOptions.autoTuyenNgungNguyet then
            MacroOptions.autoTuyenNgungNguyet=true
            OutputMessage("MSG_SYS","[Tự bật Tuyền Ngưng Nguyệt - Vân Tê Tùng] > ON\n")
          else
            MacroOptions.autoTuyenNgungNguyet=false
            OutputMessage("MSG_SYS","[Tự bật Tuyền Ngưng Nguyệt - Vân Tê Tùng] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuTangKiem,{bDevide=true})
    table.insert(menuTangKiem,
      {
        szOption = "Tự dùng Thám Mai cho tanker đang giữ BOSS",
        bCheck = true,
        bChecked = MacroOptions.autoThamMai,
        fnAction = function()
          if not MacroOptions.autoThamMai then
            MacroOptions.autoThamMai=true
            OutputMessage("MSG_SYS","[Tự dùng Thám Mai cho tanker đang giữ BOSS] > ON\n")
          else
            MacroOptions.autoThamMai=false
            OutputMessage("MSG_SYS","[Tự dùng Thám Mai cho tanker đang giữ BOSS] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuTangKiem,
      {
        szOption = "Tự bật Oanh Minh Liễu để hồi kiếm khí",
        bCheck = true,
        bChecked = MacroOptions.autoOanhMinhLieu,
        fnAction = function()
          if not MacroOptions.autoOanhMinhLieu then
            MacroOptions.autoOanhMinhLieu=true
            OutputMessage("MSG_SYS","[Tự bật Oanh Minh Liễu để hồi kiếm khí] > ON\n")
          else
            MacroOptions.autoOanhMinhLieu=false
            OutputMessage("MSG_SYS","[Tự bật Oanh Minh Liễu để hồi kiếm khí] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuTangKiem,
      {
        szOption = "Tự dùng Tuyết Đoạn Kiều để hồi kiếm khí",
        bCheck = true,
        bChecked = MacroOptions.autoTuyetDoanKieu,
        fnAction = function()
          if not MacroOptions.autoTuyetDoanKieu then
            MacroOptions.autoTuyetDoanKieu=true
            OutputMessage("MSG_SYS","[Tự dùng Tuyết Đoạn Kiều để hồi kiếm khí] > ON\n")
          else
            MacroOptions.autoTuyetDoanKieu=false
            OutputMessage("MSG_SYS","[Tự dùng Tuyết Đoạn Kiều để hồi kiếm khí] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuTangKiem,
      {
        szOption = "Dùng Oanh Minh Liễu trước Tuyết Đoạn Kiều",
        bCheck = true,
        bChecked = MacroOptions.OMLTDK,
        fnAction = function()
          if not MacroOptions.OMLTDK then
            MacroOptions.OMLTDK=true
            OutputMessage("MSG_SYS","[Dùng Oanh Minh Liễu trước Tuyết Đoạn Kiều] > ON\n")
          else
            MacroOptions.OMLTDK=false
            OutputMessage("MSG_SYS","[Dùng Oanh Minh Liễu trước Tuyết Đoạn Kiều] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuTangKiem,{bDevide=true})
    table.insert(menuTangKiem,
      {
        szOption = "Sử dụng Bình Hồ Đoạn Nguyệt - Hoàng Long Thổ Thúy",
        bCheck = true,
        bChecked = MacroOptions.autoBinhHoHoangLong,
        fnAction = function()
          if not MacroOptions.autoBinhHoHoangLong then
            MacroOptions.autoBinhHoHoangLong=true
            OutputMessage("MSG_SYS","[Sử dụng Bình Hồ Đoạn Nguyệt - Hoàng Long Thổ Thúy] > ON\n")
          else
            MacroOptions.autoBinhHoHoangLong=false
            OutputMessage("MSG_SYS","[Sử dụng Bình Hồ Đoạn Nguyệt - Hoàng Long Thổ Thúy] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuTangKiem,
      {
        szOption = "Sử dụng Mộng Tuyền Hổ Bào trong combo Vấn Thủy Quyết",
        bCheck = true,
        bChecked = MacroOptions.autoMongTuyenHoBao,
        fnAction = function()
          if not MacroOptions.autoMongTuyenHoBao then
            MacroOptions.autoMongTuyenHoBao=true
            OutputMessage("MSG_SYS","[Sử dụng Mộng Tuyền Hổ Bào trong combo Vấn Thủy Quyết] > ON\n")
          else
            MacroOptions.autoMongTuyenHoBao=false
            OutputMessage("MSG_SYS","[Sử dụng Mộng Tuyền Hổ Bào trong combo Vấn Thủy Quyết] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuTangKiem,
      {
        szOption = "Dùng Vân Tê Tùng để hồi kiếm khí",
        bCheck = true,
        bChecked = MacroOptions.autoVanTeTung,
        fnAction = function()
          if not MacroOptions.autoVanTeTung then
            MacroOptions.autoVanTeTung=true
            OutputMessage("MSG_SYS","[Dùng Vân Tê Tùng để hồi kiếm khí] > ON\n")
          else
            MacroOptions.autoVanTeTung=false
            OutputMessage("MSG_SYS","[Dùng Vân Tê Tùng để hồi kiếm khí] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuTangKiem,
      {
        szOption = "Tự xoay Phong Lai Ngô Sơn",
        bCheck = true,
        bChecked = MacroOptions.autoPhongLaiNgoSon,
        fnAction = function()
          if not MacroOptions.autoPhongLaiNgoSon then
            MacroOptions.autoPhongLaiNgoSon=true
            OutputMessage("MSG_SYS","[Tự xoay Phong Lai Ngô Sơn] > ON\n")
          else
            MacroOptions.autoPhongLaiNgoSon=false
            OutputMessage("MSG_SYS","[Tự xoay Phong Lai Ngô Sơn] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menu,{bDevide=true})
    table.insert(menu,
      {
        szOption = "Thiết lập phím tắt cho các lựa chọn bên dưới",r=255,g=255,b=0,
        bCheck = false,
        bChecked = false,
        fnAction = function()
          HotkeyPanel_Open("Macro Tàng Kiếm")
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menu, menuTangKiem)
  elseif NoiCong==10021 or NoiCong==10028 then
    local menuVanHoaHGD = {
      szOption = "Vạn Hoa - Hoa Gian Du",
      bCheck = false,
      bChecked = false
    }
    table.insert(menuVanHoaHGD,menuSwapWeapon1)
    table.insert(menuVanHoaHGD,{bDevide=true})
    table.insert(menuVanHoaHGD,
      {
        szOption = "Tự bật Xuân Nê Hộ Hoa - Hoa Ngữ Tô Tâm khi HP<30%",
        bCheck = true,
        bChecked = MacroOptions.autoXuanNeHoHoa,
        fnAction = function()
          if not MacroOptions.autoXuanNeHoHoa then
            MacroOptions.autoXuanNeHoHoa=true
            OutputMessage("MSG_SYS","[Tự bật Xuân Nê Hộ Hoa - Hoa Ngữ Tô Tâm khi HP<30%] > ON\n")
          else
            MacroOptions.autoXuanNeHoHoa=false
            OutputMessage("MSG_SYS","[Tự bật Xuân Nê Hộ Hoa - Hoa Ngữ Tô Tâm khi HP<30%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuVanHoaHGD,
      {
        szOption = "Tự dùng Bích Thủy Thao Thiên khi MP<30%",
        bCheck = true,
        bChecked = MacroOptions.autoBichThuyThaoThien,
        fnAction = function()
          if not MacroOptions.autoBichThuyThaoThien then
            MacroOptions.autoBichThuyThaoThien=true
            OutputMessage("MSG_SYS","[Tự dùng Bích Thủy Thao Thiên khi MP<30%] > ON\n")
          else
            MacroOptions.autoBichThuyThaoThien=false
            OutputMessage("MSG_SYS","[Tự dùng Bích Thủy Thao Thiên khi MP<30%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuVanHoaHGD,{bDevide=true})
    table.insert(menuVanHoaHGD,
      {
        szOption = "Tự buff Thanh Tâm Tịnh Khí",
        bCheck = true,
        bChecked = MacroOptions.autoThanhTamTinhKhi,
        fnAction = function()
          if not MacroOptions.autoThanhTamTinhKhi then
            MacroOptions.autoThanhTamTinhKhi=true
            OutputMessage("MSG_SYS","[Tự buff Thanh Tâm Tịnh Khí] > ON\n")
          else
            MacroOptions.autoThanhTamTinhKhi=false
            OutputMessage("MSG_SYS","[Tự buff Thanh Tâm Tịnh Khí] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuVanHoaHGD,
      {
        szOption = "Tự dùng Thủy Nguyệt Vô Gian",
        bCheck = true,
        bChecked = MacroOptions.autoThuyNguyetVoGian,
        fnAction = function()
          if not MacroOptions.autoThuyNguyetVoGian then
            MacroOptions.autoThuyNguyetVoGian=true
            OutputMessage("MSG_SYS","[Tự dùng Thủy Nguyệt Vô Gian] > ON\n")
          else
            MacroOptions.autoThuyNguyetVoGian=false
            OutputMessage("MSG_SYS","[Tự dùng Thủy Nguyệt Vô Gian] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    local menuVanHoaLKDD = {
      szOption = "Vạn Hoa - Ly Kinh Dịch Đạo",
      bCheck = false,
      bChecked = false
    }
    table.insert(menuVanHoaLKDD,menuSwapWeapon2)
    table.insert(menu,{bDevide=true})
    table.insert(menu,
      {
        szOption = "Thiết lập phím tắt cho các lựa chọn bên dưới",r=255,g=255,b=0,
        bCheck = false,
        bChecked = false,
        fnAction = function()
          HotkeyPanel_Open("Macro Vạn Hoa")
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menu, menuVanHoaHGD)
    table.insert(menu, menuVanHoaLKDD)
  elseif NoiCong==10081 or NoiCong==10080 then
    local menuThatTuBTQ = {
      szOption = "Thất Tú - Băng Tâm Quyết",
      bCheck = false,
      bChecked = false
    }
    table.insert(menuThatTuBTQ,menuSwapWeapon1)
    table.insert(menuThatTuBTQ,{bDevide=true})
    table.insert(menuThatTuBTQ,
      {
        szOption = "Tự bật Thiên Địa Đê Ngang - Thước Đạp Chi khi HP<30%",
        bCheck = true,
        bChecked = MacroOptions.autoThienDiaDeNgang,
        fnAction = function()
          if not MacroOptions.autoThienDiaDeNgang then
            MacroOptions.autoThienDiaDeNgang=true
            OutputMessage("MSG_SYS","[Tự bật Thiên Địa Đê Ngang - Thước Đạp Chi] > ON\n")
          else
            MacroOptions.autoThienDiaDeNgang=false
            OutputMessage("MSG_SYS","[Tự bật Thiên Địa Đê Ngang - Thước Đạp Chi] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThatTuBTQ,{bDevide=true})
    table.insert(menuThatTuBTQ,
      {
        szOption = "Tự duy trì buff Tụ Khí",
        bCheck = true,
        bChecked = MacroOptions.autoBaLaMon,
        fnAction = function()
          if not MacroOptions.autoBaLaMon then
            MacroOptions.autoBaLaMon=true
            OutputMessage("MSG_SYS","[Tự duy trì buff Tụ Khí] > ON\n")
          else
            MacroOptions.autoBaLaMon=false
            OutputMessage("MSG_SYS","[Tự duy trì buff Tụ Khí] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThatTuBTQ,
      {
        szOption = "Tự dùng Long Trì Nhạc",
        bCheck = true,
        bChecked = MacroOptions.autoLongTriNhac,
        fnAction = function()
          if not MacroOptions.autoLongTriNhac then
            MacroOptions.autoLongTriNhac=true
            OutputMessage("MSG_SYS","[Tự dùng Long Trì Nhạc] > ON\n")
          else
            MacroOptions.autoLongTriNhac=false
            OutputMessage("MSG_SYS","[Tự dùng Long Trì Nhạc] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThatTuBTQ,{bDevide=true})
    table.insert(menuThatTuBTQ,
      {
        szOption = "Tự dùng Kiếm Phá Hư Không trong combo",
        bCheck = true,
        bChecked = MacroOptions.autoKiemPhaHuKhong,
        fnAction = function()
          if not MacroOptions.autoKiemPhaHuKhong then
            MacroOptions.autoKiemPhaHuKhong=true
            OutputMessage("MSG_SYS","[Tự dùng Kiếm Phá Hư Không trong combo] > ON\n")
          else
            MacroOptions.autoKiemPhaHuKhong=false
            OutputMessage("MSG_SYS","[Tự dùng Kiếm Phá Hư Không trong combo] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThatTuBTQ,
      {
        szOption = "Tự dùng Kiếm Thần Vô Ngã",
        bCheck = true,
        bChecked = MacroOptions.autoKiemThanVoNga,
        fnAction = function()
          if not MacroOptions.autoKiemThanVoNga then
            MacroOptions.autoKiemThanVoNga=true
            OutputMessage("MSG_SYS","[Tự dùng Kiếm Thần Vô Ngã] > ON\n")
          else
            MacroOptions.autoKiemThanVoNga=false
            OutputMessage("MSG_SYS","[Tự dùng Kiếm Thần Vô Ngã] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThatTuBTQ,
      {
        szOption = "Tự hồi kiếm vũ bằng Mãn Đường Thế khi kiếm vũ ít hơn 3 tầng",
        bCheck = true,
        bChecked = MacroOptions.autoManDuongThe,
        fnAction = function()
          if not MacroOptions.autoManDuongThe then
            MacroOptions.autoManDuongThe=true
            OutputMessage("MSG_SYS","[Tự hồi kiếm vũ bằng Mãn Đường Thế khi kiếm vũ ít hơn 3 tầng] > ON\n")
          else
            MacroOptions.autoManDuongThe=false
            OutputMessage("MSG_SYS","[Tự hồi kiếm vũ bằng Mãn Đường Thế khi kiếm vũ ít hơn 3 tầng] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThatTuBTQ,
      {
        szOption = "Tự bật Phồn Âm Cấp Tiết (tăng 30% tấn công cơ bản)",
        bCheck = true,
        bChecked = MacroOptions.autoPhonAmCapTiet,
        fnAction = function()
          if not MacroOptions.autoPhonAmCapTiet then
            MacroOptions.autoPhonAmCapTiet=true
            OutputMessage("MSG_SYS","[Tự bật Phồn Âm Cấp Tiết] > ON\n")
          else
            MacroOptions.autoPhonAmCapTiet=false
            OutputMessage("MSG_SYS","[Tự bật Phồn Âm Cấp Tiết] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    local menuThatTuVTTK = {
      szOption = "Thất Tú - Vân Thường Tâm Kinh",
      bCheck = false,
      bChecked = false
    }
    table.insert(menuThatTuVTTK,menuSwapWeapon2)
    table.insert(menu,{bDevide=true})
    table.insert(menu,
      {
        szOption = "Thiết lập phím tắt cho các lựa chọn bên dưới",r=255,g=255,b=0,
        bCheck = false,
        bChecked = false,
        fnAction = function()
          HotkeyPanel_Open("Macro Thất Tú")
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menu, menuThatTuBTQ)
    table.insert(menu, menuThatTuVTTK)
  elseif NoiCong==10175 or NoiCong==10176 then
    local menuNguDocDK = {
      szOption = "Ngũ Độc - Độc Kinh",
      bCheck = false,
      bChecked = false
    }
    table.insert(menuNguDocDK,menuSwapWeapon1)
    table.insert(menuNguDocDK,{bDevide=true})
    table.insert(menuNguDocDK,
      {
        szOption = "Tự bật Huyền Thủy Cổ khi HP<30%",
        bCheck = true,
        bChecked = MacroOptions.autoHuyenThuyCo,
        fnAction = function()
          if not MacroOptions.autoHuyenThuyCo then
            MacroOptions.autoHuyenThuyCo=true
            OutputMessage("MSG_SYS","[Tự bật Huyền Thủy Cổ khi HP<30%] > ON\n")
          else
            MacroOptions.autoHuyenThuyCo=false
            OutputMessage("MSG_SYS","[Tự bật Huyền Thủy Cổ khi HP<30%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuNguDocDK,
      {
        szOption = "Tự bật Cổ Trùng Cuồng Bạo khi HP<30%",
        bCheck = true,
        bChecked = MacroOptions.autoCoTrungCuongBao,
        fnAction = function()
          if not MacroOptions.autoCoTrungCuongBao then
            MacroOptions.autoCoTrungCuongBao=true
            OutputMessage("MSG_SYS","[Tự bật Cổ Trùng Cuồng Bạo khi HP<30%] > ON\n")
          else
            MacroOptions.autoCoTrungCuongBao=false
            OutputMessage("MSG_SYS","[Tự bật Cổ Trùng Cuồng Bạo khi HP<30%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end,
      }
    )
    table.insert(menuNguDocDK,
      {
        szOption = "Chế độ đánh chú trọng hồi nội lực",
        bCheck = true,
        bChecked = MacroOptions.saveManaMode,
        fnAction = function()
          if not MacroOptions.saveManaMode then
            MacroOptions.saveManaMode=true
            OutputMessage("MSG_SYS","[Chế độ đánh chú trọng hồi nội lực] > ON\n")
          else
            MacroOptions.saveManaMode=false
            OutputMessage("MSG_SYS","[Chế độ đánh chú trọng hồi nội lực] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end,
      }
    )
    table.insert(menuNguDocDK,{bDevide=true})
    table.insert(menuNguDocDK,
      {
        szOption = "Tự buff Phượng Hoàng Cổ cho bản thân",
        bCheck = true,
        bChecked = MacroOptions.autoPhuongHoangCo,
        fnAction = function()
          if not MacroOptions.autoPhuongHoangCo then
            MacroOptions.autoPhuongHoangCo=true
            OutputMessage("MSG_SYS","[Tự buff Phượng Hoàng Cổ cho bản thân] > ON\n")
          else
            MacroOptions.autoPhuongHoangCo=false
            OutputMessage("MSG_SYS","[Tự buff Phượng Hoàng Cổ cho bản thân] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuNguDocDK,{bDevide=true})
    table.insert(menuNguDocDK,
      {
        szOption = "Tự dùng Đoạt Mệnh Cổ hoặc Khô Tàn Cổ tùy theo tình huống",
        bMCheck = true,
        bChecked = MacroOptions.autoDoatMenhCo==false and MacroOptions.autoKhoTanCo==false and MacroOptions.autoMeTamCo==false,
        fnAction = function()
          if MacroOptions.autoDoatMenhCo then
            MacroOptions.autoDoatMenhCo=false
            OutputMessage("MSG_SYS","[Tự dùng Đoạt Mệnh Cổ hoặc Khô Tàn Cổ tùy theo tình huống] > ON\n")
          elseif MacroOptions.autoKhoTanCo then
            MacroOptions.autoKhoTanCo=false
            OutputMessage("MSG_SYS","[Tự dùng Đoạt Mệnh Cổ hoặc Khô Tàn Cổ tùy theo tình huống] > ON\n")
          elseif MacroOptions.autoMeTamCo then
            MacroOptions.autoMeTamCo=false
            OutputMessage("MSG_SYS","[Tự dùng Đoạt Mệnh Cổ hoặc Khô Tàn Cổ tùy theo tình huống] > ON\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuNguDocDK,
      {
        szOption = "Chỉ dùng Đoạt Mệnh Cổ",
        bMCheck = true,
        bChecked = MacroOptions.autoDoatMenhCo,
        fnAction = function()
          if not MacroOptions.autoDoatMenhCo then
            MacroOptions.autoDoatMenhCo=true
            OutputMessage("MSG_SYS","[Chỉ dùng Đoạt Mệnh Cổ] > ON\n")
            if MacroOptions.autoKhoTanCo then
              MacroOptions.autoKhoTanCo=false
            elseif MacroOptions.autoMeTamCo then
              MacroOptions.autoMeTamCo=false
            end
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuNguDocDK,
      {
        szOption = "Chỉ dùng Mê Tâm Cổ",
        bMCheck = true,
        bChecked = MacroOptions.autoMeTamCo,
        fnAction = function()
          if not MacroOptions.autoMeTamCo then
            MacroOptions.autoMeTamCo=true
            OutputMessage("MSG_SYS","[Chỉ dùng Mê Tâm Cổ] > ON\n")
            if MacroOptions.autoDoatMenhCo then
              MacroOptions.autoDoatMenhCo=false
            elseif MacroOptions.autoKhoTanCo then
              MacroOptions.autoKhoTanCo=false
            end
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuNguDocDK,
      {
        szOption = "Chỉ dùng Khô Tàn Cổ",
        bMCheck = true,
        bChecked = MacroOptions.autoKhoTanCo,
        fnAction = function()
          if not MacroOptions.autoKhoTanCo then
            MacroOptions.autoKhoTanCo=true
            OutputMessage("MSG_SYS","[Chỉ dùng Khô Tàn Cổ] > ON\n")
            if MacroOptions.autoDoatMenhCo then
              MacroOptions.autoDoatMenhCo=false
            elseif MacroOptions.autoMeTamCo then
              MacroOptions.autoMeTamCo=false
            end
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuNguDocDK,{bDevide=true})
    table.insert(menuNguDocDK,
      {
        szOption = "Chuyển target để buff Đoạt Mệnh Cổ cho bản thân",
        bCheck = true,
        bChecked = MacroOptions.autoSelfBuff,
        fnAction = function()
          if not MacroOptions.autoSelfBuff then
            MacroOptions.autoSelfBuff=true
            OutputMessage("MSG_SYS","[Chuyển target để buff Đoạt Mệnh Cổ cho bản thân] > ON\n")
          else
            MacroOptions.autoSelfBuff=false
            OutputMessage("MSG_SYS","[Chuyển target để buff Đoạt Mệnh Cổ cho bản thân] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuNguDocDK,
      {
        szOption = "Dùng Cổ Trùng Hiến Tế ngay khi có thể (không đợi cooldown Linh Xà)",
        bCheck = true,
        bChecked = MacroOptions.autoHienTe,
        fnAction = function()
          if not MacroOptions.autoHienTe then
            MacroOptions.autoHienTe=true
            OutputMessage("MSG_SYS","[Dùng Cổ Trùng Hiến Tế ngay khi có thể] > ON\n")
          else
            MacroOptions.autoHienTe=false
            OutputMessage("MSG_SYS","[Dùng Cổ Trùng Hiến Tế ngay khi có thể] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end,
      }
    )
    table.insert(menuNguDocDK,
      {
        szOption = "Dùng Thiên Ti trong combo",
        bCheck = true,
        bChecked = MacroOptions.autoThienTi,
        fnAction = function()
          if not MacroOptions.autoThienTi then
            MacroOptions.autoThienTi=true
            OutputMessage("MSG_SYS","[Dùng Thiên Ti trong combo] > ON\n")
          else
            MacroOptions.autoThienTi=false
            OutputMessage("MSG_SYS","[Dùng Thiên Ti trong combo] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuNguDocDK,
      {
        szOption = "Rebuff Xà Ảnh trước khi pet kích hoạt sát thương",
        bCheck = true,
        bChecked = MacroOptions.rebuffXaAnh,
        fnAction = function()
          if not MacroOptions.rebuffXaAnh then
            MacroOptions.rebuffXaAnh=true
            MacroOptions.bLatencyCompensation=false
            OutputMessage("MSG_SYS","[Rebuff Xà Ảnh trước khi pet kích hoạt sát thương] > ON\n")
          else
            MacroOptions.rebuffXaAnh=false
            MacroOptions.bLatencyCompensation=true
            OutputMessage("MSG_SYS","[Rebuff Xà Ảnh trước khi pet kích hoạt sát thương] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    local menuNguDocBTQ = {
      szOption = "Ngũ Độc - Bổ Thiên Quyết",
      bCheck = false,
      bChecked = false
    }
    table.insert(menuNguDocBTQ,menuSwapWeapon2)
    table.insert(menu,{bDevide=true})
    table.insert(menu,
      {
        szOption = "Thiết lập phím tắt cho các lựa chọn bên dưới",r=255,g=255,b=0,
        bCheck = false,
        bChecked = false,
        fnAction = function()
          HotkeyPanel_Open("Macro Ngũ Độc")
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menu, menuNguDocDK)
    table.insert(menu, menuNguDocBTQ)
  elseif NoiCong==10003 or NoiCong==10002 then
    local menuThieuLamDCK = {
      szOption = "Thiếu Lâm - Dịch Cân Kinh",
      bCheck = false,
      bChecked = false
    }
    table.insert(menuThieuLamDCK,menuSwapWeapon1)
    table.insert(menuThieuLamDCK,{bDevide=true})
    table.insert(menuThieuLamDCK,
      {
        szOption = "Tự buff Vô Tướng Quyết (giảm 50% sát thương) khi HP<30%",
        bCheck = true,
        bChecked = MacroOptions.autoVoTuongQuyetDCK,
        fnAction = function()
          if not MacroOptions.autoVoTuongQuyetDCK then
            MacroOptions.autoVoTuongQuyetDCK=true
            OutputMessage("MSG_SYS","[Tự buff Vô Tướng Quyết khi HP<30%] > ON\n")
          else
            MacroOptions.autoVoTuongQuyetDCK=false
            OutputMessage("MSG_SYS","[Tự buff Vô Tướng Quyết khi HP<30%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThieuLamDCK,
      {
        szOption = "Tự buff Diệc Khô Diệc Vinh khi MP<30%",
        bCheck = true,
        bChecked = MacroOptions.autoDiecKhoDiecVinh,
        fnAction = function()
          if not MacroOptions.autoDiecKhoDiecVinh then
            MacroOptions.autoDiecKhoDiecVinh=true
            OutputMessage("MSG_SYS","[Tự buff Diệc Khô Diệc Vinh khi MP<30%] > ON\n")
          else
            MacroOptions.autoDiecKhoDiecVinh=false
            OutputMessage("MSG_SYS","[Tự buff Diệc Khô Diệc Vinh khi MP<30%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThieuLamDCK,{bDevide=true})
    table.insert(menuThieuLamDCK,
      {
        szOption = "Tự buff Bát Nhã Quyết",
        bCheck = true,
        bChecked = MacroOptions.autoBatNhaQuyetDCK,
        fnAction = function()
          if not MacroOptions.autoBatNhaQuyetDCK then
            MacroOptions.autoBatNhaQuyetDCK=true
            OutputMessage("MSG_SYS","[Tự buff Bát Nhã Quyết] > ON\n")
          else
            MacroOptions.autoBatNhaQuyetDCK=false
            OutputMessage("MSG_SYS","[Tự buff Bát Nhã Quyết] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThieuLamDCK,
      {
        szOption = "Tự buff Phật Tâm Quyết (giảm uy hiếp)",
        bCheck = true,
        bChecked = MacroOptions.autoPhatTamQuyetDCK,
        fnAction = function()
          if not MacroOptions.autoPhatTamQuyetDCK then
            MacroOptions.autoPhatTamQuyetDCK=true
            OutputMessage("MSG_SYS","[Tự buff Phật Tâm Quyết] > ON\n")
          else
            MacroOptions.autoPhatTamQuyetDCK=false
            OutputMessage("MSG_SYS","[Tự buff Phật Tâm Quyết] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThieuLamDCK,{bDevide=true})
    table.insert(menuThieuLamDCK,
      {
        szOption = "Tự bật Kim Cương Nộ Mục 3 điểm thiền",
        bCheck = true,
        bChecked = MacroOptions.autoKimCuongNoMuc,
        fnAction = function()
          if not MacroOptions.autoKimCuongNoMuc then
            MacroOptions.autoKimCuongNoMuc=true
            OutputMessage("MSG_SYS","[Tự bật Kim Cương Nộ Mục] > ON\n")
          else
            MacroOptions.autoKimCuongNoMuc=false
            OutputMessage("MSG_SYS","[Tự bật Kim Cương Nộ Mục] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThieuLamDCK,
      {
        szOption = "Tự dùng Cầm Long Quyết",
        bCheck = true,
        bChecked = MacroOptions.autoCamLongQuyetDCK,
        fnAction = function()
          if not MacroOptions.autoCamLongQuyetDCK then
            MacroOptions.autoCamLongQuyetDCK=true
            OutputMessage("MSG_SYS","[Tự dùng Cầm Long Quyết] > ON\n")
          else
            MacroOptions.autoCamLongQuyetDCK=false
            OutputMessage("MSG_SYS","[Tự dùng Cầm Long Quyết] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    local menuThieuLamTTK = {
      szOption = "Thiếu Lâm - Tẩy Tủy Kinh",
      bCheck = false,
      bChecked = false
    }
    table.insert(menuThieuLamTTK,menuSwapWeapon2)
    table.insert(menuThieuLamTTK,{bDevide=true})
    table.insert(menuThieuLamTTK,
      {
        szOption = "Tự buff Tụ Nạp Càn Khôn khi HP<50%",
        bCheck = true,
        bChecked = MacroOptions.autoTuNapCanKhon,
        fnAction = function()
          if not MacroOptions.autoTuNapCanKhon then
            MacroOptions.autoTuNapCanKhon=true
            OutputMessage("MSG_SYS","[Tự buff Tụ Nạp Càn Khôn khi HP<50%] > ON\n")
          else
            MacroOptions.autoTuNapCanKhon=false
            OutputMessage("MSG_SYS","[Tự buff Tụ Nạp Càn Khôn khi HP<50%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThieuLamTTK,
      {
        szOption = "Tự buff Vô Tướng Quyết (giảm 50% sát thương) khi HP<50%",
        bCheck = true,
        bChecked = MacroOptions.autoVoTuongQuyetTTK,
        fnAction = function()
          if not MacroOptions.autoVoTuongQuyetTTK then
            MacroOptions.autoVoTuongQuyetTTK=true
            OutputMessage("MSG_SYS","[Tự buff Vô Tướng Quyết khi HP<50%] > ON\n")
          else
            MacroOptions.autoVoTuongQuyetTTK=false
            OutputMessage("MSG_SYS","[Tự buff Vô Tướng Quyết khi HP<50%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThieuLamTTK,{bDevide=true})
    table.insert(menuThieuLamTTK,
      {
        szOption = "Tự buff Bát Nhã Quyết",
        bCheck = true,
        bChecked = MacroOptions.autoBatNhaQuyetTTK,
        fnAction = function()
          if not MacroOptions.autoBatNhaQuyetTTK then
            MacroOptions.autoBatNhaQuyetTTK=true
            OutputMessage("MSG_SYS","[Tự buff Bát Nhã Quyết] > ON\n")
          else
            MacroOptions.autoBatNhaQuyetTTK=false
            OutputMessage("MSG_SYS","[Tự buff Bát Nhã Quyết] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThieuLamTTK,
      {
        szOption = "Tự buff Phật Tâm Quyết (tăng uy hiếp)",
        bCheck = true,
        bChecked = MacroOptions.autoPhatTamQuyetTTK,
        fnAction = function()
          if not MacroOptions.autoPhatTamQuyetTTK then
            MacroOptions.autoPhatTamQuyetTTK=true
            OutputMessage("MSG_SYS","[Tự buff Phật Tâm Quyết] > ON\n")
          else
            MacroOptions.autoPhatTamQuyetTTK=false
            OutputMessage("MSG_SYS","[Tự buff Phật Tâm Quyết] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThieuLamTTK,{bDevide=true})
    table.insert(menuThieuLamTTK,
      {
        szOption = "Tự dùng Cầm Long Quyết (hồi 3 điểm thiền định ngay lập tức)",
        bCheck = true,
        bChecked = MacroOptions.autoCamLongQuyetTTK,
        fnAction = function()
          if not MacroOptions.autoCamLongQuyetTTK then
            MacroOptions.autoCamLongQuyetTTK=true
            OutputMessage("MSG_SYS","[Tự dùng Cầm Long Quyết] > ON\n")
          else
            MacroOptions.autoCamLongQuyetTTK=false
            OutputMessage("MSG_SYS","[Tự dùng Cầm Long Quyết] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThieuLamTTK,
      {
        szOption = "Tự dùng Quỷ Khứ Lai Côn khi BOSS chuyển target khỏi bản thân",
        bCheck = true,
        bChecked = MacroOptions.autoQuyKhuLaiCon,
        fnAction = function()
          if not MacroOptions.autoQuyKhuLaiCon then
            MacroOptions.autoQuyKhuLaiCon=true
            OutputMessage("MSG_SYS","[Tự dùng Quỷ Khứ Lai Côn khi BOSS chuyển target khỏi bản thân] > ON\n")
          else
            MacroOptions.autoQuyKhuLaiCon=false
            OutputMessage("MSG_SYS","[Tự dùng Quỷ Khứ Lai Côn khi BOSS chuyển target khỏi bản thân] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuThieuLamTTK,
      {
        szOption = "Tự dùng Đại Sư Tử Hống khi cầm trận và cừu hận top 2 > 70%",
        bCheck = true,
        bChecked = MacroOptions.autoDaiSuTuHong,
        fnAction = function()
          if not MacroOptions.autoDaiSuTuHong then
            MacroOptions.autoDaiSuTuHong=true
            OutputMessage("MSG_SYS","[Tự dùng Đại Sư Tử Hống khi cầm trận và cừu hận top 2 > 70%] > ON\n")
          else
            MacroOptions.autoDaiSuTuHong=false
            OutputMessage("MSG_SYS","[Tự dùng Đại Sư Tử Hống khi cầm trận và cừu hận top 2 > 70%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menu,{bDevide=true})
    table.insert(menu,
      {
        szOption = "Thiết lập phím tắt cho các lựa chọn bên dưới",r=255,g=255,b=0,
        bCheck = false,
        bChecked = false,
        fnAction = function()
          HotkeyPanel_Open("Macro Thiếu Lâm")
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menu, menuThieuLamDCK)
    table.insert(menu, menuThieuLamTTK)
  elseif NoiCong==10268 then
    local menuCaiBang = {
      szOption = "Cái Bang - Tiếu Trần Quyết",
      bCheck = false,
      bChecked = false
    }
    table.insert(menuCaiBang,menuSwapWeapon1)
    table.insert(menuCaiBang,{bDevide=true})
    table.insert(menuCaiBang,
      {
        szOption = "Tự bật Tiếu Túy Cuồng khi HP<30%",
        bCheck = true,
        bChecked = MacroOptions.autoTieuTuyCuong,
        fnAction = function()
          if not MacroOptions.autoTieuTuyCuong then
            MacroOptions.autoTieuTuyCuong=true
            OutputMessage("MSG_SYS","[Tự bật Tiếu Túy Cuồng khi HP<30%] > ON\n")
          else
            MacroOptions.autoTieuTuyCuong=false
            OutputMessage("MSG_SYS","[Tự bật Tiếu Túy Cuồng khi HP<30%] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuCaiBang,{bDevide=true})
    table.insert(menuCaiBang,
      {
        szOption = "Tự dùng Tửu Trung Tiên (tăng 20% bạo kích ngoại)",
        bCheck = true,
        bChecked = MacroOptions.autoTuuTrungTien,
        fnAction = function()
          if not MacroOptions.autoTuuTrungTien then
            MacroOptions.autoTuuTrungTien=true
            OutputMessage("MSG_SYS","[Tự dùng Tửu Trung Tiên (tăng 20% bạo kích ngoại)] > ON\n")
          else
            MacroOptions.autoTuuTrungTien=false
            OutputMessage("MSG_SYS","[Tự dùng Tửu Trung Tiên (tăng 20% bạo kích ngoại)] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuCaiBang,
      {
        szOption = "Dùng Bổng Đả Cẩu Đầu để tích nội lực",
        bCheck = true,
        bChecked = MacroOptions.autoBongDaCauDau1,
        fnAction = function()
          if not MacroOptions.autoBongDaCauDau1 then
            MacroOptions.autoBongDaCauDau1=true
            OutputMessage("MSG_SYS","[Dùng Bổng Đả Cẩu Đầu để tích nội lực] > ON\n")
            if MacroOptions.autoSkillInterrupt then
              MacroOptions.autoSkillInterrupt=false
              OutputMessage("MSG_SYS","[Tự ngắt skill BOSS] > OFF\n")
            end
          else
            MacroOptions.autoBongDaCauDau1=false
            OutputMessage("MSG_SYS","[Dùng Bổng Đả Cẩu Đầu để tích nội lực] > OFF\n")
            if not MacroOptions.autoSkillInterrupt then
              MacroOptions.autoSkillInterrupt=true
              OutputMessage("MSG_SYS","[Tự ngắt skill BOSS] > ON\n")
            end
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuCaiBang,
      {
        szOption = "Dùng Bổng Đả Cẩu Đầu để áp sát",
        bCheck = true,
        bChecked = MacroOptions.autoBongDaCauDau2,
        fnAction = function()
          if not MacroOptions.autoBongDaCauDau2 then
            MacroOptions.autoBongDaCauDau2=true
            OutputMessage("MSG_SYS","[Dùng Bổng Đả Cẩu Đầu để áp sát] > ON\n")
            if MacroOptions.autoSkillInterrupt then
              MacroOptions.autoSkillInterrupt=false
              OutputMessage("MSG_SYS","[Tự ngắt skill BOSS] > OFF\n")
            end
          else
            MacroOptions.autoBongDaCauDau2=false
            OutputMessage("MSG_SYS","[Dùng Bổng Đả Cẩu Đầu để áp sát] > OFF\n")
            if not MacroOptions.autoSkillInterrupt then
              MacroOptions.autoSkillInterrupt=true
              OutputMessage("MSG_SYS","[Tự ngắt skill BOSS] > ON\n")
            end
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuCaiBang,
      {
        szOption = "Dùng Yên Vũ Hành để áp sát",
        bCheck = true,
        bChecked = MacroOptions.autoYenVuHanh,
        fnAction = function()
          if not MacroOptions.autoYenVuHanh then
            MacroOptions.autoYenVuHanh=true
            OutputMessage("MSG_SYS","[Dùng Yên Vũ Hành để áp sát] > ON\n")
          else
            MacroOptions.autoYenVuHanh=false
            OutputMessage("MSG_SYS","[Dùng Yên Vũ Hành để áp sát] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuCaiBang,
      {
        szOption = "Tự dùng Thiêm Chuẩn Kích",
        bCheck = true,
        bChecked = MacroOptions.autoThiemChuanKich,
        fnAction = function()
          if not MacroOptions.autoThiemChuanKich then
            MacroOptions.autoThiemChuanKich=true
            OutputMessage("MSG_SYS","[Tự dùng Thiêm Chuẩn Kích] > ON\n")
          else
            MacroOptions.autoThiemChuanKich=false
            OutputMessage("MSG_SYS","[Tự dùng Thiêm Chuẩn Kích] > OFF\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuCaiBang,{bDevide=true})
    table.insert(menuCaiBang,
      {
        szOption = "Chế độ tích nhanh 8 tầng DOT Kháng Long Hữu Hối",
        bMCheck = true,
        bChecked = MacroOptions.attackMode==1,
        fnAction = function()
          if MacroOptions.attackMode~=1 then
            MacroOptions.attackMode=1
            OutputMessage("MSG_SYS","[Chế độ tích nhanh 8 tầng DOT Kháng Long Hữu Hối] > ON\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menuCaiBang,
      {
        szOption = "Chế độ đánh combo đầy đủ (luôn đánh Giao Long Phiên Giang)",
        bMCheck = true,
        bChecked = MacroOptions.attackMode==2,
        fnAction = function()
          if MacroOptions.attackMode~=2 then
            MacroOptions.attackMode=2
            OutputMessage("MSG_SYS","[Chế độ đánh combo đầy đủ (luôn đánh Giao Long Phiên Giang)] > ON\n")
          end
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menu,{bDevide=true})
    table.insert(menu,
      {
        szOption = "Thiết lập phím tắt cho các lựa chọn bên dưới",r=255,g=255,b=0,
        bCheck = false,
        bChecked = false,
        fnAction = function()
          HotkeyPanel_Open("Macro Cái Bang")
        end,
        fnAutoClose = function() return true end
      }
    )
    table.insert(menu, menuCaiBang)
  end
  return menu
end

local menu = {
  function()
    return { MacroOptions.CreateMenu() }
  end
}

Player_AppendAddonMenu(menu)

AppendCommand("macro", function()
  macro()
end)

Hotkey.AddBinding("AutoHotkey","Kích hoạt/Dừng AutoHotkey",MacroOptions.szTitle,
  function()
    if not MacroOptions.autoHotkey then
      MacroOptions.autoHotkey=true
      OutputMessage("MSG_SYS","Đã kích hoạt AutoHotkey\n")
    else
      MacroOptions.autoHotkey=false
      OutputMessage("MSG_SYS","Đã dừng AutoHotkey\n")
    end
  end,
nil)
Hotkey.AddBinding("autoUseWeapon","Tự sử dụng skill đặc biệt của vũ khí chính","",
  function()
    if not MacroOptions.autoUseWeapon then
      MacroOptions.autoUseWeapon=true
      OutputMessage("MSG_SYS","[Tự sử dụng skill đặc biệt của vũ khí chính] > ON\n")
    else
      MacroOptions.autoUseWeapon=false
      OutputMessage("MSG_SYS","[Tự sử dụng skill đặc biệt của vũ khí chính] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoUseAmulet","Tự sử dụng dây chuyền có dòng đặc biệt","",
  function()
    if not MacroOptions.autoUseAmulet then
      MacroOptions.autoUseAmulet=true
      OutputMessage("MSG_SYS","[Tự sử dụng dây chuyền có dòng đặc biệt] > ON\n")
    else
      MacroOptions.autoUseAmulet=false
      OutputMessage("MSG_SYS","[Tự sử dụng dây chuyền có dòng đặc biệt] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoUsePendant","Tự sử dụng yêu trụy có dòng đặc biệt","",
  function()
    if not MacroOptions.autoUsePendant then
      MacroOptions.autoUsePendant=true
      OutputMessage("MSG_SYS","[Tự sử dụng yêu trụy có dòng đặc biệt] > ON\n")
    else
      MacroOptions.autoUsePendant=false
      OutputMessage("MSG_SYS","[Tự sử dụng yêu trụy có dòng đặc biệt] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoSkillInterrupt","Tự ngắt skill khi BOSS vận công","",
  function()
    if not MacroOptions.autoSkillInterrupt then
      MacroOptions.autoSkillInterrupt=true
      OutputMessage("MSG_SYS","[Tự sử dụng các skill kinh mạch cơ bản] > ON\n")
    else
      MacroOptions.autoSkillInterrupt=false
      OutputMessage("MSG_SYS","[Tự sử dụng các skill kinh mạch cơ bản] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoClearBuff","Tự xóa buff có lợi của BOSS","",
  function()
    if not MacroOptions.autoClearBuff then
      MacroOptions.autoClearBuff=true
      OutputMessage("MSG_SYS","[Tự xóa buff có lợi của BOSS] > ON\n")
    else
      MacroOptions.autoClearBuff=false
      OutputMessage("MSG_SYS","[Tự xóa buff có lợi của BOSS] > OFF\n")
    end
  end,
nil)
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
Hotkey.AddBinding("autoVTBKMode","Chuyển chế độ đánh Vạn Thế Bất Kiệt","Macro Thuần Dương",
  function()
    if MacroOptions.autoVTBKMode==2 then
      MacroOptions.autoVTBKMode=0
      OutputMessage("MSG_SYS","Đã lựa chọn [Không đánh Vạn Thế Bất Kiệt]\n")
    elseif MacroOptions.autoVTBKMode==0 then
      MacroOptions.autoVTBKMode=1
      OutputMessage("MSG_SYS","Đã lựa chọn [Chỉ đánh Vạn Thế Bất Kiệt khi hết Khí Kiệt]\n")
    elseif MacroOptions.autoVTBKMode==1 then
      MacroOptions.autoVTBKMode=2
      OutputMessage("MSG_SYS","Đã lựa chọn [Luôn đánh Vạn Thế Bất Kiệt]\n")
    end
  end,
nil)
Hotkey.AddBinding("autoToaVongVoNga","Tự bật Tọa Vọng Vô Ngã","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10014 then
      if not MacroOptions.autoToaVongVoNgaTHC then
        MacroOptions.autoToaVongVoNgaTHC=true
        OutputMessage("MSG_SYS","[Tự bật Tọa Vọng Vô Ngã] > ON\n")
      else
        MacroOptions.autoToaVongVoNgaTHC=false
        OutputMessage("MSG_SYS","[Tự bật Tọa Vọng Vô Ngã] > OFF\n")
      end
    elseif NoiCong==10015 then
      if not MacroOptions.autoToaVongVoNgaTHKY then
        MacroOptions.autoToaVongVoNgaTHKY=true
        OutputMessage("MSG_SYS","[Tự bật Tọa Vọng Vô Ngã] > ON\n")
      else
        MacroOptions.autoToaVongVoNgaTHKY=false
        OutputMessage("MSG_SYS","[Tự bật Tọa Vọng Vô Ngã] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoTuKhiDongLai","Tự bật Từ Khí Đông Lai","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10014 then
      if not MacroOptions.autoTuKhiDongLaiTHC then
        MacroOptions.autoTuKhiDongLaiTHC=true
        OutputMessage("MSG_SYS","[Tự bật Từ Khí Đông Lai] > ON\n")
      else
        MacroOptions.autoTuKhiDongLaiTHC=false
        OutputMessage("MSG_SYS","[Tự bật Từ Khí Đông Lai] > OFF\n")
      end
    elseif NoiCong==10015 then
      if not MacroOptions.autoTuKhiDongLaiTHKY then
        MacroOptions.autoTuKhiDongLaiTHKY=true
        OutputMessage("MSG_SYS","[Tự bật Từ Khí Đông Lai] > ON\n")
      else
        MacroOptions.autoTuKhiDongLaiTHKY=false
        OutputMessage("MSG_SYS","[Tự bật Từ Khí Đông Lai] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoThaoQuangDuongHoi","Tự bật Thao Quang Dưỡng Hối","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10014 then
      if not MacroOptions.autoThaoQuangDuongHoiTHC then
        MacroOptions.autoThaoQuangDuongHoiTHC=true
        OutputMessage("MSG_SYS","[Tự bật Thao Quang Dưỡng Hối] > ON\n")
      else
        MacroOptions.autoThaoQuangDuongHoiTHC=false
        OutputMessage("MSG_SYS","[Tự bật Thao Quang Dưỡng Hối] > OFF\n")
      end
    elseif NoiCong==10015 then
      if not MacroOptions.autoThaoQuangDuongHoiTHKY then
        MacroOptions.autoThaoQuangDuongHoiTHKY=true
        OutputMessage("MSG_SYS","[Tự bật Thao Quang Dưỡng Hối] > ON\n")
      else
        MacroOptions.autoThaoQuangDuongHoiTHKY=false
        OutputMessage("MSG_SYS","[Tự bật Thao Quang Dưỡng Hối] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoBaoNguyenThuKhuyet","Tự dùng Bão Nguyên Thủ Khuyết khi MP<10%","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10014 then
      if not MacroOptions.autoBaoNguyenThuKhuyetTHC then
        MacroOptions.autoBaoNguyenThuKhuyetTHC=true
        OutputMessage("MSG_SYS","[Tự dùng Bão Nguyên Thủ Khuyết khi MP<10%] > ON\n")
      else
        MacroOptions.autoBaoNguyenThuKhuyetTHC=false
        OutputMessage("MSG_SYS","[Tự dùng Bão Nguyên Thủ Khuyết khi MP<10%] > OFF\n")
      end
    elseif NoiCong==10015 then
      if not MacroOptions.autoBaoNguyenThuKhuyetTHKY then
        MacroOptions.autoBaoNguyenThuKhuyetTHKY=true
        OutputMessage("MSG_SYS","[Tự dùng Bão Nguyên Thủ Khuyết khi MP<10%] > ON\n")
      else
        MacroOptions.autoBaoNguyenThuKhuyetTHKY=false
        OutputMessage("MSG_SYS","[Tự dùng Bão Nguyên Thủ Khuyết khi MP<10%] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoBangHuNguPhong","Tự bật Bằng Hư Ngự Phong giảm uy hiếp","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10014 then
      if not MacroOptions.autoBangHuNguPhongTHC then
        MacroOptions.autoBangHuNguPhongTHC=true
        OutputMessage("MSG_SYS","[Tự bật Bằng Hư Ngự Phong giảm uy hiếp] > ON\n")
      else
        MacroOptions.autoBangHuNguPhongTHC=false
        OutputMessage("MSG_SYS","[Tự bật Bằng Hư Ngự Phong giảm uy hiếp] > OFF\n")
      end
    elseif NoiCong==10015 then
      if not MacroOptions.autoBangHuNguPhongTHKY then
        MacroOptions.autoBangHuNguPhongTHKY=true
        OutputMessage("MSG_SYS","[Tự bật Bằng Hư Ngự Phong giảm uy hiếp] > ON\n")
      else
        MacroOptions.autoBangHuNguPhongTHKY=false
        OutputMessage("MSG_SYS","[Tự bật Bằng Hư Ngự Phong giảm uy hiếp] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoHoaTamThanh","Tự cắm Hóa Tam Thanh","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10014 then
      if not MacroOptions.autoHoaTamThanhTHC and MacroOptions.totalGasFieldTHC>=3 then
        OutputMessage("MSG_SYS","Chỉ có thể cắm cùng lúc tối đa 3 khí trường. Hãy lựa chọn lại.\n")
      elseif not MacroOptions.autoHoaTamThanhTHC and MacroOptions.totalGasFieldTHC<3 then
        MacroOptions.autoHoaTamThanhTHC=true
        MacroOptions.totalGasFieldTHC=MacroOptions.totalGasFieldTHC+1
        OutputMessage("MSG_SYS","[Tự cắm Hóa Tam Thanh] > ON\n")
      else
        MacroOptions.autoHoaTamThanhTHC=false
        MacroOptions.totalGasFieldTHC=MacroOptions.totalGasFieldTHC-1
        OutputMessage("MSG_SYS","[Tự cắm Hóa Tam Thanh] > OFF\n")
      end
    elseif NoiCong==10015 then
      if not MacroOptions.autoHoaTamThanhTHKY and MacroOptions.totalGasFieldTHKY>=3 then
        OutputMessage("MSG_SYS","Chỉ có thể cắm cùng lúc tối đa 3 khí trường. Hãy lựa chọn lại.\n")
      elseif not MacroOptions.autoHoaTamThanhTHKY and MacroOptions.totalGasFieldTHKY<3 then
        MacroOptions.autoHoaTamThanhTHKY=true
        MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY+1
        OutputMessage("MSG_SYS","[Tự cắm Hóa Tam Thanh] > ON\n")
      else
        MacroOptions.autoHoaTamThanhTHKY=false
        MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY-1
        OutputMessage("MSG_SYS","[Tự cắm Hóa Tam Thanh] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoSinhThaiCuc","Tự cắm Sinh Thái Cực","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10014 then
      if not MacroOptions.autoSinhThaiCucTHC and MacroOptions.totalGasFieldTHC>=3 then
        OutputMessage("MSG_SYS","Chỉ có thể cắm cùng lúc tối đa 3 khí trường. Hãy lựa chọn lại.\n")
      elseif not MacroOptions.autoSinhThaiCucTHC and MacroOptions.totalGasFieldTHC<3 then
        MacroOptions.autoSinhThaiCucTHC=true
        MacroOptions.totalGasFieldTHC=MacroOptions.totalGasFieldTHC+1
        OutputMessage("MSG_SYS","[Tự cắm Sinh Thái Cực] > ON\n")
      else
        MacroOptions.autoSinhThaiCucTHC=false
        MacroOptions.totalGasFieldTHC=MacroOptions.totalGasFieldTHC-1
        OutputMessage("MSG_SYS","[Tự cắm Sinh Thái Cực] > OFF\n")
      end
    elseif NoiCong==10015 then
      if not MacroOptions.autoSinhThaiCucTHKY and MacroOptions.totalGasFieldTHKY>=3 then
        OutputMessage("MSG_SYS","Chỉ có thể cắm cùng lúc tối đa 3 khí trường. Hãy lựa chọn lại.\n")
      elseif not MacroOptions.autoSinhThaiCucTHKY and MacroOptions.totalGasFieldTHKY<3 then
        MacroOptions.autoSinhThaiCucTHKY=true
        MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY+1
        OutputMessage("MSG_SYS","[Tự cắm Sinh Thái Cực] > ON\n")
      else
        MacroOptions.autoSinhThaiCucTHKY=false
        MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY-1
        OutputMessage("MSG_SYS","[Tự cắm Sinh Thái Cực] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoPhaThuongKhung","Tự cắm Phá Thương Khung","",
  function()
    if not MacroOptions.autoPhaThuongKhung and MacroOptions.totalGasFieldTHC>=3 then
      OutputMessage("MSG_SYS","Chỉ có thể cắm cùng lúc tối đa 3 khí trường. Hãy lựa chọn lại.\n")
    elseif not MacroOptions.autoPhaThuongKhung and MacroOptions.totalGasFieldTHC<3 then
      MacroOptions.autoPhaThuongKhung=true
      MacroOptions.totalGasFieldTHC=MacroOptions.totalGasFieldTHC+1
      OutputMessage("MSG_SYS","[Tự cắm Phá Thương Khung] > ON\n")
    else
      MacroOptions.autoPhaThuongKhung=false
      MacroOptions.totalGasFieldTHC=MacroOptions.totalGasFieldTHC-1
      OutputMessage("MSG_SYS","[Tự cắm Phá Thương Khung] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoXungAmDuong","Tự cắm Xung Âm Dương","",
  function()
    if not MacroOptions.autoXungAmDuong and MacroOptions.totalGasFieldTHC>=3 then
      OutputMessage("MSG_SYS","Chỉ có thể cắm cùng lúc tối đa 3 khí trường. Hãy lựa chọn lại.\n")
    elseif not MacroOptions.autoXungAmDuong and MacroOptions.totalGasFieldTHC<3 then
      MacroOptions.autoXungAmDuong=true
      MacroOptions.totalGasFieldTHC=MacroOptions.totalGasFieldTHC+1
      OutputMessage("MSG_SYS","[Tự cắm Xung Âm Dương] > ON\n")
    else
      MacroOptions.autoXungAmDuong=false
      MacroOptions.totalGasFieldTHC=MacroOptions.totalGasFieldTHC-1
      OutputMessage("MSG_SYS","[Tự cắm Xung Âm Dương] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoTranSonHa","Tự cắm Trấn Sơn Hà khi HP<30%","",
  function()
    if not MacroOptions.autoTranSonHa then
      MacroOptions.autoTranSonHa=true
      OutputMessage("MSG_SYS","[Tự cắm Trấn Sơn Hà khi HP<30%] > ON\n")
    else
      MacroOptions.autoTranSonHa=false
      OutputMessage("MSG_SYS","[Tự cắm Trấn Sơn Hà khi HP<30%] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoCuuChuyenQuyNhat","Cửu Chuyển Quy Nhất, Tam Tài Hóa Sinh khi cách mục tiêu < 8m","",
  function()
    if not MacroOptions.autoCuuChuyenQuyNhat then
      MacroOptions.autoCuuChuyenQuyNhat=true
      OutputMessage("MSG_SYS","[Tự đánh Cửu Chuyển Quy Nhất, Tam Tài Hóa Sinh khi cách mục tiêu < 8m] > ON\n")
    else
      MacroOptions.autoCuuChuyenQuyNhat=false
      OutputMessage("MSG_SYS","[Tự đánh Cửu Chuyển Quy Nhất, Tam Tài Hóa Sinh khi cách mục tiêu < 8m] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoStopTTLH","Tự dừng vận công TTLH khi đủ 5 ô khí","",
  function()
    if not MacroOptions.autoStopTTLH then
      MacroOptions.autoStopTTLH=true
      OutputMessage("MSG_SYS","[Tự dừng vận công Tứ Tượng Luân Hồi khi đủ 5 ô khí] > ON\n")
    else
      MacroOptions.autoStopTTLH=false
      OutputMessage("MSG_SYS","[Tự dừng vận công Tứ Tượng Luân Hồi khi đủ 5 ô khí] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoNguPhuongHanhTan","Tự dùng Ngũ Phương Hành Tận 5 ô khí","",
  function()
    if not MacroOptions.autoNguPhuongHanhTan then
      MacroOptions.autoNguPhuongHanhTan=true
      OutputMessage("MSG_SYS","[Tự dùng Ngũ Phương Hành Tận 5 ô khí] > ON\n")
    else
      MacroOptions.autoNguPhuongHanhTan=false
      OutputMessage("MSG_SYS","[Tự dùng Ngũ Phương Hành Tận 5 ô khí] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoThonNhatNguyet","Tự cắm Thôn Nhật Nguyệt (ngay khi cooldown)","",
  function()
    if not MacroOptions.autoThonNhatNguyet and MacroOptions.totalGasFieldTHKY>=3 then
      OutputMessage("MSG_SYS","Chỉ có thể cắm cùng lúc tối đa 3 khí trường. Hãy lựa chọn lại.\n")
    elseif not MacroOptions.autoThonNhatNguyet and MacroOptions.totalGasFieldTHKY<3 then
      MacroOptions.autoThonNhatNguyet=true
      MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY+1
      OutputMessage("MSG_SYS","[Tự cắm Thôn Nhật Nguyệt (ngay khi cooldown)] > ON\n")
    else
      MacroOptions.autoThonNhatNguyet=false
      MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY-1
      OutputMessage("MSG_SYS","[Tự cắm Thôn Nhật Nguyệt (ngay khi cooldown)] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoToaiTinhThan","Tự cắm Toái Tinh Thần","",
  function()
    if not MacroOptions.autoToaiTinhThan and MacroOptions.totalGasFieldTHKY>=3 then
      OutputMessage("MSG_SYS","Chỉ có thể cắm cùng lúc tối đa 3 khí trường. Hãy lựa chọn lại.\n")
    elseif not MacroOptions.autoToaiTinhThan and MacroOptions.totalGasFieldTHKY<3 then
      MacroOptions.autoToaiTinhThan=true
      MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY+1
      OutputMessage("MSG_SYS","[Tự cắm Toái Tinh Thần] > ON\n")
    else
      MacroOptions.autoToaiTinhThan=false
      MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY-1
      OutputMessage("MSG_SYS","[Tự cắm Toái Tinh Thần] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoLangThaiHu","Tự cắm Lăng Thái Hư","",
  function()
    if not MacroOptions.autoLangThaiHu and MacroOptions.totalGasFieldTHKY>=3 then
      OutputMessage("MSG_SYS","Chỉ có thể cắm cùng lúc tối đa 3 khí trường. Hãy lựa chọn lại.\n")
    elseif not MacroOptions.autoLangThaiHu and MacroOptions.totalGasFieldTHKY<3 then
      MacroOptions.autoLangThaiHu=true
      MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY+1
      OutputMessage("MSG_SYS","[Tự cắm Lăng Thái Hư] > ON\n")
    else
      MacroOptions.autoLangThaiHu=false
      MacroOptions.totalGasFieldTHKY=MacroOptions.totalGasFieldTHKY-1
      OutputMessage("MSG_SYS","[Tự cắm Lăng Thái Hư] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoChuyenCanKhon","Tự bật Chuyển Càn Khôn khi HP<30%","",
  function()
    if not MacroOptions.autoChuyenCanKhon then
      MacroOptions.autoChuyenCanKhon=true
      OutputMessage("MSG_SYS","[Tự bật Chuyển Càn Khôn khi HP<30%] > ON\n")
    else
      MacroOptions.autoChuyenCanKhon=false
      OutputMessage("MSG_SYS","[Tự bật Chuyển Càn Khôn khi HP<30%] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoThienDiaVoCuc","Đánh Thiên Địa Vô Cực trong combo","",
  function()
    if not MacroOptions.autoThienDiaVoCuc then
      MacroOptions.autoThienDiaVoCuc=true
      OutputMessage("MSG_SYS","[Đánh Thiên Địa Vô Cực trong combo] > ON\n")
    else
      MacroOptions.autoThienDiaVoCuc=false
      OutputMessage("MSG_SYS","[Đánh Thiên Địa Vô Cực trong combo] > OFF\n")
    end
  end,
nil)
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
Hotkey.AddBinding("autoPhuQuangLuocAnh","Phù Quang Lược Ảnh khi cừu hận > 70%","Macro Đường Môn",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10224 then
      if not MacroOptions.autoPhuQuangLuocAnhKVQ then
        MacroOptions.autoPhuQuangLuocAnhKVQ=true
        OutputMessage("MSG_SYS","[Phù Quang Lược Ảnh khi cừu hận > 70%] > ON\n")
      else
        MacroOptions.autoPhuQuangLuocAnhKVQ=false
        OutputMessage("MSG_SYS","[Phù Quang Lược Ảnh khi cừu hận > 70%] > OFF\n")
      end
    elseif NoiCong==10225 then
      if not MacroOptions.autoPhuQuangLuocAnhTLND then
        MacroOptions.autoPhuQuangLuocAnhTLND=true
        OutputMessage("MSG_SYS","[Phù Quang Lược Ảnh khi cừu hận > 70%] > ON\n")
      else
        MacroOptions.autoPhuQuangLuocAnhTLND=false
        OutputMessage("MSG_SYS","[Phù Quang Lược Ảnh khi cừu hận > 70%] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoKinhHongDuLong","Kinh Hồng Du Long khi cần thiết","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10224 then
      if not MacroOptions.autoKinhHongDuLongKVQ then
        MacroOptions.autoKinhHongDuLongKVQ=true
        OutputMessage("MSG_SYS","[Tự bật Kinh Hồng Du Long khi cần thiết] > ON\n")
      else
        MacroOptions.autoKinhHongDuLongKVQ=false
        OutputMessage("MSG_SYS","[Tự bật Kinh Hồng Du Long khi cần thiết] > OFF\n")
      end
    elseif NoiCong==10225 then
      if not MacroOptions.autoKinhHongDuLongTLND then
        MacroOptions.autoKinhHongDuLongTLND=true
        OutputMessage("MSG_SYS","[Tự bật Kinh Hồng Du Long khi cần thiết] > ON\n")
      else
        MacroOptions.autoKinhHongDuLongTLND=false
        OutputMessage("MSG_SYS","[Tự bật Kinh Hồng Du Long khi cần thiết] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoTapTrung","Tự bật Tập Trung","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10224 then
      if not MacroOptions.autoTapTrungKVQ then
        MacroOptions.autoTapTrungKVQ=true
        OutputMessage("MSG_SYS","[Tự bật Tập Trung] > ON\n")
      else
        MacroOptions.autoTapTrungKVQ=false
        OutputMessage("MSG_SYS","[Tự bật Tập Trung] > OFF\n")
      end
    elseif NoiCong==10225 then
      if not MacroOptions.autoTapTrungTLND then
        MacroOptions.autoTapTrungTLND=true
        OutputMessage("MSG_SYS","[Tự bật Tập Trung] > ON\n")
      else
        MacroOptions.autoTapTrungTLND=false
        OutputMessage("MSG_SYS","[Tự bật Tập Trung] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoNguNguyenTien","Dùng Ngự Nguyên Tiễn duy trì debuff Tạ Giáp","",
  function()
    if not MacroOptions.autoNguNguyenTien then
      MacroOptions.autoNguNguyenTien=true
      OutputMessage("MSG_SYS","[Dùng Ngự Nguyên Tiễn duy trì debuff Tạ Giáp] > ON\n")
    else
      MacroOptions.autoNguNguyenTien=false
      OutputMessage("MSG_SYS","[Dùng Ngự Nguyên Tiễn duy trì debuff Tạ Giáp] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoQuiPhuThanCong","Tự bật Quỉ Phủ Thần Công","",
  function()
    if not MacroOptions.autoQuiPhuThanCong then
      MacroOptions.autoQuiPhuThanCong=true
      OutputMessage("MSG_SYS","[Tự bật Quỉ Phủ Thần Công] > ON\n")
    else
      MacroOptions.autoQuiPhuThanCong=false
      OutputMessage("MSG_SYS","[Tự bật Quỉ Phủ Thần Công] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoDoCungChuyKien","Tự kích hoạt Đồ Cùng Chủy Kiến, Thiên Tuyệt Địa Diệt","",
  function()
    if not MacroOptions.autoDoCungChuyKien then
      MacroOptions.autoDoCungChuyKien=true
      OutputMessage("MSG_SYS","[Tự kích hoạt Đồ Cùng Chủy Kiến, Thiên Tuyệt Địa Diệt] > ON\n")
    else
      MacroOptions.autoDoCungChuyKien=false
      OutputMessage("MSG_SYS","[Tự kích hoạt Đồ Cùng Chủy Kiến, Thiên Tuyệt Địa Diệt] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoTCBAttack","Tự tấn công bằng Liên Nỏ hoặc Trọng Nỏ khi đổi mục tiêu","",
  function()
    if not MacroOptions.autoTCBAttack then
      MacroOptions.autoTCBAttack=true
      OutputMessage("MSG_SYS","[Tự tấn công bằng Liên Nỏ hoặc Trọng Nỏ khi đổi mục tiêu] > ON\n")
    else
      MacroOptions.autoTCBAttack=false
      OutputMessage("MSG_SYS","[Tự tấn công bằng Liên Nỏ hoặc Trọng Nỏ khi đổi mục tiêu] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("stackNumPheTam","Thay đổi số tầng Phệ Tâm cần stack","",
  function()
    if MacroOptions.stackNumPheTam==5 then
      MacroOptions.stackNumPheTam=1
      OutputMessage("MSG_SYS","Đã lựa chọn [Stack 1 tầng Phệ Tâm khi bắt đầu đánh]\n")
    elseif MacroOptions.stackNumPheTam==1 then
      MacroOptions.stackNumPheTam=2
      OutputMessage("MSG_SYS","Đã lựa chọn [Stack 2 tầng Phệ Tâm khi bắt đầu đánh]\n")
    elseif MacroOptions.stackNumPheTam==2 then
      MacroOptions.stackNumPheTam=3
      OutputMessage("MSG_SYS","Đã lựa chọn [Stack 3 tầng Phệ Tâm khi bắt đầu đánh]\n")
    elseif MacroOptions.stackNumPheTam==3 then
      MacroOptions.stackNumPheTam=4
      OutputMessage("MSG_SYS","Đã lựa chọn [Stack 4 tầng Phệ Tâm khi bắt đầu đánh]\n")
    elseif MacroOptions.stackNumPheTam==4 then
      MacroOptions.stackNumPheTam=5
      OutputMessage("MSG_SYS","Đã lựa chọn [Stack 5 tầng Phệ Tâm khi bắt đầu đánh]\n")
    end
  end,
nil)
Hotkey.AddBinding("autoTCB","Chuyển chế độ tự đặt Thiên Cơ Biến","",
  function()
    if MacroOptions.autoTCB==0 then
      MacroOptions.autoTCB=1
      OutputMessage("MSG_SYS","Đã lựa chọn [Tự đặt Thiên Cơ Biến dạng Liên Nỏ]\n")
    elseif MacroOptions.autoTCB==1 then
      MacroOptions.autoTCB=2
      OutputMessage("MSG_SYS","Đã lựa chọn [Tự đặt Thiên Cơ Biến dạng Độc Sát]\n")
    elseif MacroOptions.autoTCB==2 then
      MacroOptions.autoTCB=0
      OutputMessage("MSG_SYS","Đã lựa chọn [Không tự đặt Thiên Cơ Biến]\n")
    end
  end,
nil)
Hotkey.AddBinding("toggleATSCMode","Chuyển chế độ đặt Ám Tàng Sát Cơ","",
  function()
    if MacroOptions.toggleATSCMode==100 then
      MacroOptions.toggleATSCMode=25
      OutputMessage("MSG_SYS","Đã lựa chọn [Đặt Ám Tàng Sát Cơ khi thần cơ >= 25]\n")
    elseif MacroOptions.toggleATSCMode==25 then
      MacroOptions.toggleATSCMode=55
      OutputMessage("MSG_SYS","Đã lựa chọn [Đặt Ám Tàng Sát Cơ khi thần cơ >= 55]\n")
    elseif MacroOptions.toggleATSCMode==55 then
      MacroOptions.toggleATSCMode=85
      OutputMessage("MSG_SYS","Đã lựa chọn [Đặt Ám Tàng Sát Cơ khi thần cơ >= 85]\n")
    elseif MacroOptions.toggleATSCMode==85 then
      MacroOptions.toggleATSCMode=100
      OutputMessage("MSG_SYS","Đã lựa chọn [Đặt Ám Tàng Sát Cơ khi thần cơ >= 100]\n")
    end
  end,
nil)
Hotkey.AddBinding("toggleAttackMode","Chuyển chế độ đánh cho TLND","",
  function()
    if MacroOptions.toggleAttackMode==3 then
      MacroOptions.toggleAttackMode=1
      MacroOptions.autoTCB=1
      OutputMessage("MSG_SYS","Đã lựa chọn [Chế độ đánh bình thường]\n")
    elseif MacroOptions.toggleAttackMode==1 then
      MacroOptions.toggleAttackMode=2
      OutputMessage("MSG_SYS","Đã lựa chọn [Chế độ đánh đối tượng di chuyển nhiều]\n")
    elseif MacroOptions.toggleAttackMode==2 then
      MacroOptions.toggleAttackMode=3
	  MacroOptions.autoTCB=2
      OutputMessage("MSG_SYS","Đã lựa chọn [Chế độ đánh AOE toàn diện]\n")
    end
  end,
nil)
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
Hotkey.AddBinding("autoGamNhuHo","Gầm Như Hổ khi HP<30%","Macro Thiên Sách",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10026 then
      if not MacroOptions.autoGamNhuHoNHCY then
        MacroOptions.autoGamNhuHoNHCY=true
        OutputMessage("MSG_SYS","[Tự bật Gầm Như Hổ và Ngự khi HP<30%] > ON\n")
      else
        MacroOptions.autoGamNhuHoNHCY=false
        OutputMessage("MSG_SYS","[Tự bật Gầm Như Hổ và Ngự khi HP<30%] > OFF\n")
      end
    elseif NoiCong==10062 then
      if not MacroOptions.autoGamNhuHoTLL then
        MacroOptions.autoGamNhuHoTLL=true
        OutputMessage("MSG_SYS","[Tự bật Gầm Như Hổ khi HP<30%] > ON\n")
      else
        MacroOptions.autoGamNhuHoTLL=false
        OutputMessage("MSG_SYS","[Tự bật Gầm Như Hổ khi HP<30%] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoNgu","Ngự khi HP<40% (Thiết Lao Luật)","",
  function()
    if not MacroOptions.autoNguTLL then
      MacroOptions.autoNguTLL=true
      OutputMessage("MSG_SYS","[Tự bật Ngự khi HP<40% (Thiết Lao Luật)] > ON\n")
    else
      MacroOptions.autoNguTLL=false
      OutputMessage("MSG_SYS","[Tự bật Ngự khi HP<40% (Thiết Lao Luật)] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoThuNhuSon","Thủ Như Sơn khi HP<50%","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10026 then
      if not MacroOptions.autoThuNhuSonNHCY then
        MacroOptions.autoThuNhuSonNHCY=true
        OutputMessage("MSG_SYS","[Tự bật Thủ Như Sơn khi HP<50%] > ON\n")
      else
        MacroOptions.autoThuNhuSonNHCY=false
        OutputMessage("MSG_SYS","[Tự bật Thủ Như Sơn khi HP<50%] > OFF\n")
      end
    elseif NoiCong==10062 then
      if not MacroOptions.autoThuNhuSonTLL then
        MacroOptions.autoThuNhuSonTLL=true
        OutputMessage("MSG_SYS","[Tự bật Thủ Như Sơn khi HP<60%] > ON\n")
      else
        MacroOptions.autoThuNhuSonTLL=false
        OutputMessage("MSG_SYS","[Tự bật Thủ Như Sơn khi HP<60%] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoNgangNhuNgac","Ngang Như Ngạc khi HP<30% (Thiết Lao Luật)","",
  function()
    if not MacroOptions.autoNgangNhuNgac then
      MacroOptions.autoNgangNhuNgac=true
      OutputMessage("MSG_SYS","[Tự bật Ngang Như Ngạc khi HP<30% (Thiết Lao Luật)] > ON\n")
    else
      MacroOptions.autoNgangNhuNgac=false
      OutputMessage("MSG_SYS","[Tự bật Ngang Như Ngạc khi HP<30% (Thiết Lao Luật)] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoTuNhuLam","Từ Như Lâm khi MP<30%","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10026 then
      if not MacroOptions.autoTuNhuLamNHCY then
        MacroOptions.autoTuNhuLamNHCY=true
        OutputMessage("MSG_SYS","[Tự bật Từ Như Lâm khi MP<30%] > ON\n")
      else
        MacroOptions.autoTuNhuLamNHCY=false
        OutputMessage("MSG_SYS","[Tự bật Từ Như Lâm khi MP<30%] > OFF\n")
      end
    elseif NoiCong==10062 then
      if not MacroOptions.autoTuNhuLamTLL then
        MacroOptions.autoTuNhuLamTLL=true
        OutputMessage("MSG_SYS","[Tự bật Từ Như Lâm khi MP<30%] > ON\n")
      else
        MacroOptions.autoTuNhuLamTLL=false
        OutputMessage("MSG_SYS","[Tự bật Từ Như Lâm khi MP<30%] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoHamNhuLoi","Tự dùng Hám Như Lôi","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10026 then
      if not MacroOptions.autoHamNhuLoiNHCY then
        MacroOptions.autoHamNhuLoiNHCY=true
        OutputMessage("MSG_SYS","[Tự dùng Hám Như Lôi] > ON\n")
      else
        MacroOptions.autoHamNhuLoiNHCY=false
        OutputMessage("MSG_SYS","[Tự dùng Hám Như Lôi] > OFF\n")
      end
    elseif NoiCong==10062 then
      if not MacroOptions.autoHamNhuLoiTLL then
        MacroOptions.autoHamNhuLoiTLL=true
        OutputMessage("MSG_SYS","[Tự dùng Hám Như Lôi] > ON\n")
      else
        MacroOptions.autoHamNhuLoiTLL=false
        OutputMessage("MSG_SYS","[Tự dùng Hám Như Lôi] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoTatNhuPhong","Tự dùng Tật Như Phong","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10026 then
      if not MacroOptions.autoTatNhuPhongNHCY then
        MacroOptions.autoTatNhuPhongNHCY=true
        OutputMessage("MSG_SYS","[Tự dùng Tật Như Phong] > ON\n")
      else
        MacroOptions.autoTatNhuPhongNHCY=false
        OutputMessage("MSG_SYS","[Tự dùng Tật Như Phong] > OFF\n")
      end
    elseif NoiCong==10062 then
      if not MacroOptions.autoTatNhuPhongTLL then
        MacroOptions.autoTatNhuPhongTLL=true
        OutputMessage("MSG_SYS","[Tự dùng Tật Như Phong] > ON\n")
      else
        MacroOptions.autoTatNhuPhongTLL=false
        OutputMessage("MSG_SYS","[Tự dùng Tật Như Phong] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoTat","Tự sử dụng Tật để áp sát","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10026 then
      if not MacroOptions.autoTatNHCY then
        MacroOptions.autoTatNHCY=true
        OutputMessage("MSG_SYS","[Tự sử dụng Tật để áp sát] > ON\n")
      else
        MacroOptions.autoTatNHCY=false
        OutputMessage("MSG_SYS","[Tự sử dụng Tật để áp sát] > OFF\n")
      end
    elseif NoiCong==10062 then
      if not MacroOptions.autoTatTLL then
        MacroOptions.autoTatTLL=true
        OutputMessage("MSG_SYS","[Tự sử dụng Tật để áp sát] > ON\n")
      else
        MacroOptions.autoTatTLL=false
        OutputMessage("MSG_SYS","[Tự sử dụng Tật để áp sát] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoDot","Tự sử dụng Đột khi khoảng cách >8m và <25m","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10026 then
      if not MacroOptions.autoDotNHCY then
        MacroOptions.autoDotNHCY=true
        OutputMessage("MSG_SYS","[Tự sử dụng Đột khi khoảng cách >8m và <25m] > ON\n")
      else
        MacroOptions.autoDotNHCY=false
        OutputMessage("MSG_SYS","[Tự sử dụng Đột khi khoảng cách >8m và <25m] > OFF\n")
      end
    elseif NoiCong==10062 then
      if not MacroOptions.autoDotTLL then
        MacroOptions.autoDotTLL=true
        OutputMessage("MSG_SYS","[Tự sử dụng Đột khi khoảng cách >8m và <25m] > ON\n")
      else
        MacroOptions.autoDotTLL=false
        OutputMessage("MSG_SYS","[Tự sử dụng Đột khi khoảng cách >8m và <25m] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoDinhQuan","Tự dùng Định Quân khi BOSS chuyển target khỏi bản thân","",
  function()
    if not MacroOptions.autoDinhQuan then
      MacroOptions.autoDinhQuan=true
      OutputMessage("MSG_SYS","[Tự dùng Định Quân khi BOSS chuyển target khỏi bản thân] > ON\n")
    else
      MacroOptions.autoDinhQuan=false
      OutputMessage("MSG_SYS","[Tự dùng Định Quân khi BOSS chuyển target khỏi bản thân] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoLuocNhuHoa","Tự dùng Lược Như Hỏa khi cừu hận top 2 > 70%","",
  function()
    if not MacroOptions.autoLuocNhuHoa then
      MacroOptions.autoLuocNhuHoa=true
      OutputMessage("MSG_SYS","[Tự dùng Lược Như Hỏa khi cừu hận top 2 > 70%] > ON\n")
    else
      MacroOptions.autoLuocNhuHoa=false
      OutputMessage("MSG_SYS","[Tự dùng Lược Như Hỏa khi cừu hận top 2 > 70%] > OFF\n")
    end
  end,
nil)
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
Hotkey.AddBinding("autoThanhMinhHuu","Tự bật Thánh Minh Hựu khi HP<50%","Macro Minh Giáo",
  function()
    if not MacroOptions.autoThanhMinhHuuMTLLT then
      MacroOptions.autoThanhMinhHuuMTLLT=true
      OutputMessage("MSG_SYS","[Tự bật Thánh Minh Hựu khi HP<50%] > ON\n")
    else
      MacroOptions.autoThanhMinhHuuMTLLT=false
      OutputMessage("MSG_SYS","[Tự bật Thánh Minh Hựu khi HP<50%] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoThamMaThe","Tự bật Tham Ma Thể khi HP<30%","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10242 then
      if not MacroOptions.autoThamMaThePATQ then
        MacroOptions.autoThamMaThePATQ=true
        OutputMessage("MSG_SYS","[Tự bật Tham Ma Thể khi HP<30%] > ON\n")
      else
        MacroOptions.autoThamMaThePATQ=false
        OutputMessage("MSG_SYS","[Tự bật Tham Ma Thể khi HP<30%] > OFF\n")
      end
    elseif NoiCong==10243 then
      if not MacroOptions.autoThamMaTheMTLLT then
        MacroOptions.autoThamMaTheMTLLT=true
        OutputMessage("MSG_SYS","[Tự bật Tham Ma Thể khi HP<30%] > ON\n")
      else
        MacroOptions.autoThamMaTheMTLLT=false
        OutputMessage("MSG_SYS","[Tự bật Tham Ma Thể khi HP<30%] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoTinhMenhHai","Tự dùng Tính Mệnh Hải khi HP<50%","",
  function()
    if not MacroOptions.autoTinhMenhHai then
      MacroOptions.autoTinhMenhHai=true
      OutputMessage("MSG_SYS","[Tự dùng Tính Mệnh Hải khi HP<50%] > ON\n")
    else
      MacroOptions.autoTinhMenhHai=false
      OutputMessage("MSG_SYS","[Tự dùng Tính Mệnh Hải khi HP<50%] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoAmTranDiTan","Chuyển chế độ dùng Ám Trần Di Tán","",
  function()
    if MacroOptions.autoAmTranDiTan==0 then
      MacroOptions.autoAmTranDiTan=1
      OutputMessage("MSG_SYS","Đã lựa chọn [Tự bật Ám Trần Di Tán khi cừu hận > 70%]\n")
    elseif MacroOptions.autoAmTranDiTan==1 then
      MacroOptions.autoAmTranDiTan=2
      OutputMessage("MSG_SYS","Đã lựa chọn [Tự bật Ám Trần Di Tán -> Khu Dạ Đoạn Sầu (tăng 10% tấn công cơ bản)]\n")
    elseif MacroOptions.autoAmTranDiTan==2 then
      MacroOptions.autoAmTranDiTan=0
      OutputMessage("MSG_SYS","Đã lựa chọn [Không tự bật Ám Trần Di Tán khi chiến đấu]\n")
    end
  end,
nil)
Hotkey.AddBinding("autoLuuQuangTuAnh","Tự dùng Lưu Quang Tù Ảnh khi mục tiêu xa hơn 8m","",
  function()
    if not MacroOptions.autoLuuQuangTuAnh then
      MacroOptions.autoLuuQuangTuAnh=true
      OutputMessage("MSG_SYS","[Tự dùng Lưu Quang Tù Ảnh khi mục tiêu xa hơn 8m] > ON\n")
    else
      MacroOptions.autoLuuQuangTuAnh=false
      OutputMessage("MSG_SYS","[Tự dùng Lưu Quang Tù Ảnh khi mục tiêu xa hơn 8m] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoAoQuangBo","Tự dùng Ảo Quang Bộ khi mục tiêu xa hơn 8m","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10242 then
      if not MacroOptions.autoAoQuangBoPATQ then
        MacroOptions.autoAoQuangBoPATQ=true
        OutputMessage("MSG_SYS","[Tự dùng Ảo Quang Bộ khi mục tiêu xa hơn 8m] > ON\n")
      else
        MacroOptions.autoAoQuangBoPATQ=false
        OutputMessage("MSG_SYS","[Tự dùng Ảo Quang Bộ khi mục tiêu xa hơn 8m] > OFF\n")
      end
    elseif NoiCong==10243 then
      if not MacroOptions.autoAoQuangBoMTLLT then
        MacroOptions.autoAoQuangBoMTLLT=true
        OutputMessage("MSG_SYS","[Tự dùng Ảo Quang Bộ khi mục tiêu xa hơn 8m] > ON\n")
      else
        MacroOptions.autoAoQuangBoMTLLT=false
        OutputMessage("MSG_SYS","[Tự dùng Ảo Quang Bộ khi mục tiêu xa hơn 8m] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoCucLacDan","Tự dùng Cực Lạc Dẫn","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10242 then
      if not MacroOptions.autoCucLacDanPATQ then
        MacroOptions.autoCucLacDanPATQ=true
        OutputMessage("MSG_SYS","[Tự dùng Cực Lạc Dẫn (nếu có bí kíp tăng 20% tốc độ nhận Nhật Linh & Nguyệt Hồn)] > ON\n")
      else
        MacroOptions.autoCucLacDanPATQ=false
        OutputMessage("MSG_SYS","[Tự dùng Cực Lạc Dẫn (nếu có bí kíp tăng 20% tốc độ nhận Nhật Linh & Nguyệt Hồn)] > OFF\n")
      end
    elseif NoiCong==10243 then
      if not MacroOptions.autoCucLacDanMTLLT then
        MacroOptions.autoCucLacDanMTLLT=true
        OutputMessage("MSG_SYS","[Tự dùng Cực Lạc Dẫn khi cừu hận top 2 > 70%] > ON\n")
      else
        MacroOptions.autoCucLacDanMTLLT=false
        OutputMessage("MSG_SYS","[Tự dùng Cực Lạc Dẫn khi cừu hận top 2 > 70%] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoQuangMinhTuong","Tự dùng Quang Minh Tướng","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10242 then
      if not MacroOptions.autoQuangMinhTuongPATQ then
        MacroOptions.autoQuangMinhTuongPATQ=true
        OutputMessage("MSG_SYS","[Tự dùng Quang Minh Tướng] > ON\n")
      else
        MacroOptions.autoQuangMinhTuongPATQ=false
        OutputMessage("MSG_SYS","[Tự dùng Quang Minh Tướng] > OFF\n")
      end
    elseif NoiCong==10243 then
      if not MacroOptions.autoQuangMinhTuongMTLLT then
        MacroOptions.autoQuangMinhTuongMTLLT=true
        OutputMessage("MSG_SYS","[Tự dùng Quang Minh Tướng] > ON\n")
      else
        MacroOptions.autoQuangMinhTuongMTLLT=false
        OutputMessage("MSG_SYS","[Tự dùng Quang Minh Tướng] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoSinhDietDuDoat","Tự dùng Sinh Diệt Dư Đoạt","",
  function()
    if not MacroOptions.autoSinhDietDuDoat then
      MacroOptions.autoSinhDietDuDoat=true
      OutputMessage("MSG_SYS","[Tự dùng Sinh Diệt Dư Đoạt] > ON\n")
    else
      MacroOptions.autoSinhDietDuDoat=false
      OutputMessage("MSG_SYS","[Tự dùng Sinh Diệt Dư Đoạt] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoTuBiNguyen","Tự dùng Từ Bi Nguyện","",
  function()
    if not MacroOptions.autoTuBiNguyen then
      MacroOptions.autoTuBiNguyen=true
      OutputMessage("MSG_SYS","[Tự dùng Từ Bi Nguyện khi BOSS chuyển target khỏi bản thân] > ON\n")
    else
      MacroOptions.autoTuBiNguyen=false
      OutputMessage("MSG_SYS","[Tự dùng Từ Bi Nguyện khi BOSS chuyển target khỏi bản thân] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("alwaysTuBiNguyen","Dùng Từ Bi Nguyện ngay khi cooldown xong","",
  function()
    if not MacroOptions.alwaysTuBiNguyen then
      MacroOptions.alwaysTuBiNguyen=true
      OutputMessage("MSG_SYS","[Dùng Từ Bi Nguyện ngay khi cooldown xong] > ON\n")
    else
      MacroOptions.alwaysTuBiNguyen=false
      OutputMessage("MSG_SYS","[Dùng Từ Bi Nguyện ngay khi cooldown xong] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoSunMoonMode","Chuyển chế độ đánh Nhật - Nguyệt","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10242 then
      if MacroOptions.sunModePATQ==false and MacroOptions.moonModePATQ==true then
        MacroOptions.moonModePATQ=false
        OutputMessage("MSG_SYS","Đã lựa chọn [Chế độ đánh kết hợp Nhật - Nguyệt]\n")
      elseif MacroOptions.sunModePATQ==false and MacroOptions.moonModePATQ==false then
        MacroOptions.sunModePATQ=true
        OutputMessage("MSG_SYS","Đã lựa chọn [Chế độ chỉ đánh bộ skill Nhật]\n")
      elseif MacroOptions.sunModePATQ==true and MacroOptions.moonModePATQ==false then
        MacroOptions.sunModePATQ=false
        MacroOptions.moonModePATQ=true
        OutputMessage("MSG_SYS","Đã lựa chọn [Chế độ chỉ đánh bộ skill Nguyệt]\n")
      end
    elseif NoiCong==10243 then
      if MacroOptions.sunModeMTLLT==false and MacroOptions.moonModeMTLLT==true then
        MacroOptions.sunModeMTLLT=true
        MacroOptions.moonModeMTLLT=false
        OutputMessage("MSG_SYS","Đã lựa chọn [Chế độ chỉ đánh bộ skill Nhật]\n")
      elseif MacroOptions.sunModeMTLLT==true and MacroOptions.moonModeMTLLT==false then
        MacroOptions.sunModeMTLLT=false
        MacroOptions.moonModeMTLLT=true
        OutputMessage("MSG_SYS","Đã lựa chọn [Chế độ chỉ đánh bộ skill Nguyệt]\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoNNLN","Đánh thêm Ngân Nguyệt Trảm/Liệt Nhật Trảm (PATQ)","",
  function()
    if not MacroOptions.autoNNLN then
      MacroOptions.autoNNLN=true
      OutputMessage("MSG_SYS","[Đánh thêm Ngân Nguyệt Trảm/Liệt Nhật Trảm (PATQ)] > ON\n")
    else
      MacroOptions.autoNNLN=false
      OutputMessage("MSG_SYS","[Đánh thêm Ngân Nguyệt Trảm/Liệt Nhật Trảm (PATQ)] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoNhatNguyetTinhThe","Chỉ dùng skill trong bộ Nhật Nguyệt Tịnh Thế","",
  function()
    if not MacroOptions.autoNhatNguyetTinhThe then
      MacroOptions.autoNhatNguyetTinhThe=true
      OutputMessage("MSG_SYS","[Chỉ dùng skill trong bộ Nhật Nguyệt Tịnh Thế] > ON\n")
    else
      MacroOptions.autoNhatNguyetTinhThe=false
      OutputMessage("MSG_SYS","[Chỉ dùng skill trong bộ Nhật Nguyệt Tịnh Thế] > OFF\n")
    end
  end,
nil)
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
Hotkey.AddBinding("autoTuyenNgungNguyet","Tuyền Ngưng Nguyệt - Vân Tê Tùng khi HP<30%","Macro Tàng Kiếm",
  function()
    if not MacroOptions.autoTuyenNgungNguyet then
      MacroOptions.autoTuyenNgungNguyet=true
      OutputMessage("MSG_SYS","[Tự bật Tuyền Ngưng Nguyệt - Vân Tê Tùng khi HP<30%] > ON\n")
    else
      MacroOptions.autoTuyenNgungNguyet=false
      OutputMessage("MSG_SYS","[Tự bật Tuyền Ngưng Nguyệt - Vân Tê Tùng khi HP<30%] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoThamMai","Thám Mai cho tanker đang giữ BOSS","",
  function()
    if not MacroOptions.autoThamMai then
      MacroOptions.autoThamMai=true
      OutputMessage("MSG_SYS","[Tự dùng Thám Mai cho tanker đang giữ BOSS] > ON\n")
    else
      MacroOptions.autoThamMai=false
      OutputMessage("MSG_SYS","[Tự dùng Thám Mai cho tanker đang giữ BOSS] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoOanhMinhLieu","Tự bật Oanh Minh Liễu để hồi kiếm khí","",
  function()
    if not MacroOptions.autoOanhMinhLieu then
      MacroOptions.autoOanhMinhLieu=true
      OutputMessage("MSG_SYS","[Tự bật Oanh Minh Liễu để hồi kiếm khí] > ON\n")
    else
      MacroOptions.autoOanhMinhLieu=false
      OutputMessage("MSG_SYS","[Tự bật Oanh Minh Liễu để hồi kiếm khí] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoTuyetDoanKieu","Tự dùng Tuyết Đoạn Kiều để hồi kiếm khí","",
  function()
    if not MacroOptions.autoTuyetDoanKieu then
      MacroOptions.autoTuyetDoanKieu=true
      OutputMessage("MSG_SYS","[Tự dùng Tuyết Đoạn Kiều để hồi kiếm khí] > ON\n")
    else
      MacroOptions.autoTuyetDoanKieu=false
      OutputMessage("MSG_SYS","[Tự dùng Tuyết Đoạn Kiều để hồi kiếm khí] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("OMLTDK","Dùng Oanh Minh Liễu trước Tuyết Đoạn Kiều","",
  function()
    if not MacroOptions.OMLTDK then
      MacroOptions.OMLTDK=true
      OutputMessage("MSG_SYS","[Dùng Oanh Minh Liễu trước Tuyết Đoạn Kiều] > ON\n")
    else
      MacroOptions.OMLTDK=false
      OutputMessage("MSG_SYS","[Dùng Oanh Minh Liễu trước Tuyết Đoạn Kiều] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoBinhHoHoangLong","Dùng Bình Hồ - Hoàng Long","",
  function()
    if not MacroOptions.autoBinhHoHoangLong then
      MacroOptions.autoBinhHoHoangLong=true
      OutputMessage("MSG_SYS","[Dùng Bình Hồ Đoạn Nguyệt - Hoàng Long Thổ Thúy] > ON\n")
    else
      MacroOptions.autoBinhHoHoangLong=false
      OutputMessage("MSG_SYS","[Dùng Bình Hồ Đoạn Nguyệt - Hoàng Long Thổ Thúy] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoMongTuyenHoBao","Dùng Mộng Tuyền Hổ Bào trong combo","",
  function()
    if not MacroOptions.autoMongTuyenHoBao then
      MacroOptions.autoMongTuyenHoBao=true
      OutputMessage("MSG_SYS","[Sử dụng Mộng Tuyền Hổ Bào trong combo Vấn Thủy Quyết] > ON\n")
    else
      MacroOptions.autoMongTuyenHoBao=false
      OutputMessage("MSG_SYS","[Sử dụng Mộng Tuyền Hổ Bào trong combo Vấn Thủy Quyết] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoVanTeTung","Dùng Vân Tê Tùng để hồi kiếm khí","",
  function()
    if not MacroOptions.autoVanTeTung then
      MacroOptions.autoVanTeTung=true
      OutputMessage("MSG_SYS","[Dùng Vân Tê Tùng để hồi kiếm khí] > ON\n")
    else
      MacroOptions.autoVanTeTung=false
      OutputMessage("MSG_SYS","[Dùng Vân Tê Tùng để hồi kiếm khí] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoPhongLaiNgoSon","Tự xoay Phong Lai Ngô Sơn khi thích hợp","",
  function()
    if not MacroOptions.autoPhongLaiNgoSon then
      MacroOptions.autoPhongLaiNgoSon=true
      OutputMessage("MSG_SYS","[Tự xoay Phong Lai Ngô Sơn khi thích hợp] > ON\n")
    else
      MacroOptions.autoPhongLaiNgoSon=false
      OutputMessage("MSG_SYS","[Tự xoay Phong Lai Ngô Sơn khi thích hợp] > OFF\n")
    end
  end,
nil)
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
Hotkey.AddBinding("autoXuanNeHoHoa","Xuân Nê Hộ Hoa - Hoa Ngữ Tô Tâm khi HP<30%","Macro Vạn Hoa",
  function()
    if not MacroOptions.autoXuanNeHoHoa then
      MacroOptions.autoXuanNeHoHoa=true
      OutputMessage("MSG_SYS","[Tự bật Xuân Nê Hộ Hoa - Hoa Ngữ Tô Tâm khi HP<30%] > ON\n")
    else
      MacroOptions.autoXuanNeHoHoa=false
      OutputMessage("MSG_SYS","[Tự bật Xuân Nê Hộ Hoa - Hoa Ngữ Tô Tâm khi HP<30%] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoBichThuyThaoThien","Bích Thủy Thao Thiên khi MP<30%","",
  function()
    if not MacroOptions.autoBichThuyThaoThien then
      MacroOptions.autoBichThuyThaoThien=true
      OutputMessage("MSG_SYS","[Tự dùng Bích Thủy Thao Thiên khi MP<30%] > ON\n")
    else
      MacroOptions.autoBichThuyThaoThien=false
      OutputMessage("MSG_SYS","[Tự dùng Bích Thủy Thao Thiên khi MP<30%] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoThanhTamTinhKhi","Tự buff Thanh Tâm Tịnh Khí","",
  function()
    if not MacroOptions.autoThanhTamTinhKhi then
      MacroOptions.autoThanhTamTinhKhi=true
      OutputMessage("MSG_SYS","[Tự buff Thanh Tâm Tịnh Khí] > ON\n")
    else
      MacroOptions.autoThanhTamTinhKhi=false
      OutputMessage("MSG_SYS","[Tự buff Thanh Tâm Tịnh Khí] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoThuyNguyetVoGian","Thủy Nguyệt Vô Gian","",
  function()
    if not MacroOptions.autoThuyNguyetVoGian then
      MacroOptions.autoThuyNguyetVoGian=true
      OutputMessage("MSG_SYS","[Tự dùng Thủy Nguyệt Vô Gian] > ON\n")
    else
      MacroOptions.autoThuyNguyetVoGian=false
      OutputMessage("MSG_SYS","[Tự dùng Thủy Nguyệt Vô Gian] > OFF\n")
    end
  end,
nil)
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
Hotkey.AddBinding("autoThienDiaDeNgang","Thiên Địa Đê Ngang - Thước Đạp Chi khi HP<30%","Macro Thất Tú",
  function()
    if not MacroOptions.autoThienDiaDeNgang then
      MacroOptions.autoThienDiaDeNgang=true
      OutputMessage("MSG_SYS","[Tự bật Thiên Địa Đê Ngang - Thước Đạp Chi khi HP<30%] > ON\n")
    else
      MacroOptions.autoThienDiaDeNgang=false
      OutputMessage("MSG_SYS","[Tự bật Thiên Địa Đê Ngang - Thước Đạp Chi khi HP<30%] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoBaLaMon","Tự duy trì buff Tụ Khí","",
  function()
    if not MacroOptions.autoBaLaMon then
      MacroOptions.autoBaLaMon=true
      OutputMessage("MSG_SYS","[Tự duy trì buff Tụ Khí] > ON\n")
    else
      MacroOptions.autoBaLaMon=false
      OutputMessage("MSG_SYS","[Tự duy trì buff Tụ Khí] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoLongTriNhac","Tự bật Long Trì Nhạc","",
  function()
    if not MacroOptions.autoLongTriNhac then
      MacroOptions.autoLongTriNhac=true
      OutputMessage("MSG_SYS","[Tự bật Long Trì Nhạc] > ON\n")
    else
      MacroOptions.autoLongTriNhac=false
      OutputMessage("MSG_SYS","[Tự bật Long Trì Nhạc] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoKiemPhaHuKhong","Dùng Kiếm Phá Hư Không","",
  function()
    if not MacroOptions.autoKiemPhaHuKhong then
      MacroOptions.autoKiemPhaHuKhong=true
      OutputMessage("MSG_SYS","[Dùng Kiếm Phá Hư Không trong combo] > ON\n")
    else
      MacroOptions.autoKiemPhaHuKhong=false
      OutputMessage("MSG_SYS","[Dùng Kiếm Phá Hư Không trong combo] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoKiemThanVoNga","Dùng Kiếm Thần Vô Ngã","",
  function()
    if not MacroOptions.autoKiemThanVoNga then
      MacroOptions.autoKiemThanVoNga=true
      OutputMessage("MSG_SYS","[Tự dùng Kiếm Thần Vô Ngã] > ON\n")
    else
      MacroOptions.autoKiemThanVoNga=false
      OutputMessage("MSG_SYS","[Tự dùng Kiếm Thần Vô Ngã] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoManDuongThe","Mãn Đường Thế khi kiếm vũ ít hơn 3 tầng","",
  function()
    if not MacroOptions.autoManDuongThe then
      MacroOptions.autoManDuongThe=true
      OutputMessage("MSG_SYS","[Tự hồi kiếm vũ bằng Mãn Đường Thế khi kiếm vũ ít hơn 3 tầng] > ON\n")
    else
      MacroOptions.autoManDuongThe=false
      OutputMessage("MSG_SYS","[Tự hồi kiếm vũ bằng Mãn Đường Thế khi kiếm vũ ít hơn 3 tầng] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoPhonAmCapTiet","Phồn Âm Cấp Tiết (tăng 30% tấn công cơ bản)","",
  function()
    if not MacroOptions.autoPhonAmCapTiet then
      MacroOptions.autoPhonAmCapTiet=true
      OutputMessage("MSG_SYS","[Tự bật Phồn Âm Cấp Tiết (tăng 30% tấn công cơ bản)] > ON\n")
    else
      MacroOptions.autoPhonAmCapTiet=false
      OutputMessage("MSG_SYS","[Tự bật Phồn Âm Cấp Tiết (tăng 30% tấn công cơ bản)] > OFF\n")
    end
  end,
nil)
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
Hotkey.AddBinding("autoHuyenThuyCo","Tự bật Huyền Thủy Cổ khi HP<30%","Macro Ngũ Độc",
  function()
    if not MacroOptions.autoHuyenThuyCo then
      MacroOptions.autoHuyenThuyCo=true
      OutputMessage("MSG_SYS","[Tự bật Huyền Thủy Cổ khi HP<30%] > ON\n")
    else
      MacroOptions.autoHuyenThuyCo=false
      OutputMessage("MSG_SYS","[Tự bật Huyền Thủy Cổ khi HP<30%] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoCoTrungCuongBao","Tự bật Cổ Trùng Cuồng Bạo khi HP<30%","",
  function()
    if not MacroOptions.autoCoTrungCuongBao then
      MacroOptions.autoCoTrungCuongBao=true
      OutputMessage("MSG_SYS","[Tự bật Cổ Trùng Cuồng Bạo khi HP<30%] > ON\n")
    else
      MacroOptions.autoCoTrungCuongBao=false
      OutputMessage("MSG_SYS","[Tự bật Cổ Trùng Cuồng Bạo khi HP<30%] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("saveManaMode","Chế độ đánh chú trọng hồi nội lực","",
  function()
    if not MacroOptions.saveManaMode then
      MacroOptions.saveManaMode=true
      OutputMessage("MSG_SYS","[Chế độ đánh chú trọng hồi nội lực] > ON\n")
    else
      MacroOptions.saveManaMode=false
      OutputMessage("MSG_SYS","[Chế độ đánh chú trọng hồi nội lực] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoPhuongHoangCo","Buff Phượng Hoàng Cổ cho bản thân","",
  function()
    if not MacroOptions.autoPhuongHoangCo then
      MacroOptions.autoPhuongHoangCo=true
      OutputMessage("MSG_SYS","[Tự buff Phượng Hoàng Cổ cho bản thân] > ON\n")
    else
      MacroOptions.autoPhuongHoangCo=false
      OutputMessage("MSG_SYS","[Tự buff Phượng Hoàng Cổ cho bản thân] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoSelfBuff","Chuyển target để buff Đoạt Mệnh Cổ cho bản thân","",
  function()
    if not MacroOptions.autoSelfBuff then
      MacroOptions.autoSelfBuff=true
      OutputMessage("MSG_SYS","[Chuyển target để buff Đoạt Mệnh Cổ cho bản thân] > ON\n")
    else
      MacroOptions.autoSelfBuff=false
      OutputMessage("MSG_SYS","[Chuyển target để buff Đoạt Mệnh Cổ cho bản thân] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoHienTe","Dùng Cổ Trùng Hiến Tế ngay khi có thể (không đợi cooldown Linh Xà)","",
  function()
    if not MacroOptions.autoHienTe then
      MacroOptions.autoHienTe=true
      OutputMessage("MSG_SYS","[Dùng Cổ Trùng Hiến Tế ngay khi có thể] > ON\n")
    else
      MacroOptions.autoHienTe=false
      OutputMessage("MSG_SYS","[Dùng Cổ Trùng Hiến Tế ngay khi có thể] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoThienTi","Dùng thêm Thiên Ti trong combo","",
  function()
    if not MacroOptions.autoThienTi then
      MacroOptions.autoThienTi=true
      OutputMessage("MSG_SYS","[Dùng thêm Thiên Ti trong combo] > ON\n")
    else
      MacroOptions.autoThienTi=false
      OutputMessage("MSG_SYS","[Dùng thêm Thiên Ti trong combo] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("rebuffXaAnh","Rebuff Xà Ảnh trước khi pet kích hoạt sát thương","",
  function()
    if not MacroOptions.rebuffXaAnh then
      MacroOptions.rebuffXaAnh=true
      MacroOptions.bLatencyCompensation=false
      OutputMessage("MSG_SYS","[Rebuff Xà Ảnh trước khi pet kích hoạt sát thương] > ON\n")
    else
      MacroOptions.rebuffXaAnh=false
      MacroOptions.bLatencyCompensation=true
      OutputMessage("MSG_SYS","[Rebuff Xà Ảnh trước khi pet kích hoạt sát thương] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoDoatMenhKhoTan","Chuyển đổi Đoạt Mệnh Cổ - Khô Tàn Cổ - Mê Tâm Cổ","",
  function()
    if MacroOptions.autoDoatMenhCo==false and MacroOptions.autoMeTamCo==false and MacroOptions.autoKhoTanCo==true then
      MacroOptions.autoKhoTanCo=false
      OutputMessage("MSG_SYS","Đã lựa chọn [Tự dùng Đoạt Mệnh Cổ hoặc Khô Tàn Cổ tùy theo tình huống]\n")
    elseif MacroOptions.autoDoatMenhCo==false and MacroOptions.autoMeTamCo==false and MacroOptions.autoKhoTanCo==false then
      MacroOptions.autoDoatMenhCo=true
      OutputMessage("MSG_SYS","Đã lựa chọn [Chỉ dùng Đoạt Mệnh Cổ]\n")
    elseif MacroOptions.autoDoatMenhCo==true and MacroOptions.autoMeTamCo==false and MacroOptions.autoKhoTanCo==false then
      MacroOptions.autoDoatMenhCo=false
      MacroOptions.autoMeTamCo=true
      OutputMessage("MSG_SYS","Đã lựa chọn [Chỉ dùng Mê Tâm Cổ]\n")
    elseif MacroOptions.autoDoatMenhCo==false and MacroOptions.autoMeTamCo==true and MacroOptions.autoKhoTanCo==false then
      MacroOptions.autoMeTamCo=false
      MacroOptions.autoKhoTanCo=true
      OutputMessage("MSG_SYS","Đã lựa chọn [Chỉ dùng Khô Tàn Cổ]\n")
    end
  end,
nil)
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
Hotkey.AddBinding("autoVoTuongQuyet","Tự dùng Vô Tướng Quyết khi HP<30%","Macro Thiếu Lâm",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10003 then
      if not MacroOptions.autoVoTuongQuyetDCK then
        MacroOptions.autoVoTuongQuyetDCK=true
        OutputMessage("MSG_SYS","[Tự dùng Vô Tướng Quyết khi HP<30%] > ON\n")
      else
        MacroOptions.autoVoTuongQuyetDCK=false
        OutputMessage("MSG_SYS","[Tự dùng Vô Tướng Quyết khi HP<30%] > OFF\n")
      end
    elseif NoiCong==10002 then
      if not MacroOptions.autoVoTuongQuyetTTK then
        MacroOptions.autoVoTuongQuyetTTK=true
        OutputMessage("MSG_SYS","[Tự dùng Vô Tướng Quyết khi HP<50%] > ON\n")
      else
        MacroOptions.autoVoTuongQuyetTTK=false
        OutputMessage("MSG_SYS","[Tự dùng Vô Tướng Quyết khi HP<50%] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoTuNapCanKhon","Tự buff Tụ Nạp Càn Khôn khi HP<50%","",
  function()
    if not MacroOptions.autoTuNapCanKhon then
      MacroOptions.autoTuNapCanKhon=true
      OutputMessage("MSG_SYS","[Tự buff Tụ Nạp Càn Khôn khi HP<50%] > ON\n")
    else
      MacroOptions.autoTuNapCanKhon=false
      OutputMessage("MSG_SYS","[Tự buff Tụ Nạp Càn Khôn khi HP<50%] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoDiecKhoDiecVinh","Tự buff Diệc Khô Diệc Vinh khi MP<30%","",
  function()
    if not MacroOptions.autoDiecKhoDiecVinh then
      MacroOptions.autoDiecKhoDiecVinh=true
      OutputMessage("MSG_SYS","[Tự buff Diệc Khô Diệc Vinh khi MP<30%] > ON\n")
    else
      MacroOptions.autoDiecKhoDiecVinh=false
      OutputMessage("MSG_SYS","[Tự buff Diệc Khô Diệc Vinh khi MP<30%] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoBatNhaQuyet","Tự buff Bát Nhã Quyết","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10003 then
      if not MacroOptions.autoBatNhaQuyetDCK then
        MacroOptions.autoBatNhaQuyetDCK=true
        OutputMessage("MSG_SYS","[Tự buff Bát Nhã Quyết] > ON\n")
      else
        MacroOptions.autoBatNhaQuyetDCK=false
        OutputMessage("MSG_SYS","[Tự buff Bát Nhã Quyết] > OFF\n")
      end
    elseif NoiCong==10002 then
      if not MacroOptions.autoBatNhaQuyetTTK then
        MacroOptions.autoBatNhaQuyetTTK=true
        OutputMessage("MSG_SYS","[Tự buff Bát Nhã Quyết] > ON\n")
      else
        MacroOptions.autoBatNhaQuyetTTK=false
        OutputMessage("MSG_SYS","[Tự buff Bát Nhã Quyết] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoCamLongQuyet","Tự buff Cầm Long Quyết khi có thể","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10003 then
      if not MacroOptions.autoCamLongQuyetDCK then
        MacroOptions.autoCamLongQuyetDCK=true
        OutputMessage("MSG_SYS","[Tự dùng Cầm Long Quyết] > ON\n")
      else
        MacroOptions.autoCamLongQuyetDCK=false
        OutputMessage("MSG_SYS","[Tự dùng Cầm Long Quyết] > OFF\n")
      end
    elseif NoiCong==10002 then
      if not MacroOptions.autoCamLongQuyetTTK then
        MacroOptions.autoCamLongQuyetTTK=true
        OutputMessage("MSG_SYS","[Tự dùng Cầm Long Quyết] > ON\n")
      else
        MacroOptions.autoCamLongQuyetTTK=false
        OutputMessage("MSG_SYS","[Tự dùng Cầm Long Quyết] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoPhatTamQuyet","Tự buff Phật Tâm Quyết","",
  function()
    p=GetClientPlayer()
    local NoiCong=p.GetKungfuMount().dwSkillID
    if NoiCong==10003 then
      if not MacroOptions.autoPhatTamQuyetDCK then
        MacroOptions.autoPhatTamQuyetDCK=true
        OutputMessage("MSG_SYS","[Tự buff Phật Tâm Quyết] > ON\n")
      else
        MacroOptions.autoPhatTamQuyetDCK=false
        OutputMessage("MSG_SYS","[Tự buff Phật Tâm Quyết] > OFF\n")
      end
    elseif NoiCong==10002 then
      if not MacroOptions.autoPhatTamQuyetTTK then
        MacroOptions.autoPhatTamQuyetTTK=true
        OutputMessage("MSG_SYS","[Tự buff Phật Tâm Quyết] > ON\n")
      else
        MacroOptions.autoPhatTamQuyetTTK=false
        OutputMessage("MSG_SYS","[Tự buff Phật Tâm Quyết] > OFF\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoKimCuongNoMuc","Tự buff Kim Cương Nộ Mục 3 điểm thiền","",
  function()
    if not MacroOptions.autoKimCuongNoMuc then
      MacroOptions.autoKimCuongNoMuc=true
      OutputMessage("MSG_SYS","[Tự buff Kim Cương Nộ Mục 3 điểm thiền] > ON\n")
    else
      MacroOptions.autoKimCuongNoMuc=false
      OutputMessage("MSG_SYS","[Tự buff Kim Cương Nộ Mục 3 điểm thiền] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoQuyKhuLaiCon","Tự dùng Quỷ Khứ Lai Côn","",
  function()
    if not MacroOptions.autoQuyKhuLaiCon then
      MacroOptions.autoQuyKhuLaiCon=true
      OutputMessage("MSG_SYS","[Tự dùng Quỷ Khứ Lai Côn khi BOSS chuyển target khỏi bản thân] > ON\n")
    else
      MacroOptions.autoQuyKhuLaiCon=false
      OutputMessage("MSG_SYS","[Tự dùng Quỷ Khứ Lai Côn khi BOSS chuyển target khỏi bản thân] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoDaiSuTuHong","Tự dùng Đại Sư Tử Hống","",
  function()
    if not MacroOptions.autoDaiSuTuHong then
      MacroOptions.autoDaiSuTuHong=true
      OutputMessage("MSG_SYS","[Tự dùng Đại Sư Tử Hống khi cầm trận và cừu hận top 2 > 70%] > ON\n")
    else
      MacroOptions.autoDaiSuTuHong=false
      OutputMessage("MSG_SYS","[Tự dùng Đại Sư Tử Hống khi cầm trận và cừu hận top 2 > 70%] > OFF\n")
    end
  end,
nil)
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
Hotkey.AddBinding("autoTieuTuyCuong","Tự dùng Tiếu Túy Cuồng khi HP<30%","Macro Cái Bang",
  function()
    if not MacroOptions.autoTieuTuyCuong then
      MacroOptions.autoTieuTuyCuong=true
      OutputMessage("MSG_SYS","[Tự dùng Tiếu Túy Cuồng khi HP<30%] > ON\n")
    else
      MacroOptions.autoTieuTuyCuong=false
      OutputMessage("MSG_SYS","[Tự dùng Tiếu Túy Cuồng khi HP<30%] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoTuuTrungTien","Tự bật Tửu Trung Tiên","",
  function()
    if not MacroOptions.autoTuuTrungTien then
      MacroOptions.autoTuuTrungTien=true
      OutputMessage("MSG_SYS","[Tự bật Tửu Trung Tiên (tăng 20% bạo kích ngoại)] > ON\n")
    else
      MacroOptions.autoTuuTrungTien=false
      OutputMessage("MSG_SYS","[Tự bật Tửu Trung Tiên (tăng 20% bạo kích ngoại)] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoBongDaCauDau1","Dùng Bổng Đả Cẩu Đầu để tích nội lực","",
  function()
    if not MacroOptions.autoBongDaCauDau1 then
      MacroOptions.autoBongDaCauDau1=true
      OutputMessage("MSG_SYS","[Dùng Bổng Đả Cẩu Đầu để tích nội lực] > ON\n")
      if MacroOptions.autoSkillInterrupt then
        MacroOptions.autoSkillInterrupt=false
        OutputMessage("MSG_SYS","[Tự ngắt skill BOSS] > OFF\n")
      end
    else
      MacroOptions.autoBongDaCauDau1=false
      OutputMessage("MSG_SYS","[Dùng Bổng Đả Cẩu Đầu để tích nội lực] > OFF\n")
      if not MacroOptions.autoSkillInterrupt then
        MacroOptions.autoSkillInterrupt=true
        OutputMessage("MSG_SYS","[Tự ngắt skill BOSS] > ON\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoBongDaCauDau2","Dùng Bổng Đả Cẩu Đầu để áp sát","",
  function()
    if not MacroOptions.autoBongDaCauDau2 then
      MacroOptions.autoBongDaCauDau2=true
      OutputMessage("MSG_SYS","[Dùng Bổng Đả Cẩu Đầu để áp sát] > ON\n")
      if MacroOptions.autoSkillInterrupt then
        MacroOptions.autoSkillInterrupt=false
        OutputMessage("MSG_SYS","[Tự ngắt skill BOSS] > OFF\n")
      end
    else
      MacroOptions.autoBongDaCauDau2=false
      OutputMessage("MSG_SYS","[Dùng Bổng Đả Cẩu Đầu để áp sát] > OFF\n")
      if not MacroOptions.autoSkillInterrupt then
        MacroOptions.autoSkillInterrupt=true
        OutputMessage("MSG_SYS","[Tự ngắt skill BOSS] > ON\n")
      end
    end
  end,
nil)
Hotkey.AddBinding("autoYenVuHanh","Dùng Yên Vũ Hành để áp sát","",
  function()
    if not MacroOptions.autoYenVuHanh then
      MacroOptions.autoYenVuHanh=true
      OutputMessage("MSG_SYS","[Dùng Yên Vũ Hành để áp sát] > ON\n")
    else
      MacroOptions.autoYenVuHanh=false
      OutputMessage("MSG_SYS","[Dùng Yên Vũ Hành để áp sát] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("autoThiemChuanKich","Tự dùng Thiêm Chuẩn Kích","",
  function()
    if not MacroOptions.autoThiemChuanKich then
      MacroOptions.autoThiemChuanKich=true
      OutputMessage("MSG_SYS","[Tự dùng Thiêm Chuẩn Kích] > ON\n")
    else
      MacroOptions.autoThiemChuanKich=false
      OutputMessage("MSG_SYS","[Tự dùng Thiêm Chuẩn Kích] > OFF\n")
    end
  end,
nil)
Hotkey.AddBinding("attackMode","Chuyển chế độ đánh Cái Bang","",
  function()
    if MacroOptions.attackMode==2 then
      MacroOptions.attackMode=1
      OutputMessage("MSG_SYS","Đã lựa chọn [Chế độ tích nhanh 8 tầng DOT Kháng Long Hữu Hối]\n")
    elseif MacroOptions.attackMode==1 then
      MacroOptions.attackMode=2
      OutputMessage("MSG_SYS","Đã lựa chọn [Chế độ đánh combo đầy đủ (luôn đánh Giao Long Phiên Giang)]\n")
    end
  end,
nil)