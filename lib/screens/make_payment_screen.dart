import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:furniture_app/components/title_text.dart';
import 'package:furniture_app/screens/payment_complete.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class MakePaymentScreen extends StatefulWidget {
  @override
  _MakePaymentScreenState createState() => _MakePaymentScreenState();
}

class _MakePaymentScreenState extends State<MakePaymentScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  Widget _title() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleText(
                  text: 'Make',
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                ),
                TitleText(
                  text: 'Payment',
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.account_balance_wallet,
                color: Color(0xFF035AA6),
              ),
            )
          ],
        ));
  }

  Widget _submitButton(BuildContext context) {
    return FlatButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => AssetGiffyDialog(
                    image: Image.asset(
                      'assets/verify.gif',
                      fit: BoxFit.cover,
                    ),
//                    imagePath: 'assets/verify.gif',
//                    flareAnimation: 'loading',
                    title: Text(
                      'Verifying Payment',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                      'Customer Details have been passed to our Advanced Machine Learning Models to analyse the credibility of this payment',
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                    entryAnimation: EntryAnimation.BOTTOM,
//                    onOkButtonPressed: () {},
                    onlyCancelButton: true,
                    onCancelButtonPressed: () {
                      Navigator.pop(context);
                    },
                  ));
          Timer(Duration(seconds: 5), () async {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PaymentComplete(
                isFraud: false,
              );
            }));
          });
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFF035AA6),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 12),
          width: MediaQuery.of(context).size.width * .7,
          child: TitleText(
            text: 'Verify',
            color: Color(0XFFFFFFFF),
            fontWeight: FontWeight.w500,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xfffbfbfb),
                Color(0xfff7f7f7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(),
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: CreditCardForm(
                  onCreditCardModelChange: onCreditCardModelChange,
                ),
              )),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 60.0, vertical: 20.0),
                child: _submitButton(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
