library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity toplevel is
    Port ( 
           led : out STD_LOGIC_VECTOR (3 downto 0);
           btn : in STD_LOGIC_VECTOR (1 downto 0);
           led4_r : out std_logic;
           led4_g : out std_logic;
           led4_b : out std_logic
         );     
end toplevel;

architecture behv1 of toplevel is
-- group of RGB led signals
    signal RGB_Led_4: std_logic_vector(0 to 2); -- order R, G, B ,

    -- turn on small led's, by pressing buttons. 
    

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
       led(3 downto 3) <= "1" when "11",  --on 
             "0" when others; -- off
        with btn(1 downto 0) select
        led(2 downto 2) <= "1" when "10",  --on 
                         "0" when others; -- off
        with btn(1 downto 0) select
        led(1 downto 1) <= "1" when "01",  --on 
        "0" when others; -- off
        
         with btn(1 downto 0) select
              led(0 downto 0) <= "1" when "00",  --on 
                    "0" when others; -- off
  end behv1;
  


     
        





           
  