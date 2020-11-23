if [ "$1" = "bad.log" ]
then
./build/ARM/gem5.opt \
    --debug-flags=IEW,Commit,IQ \
    configs/example/se.py \
    --num-cpus=1 --caches --cpu-type=DerivO3CPU --param "system.cpu[:].robBypass=False" \
    --cmd ../parsec-3.0/pkgs/apps/blackscholes/inst/aarch64-linux.gcc-hooks/bin/blackscholes \
    --options '1 ./in_16.txt ./log' > bad.log
elif [ "$1" = "good.log" ]
then
./build/ARM/gem5.opt \
    --debug-flags=IEW,Commit,IQ \
    configs/example/se.py \
    --num-cpus=1 --caches --cpu-type=DerivO3CPU --param "system.cpu[:].robBypass=True" \
    --cmd ../parsec-3.0/pkgs/apps/blackscholes/inst/aarch64-linux.gcc-hooks/bin/blackscholes \
    --options '1 ./in_16.txt ./log' > good.log
elif [ "$1" = "bad" ]
then
./build/ARM/gem5.opt \
    configs/example/se.py \
    --num-cpus=1 --caches --cpu-type=DerivO3CPU --param "system.cpu[:].robBypass=False" \
    --cmd ../parsec-3.0/pkgs/apps/blackscholes/inst/aarch64-linux.gcc-hooks/bin/blackscholes \
    --options '1 ./in_16.txt ./log'
else
./build/ARM/gem5.opt \
    configs/example/se.py \
    --num-cpus=1 --caches --cpu-type=DerivO3CPU --param "system.cpu[:].robBypass=True" \
    --cmd ../parsec-3.0/pkgs/apps/blackscholes/inst/aarch64-linux.gcc-hooks/bin/blackscholes \
    --options '1 ./in_16.txt ./log'
fi
