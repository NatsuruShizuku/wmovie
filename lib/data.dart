import 'package:flutter/material.dart';

class NavigationItem {

  IconData iconData;

  NavigationItem(this.iconData);

}

List<NavigationItem> getNavigationItemList(){
  return <NavigationItem>[
    NavigationItem(Icons.home),
    NavigationItem(Icons.movie_filter),
    NavigationItem(Icons.local_movies),
    NavigationItem(Icons.person_pin_outlined),
  ];
}

class Movie {

  String title;
  String description;
  Director director;
  String score;
  String image;

  Movie(this.title, this.description, this.director, this.score, this.image);

}

List<Movie> getMovieList(){
  return <Movie>[
    Movie(
      "Army of Thieves",
      "พนักงานแบงก์ “ดีเทอร์” ผู้มีชีวิตสุดแสนน่าเบื่อ เขาต้องโดนลูกค้าของธนาคารโขกสับมาโดยตลอด แต่เพราะที่ทนอยู่ในสภาพนี้ได้ก็เพราะเขาชื่นชอบที่จะอยู่กับตู้เซฟ การศึกษาเกี่ยวกับกลไกตู้เซฟต่าง ๆ ทำให้เขามีความสุข ยิ่งตู้นิรภัยมีความซับซ้อนมากแค่ไหน เขาจะใช้หูฟังเพื่อเพื่อสะเดาะเปิดกลอนที่ล็อกอยู่โดยไม่ต้องใช้รหัสแต่อย่างใด จนกระทั่งวันหนึ่งเขาได้รับจดหมายเชิญไปลงแข่งขันสะเดาะตู้เซฟนั่นทำให้เขาได้พบกับ สาวปริศนา “นาตาลี แอมมานูเอล” (รับบทโดย เกวนโดลีน สตาร์) ความสวยของเธอทำให้เขาหลงใหลตั้งแต่แรกเห็น ซึ่งเธอได้บอกให้เขาละทิ้งชีวิตพนักงานธนาคารธรรมดา เข้ามาร่วมแก๊งโจรกรรมเซฟโบราณในตำนาน ที่ยังคงมีอยู่บนโลกและไม่เคยมีใครสามารถเปิดมันออกมาได้ ภายในตู้มีเงินและสมบัติอยู่มากมายนับล้านดอลลาร์ แน่นอนว่าพ่อหนุ่ม “ดีเทอร์” ตอบตกลงอย่างไม่ต้องสงสัย เรื่องราวของแก๊งหัวขโมยจะเป็นอย่างไรติดตามกันได้ในหนัง",
      Director(
        "Matthias Schweighöfer",
        6,
        "assets/directors/Matthias Schweighöfer.jpg",
      ),
      "3.67",
      "assets/movies/Army-of-Thieves.jpg",
    ),
    Movie(
      "Eternals",
      "เรื่องราวของกลุ่ม The Eternals ที่ถูกสร้างขึ้นโดย เซเลสเทียล เผ่าพันธุ์เทพแห่งจักรวาลอายุนับล้านปี ที่เดินทางมายังโลกและอาศัยอยู่อย่างลับ ๆ มานานกว่า 7,000 ปี แต่แล้วพวกเขาก็ต้องออกมาเคลื่อนไหวอีกครั้งเพื่อปกป้องโลกจาก ดีเวียนต์ คู่ปรับตลอดกาลที่ถูกสร้างขึ้นจากเซเลสเทียลเช่นเดียวกัน",
      Director(
        "Chloé Zhao",
        8,
        "assets/directors/Chloé Zhao.jpg",
      ),
      "4.10",
      "assets/movies/Eternals_2.jpg",
    ),
    Movie(
      "Haunted Tales",
      "หนังที่สร้างจากคำผีเล่าถูกถ่ายทอดออกมาเป็น 3 เรื่องสั้นสยองขวัญได้แก่ ตอน มันอยู่ในรถ (Haunted Car) พูดถึงนักธุรกิจหนุ่มที่มีความลับซุกซ่อนเอาไว้มากมายระหว่างเดินทางกลับบ้านด้วยรถแท็กซี่ นำมาซึ่งเรื่องราวสยองขวัญที่ทำให้เขาระลึกถึงการมีชีวิตอยู่ นำแสดงโดย เป้ อารักษ์ อมรศุภศิริ และเอก ธเนศ วรากุลนุเคราะห์ ตอนที่ 2 ใบลาน (The Book of truth) นำแสดงโดย หมาก ปริญ สุภารัตน์ นักเขียนนิยายเขย่าขวัญที่ได้รับอีเมลปริศนาเกี่ยวกับตำนานของสมุดใบลาน เขาจึงเริ่มเขียนนิยายสยองขวัญของเขาลงในสมุดใบลานก่อนจะพบความน่ากลัวที่เกินกว่าเขาจะจินตนาการได้ และตอนที่ 3 ไปผุดไปเกิด (Reborn) นำแสดงโดย ปราง กัญญ์ณรัณ วงศ์ขจรไกล รับบทหญิงสาวลึกลับที่มาตามหาเรื่องราวสุดสะพรึงในโรงแรมผีดุแห่งหนึ่ง เธอต้องพยายามเอาชีวิตรอด และปลดปล่อยวิญญาณร้ายให้ได้",
      Director(
        "ศุภกร เหรียญสุวรรณ",
        2,
        "assets/directors/ศุภกร เหรียญสุวรรณ.jpg",
      ),
      "3.54",
      "assets/movies/haunted-tales.jpg",
    ),
    Movie(
      "He's All That ",
      "He’s All That ภาพยนตร์แนวโรแมนติก หวานใส ไฮสกูล ที่ Remake มาจากหนัง Chick Flick ระดับตำนานอย่าง She’s All That (1999) เรื่องราวพูดถึงแพดเจ็ตต์สาวสวยดาวเด่นระดับป๊อปสตาร์ของยุค เธอไม่ใช่แค่สวย ฉลาด และรุ่งในโรงเรียนเพียงอย่างเดียวแต่เธอยังเป็นถึง Influencer ที่มีชื่อเสียงมียอดFollowersไม่ต่ำกว่าล้านในวันหนึ่งที่เธอกำลัง LIVE วางแผนจะเซอร์ไพรส์วันเกิดแฟนของเธอจอร์แดนนักร้องหนุ่มขารุ่งที่กองถ่ายMVเธอก็ต้องเจอกับเรื่องที่ไม่คาดคิด ในขณะที่เธอเปิดประตูเข้าไป และพบว่าแฟนหนุ่มของเธอกำลังฟีทเจอร์ริ่งกับแดนเซอร์สาวสุดเซ็กส์ซี่ผู้ร่วมวงด้วยความโมโหและขายหน้าเธอจึงหยิบขนมเค้กที่กำลังจะให้เป็นของขวัญขว้างปาพร้อมกับด่าทอทั้งคู่ แต่ทว่าความซวยไม่ได้มีแค่นั้น เพื่อนตัวแสบของเธอไม่ได้หยุดLIVEกลับLIVEภาพเหตุการณ์นี้พร้อมด้วยใบหน้าที่ชวนตลกของเธอด้วย ทำให้ยอดฟอลและชื่อเสียงของเธอหล่นฮวบไปกับตาด้วยเหตุนี้ทำให้แพดเจ็ตต์ตัดสินใจ จะทวงความป๊อปของเธอกลับมาอีกครั้งด้วยการหา Loser ซักคนปรับโฉมให้กลายเป็นหนุ่มสุดฮอตและควงเขาไปงานพรอมพ์",
      Director(
        "Mark Waters",
        23,
        "assets/directors/Mark Waters.jpg",
      ),
      "3.54",
      "assets/movies/Hes-All-That.jpg",
    ),
    Movie(
      "Johnwick3:Parabellum",
      "ในภาคใหม่นี้ John Wick ต้องถูกคนทั้งโลกตามล่าด้วยค่าหัว 14ล้านเหรียญเนื่องจากเขาได้แหกกฎกลางโดยการฆ่าคนในพื้นที่โรงแรมของContinentalและยิ่งคนที่เขาฆ่าคือสมาชิกระดับสูงเขาจึงต้องสู้และฆ่ากับศัตรูรอบด้านเพื่อหาทางหลบหนีออกจากเมืองนิวยอร์ก",
      Director(
        "Chad Stahelski",
        11,
        "assets/directors/Chad Stahelski.jpg",
      ),
      "4.50",
      "assets/movies/Johnwick3.jpg",
    ),
    Movie(
      "Night Teeth",
      "นักศึกษาวิทยาลัยที่แสงจันทร์ส่องประกายเป็นคนขับรถไปรับหญิงสาวลึกลับสองคนเพื่อไปปาร์ตี้ใน LA คืนหนึ่ง แต่เมื่อเขาเปิดเผยเจตนากระหายเลือดของพวกเขา  และโลกใต้พิภพอันมืดมิดที่อันตราย เขาต้องต่อสู้เพื่อเอาชีวิตรอด",
      Director(
        "Adam Randall",
        7,
        "assets/directors/Adam Randall.jpg",
      ),
      "4.14",
      "assets/movies/nightteeth.jpg",
    ),
    Movie(
      "Shang-Chi and the Legend of the Ten Rings",
      "ภาพยนต์ฟอร์มยักษ์จาก จักรวาลมาร์เวล ซึ่งจะถ่ายทอดชีวิตของ ”ซั่งซี่” (ซื่อมู่หลิว) เด็กกำพร้าที่มีพลังวิเศษถูกเลี้ยงดูมาจากโรงเรียนพิเศษของเดอะแมนดาริน (เหลียงเฉาเหว่ย) ที่แห่งนี้จะรวบรวมเด็กๆที่มีพลังพิเศษมาฝึกฝนและประลองฝีมือกัน หากใครชนะจะได้ครอบครองแหวนทองสิบวงที่มีพลังในการบังคับธาตุต่างๆ ซั่งชี่หนีออกไปจากโรงเรียนของแมนดารินได้ และใช้ชีวิตอยู่ด้วยการหลบหนีมาตลอด แต่หลายปีต่อมาก็ถูกแมนดารินตามตัวจนพบและยื่นข้อเสนอให้แก่เขา นั่นคือขึ้นประลองยุทธในกำหนดที่ใกล้มาถึงเพราะแมนดารินแก่เกินกว่าที่จะต่อสู้แล้ว จึงให้ซั่งชี่ขึ้นประลองแทนเพื่อแลกกับอิสรภาพ",
      Director(
        "Destin Daniel Cretton",
        14,
        "assets/directors/Destin Daniel Cretton.jpg",
      ),
      "4.54",
      "assets/movies/Shang-chi.jpg",
    ),
    Movie(
      "SongBird",
      "ในโลกอนาคตปี 2024 เมื่อไวรัสโควิด 23 ระบาดร้ายแรงเริ่มกลายพันธุ์ และคร่าชีวิตผู้คนไปมากกว่า 110 ล้านรายทั่วโลก แต่แล้วหายนะก็บังเกิดกับ นิโก (เคเจ อาปา) ชายหนุ่มผู้มีภูมิคุ้มกัน เมื่อ ซารา (โซเฟีย คาร์สัน) แฟนสาวของเขาที่ไม่เคยมีโอกาสเจอกันอีกเลยนับตั้งแต่เกิดเหตุไวรัสระบาด กำลังจะถูกเจ้าหน้าที่บุกมาถึงที่พักภายในไม่กี่ชั่วโมงหลังถูกต้องสงสัยว่าติดเชื้อ นิโกจึงต้องรีบเดินทางฝ่ามฤตยูไวรัสล้างโลกนี้ พร้อมทำทุกวิถีทางเพื่อช่วยซาร่าให้ได้ก่อนที่ทุกอย่างจะสายเกินไป",
      Director(
        "Adam Mason",
        23,
        "assets/directors/Adam Mason.jpg",
      ),
      "3.89",
      "assets/movies/SongBird.jpg",
    ),
    Movie(
      "The Forgotten Battle",
      "เรื่องราวเกี่ยวกับแนวร่วมนับพันร่วมรบกับกองทัพเยอรมันบนเกาะวอลเคเรน จังหวัดเซลันด์ ในเดือนพฤศจิกายน 1944 ส่งผลให้ชีวิตน้อยๆ ทั้ง 3 ชีวิตเข้ามาเกี่ยวพันกันอย่างแยกไม่ออก ทั้งเด็กชายชาวดัทช์ที่ต้องต่อสู้กับทหารเยอรมัน, นักบินเครื่องร่อนชาวอังกฤษ และ เด็กหญิงชาวเซลันด์ ที่จำใจรวมกลุ่มต่อต้านในตอนแรก ทั้งสามต้องทำการตัดสินใจที่สำคัญยิ่งยวด ซึ่งไม่เพียงส่งผลต่ออิสรภาพของตัวเองเท่านั้น แต่ยังหมายถึงอิสรภาพของคนทั้งภูมิภาคอีกด้วย",
      Director(
        "Matthijs van Heijningen Jr.",
        14,
        "assets/directors/Matthijs van Heijningen Jr..jpg",
      ),
      "4.50",
      "assets/movies/Theforgottenbattle.jpg",
    ),
  ];
}

class Director {

  String fullname;
  int movies;
  String image;


  Director(this.fullname, this.movies, this.image);

}

List<Director> getDirectorList(){
  return <Director>[
    Director(
      "Matthias Schweighöfer",
      6,
      "assets/directors/Matthias Schweighöfer.jpg",
    ),
    Director(
      "Chloé Zhao",
      8,
      "assets/directors/Chloé Zhao.jpg",
    ),
    Director(
      "ศุภกร เหรียญสุวรรณ",
      2,
      "assets/directors/ศุภกร เหรียญสุวรรณ.jpg",
    ),
    Director(
      "Mark Waters",
      23,
      "assets/directors/Mark Waters.jpg",
    ),
    Director(
      "Chad Stahelski",
      11,
      "assets/directors/Chad Stahelski.jpg",
    ),
    Director(
      "Adam Randall",
      7,
      "assets/directors/Adam Randall.jpg",
    ),
    Director(
      "Destin Daniel Cretton",
      14,
      "assets/directors/Destin Daniel Cretton.jpg",
    ),
    Director(
      "Adam Mason",
      23,
      "assets/directors/Adam Mason.jpg",
    ),
    Director(
      "Matthijs van Heijningen Jr.",
      14,
      "assets/directors/Matthijs van Heijningen Jr..jpg",
    ),
  ];
}

class Filter {

  String name;

  Filter(this.name);

}

List<Filter> getFilterList(){
  return <Filter>[
    Filter("CLASSICS"),
    Filter("NEW"),
    Filter("UPCOMING"),
  ];
}