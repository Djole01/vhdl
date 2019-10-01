library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity toplevel1_3 is
    Port ( 
           led : out STD_LOGIC_VECTOR (3 downto 0);
           btn : in STD_LOGIC_VECTOR (1 downto 0);
           led4_r : out std_logic;
           led4_g : out std_logic;
           led4_b : out std_logic;
           sw : in STD_LOGIC_VECTOR (1 downto 0);
           led5_r : out std_logic;
           led5_g : out std_logic;
           led5_b : out std_logic
         );     
         
         
end toplevel1_3;

architecture behv1 of toplevel1_3 is
-- group of RGB led signals
    signal RGB_Led_4: std_logic_vector(0 to 2); -- order R, G, B ,
    signal RGB_Led_5: std_logic_vector(0 to 2); -- order R, G, B ,
    signal SMALL_LED_GROUP0: std_logic_vector (0 to 3); --order led3,led2,led1,led0
    signal SMALL_LED_GROUP1: std_logic_vector (0 to 3); --order led3,led2,led1,led0
    signal SW1 : std_logic_vector (0 to 0); -- sw1[0]? must be a better way, didn't know correct syntax

begin
 -- Some "housekeeping" first
 -- map sw1 to actual port
       SW1 <= sw(1 downto 1); -- wasn't sure of the correct syntax
 -- map signal "RGB_Led_4" to actual output ports    
     led4_r <= RGB_Led_4(2);
     led4_g <= RGB_Led_4(1);
     led4_b <= RGB_Led_4(0);
  -- map signal "RGB_Led_5" to actual output ports
    led5_r <= RGB_Led_5(2);
     led5_g <= RGB_Led_5(1);
     led5_b <= RGB_Led_5(0);
  -- map signal "SMALL_LED_GROUP" to the actual output ports of small led's.
    
-- lab 2
-- control of small led's with a process
red_led_ctrl_p: process( btn(1), btn(0), sw(1) )
    begin

        if sw(1) = '0' then
            case btn(1 downto 0) is
                when "00" =>
                    led <=  "0001";
                when "01" =>
                    led <=  "0010";
                when "10" =>
                    led <=  "0100";
                when others =>
                    led <=  "0100";
            end case;
        else
            led(0) <= btn(0) and btn(1);
            led(1) <= btn(0) xor btn(1);
            led(2) <= btn(0) or btn(1);
            led(3) <= btn(0) nand btn(1);
        end if; -- sw(1)
    
    end process red_led_ctrl_p;






       -- lab 2 control of rgb led 4 with a system clock
    
 rgb4_ctrl_p: process(sysclk, n_Reset)
 begin
	if n_Reset = '0' then
		RGB_Led_4 <= (others => '0');
	elsif sysclk'event and sysclk = '1' then
 	     case btn(1 downto 0) is
		when "00" =>
			RGB_Led_4 <=  "000"; --off
		when "01" =>
			RGB_Led_4 <=  "001"; --red
		when "10" =>
			RGB_Led_4 <=  "010"; --green
		when others =>
			RGB_Led_4 <=  "100"; --blue
  	    end case;  
	end if; --clk/rst           
end process rgb4_ctrl_p;
   





            -- same as before
            with sw(1 downto 0) select
            RGB_Led_5 <= "111" when "10", -- white
                         "111" when "11", -- white
                         "000" when "00", -- off
                     RGB_Led_4 when others; -- same as rgb_led_4
               
  
  

  end behv1;
  
  
  
  
  

  
