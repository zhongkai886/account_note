import 'package:flutter/material.dart';
import 'package:flutter_todo/model/account.info.dart';

class AccountInfoDialog extends StatefulWidget {
  final AccountInfo? accountInfo;
  final Function(String name, String account, String password, String lable) onClickedDone;

  const AccountInfoDialog({
    Key? key,
    this.accountInfo,
    required this.onClickedDone,
  }) : super(key: key);

  @override
  _AccountInfoDialogState createState() => _AccountInfoDialogState();
}

class _AccountInfoDialogState extends State<AccountInfoDialog> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final accountController = TextEditingController();
  final passwordController = TextEditingController();
  final lableController = TextEditingController();

  bool isExpense = true;

  @override
  void initState() {
    super.initState();

    if (widget.accountInfo != null) {
      final accountInfo = widget.accountInfo!;

      nameController.text = accountInfo.name;
      accountController.text = accountInfo.account;
      passwordController.text = accountInfo.password;
      lableController.text = accountInfo.lable;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    accountController.dispose();
    passwordController.dispose();
    lableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.accountInfo != null;
    final title = isEditing ? 'Edit Transaction' : 'Add Transaction';

    return AlertDialog(
      title: Text(title),
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 8),
              buildName(),
              SizedBox(height: 8),
              buildAccount(),
              SizedBox(height: 8),
              buildPassword(),
              SizedBox(height: 8),
              buildLable(),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        buildCancelButton(context),
        buildAddButton(context, isEditing: isEditing),
      ],
    );
  }

  Widget buildName() => TextFormField(
        controller: nameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Name',
        ),
        validator: (name) => name == null ? 'Enter a name' : null,
      );

  Widget buildAccount() => TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Account',
        ),
        validator: (account) => account == null ? 'Enter a valid number' : null,
        controller: accountController,
      );

  Widget buildPassword() => TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Password',
        ),
        validator: (password) => password == null ? 'Enter a valid Password' : null,
        controller: passwordController,
      );

  Widget buildLable() => TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Lable',
        ),
        validator: (lable) => lable == null ? 'Enter a valid Lable' : null,
        controller: lableController,
      );

  Widget buildCancelButton(BuildContext context) => TextButton(
        child: Text('Cancel'),
        onPressed: () => Navigator.of(context).pop(),
      );

  Widget buildAddButton(BuildContext context, {required bool isEditing}) {
    final text = isEditing ? 'Save' : 'Add';

    return TextButton(
      child: Text(text),
      onPressed: () async {
        final isValid = formKey.currentState!.validate();

        if (isValid) {
          final name = nameController.text;
          final account = accountController.text;
          final password = passwordController.text;
          final lable = lableController.text;
          DateTime createDate = DateTime.now();
          widget.onClickedDone(name, account, password, lable);

          Navigator.of(context).pop();
        }
      },
    );
  }
}
