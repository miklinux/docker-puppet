# Run stage for initial changes
stage { 'first': before => Stage['main'] }

# Classes configured from Hiera
lookup('classes', Array[String], 'unique').include

Package { allow_virtual => true }
