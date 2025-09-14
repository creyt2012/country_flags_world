import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:country_flags_world/country_flags_world.dart';

void main() {
  group('CountryFlag', () {
    testWidgets('should display flag with correct URL', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag(countryCode: 'us'),
          ),
        ),
      );

      expect(find.byType(CountryFlag), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should normalize country code to lowercase', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag(countryCode: 'US'),
          ),
        ),
      );

      expect(find.byType(CountryFlag), findsOneWidget);
    });

    testWidgets('should use predefined sizes correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag.small(countryCode: 'vn'),
          ),
        ),
      );
      expect(find.byType(CountryFlag), findsOneWidget);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag.medium(countryCode: 'fr'),
          ),
        ),
      );
      expect(find.byType(CountryFlag), findsOneWidget);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag.large(countryCode: 'de'),
          ),
        ),
      );
      expect(find.byType(CountryFlag), findsOneWidget);
    });

    testWidgets('should apply custom styling', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag(
              countryCode: 'jp',
              width: 100,
              height: 75,
              borderRadius: BorderRadius.circular(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(CountryFlag), findsOneWidget);
    });

    testWidgets('should show custom placeholder', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag(
              countryCode: 'it',
              placeholder: Container(
                color: Colors.grey[200],
                child: const Center(child: Text('Loading...')),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(CountryFlag), findsOneWidget);
    });

    testWidgets('should show custom fallback on error', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag(
              countryCode: 'invalid',
              fallback: Container(
                color: Colors.red[100],
                child: const Center(child: Icon(Icons.error)),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(CountryFlag), findsOneWidget);
    });

    testWidgets('should disable loading indicator', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag(
              countryCode: 'es',
              showLoadingIndicator: false,
            ),
          ),
        ),
      );

      expect(find.byType(CountryFlag), findsOneWidget);
    });

    testWidgets('should show shimmer effect when enabled', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag(
              countryCode: 'it',
              showShimmer: true,
              shimmerColor: Colors.blue,
            ),
          ),
        ),
      );

      expect(find.byType(CountryFlag), findsOneWidget);
    });

    testWidgets('should validate country code by default', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag(
              countryCode: 'invalid',
            ),
          ),
        ),
      );

      expect(find.byType(CountryFlag), findsOneWidget);
    });

    testWidgets('should not validate country code when disabled', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag(
              countryCode: 'invalid',
              validateCountryCode: false,
            ),
          ),
        ),
      );

      expect(find.byType(CountryFlag), findsOneWidget);
    });

    testWidgets('should use custom flag size', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag(
              countryCode: 'fr',
              flagSize: FlagSize.huge,
            ),
          ),
        ),
      );

      expect(find.byType(CountryFlag), findsOneWidget);
    });

    testWidgets('should show custom error message for invalid country code', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag(
              countryCode: 'invalid',
              invalidCountryCodeMessage: 'Custom error message',
            ),
          ),
        ),
      );

      expect(find.byType(CountryFlag), findsOneWidget);
    });
  });

  group('CountryHelper', () {
    test('should validate country codes correctly', () {
      expect(CountryHelper.isValidCountryCode('us'), isTrue);
      expect(CountryHelper.isValidCountryCode('vn'), isTrue);
      expect(CountryHelper.isValidCountryCode('invalid'), isFalse);
      expect(CountryHelper.isValidCountryCode(''), isFalse);
    });

    test('should normalize country codes', () {
      expect(CountryHelper.normalizeCountryCode('US'), equals('us'));
      expect(CountryHelper.normalizeCountryCode('Vn'), equals('vn'));
      expect(CountryHelper.normalizeCountryCode('fr'), equals('fr'));
    });

    test('should get country names', () {
      expect(CountryHelper.getCountryName('us'), equals('United States'));
      expect(CountryHelper.getCountryName('vn'), equals('Vietnam'));
      expect(CountryHelper.getCountryName('invalid'), isNull);
    });

    test('should get flag URLs', () {
      expect(CountryHelper.getFlagUrl('us'), equals('https://flagcdn.com/w80/us.png'));
      expect(CountryHelper.getFlagUrl('vn', size: 'w160'), equals('https://flagcdn.com/w160/vn.png'));
    });

    test('should throw error for invalid country code', () {
      expect(() => CountryHelper.getFlagUrl('invalid'), throwsArgumentError);
    });

    test('should throw error for invalid flag size', () {
      expect(() => CountryHelper.getFlagUrl('us', size: 'invalid'), throwsArgumentError);
    });
  });

  group('FlagSize', () {
    test('should have correct values', () {
      expect(FlagSize.small.value, equals('w20'));
      expect(FlagSize.medium.value, equals('w40'));
      expect(FlagSize.large.value, equals('w80'));
      expect(FlagSize.extraLarge.value, equals('w160'));
      expect(FlagSize.huge.value, equals('w320'));
      expect(FlagSize.extraHuge.value, equals('w640'));
    });

    test('should have correct dimensions', () {
      expect(FlagSize.small.width, equals(20));
      expect(FlagSize.small.height, equals(13));
      expect(FlagSize.large.width, equals(80));
      expect(FlagSize.large.height, equals(53));
    });

    test('should have correct aspect ratio', () {
      expect(FlagSize.small.aspectRatio, equals(3 / 2));
      expect(FlagSize.large.aspectRatio, equals(3 / 2));
    });
  });

  group('CountryFlagWithName', () {
    testWidgets('should display flag with country name', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlagWithName(countryCode: 'us'),
          ),
        ),
      );

      expect(find.byType(CountryFlagWithName), findsOneWidget);
      expect(find.text('United States'), findsOneWidget);
    });

    testWidgets('should display small flag with name', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlagWithName.small(countryCode: 'vn'),
          ),
        ),
      );

      expect(find.byType(CountryFlagWithName), findsOneWidget);
      expect(find.text('Vietnam'), findsOneWidget);
    });

    testWidgets('should hide country name when showCountryName is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlagWithName(
              countryCode: 'us',
              showCountryName: false,
            ),
          ),
        ),
      );

      expect(find.byType(CountryFlagWithName), findsOneWidget);
      expect(find.text('United States'), findsNothing);
    });

    testWidgets('should display vertical layout', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlagWithName(
              countryCode: 'us',
              direction: Axis.vertical,
            ),
          ),
        ),
      );

      expect(find.byType(CountryFlagWithName), findsOneWidget);
      expect(find.text('United States'), findsOneWidget);
    });
  });

  group('FlagShape', () {
    test('should have correct display names', () {
      expect(FlagShape.rectangle.displayName, equals('Rectangle'));
      expect(FlagShape.circle.displayName, equals('Circle'));
      expect(FlagShape.square.displayName, equals('Square'));
      expect(FlagShape.rounded.displayName, equals('Rounded'));
      expect(FlagShape.stadium.displayName, equals('Stadium'));
      expect(FlagShape.diamond.displayName, equals('Diamond'));
      expect(FlagShape.roundedDiamond.displayName, equals('Rounded Diamond'));
    });

    test('should return correct border radius', () {
      expect(FlagShape.rectangle.getBorderRadius(80, 53), isNull);
      expect(FlagShape.rounded.getBorderRadius(80, 53), isA<BorderRadius>());
      expect(FlagShape.circle.getBorderRadius(80, 53), isA<BorderRadius>());
      expect(FlagShape.square.getBorderRadius(80, 53), isNull);
    });

    test('should return correct aspect ratio', () {
      expect(FlagShape.rectangle.getAspectRatio(), isNull);
      expect(FlagShape.circle.getAspectRatio(), equals(1.0));
      expect(FlagShape.square.getAspectRatio(), equals(1.0));
      expect(FlagShape.roundedSquare.getAspectRatio(), equals(1.0));
    });

    test('should return correct clip behavior', () {
      expect(FlagShape.rectangle.getClipBehavior(), equals(Clip.antiAlias));
      expect(FlagShape.circle.getClipBehavior(), equals(Clip.antiAlias));
      expect(FlagShape.diamond.getClipBehavior(), equals(Clip.antiAlias));
    });

    test('should return transform for diamond shapes', () {
      expect(FlagShape.rectangle.getTransform(), isNull);
      expect(FlagShape.diamond.getTransform(), isA<Matrix4>());
      expect(FlagShape.roundedDiamond.getTransform(), isA<Matrix4>());
    });
  });

  group('Flag Shapes in CountryFlag', () {
    testWidgets('should display rectangle flag', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag(
              countryCode: 'us',
              shape: FlagShape.rectangle,
            ),
          ),
        ),
      );

      expect(find.byType(CountryFlag), findsOneWidget);
    });

    testWidgets('should display circle flag', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag(
              countryCode: 'vn',
              shape: FlagShape.circle,
              width: 60,
              height: 60,
            ),
          ),
        ),
      );

      expect(find.byType(CountryFlag), findsOneWidget);
    });

    testWidgets('should display square flag', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag(
              countryCode: 'fr',
              shape: FlagShape.square,
              width: 60,
              height: 60,
            ),
          ),
        ),
      );

      expect(find.byType(CountryFlag), findsOneWidget);
    });

    testWidgets('should display rounded flag', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag(
              countryCode: 'de',
              shape: FlagShape.rounded,
            ),
          ),
        ),
      );

      expect(find.byType(CountryFlag), findsOneWidget);
    });
  });
} 