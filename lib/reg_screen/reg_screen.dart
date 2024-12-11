import 'package:flutter/material.dart';
import 'package:consult_minus/themes/themes.dart';

class reg_screen extends StatefulWidget {
  const reg_screen({super.key});

  @override
  State<reg_screen> createState() => _reg_screenState();
}

class _reg_screenState extends State<reg_screen> {
  @override
  bool obscureText = true;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.only(right:290, top: 20 ),
              child: IconButton(onPressed: ()
              {
                Navigator.pushReplacementNamed(context, '/');
              },
                  icon: Image.asset('assets/strelka.png', width: 50, height: 50,))
          ),
          Padding(padding: const EdgeInsets.only(left: 0, right: 0, top: 10),
            child: Text('Создать аккаунт',
                style: AppShrifts.ralewayBold32.copyWith(color: AppColors.black)
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Text('Добро пожаловать!',
                textAlign: TextAlign.center,
                style: AppShrifts.poppinsRegular16.copyWith(color: AppColors.grey)
            ),
          ),
          Padding(padding: const EdgeInsets.only(right: 300, top: 10),
            child: Text('Имя',
                style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black)
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: TextField(
              cursorColor: AppColors.black,
              decoration: InputDecoration(
                  fillColor: AppColors.lightGrey,
                  filled: true,
                  hintText: ('Волков В.В.'),
                  hintStyle: AppShrifts.poppinsMedium14.copyWith(color: AppColors.darkGrey.withOpacity(0.6)),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none
                  )
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(right: 300, top: 10),
            child: Text('Email',
                style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black)
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: TextField(
              cursorColor: AppColors.black,
              decoration: InputDecoration(
                  fillColor: AppColors.lightGrey,
                  filled: true,
                  hintText: ('xyz@gmail.com'),
                  hintStyle: AppShrifts.poppinsMedium14.copyWith(color: AppColors.darkGrey.withOpacity(0.6)),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none
                  )
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(right: 280, top: 15),
            child: Text('Пароль',
                style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black)
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: AppColors.black,
                      obscureText: obscureText,
                      obscuringCharacter: ('·'),
                      decoration: InputDecoration(
                          suffixIcon:
                          IconButton(
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            icon: Icon(
                              obscureText ? Icons.visibility_off : Icons.visibility,
                              color: Colors.black,

                            ),
                          ),
                          fillColor: AppColors.lightGrey,
                          filled: true,
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide.none
                          ),
                          hintText: ('··········'),
                          hintStyle: AppShrifts.poppinsMedium14.copyWith(color: AppColors.darkGrey.withOpacity(0.6))
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: ElevatedButton(onPressed: ()
            {
              Navigator.pushReplacementNamed(context, '/home');
            },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)

                  ),
                  minimumSize: const Size(300, 50)
              ),
              child: Text('Создать аккаунт',
                  style: AppShrifts.ralewaySemiBold14.copyWith(color: AppColors.white)
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Есть аккаунт? ",
                      style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.darkGrey)
                  ),
                  InkWell(
                    onTap: ()
                    {
                      Navigator.pushReplacementNamed(context, '/reg');
                    },
                    child: Text("Войти",
                        style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black)
                    ),
                  )
                ],
              )
          ),
          Padding(padding: const EdgeInsets.only(left: 10, right: 10, top: 120),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Нажимая войти, вы соглашаетесь с нашей ",
                      style: AppShrifts.poppinsRegular12.copyWith(color: AppColors.darkGrey)
                  ),
                ],
              )
          ),
          Padding(
            padding: const EdgeInsets.only(),
            child: InkWell(
              onTap: ()
              {
                Navigator.pushReplacementNamed(context, '/politic');
              },
              child: Text("Политикой конфиденциальности",
                  style: AppShrifts.poppinsRegular12.copyWith(color: AppColors.black)
              ),
            ),
          )
        ],
      ),
    );
  }
}