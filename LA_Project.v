`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Author: Dhwani Mehta - (201501054)
// 
// Create Date:    10:04:03 10/04/2016 
// Design Name: 
// Module Name:    matrix_inv 
// Project Name: Project to invert the matrix using RREF method
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module matrx_inv(a11, a12, a13, a14, a15, a21, a22, a23, a24,a25, a31, a32, a33, a34, a35, 
a41, a42, a43, a44, a45, a51, a52, a53, a54, a55, i11, i12, i13, i14, i15, i21, i22,i23, i24,i25, i31, i32, i33, i34, i35, 
i41, i42, i43, i44, i45, i51, i52, i53, i54, i55 );

input [31:0] a11, a12, a13, a14, a15, a21, a22, a23, a24,a25, a31, a32, a33, a34, a35, 
a41, a42, a43, a44, a45, a51, a52, a53, a54, a55;

output [31:0]i11, i12, i13, i14, i15, i21, i22,i23, i24,i25, i31, i32, i33, i34, i35, 
i41, i42, i43, i44, i45, i51, i52, i53, i54, i55;


wire [31:0] a_out11, a_out12, a_out13, a_out14, a_out15, a_out21, a_out22, a_out23, a_out24,a_out25, a_out31, a_out32, a_out33, a_out34, a_out35, 
a_out41, a_out42, a_out43, a_out44, a_out45, a_out51, a_out52, a_out53, a_out54, a_out55;

wire [31:0]it21,it22,it23,it24,it25,
it11,it12,it13,it14,it15,
it31,it32,it33,it34,it35,
it41,it42,it43,it44,it45,
it51,it52,it53,it54,it55,
it131,it132,it133,it134,it135,
it141,it142,it143,it144,it145,
it111,it112,it113,it114,it115,
it151,it152,it153,it154,it155,    
it211,it212,it213,it214,it215,    
it221,it222,it223,it224,it225,

it321,it322,it323,it324,it325,
it311,it312,it313,it314,it315,
it331,it332,it333,it334,it335,
it411,it412,it413,it414,it415,
it421,it422,it423,it424,it425,
it431,it432,it433,it434,it435,
it441,it442,it443,it444,it445,pivot1,pivot2,pivot3, pivot4, pivot5
;

wire [31:0]it_out21,it_out22,it_out23,it_out24,it_out25,
it_out11,it_out12,it_out13,it_out14,it_out15,
it_out31,it_out32,it_out33,it_out34,it_out35,
it_out41,it_out42,it_out43,it_out44,it_out45,
it_out51,it_out52,it_out53,it_out54,it_out55,
it_out131,it_out132,it_out133,it_out134,it_out135,
it_out141,it_out142,it_out143,it_out144,it_out145,
it_out111,it_out112,it_out113,it_out114,it_out115,
it_out151,it_out152,it_out153,it_out154,it_out155,    
it_out211,it_out212,it_out213,it_out214,it_out215,    
it_out221,it_out222,it_out223,it_out224,it_out225,

it_out321,it_out322,it_out323,it_out324,it_out325,
it_out311,it_out312,it_out313,it_out314,it_out315,
it_out331,it_out332,it_out333,it_out334,it_out335,
it_out411,it_out412,it_out413,it_out414,it_out415,
it_out421,it_out422,it_out423,it_out424,it_out425,
it_out431,it_out432,it_out433,it_out434,it_out435,
it_out441,it_out442,it_out443,it_out444,it_out445,pivot_out11,pivot_out12,pivot_out13, pivot_out14, pivot_out15,
pivot_out21,pivot_out22,pivot_out23, pivot_out24, pivot_out25,
pivot_out31,pivot_out32,pivot_out33, pivot_out34, pivot_out35,
pivot_out41,pivot_out42,pivot_out43, pivot_out44, pivot_out45,
pivot_out51,pivot_out52,pivot_out53, pivot_out54, pivot_out55;


assign it21 = (a21 * a11) - (a11 * a21);
assign it22 = (a22 * a11) - (a12 * a21);
assign it23 = (a23 * a11) - (a13 * a21);
assign it24 = (a24 * a11) - (a14 * a21);
assign it25 = (a25 * a11) - (a15 * a21);

assign it31 = (a31 * a11) - (a11 * a31);
assign it32 = (a32 * a11) - (a12 * a31);
assign it33 = (a33 * a11) - (a13 * a31);
assign it34 = (a34 * a11) - (a14 * a31);
assign it35 = (a35 * a11) - (a15 * a31);

assign it41 = (a41 * a11) - (a11 * a41);
assign it42 = (a42 * a11) - (a12 * a41);
assign it43 = (a43 * a11) - (a13 * a41);
assign it44 = (a44 * a11) - (a14 * a41);
assign it45 = (a45 * a11) - (a15 * a41);

assign it51 = (a51 * a11) - (a11 * a51);
assign it52 = (a52 * a11) - (a12 * a51);
assign it53 = (a53 * a11) - (a13 * a51);
assign it54 = (a54 * a11) - (a14 * a51);
assign it55 = (a55 * a11) - (a15 * a51);

///now second pivot
assign it111 = (a11 * it22) - (it21 *a12);
assign it112 = (a12 * it22) - (it22 * a12);
assign it113 = (a13 * it22) - (it23 * a12);
assign it114 = (a14 * it22) - (it24 * a12);
assign it115 = (a15 * it22) - (it25 * a12);


assign it131 = (it31 * it22) - (it21 *it32);
assign it132 = (it32 * it22) - (it22 * it32);
assign it133 = (it33 * it22) - (it23 * it32);
assign it134 = (it34 * it22) - (it24 * it32);
assign it135 = (it35 * it22) - (it25 * it32);

assign it141 = (it41 * it22) - (it21 *it42);
assign it142 = (it42 * it22) - (it22 * it42);
assign it143 = (it43 * it22) - (it23 * it42);
assign it144 = (it44 * it22) - (it24 * it42);
assign it145 = (it45 * it22) - (it25 * it42);

assign it151 = (it51 * it22) - (it21 *it52);
assign it152 = (it52 * it22) - (it22 * it52);
assign it153 = (it53 * it22) - (it23 * it52);
assign it154 = (it54 * it22) - (it24 * it52);
assign it155 = (it55 * it22) - (it25 * it52);

//now third pivot
assign it211 = (it111 * it143) - (it141 *it113);
assign it212 = (it112 * it143) - (it142 * it113);
assign it213 = (it113 * it143) - (it143 * it113);
assign it214 = (it114 * it143) - (it144 * it113);
assign it215 = (it115 * it143) - (it145 * it113);


assign it221 = (it21 * it143) - (it141 *it23);
assign it222 = (it22 * it143) - (it142 * it23);
assign it223 = (it23 * it143) - (it143 * it23);
assign it224 = (it24 * it143) - (it144 * it23);
assign it225 = (it25 * it143) - (it145 * it23);

//fourth pivot
assign it311 = (it211 * it134) - (it131 *it214);
assign it312 = (it212 * it134) - (it132 * it214);
assign it313 = (it213 * it134) - (it133 * it214);
assign it314 = (it214 * it134) - (it134 * it214);
assign it315 = (it215 * it134) - (it135 * it214);

assign it321 = (it221 * it134) - (it131 *it224);
assign it322 = (it222 * it134) - (it132 * it224);
assign it323 = (it223 * it134) - (it133 * it224);
assign it324 = (it224 * it134) - (it134 * it224);
assign it325 = (it225 * it134) - (it135 * it224);

assign it331 = (it141 * it134) - (it131 *it144);
assign it332 = (it142 * it134) - (it132 * it144);
assign it333 = (it143 * it134) - (it133 * it144);
assign it334 = (it144 * it134) - (it134 * it144);
assign it335 = (it145 * it134) - (it135 * it144);

//fifth pivot


assign it411 = (it311 * it155) - (it151 * it315);
assign it412 = (it312 * it155) - (it152 * it315);
assign it413 = (it313 * it155) - (it153 * it315);
assign it414 = (it314 * it155) - (it154 * it315);
assign it415 = (it315 * it155) - (it155 * it315);

assign it421 = (it321 * it155) - (it151 * it325);
assign it422 = (it322 * it155) - (it152 * it325);
assign it423 = (it323 * it155) - (it153 * it325);
assign it424 = (it324 * it155) - (it154 * it325);
assign it425 = (it325 * it155) - (it155 * it325);

assign it431 = (it331 * it155) - (it151 * it335);
assign it432 = (it332 * it155) - (it152 * it335);
assign it433 = (it333 * it155) - (it153 * it335);
assign it434 = (it334 * it155) - (it154 * it335);
assign it435 = (it335 * it155) - (it155 * it335);

assign it441 = (it131 * it155) - (it151 * it135);
assign it442 = (it132 * it155) - (it152 * it135);
assign it443 = (it133 * it155) - (it153 * it135);
assign it444 = (it134 * it155) - (it154 * it135);
assign it445 = (it135 * it155) - (it155 * it135);

assign pivot1 = it411/it411;
assign pivot2 = it422/it422;
assign pivot3 = it433/it433;
assign pivot4 = it444/it444;
assign pivot5 = it155/it155;

assign a_out11= 1;
assign a_out12= 0;
assign a_out13= 0;
assign a_out14= 0;
assign a_out15= 0;
assign a_out21= 0;
assign a_out22= 1;
assign a_out23= 0;
assign a_out24= 0;
assign a_out25= 0;
assign a_out31= 0;
assign a_out32= 0;
assign a_out33= 1;
assign a_out34= 0;
assign a_out35= 0;
assign a_out41= 0;
assign a_out42= 0;
assign a_out43= 0;
assign a_out44= 1;
assign a_out45= 0;
assign a_out51= 0;
assign a_out52= 0;
assign a_out53= 0;
assign a_out54= 0;
assign a_out55= 1;


//second method
assign it_out21 = (a_out21 * a11) - (a_out11 * a21);
assign it_out22 = (a_out22 * a11) - (a_out12 * a21);
assign it_out23 = (a_out23 * a11) - (a_out13 * a21);
assign it_out24 = (a_out24 * a11) - (a_out14 * a21);
assign it_out25 = (a_out25 * a11) - (a_out15 * a21);

assign it_out31 = (a_out31 * a11) - (a_out11 * a31);
assign it_out32 = (a_out32 * a11) - (a_out12 * a31);
assign it_out33 = (a_out33 * a11) - (a_out13 * a31);
assign it_out34 = (a_out34 * a11) - (a_out14 * a31);
assign it_out35 = (a_out35 * a11) - (a_out15 * a31);

assign it_out41 = (a_out41 * a11) - (a_out11 * a41);
assign it_out42 = (a_out42 * a11) - (a_out12 * a41);
assign it_out43 = (a_out43 * a11) - (a_out13 * a41);
assign it_out44 = (a_out44 * a11) - (a_out14 * a41);
assign it_out45 = (a_out45 * a11) - (a_out15 * a41);

assign it_out51 = (a_out51 * a11) - (a_out11 * a51);
assign it_out52 = (a_out52 * a11) - (a_out12 * a51);
assign it_out53 = (a_out53 * a11) - (a_out13 * a51);
assign it_out54 = (a_out54 * a11) - (a_out14 * a51);
assign it_out55 = (a_out55 * a11) - (a_out15 * a51);

///now second pivot
assign it_out111 = (a_out11 * it22) - (it_out21 * a12);
assign it_out112 = (a_out12 * it22) - (it_out22 * a12);
assign it_out113 = (a_out13 * it22) - (it_out23 * a12);
assign it_out114 = (a_out14 * it22) - (it_out24 * a12);
assign it_out115 = (a_out15 * it22) - (it_out25 * a12);


assign it_out131 = (it_out31 * it22) - (it_out21 *it32);
assign it_out132 = (it_out32 * it22) - (it_out22 * it32);
assign it_out133 = (it_out33 * it22) - (it_out23 * it32);
assign it_out134 = (it_out34 * it22) - (it_out24 * it32);
assign it_out135 = (it_out35 * it22) - (it_out25 * it32);

assign it_out141 = (it_out41 * it22) - (it_out21 *it42);
assign it_out142 = (it_out42 * it22) - (it_out22 * it42);
assign it_out143 = (it_out43 * it22) - (it_out23 * it42);
assign it_out144 = (it_out44 * it22) - (it_out24 * it42);
assign it_out145 = (it_out45 * it22) - (it_out25 * it42);

assign it_out151 = (it_out51 * it22) - (it_out21 *it52);
assign it_out152 = (it_out52 * it22) - (it_out22 * it52);
assign it_out153 = (it_out53 * it22) - (it_out23 * it52);
assign it_out154 = (it_out54 * it22) - (it_out24 * it52);
assign it_out155 = (it_out55 * it22) - (it_out25 * it52);

//now third pivot
assign it_out211 = (it_out111 * it143) - (it_out141 *it113);
assign it_out212 = (it_out112 * it143) - (it_out142 * it113);
assign it_out213 = (it_out113 * it143) - (it_out143 * it113);
assign it_out214 = (it_out114 * it143) - (it_out144 * it113);
assign it_out215 = (it_out115 * it143) - (it_out145 * it113);


assign it_out221 = (it_out21 * it143) - (it_out141 *it23);
assign it_out222 = (it_out22 * it143) - (it_out142 * it23);
assign it_out223 = (it_out23 * it143) - (it_out143 * it23);
assign it_out224 = (it_out24 * it143) - (it_out144 * it23);
assign it_out225 = (it_out25 * it143) - (it_out145 * it23);

//fourth pivot
assign it_out311 = (it_out211 * it134) - (it_out131 *it214);
assign it_out312 = (it_out212 * it134) - (it_out132 * it214);
assign it_out313 = (it_out213 * it134) - (it_out133 * it214);
assign it_out314 = (it_out214 * it134) - (it_out134 * it214);
assign it_out315 = (it_out215 * it134) - (it_out135 * it214);

assign it_out321 = (it_out221 * it134) - (it_out131 *it224);
assign it_out322 = (it_out222 * it134) - (it_out132 * it224);
assign it_out323 = (it_out223 * it134) - (it_out133 * it224);
assign it_out324 = (it_out224 * it134) - (it_out134 * it224);
assign it_out325 = (it_out225 * it134) - ( it_out135 * it224);

assign it_out331 = (it_out141 * it134) - (it_out131 *it144);
assign it_out332 = (it_out142 * it134) - (it_out132 * it144);
assign it_out333 = (it_out143 * it134) - (it_out133 * it144);
assign it_out334 = (it_out144 * it134) - (it_out134 * it144);
assign it_out335 = (it_out145 * it134) - (it_out135 * it144);

//fifth pivot


assign it_out411 = (it_out311 * it155) - (it_out151 * it315);
assign it_out412 = (it_out312 * it155) - (it_out152 * it315);
assign it_out413 = (it_out313 * it155) - (it_out153 * it315);
assign it_out414 = (it_out314 * it155) - (it_out154 * it315);
assign it_out415 = (it_out315 * it155) - (it_out155 * it315);

assign it_out421 = (it_out321 * it155) - (it_out151 * it325);
assign it_out422 = (it_out322 * it155) - (it_out152 * it325);
assign it_out423 = (it_out323 * it155) - (it_out153 * it325);
assign it_out424 = (it_out324 * it155) - (it_out154 * it325);
assign it_out425 = (it_out325 * it155) - (it_out155 * it325);

assign it_out431 = (it_out331 * it155) - (it_out151 * it335);
assign it_out432 = (it_out332 * it155) - (it_out152 * it335);
assign it_out433 = (it_out333 * it155) - (it_out153 * it335);
assign it_out434 = (it_out334 * it155) - (it_out154 * it335);
assign it_out435 = (it_out335 * it155) - (it_out155 * it335);

assign it_out441 = (it_out131 * it155) - (it_out151 * it135);
assign it_out442 = (it_out132 * it155) - (it_out152 * it135);
assign it_out443 = (it_out133 * it155) - (it_out153 * it135);
assign it_out444 = (it_out134 * it155) - (it_out154 * it135);
assign it_out445 = (it_out135 * it155) - (it_out155 * it135);

assign pivot_out11 = it_out411;
assign pivot_out12 = it_out412;
assign pivot_out13 = it_out413;
assign pivot_out14 = it_out414;
assign pivot_out15 = it_out415;

assign pivot_out21 = it_out421;
assign pivot_out22 = it_out422;
assign pivot_out23 = it_out423;
assign pivot_out24 = it_out424;
assign pivot_out25 = it_out425;



assign pivot_out31 = it_out431;
assign pivot_out32 = it_out432;
assign pivot_out33 = it_out433;
assign pivot_out34 = it_out434;
assign pivot_out35 = it_out435;

assign pivot_out41 = it_out441;
assign pivot_out42 = it_out442;
assign pivot_out43 = it_out443;
assign pivot_out44 = it_out444;
assign pivot_out45 = it_out445;

assign pivot_out51 = it_out151;
assign pivot_out52 = it_out152;
assign pivot_out53 = it_out153;
assign pivot_out54 = it_out154;
assign pivot_out55 = it_out155;


assign i11=pivot_out11;
assign i12=pivot_out12;
assign i13=pivot_out13;
assign i14=pivot_out14;
assign i15=pivot_out15;
assign i21=pivot_out21;
assign i22=pivot_out22;
assign i23=pivot_out23;
assign i24=pivot_out24;
assign i25=pivot_out25;
assign i31=pivot_out31;
assign i32=pivot_out32;
assign i33=pivot_out33;
assign i34=pivot_out34;
assign i35=pivot_out35;
assign i41=pivot_out41;
assign i42=pivot_out42;
assign i43=pivot_out43;
assign i44=pivot_out44;
assign i45=pivot_out45;
assign i51=pivot_out51;
assign i52=pivot_out52;
assign i53=pivot_out53;
assign i54=pivot_out54;
assign i55=pivot_out55;

endmodule
	
