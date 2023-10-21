part of '../../presentation.dart';

class ChooseViewScreen extends StatelessWidget {
  const ChooseViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Choose View',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            ListView.builder(
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context.pushNamed(options[index].route);
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.radio_button_checked_outlined,
                          size: 15,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          options[index].option,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
