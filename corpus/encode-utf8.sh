ls -1 *-out.gz | sort -n | xargs -rn1 zcat | perl -Mutf8 -we 'my $s=""; while (<STDIN>) { if (/^<s/) {$s=$_;} if (/ #1->/) { print "</s>\n$s"; } print; }' | ~/perl/parse_cqp.pl | ~/parsers/bin/depcqp-append.pl | perl -Mutf8 -we 'while(<>) { if (/^<s/) {$_="";} if (/^(?:\x{a4}|¤)\t([^\t]+)/) {$a=$1; $ a=~ s/"-/" /g; print "<s $a>\n"; s/^(\x{a4}|¤)\t[^\t]+/\x{a4}\t\x{a4}/;} print; }' | gzip -9c > ../deu-corona.cqp.gz
