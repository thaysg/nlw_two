import 'package:flutter/material.dart';
import 'package:nlw_two/components/app_colors.dart';
import 'package:nlw_two/components/text_style.dart';
import 'package:nlw_two/screens/extract_screen/extract_screen.dart';
import 'package:nlw_two/screens/meus_boletos_screen.dart/meus_boletos_screen.dart';
import 'package:nlw_two/shared/models/user_models.dart';
import 'controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  final UserModel user;
  const HomeScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                  text: "Olá, ",
                  style: TextStyles.titleRegular,
                  children: [
                    TextSpan(
                      text: "${widget.user.name}",
                      style: TextStyles.titleBoldBackground,
                    )
                  ],
                ),
              ),
              subtitle: Text(
                "Mantenha suas contas em dia",
                style: TextStyles.captionShape,
              ),
              trailing: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                      image: NetworkImage(widget.user.photoUrl!)),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: [
        MeusBoletosPage(
          key: UniqueKey(),
        ),
        ExtracPage(
          key: UniqueKey(),
        ),
      ][controller.currentPage]),
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                controller.setPage(0);
                setState(() {});
              },
              icon: Icon(
                Icons.home,
                color: controller.currentPage == 0
                    ? AppColors.primary
                    : AppColors.body,
              ),
            ),
            GestureDetector(
              onTap: () async {
                await Navigator.pushNamed(context, "/barcode_scanner");
                setState(() {});
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child:
                    Icon(Icons.add_box_outlined, color: AppColors.background),
              ),
            ),
            IconButton(
              onPressed: () {
                controller.setPage(1);
                setState(() {});
              },
              icon: Icon(
                Icons.description_outlined,
                color: controller.currentPage == 1
                    ? AppColors.primary
                    : AppColors.body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
