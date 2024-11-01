import 'package:flutter/material.dart';



class CustomAppBar extends StatelessWidget {

 final String? iconButton;
 final VoidCallback? onclick;
  const CustomAppBar({
    super.key,
    this.iconButton,
    this.onclick ,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height/3.8,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/image_login.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
       if(iconButton != null)  Positioned(
          top: 30,
          left: 30,
          child: InkWell(
              onTap: onclick,
              child: Image.asset(iconButton! )),
         /*Container(
            width: 36,
              height: 36,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
              ),
              child: IconButton(

                icon:  Icon(, color: Colors.black,size: 24,),
                onPressed:onclick ?? () {
                  Navigator.of(context).pop();
                },
              )

          ),*/
        ),
        Positioned(
          top: 50,
          left: MediaQuery
              .of(context)
              .size
              .width / 2 - 50,
          child: Image.asset(
            'assets/images/Frame.png',
            height: 80.0,
          ),
        ),
      ],
    );
  }

}
