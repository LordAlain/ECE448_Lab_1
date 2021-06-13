-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Fri Feb  5 01:19:57 2021
-- Host        : Kasiski running 64-bit Ubuntu 16.04.6 LTS
-- Design      : Lab1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity CU is
  port (
    \FSM_sequential_p_state_reg[1]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_p_state_reg[0]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \FSM_sequential_p_state_reg[1]_1\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    SS : out STD_LOGIC_VECTOR ( 0 to 0 );
    done_OBUF : out STD_LOGIC;
    start_IBUF : in STD_LOGIC;
    lsb_s : in STD_LOGIC;
    B_IBUF : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \PISO_reg[1]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    A_IBUF : in STD_LOGIC_VECTOR ( 4 downto 0 );
    \after_s_reg[5]\ : in STD_LOGIC;
    \after_s_reg[4]\ : in STD_LOGIC;
    \after_s_reg[2]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Mode_IBUF : in STD_LOGIC;
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_p_state_reg[0]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end CU;

architecture STRUCTURE of CU is
  signal \^d\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_p_state[1]_i_1\ : label is "soft_lutpair8";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_p_state_reg[0]\ : label is "s_reset:00,s_wait:01,s_done:11,s_exponential:10";
  attribute FSM_ENCODED_STATES of \FSM_sequential_p_state_reg[1]\ : label is "s_reset:00,s_wait:01,s_done:11,s_exponential:10";
  attribute SOFT_HLUTNM of \PISO[1]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \PISO[2]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \after_s[1]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \after_s[5]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \after_y[5]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \after_y[5]_i_2\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of done_OBUF_inst_i_1 : label is "soft_lutpair11";
begin
  D(0) <= \^d\(0);
  Q(1 downto 0) <= \^q\(1 downto 0);
\FSM_sequential_p_state[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"38"
    )
        port map (
      I0 => start_IBUF,
      I1 => \^q\(0),
      I2 => \^q\(1),
      O => \^d\(0)
    );
\FSM_sequential_p_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \FSM_sequential_p_state_reg[0]_1\(0),
      Q => \^q\(0)
    );
\FSM_sequential_p_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \^d\(0),
      Q => \^q\(1)
    );
\PISO[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => B_IBUF(0),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => start_IBUF,
      I4 => \PISO_reg[1]\(0),
      O => \FSM_sequential_p_state_reg[0]_0\(0)
    );
\PISO[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => B_IBUF(1),
      I1 => start_IBUF,
      I2 => \^q\(0),
      I3 => \^q\(1),
      O => \FSM_sequential_p_state_reg[0]_0\(1)
    );
\after_s[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => A_IBUF(0),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => start_IBUF,
      I4 => \after_s_reg[2]\(0),
      O => \FSM_sequential_p_state_reg[1]_1\(0)
    );
\after_s[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => A_IBUF(1),
      I1 => start_IBUF,
      I2 => \^q\(0),
      I3 => \^q\(1),
      O => \FSM_sequential_p_state_reg[1]_1\(1)
    );
\after_s[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"20002000EFFF2000"
    )
        port map (
      I0 => A_IBUF(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => start_IBUF,
      I4 => \after_s_reg[2]\(1),
      I5 => \after_s_reg[2]\(0),
      O => \FSM_sequential_p_state_reg[1]_1\(2)
    );
\after_s[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => A_IBUF(3),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => start_IBUF,
      I4 => \after_s_reg[4]\,
      O => \FSM_sequential_p_state_reg[1]_1\(3)
    );
\after_s[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => A_IBUF(4),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => start_IBUF,
      I4 => \after_s_reg[5]\,
      O => \FSM_sequential_p_state_reg[1]_1\(4)
    );
\after_y[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => start_IBUF,
      O => SS(0)
    );
\after_y[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6240"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => start_IBUF,
      I3 => lsb_s,
      O => \FSM_sequential_p_state_reg[1]_0\(0)
    );
done_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A1"
    )
        port map (
      I0 => \^q\(1),
      I1 => Mode_IBUF,
      I2 => \^q\(0),
      O => done_OBUF
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity DP is
  port (
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    \after_s_reg[1]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \after_s_reg[4]_0\ : out STD_LOGIC;
    Y_OBUF : out STD_LOGIC_VECTOR ( 5 downto 0 );
    \after_s_reg[2]_0\ : out STD_LOGIC;
    \PISO_reg[2]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    lsb_s : out STD_LOGIC;
    start_IBUF : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Mode_IBUF : in STD_LOGIC;
    \after_s_reg[5]_0\ : in STD_LOGIC_VECTOR ( 4 downto 0 );
    A_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    \after_y_reg[5]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \PISO_reg[2]_1\ : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end DP;

architecture STRUCTURE of DP is
  signal \B__0\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \PISO[0]_i_1_n_0\ : STD_LOGIC;
  signal after_mul_y : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \after_mul_y12__0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \after_mul_y12__0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \after_mul_y12__0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \after_mul_y12__0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \after_mul_y12__0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \after_mul_y12__0_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \after_mul_y12__0_carry__0_n_3\ : STD_LOGIC;
  signal \after_mul_y12__0_carry__0_n_6\ : STD_LOGIC;
  signal \after_mul_y12__0_carry__0_n_7\ : STD_LOGIC;
  signal \after_mul_y12__0_carry_i_1_n_0\ : STD_LOGIC;
  signal \after_mul_y12__0_carry_i_2_n_0\ : STD_LOGIC;
  signal \after_mul_y12__0_carry_i_3_n_0\ : STD_LOGIC;
  signal \after_mul_y12__0_carry_i_4_n_0\ : STD_LOGIC;
  signal \after_mul_y12__0_carry_i_5_n_0\ : STD_LOGIC;
  signal \after_mul_y12__0_carry_i_6_n_0\ : STD_LOGIC;
  signal \after_mul_y12__0_carry_i_7_n_0\ : STD_LOGIC;
  signal \after_mul_y12__0_carry_i_8_n_0\ : STD_LOGIC;
  signal \after_mul_y12__0_carry_n_0\ : STD_LOGIC;
  signal \after_mul_y12__0_carry_n_1\ : STD_LOGIC;
  signal \after_mul_y12__0_carry_n_2\ : STD_LOGIC;
  signal \after_mul_y12__0_carry_n_3\ : STD_LOGIC;
  signal \after_mul_y12__0_carry_n_4\ : STD_LOGIC;
  signal \after_mul_y12__0_carry_n_5\ : STD_LOGIC;
  signal \after_mul_y12__15_carry_i_1_n_0\ : STD_LOGIC;
  signal \after_mul_y12__15_carry_i_2_n_0\ : STD_LOGIC;
  signal \after_mul_y12__15_carry_i_3_n_0\ : STD_LOGIC;
  signal \after_mul_y12__15_carry_i_4_n_0\ : STD_LOGIC;
  signal \after_mul_y12__15_carry_i_5_n_0\ : STD_LOGIC;
  signal \after_mul_y12__15_carry_i_6_n_0\ : STD_LOGIC;
  signal \after_mul_y12__15_carry_i_7_n_0\ : STD_LOGIC;
  signal \after_mul_y12__15_carry_i_8_n_0\ : STD_LOGIC;
  signal \after_mul_y12__15_carry_n_1\ : STD_LOGIC;
  signal \after_mul_y12__15_carry_n_2\ : STD_LOGIC;
  signal \after_mul_y12__15_carry_n_3\ : STD_LOGIC;
  signal after_s : STD_LOGIC_VECTOR ( 5 downto 2 );
  signal \^after_s_reg[1]_0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal after_y : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal counter_s : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \counter_s[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter_s[1]_i_1_n_0\ : STD_LOGIC;
  signal \^lsb_s\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_after_mul_y12__0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_after_mul_y12__0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_after_mul_y12__15_carry_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \Y_OBUF[1]_inst_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \Y_OBUF[2]_inst_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \Y_OBUF[3]_inst_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \Y_OBUF[4]_inst_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \Y_OBUF[5]_inst_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \after_mul_y12__0_carry__0_i_4\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \after_mul_y12__0_carry__0_i_6\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \after_mul_y12__0_carry_i_8\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \after_mul_y12__15_carry_i_5\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \after_mul_y12__15_carry_i_6\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \after_mul_y12__15_carry_i_7\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \after_mul_y12__15_carry_i_8\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \after_s[4]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \after_s[5]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \counter_s[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \counter_s[1]_i_1\ : label is "soft_lutpair1";
begin
  \after_s_reg[1]_0\(1 downto 0) <= \^after_s_reg[1]_0\(1 downto 0);
  lsb_s <= \^lsb_s\;
\FSM_sequential_p_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"004400440FFF0F00"
    )
        port map (
      I0 => counter_s(0),
      I1 => counter_s(1),
      I2 => start_IBUF,
      I3 => Q(0),
      I4 => Mode_IBUF,
      I5 => Q(1),
      O => D(0)
    );
\PISO[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AACCFAAA"
    )
        port map (
      I0 => \^lsb_s\,
      I1 => p_0_in(0),
      I2 => start_IBUF,
      I3 => Q(0),
      I4 => Q(1),
      O => \PISO[0]_i_1_n_0\
    );
\PISO_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \PISO[0]_i_1_n_0\,
      Q => \^lsb_s\,
      R => '0'
    );
\PISO_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => \PISO_reg[2]_1\(0),
      Q => p_0_in(0),
      R => '0'
    );
\PISO_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => \PISO_reg[2]_1\(1),
      Q => \PISO_reg[2]_0\(0),
      R => '0'
    );
\Y_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Mode_IBUF,
      I1 => after_y(0),
      O => Y_OBUF(0)
    );
\Y_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Mode_IBUF,
      I1 => after_y(1),
      O => Y_OBUF(1)
    );
\Y_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Mode_IBUF,
      I1 => after_y(2),
      O => Y_OBUF(2)
    );
\Y_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Mode_IBUF,
      I1 => after_y(3),
      O => Y_OBUF(3)
    );
\Y_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Mode_IBUF,
      I1 => after_y(4),
      O => Y_OBUF(4)
    );
\Y_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Mode_IBUF,
      I1 => after_y(5),
      O => Y_OBUF(5)
    );
\after_mul_y12__0_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \after_mul_y12__0_carry_n_0\,
      CO(2) => \after_mul_y12__0_carry_n_1\,
      CO(1) => \after_mul_y12__0_carry_n_2\,
      CO(0) => \after_mul_y12__0_carry_n_3\,
      CYINIT => '0',
      DI(3) => \after_mul_y12__0_carry_i_1_n_0\,
      DI(2) => \after_mul_y12__0_carry_i_2_n_0\,
      DI(1) => \after_mul_y12__0_carry_i_3_n_0\,
      DI(0) => '0',
      O(3) => \after_mul_y12__0_carry_n_4\,
      O(2) => \after_mul_y12__0_carry_n_5\,
      O(1 downto 0) => after_mul_y(1 downto 0),
      S(3) => \after_mul_y12__0_carry_i_4_n_0\,
      S(2) => \after_mul_y12__0_carry_i_5_n_0\,
      S(1) => \after_mul_y12__0_carry_i_6_n_0\,
      S(0) => \after_mul_y12__0_carry_i_7_n_0\
    );
\after_mul_y12__0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \after_mul_y12__0_carry_n_0\,
      CO(3 downto 1) => \NLW_after_mul_y12__0_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \after_mul_y12__0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \after_mul_y12__0_carry__0_i_1_n_0\,
      O(3 downto 2) => \NLW_after_mul_y12__0_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \after_mul_y12__0_carry__0_n_6\,
      O(0) => \after_mul_y12__0_carry__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \after_mul_y12__0_carry__0_i_2_n_0\,
      S(0) => \after_mul_y12__0_carry__0_i_3_n_0\
    );
\after_mul_y12__0_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => after_s(2),
      I1 => after_y(1),
      I2 => \^after_s_reg[1]_0\(1),
      I3 => after_y(2),
      I4 => \^after_s_reg[1]_0\(0),
      I5 => after_y(3),
      O => \after_mul_y12__0_carry__0_i_1_n_0\
    );
\after_mul_y12__0_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EA808080157F7F7F"
    )
        port map (
      I0 => \after_mul_y12__0_carry__0_i_4_n_0\,
      I1 => after_y(3),
      I2 => \^after_s_reg[1]_0\(1),
      I3 => after_y(2),
      I4 => after_s(2),
      I5 => \after_mul_y12__0_carry__0_i_5_n_0\,
      O => \after_mul_y12__0_carry__0_i_2_n_0\
    );
\after_mul_y12__0_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6999966696669666"
    )
        port map (
      I0 => \after_mul_y12__0_carry__0_i_1_n_0\,
      I1 => \after_mul_y12__0_carry__0_i_6_n_0\,
      I2 => \^after_s_reg[1]_0\(1),
      I3 => after_y(3),
      I4 => \^after_s_reg[1]_0\(0),
      I5 => after_y(4),
      O => \after_mul_y12__0_carry__0_i_3_n_0\
    );
\after_mul_y12__0_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^after_s_reg[1]_0\(0),
      I1 => after_y(4),
      O => \after_mul_y12__0_carry__0_i_4_n_0\
    );
\after_mul_y12__0_carry__0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7888877787778777"
    )
        port map (
      I0 => after_y(5),
      I1 => \^after_s_reg[1]_0\(0),
      I2 => after_y(4),
      I3 => \^after_s_reg[1]_0\(1),
      I4 => after_y(3),
      I5 => after_s(2),
      O => \after_mul_y12__0_carry__0_i_5_n_0\
    );
\after_mul_y12__0_carry__0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => after_y(2),
      I1 => after_s(2),
      O => \after_mul_y12__0_carry__0_i_6_n_0\
    );
\after_mul_y12__0_carry_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => after_y(3),
      I1 => \^after_s_reg[1]_0\(0),
      I2 => after_y(2),
      I3 => \^after_s_reg[1]_0\(1),
      I4 => after_y(1),
      I5 => after_s(2),
      O => \after_mul_y12__0_carry_i_1_n_0\
    );
\after_mul_y12__0_carry_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => \^after_s_reg[1]_0\(1),
      I1 => after_y(1),
      I2 => after_s(2),
      I3 => after_y(0),
      O => \after_mul_y12__0_carry_i_2_n_0\
    );
\after_mul_y12__0_carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => after_y(0),
      I1 => \^after_s_reg[1]_0\(1),
      O => \after_mul_y12__0_carry_i_3_n_0\
    );
\after_mul_y12__0_carry_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A953F3F6A6AC0C0"
    )
        port map (
      I0 => after_y(2),
      I1 => \^after_s_reg[1]_0\(0),
      I2 => after_y(3),
      I3 => after_y(0),
      I4 => \^after_s_reg[1]_0\(1),
      I5 => \after_mul_y12__0_carry_i_8_n_0\,
      O => \after_mul_y12__0_carry_i_4_n_0\
    );
\after_mul_y12__0_carry_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => after_y(0),
      I1 => after_s(2),
      I2 => after_y(1),
      I3 => \^after_s_reg[1]_0\(1),
      I4 => after_y(2),
      I5 => \^after_s_reg[1]_0\(0),
      O => \after_mul_y12__0_carry_i_5_n_0\
    );
\after_mul_y12__0_carry_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => after_y(1),
      I1 => \^after_s_reg[1]_0\(0),
      I2 => \^after_s_reg[1]_0\(1),
      I3 => after_y(0),
      O => \after_mul_y12__0_carry_i_6_n_0\
    );
\after_mul_y12__0_carry_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^after_s_reg[1]_0\(0),
      I1 => after_y(0),
      O => \after_mul_y12__0_carry_i_7_n_0\
    );
\after_mul_y12__0_carry_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => after_y(1),
      I1 => after_s(2),
      O => \after_mul_y12__0_carry_i_8_n_0\
    );
\after_mul_y12__15_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \NLW_after_mul_y12__15_carry_CO_UNCONNECTED\(3),
      CO(2) => \after_mul_y12__15_carry_n_1\,
      CO(1) => \after_mul_y12__15_carry_n_2\,
      CO(0) => \after_mul_y12__15_carry_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \after_mul_y12__15_carry_i_1_n_0\,
      DI(1) => \after_mul_y12__0_carry_n_4\,
      DI(0) => '0',
      O(3 downto 0) => after_mul_y(5 downto 2),
      S(3) => \after_mul_y12__15_carry_i_2_n_0\,
      S(2) => \after_mul_y12__15_carry_i_3_n_0\,
      S(1) => \after_mul_y12__15_carry_i_4_n_0\,
      S(0) => \after_mul_y12__0_carry_n_5\
    );
\after_mul_y12__15_carry_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \after_mul_y12__0_carry__0_n_7\,
      I1 => after_s(4),
      I2 => after_y(0),
      O => \after_mul_y12__15_carry_i_1_n_0\
    );
\after_mul_y12__15_carry_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996699669"
    )
        port map (
      I0 => \after_mul_y12__15_carry_i_5_n_0\,
      I1 => \after_mul_y12__0_carry__0_n_6\,
      I2 => \after_mul_y12__15_carry_i_6_n_0\,
      I3 => \after_mul_y12__15_carry_i_7_n_0\,
      I4 => \after_mul_y12__0_carry__0_n_7\,
      I5 => \after_mul_y12__15_carry_i_8_n_0\,
      O => \after_mul_y12__15_carry_i_2_n_0\
    );
\after_mul_y12__15_carry_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"87787878"
    )
        port map (
      I0 => after_y(0),
      I1 => after_s(4),
      I2 => \after_mul_y12__0_carry__0_n_7\,
      I3 => after_s(3),
      I4 => after_y(1),
      O => \after_mul_y12__15_carry_i_3_n_0\
    );
\after_mul_y12__15_carry_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \after_mul_y12__0_carry_n_4\,
      I1 => after_s(3),
      I2 => after_y(0),
      O => \after_mul_y12__15_carry_i_4_n_0\
    );
\after_mul_y12__15_carry_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => after_y(1),
      I1 => after_s(4),
      O => \after_mul_y12__15_carry_i_5_n_0\
    );
\after_mul_y12__15_carry_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => after_y(0),
      I1 => after_s(5),
      O => \after_mul_y12__15_carry_i_6_n_0\
    );
\after_mul_y12__15_carry_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => after_y(2),
      I1 => after_s(3),
      O => \after_mul_y12__15_carry_i_7_n_0\
    );
\after_mul_y12__15_carry_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => after_y(0),
      I1 => after_s(4),
      O => \after_mul_y12__15_carry_i_8_n_0\
    );
\after_s[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8B88B888"
    )
        port map (
      I0 => A_IBUF(0),
      I1 => SS(0),
      I2 => after_s(2),
      I3 => \^after_s_reg[1]_0\(0),
      I4 => \^after_s_reg[1]_0\(1),
      O => \B__0\(3)
    );
\after_s[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5A22"
    )
        port map (
      I0 => after_s(2),
      I1 => \^after_s_reg[1]_0\(1),
      I2 => after_s(3),
      I3 => \^after_s_reg[1]_0\(0),
      O => \after_s_reg[2]_0\
    );
\after_s[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44787888"
    )
        port map (
      I0 => after_s(4),
      I1 => \^after_s_reg[1]_0\(0),
      I2 => \^after_s_reg[1]_0\(1),
      I3 => after_s(3),
      I4 => after_s(2),
      O => \after_s_reg[4]_0\
    );
\after_s_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => \after_s_reg[5]_0\(0),
      Q => \^after_s_reg[1]_0\(0),
      R => '0'
    );
\after_s_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => \after_s_reg[5]_0\(1),
      Q => \^after_s_reg[1]_0\(1),
      R => '0'
    );
\after_s_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => \after_s_reg[5]_0\(2),
      Q => after_s(2),
      R => '0'
    );
\after_s_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => \B__0\(3),
      Q => after_s(3),
      R => '0'
    );
\after_s_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => \after_s_reg[5]_0\(3),
      Q => after_s(4),
      R => '0'
    );
\after_s_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => \after_s_reg[5]_0\(4),
      Q => after_s(5),
      R => '0'
    );
\after_y_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \after_y_reg[5]_0\(0),
      D => after_mul_y(0),
      Q => after_y(0),
      S => SS(0)
    );
\after_y_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \after_y_reg[5]_0\(0),
      D => after_mul_y(1),
      Q => after_y(1),
      R => SS(0)
    );
\after_y_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \after_y_reg[5]_0\(0),
      D => after_mul_y(2),
      Q => after_y(2),
      R => SS(0)
    );
\after_y_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \after_y_reg[5]_0\(0),
      D => after_mul_y(3),
      Q => after_y(3),
      R => SS(0)
    );
\after_y_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \after_y_reg[5]_0\(0),
      D => after_mul_y(4),
      Q => after_y(4),
      R => SS(0)
    );
\after_y_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \after_y_reg[5]_0\(0),
      D => after_mul_y(5),
      Q => after_y(5),
      R => SS(0)
    );
\counter_s[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A52A"
    )
        port map (
      I0 => counter_s(0),
      I1 => start_IBUF,
      I2 => Q(0),
      I3 => Q(1),
      O => \counter_s[0]_i_1_n_0\
    );
\counter_s[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA660AAA"
    )
        port map (
      I0 => counter_s(1),
      I1 => counter_s(0),
      I2 => start_IBUF,
      I3 => Q(0),
      I4 => Q(1),
      O => \counter_s[1]_i_1_n_0\
    );
\counter_s_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \counter_s[0]_i_1_n_0\,
      Q => counter_s(0),
      R => '0'
    );
\counter_s_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \counter_s[1]_i_1_n_0\,
      Q => counter_s(1),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Lab1 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 5 downto 0 );
    B : in STD_LOGIC_VECTOR ( 2 downto 0 );
    start : in STD_LOGIC;
    Mode : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR ( 5 downto 0 );
    Z : out STD_LOGIC;
    done : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Lab1 : entity is true;
end Lab1;

architecture STRUCTURE of Lab1 is
  signal A_IBUF : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal B_IBUF : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \B__0\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal Mode_IBUF : STD_LOGIC;
  signal U0_n_10 : STD_LOGIC;
  signal U0_n_3 : STD_LOGIC;
  signal U2_n_4 : STD_LOGIC;
  signal U2_n_5 : STD_LOGIC;
  signal Y_OBUF : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal Z_OBUF : STD_LOGIC;
  signal Z_OBUF_inst_i_2_n_0 : STD_LOGIC;
  signal Z_OBUF_inst_i_3_n_0 : STD_LOGIC;
  signal Z_OBUF_inst_i_4_n_0 : STD_LOGIC;
  signal Z_OBUF_inst_i_7_n_0 : STD_LOGIC;
  signal Z_OBUF_inst_i_8_n_0 : STD_LOGIC;
  signal after_s : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal div13_s : STD_LOGIC;
  signal done_OBUF : STD_LOGIC;
  signal hep_s : STD_LOGIC;
  signal hex_s : STD_LOGIC;
  signal init_s : STD_LOGIC;
  signal ld_ys : STD_LOGIC;
  signal lsb_s : STD_LOGIC;
  signal n_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 1 to 1 );
  signal p_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal pent_s : STD_LOGIC;
  signal prime_s : STD_LOGIC;
  signal rst_IBUF : STD_LOGIC;
  signal square_s : STD_LOGIC;
  signal start_IBUF : STD_LOGIC;
  signal tri_s : STD_LOGIC;
begin
\A_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(0),
      O => A_IBUF(0)
    );
\A_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(1),
      O => A_IBUF(1)
    );
\A_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(2),
      O => A_IBUF(2)
    );
\A_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(3),
      O => A_IBUF(3)
    );
\A_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(4),
      O => A_IBUF(4)
    );
\A_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(5),
      O => A_IBUF(5)
    );
\B_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => B(0),
      O => B_IBUF(0)
    );
\B_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => B(1),
      O => B_IBUF(1)
    );
\B_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => B(2),
      O => B_IBUF(2)
    );
Mode_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => Mode,
      O => Mode_IBUF
    );
U0: entity work.DP
     port map (
      A_IBUF(0) => A_IBUF(3),
      CLK => clk_IBUF_BUFG,
      D(0) => n_state(0),
      E(0) => n_state(1),
      Mode_IBUF => Mode_IBUF,
      \PISO_reg[2]_0\(0) => p_0_in(1),
      \PISO_reg[2]_1\(1) => U2_n_4,
      \PISO_reg[2]_1\(0) => U2_n_5,
      Q(1 downto 0) => p_state(1 downto 0),
      SS(0) => init_s,
      Y_OBUF(5 downto 0) => Y_OBUF(5 downto 0),
      \after_s_reg[1]_0\(1 downto 0) => after_s(1 downto 0),
      \after_s_reg[2]_0\ => U0_n_10,
      \after_s_reg[4]_0\ => U0_n_3,
      \after_s_reg[5]_0\(4 downto 3) => \B__0\(5 downto 4),
      \after_s_reg[5]_0\(2 downto 0) => \B__0\(2 downto 0),
      \after_y_reg[5]_0\(0) => ld_ys,
      lsb_s => lsb_s,
      start_IBUF => start_IBUF
    );
U2: entity work.CU
     port map (
      AR(0) => rst_IBUF,
      A_IBUF(4 downto 3) => A_IBUF(5 downto 4),
      A_IBUF(2 downto 0) => A_IBUF(2 downto 0),
      B_IBUF(1 downto 0) => B_IBUF(2 downto 1),
      CLK => clk_IBUF_BUFG,
      D(0) => n_state(1),
      \FSM_sequential_p_state_reg[0]_0\(1) => U2_n_4,
      \FSM_sequential_p_state_reg[0]_0\(0) => U2_n_5,
      \FSM_sequential_p_state_reg[0]_1\(0) => n_state(0),
      \FSM_sequential_p_state_reg[1]_0\(0) => ld_ys,
      \FSM_sequential_p_state_reg[1]_1\(4 downto 3) => \B__0\(5 downto 4),
      \FSM_sequential_p_state_reg[1]_1\(2 downto 0) => \B__0\(2 downto 0),
      Mode_IBUF => Mode_IBUF,
      \PISO_reg[1]\(0) => p_0_in(1),
      Q(1 downto 0) => p_state(1 downto 0),
      SS(0) => init_s,
      \after_s_reg[2]\(1 downto 0) => after_s(1 downto 0),
      \after_s_reg[4]\ => U0_n_10,
      \after_s_reg[5]\ => U0_n_3,
      done_OBUF => done_OBUF,
      lsb_s => lsb_s,
      start_IBUF => start_IBUF
    );
\Y_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Y_OBUF(0),
      O => Y(0)
    );
\Y_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Y_OBUF(1),
      O => Y(1)
    );
\Y_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Y_OBUF(2),
      O => Y(2)
    );
\Y_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Y_OBUF(3),
      O => Y(3)
    );
\Y_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Y_OBUF(4),
      O => Y(4)
    );
\Y_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Y_OBUF(5),
      O => Y(5)
    );
Z_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => Z_OBUF,
      O => Z
    );
Z_OBUF_inst_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => Z_OBUF_inst_i_2_n_0,
      I1 => B_IBUF(1),
      I2 => Z_OBUF_inst_i_3_n_0,
      I3 => B_IBUF(2),
      I4 => Z_OBUF_inst_i_4_n_0,
      I5 => Mode_IBUF,
      O => Z_OBUF
    );
Z_OBUF_inst_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000001C101000000"
    )
        port map (
      I0 => A_IBUF(4),
      I1 => A_IBUF(5),
      I2 => A_IBUF(1),
      I3 => A_IBUF(2),
      I4 => A_IBUF(3),
      I5 => A_IBUF(0),
      O => pent_s
    );
Z_OBUF_inst_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0008000009400082"
    )
        port map (
      I0 => A_IBUF(0),
      I1 => A_IBUF(3),
      I2 => A_IBUF(4),
      I3 => A_IBUF(1),
      I4 => A_IBUF(2),
      I5 => A_IBUF(5),
      O => hex_s
    );
Z_OBUF_inst_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010801000001082"
    )
        port map (
      I0 => A_IBUF(0),
      I1 => A_IBUF(2),
      I2 => A_IBUF(1),
      I3 => A_IBUF(5),
      I4 => A_IBUF(3),
      I5 => A_IBUF(4),
      O => hep_s
    );
Z_OBUF_inst_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001FFFF00010000"
    )
        port map (
      I0 => A_IBUF(0),
      I1 => A_IBUF(3),
      I2 => A_IBUF(2),
      I3 => A_IBUF(1),
      I4 => B_IBUF(0),
      I5 => prime_s,
      O => Z_OBUF_inst_i_2_n_0
    );
Z_OBUF_inst_i_3: unisim.vcomponents.MUXF7
     port map (
      I0 => div13_s,
      I1 => tri_s,
      O => Z_OBUF_inst_i_3_n_0,
      S => B_IBUF(0)
    );
Z_OBUF_inst_i_4: unisim.vcomponents.MUXF8
     port map (
      I0 => Z_OBUF_inst_i_7_n_0,
      I1 => Z_OBUF_inst_i_8_n_0,
      O => Z_OBUF_inst_i_4_n_0,
      S => B_IBUF(1)
    );
Z_OBUF_inst_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000002004001"
    )
        port map (
      I0 => A_IBUF(3),
      I1 => A_IBUF(2),
      I2 => A_IBUF(5),
      I3 => A_IBUF(4),
      I4 => A_IBUF(1),
      I5 => A_IBUF(0),
      O => div13_s
    );
Z_OBUF_inst_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080044040048231"
    )
        port map (
      I0 => A_IBUF(1),
      I1 => A_IBUF(2),
      I2 => A_IBUF(0),
      I3 => A_IBUF(3),
      I4 => A_IBUF(5),
      I5 => A_IBUF(4),
      O => tri_s
    );
Z_OBUF_inst_i_7: unisim.vcomponents.MUXF7
     port map (
      I0 => square_s,
      I1 => pent_s,
      O => Z_OBUF_inst_i_7_n_0,
      S => B_IBUF(0)
    );
Z_OBUF_inst_i_8: unisim.vcomponents.MUXF7
     port map (
      I0 => hex_s,
      I1 => hep_s,
      O => Z_OBUF_inst_i_8_n_0,
      S => B_IBUF(0)
    );
Z_OBUF_inst_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000C1815"
    )
        port map (
      I0 => A_IBUF(4),
      I1 => A_IBUF(0),
      I2 => A_IBUF(2),
      I3 => A_IBUF(5),
      I4 => A_IBUF(3),
      I5 => A_IBUF(1),
      O => square_s
    );
clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_IBUF,
      O => clk_IBUF_BUFG
    );
clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk,
      O => clk_IBUF
    );
done_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => done_OBUF,
      O => done
    );
g0_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"28208A20A08A288C"
    )
        port map (
      I0 => A_IBUF(0),
      I1 => A_IBUF(1),
      I2 => A_IBUF(2),
      I3 => A_IBUF(3),
      I4 => A_IBUF(4),
      I5 => A_IBUF(5),
      O => prime_s
    );
rst_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => rst,
      O => rst_IBUF
    );
start_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => start,
      O => start_IBUF
    );
end STRUCTURE;
