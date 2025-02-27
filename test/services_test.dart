// ignore_for_file: avoid_print

import 'package:week_3_blabla_project/service/rides_service.dart';
import 'package:week_3_blabla_project/service/locations_service.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';

String _formatDateTime(DateTime? dt) {
  if (dt == null) return 'No date';
  return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')} '
      '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
}

// Helper function to check if date is today
bool isToday(DateTime? date) {
  if (date == null) return false;
  final now = DateTime.now();
  return date.year == now.year &&
      date.month == now.month &&
      date.day == now.day;
}

void main() {
  testAvailableRides();
}

void testAvailableRides() {
  print('\n📱 BLABLA APP - RIDES TEST 📱');

  try {
    // Verify locations are available
    if (LocationsService.availableLocations.isEmpty) {
      throw Exception('No locations available in the system');
    }

    final rides = RidesService.availableRides;

    // OPTION 1: Show all rides
    // print('\n=== All Available Rides ===');
    // print('Total rides: ${rides.length}\n');

    // OPTION 2: Show only today's rides 
    final todayRides = rides.where((ride) => isToday(ride.departureDate)).toList();
    print('\n=== Today\'s Available Rides ===');
    print('Total rides today: ${todayRides.length}\n');
    

    if (rides.isEmpty) {
      print('❌ No rides available');
    } else {
      // OPTION 1: Display all rides
      // for (final ride in rides) {
      //   print(
      //       '🚗 ${ride.departureLocation.name} ➡️ ${ride.arrivalLocation.name}');
      //   print('⏰ ${_formatDateTime(ride.departureDate)}');
      //   print('💵 Price: \$${ride.pricePerSeat}');
      //   print('💺 Seats available: ${ride.availableSeats}\n');
      //   print('');
      // }

      // OPTION 2: Display only today's rides
      for (final ride in todayRides) {
        print('🚗 ${ride.departureLocation.name} ➡️ ${ride.arrivalLocation.name}');
        print('⏰ ${_formatDateTime(ride.departureDate)}');
        print('💵 Price: \$${ride.pricePerSeat}');
        print('💺 Seats available: ${ride.availableSeats}\n');
        print('');
      }
      
    }
  } catch (e, stackTrace) {
    print('\n❌ Error: $e');
    print('Stack trace: $stackTrace');
  }
}
