library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

use work.conversor.all;

entity testbench is
end entity testbench;

architecture sim of testbench is
    -- Señales para probar la función
    signal hex_input : std_logic_vector(7 downto 0);
    signal bin_output : std_logic_vector(7 downto 0);
	 signal bin_input : std_logic_vector(15 downto 0);
	 signal low : std_logic_vector(7 downto 0);
	 signal high : std_logic_vector(7 downto 0);
begin

    -- Proceso de estimulación
    process
    begin
        -- Primer valor de prueba: 10 en decimal (hexadecimal "00010000")
        hex_input <= "00010000";
        wait for 100 ns;
        
        -- Llamar a la función para convertir de hexadecimal a binario
        hexa_to_bin(hex_input, bin_output);
        wait for 100 ns; -- Esperar para observar el resultado

        -- Segundo valor de prueba: 99 en decimal (hexadecimal "10011001")
        hex_input <= "10011001";
        wait for 100 ns;
        
        -- Llamar a la función nuevamente
        hexa_to_bin(hex_input, bin_output);
        wait for 100 ns;
		  
		  --------------------------------------------- Test de la otra funcion
		  
		  -- Supongamos que el resultado de la multiplicación es 250
        bin_input <= "0000000011111010"; -- 250 en binario
        wait for 100 ns;

        -- Convertir de binario a entero
        bin_to_dec(bin_input, low, high);
        wait for 100 ns;
        
         -- Supongamos que el resultado de la multiplicación es 156
        bin_input <= "0000000010011100"; -- 156 en binario
        wait for 100 ns;

        -- Convertir de binario a entero
        bin_to_dec(bin_input, low, high);
        
        wait;
    end process;

end architecture sim;
