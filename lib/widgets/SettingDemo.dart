import 'package:flutter/material.dart';

class SettingDemo extends StatelessWidget {
  const SettingDemo({Key? key}) : super(key: key);

  _buildCircleImg() {
    return Container(
      height: 60,
      width: 60,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage('imgs/001.jpg'))),
    );
  }

  _buildCenter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text('主标题', style: TextStyle(fontSize: 20),),
        Text('副标题', style: TextStyle(color: Colors.grey),)
      ],
    );
  }

  _showTitleContainer(){
    return Container(
      color: Colors.grey.withOpacity(.5),
      alignment: Alignment.center,
      child: Container(
        height: 100,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 15,
            ),
            _buildCircleImg(),
            const SizedBox(
              width: 25,
            ),
            Expanded(
              child: _buildCenter(),
            ),
            const Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14,),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("个人设置项"),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10.0, right: 10.0),
        child: Column(
          children: <Widget>[
            _showTitleContainer(),
            const Divider(),
            const _SettingItem(
              iconData: Icons.notifications,
              iconColor: Colors.blue,
              title: '消息中心',
              suffix: _NotificationsText(
                text: '2',
              ),
            ),
            const Divider(),
            const _SettingItem(
              iconData: Icons.thumb_up,
              iconColor: Colors.green,
              title: '我赞过的',
              suffix: _Suffix(
                text: '121篇',
              ),
            ),
            const Divider(),
            const _SettingItem(
              iconData: Icons.grade,
              iconColor: Colors.yellow,
              title: '收藏集',
              suffix: _Suffix(
                text: '2个',
              ),
            ),
            const Divider(),
            const _SettingItem(
              iconData: Icons.shopping_basket,
              iconColor: Colors.yellow,
              title: '已购小册',
              suffix: _Suffix(
                text: '100个',
              ),
            ),
            const Divider(),
            const _SettingItem(
              iconData: Icons.account_balance_wallet,
              iconColor: Colors.blue,
              title: '我的钱包',
              suffix: _Suffix(
                text: '10万',
              ),
            ),
            const Divider(),
            const _SettingItem(
              iconData: Icons.location_on,
              iconColor: Colors.grey,
              title: '阅读过的文章',
              suffix: _Suffix(
                text: '1034篇',
              ),
            ),
            const Divider(),
            const _SettingItem(
              iconData: Icons.local_offer,
              iconColor: Colors.grey,
              title: '标签管理',
              suffix: _Suffix(
                text: '27个',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Suffix extends StatelessWidget {
  final String text;

  const _Suffix({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.grey.withOpacity(.5)),
    );
  }
}

class _NotificationsText extends StatelessWidget {
  final String text;

  const _NotificationsText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.red),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  const _SettingItem(
      {Key? key,
      required this.iconData,
      required this.iconColor,
      required this.title,
      required this.suffix})
      : super(key: key);

  final IconData iconData;
  final Color iconColor;
  final String title;
  final Widget suffix;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 30,
          ),
          Icon(
            iconData,
            color: iconColor,
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Text(title),
          ),
          suffix,
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
