import 'package:flutter/material.dart';

import '../modules/wep_view.dart';

Widget stateNewsItem(articles,context) {
  return InkWell(
    onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> WepViewScreen(url:articles['url']) ));
    },
    child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image:  DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        '${articles['urlToImage']}'))),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Expanded(
                    child: Text(
                      '${articles['title']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1 ,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   Text(
                    '${articles['publishedAt']}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
