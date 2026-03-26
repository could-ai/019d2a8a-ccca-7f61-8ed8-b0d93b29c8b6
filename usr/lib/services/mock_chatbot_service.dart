// lib/services/mock_chatbot_service.dart - Mock AI chatbot
class MockChatbotService {
  // Basic keyword-based responses (expand for real AI via Supabase Edge Functions)
  String getReply(String message) {
    if (message.toLowerCase().contains('facial')) return 'We offer Basic Facial for ₹500. Book now!';
    if (message.toLowerCase().contains('bridal')) return 'Bridal Makeup starts at ₹2000. Let me know your date!';
    return 'Hello! How can I help with your beauty needs? Try asking about facials or bookings.';
  }
}