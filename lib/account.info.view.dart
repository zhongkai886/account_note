import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_todo/account_dialog.dart';
import 'package:flutter_todo/boxes.dart';
import 'package:flutter_todo/model/account.info.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive_database_example/boxes.dart';
// import 'package:hive_database_example/model/transaction.dart';
// import 'package:hive_database_example/widget/transaction_dialog.dart';
// import 'package:intl/intl.dart';

class AccountInfoPage extends StatefulWidget {
  @override
  _AccountInfoPageState createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {
  @override
  void dispose() {
    Hive.box('accountInfos').close();
    Hive.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Hive Expense Tracker'),
          centerTitle: true,
        ),
        body: ValueListenableBuilder<Box<AccountInfo>>(
          valueListenable: Boxes.getUserInfos().listenable(),
          builder: (context, box, _) {
            final accountInfos = box.values.toList().cast<AccountInfo>();

            return buildContent(accountInfos);
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AccountInfoDialog(
              onClickedDone: addAccountInfo,
            ),
          ),
        ),
      );

  Widget buildContent(List<AccountInfo> accountInfos) {
    if (accountInfos.isEmpty) {
      return Center(
        child: Text(
          'No expenses yet!',
          style: TextStyle(fontSize: 24),
        ),
      );
    } else {
      // final netExpense = accountInfos.fold<double>(
      //   0,
      //   (previousValue, accountInfo) =>
      //       accountInfos ? previousValue - transaction.amount : previousValue + transaction.amount,
      // );
      // final newExpenseString = '\$${netExpense.toStringAsFixed(2)}';
      // final color = netExpense > 0 ? Colors.green : Colors.red;

      return Column(
        children: [
          SizedBox(height: 24),
          // Text(
          //   'Net Expense: $newExpenseString',
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     fontSize: 20,
          //     color: color,
          //   ),
          // ),
          SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: accountInfos.length,
              itemBuilder: (BuildContext context, int index) {
                final accountInfo = accountInfos[index];

                return buildAccountInfo(context, accountInfo);
              },
            ),
          ),
        ],
      );
    }
  }

  Widget buildAccountInfo(
    BuildContext context,
    AccountInfo accountInfo,
  ) {
    // final color = transaction.isExpense ? Colors.red : Colors.green;

    // final date = DateFormat.yMMMd().format(accountInfo.createDate);
    // final amount = '\$' + accountInfo.amount.toStringAsFixed(2);

    return Card(
      color: Colors.white,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        title: Text(
          accountInfo.name,
          maxLines: 2,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(accountInfo.createDate?.toIso8601String() ?? ''),
        trailing: Text(
          accountInfo.account,
          style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        children: [
          buildButtons(context, accountInfo),
        ],
      ),
    );
  }

  Widget buildButtons(BuildContext context, AccountInfo accountInfo) => Row(
        children: [
          Expanded(
            child: TextButton.icon(
              label: Text('Edit'),
              icon: Icon(Icons.edit),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AccountInfoDialog(
                    accountInfo: accountInfo,
                    onClickedDone: (name, account, password, lable) =>
                        editAccountInfo(accountInfo, name, account, password, lable),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton.icon(
              label: Text('Delete'),
              icon: Icon(Icons.delete),
              onPressed: () => showDialog(
                context: context,
                builder: (context) => deleteCheck(accountInfo),
              ),
            ),
          )
        ],
      );
  Dialog deleteCheck(AccountInfo accountInfo) {
    return Dialog(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {
              deleteAccountInfo(accountInfo);
            },
            child: Text('do it ')),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('get out ')),
      ],
    ));
  }

  Future addAccountInfo(String name, String account, String password, String lable) async {
    final accountInfo = AccountInfo()
      ..name = name
      ..createDate = DateTime.now()
      ..account = account
      ..password = password
      ..lable = lable;

    final box = Boxes.getUserInfos();
    box.add(accountInfo);
    //box.put('mykey', transaction);

    // final mybox = Boxes.getAccountInfos();
    // final myAccountInfo = mybox.get('key');
    // mybox.values;
    // mybox.keys;
  }

  void editAccountInfo(
    AccountInfo accountInfo,
    String name,
    String account,
    String password,
    String lable,
  ) {
    accountInfo.name = name;
    accountInfo.account = account;
    accountInfo.password = password;
    accountInfo.lable = lable;

    // final box = Boxes.getAccountInfos();
    // box.put(transaction.key, transaction);

    accountInfo.save();
  }

  void deleteAccountInfo(AccountInfo accountInfo) {
    // final box = Boxes.getAccountInfos();
    // box.delete(transaction.key);

    accountInfo.delete();
    //setState(() => transactions.remove(transaction));
  }
}
