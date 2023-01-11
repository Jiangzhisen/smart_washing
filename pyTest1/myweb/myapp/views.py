from django.shortcuts import render, redirect
from django.http import HttpResponse
import datetime
from myapp.models import member, hstate, order, wlmachin, flmachin, addpur, store, lock, mode, report, bag, delivery, wmachineinfo, fmachineinfo, lockerinfo, notice, LOGIN
from django.http import Http404, HttpResponse, HttpResponseRedirect
from django.contrib import auth, messages
from django.views.decorators.csrf import csrf_exempt
import requests
import qrcode
# from django.shortcuts import get_object_or_404, get_list_or_404 # 快捷函数

# Create your views here.

#進入view
#建立SACCngrok及自己的serverngrok
SACCngrok = "https://10eb-1-34-54-152.jp.ngrok.io"
serverngrok = "https://b4f4-111-251-2-75.jp.ngrok.io"

#第一步 登入介面的view，每次重整都會run一次
def login2_view(request):
    sum=""
    rand=LOGIN.objects.create()
    # print(rand.FKcheck)
    # print(type(rand.FKcheck))
    url = SACCngrok+'/RESTapiApp/Line_1/?Rbackurl='+serverngrok+'/api2/?fk='+rand.FKcheck
    req=requests.get(url,headers = {'Authorization': 'Token d0b6207c6070bf62db605177d9710e028cd08e4f','ngrok-skip-browser-warning': '7414'})
    print(req.json())
    req_read = req.json()
    print(req_read["Rstate"])
    LOGIN.objects.filter(FKcheck = rand.FKcheck).update(Rstate=req_read["Rstate"])
    firstLogin="https://access.line.me/oauth2/v2.1/authorize?response_type=code&client_id=1657781063&redirect_uri="+SACCngrok+"/LineLoginApp/callback&state="+req_read["Rstate"]+"&scope=profile%20openid%20email&promot=consent&ui_locales=zh-TW?http://example.com/?ngrok-skip-browser-warning=7414"

    return render(request, 'page/login.html', locals())
# 前端登入按鈕：<a href="{{ firstLogin }}"><button type="button" class="btn btn-outline-success">使用line登入</button></a>

#第二步
def api2(request):
    if request.method == 'GET':
        fknum = request.GET.get('fk')
        nomatter=LOGIN.objects.filter(FKcheck = fknum)
        sum=''
        for i in nomatter:
            sum=i.Rstate
    url = SACCngrok+'/RESTapiApp/Line_2/?Rstate='+sum
    req=requests.get(url,headers = {'Authorization': 'Token d0b6207c6070bf62db605177d9710e028cd08e4f','ngrok-skip-browser-warning': '7414'})
    req_read = req.json()
    print(req_read)
    userUID=req_read["RuserID"]
    access_code=req_read["Raccess_code"]
    print(req_read["Raccess_code"])

    return login2(request, userUID, access_code)

def login2(request, userUID, access_code):
    userid = userUID
    memberone = member.objects.filter(MEMID = userid).values()
    if memberone:
        member.objects.filter(MEMID = userid).update(AC_CODE = access_code)
        return Login_and_AddSession(request, userid)
    else:
        member.objects.create(
            MEMID = userUID,
            AUTHORIZATION = "0",
            AC_CODE = access_code
        )
        return Login_and_AddSession(request, userid)
    
    
def Login_and_AddSession(request, userid):
    userUID1 = userid
    if userUID1 in request.session:
        try:
            del request.session['user']
        except:
            pass
    request.session['user'] = userUID1
    request.session.modified = True
    request.session.set_expiry(60*30) #存在30分鐘
    memberone = member.objects.filter(MEMID = userUID1).values()
    auth = memberone[0]['AUTHORIZATION']
    if auth == "1":
        return HttpResponseRedirect('/index/')
    else:
        return HttpResponseRedirect('/privacypolicy/')


#第三步（非必要，要拿個資才要寫！ 此範例只有拿取line頭貼，若想取得其他資料請print req_read2）
def access(request):
    userid = request.session['user']
    results=member.objects.filter(MEMID = userid)
    ac_code=''
    for result in results:
        ac_code = result.AC_CODE
    url2=SACCngrok+'/RESTapiApp/Access/?Raccess_code='+ac_code
    req2=requests.get(url2,headers = {'Authorization': 'Token d0b6207c6070bf62db605177d9710e028cd08e4f','ngrok-skip-browser-warning': '7414'})
    
    req_read2 = req2.json()
    print (req_read2)
    print(type(req2.status_code))
    if (req2.status_code!=200):
        print("================================")
        messages.error(request, '存取權已過期，請重新登入')
        logout(request)
    else:
        phone = req_read2["sPhone"]
        address = req_read2["sAddress"]
        return {"phone":phone, "address":address}


def logout(request):
    del request.session['user']
    return HttpResponseRedirect('/login/')
    

def privacy_policy(request):
    return render(request, 'page/privacypolicy.html', locals())

def privacy_policy2(request):
    userid = request.session['user']
    noticelist = notice.objects.filter(MEMID = userid).values()
    return render(request, 'page/privacypolicy2.html', locals())

def card(request):
    auth = request.GET['auth']
    userid = request.session['user']
    user = member.objects.get(MEMID = userid)
    star = "* * * * * * * * *"

    if user != None:
        member.objects.filter(MEMID = userid).update(AUTHORIZATION = auth)
    
    user1 = member.objects.filter(MEMID = userid).values()
    cardinfo = []

    if user1[0]['CARD1'] != "無":
        a1 = user1[0]['CARD1']
        a2 = a1[0:3]
        a3 = a1[12:17]
        a4 = a2+star+a3
        cardinfo.append(a4)
    if user1[0]['CARD2'] != "無":
        b1 = user1[0]['CARD2']
        b2 = b1[0:3]
        b3 = b1[12:17]
        b4 = b2+star+b3
        cardinfo.append(b4)
    if user1[0]['CARD3'] != "無":
        c1 = user1[0]['CARD3']
        c2 = c1[0:3]
        c3 = c1[12:17]
        c4 = c2+star+c3
        cardinfo.append(c4)
    if user1[0]['CARD4'] != "無":
        d1 = user1[0]['CARD4']
        d2 = d1[0:3]
        d3 = d1[12:17]
        d4 = d2+star+d3
        cardinfo.append(d4)
    if user1[0]['CARD5'] != "無":
        e1 = user1[0]['CARD5']
        e2 = e1[0:3]
        e3 = e1[12:17]
        e4 = e2+star+e3
        cardinfo.append(e4)

    return render(request, 'page/payment.html', locals())


def add_card(request):
    cardnum1 = request.GET['cardnum1']
    cardnum2 = request.GET['cardnum2']
    cardnum3 = request.GET['cardnum3']
    cardnum4 = request.GET['cardnum4']
    cardnum = cardnum1+cardnum2+cardnum3+cardnum4
    
    userid = request.session['user']
    user = member.objects.filter(MEMID = userid).values()
    if user[0]['CARD1'] == "無":
        member.objects.filter(MEMID = userid).update(CARD1 = cardnum)
    else:
        if user[0]['CARD2'] == "無":
            member.objects.filter(MEMID = userid).update(CARD2 = cardnum)
        else:
            if user[0]['CARD3'] == "無":
                member.objects.filter(MEMID = userid).update(CARD3 = cardnum)
            else:
                if user[0]['CARD4'] == "無":
                    member.objects.filter(MEMID = userid).update(CARD4 = cardnum)
                else:
                    member.objects.filter(MEMID = userid).update(CARD5 = cardnum)
    
    return redirect('/index/', locals())

def card1(request):
    userid = request.session['user']
    user1 = member.objects.filter(MEMID = userid).values()
    cardinfo = []
    star = "* * * * * * * * *"

    if user1[0]['CARD1'] != "無":
        a1 = user1[0]['CARD1']
        a2 = a1[0:3]
        a3 = a1[12:17]
        a4 = a2+star+a3
        cardinfo.append(a4)
    if user1[0]['CARD2'] != "無":
        b1 = user1[0]['CARD2']
        b2 = b1[0:3]
        b3 = b1[12:17]
        b4 = b2+star+b3
        cardinfo.append(b4)
    if user1[0]['CARD3'] != "無":
        c1 = user1[0]['CARD3']
        c2 = c1[0:3]
        c3 = c1[12:17]
        c4 = c2+star+c3
        cardinfo.append(c4)
    if user1[0]['CARD4'] != "無":
        d1 = user1[0]['CARD4']
        d2 = d1[0:3]
        d3 = d1[12:17]
        d4 = d2+star+d3
        cardinfo.append(d4)
    if user1[0]['CARD5'] != "無":
        e1 = user1[0]['CARD5']
        e2 = e1[0:3]
        e3 = e1[12:17]
        e4 = e2+star+e3
        cardinfo.append(e4)
    
    noticelist = notice.objects.filter(MEMID = userid).values()

    return render(request, 'page/payment1.html', locals())

def index(request):
    data = access(request)
    print(data)
    getphone = data.get("phone")
    getaddress = data.get("address")
    userid = request.session['user']
    noticelist = notice.objects.filter(MEMID = userid).values()
    member.objects.filter(MEMID = userid).update(PHONE = getphone, ADDRESS = getaddress)

    return render(request, 'index.html', locals())

def laundry(request):
    userid = request.session['user']
    noticelist = notice.objects.filter(MEMID = userid).values()

    #儲存個人洗衣偏好
    setpre = {
        "標準": "",
        "精緻": "",
        "柔洗": "",
        "快洗": "",
        "日曬": "",
        "低溫烘乾": "",
        "中溫烘乾": "",
        "高溫烘乾": "",
        "不折": "",
        "機器人": "",
        "自行送洗一": "",
        "外送服務一": "",
        "自取": "",
        "外送服務": ""
    }
    memberpre = member.objects.filter(MEMID = userid).values()
    wpre = memberpre[0]['WPRE']
    dpre = memberpre[0]['DPRE']
    fpre = memberpre[0]['FPRE']
    gpre = memberpre[0]['GPRE']
    gpre1 = gpre+"一"
    
    cpre = memberpre[0]['CPRE']
    setpre[wpre] = "checked"
    setpre[dpre] = "checked"
    setpre[fpre] = "checked"
    setpre[gpre1] = "checked"
    setpre[cpre] = "checked"

    return render(request, 'page/laundry.html', locals())

def purchase(request):
    userid = request.session['user']
    noticelist = notice.objects.filter(MEMID = userid).values()
    washing = request.GET['washing']
    drying = request.GET['drying']
    fold = request.GET['fold']
    give = request.GET['give']
    collar = request.GET['collar']

    return render(request, 'page/purchase.html', locals())

def order_confirmation(request):
    userid = request.session['user']   #使用者編號
    noticelist = notice.objects.filter(MEMID = userid).values()
    washing = request.GET['washing']   #洗滌模式
    drying = request.GET['drying']   #乾燥模式
    fold1 = request.GET['fold']   #折衣模式
    give = request.GET['give']   #送洗方式
    collar = request.GET['collar']   #領取方式

    pname1 = request.GET['pname1']
    size1 = request.GET['size1']
    color1 = request.GET['color1']
    quantity1 = int(request.GET['quantity1'])
    pmoney1 = 0

    pname2 = request.GET['pname2']
    size2 = request.GET['size2']
    color2 = request.GET['color2']
    quantity2 = int(request.GET['quantity2'])
    pmoney2 = 0

    pname3 = request.GET['pname3']
    size3 = request.GET['size3']
    color3 = request.GET['color3']
    quantity3 = int(request.GET['quantity3'])
    pmoney3 = 0

    allpname = "無"   #加購商品詳細資料

    wash = mode.objects.filter(MODE = washing).values()
    dry = mode.objects.filter(MODE = drying).values()
    fold = mode.objects.filter(MODE = fold1).values()

    wmoney = wash[0]['MONEY']
    wtax = wash[0]['TAX']
    wpoints = wash[0]['POINTS']
    wtime = int(wash[0]['TIME'])

    dmoney = dry[0]['MONEY']
    dtax = dry[0]['TAX']
    dpoints = dry[0]['POINTS']
    dtime = int(dry[0]['TIME'])

    fmoney = fold[0]['MONEY']
    ftax = fold[0]['TAX']
    fpoints = fold[0]['POINTS']
    ftime = int(fold[0]['TIME'])

    if quantity1 == 0:
        pmoney1 = 0
    else:
        adp1 = addpur.objects.filter(APNAME = pname1, APSIZE = size1, APCOLOR = color1).values()
        pmoney1 = int(adp1[0]['APPRICE'])*quantity1
        allpname = ""
        allpname += color1+pname1+size1+"x"+str(quantity1)+","

    if quantity2 == 0:
        pmoney2 = 0
    else:
        adp2 = addpur.objects.filter(APNAME = pname2, APSIZE = size2, APCOLOR = color2).values()
        pmoney2 = int(adp2[0]['APPRICE'])*quantity2
        allpname += color2+pname2+size2+"x"+str(quantity2)+","

    if quantity3 == 0:
        pmoney3 = 0
    else:
        adp3 = addpur.objects.filter(APNAME = pname3, APSIZE = size3, APCOLOR = color3).values()
        pmoney3 = int(adp3[0]['APPRICE'])*quantity3
        allpname += color3+pname3+size3+"x"+str(quantity3)+","

    totalmoney = 50+wmoney+dmoney+fmoney+wtax+dtax+ftax+pmoney1+pmoney2+pmoney3   #消費總金額
    totalpoint = 20+wpoints+dpoints+fpoints   #獲得的點數
    totaltime = wtime+dtime+ftime   #處理衣物時長
    totaltax = wtax+dtax+ftax   #花費的碳稅

    needtime = float((totaltime+120)/60)

    loc_dt = datetime.datetime.now()
    time_del = datetime.timedelta(hours = needtime) 
    new_dt = loc_dt + time_del 
    datetime_format = new_dt.strftime("%Y-%m-%d %H:%M")   #預計完成的時間


    datechose = []
    for i in range(1, 13):
        time_del1 = datetime.timedelta(hours = i*2) 
        new_dt1 = new_dt+time_del1
        datetime_format1 = new_dt1.strftime("%Y-%m-%d %H:%M")
        datechose.append(str(datetime_format1))


    return render(request, 'page/order_confirmation.html', locals())

def order_sent(request):   #目前app編號和店舖編號都是寫死的
    washing = request.GET['washing']   #洗滌模式
    drying = request.GET['drying']   #乾燥模式
    fold1 = request.GET['fold1']   #摺衣模式
    give = request.GET['give']   #送洗方式
    collar = request.GET['collar']   #領取方式
    allpname = request.GET['allpname']   #加購商品
    totalmoney = request.GET['totalmoney']   #消費總金額
    totalpoint = request.GET['totalpoint']   #獲得的點數
    totaltime = request.GET['totaltime']   #處理衣物時長
    totaltax = request.GET['totaltax']   #花費的碳稅
    needtime = float(request.GET['needtime'])
    loc_dt = datetime.datetime.now()
    time_del = datetime.timedelta(hours = needtime) 
    new_dt = loc_dt + time_del 
    datetime_format = new_dt.strftime("%Y-%m-%d %H:%M")   #預計完成的時間
    cldate = request.GET['cldate']   #領取時間
    userid = request.session['user']   #使用者編號
    noticelist = notice.objects.filter(MEMID = userid).values()
    appid = "5"   #app編號
    shopid = "S000001"   #店鋪編號
    loc_dt = datetime.datetime.now()
    cdate = loc_dt.strftime("%Y-%m-%d %H:%M")   #成立時間

    wmlist = wmachineinfo.objects.filter(STATE = "未使用").values()
    fmlist = fmachineinfo.objects.filter(STATE = "未使用").values()
    lklist = lockerinfo.objects.filter(STATE = "未使用").values()
    bglist = bag.objects.filter(STATE = "未租借").values()
    usewm = wmlist[0]['WMID']   #洗烘衣機編號
    usefm = fmlist[0]['FMID']   #摺衣機編號
    uselk = lklist[0]['LOCKID']   #鎖櫃編號
    usebg = bglist[0]['BID']   #洗衣袋編號
    bag.objects.filter(BID = usebg).update(STATE = "已租借")
    wmachineinfo.objects.filter(WMID = usewm).update(STATE = "已使用")
    fmachineinfo.objects.filter(FMID = usefm).update(STATE = "已使用")
    lockerinfo.objects.filter(LOCKID = uselk).update(STATE = "已使用")

    hstate.objects.create(
        MEMID1 = userid, 
        APPID1 = appid, 
        C_AMOUNT1 = totaltax, 
        GPOINT1 = totalpoint, 
        AMOUNT1 = totalmoney, 
        CDATE1 = cdate, 
        WMODE1 = washing,
        LMODE1 = drying,
        FMODE1 = fold1,
        GIVE1 = give,
        COLLAR1 = collar,
        ADDITION1 = allpname,
        HDATE1 = totaltime,
        SHOPID1 = shopid,
        WMID1 = usewm,
        FMID1 = usefm,
        LOCKID1 = uselk,
        BAGID1 = usebg,
        PFTIME1 = datetime_format,
        CLTIME1 = cldate,
        CLOTH1  = "未處理",
        COLSTATE1 = "尚未能領取",
        PAYSTATE1 = "未付款"
    )

    haveorder = hstate.objects.filter(MEMID1 = userid).values()
    for data in haveorder:
        orderidmark = str(data['ORDID1'])
        js1 = "#QR"+str(orderidmark) #  #QR1
        js2 = "#QR_show"+str(orderidmark)   #  #QR_show1
        js3 = "#close"+str(orderidmark)   #  #close1
        js4 = "QR"+str(orderidmark)   #  QR1
        js5 = "QR_show"+str(orderidmark)   #  QR_show1
        js6 = "close"+str(orderidmark)   #  close1
        js7 = "btn"+str(orderidmark)   #   btn1

        message = "訂單編號: "+orderidmark
        img = qrcode.make(message)
        img.save("static/img/qrcode/qrcode"+orderidmark+".png")
        messagepath = "../../static/img/qrcode/qrcode"+orderidmark+".png"

        hstate.objects.filter(MEMID1 = userid, ORDID1 = orderidmark).update(
            JS1 = js1, 
            JS2 = js2, 
            JS3 = js3, 
            JS4 = js4, 
            JS5 = js5, 
            JS6 = js6, 
            JS7 = js7,
            QRCODE = messagepath
            )
    
    newestid = orderidmark
    lock.objects.create(LOCKID = uselk, ORDID = newestid, INDATE = datetime_format)
    orderwmode = mode.objects.filter(MODE = washing).values()
    wmodetime = int(orderwmode[0]['TIME'])
    orderlmode = mode.objects.filter(MODE = drying).values()
    lmodetime = int(orderlmode[0]['TIME'])
    wlmodetime = wmodetime+lmodetime   #洗烘所需時間
    orderftime = mode.objects.filter(MODE = fold1).values()
    fmodetime = int(orderftime[0]['TIME'])   #摺衣所需時間
    flmachin.objects.create(FMID = usefm, ORDID = newestid, TIME = fmodetime, FMODE = fold1)
    wlmachin.objects.create(WMID = usewm, ORDID = newestid, TIME = wlmodetime, WMODE = washing, LMODE = drying)

    if give == "外送服務" or collar == "外送服務":
        memberone = member.objects.filter(MEMID = userid).values()
        phone = memberone[0]['PHONE']
        address = memberone[0]['ADDRESS']

        delivery.objects.create(
            ORDID = newestid,
            SHOPID = shopid,
            PHONE = phone,
            ADDRESS = address,
            GDATE = cldate
        )

    return render(request, 'page/order_sent.html', locals())


def order_tracking(request):
    userid = request.session['user']
    noticelist = notice.objects.filter(MEMID = userid).values()
    handlestate = "處理中"
    count=0
    tem=""
    show="no"
    ordernum = []
    handle = hstate.objects.filter(MEMID1 = userid).values()

    for data in handle:   #下方白色條
        tem="Slide "+str(count)
        everyorder = {"a1": count, "b1": tem}
        ordernum.append(everyorder)
        count+=1
    if count >= 2:
        show = "yes"

    if handle:
        for data in handle:
            ftime = handle[0]['PFTIME1']
            orderid = handle[0]['ORDID1']
            time = datetime.datetime.now()
            if time > ftime:
                hstate.objects.filter(MEMID1 = userid, ORDID1 = orderid).update(CLOTH1 = "已完成", COLSTATE1 = "可領取")        

    return render(request, 'page/order_tracking5.html', locals())


def map(request):
    userid = request.session['user']
    noticelist = notice.objects.filter(MEMID = userid).values()
    return render(request, 'page/map.html', locals())


def historical(request):
    userid = request.session['user']
    orderlist = order.objects.filter(MEMID = userid).values()
    noticelist = notice.objects.filter(MEMID = userid).values()
    return render(request, 'page/historical.html', locals())

def problemreturns(request):
    userid = request.session['user']
    noticelist = notice.objects.filter(MEMID = userid).values()
    return render(request, 'page/problemreturns.html', locals())

def teaching(request):
    userid = request.session['user']
    noticelist = notice.objects.filter(MEMID = userid).values()
    return render(request, 'page/teaching.html', locals())

def finish_confirmation(request):
    userid = request.session['user']
    noticelist = notice.objects.filter(MEMID = userid).values()
    orderid = request.GET['orderid']
    return render(request, 'page/order_payment_confirmation.html', locals())

def payment_confirmation(request):
    userid = request.session['user']
    noticelist = notice.objects.filter(MEMID = userid).values()
    orderid1 = request.GET['orderid']
    orderinfo = hstate.objects.filter(MEMID1 = userid, ORDID1 = orderid1).values()
    washing = orderinfo[0]['WMODE1']
    drying = orderinfo[0]['LMODE1']
    folding = orderinfo[0]['FMODE1']
    give = orderinfo[0]['GIVE1']
    collect = orderinfo[0]['COLLAR1']
    addition = orderinfo[0]['ADDITION1']
    point = orderinfo[0]['GPOINT1']
    tax = orderinfo[0]['C_AMOUNT1']
    money = orderinfo[0]['AMOUNT1']

    paymentlist = member.objects.filter(MEMID = userid).values()
    payments = []
    card1 = paymentlist[0]['CARD1']
    if card1 != "無":
        payments.append(card1)
    card2 = paymentlist[0]['CARD2']
    if card2 != "無":
        payments.append(card2)
    card3 = paymentlist[0]['CARD3']
    if card3 != "無":
        payments.append(card3)
    card4 = paymentlist[0]['CARD4']
    if card4 != "無":
        payments.append(card4)
    card5 = paymentlist[0]['CARD5']
    if card5 != "無":
        payments.append(card5)

    return render(request, 'page/payment_options.html', locals())

def sendtoone(request, cdate, point):
    userid = request.session['user']
    requests.post('我的ngrok網址/SA_ALL/news/history/', data = {
        "USER_PHONE": userid,   #userID
        "APP_ID": "5",   #智慧喜＋之類的
        "DATE": cdate,
        "POINT": point,
        "DETAIL": "第五組智慧喜測試",   #隨便打
        "TANPI":50   #碳排放量（若你們沒有的話就一樣隨便打）
    })

    return render(request, 'page/payment_completed.html', locals())


def payment_complete(request):
    userid = request.session['user']   #使用者編號
    noticelist = notice.objects.filter(MEMID = userid).values()
    orderid2 = request.GET['orderid2']   #訂單編號
    thatorder = hstate.objects.filter(MEMID1 = userid, ORDID1 = orderid2).values()
    appid = thatorder[0]['APPID1']   #app編號
    tax = thatorder[0]['C_AMOUNT1']   #花費的碳稅
    point = thatorder[0]['GPOINT1']   #獲得的點數
    money = thatorder[0]['AMOUNT1']   #消費總金額
    cdate = thatorder[0]['CDATE1']    #成立時間
    washing = thatorder[0]['WMODE1']  #洗滌模式
    drying = thatorder[0]['LMODE1']   #乾燥模式
    folding = thatorder[0]['FMODE1']  #摺衣模式
    give = thatorder[0]['GIVE1']   #送洗方式
    collar =  thatorder[0]['COLLAR1']   #領取方式
    addition = thatorder[0]['ADDITION1']  #加購商品
    hdate = thatorder[0]['HDATE1']   #處理衣物時長
    shopid = thatorder[0]['SHOPID1']   #店鋪編號
    wmid = thatorder[0]['WMID1']   #洗烘衣機編號
    fmid = thatorder[0]['FMID1']   #摺衣機編號
    lockid = thatorder[0]['LOCKID1']   #鎖櫃編號
    bagid = thatorder[0]['BAGID1']   #洗衣袋編號
    cltime = thatorder[0]['CLTIME1']   #領取時間

    bag.objects.filter(BID = bagid).update(STATE = "未租借")
    wmachineinfo.objects.filter(WMID = wmid).update(STATE = "未使用")
    fmachineinfo.objects.filter(FMID = fmid).update(STATE = "未使用")
    lockerinfo.objects.filter(LOCKID = lockid).update(STATE = "未使用")
    lock.objects.filter(LOCKID = lockid, ORDID = orderid2).update(OUTDATE = cltime)

    order.objects.create(
        ORDID = orderid2,
        MEMID = userid,
        APPID = appid,
        C_AMOUNT = tax,
        GPOINT = point,
        AMOUNT = money,
        CDATE = cdate,
        WMODE = washing,
        LMODE = drying,
        FMODE = folding,
        GIVE = give,
        COLLAR = collar,
        ADDITION = addition,
        HDATE = hdate,
        SHOPID = shopid,
        WMID = wmid,
        FMID = fmid,
        LOCKID = lockid,
        BAGID = bagid,
        CLTIME = cltime
    )

    thatorder1 = hstate.objects.filter(MEMID1 = userid, ORDID1 = orderid2)
    thatorder1.delete()

    return sendtoone(request, cdate, point)


def report_sent(request):
    userid = request.session['user']
    noticelist = notice.objects.filter(MEMID = userid).values()
    title = request.GET['title']
    content = request.GET['content']
    loc_dt = datetime.datetime.now()
    nowtime = loc_dt.strftime("%Y-%m-%d %H:%M") 
    report.objects.create(
        MEMID = userid,
        RDATE = nowtime,
        TITLE = title,
        DISC = content
    )

    return render(request, 'page/report_success.html', locals())

def washing_confirmation(request):
    userid = request.session['user']
    noticelist = notice.objects.filter(MEMID = userid).values()
    thatorderid = request.GET['orderid']
    handle = hstate.objects.filter(MEMID1 = userid, ORDID1 = thatorderid).values()
    washing = handle[0]['WMODE1']
    drying = handle[0]['LMODE1']
    fold1 = handle[0]['FMODE1']
    give = handle[0]['GIVE1']
    collar = handle[0]['COLLAR1']
    allpname = handle[0]['ADDITION1']
    totalpoint = handle[0]['GPOINT1']
    totalmoney = handle[0]['AMOUNT1']
    datetime_format = handle[0]['PFTIME1']
    coltime = handle[0]['CLTIME1']

    return render(request, 'page/washing_confirmation.html', locals())


def laundry_success(request):
    userid = request.session['user']
    noticelist = notice.objects.filter(MEMID = userid).values()
    orderidid = request.GET['orderid']
    orderinfo = hstate.objects.filter(MEMID1 = userid, ORDID1 = orderidid).values()
    ftime = orderinfo[0]['PFTIME1']

    hstate.objects.filter(MEMID1 = userid, ORDID1 = orderidid).update(CLOTH1 = "處理中")

    return render(request, 'page/laundry_success.html', locals())


def addnotice(request):
    userid = request.session['user']
    noticelist = notice.objects.filter(MEMID = userid).values()
    loc_dt = datetime.datetime.now()
    nowtime = loc_dt.strftime("%Y-%m-%d %H:%M") 

    notice.objects.create(   #衣服偵測破洞通知
        MEMID = userid,
        NCONTENT = "我們在處理您的衣物時，發現襪子和內衣褲有破損狀況!",
        NLINK = "點我至加購商品頁面",
        NTIME = nowtime
    )

    notice.objects.create(   #機器故障通知
    MEMID = userid,
    NCONTENT = "由於店內設備故障問題，因此您的訂單進度將會延遲!!",
    NLINK = "",
    NTIME = nowtime
    )

    return HttpResponse("Successfully!!")


def purchase2(request):
    userid = request.session['user']
    noticelist = notice.objects.filter(MEMID = userid).values()
    handle = hstate.objects.filter(MEMID1 = userid, CLOTH1 = "處理中")
    if handle:
        return render(request, 'page/purchase2.html', locals())
    else:
        return redirect('/purchasefail/', locals())

def purchaseCFM(request):
    userid = request.session['user']
    noticelist = notice.objects.filter(MEMID = userid).values()
    purchaselist = []   #所有購買商品資訊
    allpname = ""
    pname1 = request.GET['pname1']
    size1 = request.GET['size1']
    color1 = request.GET['color1']
    quantity1 = int(request.GET['quantity1'])
    pmoney1 = 0

    pname2 = request.GET['pname2']
    size2 = request.GET['size2']
    color2 = request.GET['color2']
    quantity2 = int(request.GET['quantity2'])
    pmoney2 = 0

    pname3 = request.GET['pname3']
    size3 = request.GET['size3']
    color3 = request.GET['color3']
    quantity3 = int(request.GET['quantity3'])
    pmoney3 = 0

    if quantity1 == 0:
        pmoney1 = 0
    else:
        handle = addpur.objects.filter(APNAME = pname1).values()
        pprice1 = int(handle[0]['APPRICE'])
        pmoney1 = quantity1*pprice1
        purchase = {
            "pname":pname1,
            "size":size1,
            "color":color1,
            "quantity":quantity1,
            "pmoney":pmoney1
        }
        purchaselist.append(purchase)
        allpname += color1+pname1+size1+"x"+str(quantity1)+","
    
    if quantity2 == 0:
        pmoney2 = 0
    else:
        handle = addpur.objects.filter(APNAME = pname2).values()
        pprice2 = int(handle[0]['APPRICE'])
        pmoney2 = quantity2*pprice2
        purchase = {
            "pname":pname2,
            "size":size2,
            "color":color2,
            "quantity":quantity2,
            "pmoney":pmoney2
        }
        purchaselist.append(purchase)
        allpname += color2+pname2+size2+"x"+str(quantity2)+","
    
    if quantity3 == 0:
        pmoney3 = 0
    else:
        handle = addpur.objects.filter(APNAME = pname3).values()
        pprice3 = int(handle[0]['APPRICE'])
        pmoney3 = quantity3*pprice3
        purchase = {
            "pname":pname3,
            "size":size3,
            "color":color3,
            "quantity":quantity3,
            "pmoney":pmoney3
        }
        purchaselist.append(purchase)
        allpname += color3+pname3+size3+"x"+str(quantity3)+","

    totalmoney = pmoney1+pmoney2+pmoney3

    return render(request, 'page/purchaseCFM.html', locals())

def purchasesuccess(request):
    userid = request.session['user']
    noticelist = notice.objects.filter(MEMID = userid).values()
    totalmoney = int(request.GET['totalmoney'])
    allpname = request.GET['allpname']
    haveorder = hstate.objects.filter(MEMID1 = userid, CLOTH1 = "處理中").values()
    if haveorder:
        orderid = haveorder[0]['ORDID1']
        handle = hstate.objects.filter(MEMID1 = userid, ORDID1 = orderid).values()
        addpurname = handle[0]['ADDITION1']
        allmoney = int(handle[0]['AMOUNT1'])
        finallyallmoney = totalmoney+allmoney

        if addpurname == "無":
            hstate.objects.filter(MEMID1 = userid, ORDID1 = orderid).update(ADDITION1 = allpname, AMOUNT1 = finallyallmoney)
        else:
            newaddition = addpurname+allpname
            hstate.objects.filter(MEMID1 = userid, ORDID1 = orderid).update(ADDITION1 = newaddition, AMOUNT1 = finallyallmoney)

    return render(request, 'page/purchase_success.html',locals())

def purchasefail(request):
    userid = request.session['user']
    noticelist = notice.objects.filter(MEMID = userid).values()
    return render(request, 'page/purchase_fail.html', locals())


def addpreference(request):
    userid = request.session['user']
    wpre = request.GET['washing']
    dpre = request.GET['drying']
    fpre = request.GET['fold']
    gpre = request.GET['give']
    cpre = request.GET['collar']
    member.objects.filter(MEMID = userid).update(
        WPRE = wpre,
        DPRE = dpre,
        FPRE = fpre,
        GPRE = gpre,
        CPRE = cpre
    )
    return HttpResponseRedirect('/index/')


