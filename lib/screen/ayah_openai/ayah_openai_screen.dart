import 'package:al_quran_app/screen/ayah_openai/ayah_openai_view_model.dart';
import 'package:al_quran_app/widgets/text_field_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AyahOpenAIScreen extends StatelessWidget {
  const AyahOpenAIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<AyahOpenAiVieModel>(context).buttonListener();
    return Scaffold(
      backgroundColor: const Color(0xffedf2fa),
      appBar: AppBar(
        title: Text(
          'Recommendation Ayah AI',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffb8e0d4),
      ),
      body: Consumer<AyahOpenAiVieModel>(
        builder: (context, ayahOpenAiViewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldWidgets(
                    controller: ayahOpenAiViewModel.conditionController,
                    labelText: "Condition",
                    hintText: "Input your current condition",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ayahOpenAiViewModel.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffb8e0d4),
                            ),
                            onPressed:
                                ayahOpenAiViewModel.getRecommendationAyah,
                            child: const Center(
                              child: Text(
                                'Get Recommendation by OpenAI',
                              ),
                            ),
                          ),
                  ),
                  if (ayahOpenAiViewModel.showResult &&
                      ayahOpenAiViewModel.gptResponseData != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ayat yang cocok untuk kondisi anda adalah: ',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            ayahOpenAiViewModel
                                    .gptResponseData?.choices[0].text ??
                                '',
                            style: GoogleFonts.poppins(),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
