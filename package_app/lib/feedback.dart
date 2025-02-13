import 'package:flutter/material.dart';

class CustomFeedbackForm extends StatefulWidget {
  const CustomFeedbackForm({super.key, this.scrollController, required this.onSubmit});

  final ScrollController? scrollController;
  final void Function(String feedbackText, {Map<String, dynamic>? extras}) onSubmit;

  @override
  State<CustomFeedbackForm> createState() => _CustomFeedbackFormState();
}

class _CustomFeedbackFormState extends State<CustomFeedbackForm> with TickerProviderStateMixin {
  final CustomFeedback _customFeedback = CustomFeedback();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  if (widget.scrollController != null)
                    const FeedbackSheetDragHandle(),
                  ListView(
                    controller: widget.scrollController,
                    padding: EdgeInsets.fromLTRB(
                        16, widget.scrollController != null ? 20 : 16, 16, 0),
                    children: [
                      const Text('What kind of feedback do you want to give?'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                DropdownButton<FeedbackType>(
                                  value: _customFeedback.feedbackType,
                                  items: FeedbackType.values
                                      .map(
                                        (type) => DropdownMenuItem<FeedbackType>(
                                      value: type,
                                      child: Text(type
                                          .toString()
                                          .split('.')
                                          .last
                                          .replaceAll('_', ' ')),
                                    ),
                                  ).toList(),
                                  onChanged: (feedbackType) =>
                                      setState(() => _customFeedback.feedbackType = feedbackType),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('What is your feedback?'),
                      TextField(
                        onChanged: (newFeedback) =>
                        _customFeedback.feedbackText = newFeedback,
                      ),
                      const SizedBox(height: 16),
                      const Text('How does this make you feel?'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: FeedbackRating.values
                            .map(_ratingToIcon)
                            .toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              autofocus: true,
              onPressed: _customFeedback.feedbackType != null
                  ? () {
                // Navigate to the FeedbackSummaryPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeedbackSummaryPage(
                      feedbackText: _customFeedback.feedbackText ?? '',
                      extras: _customFeedback.toMap(),
                    ),
                  ),
                );
              }
                  : null,
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _ratingToIcon(FeedbackRating rating) {
    final bool isSelected = _customFeedback.rating == rating;
    late IconData icon;
    switch (rating) {
      case FeedbackRating.bad:
        icon = Icons.sentiment_dissatisfied;
        break;
      case FeedbackRating.neutral:
        icon = Icons.sentiment_neutral;
        break;
      case FeedbackRating.good:
        icon = Icons.sentiment_satisfied;
        break;
    }
    return IconButton(
      color: isSelected ? Theme.of(context).colorScheme.secondary : Colors.grey,
      onPressed: () => setState(() => _customFeedback.rating = rating),
      icon: Icon(icon),
      iconSize: 36,
    );
  }
}

enum FeedbackType { bug, suggestion, other }

enum FeedbackRating { bad, neutral, good }

class CustomFeedback {
  FeedbackType? feedbackType;
  String? feedbackText;
  FeedbackRating? rating;

  Map<String, dynamic> toMap() {
    return {
      'feedbackType': feedbackType?.toString(),
      'feedbackText': feedbackText,
      'rating': rating?.toString(),
    };
  }
}

class FeedbackSheetDragHandle extends StatelessWidget {
  const FeedbackSheetDragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 40,
      color: Colors.grey[400],
      margin: const EdgeInsets.symmetric(vertical: 8),
    );
  }
}

class FeedbackSummaryPage extends StatelessWidget {
  final String feedbackText;
  final Map<String, dynamic>? extras;

  const FeedbackSummaryPage({super.key, required this.feedbackText, this.extras});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Your feedback:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(feedbackText),
            const SizedBox(height: 16),
            if (extras != null) ...[
              const Text('Additional Information:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Feedback Type: ${extras!['feedbackType']}'),
              const SizedBox(height: 8),
              Text('Rating: ${extras!['rating']}'),
            ],
          ],
        ),
      ),
    );
  }
}
