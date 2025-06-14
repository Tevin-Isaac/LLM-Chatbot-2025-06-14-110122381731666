import LLM "mo:llm";

persistent actor {
  /// Sends a prompt to the Llama3 1.8B model and returns the response.
  public func prompt(prompt : Text) : async Text {
    // Input validation: limit prompt length
    if (prompt.size() > 1024) {
      return "Error: Prompt too long.";
    };
    try {
      await LLM.prompt(#Llama3_1_8B, prompt);
    } catch (err) {
      // Handle errors gracefully
      return "Error: Failed to get response from LLM.";
    }
  };

  /// Sends a chat history to the Llama3 1.8B model and returns the response.
  public func chat(messages : [LLM.ChatMessage]) : async Text {
    // Input validation: limit number of messages
    if (messages.size() > 50) {
      return "Error: Too many messages in chat history.";
    };
    try {
      await LLM.chat(#Llama3_1_8B, messages);
    } catch (err) {
      return "Error: Failed to get chat response from LLM.";
    }
  };
};