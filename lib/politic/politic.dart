import 'package:flutter/material.dart';
import 'package:consult_minus/themes/themes.dart';

class politic_screen extends StatefulWidget {
  const politic_screen({super.key});

  @override
  State<politic_screen> createState() => _politic_screenState();
}

class _politic_screenState extends State<politic_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.only(left: 0, right: 0, bottom: 10),
              child: Text('Политика Конфиденциальности',
                  style: AppShrifts.ralewayBold26.copyWith(color: AppColors.black)
              ),
            ),
            Text(
              'Дата вступления в силу: 12.12.2024',
              style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black)
            ),
            const SizedBox(height: 20),
            Text(
              'Мы, команда "Consultant minus", серьезно относимся к вашей конфиденциальности и защите ваших персональных данных. Настоящая политика конфиденциальности описывает, как мы собираем, используем, храним и защищаем вашу информацию, когда вы используете наше мобильное приложение.',
              style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black)
            ),
            const SizedBox(height: 20),
            // Добавьте сюда дополнительные разделы политики конфиденциальности
            Text(
              'Ваши данные хранятся на защищенных серверах, и мы принимаем все необходимые меры для защиты информации от несанкционированного доступа, изменения или уничтожения. Мы храним ваши данные только в течение времени, необходимого для выполнения целей, указанных в этой политике.',
              style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black)
            ),
            const SizedBox(height: 20),
            Text(
              'Передача данных. Ваши данные могут передаваться третьим лицам, только если это необходимо для предоставления услуг.',
              style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black)
            ),
            const SizedBox(height: 20),
            Text(
              'Использование данных. Мы можем использовать ваши данные для улучшения нашего приложения.',
              style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black)
            ),
            const SizedBox(height: 20),
            Text(
              'Мы не продаем и не передаем ваши личные данные третьим лицам без вашего согласия, за исключением случаев, когда это необходимо по закону или для выполнения контракта.',
              style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black)
            ),
            const SizedBox(height: 20),
            Text(
              'Использование данных. Мы можем использовать ваши данные для улучшения нашего приложения.',
              style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black)
            ),
            const SizedBox(height: 20),
            Text(
                'При использовании приложения "Consultant minus" мы можем собирать следующую информацию:',
                style: AppShrifts.ralewaySemiBold16.copyWith(color: AppColors.black)
            ),
            const SizedBox(height: 20),
            Text(
                '- Личная информация: имя, адрес электронной почты, номер телефона.',
                style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black)
            ),
            Text(
                '- Информация о консультациях: детали ваших запросов на консультации и предоставленные вами документы.',
                style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black)
            ),
            Text(
                '- Техническая информация: данные о вашем устройстве, включая модель, операционную систему, IP-адрес и данные об использовании приложения.',
                style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black)
            ),
            const SizedBox(height: 20),
            Text(
              'Если у вас есть вопросы или комментарии по этой политике конфиденциальности, пожалуйста, свяжитесь с нами по адресу адрес электронной почты Введите адрес электронной почты.',
              style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black),
            ),
            const SizedBox(height: 20),
            Text(
                'Контактная информация:',
                style: AppShrifts.ralewaySemiBold16.copyWith(color: AppColors.black)
            ),
            Text(
              'Если у вас есть вопросы о нашей политике конфиденциальности, вы можете связаться с нами',
              style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black)
            ),
            Text(
                'Mail: reviobandela51451@gmail.com',
                style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black)
            ),
            Text(
                'telegram: @revquiem',
                style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black)
            ),
            Text(
                'phone: 89009226739',
                style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black)
            ),
            const SizedBox(height: 20),
            Padding(padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
              child: ElevatedButton(onPressed: ()
              {
                Navigator.pushReplacementNamed(context, '/');
              },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)

                    ),
                    minimumSize: const Size(300, 50)
                ),
                child: Text('Принять',
                    style: AppShrifts.ralewaySemiBold14.copyWith(color: AppColors.white)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}