import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class PageController extends ChangeNotifier {

  late PageController _pageController;


  PageController get pageController => _pageController;


  static BuildContext _context;


  setPageController(PageController controller) => _pageController = controller;




  static Auth authProvider(BuildContext context, {bool listen = false}) {
    _context = context;
    return Provider.of<Auth>(context, listen: listen);
  }

  Future<dynamic> test500() async {
    final data = await _helper.test500(token, _context);
    return data;
  }

  Future<void> createUser(String email, String password) async {
    try {
      var data = await _helper.createUser(email, password, _context);
      print('for here');
      setId(data['id']);
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<void> loginUser(String emailAddress, String password) async {
    try {
      var data =
      await _helper.loginUser(emailAddress, password, false, _context);
      print('object$data');
      _setInitialData(data);
      AuthUser user = AuthUser.fromJson(data);
      await whoAmI();
      setEmail(emailAddress);
      print('user is a ${user.token}');
      print('device token is a  ${user.devicetoken}');
      print('device token is a  ${user.merchants}');
      print('device token is a  ${user.merchants[0].businessname}');

      var dt = await PushNotification().getDeviceToken();
      print('tokksss: $dt');
      setDecoded(DecodedToken.fromJson(parseJwtPayLoad(data['token'])));
      try {
        await _helper.updateDeviceToken(decoded.user, token, _context);
        print('strange ooo');
      } catch (_) {}
      _hiveRepository.add<String>(
          name: kEmail, key: 'email', item: emailAddress);
      _hiveRepository.add<AuthUser>(name: kUserName, key: 'user', item: user);
      _hiveRepository.add<DecodedToken>(
          name: kDecodedDataName, key: 'decoded', item: decoded);
      _hiveRepository.add<AppModel>(
          name: kAppDataName, key: 'appModel', item: AppModel(token: token));
      _hiveRepository.add<List<CashPointTransactions>>(
          name: kCashPointTransactionsDataName,
          key: 'transactions',
          item: transactions);
      print('decoded ${decoded.businessid}');
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      var data = await _helper.forgotPassword(email, _context);
      print('object$data');
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<dynamic> setPin(String pin) async {
    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);
    try {
      var data = await _helper.setPin(
          pin,
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          _context);
      refreshGetMerchant();
      return data;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<dynamic> authorizePin(String pin) async {
    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);
    try {
      var data = await _helper.authorizePin(
          pin,
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          _context);
      return data;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<dynamic> changePin(String oldPin, String newPin) async {
    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);
    try {
      var data = await _helper.changePin(
          oldPin,
          newPin,
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          _context);
      return data;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<dynamic> forgetPin(String otp, String newPin) async {
    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);
    try {
      var data = await _helper.forgetPin(
          otp,
          newPin,
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          _context);
      return data;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<void> registerUser(
      emailAddress,
      businessname,
      businessphone,
      industry,
      contactfirstname,
      contactlastname,
      address,
      referral,
      state,
      lga,
      // city
      ) async {
    try {
      var data = await _helper.registerUser(
        emailAddress,
        businessname,
        businessphone,
        industry,
        contactfirstname,
        contactlastname,
        address,
        referral,
        state,
        lga,
        _context,
        id,
      );

      setRegId(data['id']);
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<void> addNewMerchant(email, businessname, businessphone, industry,
      contactfirstname, contactlastname, address, state, lga) async {
    try {
      print(decoded.user);
      var data = await _helper.addNewMerchant(
          email,
          businessname,
          businessphone,
          industry,
          contactfirstname,
          contactlastname,
          address,
          state,
          lga,
          decoded.user,
          _context);
      setRegId(data['id']);
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<void> changePassword(password) async {
    try {
      var data = await _helper.changePassword(password, token, _context);
      print('data: $data');
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<void> editInformation(
      phone, industry, firstName, lastName, address) async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      var data = await _helper.editInformation(
          phone,
          industry,
          firstName,
          lastName,
          address,
          me == null || mId == null
              ? decodedd.businessid
              : me.merchants[mId.index].businessid,
          token,
          _context);
      print('edit: $data');
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<void> getSupport(subject, message) async {
    try {
      var data = await _helper.getSupport(subject, message, token, _context);
      print('data: $data');
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<void> addCashPoint(String email, String phone, String firstName,
      String contactLastName) async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      var data = await _helper.addCashPoint(
          email,
          phone,
          firstName,
          contactLastName,
          me == null || mId == null
              ? decodedd.businessid
              : me.merchants[mId.index].businessid,
          token,
          _context);
      print('datum: ${data['id']}');
      setCashId(data['id']);
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<void> addBankDetails(
      String accNo, String bankCode, String bankName) async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      var data = await _helper.addBank(
          accNo,
          bankCode,
          bankName,
          me == null || mId == null
              ? decodedd.businessid
              : me.merchants[mId.index].businessid,
          token,
          _context);
      print('bandk details: $data');
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<void> addBeneficiary(
      String accNo, String bankCode, String accName) async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      var data = await _helper.addBeneficiary(
          accNo,
          bankCode,
          accName,
          me == null || mId == null
              ? decodedd.businessid
              : me.merchants[mId.index].businessid,
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          _context);
      print('bandk details: $data');
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<dynamic> transferRequest(
      String accNo, String bankCode, String transRef, double amount) async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      var data = await _helper.transferRequest(
          accNo,
          bankCode,
          transRef,
          amount,
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          _context);
      print('transferRequest: $data');
      return data;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<dynamic> withdrawFunds(String amount) async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      var data = await _helper.withdrawFunds(
          amount,
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          _context);
      print('funds: $data');
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<dynamic> deactivateCashpoint(String cashpointId) async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      var data = await _helper.deactivateCashpoint(
          me == null || mId == null
              ? decodedd.businessid
              : me.merchants[mId.index].businessid,
          cashpointId,
          token,
          _context);
      print('data: $data');
      notifyListeners();

      setDeactivate(DeactivateStatus.fromJson(data));
      print('bandk details: $data');
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<AccountName> getBankName(
      String accNo,
      String bankCode,
      ) async {
    try {
      var data = await _helper.getBankName(accNo, bankCode, token, _context);
      print('datum: $data');
      var accName = AccountName.fromJson(data);
      setAccountName(accName);
      return accName;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  RememberMe rememberMe(RememberMe remember) {
    setRemember(remember);
    print('remember ${remember.rememberMeBool}');
    return remember;
  }

  FirstTime myFirst(FirstTime myFirst) {
    setFirst(myFirst);
    print('muyfirst ${first.firstTimeBool}');
    return myFirst;
  }

  SaveDetails myDetails(SaveDetails details) {
    setSaveDetails(details);
    print('remember $details');
    return details;
  }

  MerchantId getMerchantId(MerchantId merchantId) {
    setMerchantId(merchantId);
    print('merchantId ${mId.index}');
    return merchantId;
  }

  Future<List<CashPoints>> getCashPoints() async {
    return await refreshCashPoints();
  }

  Future<List<CashPoints>> refreshCashPoints() async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      var data = await _helper.getCashPoint(
          token,
          me == null || mId == null
              ? decodedd.businessid
              : me.merchants[mId.index].businessid);
      data = (data as List).map((e) => CashPoints.fromJson(e)).toList();

      setCashPoint(data);
      _hiveRepository.add<List<CashPoints>>(
          name: kCashPointDataName, key: 'cashpoint', item: data);
      return data;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<List<Notifications>> getNotifications() async {
    return await refreshNotifications();
  }

  Future<List<Notifications>> refreshNotifications() async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      var data = await _helper.getNotifications(
          token, me == null ? decodedd.user : me.user);
      print('data: $data');
      data =
          (data['data'] as List).map((e) => Notifications.fromJson(e)).toList();

      setNotifications(data);
      _hiveRepository.add<List<Notifications>>(
          name: kNotifications, key: 'notifications', item: data);
      return data;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<dynamic> getNotificationCount() async {
    return await refreshNotificationCount();
  }

  Future<dynamic> refreshNotificationCount() async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      var data = await _helper.getNotificationCount(
          token, me == null ? decodedd.user : me.user);
      print('count: ${data['data']}');
      setNotificationCount(data['data']);
      notifyListeners();
      // _hiveRepository.add<List<Notifications>>(name: kNotifications, key: 'notifications', item: data);
      return data['data'];
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<WalletBalance> getWallet() async {
    return await refreshWallet();
  }

  Future<WalletBalance> refreshWallet() async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      // WhoAmI m = _hiveRepository.get<WhoAmI>(key: 'me', name: kWhoAmI);
      print('businessID:${me}');
      // print('businessID:${me.merchants[mId.index].businessid}');
      var data = await _helper.getWallet(
          token,
          me == null || mId == null
              ? decodedd.businessid
              : me.merchants[mId.index].businessid);
      data = WalletBalance.fromJson(data);
      print('walletBalance:$data');

      setWalletBalance(data);
      _hiveRepository.add<WalletBalance>(
          name: kWallet, key: 'wallet', item: data);
      return data;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<List<Payout>> getPayout(int number) async {
    return await refreshPayout(number);
  }

  Future<List<Payout>> refreshPayout(int number) async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      //WhoAmI m = _hiveRepository.get<WhoAmI>(key: 'me', name: kWhoAmI);
      print('businessID:${me}');
      var data = await _helper.getPayout(
          token,
          me == null || mId == null
              ? decodedd.businessid
              : me.merchants[mId.index].businessid,
          number.toString());
      print('data: ${data['pages']}');
      setPages(null);
      setPages(data['pages']);
      var newData = data['data'];
      newData = (newData as List).map((e) => Payout.fromJson(e)).toList();
      print('payOut:$newData');
      setPayOut(newData);
      _hiveRepository.add<List<Payout>>(
          name: kPayout, key: 'payout', item: newData);
      return newData;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<List<Payout>> getPayoutByDesc(String param, BuildContext context,
      {int number = 1}) async {
    ProgressDialog dialog = new ProgressDialog(context);
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      print('businessID:${me}');
      var data = await _helper.getHistoryByDescr(
        token,
        me == null || mId == null
            ? decodedd.businessid
            : me.merchants[mId.index].businessid,
        number.toString(),
        param,
      );
      print('data: ${data['pages']}');
      setPages(null);
      setPages(data['pages']);
      var newData = data['data'];
      newData = (newData as List).map((e) => Payout.fromJson(e)).toList();
      print('payOut:$newData');

      if (newData != null) {
        setPayOut(null);
        setPayOut(newData);
      }

      // await dialog.hide();
      _hiveRepository.add<List<Payout>>(
          name: kPayout, key: 'payout', item: newData);
      return newData;
    } catch (ex) {
      //await dialog.hide();
      throw ApiFailureException(ex);
    }
  }

  Future<List<Payout>> getPayoutByAmount(String param, BuildContext context,
      {int number = 1}) async {
    ProgressDialog dialog = new ProgressDialog(context);
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      print('businessID:${me}');
      var data = await _helper.getHistoryByAmount(
        token,
        me == null || mId == null
            ? decodedd.businessid
            : me.merchants[mId.index].businessid,
        number.toString(),
        param,
      );
      print('data: ${data['pages']}');
      setPages(null);
      setPages(data['pages']);
      var newData = data['data'];
      newData = (newData as List).map((e) => Payout.fromJson(e)).toList();
      print('payOut:$newData');

      if (newData != null) {
        setPayOut(null);
        setPayOut(newData);
      }

      // await dialog.hide();
      _hiveRepository.add<List<Payout>>(
          name: kPayout, key: 'payout', item: newData);
      return newData;
    } catch (ex) {
      //await dialog.hide();
      throw ApiFailureException(ex);
    }
  }

  Future<List<Payout>> getPayoutByDate(
      String startDate, endDate, BuildContext context,
      {int number = 1}) async {
    ProgressDialog dialog = new ProgressDialog(context);

    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      //WhoAmI m = _hiveRepository.get<WhoAmI>(key: 'me', name: kWhoAmI);
      print('businessID:${me}');
      // dialog.style(
      //     message: 'Please wait...',
      //     progressWidget: Image.asset(
      //       'assets/images/spin.gif',
      //       height: 10,
      //     ));
      // await dialog.show();
      var data = await _helper.getHistoryByDate(
          token,
          me == null || mId == null
              ? decodedd.businessid
              : me.merchants[mId.index].businessid,
          number.toString(),
          startDate,
          endDate);
      // number.toString());
      print('data: ${data['pages']}');
      setPages(null);
      setPages(data['pages']);
      var newData = data['data'];
      newData = (newData as List).map((e) => Payout.fromJson(e)).toList();
      print('payOut:$newData');
      if (newData != null) {
        setPayOut(null);
        setPayOut(newData);
      }
      //await dialog.hide();
      //setPayOut(newData);
      _hiveRepository.add<List<Payout>>(
          name: kPayout, key: 'payout', item: newData);
      return newData;
    } catch (ex) {
      //await dialog.hide();
      throw ApiFailureException(ex);
    }
  }

  Future<WhoAmI> whoAmI() async {
    return await refreshWhoAmI();
  }

  Future<WhoAmI> refreshWhoAmI() async {
    try {
      var who = await _helper.whoAmI(token);
      print('whoamI: $who');
      WhoAmI mine = WhoAmI.fromJson(who);
      setMe(mine);
      print('min: ${mine.merchants}');
      _hiveRepository.add<WhoAmI>(name: kWhoAmI, key: 'me', item: mine);
      return mine;
    } catch (ex) {
      print('ex: $ex');
      throw ApiFailureException(ex);
    }
  }

  Future<List<MerchantTransactions>> getMerchantTransactions() async {
    return await refreshMerchantTransactions();
  }

  Future<List<MerchantTransactions>> refreshMerchantTransactions() async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      if (me == null || mId == null) {
        var who = await _helper.whoAmI(token);
        print('whoamI: $who');
        WhoAmI mine = WhoAmI.fromJson(who);
        setMe(mine);
        print('min: ${mine.merchants}');
        _hiveRepository.add<WhoAmI>(name: kWhoAmI, key: 'me', item: mine);
      }
      var data = await _helper.getMerchantTransactions(
          token,
          me == null || mId == null
              ? (decodedd.businessid)
              : me.merchants[mId.index].businessid);
      data =
          (data as List).map((e) => MerchantTransactions.fromJson(e)).toList();
      setMerchant(data);
      _hiveRepository.add<List<MerchantTransactions>>(
          name: kMerchantTransactions, key: 'merchantTransactions', item: data);
      return data;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<GetMerchant> getMerchant() async {
    return await refreshGetMerchant();
  }

  Future<GetMerchant> refreshGetMerchant() async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      var data = await _helper.getMerchant(
          token,
          me == null || mId == null
              ? decodedd.businessid
              : me.merchants[mId.index].businessid);
      print('merchantttt: $data');

      var myData = GetMerchant.fromJson(data);
      setGetMerchant(myData);
      _hiveRepository.add<GetMerchant>(
          name: kGetMerchant, key: 'getMerchant', item: myData);

      if (data['bank'] != null) {
        var merchantData = BankLatest.fromJson(data['bank']);
        setBankLatest(merchantData);
        _hiveRepository.add<BankLatest>(
            name: kBankLatest, key: 'bankLatest', item: merchantData);
      } else {
        BankLatest banks =
        BankLatest.fromJson({"name": '', "code": '', "number": ''});
        setBankLatest(banks);
        _hiveRepository.add<BankLatest>(
            name: kBankLatest, key: 'bankLatest', item: banks);
      }
      _hiveRepository.add<GetMerchant>(
          name: kGetMerchant, key: 'getMerchant', item: myData);
      notifyListeners();
      progressIndicatorIndex();
      return myData;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<dynamic> refreshToggle() async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      var data = await _helper.getToggle(
          token,
          me == null || mId == null
              ? decodedd.businessid
              : me.merchants[mId.index].businessid);
      print('toggle: $data');
      return data;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<List<CashPointCustomers>> getCustomers() async {
    return await refreshCustomers();
  }

  Future<List<CashPointCustomers>> refreshCustomers() async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      var data = await _helper.getCustomers(
          token,
          me == null || mId == null
              ? decodedd.businessid
              : me.merchants[mId.index].businessid,
          _context);
      print('Customers: $data');
      data = (data as List).map((e) => CashPointCustomers.fromJson(e)).toList();
      setCustomers(data);
      _hiveRepository.add<List<CashPointCustomers>>(
          name: kCustomers, key: 'customers', item: data);
      return data;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<List<BankList>> getBankList() async {
    return await refreshBankList();
  }

  Future<List<BankList>> refreshBankList() async {
    try {
      print(token);
      var data = await _helper.getBankList(token);
      print('banklist: ${data['banks']}');
      data = (data['banks'] as List).map((e) => BankList.fromJson(e)).toList();
      setBankList(data);
      _hiveRepository.add<List<BankList>>(
          name: kBankDetails, key: 'bank', item: data);
      return data;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<List<ServicePlan>> refreshServicePlanList() async {
    try {
      print(token);
      var data = await _helper.getServicePlanList(token);
      print('data: ${data['data']}');
      data =
          (data['data'] as List).map((e) => ServicePlan.fromJson(e)).toList();
      setServiceList(data);

      return data;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<List<DataPlan>> refreshDataPlanList(String network) async {
    try {
      print(token);
      var data = await _helper.getDataPlanList(token, network);
      print('data: ${data['data']}');
      data = (data['data'] as List).map((e) => DataPlan.fromJson(e)).toList();
      setDataList(data);

      return data;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<List<BeneficiaryList>> getBeneficiaryList() async {
    return await refreshBeneficiaryList();
  }

  Future<List<BeneficiaryList>> refreshBeneficiaryList() async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      var data = await _helper.getBeneficiaryList(
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey);
      print('data: ${data['data']}');
      data = (data['data'] as List)
          .map((e) => BeneficiaryList.fromJson(e))
          .toList();
      setBeneficiaryList(data);
      _hiveRepository.add<List<BeneficiaryList>>(
          name: kBeneficiaryList, key: 'beneficiary', item: data);
      notifyListeners();
      return data;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<dynamic> getOtp() async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      var data = await _helper.getOtp(
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey);
      print('messsiii: ${data['message']}');
      return data['message'];
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<String> requeryTransactions(String transRef) async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      var data = await _helper.requeryTransactions(
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          transRef);
      // print('data: ${data['data']['status']}');
      if (data['data'] is String) {
        throw ApiFailureException(data['data']);
      }
      return data['data']['status'];
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<dynamic> getMerchantPrefix() async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      var data = await _helper.getMerchantPrefix(
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          me == null || mId == null
              ? decodedd.businessid
              : me.merchants[mId.index].businessid);
      return data['data'];
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<FeeData> getMerchantFees() async {
    try {
      DecodedToken decodedd;

      // print('businessidddmerchant: ${me.merchants[mId.index].businessid}');
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      print('me: ${me}');
      print('mId: ${mId}');
      print('businessiddd: ${decodedd.businessid}');
      var data = await _helper.getFees(
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          me == null || mId == null
              ? decodedd.businessid
              : me.merchants[mId.index].businessid);

      print('dataFees: $data');
      data = FeeData.fromJson(data['data']);
      setFeeData(data);
      return data;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<Failure> getFailure() async {
    return await refreshFailure();
  }

  Future<Failure> refreshFailure() async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      var data = await _helper.getFailureList(
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey);
      print('data: ${data}');
      data = Failure.fromJson(data);
      setFailure(data);
      _hiveRepository.add<Failure>(name: kFailure, key: 'failure', item: data);
      return data;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<SuccessStatus> getSuccess() async {
    return await refreshSuccess();
  }

  Future<SuccessStatus> refreshSuccess() async {
    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      var data = await _helper.getSuccessList(
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey);
      print('data: ${data}');
      data = SuccessStatus.fromJson(data);
      setSuccess(data);
      _hiveRepository.add<SuccessStatus>(
          name: kSuccess, key: 'success', item: data);
      return data;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<dynamic> buyAirtime(Airtime model) async {
    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);
    model.merchant = me == null || mId == null
        ? decodedd.businessid
        : me.merchants[mId.index].businessid;
    final data = await _helper.buyAirtime(model, token, _context);
    print('airtime result is $data');
    return data;
  }

  Future<dynamic> buyData(Data model) async {
    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);
    model.merchant = me == null || mId == null
        ? decodedd.businessid
        : me.merchants[mId.index].businessid;
    final data = await _helper.buyData(model, token, _context);
    print('data result is $data');
    return data;
  }

  Future<List<Utility>> getUtilityPlans() async {
    final data = await _helper.getUtilityPlans(token, _context);
    return (data as List).map((e) => Utility.fromJson(e)).toList();
  }

  Future<String> buyUtilityPlan(BuyUtility model) async {
    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);
    model.merchant = me == null || mId == null
        ? decodedd.businessid
        : me.merchants[mId.index].businessid;
    final data = await _helper.buyUtilityPlan(model, token, _context);
    print('utility result is $data');
    return data;
  }

  Future<dynamic> verifyUtility(BuyUtility model) async {
    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);
    model.merchant = me == null || mId == null
        ? decodedd.businessid
        : me.merchants[mId.index].businessid;
    final data = await _helper.verifyUtility(model, token, _context);
    print('utility result is $data');
    return data;
  }

  Future<List<Cable>> getCablePlans() async {
    final data = await _helper.getCablePlans(token, _context);
    return (data as List).map((e) => Cable.fromJson(e)).toList();
  }

  Future<bool> buyCablePlan(BuyCable model) async {
    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);
    model.merchant = me == null || mId == null
        ? decodedd.businessid
        : me.merchants[mId.index].businessid;
    final data = await _helper.buyCablePlan(model, token, _context);
    print('cable result is $data');
    return data;
  }

  Future<dynamic> verifyCable(BuyCable model) async {
    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);
    model.merchant = me == null || mId == null
        ? decodedd.businessid
        : me.merchants[mId.index].businessid;
    final data = await _helper.verifyCable(model, token, _context);
    print('cable result is $data');
    return data;
  }

  Future<List<CashPointTransactions>> getCashPointTransactions(
      id, int number) async {
    try {
      var data = await _helper.getCashPointTransactions(
          token, id, number.toString(), _context);
      setCashPages(data['pages']);
      setTotal(double.parse(data['total'].toString()));
      data = (data['data'] as List)
          .map((e) => CashPointTransactions.fromJson(e))
          .toList();
      setCashPointTransactions(data);
      return data;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<dynamic> getPayoutReceipt(
      String payoutReceipt, BuildContext context) async {
    ProgressDialog dialog = new ProgressDialog(context);

    try {
      DecodedToken decodedd;
      decodedd = _hiveRepository.get<DecodedToken>(
          key: 'decoded', name: kDecodedDataName);
      //WhoAmI m = _hiveRepository.get<WhoAmI>(key: 'me', name: kWhoAmI);
      print('businessID:$me');
      print('token:$token');

      dialog.style(
          message: 'Please wait...',
          progressWidget: Image.asset(
            'assets/images/spin.gif',
            height: 10,
          ));
      await dialog.show();
      var data = await _helper.getPayoutReceipt(
          token,
          me == null || mId == null
              ? decodedd.businessid
              : me.merchants[mId.index].businessid,
          payoutReceipt);
      await dialog.hide();

      print('payoutData:$data');

      return data;
    } catch (ex) {
      await dialog.hide();
      Flushbar(
        backgroundColor: Colors.red,
        message: ex.toString(),
        duration: Duration(seconds: 7),
        flushbarStyle: FlushbarStyle.GROUNDED,
      ).show(context);
      throw ApiFailureException(ex);
    }
  }

  logout({bool removeUser = false}) {
    setUser(null);
    setToken(null);
    setDecoded(null);
    setCashPoint(null);
    setRegId(null);
    setId(null);
    setCashPointTransactions(null);
    setMerchant(null);
    setRemember(null);
    setMerchantId(null);
    setSaveDetails(null);
    setBankLatest(null);
    setWalletBalance(null);
    setBeneficiaryList(null);
    setFailure(null);
    setSuccess(null);

    setBankList(null);
    setPayOut(null);
    setGetMerchant(null);

    _hiveRepository.clear<AuthUser>(name: kUserName);
    _hiveRepository.clear<AppModel>(name: kAppDataName);
    _hiveRepository.clear<DecodedToken>(name: kDecodedDataName);
    _hiveRepository.clear<CashPoints>(name: kCashPointDataName);
    _hiveRepository.clear<CashPointTransactions>(
        name: kCashPointTransactionsDataName);
    _hiveRepository.clear<RememberMe>(name: kRemember);
    _hiveRepository.clear<MerchantTransactions>(name: kMerchantTransactions);
    _hiveRepository.clear<MerchantId>(name: kMerchantId);
    _hiveRepository.clear<SaveDetails>(name: kSaveDetails);
    _hiveRepository.clear<BankLatest>(name: kBankLatest);
    _hiveRepository.clear<WalletBalance>(name: kWallet);
    _hiveRepository.clear<BeneficiaryList>(name: kBeneficiaryList);
    _hiveRepository.clear<Failure>(name: kFailure);
    _hiveRepository.clear<SuccessStatus>(name: kSuccess);
    _hiveRepository.clear<SuccessStatus>(name: kSuccess);
    _hiveRepository.clear<Payout>(name: kPayout);
    _hiveRepository.clear<GetMerchant>(name: kGetMerchant);

    if (removeUser) {
      setMe(null);
      setEmail(null);
      _hiveRepository.clear<WhoAmI>(name: kWhoAmI);
      _hiveRepository.clear<String>(name: kEmail);
    }

    print('remember: $remember');
    print('token: $token');
    print('whoami: $me');
    print('email: $email');
  }

  Map<String, dynamic> parseJwtPayLoad(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }
    print('pmp: $payloadMap');
    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');
    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

  void _setInitialData(data) {
    setUser(AuthUser.fromJson(data));
    setToken(data['token']);
  }

  ///Compliance

  Future<dynamic> verifyBVN(
      String bvn,
      String nin,
      BuildContext context,
      ) async {
    loading = true;
    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);
    try {
      var data = await _helper.verifyBVN(
          bvn,
          nin,
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          _context);
      print('object$data');
      data = BVNResponse.fromJson(data);
      loading = false;
      showFlush(context, data.message, kPrimary);
      refreshGetMerchant();
      //progressIndicatorIndex();
      return data;
    } catch (ex) {
      loading = false;

      showFlush(context, ex.toString(), kPrimary);
      throw ApiFailureException(ex);
    }
  }

  Future<dynamic> confirmBVNOTP(String bvn, otp, BuildContext context) async {
    loading = true;
    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);
    try {
      // StatusModel
      var data = await _helper.confirmBVNOTP(
          bvn,
          "bvn",
          otp,
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          context);
      print('object$data');
      loading = false;
      showFlush(context, data['message'], kPrimary);
      refreshGetMerchant();
      return data;
    } catch (ex) {
      loading = false;
      showFlush(context, ex.toString(), kPrimary);
      throw ApiFailureException(ex);
    }
  }

  // Future<void> certificateOfBusiness(List file) async {
  //   try {
  //     COBResponse data =
  //         await _helper.certificateOfBusiness(file, token, publicKey);
  //     print('object$data');
  //   } catch (ex) {
  //     throw ApiFailureException(ex);
  //   }
  // }

  Future<dynamic> internationalPassport(
      DocumentRequest documentRequest, BuildContext context) async {
    loading = true;
    print(user);

    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);

    try {
      var data = await _helper.internationalPassportUpload(
          documentRequest,
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          _context);
      data = InternationalPassportModel.fromJson(data);
      showFlush(context, "Successful", kPrimary);
      print('object$data');
      //getInternationalPassportUploaded(context);
      refreshGetMerchant();
      loading = false;
      return data;
    } catch (ex) {
      loading = false;
      showFlush(context, ex.toString(), kPrimary);
      throw ApiFailureException(ex);
    }
  }

  Future<dynamic> proofOfAddress(
      DocumentRequest1 documentRequest, BuildContext context) async {
    loading = true;
    print(user);

    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);

    try {
      var data = await _helper.proofOfAddress(
          documentRequest,
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          _context);
      data = ProofOfAddressResponse.fromJson(data);
      showFlush(context, "Successful", kPrimary);
      print('object$data');
      // getProofOfAddressUploaded(context);
      refreshGetMerchant();

      loading = false;
      return data;
    } catch (ex) {
      loading = false;
      showFlush(context, ex.toString(), kPrimary);
      throw ApiFailureException(ex);
    }
  }

  Future<dynamic> idCardUpload(
      DocumentRequest documentRequest, BuildContext context) async {
    print("endpoint: ${documentRequest.toJson()}");
    loading = true;
    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);
    try {
      var data = await _helper.idCardUpload(
          documentRequest,
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          _context);
      data = PostIdCardResponse.fromJson(data);
      print('object$data');
      // getIdCardUpload(context);
      refreshGetMerchant();
      showFlush(context, "Successful", kPrimary);
      loading = false;
      return data;
    } catch (ex) {
      loading = false;
      showFlush(context, ex.toString(), kPrimary);
      throw ApiFailureException(ex);
    }
  }

  Future<dynamic> deleteIdCardUpload(
      BuildContext context, String documentId) async {
    loading = true;
    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);
    try {
      var data = await _helper.deleteIdCardUploaded(
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          context,
          documentId);
      print('object$data');
      data = StatusModel.fromJson(data);
      Navigator.pop(context);
      refreshGetMerchant();
      loading = false;
      return data;
    } catch (ex) {
      loading = false;
      showFlush(context, ex.toString(), kPrimary);
      throw ApiFailureException(ex);
    }
  }

  Future<dynamic> deleteInternationalPassportUploaded(
      BuildContext context, String documentId) async {
    loading = true;
    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);
    try {
      var data = await _helper.deleteInternationalPassportUploaded(
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          context,
          documentId);
      data = StatusModel.fromJson(data);
      print('object$data');
      refreshGetMerchant();
      loading = false;

      return data;
    } catch (ex) {
      loading = false;
      showFlush(context, ex.toString(), kPrimary);
      throw ApiFailureException(ex);
    }
  }

  Future<dynamic> deleteProofOfAddressUploaded(
      BuildContext context, String documentId) async {
    loading = true;
    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);
    try {
      var data = await _helper.deleteProofOfAddressUploaded(
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          context,
          documentId);
      data = StatusModel.fromJson(data);
      print('object$data');
      refreshGetMerchant();
      loading = false;
      return data;
    } catch (ex) {
      loading = false;
      showFlush(context, ex.toString(), kPrimary);
      throw ApiFailureException(ex);
    }
  }

  Future<dynamic> getIdCardUpload(BuildContext context) async {
    loading = true;
    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);
    try {
      var data = await _helper.getIdCardUploaded(
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          context);
      data = IDCardResponse.fromJson(data);
      _idCard = data;
      print('object$data');
      loading = false;
      progressIndicatorIndex();

      notifyListeners();
      return data;
    } catch (ex) {
      loading = false;
      // showFlush(context, ex.toString(), kPrimary);
      throw ApiFailureException(ex);
    }
  }

  IDCardResponse get idCard => _idCard;

  Future<void> getInternationalPassportUploaded(BuildContext context) async {
    loading = true;
    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);
    try {
      var data = await _helper.getInternationalPassportUploaded(
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          context);
      data = IdCard.fromJson(data[0]);
      _intPassport = data;
      print('object$data');

      loading = false;
      progressIndicatorIndex();
      notifyListeners();
      return data;
    } catch (ex) {
      loading = false;
      //showFlush(context, ex.toString(), kPrimary);
      throw ApiFailureException(ex);
    }
  }

  IdCard get intPassport => _intPassport;

  Future<void> getProofOfAddressUploaded(BuildContext context) async {
    loading = true;
    DecodedToken decodedd;
    decodedd = _hiveRepository.get<DecodedToken>(
        key: 'decoded', name: kDecodedDataName);
    try {
      var data = await _helper.getProofOfAddressUploaded(
          token,
          me == null || mId == null
              ? decodedd.publickey
              : me.merchants[mId.index].publickey,
          context);
      data = GetProofOfAddressResponse.fromJson(data);
      _getProofOfAddressResponse = data;
      notifyListeners();
      progressIndicatorIndex();
      print('object$data');
      loading = false;
      return data;
    } catch (ex) {
      loading = false;
      //showFlush(context, ex.toString(), kPrimary);
      throw ApiFailureException(ex);
    }
  }

  GetProofOfAddressResponse get getProofOfAddressResponse =>
      _getProofOfAddressResponse;

  progressIndicatorIndex() {
    _index = 0;
    var number = [
      singleMerchant.issetNINBVN,
      singleMerchant.issetIdCard,
      singleMerchant.issetInternationalPassport,
      singleMerchant.issetProofOfAddress
    ];
    for (var i = 0; i < number.length; i++) {
      if (number[i]) {
        _index++;
        // if (number[1] || number[2]) {
        //   _index = _index +1;
        // } else if (number[0]) {
        //   _index = _index +1;
        // } else if (number[3]) {
        //   _index = _index +1;
        // }
      }
    }
    notifyListeners();
  }

  int get index => _index;

  shareToSocials(BuildContext context) async {
    var link = await _dynamicLinkService.createJoinAppLink(singleMerchant.mid);

    final RenderBox box = context.findRenderObject();
    await Share.share("Hi friend please join VPay with my link, $link ",
        subject: "Invitation to join app",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    //}
  }

  isBiometricAvailable() async {
    try {
      _canCheckBiometrics = await auth.canCheckBiometrics;
      notifyListeners();
    } on PlatformException catch (e) {
      _canCheckBiometrics = false;
      print(e);
    }

    //_canCheckBiometrics = await auth.canCheckBiometrics;
  }

  bool get canCheckBiometrics => _canCheckBiometrics;
  bool get authenticatedWithBiometric => _authenticatedWithBiometric;

  Future<void> authenticateWithBiometric() async {
    loading = true;
    try {
      _authorized = 'Authenticating';

      _authenticatedWithBiometric = await auth.authenticate(
          localizedReason: 'Scan your fingerprint or face to authenticate',
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true);

      loading = false;
    } on PlatformException catch (e) {
      print(e);

      loading = false;
      _authorized = "Error - ${e.message}";

      return;
    }
    //if (!mounted) return;

    _authorized = _authenticatedWithBiometric ? 'Authorized' : 'Not Authorized';
    notifyListeners();
  }

  Future<void> loginWithBiometric(String emailAddress) async {
    try {
      //await authenticateWithBiometric();
      if (authenticatedWithBiometric) {
        var data = await _helper.loginUser(
            emailAddress, '', authenticatedWithBiometric, _context);
        print('object$data');
        _setInitialData(data);
        AuthUser user = AuthUser.fromJson(data);
        print('user is a ${user.token}');
        print('device token is a  ${user.devicetoken}');
        print('device token is a  ${user.merchants}');
        print('device token is a  ${user.merchants[0].businessname}');

        var dt = await PushNotification().getDeviceToken();

        setDecoded(DecodedToken.fromJson(parseJwtPayLoad(data['token'])));
        try {
          await _helper.updateDeviceToken(decoded.user, token, _context);
        } catch (_) {}
        _hiveRepository.add<String>(
            name: kEmail, key: 'email', item: emailAddress);
        _hiveRepository.add<AuthUser>(name: kUserName, key: 'user', item: user);
        _hiveRepository.add<DecodedToken>(
            name: kDecodedDataName, key: 'decoded', item: decoded);
        _hiveRepository.add<AppModel>(
            name: kAppDataName, key: 'appModel', item: AppModel(token: token));
        _hiveRepository.add<List<CashPointTransactions>>(
            name: kCashPointTransactionsDataName,
            key: 'transactions',
            item: transactions);
        _authenticatedWithBiometric = false;
        print('decoded ${decoded.businessid}');
      }
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }
}
