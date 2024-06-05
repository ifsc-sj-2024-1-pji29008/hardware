library ieee;
use ieee.std_logic_1164.all;

entity multiplexer is
    generic(SC: NATURAL := 8; S: NATURAL := 1; BC: NATURAL := 4);
    port (
        sel               : in    std_logic_vector(S-1 downto 0);
        sensor_connection : inout std_logic_vector(SC-1 downto 0);
        board_connection  : inout std_logic_vector(BC-1 downto 0)
    );
end entity;

architecture jpmsb of multiplexer is
begin
    with sel select
        board_connection <= sensor_connection(BC-1 downto 0) when "0",
            sensor_connection(SC-1 downto BC) when others;
end architecture;
