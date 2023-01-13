from django.db import models
from django.utils import timezone
import uuid

# Create your models here

#請在model建立以下資料表 記得最上面些寫這個 UUIDrand function 
def UUIDrand():
    return str(uuid.uuid4())

class LOGIN(models.Model):
    FKcheck=models.CharField(max_length=36, default=UUIDrand)
    Rstate=models.CharField(max_length=42)
    Raccesscode=models.CharField(max_length=43)

class member(models.Model):   #使用者資料表
    MEMID = models.CharField('使用者編號', max_length=43, null=False, primary_key=True, default='')
    PHONE = models.CharField('使用者電話號碼', max_length=10, default='')
    ADDRESS = models.CharField('使用者地址', max_length=25, default='')
    AUTHORIZATION = models.CharField('授權', max_length=1)
    CARD1 = models.CharField('信用卡卡號1', max_length=16, default='無')
    CARD2 = models.CharField('信用卡卡號2', max_length=16, default='無')
    CARD3 = models.CharField('信用卡卡號3', max_length=16, default='無')
    CARD4 = models.CharField('信用卡卡號4', max_length=16, default='無')
    CARD5 = models.CharField('信用卡卡號5', max_length=16, default='無')
    AC_CODE = models.CharField(max_length=43)
    WPRE = models.CharField('洗衣偏好', max_length=15, default='標準')
    DPRE = models.CharField('烘衣偏好', max_length=15, default='日曬')
    FPRE = models.CharField('摺衣偏好', max_length=15, default='不折')
    GPRE = models.CharField('送洗偏好', max_length=15, default='自行送洗')
    CPRE = models.CharField('領取偏好', max_length=15, default='自取')


class hstate(models.Model):   #訂單狀態追蹤資料表
    ORDID1 = models.AutoField('訂單編號', null=False, primary_key=True)
    MEMID1 = models.CharField('使用者編號', max_length=43, null=False, default='')
    APPID1 = models.IntegerField('app編號', null=False, default=5)
    C_AMOUNT1 = models.IntegerField('花費的碳稅', null=False, default=0)
    GPOINT1 = models.IntegerField('獲得的點數', null=False, default=0)
    AMOUNT1 = models.IntegerField('消費總金額', null=False, default=0)
    CDATE1 = models.DateTimeField('成立時間', null=False, default='')
    WMODE1 = models.CharField('洗滌模式', max_length=10, default='')
    LMODE1 = models.CharField('乾燥模式', max_length=10, default='')
    FMODE1 = models.CharField('摺衣模式', max_length=10, default='')
    GIVE1 = models.CharField('送洗方式', max_length=15, null= False, default='')
    COLLAR1 = models.CharField('領取方式', max_length=15, null=False, default='')
    ADDITION1 = models.CharField('加購商品', max_length=100, default='無')
    HDATE1 = models.IntegerField('處理衣物時長', default=0)
    SHOPID1 = models.CharField('店鋪編號', max_length=10, null=False, default='')
    WMID1 = models.CharField('洗烘衣機編號', max_length=10, default='')
    FMID1 = models.CharField('摺衣機編號', max_length=10, default='')
    LOCKID1 = models.CharField('鎖櫃編號', max_length=10, default='')
    BAGID1 = models.CharField('洗衣袋編號', max_length=10, default='')
    PFTIME1 = models.DateTimeField('預計完成的時間', default='')
    CLTIME1 = models.DateTimeField('領取時間', default='')
    CLOTH1 = models.CharField('衣服處理', max_length=15, default='')
    COLSTATE1 = models.CharField('領取狀態', max_length=15, default='')
    PAYSTATE1 = models.CharField('付款狀態', max_length=15, default='')
    JS1 = models.CharField('js1', max_length=15, default='')
    JS2 = models.CharField('js2', max_length=15, default='')
    JS3 = models.CharField('js3', max_length=15, default='')
    JS4 = models.CharField('js4', max_length=15, default='')
    JS5 = models.CharField('js5', max_length=15, default='')
    JS6 = models.CharField('js6', max_length=15, default='')
    JS7 = models.CharField('js7', max_length=15, default='')
    QRCODE = models.CharField('qrcode圖片路徑', max_length=50, default='')
    ACTIVATE = models.CharField('activate', max_length=15, default='')


class order(models.Model):   #訂單歷史資料表 (19個欄位)
    ORDID = models.CharField('訂單編號', max_length=15, null=False, primary_key=True, default='')
    MEMID = models.CharField('使用者編號', max_length=43, null=False, default='')
    APPID = models.IntegerField('app編號', null=False, default=5)
    C_AMOUNT = models.IntegerField('花費的碳稅', null=False, default=0)
    GPOINT = models.IntegerField('獲得的點數', null=False, default=0)
    AMOUNT = models.IntegerField('消費總金額', null=False, default=0)
    CDATE = models.DateTimeField('成立時間', null=False, default='')
    WMODE = models.CharField('洗滌模式', max_length=10,null=False, default='')
    LMODE = models.CharField('乾燥模式', max_length=10, null=False, default='')
    FMODE = models.CharField('摺衣模式', max_length=10, null=False, default='')
    GIVE = models.CharField('送洗方式', max_length=15, null= False, default='')
    COLLAR = models.CharField('領取方式', max_length=15, null=False, default='')
    ADDITION = models.CharField('加購商品', max_length=100, null=False, default='無')
    HDATE = models.IntegerField('處理衣物時長', null=False, default=0)
    SHOPID = models.CharField('店鋪編號', max_length=10, null=False, default='')
    WMID = models.CharField('洗烘衣機編號', max_length=10, null=False, default='')
    FMID = models.CharField('摺衣機編號', max_length=10, null=False, default='')
    LOCKID = models.CharField('鎖櫃編號', max_length=10 ,null=False, default='')
    BAGID = models.CharField('洗衣袋編號', max_length=10, null=False, default='')
    CLTIME = models.DateTimeField('領取時間', default='')


class wlmachin(models.Model):   #洗衣烘衣資料表
    ID = models.AutoField('編號', null=False, primary_key=True)
    WMID = models.CharField('洗烘衣機編號', max_length=10, null=False, default='')
    ORDID = models.CharField('訂單編號', max_length=10, null=False, default='')
    TIME = models.IntegerField('所需時間', null=False, default=0)
    WMODE = models.CharField('洗衣模式', max_length=10, null=False, default='')
    LMODE = models.CharField('乾燥模式', max_length=10, null=False, default='')


class flmachin(models.Model):   #摺衣資料表
    ID = models.AutoField('編號', null=False, primary_key=True)
    FMID = models.CharField('摺衣機編號', max_length=10, null=False, default='')
    ORDID = models.CharField('訂單編號', max_length=10, null=False, default='')
    TIME = models.IntegerField('所需時間', null=False, default=0)
    FMODE = models.CharField('摺衣模式', max_length=10, null=False, default='')


class addpur(models.Model):   #加購商品資料表
    APID = models.CharField('加購產品編號', max_length=10, null=False, primary_key=True, default='')
    APNAME = models.CharField('加購產品名稱', max_length=15, null=False, default='')
    APSIZE = models.CharField('尺寸', max_length=10, null=False, default='')
    APCOLOR = models.CharField('顏色', max_length=10, null=False, default='')
    APPRICE = models.IntegerField('價格', null=False, default='')


class store(models.Model):   #店鋪資料表
    SHOPID = models.CharField('店鋪編號', max_length=10, null=False, primary_key=True, default='')
    ADDRESS = models.CharField('店家地址', max_length=25, null=False, default='')
    WMAMOUNT = models.IntegerField('洗烘衣機數量', null=False, default=0)
    FMAMOUNT = models.IntegerField('摺衣機數量', null=False, default=0)


class lock(models.Model):   #鎖櫃處理資料表
    ID = models.AutoField('編號', null=False, primary_key=True)
    LOCKID = models.CharField('鎖櫃編號', max_length=10, null=False, default='')
    ORDID = models.CharField('訂單編號', max_length=10, null=False, default='')
    INDATE = models.CharField('進入時間', max_length=50, default='')
    OUTDATE = models.CharField('出來時間', max_length=50, default='')



class mode(models.Model):   #模式資料表
    MODE = models.CharField('模式名稱', max_length=10, null=False, primary_key=True, default='')
    TIME = models.IntegerField('所需時間', null=False, default=0)
    MONEY = models.IntegerField('價格', null=False, default=0)
    TAX = models.IntegerField('碳稅', null=False, default=0)
    POINTS = models.IntegerField('碳點數', null=False, default=0)


class report(models.Model):   #問題回報資料表
    ID = models.AutoField('編號', null=False, primary_key=True)
    MEMID = models.CharField('使用者編號', max_length=43, null=False, default='')
    RDATE = models.DateTimeField('回報時間', null=False, default='')
    TITLE = models.CharField('問題標題', max_length=50, default='')
    DISC = models.CharField('問題描述', max_length=500, null=False, default='')



class bag(models.Model):   #洗衣袋資料表
    BID = models.CharField('洗衣袋編號', max_length=10, null=False, primary_key=True, default='')
    STATE = models.CharField('狀態', max_length=10, null=False, default='')


class wmachineinfo(models.Model):   #洗烘衣機資料表
    WMID = models.CharField('洗烘衣機編號', max_length=15, null=False, primary_key=True, default='')
    STATE = models.CharField('使用狀態', max_length=10, null=False, default='')


class fmachineinfo(models.Model):   #摺衣機資料表
    FMID = models.CharField('摺衣機編號', max_length=15, null=False, primary_key=True, default='')
    STATE = models.CharField('使用狀態', max_length=10, null=False, default='')


class lockerinfo(models.Model):   #鎖櫃資料表
    LOCKID = models.CharField('鎖櫃編號', max_length=15, null=False, primary_key=True, default='')
    STATE = models.CharField('使用狀態', max_length=10, null=False, default='')


class delivery(models.Model):   #外送資料表
    ORDID = models.CharField('訂單編號', max_length=10, null=False, primary_key=True, default='')
    SHOPID = models.CharField('店鋪編號', max_length=10, null=False, default='')
    PHONE = models.CharField('使用者電話號碼', max_length=15, null=False, default='')
    ADDRESS = models.CharField('使用者地址', max_length=25, null=False, default='')
    GDATE = models.DateTimeField('取件時間', null=False, default='')
    S_CODE = models.ImageField('取件條碼', null=False, default='')
    G_CODE = models.ImageField('送件條碼', null=False, default='')


class notice(models.Model):   #通知資料表
    NID = models.AutoField('通知編號', null=False, primary_key=True)
    MEMID = models.CharField('使用者編號', max_length=43, default='')
    NCONTENT = models.CharField('通知內容', max_length=100, default='')
    NLINK = models.CharField('通知連接', max_length=100, default='')
    NTIME = models.DateTimeField('通知時間', default='')
    


