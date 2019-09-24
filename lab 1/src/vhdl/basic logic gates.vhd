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
    signal SW1 : std_logic_vector (0 to 0); -- sw1[0]? must be a better way

begin
 -- Some "housekeeping" first
 
 -- map sw1 to actual port
       SW1 <= sw(1 downto 1);
 -- map signal "RGB_Led_4" to actual output ports
       
       led4_r <= RGB_Led_4(2);
       led4_g <= RGB_Led_4(1);
       led4_b <= RGB_Led_4(0);
   
   
  -- map signal "RGB_Led_5" to actual output ports
      
      led5_r <= RGB_Led_5(2);
      led5_g <= RGB_Led_5(1);
      led5_b <= RGB_Led_5(0);
      
  -- map signal "SMALL_LED_GROUP" to the actual output ports of small led's.
    -- LAB 1.3 CONDITION , I used 2 signals
    led <= SMALL_LED_GROUP0 when SW1 = "0" else SMALL_LED_GROUP1;
     
  
   
   
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
-- with sw(1 downto 0) select
-- RGB_Led_5 <= "111" when "10", -- white
--              "111" when "11", -- white
--              "000" when "00", -- off
--          RGB_Led_4 when others; -- same as rgb_led_4
   
   with sw(1 downto 0) select
  RGB_Led_5 <= "111" when "10", -- white
               "111" when "11", -- white
               "000" when "00", -- off
               RGB_Led_4 when others; -- same as rgb_led_4
               
  
  
-- when sw1 is 1 
-- change small led group

--when sw1 is 0 
-- keep small led group controlled by buttons
                   
                       
-- Control of small led's
     --  process(SW1)
    --   begin
      --  if SW1 = "0" then
        
      with btn(1 downto 0) select
     SMALL_LED_GROUP0 <= "1000" when "11",
                         "0100" when "10",
                         "0010" when "01",
                         "0001" when others;
   
   -- FOR 1.3 WITH SWITCH 1 ON - LOGIC GATE SYNTAX
      SMALL_LED_GROUP1(0) <= btn(1) nand btn(0);
      SMALL_LED_GROUP1(1) <= btn(1) or btn(0);
      SMALL_LED_GROUP1(2) <= btn(1) xor btn(0);
      SMALL_LED_GROUP1(3) <= btn(1) and btn(0);

          
                         
--    with btn(1 downto 0) select
--      SMALL_LED_GROUP1 <= "1000" when "00",
--                          "1110" when "01",
--                          "1110" when "10",
--                          "0101" when "11";  
       

      
      
      
     --   end if;
    --    end process;
  end behv1;
  
  
  
  
  
  
  
  -- tip:
  -- set signal
  -- signal_name <= expression_1 when condition_1 else expression_2;
  -- X <= A when (sw = '1') else B;
  
  