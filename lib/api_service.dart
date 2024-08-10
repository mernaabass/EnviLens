import 'package:google_generative_ai/google_generative_ai.dart';

class ApiService {
  final String apiKey;
  final GenerativeModel model;

  ApiService({required this.apiKey})
      : model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);

  Future<String> generateResponse(String prompt) async {
    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);
    return response.text ?? 'No response';
  }
}
