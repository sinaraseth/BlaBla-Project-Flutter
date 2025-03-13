import 'ride_preferences/console_logger.dart';
import 'ride_preferences/model.dart';
import 'ride_preferences/ride_preferences_service.dart';

void main() {
  // Service create
  RidePreferencesService service = RidePreferencesService();

  // logger and register it as a listener
  ConsoleLogger logger = ConsoleLogger();
  service.addListener(logger);

  // ride preferences
  RidePreference eco = RidePreference ("Eco Ride");
  RidePreference luxury = RidePreference ("Luxury Ride");

  // ride preferences change (ConsoleLogger should get notified)
  service.selectPreference(eco);
  service.selectPreference(luxury); 
}
