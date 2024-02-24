import 'package:flutter/material.dart';
import '../model/advancedsearchcriteria.dart';

// Define the Property class
class Property {
  final String name;
  final double squareFootage;
  final double lotSize;
  final int yearBuilt;
  final List<String> features;
  final List<String> landmarks;

  Property({
    required this.name,
    required this.squareFootage,
    required this.lotSize,
    required this.yearBuilt,
    required this.features,
    required this.landmarks,
  });
}

void main() {
  runApp(MaterialApp(
    home: AdvancedSearchScreen(),
  ));
}

class AdvancedSearchScreen extends StatefulWidget {
  @override
  _AdvancedSearchScreenState createState() => _AdvancedSearchScreenState();
}

class _AdvancedSearchScreenState extends State<AdvancedSearchScreen> {
  final _formKey = GlobalKey<FormState>();
  AdvancedSearchCriteria _searchCriteria = AdvancedSearchCriteria();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Minimum Square Footage'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _searchCriteria.minSquareFootage = double.tryParse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Maximum Square Footage'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _searchCriteria.maxSquareFootage = double.tryParse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Minimum Lot Size'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _searchCriteria.minLotSize = double.tryParse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Maximum Lot Size'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _searchCriteria.maxLotSize = double.tryParse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Minimum Year Built'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _searchCriteria.minYearBuilt = int.tryParse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Maximum Year Built'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _searchCriteria.maxYearBuilt = int.tryParse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Desired Features (comma-separated)'),
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  _searchCriteria.desiredFeatures = value!.split(',');
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Desired Landmarks (comma-separated)'),
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  _searchCriteria.desiredLandmarks = value!.split(',');
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Validate and save the form
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Perform search with the advanced search criteria
                    _performSearch();
                  }
                },
                child: Text('Search'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _performSearch() {
    // Sample list of properties
    List<Property> properties = [
      Property(
        name: 'Beautiful House',
        squareFootage: 2000,
        lotSize: 0.5,
        yearBuilt: 2005,
        features: ['Swimming pool', 'Garden', 'Garage'],
        landmarks: ['School', 'Park'],
      ),
      Property(
        name: 'Cozy Apartment',
        squareFootage: 1000,
        lotSize: 0.2,
        yearBuilt: 2010,
        features: ['Balcony', 'Gym', 'Security'],
        landmarks: ['Park'],
      ),
    ];

    // Filter properties based on advanced search criteria
    List<Property> filteredProperties = properties.where((property) {
      return (_searchCriteria.minSquareFootage == null || property.squareFootage >= _searchCriteria.minSquareFootage!) &&
          (_searchCriteria.maxSquareFootage == null || property.squareFootage <= _searchCriteria.maxSquareFootage!) &&
          (_searchCriteria.minLotSize == null || property.lotSize >= _searchCriteria.minLotSize!) &&
          (_searchCriteria.maxLotSize == null || property.lotSize <= _searchCriteria.maxLotSize!) &&
          (_searchCriteria.minYearBuilt == null || property.yearBuilt >= _searchCriteria.minYearBuilt!) &&
          (_searchCriteria.maxYearBuilt == null || property.yearBuilt <= _searchCriteria.maxYearBuilt!) &&
          (_searchCriteria.desiredFeatures == null || _searchCriteria.desiredFeatures!.isEmpty || _searchCriteria.desiredFeatures!.any((feature) => property.features.contains(feature))) &&
          (_searchCriteria.desiredLandmarks == null || _searchCriteria.desiredLandmarks!.isEmpty || _searchCriteria.desiredLandmarks!.any((landmark) => property.landmarks.contains(landmark)));
    }).toList();

    // Display filtered properties
    print('Properties matching your search criteria:');
    for (var property in filteredProperties) {
      print('Name: ${property.name}');
      print('Square Footage: ${property.squareFootage} sqft');
      print('Lot Size: ${property.lotSize} acres');
      print('Year Built: ${property.yearBuilt}');
      print('Features: ${property.features}');
      print('Landmarks: ${property.landmarks}');
      print('');
    }
  }
}
