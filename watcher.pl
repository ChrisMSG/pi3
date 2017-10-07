#!/usr/bin/env perl

use strict;
use warnings;
use File::ChangeNotify;

my $watcher = File::ChangeNotify->instantiate_watcher(
    directories => [ 'imagesout' ],
);

while (my @events = $watcher->wait_for_events) {
   my $ps = `pgrep -f feh`;

   if ( $ps > 0 ) {
     `kill $ps`
   }
   system('feh -D2 -F ./imagesout &');
}
