library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity toplevel is
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
         
         
end toplevel;

architecture behv1 of toplevel is
-- group of RGB led signals
    signal RGB_Led_4: std_logic_vector(0 to 2); -- order R, G, B ,
    signal RGB_Led_5: std_logic_vector(0 to 2); -- order R, G, B ,
    

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
   
   
   -- taking input from buttons, and changng rgb led based on it
   -- Control of RGB LED 4

   with btn(1 downto 0) select
       RGB_Led_4 <=    "001" when "01", --red
                       "010" when "10", --green
                       "100" when "11", --blue
                       "000" when others; --off
  
  
  -- implemented a switch into the design, for controlling rgb led 5.
 -- master switch (output mux?)
  with sw(1 downto 0) select
  RGB_Led_5 <= "111" when "10", -- white
               "111" when "11", -- white
               "000" when "00", -- off
               RGB_Led_4 when others; -- same as rgb_led_4
               
  
  
  
  
  
  
  
 -- failed attempt at using if else conditions

 -- missing proccess line here, should have been 
 
  --process(sw)         -- bucause 
  -- begin
--  if sw = '11' then 
--  RGB_Led_5 <= '111'; --white
--  elseif sw = '10' then 
--  RGB_Led_5 <= '111'; --white



--  elseif sw = '1' then 
--     with btn(1 downto 0) select
--     RGB_Led_5 <=        "001" when "01", --red
--                         "010" when "10", --green
--                         "100" when "11", --blue
--                         "000" when others; --off

--  elsif condition2 then
--                           sequential statements
--                   else
--                           sequential statements
--                   end if;
  
  
  -- RGB_Led_5 <= "111" when (sw = '1') else if (sw = '0');
                   
                       
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
  
  
  
  -- signal_name <= expression_1 when condition_1 else expression_2;
  -- TEMPLATE FOR MUX 2 TO 1 
  
--  library IEEE;
--  use IEEE.STD_LOGIC_1164.ALL;
  
--  entity mux_2to1_top is
--      Port ( sw : in  STD_LOGIC_VECTOR (1 downto 0);
--             A   : in  STD_LOGIC_VECTOR (3 downto 0);
--             B   : in  STD_LOGIC_VECTOR (3 downto 0);
--             X   : out STD_LOGIC_VECTOR (3 downto 0));
--  end mux_2to1_top;
  
--  architecture Behavioral of mux_2to1_top is
--  begin
  
--      X <= A when (sw = '1') else B;
  
--  end Behavioral;
  


     
        





           
  