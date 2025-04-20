echo Python
time python pyfibo.py

echo ------

echo Mojo Run
time mojo run mojofibo.mojo

echo ---

echo Mojo Build Run

time mojo build mojofibo.mojo 
# currently unable to build mojo into /build, not sure if my issue or a bug.
echo ------

echo Run Mojo Build

time mojofibo

echo ------

echo Julia
time julia jlfibo.jl

echo ------

echo Codon Run Default
time codon run codonfibo.codon 36

echo ------

echo Codon Build Release

echo --- BUILD

time codon build --release codonfibo.codon -o build/codonfibo

echo --- RUN

time build/codonfibo 36

echo ------

echo RUST Build

time rustc -O rustfibo.rs -o build/rustfibo

echo ------

echo RUST RUN

time build/rustfibo