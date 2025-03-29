FROM ruby:3.2-slim

# Install essential Linux packages
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy Gemfile first
COPY Gemfile ./

# Install gems
RUN bundle install

# Copy the rest of the application
COPY . .

# Expose port 4000
EXPOSE 4000

# Start the server
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"] 