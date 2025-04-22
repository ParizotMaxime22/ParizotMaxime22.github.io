import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:captcha_verification/captcha_verification.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey _formCardKey = GlobalKey(); // Add this key for the form card
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _enterpriseController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  bool _captchaVerified = false;
  bool _captchaAttempted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _enterpriseController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _onCaptchaVerified(bool isVerified) {
    setState(() {
      _captchaAttempted = true;
      _captchaVerified = isVerified;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && _captchaVerified) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Message envoyé avec succès !'),
          backgroundColor: Colors.green,
        ),
      );
      _formKey.currentState!.reset();
      setState(() {
        _captchaVerified = false;
        _captchaAttempted = false;
      });
    }
  }

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'parizot.maxime22@gmail.com',
      query:
          'subject=${Uri.encodeComponent('Suite au visionnage de votre portfolio:')}',
    );

    if (!await launchUrl(emailUri)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Impossible d\'ouvrir l\'application email'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Me contacter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Vous avez des questions ? Ou peut-être ai-je piquer votre intérêt ?',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            "N'hésitez pas à m'envoyer un email !",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),

          // Simple Email Link
          Row(
            children: [
              GestureDetector(
                onTap: _launchEmail,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Transform.scale(
                    scaleX: 1.25,
                    child: const Icon(
                      Icons.email,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SelectableText(
                'parizot.maxime22@gmail.com',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            'Ou utilisez le formulaire ci-dessous:',
            style: Theme.of(context).textTheme.bodyLarge,
          ),

          // Contact Form with Overlay
          Stack(
            children: [
              // The original form card with a key to measure its size
              Card(
                key: _formCardKey,
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Formulaire de Contact',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 20),

                        // Form Fields
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: 'Prénom *',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator:
                              (value) =>
                                  value?.isEmpty ?? true
                                      ? 'Veuillez saisir votre prénom'
                                      : null,
                        ),
                        const SizedBox(height: 16),

                        TextFormField(
                          controller: _surnameController,
                          decoration: const InputDecoration(
                            labelText: 'Nom *',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                          validator:
                              (value) =>
                                  value?.isEmpty ?? true
                                      ? 'Veuillez saisir votre nom'
                                      : null,
                        ),
                        const SizedBox(height: 16),

                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email *',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Veuillez saisir votre email';
                            }
                            if (!RegExp(
                              r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                            ).hasMatch(value!)) {
                              return 'Veuillez saisir une adresse email valide';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        TextFormField(
                          controller: _enterpriseController,
                          decoration: const InputDecoration(
                            labelText: 'Entreprise (Optionnel)',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.business),
                          ),
                        ),
                        const SizedBox(height: 16),

                        TextFormField(
                          controller: _messageController,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            labelText: 'Message *',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.message),
                            alignLabelWithHint: true,
                          ),
                          validator:
                              (value) =>
                                  value?.isEmpty ?? true
                                      ? 'Veuillez saisir votre message'
                                      : null,
                        ),
                        const SizedBox(height: 24),

                        // Captcha Verification
                        Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 140,
                                width: 650,
                                child: CaptchaVerification(
                                  textFieldDecoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText:
                                        "Veuillez respecter les majuscules/minuscules.",
                                  ),
                                  labelText: "Êtes vous vraiment humain ?",
                                  errorText: "",
                                  onVerified: _onCaptchaVerified,
                                  verifiedWidget: const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.verified),
                                      SizedBox(width: 5),
                                      Text("Vérifié"),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              if (_captchaAttempted && !_captchaVerified)
                                const Text(
                                  'La vérification a échoué. Veuillez réessayer.',
                                  style: TextStyle(color: Colors.red, fontSize: 14),
                                ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: _captchaVerified ? _submitForm : null,
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(200, 50),
                                  backgroundColor:
                                      _captchaVerified
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                ),
                                child: const Text(
                                  'Envoyer',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              // Red Cross Overlay using LayoutBuilder to match form size
              LayoutBuilder(
                builder: (context, constraints) {
                  // Get the RenderBox of the form card
                  final RenderBox? renderBox = _formCardKey.currentContext?.findRenderObject() as RenderBox?;
                  
                  // Default size in case the form isn't rendered yet
                  double formWidth = constraints.maxWidth;
                  double formHeight = 700; // Fallback height
                  
                  // If the form is rendered, use its actual size
                  if (renderBox != null) {
                    formWidth = renderBox.size.width;
                    formHeight = renderBox.size.height;
                  }
                  
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.zero,
                    color: Colors.transparent,
                    child: ClipRect(
                      child: Container(
                        width: formWidth,
                        height: formHeight,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          border: Border.all(color: Colors.red, width: 3),
                        ),
                        child: Stack(
                          children: [
                            // X mark
                            CustomPaint(
                              size: Size(formWidth, formHeight),
                              painter: CrossPainter(),
                            ),
                            
                            // Message
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                color: Colors.white.withOpacity(0.9),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.warning_amber_rounded,
                                      color: Colors.red,
                                      size: 50,
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      "Ce formulaire n'est pas disponible pour le moment, celui-ci sera utilisable à l'avenir. Veuillez me contacter par email pour le moment.",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 16),
                                    ElevatedButton.icon(
                                      onPressed: _launchEmail,
                                      icon: const Icon(Icons.email),
                                      label: const Text('Envoyer un email'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        foregroundColor: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom painter for drawing the red cross
class CrossPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(0, 0),
      Offset(size.width, size.height),
      paint,
    );
    
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(0, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}