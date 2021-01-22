import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neiproject2021/model/product_model.dart' as p;
import 'package:neiproject2021/service/product_service.dart';
import 'package:neiproject2021/widget/custom_page_widget.dart';
import 'package:neiproject2021/widget/dots_indicator_widget.dart';



class AddProduct extends StatefulWidget {
  AddProduct({Key key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File _image;
  List<Widget> _imagesList = [];
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _imagesList.add(
          Image.file(_image),
        );
      } else {
        print('No image selected.');
      }
    });
  }

  int currStep = 0;
  static var _focusNode = FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final p.Product product = p.Product();
  final productService = ProductService();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final seize = MediaQuery.of(context).size;
    final _controller = PageController(
      initialPage: 0,
    );
    const _kDuration = Duration(milliseconds: 400);
    const _kCurve = Curves.ease;

    final List<Widget> _screens = [
      FlutterLogo(
        textColor: Colors.brown,
        style: FlutterLogoStyle.stacked,
      ),
      FlutterLogo(
        textColor: Colors.pink,
        style: FlutterLogoStyle.horizontal,
      ),
      FlutterLogo(
        textColor: Colors.black,
        style: FlutterLogoStyle.markOnly,
      )
    ];

    Widget _buildPageItem(BuildContext context, int index) {
      return _imagesList.length == 0
          ? CustomPage(page: _screens[index], idx: index)
          : CustomPage(page: _imagesList[index], idx: index);
    }

  Widget _firstStep(){
    return Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                onSaved: (String value) {
                  product.name = value;
                },
                // onChanged: (value) {
                //   setState(() {
                //     product.name = value;
                //   });
                // },
                maxLines: 1,
                //initialValue: 'Aseem Wangoo',
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'Por favor ingrese un nombre';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Nombre ',
                    hintText: 'Nombre ',
                    //filled: true,
                    icon: const Icon(Icons.person),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                autocorrect: false,
                // onSaved: (String value) {
                //   data.name = value;
                // },
                 onSaved: (value) {
                  // setState(() {
                    product.idCategory = int.parse(value);
                  // });
                },
                maxLines: 1,
                //initialValue: 'Aseem Wangoo',
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'Ingrese una categoría';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Categoría ',
                    hintText: 'Categoría ',
                    icon: const Icon(Icons.person),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                onSaved: (String value) {
                  // setState(() {
                     product.code = value;

                  // });
                },
                maxLines: 1,
                //initialValue: 'Aseem Wangoo',
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'Por favor ingrese un código';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Código ',
                    hintText: 'Código ',
                    icon: const Icon(Icons.person),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                onSaved: (String value) {
                    // setState(() {
                     product.composition = value;

                    // });
                },
                maxLines: 1,
                //initialValue: 'Aseem Wangoo',
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'Please enter name';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Composición ',
                    hintText: 'Composición ',
                    icon: const Icon(Icons.person),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                onSaved: (String value) {
                    // setState(() {
                                        product.tissue = value;

                    // });
                },
                maxLines: 1,
                //initialValue: 'Aseem Wangoo',
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'Por favor ingrese un tejido';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Tejido ',
                    hintText: 'Tejido ',
                    icon: const Icon(Icons.person),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                onSaved: (String value) {
                    // setState(() {
                                        product.use = value;

                    // });
                },
                maxLines: 1,
                //initialValue: 'Aseem Wangoo',
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'Por favor ingrese un uso';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Uso ',
                    hintText: 'Uso ',
                    icon: const Icon(Icons.person),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                onSaved: (String value) {
                    // setState(() {
                    product.waterRepelence = value;
                    // });
                },
                maxLines: 1,
                //initialValue: 'Aseem Wangoo',
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'Por favor ingrese la repelencia';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Repelencia al agua',
                    hintText: 'Repelencia al agua',
                    icon: const Icon(Icons.person),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                onSaved: (String value) {
                    // setState(() {
                      product.description = value;

                    // });
                },
                maxLines: 1,
                //initialValue: 'Aseem Wangoo',
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'Por favor ingrese un tejido';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Descripción',
                    hintText: 'Descripción',
                    icon: const Icon(Icons.person),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                autocorrect: false,
                onSaved: ( value) {
                    // setState(() {
                    product.basePrice = int.parse(value);

                    // });
                },
                maxLines: 1,
                //initialValue: 'Aseem Wangoo',
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'Por favor ingrese una descripción';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Precio base',
                    hintText: 'Precio base',
                    icon: const Icon(Icons.person),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
            ],
          );
  }

Widget _secondStep(){
  return Column(
            children: [
              Center(
                // _imagesList.length == 0
                child: _image == null
                    ? Text('No image selected.')
                    :
                    // Image.file(_image),

                    Stack(
                        children: [
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: seize.width * 0.15),
                              height: seize.height * 0.35,
                              width: seize.width * 0.90,
                              child: PageView.builder(
                                physics: AlwaysScrollableScrollPhysics(),
                                controller: _controller,
                                itemCount: _imagesList.length,
                                itemBuilder: (BuildContext context,
                                        int index) =>
                                    _buildPageItem(
                                        context, index % _imagesList.length),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              color: Colors.grey[50].withOpacity(0),
                              padding: EdgeInsets.all(20.0),
                              child: DotsIndicator(
                                controller: _controller,
                                itemCount: _imagesList.length,
                                onPageSelected: (int indexPage) {
                                  _controller.animateToPage(indexPage,
                                      duration: _kDuration, curve: _kCurve);
                                },
                                context: context,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          );
}

    List<Step> steps = [
      Step(
          title: const Text('Datos del Producto'),
          subtitle: const Text('Agrega las características del producto'),
          isActive: true,
          state: StepState.indexed,
          content: _firstStep()
          ),
      Step(
          title: const Text('Agregar fotos'),
          //subtitle: const Text('Subtitle'),
          isActive: true,
          //state: StepState.editing,
          state: StepState.indexed,
          content: _secondStep()
          ),
    ];

    void _submitDetails() {
      final FormState formState = _formKey.currentState;

      if (!formState.validate()) {
        showDialog(
            context: context,
            child: AlertDialog(
              title: Text('Datos invalidos'),
              content: Text('Verifica los campos invalidos por favor'),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Aceptar'))
              ],
            ));
      } else {

        productService.Add(product);


        formState.save();
        print("Name: ${product.name}");
        print("Phone: ${product.code}");
        print("Email: ${product.basePrice}");
        print("Age: ${product.description}");

        showDialog(
            context: context,
            child: AlertDialog(
              title: Text("Details"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text("Name : " + product.name),
                    Text("Phone : " + product.code),
                    Text("Email : " + product.basePrice.toString()),
                    Text("Age : " + product.description),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
      }
    }

    Widget _customForm(){
      return Form(
              key: _formKey,
              child: Stepper(
                physics: ClampingScrollPhysics(),
                steps: steps,
                type: StepperType.vertical,
                currentStep: this.currStep,
                onStepContinue: () {
                  setState(() {
                    if (currStep < steps.length - 1) {
                      currStep = currStep + 1;
                    } else {
                      currStep = 0;
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (currStep > 0) {
                      currStep = currStep - 1;
                    } else {
                      currStep = 0;
                    }
                  });
                },
                onStepTapped: (step) {
                  setState(() {
                    currStep = step;
                  });
                },
              ),
            );
    }

    Widget _submitButton(){
        return RaisedButton(
            child: Text(
              'Save details',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: _submitDetails,
            color: Colors.blue,
          );
    }

    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: _customForm()
          ),
          _submitButton()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
