# WorkCalendar

Simple yet effective gem for calculating workday `Time` objects.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'work_calendar'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install work_calendar

## Usage

Check if specified date is workday. If no `date` parameter was passed it checks current day:

```ruby
WorkCalendar.workday?(date)
```

Get next `n`'th workday date relative to specified date; if no `date` parameter was passed, it returns value relative to current day; if no `n` parameter was passed, it defaults to first next workday:

```ruby
WorkCalendar.next_workday(n, date)
```

Works same way as `next_workday` method, only looking backwards.

```ruby
WorkCalendar.prev_workday(n, date)
```

Get first/last day since specified date

```ruby
WorkCalendar.first_workday_since(date)
WorkCalendar.last_workday_since(date)
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
