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
    signal SMALL_LED_GROUP: std_logic_vector (0 to 3); --order led3,led2,led1,led0
    

begin
 -- Some "housekeeping" first
 -- map signal "RGB_Led_4" to actual output ports
       
       led4_r <= RGB_Led_4(2);
       led4_g <= RGB_Led_4(1);
       led4_b <= RGB_Led_4(0);
   
   
  -- map signal "RGB_Led_5" to actual output ports
      
      led5_r <= RGB_Led_5(2);
      led5_g <= RGB_Led_5(1);
      led5_b <= RGB_Led_5(0);
      
  -- map signal "SMALL_LED_GROUP" to the actual output ports of small led's.
     led <= SMALL_LED_GROUP;
   
   
   -- taking input from buttons, and changng rgb led based on it
   -- Control of RGB LED 4

   with btn(1 downto 0) select
       RGB_Led_4 <=    "001" when "01", --red
                       "010" when "10", --green
                       "100" when "11", --blue
                       "000" when others; --off
  
  
  -- implemented a switch into the design, for controlling rgb led 5.
 -- master switch (output mux)
 
-- look up table, with implemented signal as input as well, makes sense and saves space compared to writing another table there.
  with sw(1 downto 0) select
  RGB_Led_5 <= "111" when "10", -- white
               "111" when "11", -- white
               "000" when "00", -- off
               RGB_Led_4 when others; -- same as rgb_led_4
               
  
  

                   
                       
-- Control of small led's
       with btn(1 downto 0) select
      SMALL_LED_GROUP <= "1000" when "11",
                         "0100" when "10",
                         "0010" when "01",
                         "0001" when others;
  end behv1;
  
  
  
  
  
  
  
  -- tip:
  -- set signal
  -- signal_name <= expression_1 when condition_1 else expression_2;
  -- X <= A when (sw = '1') else B;
  
  