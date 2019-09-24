library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity toplevel1_1 is
    Port ( 
           led : out STD_LOGIC_VECTOR (3 downto 0);
           btn : in STD_LOGIC_VECTOR (1 downto 0);
           led4_r : out std_logic;
           led4_g : out std_logic;
           led4_b : out std_logic
         );     
end toplevel1_1;

architecture behv1 of toplevel1_1 is
-- group of RGB led signals
    signal RGB_Led_4: std_logic_vector(0 to 2); -- order R, G, B ,
    

begin
 -- Some "housekeeping" first
   -- map signal "RGB_Led_4" to actual output ports
   
   led4_r <= RGB_Led_4(2);
   led4_g <= RGB_Led_4(1);
   led4_b <= RGB_Led_4(0);
   
   
   -- taking input from small led, and changng rgb led based on it
   -- Control of RGB LED 4

   with btn(1 downto 0) select
       RGB_Led_4 <=    "001" when "01", --red
                       "010" when "10", --green
                       "100" when "11", --blue
                       "000" when others; --off
                       
-- Control of small led's
      with btn(1 downto 0) select
      led(3 downto 0) <= "1000" when "11",
                         "0100" when "10",
                         "0010" when "01",
                         "0001" when others;
  end behv1;
  


     
        





           
  