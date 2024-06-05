library ieee;
use ieee.std_logic_1164.all;

entity top is
    port (
        CLK_50 : in std_logic;
        RST    : in std_logic;
        SW     : in std_logic_vector(9 downto 0);
        KEY    : in std_logic_vector(3 downto 0);
        LEDR   : out std_logic_vector(7 downto 0);
        LEDG   : out std_logic_vector(7 downto 0);
        GPIO   : inout std_logic_vector(34 downto 0)
    );
end entity;

architecture jpmsb of top is
    component multiplexer is
        generic(SC: NATURAL := 8; S: NATURAL := 1; BC: NATURAL := 4); 
        port (
            sel               : in    std_logic_vector(S-1 downto 0); 
            sensor_connection : inout std_logic_vector(SC-1 downto 0); 
            board_connection  : inout std_logic_vector(BC-1 downto 0)
        );  
    end component;

    -- Signal to make the connection between the sensors and the FPGA
    signal sensor_pins : std_logic_vector(7 downto 0);

    -- Signal to make the connection between the FPGA and the board GPIO
    signal board_pins : std_logic_vector(3 downto 0);
begin
    -- Multiplexer instantiation
    mux : multiplexer
        generic map(SC => 8, S => 1, BC => 4)
        port map(
            sel => SW(0 downto 0),
            sensor_connection => sensor_pins,
            board_connection => board_pins
        );


    -- Simulated signals from the switches
    -- sensor_pins <= SW(9 downto 2);

    -- Real signal from GPIO
    sensor_pins <= GPIO(7 downto 0);

    -- Red LEDs connection
    LEDR(3 downto 0) <= board_pins;

    -- GPIO connection
    GPIO(25 downto 22) <= board_pins;
end architecture;
