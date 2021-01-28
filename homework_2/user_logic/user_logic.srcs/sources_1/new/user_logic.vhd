----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/27/2021 05:37:16 PM
-- Design Name: 
-- Module Name: user_logic - beh
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity user_logic is
    generic(G_LED_NUM     : integer := 8;
            G_SADDR_WIDTH : integer := 4);
    port(clk_i, en_i, rst_i : in std_logic;
         x_i                : in std_logic_vector(G_LED_NUM - 1 downto 0);
         slv_reg_addr_i     : in std_logic_vector(G_SADDR_WIDTH - 1 downto 0);
         z_o                : out std_logic_vector(G_LED_NUM - 1 downto 0));
end user_logic;

architecture beh of user_logic is
    signal temp : std_logic_vector(G_LED_NUM - 1 downto 0);
    signal reg0_addr, reg1_addr : std_logic_vector(G_SADDR_WIDTH - 1 downto 0);
begin
    reg0_addr <= (others => '0');
    reg1_addr <= (2 => '1', others => '0');
    
    p_clk : process(clk_i)
    begin
        if rising_edge(clk_i) then
            if rst_i = '0' then
                temp <= (others => '0');
            else
                if en_i = '1' and slv_reg_addr_i = reg0_addr then
                    temp <= x_i;
                elsif en_i = '1' and slv_reg_addr_i = reg1_addr then
                    temp <= temp(0) & temp(G_LED_NUM - 1 downto 1);
                end if;
            end if;
        end if;
    end process;
    
    z_o <= temp;
end beh;
