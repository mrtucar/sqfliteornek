import 'package:flutter/material.dart';
import 'package:sqfliteornek/utils/dbHelper.dart';
import '../model/note_model.dart';

class NoteScreen extends StatelessWidget {
  final Note? note;
  const NoteScreen({Key? key, this.note}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tittleController = TextEditingController();
    final descriptionConttolller = TextEditingController();
    if (note != null) {
      tittleController.text = note!.title;
      tittleController.text = note!.description;
    }

    return Scaffold(
      appBar: AppBar(title: Text(note == null ? 'Not Ekle' : 'Not Düzenle'),
      centerTitle: true,
      ),
      body:Padding(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Column (
          children: [
            Padding(padding: EdgeInsets.only(bottom: 40),
            child: Center(child: Text("Ne Düşünüyorsunuz?",
            style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),),),
            Padding(padding: EdgeInsets.only(bottom: 40),
            child: TextFormField(
              controller: tittleController,
              maxLines:1,
              decoration: const InputDecoration(
                hintText:  'Başlık',
                labelText: 'Not Başlığı',
                border:OutlineInputBorder(
                  borderSide: BorderSide(
                    color:Colors.white,
                    width: 0.75
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0)
                  )
                )
              ),
            )
            ),
            TextFormField(
              onChanged: (str){},
              controller: descriptionConttolller,
              maxLines:5,
              decoration: const InputDecoration(
                  hintText:  'Açıklama',
                  labelText: 'Açıklamayı Giriniz',
                  border:OutlineInputBorder(
                      borderSide: BorderSide(
                          color:Colors.white,
                          width: 0.75
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)
                      )
                  )
              ),
            ),
            Spacer(),
            Padding(padding: const EdgeInsets.only(bottom:20.0),
            child: SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(onPressed: () async {
                final title = tittleController.value.text;
                final description = descriptionConttolller.value.text;
                if (title.isEmpty || description.isEmpty) {
                  return;
                }
                final Note model = Note(
                  title: title, description: description,
                  id:note?.id
                );
                if (note == null) {
                  await DatabaseHelper.addNote(model);
                }
                else {
                  DatabaseHelper.updateNote(model);
                }
                Navigator.pop(context);
              },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        side:BorderSide(
                          color:Colors.white,
                          width: 0.75
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                      )
                    )
                  ),
              child:Text(note == null ? "Kaydet" : "Güncelle",
                style: TextStyle(fontSize: 20),
                )
              ),),
            ),
            
          ],
        )
      )
    );
  }
}
