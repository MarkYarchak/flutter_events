import 'package:flutter/material.dart';

class EventPreview extends StatefulWidget {


  @override
  EventPreviewState createState() => EventPreviewState();

}

class PhantomUser {
  String avatarUrl = 'https://images.pexels.com/photos/3563888/pexels-photo-3563888.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  String username = 'markyarchak';
}

class EventPreviewState extends State<EventPreview> {

  final eventMembers = List.from([
    new PhantomUser(),
    new PhantomUser(),
  ]);

  goToCommentsHandler() {
    Navigator.pushNamed(context, '/event-comments');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Title(
            child: Text('Деталі події'),
            color: Colors.white,
          ),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.assignment), text: 'Опис'),
              Tab(icon: Icon(Icons.people/*people*/), text: 'Учасники'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: Text('Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты). Есть много вариантов Lorem Ipsum, но большинство из них имеет не всегда приемлемые модификации, например, юмористические вставки или слова, которые даже отдалённо не напоминают латынь. Если вам нужен Lorem Ipsum для серьёзного проекта, вы наверняка не хотите какой-нибудь шутки, скрытой в середине абзаца. Также все другие известные генераторы Lorem Ipsum используют один и тот же текст, который они просто повторяют, пока не достигнут нужный объём. Это делает предлагаемый здесь генератор единственным настоящим Lorem Ipsum генератором. Он использует словарь из более чем 200 латинских слов, а также набор моделей предложений. В результате сгенерированный Lorem Ipsum выглядит правдоподобно, не имеет повторяющихся абзацей или "невозможных" слов.'),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: eventMembers.map((member) => ListTile(
                    contentPadding: EdgeInsets.only(bottom: 4, top: 4, left: 16, right: 16),
                    leading: Image(image: AssetImage(member.avatarUrl), width: 45),
                    title: Text(member.username, style: TextStyle(fontSize: 16)),
                  )).toList(),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(top: 0, bottom: 4, right: 12, left: 12),
          child: RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.chat),
                ),
                Text('Перейти до коментарів')
              ],
            ),
            onPressed: goToCommentsHandler,
          ),
        ),
      ),
    );
  }

}
