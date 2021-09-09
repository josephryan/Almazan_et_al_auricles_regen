#!/usr/bin/perl

use strict;
use warnings;
use List::Util qw(shuffle);
use JFR::Fasta;
use Data::Dumper;

our $VERSION = '0.01';
our $DIR = '../07-ORTHOFINDER_AA/01-INPUT_DATA/OrthoFinder/Results_Aug12/Single_Copy_Orthologue_Sequences';
our $SIG_GDOR = '1870_gdor.txt';
our $SIG_SMED = '193_dd_Smed.txt';
our $SEED = 420;
our $REPS = 10000;

MAIN: {
    srand($SEED);
    my $ra_files = get_files($DIR);
    my ($rh_s,$rh_g,$rh_p) = get_singles($ra_files,$DIR);
    my $ra_g_sig = get_list($SIG_GDOR);
    my $ra_s_sig = get_list($SIG_SMED);
    my $ra_g_sig_sc = overlap($ra_g_sig,$rh_g);
    my $ra_s_sig_sc = overlap($ra_s_sig,$rh_s);
my $num_s_sig_sc = scalar(@{$ra_s_sig_sc});
print "\$num_s_sig_sc = $num_s_sig_sc\n";
    my $rh_88_ddsmed = build_hash($ra_s_sig_sc);
    my $overlap_count = 0;
    foreach my $gi (@{$ra_g_sig_sc}) {
#print "$gi - $rh_p->{$gi}\n" if ($rh_88_ddsmed->{$rh_p->{$gi}});
        $overlap_count++ if ($rh_88_ddsmed->{$rh_p->{$gi}});
    }
    my $gte = run_mc($REPS,$rh_g,$ra_g_sig_sc,$rh_88_ddsmed,$rh_p,$overlap_count);
    my $pval = $gte / $REPS;
    print "\$overlap_count = $overlap_count\n";
    print "\$gte = $gte\n";
    print "\$pval = $pval\n";
}

sub run_mc {
    my $reps = shift;
    my $rh_g = shift;
    my $ra_g_sig = shift;
    my $rh_88_ddsmed = shift;
    my $rh_p = shift;
    my $test_stat = shift;

    my $num_to_choose = scalar(@{$ra_g_sig});
    my $index = $num_to_choose - 1;
    my $gte = 0;
    my $high = 0;
    foreach (1 .. $reps) {
        my @g_rand = shuffle(keys(%{$rh_g}));
        my @g_to_test = @g_rand[0..$index];
        my $overlap_count = 0;
        foreach my $gi (@g_to_test) {
            $overlap_count++ if ($rh_88_ddsmed->{$rh_p->{$gi}});
        }
#print "$overlap_count\n";
        $high = $overlap_count unless ($high > $overlap_count);
        $gte++ if ($overlap_count >= $test_stat);
    }
print "\$high = $high\n";
    return $gte;
}

sub build_hash {
    my $ra_s = shift;
    my %hash = ();
    foreach my $s (@{$ra_s}) {
        $hash{$s}++;
    }
    return \%hash;
}

sub overlap {
    my $ra_sig = shift;
    my $rh_single = shift;
    my $count = 0;
    my @overlap = ();
    foreach my $sig (@{$ra_sig}) {
        push @overlap, $sig if ($rh_single->{$sig});
    }
    return \@overlap;
}

sub get_list {
    my $file = shift;
    my @ids  = ();
    open IN, $file or die "cannot open $file:$!";
    while (my $line = <IN>) {
        chomp $line;
        push @ids, $line;
    }
    return \@ids;
}

sub get_singles {
    my $ra_f = shift;
    my $dir  = shift;
    my %ddsmed = ();
    my %gir    = ();
    my %pairs  = ();
    foreach my $file (@{$ra_f}) {
        my $fp = JFR::Fasta->new("$dir/$file");
        my $sm = '';
        my $gi = '';
        while (my $rec = $fp->get_record()) {
            my $id = JFR::Fasta->get_def_w_o_gt($rec->{'def'});
            if ($id =~ m/dd_Smed/) {
                $id =~ s/^Gene\.\d+__//;
                $id =~ s/__g\..*//;
                $ddsmed{$id}++;
                $sm = $id;
            } else {
                $id =~ s/^Gene\.\d+__//;
                $id =~ s/_(g\.?\d+)__g.*/_$1/;
                $gir{$id}++;
                $gi = $id;
            }
        }
        $pairs{$gi} = $sm;
    }
    return (\%ddsmed,\%gir,\%pairs);
}

sub get_files {
    my $dir = shift;
    opendir DIR, $dir or die "cannot opendir $dir:$!";
    my @files = grep { /\.fa$/ } readdir(DIR);
    return \@files;
}

