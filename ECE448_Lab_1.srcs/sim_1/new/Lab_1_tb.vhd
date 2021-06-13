library IEEE;
library std;

use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use std.textio.all;
use std.env.finish;

entity Lab_1_tb is
end Lab_1_tb;

architecture Behavioral of Lab_1_tb is
--    component ALU
--        Port ( rst : in STD_LOGIC;                          --  R
--               clk : in STD_LOGIC;                          --  C
--               MODE : in STD_LOGIC;                         --  M
--               Start : in STD_LOGIC;                        --  S
--               A : in STD_LOGIC_VECTOR (5 downto 0);        --  AA
--               B : in STD_LOGIC_VECTOR (2 downto 0);        --  B
--               Y : out STD_LOGIC_VECTOR (5 downto 0);       --  YY
--               Z : out STD_LOGIC;                           --  Z
--               DONE : out STD_LOGIC);                       --  D
--    end component;

    --  Constants    
    constant DUV_DELAY: time := 5ns;
    constant TEST_INTERVAL: time := 10ns;
    constant reset_width: time := 100ns;
    constant clk_period: time := 20ns;
    

    --  Signals
--    signal input_status: std_logic_vector(3 downto 0);      -- hex      4-bit bus
--    signal input_vector: std_logic_vector(8 downto 0);      -- octal    9-bit bus
--    signal y_tb: std_logic_vector(5 downto 0);     -- octal    6-bit bus
--    signal output_status: std_logic_vector(1 downto 0);     -- bin      2-bit bus
    
    signal rst_tb : STD_LOGIC := '0';                   
    signal clk_tb : STD_LOGIC := '0';                      
    signal mode_tb : STD_LOGIC := '0';                       
    signal start_tb : STD_LOGIC := '0';                     
    signal a_tb : STD_LOGIC_VECTOR (5 downto 0) := o"00";      
    signal b_tb : STD_LOGIC_VECTOR (2 downto 0) := o"0";     
    signal y_tb : STD_LOGIC_VECTOR (5 downto 0) := o"00";
    signal expected_y : STD_LOGIC_VECTOR (5 downto 0) := o"00";     
    signal z_tb :  STD_LOGIC := '0';                         
    signal done_tb : STD_LOGIC := '0';
    signal flag_tb : STD_LOGIC := '0';
    signal error_tb : integer := 0;
    signal var_tb : integer := 1;                     
--    signal val_tb : STD_LOGIC_VECTOR (5 downto 0) := o"00";
    
--    type test_data_type is record
--        input_status: std_logic_vector(3 downto 0);
--        input_vector: std_logic_vector(8 downto 0);
--        y_tb: std_logic_vector(5 downto 0);
--        output_status: std_logic_vector(1 downto 0);
--    end record;
    

    --  (b"RCMS", o"AAB", o"YY", b"ZD"), -- Pattern
    --     (x"0", o"2", o "2", "00"),
    
    type List is array(natural range<>) of std_logic_vector(5 downto 0);
    constant Prime_List: List :=        (o"02", o"03", o"05", o"07", o"13", o"15", o"21", o"23", o"27", o"35", o"37", o"45", o"51", o"53", o"57", o"65", o"73", o"75");
    constant Div8_List: List :=         (o"00", o"10", o"20", o"30", o"40", o"50", o"60", o"70", o"70", o"70", o"70", o"70", o"70", o"70", o"70", o"70", o"70", o"70");
    constant Div13_List: List :=        (o"00", o"15", o"32", o"47", o"64", o"64", o"64", o"64", o"64", o"64", o"64", o"64", o"64", o"64", o"64", o"64", o"64", o"64");
    constant Triangle_List: List :=     (o"00", o"01", o"03", o"06", o"12", o"17", o"25", o"34", o"44", o"55", o"67", o"67", o"67", o"67", o"67", o"67", o"67", o"67");
    constant Square_List: List :=       (o"00", o"01", o"04", o"11", o"20", o"31", o"44", o"61", o"61", o"61", o"61", o"61", o"61", o"61", o"61", o"61", o"61", o"61");
    constant Pentagonal_List: List :=   (o"01", o"05", o"14", o"26", o"43", o"63", o"63", o"63", o"63", o"63", o"63", o"63", o"63", o"63", o"63", o"63", o"63", o"63");
    constant Hexagonal_List: List :=    (o"01", o"06", o"17", o"34", o"55", o"55", o"55", o"55", o"55", o"55", o"55", o"55", o"55", o"55", o"55", o"55", o"55", o"55");
    constant Heptagonal_List: List :=   (o"01", o"07", o"22", o"42", o"67", o"67", o"67", o"67", o"67", o"67", o"67", o"67", o"67", o"67", o"67", o"67", o"67", o"67");
    type List_of_Lists is array(natural range<>) of List(17 downto 0);
    constant Lists:List_of_Lists:=(Prime_List,Div8_List,Div13_List,Triangle_List,Square_List,Pentagonal_List,Hexagonal_List,Heptagonal_List);


begin
    dut: entity work.Lab1 port map (
        rst =>          rst_tb,
        clk =>          clk_tb,
        MODE =>         mode_tb,
        Start =>        start_tb,
        A =>            a_tb, 
        B =>            b_tb, 
        Y =>            y_tb, 
        Z =>            z_tb,
        DONE =>         done_tb);
        
    clk_generator: PROCESS
    begin
        clk_tb <= '1';
        wait for clk_period/2;
        clk_tb <= '0';
        wait for clk_period/2;
	END PROCESS;
	
    stim_ALU: PROCESS
    variable debug_line: line;
    procedure period is
    begin
        wait for clk_period;
    end procedure;
    procedure jiffy is
    begin
        wait for 1ps;
    end procedure;
    procedure reset is
    begin
        rst_tb <= '1';
        flag_tb <= '0';
        period;
        start_tb <= '0';
        rst_tb <= '0';
--        var_tb <= 1;
--        flag_tb <= '0';
        period;
    end procedure;
    procedure setFlag(constant chkList:List) is 
    begin
        for i in chkList'range loop
            if a_tb = chkList(i) then
                flag_tb <= '1';
--                val_tb <= a_tb;
            end if;
        end loop;
    end procedure;
    procedure chkFlag is
    begin
        if z_tb /= flag_tb then
            write(debug_line, string'("COM - ERROR: a_tb:"));  
            write(debug_line, a_tb);
            write(debug_line, string'(", b_tb:"));
            write(debug_line, b_tb);
            write(debug_line, string'(", z_tb:"));
            write(debug_line, z_tb);
            write(debug_line, string'(", expected z:"));
            write(debug_line, flag_tb);
            writeline(output, debug_line);
            error_tb <= error_tb + 1;
--        else        -- Check All Outputs
--            write(debug_line, string'("CHECK: a_tb:"));
--            write(debug_line, a_tb);
--            write(debug_line, string'(", b_tb:"));
--            write(debug_line, b_tb);
--            write(debug_line, string'(", z_tb:"));
--            write(debug_line, z_tb);                
--            writeline(output, debug_line);
        end if;
    end procedure;
    procedure setMod is
    begin
    if (b_tb = o"0") then
        expected_y <= o"01";
--    elsif (b_tb = o"1") then
--        expected_y <= a_tb;
    else
        var_tb <= 1;
        jiffy;
        for k in 0 to (to_integer(unsigned(b_tb))-1) loop
            var_tb <= var_tb * to_integer(unsigned(a_tb));
            jiffy;
        end loop;
        expected_y <= std_logic_vector(to_unsigned(var_tb mod 64, 6));

--        for k in 0 to (to_integer(unsigned(b_tb))) loop
--            expected_y <= std_logic_vector((to_unsigned(to_integer(unsigned(expected_y))* to_integer(unsigned(a_tb)) mod 64, 6)));
--        end loop;
            
    end if;
    end procedure;
    procedure chkMod is
    begin
        if (y_tb /= expected_y) then
            write(debug_line, string'("SEQ - ERROR: a_tb:"));  
            write(debug_line, a_tb);
            write(debug_line, string'(", b_tb:"));
            write(debug_line, b_tb);
            write(debug_line, string'(", y_tb:"));
            write(debug_line, y_tb);
            write(debug_line, string'(", expected y:"));
            write(debug_line, expected_y);
            writeline(output, debug_line);
            error_tb <= error_tb + 1;
        end if;   
    end procedure;

    
	begin		
        mode_tb  <= '0';
		for j in 0 to 7 loop
            for i in 0 to 63 loop
                setFlag(Lists(j));
                period;
                chkFlag;
                period;
                a_tb <= std_logic_vector(to_unsigned(i, a_tb'length));
                b_tb <= std_logic_vector(to_unsigned(j, b_tb'length));
                reset;
            end loop;
        end loop;
        
        period;
        mode_tb  <= '1';
		for j in 0 to 7 loop
            for i in 0 to 63 loop            
                a_tb <= std_logic_vector(to_unsigned(i, a_tb'length));
                b_tb <= std_logic_vector(to_unsigned(j, b_tb'length));
                period;
                setMod;
                period;
                start_tb <= '1';
                while done_tb /= '1' loop
                    period;
                end loop;
                chkMod;
                while done_tb /= '0' loop
                    reset;
                end loop;
            end loop;
        end loop;
        write(debug_line, string'("Total Error Count: "));
        write(debug_line, error_tb);
        writeline(output, debug_line);
        
        report "Calling 'finish'";
        finish;
    END PROCESS;
end Behavioral;
