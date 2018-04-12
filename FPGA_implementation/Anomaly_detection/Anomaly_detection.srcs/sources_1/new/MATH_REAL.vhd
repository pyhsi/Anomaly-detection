----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.12.2017 17:26:48
-- Design Name: 
-- Module Name: MATH_REAL - Behavioral
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


Library IEEE;

package MATH_REAL is
    constant CopyRightNotice: STRING
      := "Copyright 1996 IEEE. All rights reserved.";

    --
    -- Constant Definitions
    --
    constant  MATH_E : REAL := 2.71828_18284_59045_23536;
                                                      -- Value of e
    constant  MATH_1_OVER_E : REAL := 0.36787_94411_71442_32160;
                                                      -- Value of 1/e
    constant  MATH_PI : REAL := 3.14159_26535_89793_23846;
                                                      -- Value of pi
    constant  MATH_2_PI : REAL := 6.28318_53071_79586_47693;
                                                      -- Value of 2*pi
    constant  MATH_1_OVER_PI : REAL := 0.31830_98861_83790_67154;
                                                      -- Value of 1/pi
    constant  MATH_PI_OVER_2 : REAL := 1.57079_63267_94896_61923;
                                                      -- Value of pi/2
    constant  MATH_PI_OVER_3 : REAL := 1.04719_75511_96597_74615;
                                                      -- Value of pi/3
    constant  MATH_PI_OVER_4 : REAL := 0.78539_81633_97448_30962;
                                                      -- Value of pi/4
    constant  MATH_3_PI_OVER_2 : REAL := 4.71238_89803_84689_85769;
                                                      -- Value 3*pi/2
    constant  MATH_LOG_OF_2 : REAL := 0.69314_71805_59945_30942;
                                                      -- Natural log of 2
    constant  MATH_LOG_OF_10 : REAL := 2.30258_50929_94045_68402;
                                                      -- Natural log of 10
    constant  MATH_LOG2_OF_E : REAL := 1.44269_50408_88963_4074;
                                                      -- Log base 2 of e
    constant  MATH_LOG10_OF_E: REAL := 0.43429_44819_03251_82765;
                                                      -- Log base 10 of e
    constant  MATH_SQRT_2: REAL := 1.41421_35623_73095_04880;
                                                      -- square root of 2
    constant  MATH_1_OVER_SQRT_2: REAL := 0.70710_67811_86547_52440;
                                                      -- square root of 1/2
    constant  MATH_SQRT_PI: REAL := 1.77245_38509_05516_02730;
                                                      -- square root of pi
    constant  MATH_DEG_TO_RAD: REAL := 0.01745_32925_19943_29577;
                                     -- Conversion factor from degree to radian
    constant  MATH_RAD_TO_DEG: REAL := 57.29577_95130_82320_87680;
                                     -- Conversion factor from radian to degree

    --
    -- Function Declarations
    --
    function SIGN (X: in REAL ) return REAL;
        -- Purpose:
        --         Returns 1.0 if X > 0.0; 0.0 if X = 0.0; -1.0 if X < 0.0
        -- Special values:
        --         None
        -- Domain:
        --         X in REAL
        -- Error conditions:
        --         None
        -- Range:
        --         ABS(SIGN(X)) <= 1.0
        -- Notes:
        --         None

    function CEIL (X : in REAL ) return REAL;
        -- Purpose:
        --         Returns smallest INTEGER value (as REAL) not less than X
        -- Special values:
        --         None
        -- Domain:
        --         X in REAL
        -- Error conditions:
        --         None
        -- Range:
        --         CEIL(X) is mathematically unbounded
        -- Notes:
        --         a) Implementations have to support at least the domain
        --                ABS(X) < REAL(INTEGER'HIGH)

    function FLOOR (X : in REAL ) return REAL;
        -- Purpose:
        --         Returns largest INTEGER value (as REAL) not greater than X
        -- Special values:
        --         FLOOR(0.0) = 0.0
        -- Domain:
        --         X in REAL
        -- Error conditions:
        --         None
        -- Range:
        --         FLOOR(X) is mathematically unbounded
        -- Notes:
        --         a) Implementations have to support at least the domain
        --                ABS(X) < REAL(INTEGER'HIGH)

    function ROUND (X : in REAL ) return REAL;
        -- Purpose:
        --         Rounds X to the nearest integer value (as real). If X is
        --         halfway between two integers, rounding is away from 0.0
        -- Special values:
        --         ROUND(0.0) = 0.0
        -- Domain:
        --         X in REAL
        -- Error conditions:
        --         None
        -- Range:
        --         ROUND(X) is mathematically unbounded
        -- Notes:
        --         a) Implementations have to support at least the domain
        --                ABS(X) < REAL(INTEGER'HIGH)

    function TRUNC (X : in REAL ) return REAL;
        -- Purpose:
        --         Truncates X towards 0.0 and returns truncated value
        -- Special values:
        --         TRUNC(0.0) = 0.0
        -- Domain:
        --         X in REAL
        -- Error conditions:
        --         None
        -- Range:
        --         TRUNC(X) is mathematically unbounded
        -- Notes:
        --         a) Implementations have to support at least the domain
        --                ABS(X) < REAL(INTEGER'HIGH)

    function "MOD" (X, Y: in REAL ) return REAL;
        -- Purpose:
        --         Returns floating point modulus of X/Y, with the same sign as
        --         Y, and absolute value less than the absolute value of Y, and
        --         for some INTEGER value N the result satisfies the relation
        --         X = Y*N + MOD(X,Y)
        -- Special values:
        --         None
        -- Domain:
        --         X in REAL; Y in REAL and Y /= 0.0
        -- Error conditions:
        --         Error if Y = 0.0
        -- Range:
        --         ABS(MOD(X,Y)) < ABS(Y)
        -- Notes:
        --         None

    function REALMAX (X, Y : in REAL ) return REAL;
        -- Purpose:
        --         Returns the algebraically larger of X and Y
        -- Special values:
        --         REALMAX(X,Y) = X when X = Y
        -- Domain:
        --         X in REAL; Y in REAL
        -- Error conditions:
        --         None
        -- Range:
        --         REALMAX(X,Y) is mathematically unbounded
        -- Notes:
        --         None

    function REALMIN (X, Y : in REAL ) return REAL;
        -- Purpose:
        --         Returns the algebraically smaller of X and Y
        -- Special values:
        --         REALMIN(X,Y) = X when X = Y
        -- Domain:
        --         X in REAL; Y in REAL
        -- Error conditions:
        --         None
        -- Range:
        --         REALMIN(X,Y) is mathematically unbounded
        -- Notes:
        --         None

    procedure UNIFORM(variable SEED1,SEED2:inout POSITIVE; variable X:out REAL);
    
        -- Purpose:
        --         Returns, in X, a pseudo-random number with uniform
        --         distribution in the open interval (0.0, 1.0).
        -- Special values:
        --         None
        -- Domain:
        --         1 <= SEED1 <= 2147483562; 1 <= SEED2 <= 2147483398
        -- Error conditions:
        --         Error if SEED1 or SEED2 outside of valid domain
        -- Range:
        --         0.0 < X < 1.0
        -- Notes:
        --         a) The semantics for this function are described by the
        --            algorithm published by Pierre L'Ecuyer in "Communications
        --            of the ACM," vol. 31, no. 6, June 1988, pp. 742-774.
        --            The algorithm is based on the combination of two
        --            multiplicative linear congruential generators for 32-bit
        --            platforms.
        --
        --         b) Before the first call to UNIFORM, the seed values
        --            (SEED1, SEED2) have to be initialized to values in the range
        --            [1, 2147483562] and [1, 2147483398] respectively.  The
        --            seed values are modified after each call to UNIFORM.
        --
        --         c) This random number generator is portable for 32-bit
        --            computers, and it has a period of ~2.30584*(10**18) for each
        --            set of seed values.
        --
        --         d) For information on spectral tests for the algorithm, refer
        --            to the L'Ecuyer article.

    function SQRT (X : in REAL ) return REAL;
        -- Purpose:
        --         Returns square root of X
        -- Special values:
        --         SQRT(0.0) = 0.0
        --         SQRT(1.0) = 1.0
        -- Domain:
        --         X >= 0.0
        -- Error conditions:
        --         Error if X < 0.0
        -- Range:
        --         SQRT(X) >= 0.0
        -- Notes:
        --         a) The upper bound of the reachable range of SQRT is
        --            approximately given by:
        --                SQRT(X) <= SQRT(REAL'HIGH)

    function CBRT (X : in REAL ) return REAL;
        -- Purpose:
        --         Returns cube root of X
        -- Special values:
        --         CBRT(0.0) = 0.0
        --         CBRT(1.0) = 1.0
        --         CBRT(-1.0) = -1.0
        -- Domain:
        --         X in REAL
        -- Error conditions:
        --         None
        -- Range:
        --         CBRT(X) is mathematically unbounded
        -- Notes:
        --         a) The reachable range of CBRT is approximately given by:
        --                ABS(CBRT(X)) <= CBRT(REAL'HIGH)

    function "**" (X : in INTEGER; Y : in REAL) return REAL;
        -- Purpose:
        --         Returns Y power of X ==>  X**Y
        -- Special values:
        --         X**0.0 = 1.0; X /= 0
        --         0**Y = 0.0; Y > 0.0
        --         X**1.0 = REAL(X); X >= 0
        --         1**Y = 1.0
        -- Domain:
        --         X > 0
        --         X = 0 for Y > 0.0
        --         X < 0 for Y = 0.0
        -- Error conditions:
        --         Error if X < 0 and Y /= 0.0
        --         Error if X = 0 and Y <= 0.0
        -- Range:
        --         X**Y >= 0.0
        -- Notes:
        --         a) The upper bound of the reachable range for "**" is
        --            approximately given by:
        --                X**Y <= REAL'HIGH

    function "**" (X : in REAL; Y : in REAL) return REAL;
        -- Purpose:
        --         Returns Y power of X ==>  X**Y
        -- Special values:
        --         X**0.0 = 1.0; X /= 0.0
        --         0.0**Y = 0.0; Y > 0.0
        --         X**1.0 = X; X >= 0.0
        --         1.0**Y = 1.0
        -- Domain:
        --         X > 0.0
        --         X = 0.0 for Y > 0.0
        --         X < 0.0 for Y = 0.0
        -- Error conditions:
        --         Error if X < 0.0 and Y /= 0.0
        --         Error if X = 0.0 and Y <= 0.0
        -- Range:
        --         X**Y >= 0.0
        -- Notes:
        --         a) The upper bound of the reachable range for "**" is
        --            approximately given by:
        --                X**Y <= REAL'HIGH

    function EXP (X : in REAL ) return REAL;
        -- Purpose:
        --         Returns e**X; where e = MATH_E
        -- Special values:
        --         EXP(0.0) = 1.0
        --         EXP(1.0) = MATH_E
        --         EXP(-1.0) = MATH_1_OVER_E
        --         EXP(X) = 0.0 for X <= -LOG(REAL'HIGH)
        -- Domain:
        --         X in REAL such that EXP(X) <= REAL'HIGH
        -- Error conditions:
        --         Error if X > LOG(REAL'HIGH)
        -- Range:
        --         EXP(X) >= 0.0
        -- Notes:
        --         a) The usable domain of EXP is approximately given by:
        --                X <= LOG(REAL'HIGH)

    function LOG (X : in REAL ) return REAL;
        -- Purpose:
        --         Returns natural logarithm of X
        -- Special values:
        --         LOG(1.0) = 0.0
        --         LOG(MATH_E) = 1.0
        -- Domain:
        --         X > 0.0
        -- Error conditions:
        --         Error if X <= 0.0
        -- Range:
        --         LOG(X) is mathematically unbounded
        -- Notes:
        --         a) The reachable range of LOG is approximately given by:
        --                LOG(0+) <= LOG(X) <= LOG(REAL'HIGH)

    function LOG2 (X : in REAL ) return REAL;
        -- Purpose:
        --         Returns logarithm base 2 of X
        -- Special values:
        --         LOG2(1.0) = 0.0
        --         LOG2(2.0) = 1.0
        -- Domain:
        --         X > 0.0
        -- Error conditions:
        --         Error if X <= 0.0
        -- Range:
        --         LOG2(X) is mathematically unbounded
        -- Notes:
        --         a) The reachable range of LOG2 is approximately given by:
        --                LOG2(0+) <= LOG2(X) <= LOG2(REAL'HIGH)

    function LOG10 (X : in REAL ) return REAL;
        -- Purpose:
        --         Returns logarithm base 10 of X
        -- Special values:
        --         LOG10(1.0) = 0.0
        --         LOG10(10.0) = 1.0
        -- Domain:
        --         X > 0.0
        -- Error conditions:
        --         Error if X <= 0.0
        -- Range:
        --         LOG10(X) is mathematically unbounded
        -- Notes:
        --         a) The reachable range of LOG10 is approximately given by:
        --                LOG10(0+) <= LOG10(X) <= LOG10(REAL'HIGH)

    function LOG (X: in REAL; BASE: in REAL) return REAL;
        -- Purpose:
        --         Returns logarithm base BASE of X
        -- Special values:
        --         LOG(1.0, BASE) = 0.0
        --         LOG(BASE, BASE) = 1.0
        -- Domain:
        --         X > 0.0
        --         BASE > 0.0
        --         BASE /= 1.0
        -- Error conditions:
        --         Error if X <= 0.0
        --         Error if BASE <= 0.0
        --         Error if BASE = 1.0
        -- Range:
        --         LOG(X, BASE) is mathematically unbounded
        -- Notes:
        --         a) When BASE > 1.0, the reachable range of LOG is
        --            approximately given by:
        --                LOG(0+, BASE) <= LOG(X, BASE) <= LOG(REAL'HIGH, BASE)
        --         b) When 0.0 < BASE < 1.0, the reachable range of LOG is
        --            approximately given by:
        --                LOG(REAL'HIGH, BASE) <= LOG(X, BASE) <= LOG(0+, BASE)

    function  SIN (X : in REAL ) return REAL;
        -- Purpose:
        --         Returns sine of X; X in radians
        -- Special values:
        --         SIN(X) = 0.0 for X = k*MATH_PI, where k is an INTEGER
        --         SIN(X) = 1.0 for X = (4*k+1)*MATH_PI_OVER_2, where k is an
        --                                                           INTEGER
        --         SIN(X) = -1.0 for X = (4*k+3)*MATH_PI_OVER_2, where k is an
        --                                                           INTEGER
        -- Domain:
        --         X in REAL
        -- Error conditions:
        --         None
        -- Range:
        --         ABS(SIN(X)) <= 1.0
        -- Notes:
        --         a) For larger values of ABS(X), degraded accuracy is allowed.

    function  COS ( X : in REAL ) return REAL;
        -- Purpose:
        --         Returns cosine of X; X in radians
        -- Special values:
        --         COS(X) = 0.0 for X = (2*k+1)*MATH_PI_OVER_2, where k is an
        --                                                            INTEGER
        --         COS(X) = 1.0 for X = (2*k)*MATH_PI, where k is an INTEGER
        --         COS(X) = -1.0 for X = (2*k+1)*MATH_PI, where k is an INTEGER
        -- Domain:
        --         X in REAL
        -- Error conditions:
        --         None
        -- Range:
        --         ABS(COS(X)) <= 1.0
        -- Notes:
        --         a) For larger values of ABS(X), degraded accuracy is allowed.

    function  TAN (X : in REAL ) return REAL;
        -- Purpose:
        --         Returns tangent of X; X in radians
        -- Special values:
        --         TAN(X) = 0.0 for X = k*MATH_PI, where k is an INTEGER
        -- Domain:
        --         X in REAL and
        --         X /= (2*k+1)*MATH_PI_OVER_2, where k is an INTEGER
        -- Error conditions:
        --         Error if X = ((2*k+1) * MATH_PI_OVER_2), where k is an
        --                                                           INTEGER
        -- Range:
        --         TAN(X) is mathematically unbounded
        -- Notes:
        --         a) For larger values of ABS(X), degraded accuracy is allowed.

    function  ARCSIN (X : in REAL ) return REAL;
        -- Purpose:
        --         Returns inverse sine of X
        -- Special values:
        --         ARCSIN(0.0) = 0.0
        --         ARCSIN(1.0) = MATH_PI_OVER_2
        --         ARCSIN(-1.0) = -MATH_PI_OVER_2
        -- Domain:
        --         ABS(X) <= 1.0
        -- Error conditions:
        --         Error if ABS(X) > 1.0
        -- Range:
        --         ABS(ARCSIN(X) <= MATH_PI_OVER_2
        -- Notes:
        --         None

    function  ARCCOS (X : in REAL ) return REAL;
        -- Purpose:
        --         Returns inverse cosine of X
        -- Special values:
        --         ARCCOS(1.0) = 0.0
        --         ARCCOS(0.0) = MATH_PI_OVER_2
        --         ARCCOS(-1.0) = MATH_PI
        -- Domain:
        --         ABS(X) <= 1.0
        -- Error conditions:
        --         Error if ABS(X) > 1.0
        -- Range:
        --         0.0 <= ARCCOS(X) <= MATH_PI
        -- Notes:
        --         None

    function  ARCTAN (Y : in REAL) return REAL;
        -- Purpose:
        --         Returns the value of the angle in radians of the point
        --        (1.0, Y), which is in rectangular coordinates
        -- Special values:
        --         ARCTAN(0.0) = 0.0
        -- Domain:
        --         Y in REAL
        -- Error conditions:
        --         None
        -- Range:
        --         ABS(ARCTAN(Y)) <= MATH_PI_OVER_2
        -- Notes:
        --         None

    function  ARCTAN (Y : in REAL; X : in REAL) return REAL;
        -- Purpose:
        --         Returns the principal value of the angle in radians of
        --         the point (X, Y), which is in rectangular coordinates
        -- Special values:
        --         ARCTAN(0.0, X) = 0.0 if X > 0.0
        --         ARCTAN(0.0, X) = MATH_PI if X < 0.0
        --         ARCTAN(Y, 0.0) = MATH_PI_OVER_2 if Y > 0.0
        --         ARCTAN(Y, 0.0) = -MATH_PI_OVER_2 if Y < 0.0
        -- Domain:
        --         Y in REAL
        --         X in REAL, X /= 0.0 when Y = 0.0
        -- Error conditions:
        --         Error if X = 0.0 and Y = 0.0
        -- Range:
        --         -MATH_PI < ARCTAN(Y,X) <= MATH_PI
        -- Notes:
        --         None

    function SINH (X : in REAL) return REAL;
        -- Purpose:
        --         Returns hyperbolic sine of X
        -- Special values:
        --         SINH(0.0) = 0.0
        -- Domain:
        --         X in REAL
        -- Error conditions:
        --         None
        -- Range:
        --         SINH(X) is mathematically unbounded
        -- Notes:
        --         a) The usable domain of SINH is approximately given by:
        --                ABS(X) <= LOG(REAL'HIGH)


    function COSH (X : in REAL) return REAL;
        -- Purpose:
        --         Returns hyperbolic cosine of X
        -- Special values:
        --         COSH(0.0) = 1.0
        -- Domain:
        --         X in REAL
        -- Error conditions:
        --         None
        -- Range:
        --         COSH(X) >= 1.0
        -- Notes:
        --         a) The usable domain of COSH is approximately given by:
        --                ABS(X) <= LOG(REAL'HIGH)

    function TANH (X : in REAL) return REAL;
        -- Purpose:
        --         Returns hyperbolic tangent of X
        -- Special values:
        --         TANH(0.0) = 0.0
        -- Domain:
        --         X in REAL
        -- Error conditions:
        --         None
        -- Range:
        --         ABS(TANH(X)) <= 1.0
        -- Notes:
        --         None

    function ARCSINH (X : in REAL) return REAL;
        -- Purpose:
        --         Returns inverse hyperbolic sine of X
        -- Special values:
        --         ARCSINH(0.0) = 0.0
        -- Domain:
        --         X in REAL
        -- Error conditions:
        --         None
        -- Range:
        --         ARCSINH(X) is mathematically unbounded
        -- Notes:
        --         a) The reachable range of ARCSINH is approximately given by:
        --                ABS(ARCSINH(X)) <= LOG(REAL'HIGH)

    function ARCCOSH (X : in REAL) return REAL;
        -- Purpose:
        --         Returns inverse hyperbolic cosine of X
        -- Special values:
        --         ARCCOSH(1.0) = 0.0
        -- Domain:
        --         X >= 1.0
        -- Error conditions:
        --         Error if X < 1.0
        -- Range:
        --         ARCCOSH(X) >= 0.0
        -- Notes:
        --         a) The upper bound of the reachable range of ARCCOSH is
        --            approximately given by:   ARCCOSH(X) <= LOG(REAL'HIGH)

    function ARCTANH (X : in REAL) return REAL;
        -- Purpose:
        --         Returns inverse hyperbolic tangent of X
        -- Special values:
        --         ARCTANH(0.0) = 0.0
        -- Domain:
        --         ABS(X) < 1.0
        -- Error conditions:
        --         Error if ABS(X) >= 1.0
        -- Range:
        --         ARCTANH(X) is mathematically unbounded
        -- Notes:
        --         a) The reachable range of ARCTANH is approximately given by:
        --                ABS(ARCTANH(X)) < LOG(REAL'HIGH)

end  MATH_REAL;


------------------------------------------------------------------------
--
-- Copyright 1996 by IEEE. All rights reserved.

-- This source file is an informative part of IEEE Std 1076.2-1996, IEEE Standard 
-- VHDL Mathematical Packages. This source file may not be copied, sold, or 
-- included with software that is sold without written permission from the IEEE
-- Standards Department. This source file may be used to implement this standard 
-- and may be distributed in compiled form in any manner so long as the 
-- compiled form does not allow direct decompilation of the original source file.
-- This source file may be copied for individual use between licensed users. 
-- This source file is provided on an AS IS basis. The IEEE disclaims ANY 
-- WARRANTY EXPRESS OR IMPLIED INCLUDING ANY WARRANTY OF MERCHANTABILITY 
-- AND FITNESS FOR USE FOR A PARTICULAR PURPOSE. The user of the source 
-- file shall indemnify and hold IEEE harmless from any damages or liability 
-- arising out of the use thereof.

--
-- Title:       Standard VHDL Mathematical Packages (IEEE Std 1076.2-1996,
--              MATH_REAL)
--
-- Library:     This package shall be compiled into a library
--              symbolically named IEEE.
--
-- Developers:  IEEE DASC VHDL Mathematical Packages Working Group
--
-- Purpose:     This package body is a nonnormative implementation of the 
--              functionality defined in the MATH_REAL package declaration.
--
-- Limitation:  The values generated by the functions in this package may
--              vary from platform to platform, and the precision of results
--              is only guaranteed to be the minimum required by IEEE Std 1076
--              -1993.
--
-- Notes:
--              The "package declaration" defines the types, subtypes, and
--              declarations of MATH_REAL.
--              The standard mathematical definition and conventional meaning
--              of the mathematical functions that are part of this standard
--              represent the formal semantics of the implementation of the
--              MATH_REAL package declaration.  The purpose of the MATH_REAL
--              package body is to clarify such semantics and provide a
--              guideline for implementations to verify their implementation
--              of MATH_REAL.  Tool developers may choose to implement
--              the package body in the most efficient manner available to them.
--
-- -----------------------------------------------------------------------------
-- Version    : 1.5
-- Date       : 24 July 1996
-- -----------------------------------------------------------------------------

package body MATH_REAL is

    --
    -- Local Constants for Use in the Package Body Only
    --
    constant  MATH_E_P2 :  REAL := 7.38905_60989_30650;   -- e**2
    constant  MATH_E_P10 :  REAL := 22026.46579_48067_17; -- e**10
    constant  MATH_EIGHT_PI : REAL := 25.13274_12287_18345_90770_115; --8*pi
    constant  MAX_ITER:  INTEGER := 27;  -- Maximum precision factor for cordic
    constant  MAX_COUNT: INTEGER := 150; -- Maximum count for number of tries
    constant  BASE_EPS: REAL := 0.00001;  -- Factor for convergence criteria
    constant  KC : REAL := 6.0725293500888142e-01; -- Constant for cordic

    --
    -- Local Type Declarations for Cordic Operations
    --
    type REAL_VECTOR is array (NATURAL range <>) of REAL;
    type NATURAL_VECTOR is array (NATURAL range <>) of NATURAL;
    subtype REAL_VECTOR_N is REAL_VECTOR (0 to MAX_ITER);
    subtype REAL_ARR_2 is REAL_VECTOR (0 to 1);
    subtype REAL_ARR_3 is REAL_VECTOR (0 to 2);
    subtype QUADRANT is INTEGER range 0 to 3;
    type CORDIC_MODE_TYPE is (ROTATION, VECTORING);

    --
    -- Auxiliary Functions for Cordic Algorithms
    --
    function POWER_OF_2_SERIES (D : in NATURAL_VECTOR; INITIAL_VALUE : in REAL;
                NUMBER_OF_VALUES : in NATURAL) return REAL_VECTOR is
        -- Description:
        --        Returns power of two for a vector of values
        -- Notes:
        --        None
        --
        variable V : REAL_VECTOR (0 to NUMBER_OF_VALUES);
        variable TEMP : REAL := INITIAL_VALUE;
        variable FLAG : BOOLEAN := TRUE;
    begin
              for I in 0 to NUMBER_OF_VALUES loop
                 V(I) := TEMP;
                 for P in D'RANGE loop
                            if I = D(P) then
                                FLAG := FALSE;
                                exit;
                            end if;
                 end loop;
                 if FLAG then
                            TEMP := TEMP/2.0;
                 end if;
                 FLAG := TRUE;
              end loop;
              return V;
    end POWER_OF_2_SERIES;


    constant TWO_AT_MINUS : REAL_VECTOR := POWER_OF_2_SERIES(
                                               NATURAL_VECTOR'(100, 90),1.0,
                                                                  MAX_ITER);

    constant EPSILON : REAL_VECTOR_N := (
                                        7.8539816339744827e-01,
                                        4.6364760900080606e-01,
                                        2.4497866312686413e-01,
                                        1.2435499454676144e-01,
                                        6.2418809995957351e-02,
                                        3.1239833430268277e-02,
                                        1.5623728620476830e-02,
                                        7.8123410601011116e-03,
                                        3.9062301319669717e-03,
                                        1.9531225164788189e-03,
                                        9.7656218955931937e-04,
                                        4.8828121119489829e-04,
                                        2.4414062014936175e-04,
                                        1.2207031189367021e-04,
                                        6.1035156174208768e-05,
                                        3.0517578115526093e-05,
                                        1.5258789061315760e-05,
                                        7.6293945311019699e-06,
                                        3.8146972656064960e-06,
                                        1.9073486328101870e-06,
                                        9.5367431640596080e-07,
                                        4.7683715820308876e-07,
                                        2.3841857910155801e-07,
                                        1.1920928955078067e-07,
                                        5.9604644775390553e-08,
                                        2.9802322387695303e-08,
                                        1.4901161193847654e-08,
                                        7.4505805969238281e-09
                                       );

    function CORDIC ( X0 : in REAL;
                      Y0 : in REAL;
                      Z0 : in REAL;
                      N : in NATURAL;                 --  Precision factor
            CORDIC_MODE : in CORDIC_MODE_TYPE         --  Rotation (Z -> 0)
                                                      --  or vectoring (Y -> 0)
                    ) return REAL_ARR_3 is
        -- Description:
        --        Compute cordic values
        -- Notes:
        --         None
             variable X : REAL := X0;
             variable Y : REAL := Y0;
             variable Z : REAL := Z0;
             variable X_TEMP : REAL;
    begin
       if CORDIC_MODE = ROTATION then
           for K in 0 to N loop
                      X_TEMP := X;
                      if ( Z >= 0.0) then
                               X := X - Y * TWO_AT_MINUS(K);
                               Y := Y + X_TEMP * TWO_AT_MINUS(K);
                               Z := Z - EPSILON(K);
                      else
                               X := X + Y * TWO_AT_MINUS(K);
                               Y := Y - X_TEMP * TWO_AT_MINUS(K);
                               Z := Z + EPSILON(K);
                      end if;
            end loop;
        else
            for K in 0 to N loop
                    X_TEMP := X;
                    if ( Y < 0.0) then
                               X := X - Y * TWO_AT_MINUS(K);
                               Y := Y + X_TEMP * TWO_AT_MINUS(K);
                               Z := Z - EPSILON(K);
                    else
                               X := X + Y * TWO_AT_MINUS(K);
                               Y := Y - X_TEMP * TWO_AT_MINUS(K);
                               Z := Z + EPSILON(K);
                    end if;
            end loop;
        end if;
        return REAL_ARR_3'(X, Y, Z);
    end CORDIC;

    --
    -- Bodies for Global Mathematical Functions Start Here
    --
    function SIGN (X: in REAL ) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        None
    begin
           if  ( X > 0.0 )  then
                return 1.0;
           elsif ( X < 0.0 )  then
                return -1.0;
           else
                return 0.0;
           end if;
    end SIGN;

    function CEIL (X : in REAL ) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) No conversion to an INTEGER type is expected, so truncate
        --           cannot overflow for large arguments
        --        b) The domain supported by this function is X <= LARGE
        --        c) Returns X if ABS(X) >= LARGE

        constant LARGE: REAL  := REAL(INTEGER'HIGH);
        variable RD: REAL;

    begin
         if ABS(X) >= LARGE then
               return X;
         end if;

         RD := REAL ( INTEGER(X));
         if RD = X then
            return X;
         end if;

            if X > 0.0 then
                       if RD >= X then
                                  return RD;
                       else
                                  return RD + 1.0;
                       end if;
            elsif  X = 0.0  then
                return 0.0;
            else
                       if RD <= X then
                                  return RD + 1.0;
                       else
                                  return RD;
                       end if;
            end if;
    end CEIL;

    function FLOOR (X : in REAL ) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) No conversion to an INTEGER type is expected, so truncate
        --           cannot overflow for large arguments
        --        b) The domain supported by this function is ABS(X) <= LARGE
        --        c) Returns X if ABS(X) >= LARGE

        constant LARGE: REAL  := REAL(INTEGER'HIGH);
        variable RD: REAL;

    begin
        if ABS( X ) >= LARGE then
                    return X;
        end if;

        RD := REAL ( INTEGER(X));
        if RD = X then
                return X;
        end if;

        if X > 0.0 then
                      if RD <= X then
                                  return RD;
                       else
                                  return RD - 1.0;
                       end if;
        elsif  X = 0.0  then
                return 0.0;
        else
                   if RD >= X then
                                  return RD - 1.0;
                   else
                                  return RD;
                   end if;
        end if;
    end FLOOR;

    function ROUND (X : in REAL ) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --         a) Returns 0.0 if X = 0.0
        --         b) Returns FLOOR(X + 0.5) if X > 0
        --         c) Returns CEIL(X - 0.5) if X < 0

    begin
           if  X > 0.0  then
                return FLOOR(X + 0.5);
           elsif  X < 0.0  then
                return CEIL( X - 0.5);
           else
                return 0.0;
           end if;
    end ROUND;

    function TRUNC (X : in REAL ) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --         a) Returns 0.0 if X = 0.0
        --         b) Returns FLOOR(X) if X > 0
        --         c) Returns CEIL(X) if X < 0

    begin
           if  X > 0.0  then
                return FLOOR(X);
           elsif  X < 0.0  then
                return CEIL( X);
           else
                return 0.0;
           end if;
    end TRUNC;




    function "MOD" (X, Y: in REAL ) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) Returns 0.0 on error

        variable XNEGATIVE : BOOLEAN := X < 0.0;
        variable YNEGATIVE : BOOLEAN := Y < 0.0;
        variable VALUE : REAL;
    begin
        -- Check validity of input arguments
            if (Y = 0.0) then
                 assert FALSE
                        report "MOD(X, 0.0) is undefined"
                        severity ERROR;
                 return 0.0;
              end if;

        -- Compute value
        if ( XNEGATIVE ) then
                if ( YNEGATIVE ) then
                        VALUE := X + (FLOOR(ABS(X)/ABS(Y)))*ABS(Y);
                else
                        VALUE := X + (CEIL(ABS(X)/ABS(Y)))*ABS(Y);
                end if;
        else
                if ( YNEGATIVE ) then
                        VALUE := X - (CEIL(ABS(X)/ABS(Y)))*ABS(Y);
                else
                        VALUE := X - (FLOOR(ABS(X)/ABS(Y)))*ABS(Y);
                end if;
        end if;

        return VALUE;
    end "MOD";


    function REALMAX (X, Y : in REAL ) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) REALMAX(X,Y) = X when X = Y
        --
    begin
        if X >= Y then
           return X;
        else
           return Y;
        end if;
    end REALMAX;

    function REALMIN (X, Y : in REAL ) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) REALMIN(X,Y) = X when X = Y
        --
    begin
        if X <= Y then
           return X;
        else
           return Y;
        end if;
    end REALMIN;


    procedure UNIFORM(variable SEED1,SEED2:inout POSITIVE;variable X:out REAL)
                                                                         is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) Returns 0.0 on error
        --
        variable Z, K: INTEGER;
        variable TSEED1 : INTEGER := INTEGER'(SEED1);
        variable TSEED2 : INTEGER := INTEGER'(SEED2);
    begin
        -- Check validity of arguments
        if SEED1 > 2147483562 then
                assert FALSE
                        report "SEED1 > 2147483562 in UNIFORM"
                        severity ERROR;
                X := 0.0;
                return;
        end if;

        if SEED2 > 2147483398 then
                assert FALSE
                        report "SEED2 > 2147483398 in UNIFORM"
                        severity ERROR;
                X := 0.0;
                return;
        end if;

        -- Compute new seed values and pseudo-random number
        K := TSEED1/53668;
        TSEED1 := 40014 * (TSEED1 - K * 53668) - K * 12211;

        if TSEED1 < 0  then
                TSEED1 := TSEED1 + 2147483563;
        end if;

        K := TSEED2/52774;
        TSEED2 := 40692 * (TSEED2 - K * 52774) - K * 3791;

        if TSEED2 < 0  then
                TSEED2 := TSEED2 + 2147483399;
        end if;

        Z := TSEED1 - TSEED2;
        if Z < 1 then
                Z := Z + 2147483562;
        end if;

        -- Get output values
        SEED1 := POSITIVE'(TSEED1);
        SEED2 := POSITIVE'(TSEED2);
        X :=  REAL(Z)*4.656613e-10;
    end UNIFORM;



    function SQRT (X : in REAL ) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) Uses the Newton-Raphson approximation:
        --            F(n+1) = 0.5*[F(n) + x/F(n)]
        --        b) Returns 0.0 on error
        --

        constant EPS : REAL := BASE_EPS*BASE_EPS; -- Convergence factor

        variable INIVAL: REAL;
        variable OLDVAL : REAL ;
        variable NEWVAL : REAL ;
        variable COUNT : INTEGER := 1;

    begin
        -- Check validity of argument
        if ( X < 0.0 ) then
                assert FALSE
                        report "X < 0.0 in SQRT(X)"
                        severity ERROR;
                return 0.0;
        end if;

        -- Get the square root for special cases
        if X = 0.0 then
                  return 0.0;
        else
                if ( X = 1.0 ) then
                        return 1.0;
                end if;
        end if;

        -- Get the square root for general cases
        INIVAL := EXP(LOG(X)*(0.5)); -- Mathematically correct but imprecise
        OLDVAL := INIVAL;
        NEWVAL := (X/OLDVAL + OLDVAL)*0.5;

        -- Check for  relative and absolute error and max count
        while  ( ( (ABS((NEWVAL -OLDVAL)/NEWVAL) > EPS) OR
                   (ABS(NEWVAL - OLDVAL) > EPS) ) AND
                   (COUNT < MAX_COUNT) )  loop
                OLDVAL := NEWVAL;
                NEWVAL := (X/OLDVAL + OLDVAL)*0.5;
                COUNT := COUNT + 1;
        end loop;
        return NEWVAL;
    end SQRT;

    function CBRT (X : in REAL ) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) Uses the Newton-Raphson approximation:
        --            F(n+1) = (1/3)*[2*F(n) + x/F(n)**2];
        --
        constant EPS : REAL := BASE_EPS*BASE_EPS;

        variable INIVAL: REAL;
        variable XLOCAL : REAL := X;
        variable NEGATIVE : BOOLEAN := X < 0.0;
        variable OLDVAL : REAL ;
        variable NEWVAL : REAL ;
        variable COUNT : INTEGER := 1;

    begin

        -- Compute root for special cases
        if X = 0.0 then
                return 0.0;
        elsif ( X = 1.0 ) then
                return 1.0;
        else
                if X = -1.0 then
                        return -1.0;
                end if;
        end if;

        -- Compute root for general cases
        if NEGATIVE then
                XLOCAL := -X;
        end if;

        INIVAL := EXP(LOG(XLOCAL)/(3.0)); -- Mathematically correct but
                                          -- imprecise
        OLDVAL := INIVAL;
        NEWVAL := (XLOCAL/(OLDVAL*OLDVAL) + 2.0*OLDVAL)/3.0;

        -- Check for relative and absolute errors and max count
        while ( (  (ABS((NEWVAL -OLDVAL)/NEWVAL) > EPS ) OR
                   (ABS(NEWVAL - OLDVAL) > EPS ) )  AND
                   ( COUNT < MAX_COUNT ) ) loop
                OLDVAL := NEWVAL;
                NEWVAL :=(XLOCAL/(OLDVAL*OLDVAL) + 2.0*OLDVAL)/3.0;
                COUNT := COUNT + 1;
        end loop;

        if NEGATIVE then
                NEWVAL := -NEWVAL;
        end if;

        return NEWVAL;
    end CBRT;

    function "**" (X : in INTEGER; Y : in REAL) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) Returns 0.0 on error condition

    begin
        -- Check validity of argument
        if ( ( X < 0  ) and ( Y /= 0.0 ) ) then
                assert FALSE
                        report "X < 0 and Y /= 0.0 in X**Y"
                        severity ERROR;
                return 0.0;
        end if;

        if ( ( X = 0  ) and ( Y <= 0.0 ) ) then
                assert FALSE
                        report "X = 0 and Y <= 0.0 in X**Y"
                        severity ERROR;
                return 0.0;
        end if;

        -- Get value for special cases
        if ( X = 0  and  Y > 0.0 ) then
                return 0.0;
        end if;

        if ( X = 1 ) then
                return 1.0;
        end if;

        if ( Y = 0.0 and X /= 0 ) then
                return 1.0;
        end if;

        if ( Y = 1.0) then
                return (REAL(X));
        end if;

        -- Get value for general case
        return EXP (Y * LOG (REAL(X)));
    end "**";

    function "**" (X : in REAL; Y : in REAL) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) Returns 0.0 on error condition

    begin
        -- Check validity of argument
        if ( ( X < 0.0  ) and ( Y /= 0.0 ) ) then
                assert FALSE
                        report "X < 0.0 and Y /= 0.0 in X**Y"
                        severity ERROR;
                return 0.0;
        end if;

        if ( ( X = 0.0  ) and ( Y <= 0.0 ) ) then
                assert FALSE
                        report "X = 0.0 and Y <= 0.0 in X**Y"
                        severity ERROR;
                return 0.0;
        end if;

        -- Get value for special cases
        if ( X = 0.0  and  Y > 0.0 ) then
                return 0.0;
        end if;

        if ( X = 1.0 ) then
                return 1.0;
        end if;

        if ( Y = 0.0 and X /= 0.0 ) then
                return 1.0;
        end if;

        if ( Y = 1.0) then
                return (X);
        end if;

        -- Get value for general case
        return EXP (Y * LOG (X));
    end "**";

    function EXP  (X : in REAL ) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) This function computes the exponential using the following
        --           series:
        --                exp(x) = 1 + x + x**2/2! + x**3/3! + ... ; |x| < 1.0
        --           and reduces argument X to take advantage of exp(x+y) =
        --           exp(x)*exp(y)
        --
        --        b) This implementation limits X to be less than LOG(REAL'HIGH)
        --           to avoid overflow.  Returns REAL'HIGH when X reaches that
        --           limit
        --
        constant EPS : REAL := BASE_EPS*BASE_EPS*BASE_EPS;-- Precision criteria

            variable RECIPROCAL: BOOLEAN := X < 0.0;-- Check sign of argument
            variable XLOCAL : REAL := ABS(X);       -- Use positive value
            variable OLDVAL: REAL ;
            variable COUNT: INTEGER ;
            variable NEWVAL: REAL ;
            variable LAST_TERM: REAL ;
        variable FACTOR : REAL := 1.0;

     begin
            -- Compute value for special cases
        if X = 0.0 then
                return 1.0;
        end if;

        if  XLOCAL = 1.0  then
                if RECIPROCAL then
                        return MATH_1_OVER_E;
                else
                        return MATH_E;
                end if;
        end if;

        if  XLOCAL = 2.0  then
                if RECIPROCAL then
                        return 1.0/MATH_E_P2;
                else
                        return MATH_E_P2;
                end if;
        end if;

        if  XLOCAL = 10.0  then
                if RECIPROCAL then
                        return 1.0/MATH_E_P10;
                else
                        return MATH_E_P10;
                end if;
        end if;

        if XLOCAL > LOG(REAL'HIGH) then
                if RECIPROCAL then
                        return 0.0;
                else
                        assert FALSE
                                report "X > LOG(REAL'HIGH) in EXP(X)"
                                severity NOTE;
                        return REAL'HIGH;
                end if;
        end if;

        -- Reduce argument to ABS(X) < 1.0
        while XLOCAL > 10.0 loop
                XLOCAL := XLOCAL - 10.0;
                FACTOR := FACTOR*MATH_E_P10;
        end loop;

        while XLOCAL > 1.0 loop
                XLOCAL := XLOCAL - 1.0;
                FACTOR := FACTOR*MATH_E;
        end loop;

        -- Compute value for case 0 < XLOCAL < 1
        OLDVAL := 1.0;
        LAST_TERM := XLOCAL;
        NEWVAL:= OLDVAL + LAST_TERM;
        COUNT := 2;

        -- Check for relative and absolute errors and max count
        while ( ( (ABS((NEWVAL - OLDVAL)/NEWVAL) > EPS) OR
                  (ABS(NEWVAL - OLDVAL) > EPS) ) AND
                  (COUNT < MAX_COUNT ) ) loop
                OLDVAL := NEWVAL;
                LAST_TERM := LAST_TERM*(XLOCAL / (REAL(COUNT)));
                NEWVAL := OLDVAL + LAST_TERM;
                COUNT := COUNT + 1;
        end loop;

        -- Compute final value using exp(x+y) = exp(x)*exp(y)
        NEWVAL := NEWVAL*FACTOR;

        if RECIPROCAL then
                NEWVAL := 1.0/NEWVAL;
        end if;

        return NEWVAL;
     end EXP;


    --
    -- Auxiliary Functions to Compute LOG
    --
    function ILOGB(X: in REAL) return INTEGER IS
        -- Description:
        --        Returns n such that -1 <= ABS(X)/2^n < 2
        -- Notes:
        --        None

        variable N: INTEGER := 0;
        variable Y: REAL := ABS(X);

    begin
        if(Y = 1.0 or Y = 0.0) then
                return 0;
        end if;

        if( Y > 1.0) then
                while Y >= 2.0 loop
                        Y := Y/2.0;
                        N := N+1;
                end loop;
                return N;
        end if;

        -- O < Y < 1
        while Y < 1.0 loop
                Y := Y*2.0;
                N := N -1;
        end loop;
        return N;
    end ILOGB;

    function LDEXP(X: in REAL; N: in INTEGER) RETURN REAL IS
        -- Description:
        --        Returns X*2^n
        -- Notes:
        --         None
    begin
        return X*(2.0 ** N);
    end LDEXP;

    function LOG (X : in REAL ) return REAL IS
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        --
        -- Notes:
        --        a) Returns REAL'LOW on error
        --
        -- Copyright (c) 1992 Regents of the University of California.
        -- All rights reserved.
        --
        -- Redistribution and use in source and binary forms, with or without
        -- modification, are permitted provided that the following conditions
        -- are met:
        -- 1. Redistributions of source code must retain the above copyright
        -- notice, this list of conditions and the following disclaimer.
        -- 2. Redistributions in binary form must reproduce the above copyright
        -- notice, this list of conditions and the following disclaimer in the
        -- documentation and/or other materials provided with the distribution.
        -- 3. All advertising materials mentioning features or use of this
        -- software must display the following acknowledgement:
        -- This product includes software developed by the University of
        -- California, Berkeley and its contributors.
        -- 4. Neither the name of the University nor the names of its
        -- contributors may be used to endorse or promote products derived
        -- from this software without specific prior written permission.
        --
        -- THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS''
        -- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
        -- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
        -- PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR
        -- CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
        -- EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
        -- PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
        -- PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
        -- OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
        -- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
        -- USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
        -- DAMAGE.
        --
        -- NOTE: This VHDL version was generated using the C version of the
        --         original function by the IEEE VHDL Mathematical Package
        --         Working Group (CS/JT)

        constant N: INTEGER := 128;

        -- Table of log(Fj) = logF_head[j] + logF_tail[j], for Fj = 1+j/128.
        -- Used for generation of extend precision logarithms.
        -- The constant 35184372088832 is 2^45, so the divide is exact.
        -- It ensures correct reading of logF_head, even for inaccurate
        -- decimal-to-binary conversion routines. (Everybody gets the
        -- right answer for INTEGERs less than 2^53.)
        -- Values for LOG(F) were generated using error < 10^-57 absolute
        -- with the bc -l package.

        type REAL_VECTOR is array (NATURAL range <>) of REAL;

        constant A1:REAL := 0.08333333333333178827;
        constant A2:REAL := 0.01250000000377174923;
        constant A3:REAL := 0.002232139987919447809;
        constant A4:REAL := 0.0004348877777076145742;

        constant LOGF_HEAD: REAL_VECTOR(0 TO N) := (
                0.0,
                0.007782140442060381246,
                0.015504186535963526694,
                0.023167059281547608406,
                0.030771658666765233647,
                0.038318864302141264488,
                0.045809536031242714670,
                0.053244514518837604555,
                0.060624621816486978786,
                0.067950661908525944454,
                0.075223421237524235039,
                0.082443669210988446138,
                0.089612158689760690322,
                0.096729626458454731618,
                0.103796793681567578460,
                0.110814366340264314203,
                0.117783035656430001836,
                0.124703478501032805070,
                0.131576357788617315236,
                0.138402322859292326029,
                0.145182009844575077295,
                0.151916042025732167530,
                0.158605030176659056451,
                0.165249572895390883786,
                0.171850256926518341060,
                0.178407657472689606947,
                0.184922338493834104156,
                0.191394852999565046047,
                0.197825743329758552135,
                0.204215541428766300668,
                0.210564769107350002741,
                0.216873938300523150246,
                0.223143551314024080056,
                0.229374101064877322642,
                0.235566071312860003672,
                0.241719936886966024758,
                0.247836163904594286577,
                0.253915209980732470285,
                0.259957524436686071567,
                0.265963548496984003577,
                0.271933715484010463114,
                0.277868451003087102435,
                0.283768173130738432519,
                0.289633292582948342896,
                0.295464212893421063199,
                0.301261330578199704177,
                0.307025035294827830512,
                0.312755710004239517729,
                0.318453731118097493890,
                0.324119468654316733591,
                0.329753286372579168528,
                0.335355541920762334484,
                0.340926586970454081892,
                0.346466767346100823488,
                0.351976423156884266063,
                0.357455888922231679316,
                0.362905493689140712376,
                0.368325561158599157352,
                0.373716409793814818840,
                0.379078352934811846353,
                0.384411698910298582632,
                0.389716751140440464951,
                0.394993808240542421117,
                0.400243164127459749579,
                0.405465108107819105498,
                0.410659924985338875558,
                0.415827895143593195825,
                0.420969294644237379543,
                0.426084395310681429691,
                0.431173464818130014464,
                0.436236766774527495726,
                0.441274560805140936281,
                0.446287102628048160113,
                0.451274644139630254358,
                0.456237433481874177232,
                0.461175715122408291790,
                0.466089729924533457960,
                0.470979715219073113985,
                0.475845904869856894947,
                0.480688529345570714212,
                0.485507815781602403149,
                0.490303988045525329653,
                0.495077266798034543171,
                0.499827869556611403822,
                0.504556010751912253908,
                0.509261901790523552335,
                0.513945751101346104405,
                0.518607764208354637958,
                0.523248143765158602036,
                0.527867089620485785417,
                0.532464798869114019908,
                0.537041465897345915436,
                0.541597282432121573947,
                0.546132437597407260909,
                0.550647117952394182793,
                0.555141507540611200965,
                0.559615787935399566777,
                0.564070138285387656651,
                0.568504735352689749561,
                0.572919753562018740922,
                0.577315365035246941260,
                0.581691739635061821900,
                0.586049045003164792433,
                0.590387446602107957005,
                0.594707107746216934174,
                0.599008189645246602594,
                0.603290851438941899687,
                0.607555250224322662688,
                0.611801541106615331955,
                0.616029877215623855590,
                0.620240409751204424537,
                0.624433288012369303032,
                0.628608659422752680256,
                0.632766669570628437213,
                0.636907462236194987781,
                0.641031179420679109171,
                0.645137961373620782978,
                0.649227946625615004450,
                0.653301272011958644725,
                0.657358072709030238911,
                0.661398482245203922502,
                0.665422632544505177065,
                0.669430653942981734871,
                0.673422675212350441142,
                0.677398823590920073911,
                0.681359224807238206267,
                0.685304003098281100392,
                0.689233281238557538017,
                0.693147180560117703862);

        constant LOGF_TAIL: REAL_VECTOR(0 TO N) := (
                0.0,
                -0.00000000000000543229938420049,
                0.00000000000000172745674997061,
                -0.00000000000001323017818229233,
                -0.00000000000001154527628289872,
                -0.00000000000000466529469958300,
                0.00000000000005148849572685810,
                -0.00000000000002532168943117445,
                -0.00000000000005213620639136504,
                -0.00000000000001819506003016881,
                0.00000000000006329065958724544,
                0.00000000000008614512936087814,
                -0.00000000000007355770219435028,
                0.00000000000009638067658552277,
                0.00000000000007598636597194141,
                0.00000000000002579999128306990,
                -0.00000000000004654729747598444,
                -0.00000000000007556920687451336,
                0.00000000000010195735223708472,
                -0.00000000000017319034406422306,
                -0.00000000000007718001336828098,
                0.00000000000010980754099855238,
                -0.00000000000002047235780046195,
                -0.00000000000008372091099235912,
                0.00000000000014088127937111135,
                0.00000000000012869017157588257,
                0.00000000000017788850778198106,
                0.00000000000006440856150696891,
                0.00000000000016132822667240822,
                -0.00000000000007540916511956188,
                -0.00000000000000036507188831790,
                0.00000000000009120937249914984,
                0.00000000000018567570959796010,
                -0.00000000000003149265065191483,
                -0.00000000000009309459495196889,
                0.00000000000017914338601329117,
                -0.00000000000001302979717330866,
                0.00000000000023097385217586939,
                0.00000000000023999540484211737,
                0.00000000000015393776174455408,
                -0.00000000000036870428315837678,
                0.00000000000036920375082080089,
                -0.00000000000009383417223663699,
                0.00000000000009433398189512690,
                0.00000000000041481318704258568,
                -0.00000000000003792316480209314,
                0.00000000000008403156304792424,
                -0.00000000000034262934348285429,
                0.00000000000043712191957429145,
                -0.00000000000010475750058776541,
                -0.00000000000011118671389559323,
                0.00000000000037549577257259853,
                0.00000000000013912841212197565,
                0.00000000000010775743037572640,
                0.00000000000029391859187648000,
                -0.00000000000042790509060060774,
                0.00000000000022774076114039555,
                0.00000000000010849569622967912,
                -0.00000000000023073801945705758,
                0.00000000000015761203773969435,
                0.00000000000003345710269544082,
                -0.00000000000041525158063436123,
                0.00000000000032655698896907146,
                -0.00000000000044704265010452446,
                0.00000000000034527647952039772,
                -0.00000000000007048962392109746,
                0.00000000000011776978751369214,
                -0.00000000000010774341461609578,
                0.00000000000021863343293215910,
                0.00000000000024132639491333131,
                0.00000000000039057462209830700,
                -0.00000000000026570679203560751,
                0.00000000000037135141919592021,
                -0.00000000000017166921336082431,
                -0.00000000000028658285157914353,
                -0.00000000000023812542263446809,
                0.00000000000006576659768580062,
                -0.00000000000028210143846181267,
                0.00000000000010701931762114254,
                0.00000000000018119346366441110,
                0.00000000000009840465278232627,
                -0.00000000000033149150282752542,
                -0.00000000000018302857356041668,
                -0.00000000000016207400156744949,
                0.00000000000048303314949553201,
                -0.00000000000071560553172382115,
                0.00000000000088821239518571855,
                -0.00000000000030900580513238244,
                -0.00000000000061076551972851496,
                0.00000000000035659969663347830,
                0.00000000000035782396591276383,
                -0.00000000000046226087001544578,
                0.00000000000062279762917225156,
                0.00000000000072838947272065741,
                0.00000000000026809646615211673,
                -0.00000000000010960825046059278,
                0.00000000000002311949383800537,
                -0.00000000000058469058005299247,
                -0.00000000000002103748251144494,
                -0.00000000000023323182945587408,
                -0.00000000000042333694288141916,
                -0.00000000000043933937969737844,
                0.00000000000041341647073835565,
                0.00000000000006841763641591466,
                0.00000000000047585534004430641,
                0.00000000000083679678674757695,
                -0.00000000000085763734646658640,
                0.00000000000021913281229340092,
                -0.00000000000062242842536431148,
                -0.00000000000010983594325438430,
                0.00000000000065310431377633651,
                -0.00000000000047580199021710769,
                -0.00000000000037854251265457040,
                0.00000000000040939233218678664,
                0.00000000000087424383914858291,
                0.00000000000025218188456842882,
                -0.00000000000003608131360422557,
                -0.00000000000050518555924280902,
                0.00000000000078699403323355317,
                -0.00000000000067020876961949060,
                0.00000000000016108575753932458,
                0.00000000000058527188436251509,
                -0.00000000000035246757297904791,
                -0.00000000000018372084495629058,
                0.00000000000088606689813494916,
                0.00000000000066486268071468700,
                0.00000000000063831615170646519,
                0.00000000000025144230728376072,
                -0.00000000000017239444525614834);

        variable M, J:INTEGER;
        variable F1, F2, G, Q, U, U2, V: REAL;
        variable ZERO: REAL := 0.0;--Made variable so no constant folding occurs
        variable ONE: REAL := 1.0; --Made variable so no constant folding occurs

        -- double logb(), ldexp();

        variable U1:REAL;

     begin

        -- Check validity of argument
        if ( X <= 0.0 ) then
                assert FALSE
                        report "X <= 0.0 in LOG(X)"
                        severity ERROR;
                return(REAL'LOW);
        end if;

        -- Compute value for special cases
        if ( X = 1.0 ) then
                return 0.0;
        end if;

        if ( X = MATH_E ) then
                return 1.0;
        end if;

        -- Argument reduction: 1 <= g < 2; x/2^m = g;
        -- y = F*(1 + f/F) for |f| <= 2^-8

        M := ILOGB(X);
        G := LDEXP(X, -M);
        J := INTEGER(REAL(N)*(G-1.0)); -- C code adds 0.5 for rounding
        F1 := (1.0/REAL(N)) * REAL(J) + 1.0; --F1*128 is an INTEGER in [128,512]
        F2 := G - F1;

        -- Approximate expansion for log(1+f2/F1) ~= u + q
        G := 1.0/(2.0*F1+F2);
        U := 2.0*F2*G;
        V := U*U;
        Q := U*V*(A1 + V*(A2 + V*(A3 + V*A4)));

        -- Case 1: u1 = u rounded to 2^-43 absolute. Since u < 2^-8,
        --       u1 has at most 35 bits, and F1*u1 is exact, as F1 has < 8 bits.
        --       It also adds exactly to |m*log2_hi + log_F_head[j] | < 750.
        --
        if ( J /= 0 or M /= 0) then
                U1 := U + 513.0;
                U1 := U1 - 513.0;

                -- Case 2: |1-x| < 1/256. The m- and j- dependent terms are zero
                --        u1 = u to 24 bits.
                --
        else
                U1 := U;
                --TRUNC(U1); --In c this is u1 = (double) (float) (u1)
        end if;

        U2 := (2.0*(F2 - F1*U1) - U1*F2) * G;
        -- u1 + u2 = 2f/(2F+f) to extra precision.

        -- log(x) = log(2^m*F1*(1+f2/F1)) =
        -- (m*log2_hi+LOGF_HEAD(j)+u1) + (m*log2_lo+LOGF_TAIL(j)+q);
        -- (exact) + (tiny)

        U1 := U1 + REAL(M)*LOGF_HEAD(N) + LOGF_HEAD(J);        -- Exact
        U2 := (U2 + LOGF_TAIL(J)) + Q;        -- Tiny
        U2 := U2 + LOGF_TAIL(N)*REAL(M);
        return (U1 + U2);
    end LOG;


    function LOG2 (X: in REAL) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) Returns REAL'LOW on error
    begin
        -- Check validity of arguments
        if ( X <= 0.0 )  then
                assert FALSE
                        report "X <= 0.0 in LOG2(X)"
                        severity ERROR;
                return(REAL'LOW);
        end if;

        -- Compute value for special cases
        if ( X = 1.0 ) then
                return 0.0;
        end if;

        if ( X = 2.0 ) then
                return 1.0;
        end if;

        -- Compute value for general case
        return ( MATH_LOG2_OF_E*LOG(X) );
    end LOG2;


    function LOG10 (X: in REAL) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) Returns REAL'LOW on error
    begin
        -- Check validity of arguments
        if ( X <= 0.0 )  then
                   assert FALSE
                        report "X <= 0.0 in LOG10(X)"
                        severity ERROR;
                   return(REAL'LOW);
        end if;

        -- Compute value for special cases
        if ( X = 1.0 ) then
                return 0.0;
        end if;

        if ( X = 10.0 ) then
                return 1.0;
        end if;

        -- Compute value for general case
        return ( MATH_LOG10_OF_E*LOG(X) );
    end LOG10;


    function LOG (X: in REAL; BASE: in REAL) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) Returns REAL'LOW on error
    begin
        -- Check validity of arguments
        if ( X <= 0.0 )  then
                 assert FALSE
                        report "X <= 0.0 in LOG(X, BASE)"
                        severity ERROR;
                 return(REAL'LOW);
        end if;

        if ( BASE <= 0.0 or BASE = 1.0 )  then
                 assert FALSE
                        report "BASE <= 0.0 or BASE = 1.0 in LOG(X, BASE)"
                        severity ERROR;
                 return(REAL'LOW);
        end if;

        -- Compute value for special cases
        if ( X = 1.0 ) then
                return 0.0;
        end if;

        if ( X = BASE ) then
                return 1.0;
        end if;

        -- Compute value for general case
        return ( LOG(X)/LOG(BASE));
    end LOG;


    function  SIN (X : in REAL ) return REAL is
        -- Description:
        --         See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --         a) SIN(-X) = -SIN(X)
        --         b) SIN(X) = X if ABS(X) < EPS
        --         c) SIN(X) = X - X**3/3! if EPS < ABS(X) < BASE_EPS
        --         d) SIN(MATH_PI_OVER_2 - X) = COS(X)
        --         e) COS(X) = 1.0 - 0.5*X**2 if ABS(X) < EPS
        --         f) COS(X) = 1.0 - 0.5*X**2 + (X**4)/4! if
        --                                         EPS< ABS(X) <BASE_EPS

        constant EPS : REAL := BASE_EPS*BASE_EPS; -- Convergence criteria

        variable N : INTEGER;
        variable NEGATIVE : BOOLEAN := X < 0.0;
        variable XLOCAL : REAL := ABS(X) ;
        variable VALUE: REAL;
        variable TEMP : REAL;

    begin
        -- Make XLOCAL < MATH_2_PI
        if XLOCAL > MATH_2_PI then
                TEMP := FLOOR(XLOCAL/MATH_2_PI);
                XLOCAL := XLOCAL - TEMP*MATH_2_PI;
        end if;

        if XLOCAL < 0.0 then
                assert FALSE
                        report "XLOCAL <= 0.0 after reduction in SIN(X)"
                        severity ERROR;
                XLOCAL := -XLOCAL;
        end if;

        -- Compute value for special cases
        if XLOCAL = 0.0  or XLOCAL = MATH_2_PI or XLOCAL = MATH_PI  then
                return 0.0;
        end if;

        if  XLOCAL = MATH_PI_OVER_2 then
                if NEGATIVE then
                        return -1.0;
                else
                        return 1.0;
                end if;
        end if;

        if  XLOCAL = MATH_3_PI_OVER_2 then
                if NEGATIVE then
                        return 1.0;
                else
                        return -1.0;
                end if;
        end if;

        if XLOCAL < EPS then
                if NEGATIVE then
                        return -XLOCAL;
                else
                        return XLOCAL;
                end if;
        else
                if XLOCAL < BASE_EPS then
                        TEMP := XLOCAL - (XLOCAL*XLOCAL*XLOCAL)/6.0;
                        if NEGATIVE then
                                return -TEMP;
                        else
                                return TEMP;
                        end if;
                end if;
        end if;

        TEMP := MATH_PI - XLOCAL;
        if ABS(TEMP) < EPS then
                if NEGATIVE then
                        return -TEMP;
                else
                        return TEMP;
                end if;
        else
                if ABS(TEMP) < BASE_EPS then
                        TEMP := TEMP - (TEMP*TEMP*TEMP)/6.0;
                        if NEGATIVE then
                                return -TEMP;
                        else
                                return TEMP;
                        end if;
                end if;
        end if;

        TEMP := MATH_2_PI - XLOCAL;
        if ABS(TEMP) < EPS then
                if NEGATIVE then
                        return TEMP;
                else
                        return -TEMP;
                end if;
        else
                if ABS(TEMP) < BASE_EPS then
                        TEMP := TEMP - (TEMP*TEMP*TEMP)/6.0;
                        if NEGATIVE then
                                return TEMP;
                        else
                                return -TEMP;
                        end if;
                end if;
        end if;

        TEMP := ABS(MATH_PI_OVER_2 - XLOCAL);
        if TEMP < EPS then
                TEMP := 1.0 - TEMP*TEMP*0.5;
                if NEGATIVE then
                        return -TEMP;
                else
                        return TEMP;
                end if;
        else
                if TEMP < BASE_EPS then
                        TEMP := 1.0 -TEMP*TEMP*0.5 + TEMP*TEMP*TEMP*TEMP/24.0;
                        if NEGATIVE then
                                return -TEMP;
                        else
                                return TEMP;
                        end if;
                end if;
        end if;

        TEMP := ABS(MATH_3_PI_OVER_2 - XLOCAL);
        if TEMP < EPS then
                TEMP := 1.0 - TEMP*TEMP*0.5;
                if NEGATIVE then
                        return TEMP;
                else
                        return -TEMP;
                end if;
        else
                if TEMP < BASE_EPS then
                        TEMP := 1.0 -TEMP*TEMP*0.5 + TEMP*TEMP*TEMP*TEMP/24.0;
                        if NEGATIVE then
                                return TEMP;
                        else
                                return -TEMP;
                        end if;
                end if;
        end if;

        -- Compute value for general cases
        if ((XLOCAL < MATH_PI_OVER_2 ) and (XLOCAL > 0.0)) then
                 VALUE:=  CORDIC( KC, 0.0, x, 27, ROTATION)(1);
        end if;

        N := INTEGER ( FLOOR(XLOCAL/MATH_PI_OVER_2));
        case QUADRANT( N mod 4) is
           when 0 =>
                VALUE := CORDIC( KC, 0.0, XLOCAL, 27, ROTATION)(1);
           when 1 =>
                VALUE := CORDIC( KC, 0.0, XLOCAL - MATH_PI_OVER_2, 27,
                                                                ROTATION)(0);
           when 2 =>
                VALUE := -CORDIC( KC, 0.0, XLOCAL - MATH_PI, 27, ROTATION)(1);
           when 3 =>
                VALUE := -CORDIC( KC, 0.0, XLOCAL - MATH_3_PI_OVER_2, 27,
                                                                ROTATION)(0);
        end case;

        if NEGATIVE then
                return -VALUE;
        else
                return VALUE;
        end if;
    end SIN;


   function COS (X : in REAL) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) COS(-X) = COS(X)
        --        b) COS(X) = SIN(MATH_PI_OVER_2 - X)
        --        c) COS(MATH_PI + X)  = -COS(X)
        --        d) COS(X) = 1.0 - X*X/2.0 if ABS(X) < EPS
        --        e) COS(X) = 1.0 - 0.5*X**2 + (X**4)/4! if
        --                                           EPS< ABS(X) <BASE_EPS
        --
        constant EPS : REAL := BASE_EPS*BASE_EPS;

        variable XLOCAL : REAL := ABS(X);
        variable VALUE: REAL;
        variable TEMP : REAL;

    begin
        -- Make XLOCAL < MATH_2_PI
        if XLOCAL > MATH_2_PI then
                TEMP := FLOOR(XLOCAL/MATH_2_PI);
                XLOCAL := XLOCAL - TEMP*MATH_2_PI;
        end if;

        if XLOCAL < 0.0 then
                assert FALSE
                        report "XLOCAL <= 0.0 after reduction in COS(X)"
                        severity ERROR;
                XLOCAL := -XLOCAL;
        end if;

        -- Compute value for special cases
        if XLOCAL = 0.0  or XLOCAL = MATH_2_PI then
                return 1.0;
        end if;

        if  XLOCAL = MATH_PI then
                return -1.0;
        end if;

        if XLOCAL = MATH_PI_OVER_2 or XLOCAL = MATH_3_PI_OVER_2 then
                return 0.0;
        end if;

        TEMP := ABS(XLOCAL);
        if ( TEMP < EPS) then
                return (1.0 - 0.5*TEMP*TEMP);
        else
                if (TEMP < BASE_EPS) then
                        return (1.0 -0.5*TEMP*TEMP + TEMP*TEMP*TEMP*TEMP/24.0);
                end if;
        end if;

        TEMP := ABS(XLOCAL -MATH_2_PI);
        if ( TEMP < EPS) then
                return (1.0 - 0.5*TEMP*TEMP);
        else
                if (TEMP < BASE_EPS) then
                        return (1.0 -0.5*TEMP*TEMP + TEMP*TEMP*TEMP*TEMP/24.0);
                end if;
        end if;

        TEMP := ABS (XLOCAL - MATH_PI);
        if TEMP < EPS then
                return (-1.0 + 0.5*TEMP*TEMP);
        else
                if (TEMP < BASE_EPS) then
                        return (-1.0 +0.5*TEMP*TEMP - TEMP*TEMP*TEMP*TEMP/24.0);
                end if;
        end if;

        -- Compute value for general cases
        return SIN(MATH_PI_OVER_2 - XLOCAL);
   end COS;

   function TAN (X : in REAL) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) TAN(0.0) = 0.0
        --        b) TAN(-X) = -TAN(X)
        --        c) Returns REAL'LOW on error if X < 0.0
        --        d) Returns REAL'HIGH on error if X > 0.0

        variable NEGATIVE : BOOLEAN := X < 0.0;
        variable XLOCAL : REAL := ABS(X) ;
        variable VALUE: REAL;
        variable TEMP : REAL;

    begin
        -- Make 0.0 <= XLOCAL <= MATH_2_PI
        if XLOCAL > MATH_2_PI then
                TEMP := FLOOR(XLOCAL/MATH_2_PI);
                XLOCAL := XLOCAL - TEMP*MATH_2_PI;
        end if;

        if XLOCAL < 0.0 then
                assert FALSE
                        report "XLOCAL <= 0.0 after reduction in TAN(X)"
                        severity ERROR;
                XLOCAL := -XLOCAL;
        end if;

        -- Check validity of argument
        if XLOCAL = MATH_PI_OVER_2 then
                assert FALSE
                        report "X is a multiple of MATH_PI_OVER_2 in TAN(X)"
                        severity ERROR;
                if NEGATIVE then
                        return(REAL'LOW);
                else
                        return(REAL'HIGH);
                end if;
        end if;

        if XLOCAL = MATH_3_PI_OVER_2 then
                assert FALSE
                        report "X is a multiple of MATH_3_PI_OVER_2 in TAN(X)"
                        severity ERROR;
                if NEGATIVE then
                        return(REAL'HIGH);
                else
                        return(REAL'LOW);
                end if;
        end if;

        -- Compute value for special cases
        if XLOCAL = 0.0 or XLOCAL = MATH_PI then
                return 0.0;
        end if;

        -- Compute value for general cases
        VALUE := SIN(XLOCAL)/COS(XLOCAL);
        if NEGATIVE then
                return -VALUE;
        else
                return VALUE;
        end if;
   end TAN;

   function ARCSIN (X : in REAL ) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) ARCSIN(-X) = -ARCSIN(X)
        --        b) Returns X on error

        variable NEGATIVE : BOOLEAN := X < 0.0;
        variable XLOCAL : REAL := ABS(X);
        variable VALUE : REAL;

   begin
      -- Check validity of arguments
      if XLOCAL > 1.0 then
         assert FALSE
                report "ABS(X) > 1.0 in ARCSIN(X)"
                severity ERROR;
         return X;
      end if;

      -- Compute value for special cases
      if XLOCAL = 0.0 then
         return 0.0;
      elsif XLOCAL = 1.0 then
         if NEGATIVE then
                return -MATH_PI_OVER_2;
         else
                return MATH_PI_OVER_2;
         end if;
      end if;

      -- Compute value for general cases
      if XLOCAL < 0.9 then
         VALUE := ARCTAN(XLOCAL/(SQRT(1.0 - XLOCAL*XLOCAL)));
      else
         VALUE := MATH_PI_OVER_2 - ARCTAN(SQRT(1.0 - XLOCAL*XLOCAL)/XLOCAL);
      end if;

      if NEGATIVE then
         VALUE := -VALUE;
      end if;

      return VALUE;
   end ARCSIN;

   function ARCCOS (X : in REAL) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) ARCCOS(-X) = MATH_PI - ARCCOS(X)
        --        b) Returns X on error

        variable NEGATIVE : BOOLEAN := X < 0.0;
        variable XLOCAL : REAL := ABS(X);
        variable VALUE : REAL;

   begin
      -- Check validity of argument
      if XLOCAL > 1.0 then
         assert FALSE
                report "ABS(X) > 1.0 in ARCCOS(X)"
                severity ERROR;
         return X;
      end if;

      -- Compute value for special cases
      if X = 1.0 then
         return 0.0;
      elsif X = 0.0 then
         return MATH_PI_OVER_2;
      elsif X = -1.0 then
         return MATH_PI;
      end if;

      -- Compute value for general cases
      if XLOCAL > 0.9 then
         VALUE := ARCTAN(SQRT(1.0 - XLOCAL*XLOCAL)/XLOCAL);
      else
         VALUE := MATH_PI_OVER_2 - ARCTAN(XLOCAL/SQRT(1.0 - XLOCAL*XLOCAL));
      end if;


      if NEGATIVE then
         VALUE := MATH_PI - VALUE;
      end if;

      return VALUE;
   end ARCCOS;


   function ARCTAN (Y : in REAL) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) ARCTAN(-Y) = -ARCTAN(Y)
        --        b) ARCTAN(Y) = -ARCTAN(1.0/Y) + MATH_PI_OVER_2 for |Y| > 1.0
        --        c) ARCTAN(Y) = Y for |Y| < EPS

        constant EPS : REAL := BASE_EPS*BASE_EPS*BASE_EPS;

        variable NEGATIVE : BOOLEAN := Y < 0.0;
        variable RECIPROCAL : BOOLEAN;
        variable YLOCAL : REAL := ABS(Y);
        variable VALUE : REAL;

   begin
      -- Make argument |Y| <=1.0
      if YLOCAL > 1.0 then
                YLOCAL := 1.0/YLOCAL;
                RECIPROCAL := TRUE;
      else
                RECIPROCAL := FALSE;
      end if;

      -- Compute value for special cases
      if YLOCAL = 0.0 then
         if RECIPROCAL then
                if NEGATIVE then
                        return (-MATH_PI_OVER_2);
                else
                        return (MATH_PI_OVER_2);
                end if;
         else
                return 0.0;
         end if;
      end if;

      if YLOCAL < EPS then
         if NEGATIVE then
                if RECIPROCAL then
                        return (-MATH_PI_OVER_2 + YLOCAL);
                else
                        return -YLOCAL;
                end if;
         else
                if RECIPROCAL then
                        return (MATH_PI_OVER_2 - YLOCAL);
                else
                        return YLOCAL;
                end if;
         end if;
      end if;

      -- Compute value for general cases
      VALUE :=  CORDIC( 1.0, YLOCAL, 0.0, 27, VECTORING )(2);

      if RECIPROCAL then
         VALUE := MATH_PI_OVER_2 - VALUE;
      end if;

      if NEGATIVE then
        VALUE := -VALUE;
      end if;

      return VALUE;
   end ARCTAN;


   function ARCTAN (Y : in REAL; X : in REAL) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --         a) Returns 0.0 on error

        variable YLOCAL : REAL;
        variable VALUE : REAL;
   begin

     -- Check validity of arguments
     if (Y = 0.0 and X = 0.0 ) then
           assert FALSE report
                "ARCTAN(0.0, 0.0) is undetermined"
                severity ERROR;
           return 0.0;
     end if;

     -- Compute value for special cases
     if Y = 0.0 then
        if X > 0.0 then
           return 0.0;
        else
           return MATH_PI;
        end if;
     end if;

     if X = 0.0 then
        if Y > 0.0 then
           return MATH_PI_OVER_2;
        else
           return -MATH_PI_OVER_2;
        end if;
     end if;


     -- Compute value for general cases
     YLOCAL := ABS(Y/X);

     VALUE := ARCTAN(YLOCAL);

     if X < 0.0 then
         VALUE := MATH_PI - VALUE;
     end if;

     if Y < 0.0 then
         VALUE := -VALUE;
     end if;

     return VALUE;
   end ARCTAN;


    function SINH (X : in REAL) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) Returns (EXP(X) - EXP(-X))/2.0
        --        b) SINH(-X) = SINH(X)

        variable NEGATIVE : BOOLEAN := X < 0.0;
        variable XLOCAL : REAL := ABS(X);
        variable TEMP : REAL;
        variable VALUE : REAL;

    begin
        -- Compute value for special cases
        if XLOCAL = 0.0 then
                return 0.0;
        end if;

        -- Compute value for general cases
        TEMP := EXP(XLOCAL);
        VALUE := (TEMP - 1.0/TEMP)*0.5;

         if NEGATIVE then
                VALUE := -VALUE;
        end if;

        return VALUE;
    end SINH;

    function  COSH (X : in REAL) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) Returns (EXP(X) + EXP(-X))/2.0
        --        b) COSH(-X) = COSH(X)

        variable XLOCAL : REAL := ABS(X);
        variable TEMP : REAL;
        variable VALUE : REAL;
    begin
        -- Compute value for special cases
        if XLOCAL = 0.0 then
                return 1.0;
        end if;


        -- Compute value for general cases
        TEMP := EXP(XLOCAL);
        VALUE := (TEMP + 1.0/TEMP)*0.5;

        return VALUE;
    end COSH;

    function  TANH (X : in REAL) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) Returns (EXP(X) - EXP(-X))/(EXP(X) + EXP(-X))
        --        b) TANH(-X) = -TANH(X)

        variable NEGATIVE : BOOLEAN := X < 0.0;
        variable XLOCAL : REAL := ABS(X);
        variable TEMP : REAL;
        variable VALUE : REAL;

    begin
        -- Compute value for special cases
        if XLOCAL = 0.0 then
                return 0.0;
        end if;

        -- Compute value for general cases
        TEMP := EXP(XLOCAL);
        VALUE := (TEMP - 1.0/TEMP)/(TEMP + 1.0/TEMP);

        if NEGATIVE then
            return -VALUE;
        else
            return VALUE;
        end if;
    end TANH;

    function ARCSINH (X : in REAL) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) Returns LOG( X + SQRT( X*X + 1.0))

    begin
        -- Compute value for special cases
        if X = 0.0 then
                return 0.0;
        end if;

        -- Compute value for general cases
        return ( LOG( X + SQRT( X*X + 1.0)) );
    end ARCSINH;



   function ARCCOSH (X : in REAL) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) Returns LOG( X + SQRT( X*X - 1.0));   X >= 1.0
        --        b) Returns X on error

    begin
        -- Check validity of arguments
        if X < 1.0 then
                 assert FALSE
                        report "X < 1.0 in ARCCOSH(X)"
                        severity ERROR;
                 return X;
        end if;

        -- Compute value for special cases
        if X = 1.0 then
                return 0.0;
        end if;

        -- Compute value for general cases
        return ( LOG( X + SQRT( X*X - 1.0)));
    end ARCCOSH;

    function ARCTANH (X : in REAL) return REAL is
        -- Description:
        --        See function declaration in IEEE Std 1076.2-1996
        -- Notes:
        --        a) Returns (LOG( (1.0 + X)/(1.0 - X)))/2.0 ; | X | < 1.0
        --        b) Returns X on error
    begin
        -- Check validity of arguments
        if ABS(X) >= 1.0 then
                assert FALSE
                        report "ABS(X) >= 1.0 in ARCTANH(X)"
                        severity ERROR;
                return X;
        end if;

        -- Compute value for special cases
        if X = 0.0 then
                return 0.0;
        end if;

        -- Compute value for general cases
        return( 0.5*LOG( (1.0+X)/(1.0-X) ) );
    end ARCTANH;

end  MATH_REAL;
