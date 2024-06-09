import 'package:flutter_application_1/views/shared/export_packages.dart';

class TilesWidget extends StatelessWidget {
  final String title;
  final IconData leading;
  final Function()? OnTap;

  const TilesWidget(
      {Key? key, required this.title, required this.leading, this.OnTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: OnTap,
      leading: Icon(leading, color: Colors.grey.shade700),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: title != "Settings"
          ? const Icon(
              AntDesign.right,
              size: 16,
            )
          : SvgPicture.asset(
              "assets/images/vietnam.svg",
              width: 15,
              height: 20,
            ),
    );
  }
}
