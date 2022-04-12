MODULE RRC_Main
	TASK PERS tooldata tip_lf_2:=[TRUE,[[-0.231116,1.85045,153.49],[1,0,0,0]],[1,[0,0,0],[1,0,0,0],0,0,0]];
	TASK PERS wobjdata lacing_final_r1:=[FALSE,TRUE,"",[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]]];
    !***********************************************************************************
    !
    ! ETH Zurich / Robotic Fabrication Lab
    ! HIB C 13 / Stefano-Franscini-Platz 1
    ! CH-8093 Zurich
    !
    !***********************************************************************************
    !
    ! PROJECT     :  RRC - Rapid Robot Communication
    !
    ! FUNCTION    :  Main modul for the project 
    !
    ! AUTHOR      :  Philippe Fleischmann
    !
    ! EMAIL       :  rrc@arch.ethz.ch
    !
    ! HISTORY     :  2019.02.22
    !
    ! Copyright   :  ETH Zurich (CH) 2019
    !                - Philippe Fleischmann
    !                - Michael Lyrenmann
    !                - Gonzalo Casas
    !
    ! License     :  This code base is governed by an EULA (End-User License Agreement)
    !                which you have received together with the software.
    !                You are not allowed to use the software on a real robots
    !                without a signed EULA.
    !
    !                A copy of the EULA content is in the controller task (T_CTRL).
    !
    !***********************************************************************************

    !************************************************
    ! Function    :     main
    ! Programmer  :     Philippe Fleischmann
    ! Date        :     2019.02.22
    !***************** ETH Zurich *******************
    !
    PROC main()
        !****************************!
        !                            !
        !   #####   #####    ####    !
        !   #    #  #    #  #    #   !
        !   #    #  #    #  #        !
        !   #####   #####   #        !
        !   #   #   #   #   #    #   !
        !   #    #  #    #   ####    !
        !                            !
        !****************************!
        !
        r_RRC_Main;
    ENDPROC

ENDMODULE