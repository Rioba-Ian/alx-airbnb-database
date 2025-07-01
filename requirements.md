The Airbnb Clone Project

The ERD diagram for the Airbnb Clone Project is as follows:

![Airbnb Clone ERD](../docs/images/database-entity.png)

All Entities

```txt

// define tables
users {
  id string pk
  name string
  email string
  password_hash string
  phone string
  created_at timestamp
  updated_at timestamp
}

properties {
  id string pk
  owner_id string
  title string
  description string
  address string
  city string
  state string
  country string
  price_per_night decimal
  max_guests int
  num_bedrooms int
  num_bathrooms int
  amenities string
  created_at timestamp
  updated_at timestamp
}

bookings {
  id string pk
  user_id string
  property_id string
  check_in_date date
  check_out_date date
  num_guests int
  total_price decimal
  status string
  created_at timestamp
  updated_at timestamp
}

payments{
  id string pk
  booking_id string
  user_id string
  amount decimal
  payment_method string
  payment_status string
  paid_at timestamp
  created_at timestamp
  updated_at timestamp
}

reviews {
  id string pk
  user_id string
  property_id string
  booking_id string
  rating int
  comment string
  created_at timestamp
  updated_at timestamp
}

messages{

  message_id string pk
  sender_id string
  recipient_id string
  message_body string
  sent_at timestamp
}


// define relationships
properties.owner_id > users.id
bookings.user_id > users.id
bookings.property_id > properties.id
payments.booking_id > bookings.id
payments.user_id > users.id
reviews.user_id > users.id
reviews.property_id > properties.id
reviews.booking_id > bookings.id
messages.sender_id > users.id
messages.recipient_id > users.id

```
