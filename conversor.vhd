library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

package conversor is
    procedure hexa_to_bin(
        signal hex : in std_logic_vector(7 downto 0);
        signal bin_value : out std_logic_vector(7 downto 0)
    );

    procedure bin_to_dec(
        signal bin : in std_logic_vector(15 downto 0);
        signal low : out std_logic_vector(7 downto 0);
        signal high : out std_logic_vector(7 downto 0)
    );
end conversor;

package body conversor is

	 -- Este procedimiento recibe un binario generado por el ingreso de
	 -- un numero atraves de un teclado matricial. Este numero fue ingresado
	 -- con la intencion de cargar un numero decimal, sin embargo se recibe una combinacion
	 -- de dos digitos, no el numero decimal. Por ende se realiza la conversion de este
	 -- numero a decimal y despues al binario correspondiente
    procedure hexa_to_bin(signal hex : in std_logic_vector(7 downto 0);
                          signal bin_value : out std_logic_vector(7 downto 0)) is
        variable hex_ls : integer;
        variable hex_ms : integer;
        variable dec_value : integer;
    begin 
        case hex(3 downto 0) is
            when "0000" => hex_ls := 0; 
            when "0001" => hex_ls := 1; 
            when "0010" => hex_ls := 2;
            when "0011" => hex_ls := 3; 
            when "0100" => hex_ls := 4; 
            when "0101" => hex_ls := 5; 
            when "0110" => hex_ls := 6; 
            when "0111" => hex_ls := 7; 
            when "1000" => hex_ls := 8; 
            when "1001" => hex_ls := 9; 
            when others => hex_ls := 0; 
        end case;
        
        case hex(7 downto 4) is
            when "0000" => hex_ms := 0; 
            when "0001" => hex_ms := 1; 
            when "0010" => hex_ms := 2;
            when "0011" => hex_ms := 3; 
            when "0100" => hex_ms := 4; 
            when "0101" => hex_ms := 5; 
            when "0110" => hex_ms := 6; 
            when "0111" => hex_ms := 7; 
            when "1000" => hex_ms := 8; 
            when "1001" => hex_ms := 9; 
            when others => hex_ms := 0; 
        end case;

        dec_value := (hex_ms * 10) + hex_ls;
        bin_value <= std_logic_vector(to_unsigned(dec_value, 8));
    end procedure;


	 -- Este procedimiento recibe un binario, lo convierte a entero y
	 -- codifica cada digito del numero entero en binario para poder
	 -- mostrar el numero como decimal en un display de 7 segmentos
    procedure bin_to_dec(signal bin : in std_logic_vector(15 downto 0); 
                         signal low : out std_logic_vector(7 downto 0);
                         signal high : out std_logic_vector(7 downto 0)) is
		  variable int_value : integer;
		  variable digit1, digit2, digit3, digit4 : integer; -- Para almacenar cada dígito decimal
		  variable d1, d2, d3, d4 : std_logic_vector(3 downto 0);
	 begin
			-- Convertimos el valor binario a un número entero
			int_value := to_integer(unsigned(bin));
    
			-- Cálculo de los dígitos decimales individuales
			digit1 := int_value mod 10;
			d1 := std_logic_vector(to_unsigned(digit1, 4));
			int_value := int_value / 10;
    
			digit2 := int_value mod 10;
			d2 := std_logic_vector(to_unsigned(digit2, 4));
			int_value := int_value / 10;
    
			digit3 := int_value mod 10;
			d3 := std_logic_vector(to_unsigned(digit3, 4));
			int_value := int_value / 10;
    
			digit4 := int_value mod 10;
			d4 := std_logic_vector(to_unsigned(digit4, 4));

			low <= d2 & d1;
			high <= d4 & d3;
    end procedure;
	 
end conversor;