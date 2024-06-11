import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  var data;
  var client = http.Client();
  TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getWeatherData("dakar");
  }

  Future getWeatherData(city) async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=bbc93ffd124ccc42a63ba9240d037955';
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        data = convert.jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather App'), ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? "City cannot be empty." : null,
                  controller: _cityController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("City"),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  getWeatherData(_cityController.text);
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          if (data != null)
            Row(
              children: [
                const Text("Température :"),
                Text("${(data['main']['temp'] - 273.15).toStringAsFixed(2)}°C"),
                const Spacer(),
                CircleAvatar(
                  backgroundImage: AssetImage(
                      "${'images/' + data['weather'][0]['main']}.png"),
                ),
              ],
            ),
          if (data != null)
            Row(
              children: [
                const Text("Humidité :"),
                Text("${data['main']['humidity']}%"),
              ],
            ),
        ],
      ),
    );
  }
}
