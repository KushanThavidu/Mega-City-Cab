package registration;

public class Booking {
    private final int id;
    private final String firstName;
    private final String phoneNumber;
    private final String pickupLocation;
    private final String destination;
    private final String pickupDate;
    private final String pickupTime;
    private final String rideType;
    private final String note;

    public Booking(int id, String firstName, String phoneNumber, String pickupLocation, String destination, 
                   String pickupDate, String pickupTime, String rideType, String note) {
        this.id = id;
        this.firstName = firstName;
        this.phoneNumber = phoneNumber;
        this.pickupLocation = pickupLocation;
        this.destination = destination;
        this.pickupDate = pickupDate;
        this.pickupTime = pickupTime;
        this.rideType = rideType;
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getPickupLocation() {
        return pickupLocation;
    }

    public String getDestination() {
        return destination;
    }

    public String getPickupDate() {
        return pickupDate;
    }

    public String getPickupTime() {
        return pickupTime;
    }

    public String getRideType() {
        return rideType;
    }

    public String getNote() {
        return note;
    }
}