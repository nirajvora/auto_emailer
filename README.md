# auto_emailer

## Requirements

- ruby 2.6+

## Prerequisites

### ensure your email configuration is set in the configuration directory (gitignored)

1. In the root of this project create a directory `config` and place a file called `email_config.yml` in there with the following contents:

   ```yaml
   email: "[YOUR EMAIL]"
   password: "[YOUR EMAIL'S PASSWORD]"
   mail_server: "smtp.ionos.com" #this is the outbound smpt mail server of your email provider. The example provided is for mail.ionos.com
   name: "[NAME THAT WILL SHOW UP IN THE EMAIL HEADER]"
   subject: "Business Inquiry"
   ```
   
   Any other global variables you want to add can be added to this file.

### csv file in `data` directory

1. Generate csv file from excel file. Order of the columns do not matter

   | Page       | Name       | Email            | Something 1 | Something 2 |
   |------------|------------|------------------|-------------|-------------|
   | Complex    | John Doe   | John@Complex.com | anything 1  | anything 2  |
   | XXL        | Jeff Shmoe | Jeff@xxl.com     | anything 3  | anything 5  |
   | @music_mag | Billy      | Billy@gmail.com  | anything 4  | anything 6  |
   
   The column names take the first row of the excel sheet as they will be used to generate object keys. `Page`, `Name` and `Email` MUST exist as column names.
   - `Page` is the name of the blog, social media page, etc. you are trying to contact for.
   - `Name` is the name of the person on the recieving end of the email. (This is not required for each entry the column just needs to exist)
   - `Email` is the email you are contacting
   
1. Generate csv file from excel file.
1. Place csv file in the `data/` directory that should be located in the root of this project direcotry.

### ensure template is formatted correctly and placed in `templates directory`

- Template should follow `ERB` templating [syntax](https://stackoverflow.com/questions/7996695/what-is-the-difference-between-and-in-erb-in-rails) and will therefore be a `.erb` file
- Use `templates/youtube.erb` as an example
- Within your template, only `Name`, `Page`, and `Email` can be accessed:
   - `Name` can be accessed using `@name`
   - `Page` can be accessed using `@page`
   - `Email` can be accessed using `@email`
- More 'per influencer' data ingested from the csv can be added to the template's scope by defining it in the `initialize` function in `lib/influencer_email.rb`
- Within your template, anthing defined in `email_config.csv` can be accessed using `@email_config['variable_defined_in_file']`
- Test your template using a `sample.csv` before actually sending it to the real people

## usage

From within the /bin directory, simply run the following command:

   ```bash
   ruby run.rb ../data/example.csv ../templates/example.erb 
   ```
