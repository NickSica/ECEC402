----------------------------------------------------------------------------------
-- knight rider IP user logic
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity user_logic is
port (
reset, ck, S_F, L_R :in std_logic;
z: out std_logic_vector(3 downto 0)
);
end user_logic;
architecture beh of user_logic is
type my_state is
(s0,s1,s2,s3);
signal n_s: my_state;
signal ck1, ck2, ck3: std_logic;
begin
-- LED state machine ck1 sensitive
process(ck1)
begin
if ck1='1' and ck1'event then
 if reset = '1' then n_s <= s0;
 else
 case n_s is
 when s0 => z <= "0001";
 if L_R='1' then n_s <= s1;
 elsif L_R = '0' then n_s <= s3;
 end if;
 when s1 => z <= "0010";
 if L_R='1' then n_s <= s2;
 elsif L_R='0' then n_s <= s0;
 end if;
 when s2 => z <= "0100";
 if L_R='1' then n_s <= s3;
 elsif L_R='0' then n_s <= s1;
 end if;
 when s3 => z <= "1000";
 if L_R='1' then n_s <= s0;
 elsif L_R='0' then n_s <= s2;
 end if;
 when others => null;
 end case;
 end if;
end if;
end process;
-- Slow clock generator
process(ck)
variable count : integer;
begin
if ck = '1' and ck'event then
if reset = '1' then
 count := 0; ck2 <= '0';
else
 if count = 9999999 then
 ck2 <= not ck2; count := 0;
 else
 count := count + 1;
 end if;
end if;
end if;
end process;
-- Fast clock generator
process(ck)
variable count : integer;
begin
if ck = '1' and ck'event then
if reset = '1' then
 count := 0; ck3 <= '0';
else
 if count = 2999999 then
 ck3 <= not ck3; count := 0;
 else
 count := count + 1;
 end if;
end if;
end if;
end process;
-- Mux: F_S selects Fast or Slow
-- CK1 driving LED state machine
process(S_F, ck2, ck3)
begin
if S_F = '1' then ck1 <= ck3;
else
ck1 <= ck2;
end if;
end process;
end beh;
