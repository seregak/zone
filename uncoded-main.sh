#/bin/bash
cd /home/serega/uncoded/80-90/
if [ -z "`ls -A`" ]; 
	then :
else
	/project/scripts/uncoded/80-90.sh
fi

cd /home/serega/uncoded/disco/
if [ -z "`ls -A`" ]; 
	then :
else
        /project/scripts/uncoded/disco.sh
fi

cd /home/serega/uncoded/electro-house/
if [ -z "`ls -A`" ];
        then :
else
        /project/scripts/uncoded/electro-house.sh
fi

cd /home/serega/uncoded/lounge/
if [ -z "`ls -A`" ];
        then :
else
        /project/scripts/uncoded/lounge.sh
fi

cd /home/serega/uncoded/ost/
if [ -z "`ls -A`" ];
        then :
else
        /project/scripts/uncoded/ost.sh
fi

cd /home/serega/uncoded/pop/
if [ -z "`ls -A`" ];
        then :
else
        /project/scripts/uncoded/pop.sh
fi

cd /home/serega/uncoded/rap/
if [ -z "`ls -A`" ];
        then :
else
        /project/scripts/uncoded/rap.sh
fi

cd /home/serega/uncoded/rnb/
if [ -z "`ls -A`" ];
        then :
else
        /project/scripts/uncoded/rnb.sh
fi

cd /home/serega/uncoded/rock/
if [ -z "`ls -A`" ];
        then :
else
        /project/scripts/uncoded/rock.sh
fi

cd /home/serega/uncoded/trance/
if [ -z "`ls -A`" ];
        then :
else
        /project/scripts/uncoded/trance.sh
fi

cd /home/serega/uncoded/uncensored/
if [ -z "`ls -A`" ];
        then :
else
        /project/scripts/uncoded/uncensored.sh
fi

/project/scripts/cleendir-uncod.sh
