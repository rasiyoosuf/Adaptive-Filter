module FA10(s,c,a,b,d);
input [9:0]a,b,d;
output [9:0]s,c;
FA f1(s[0],c[0],a[0],b[0],d[0]);
FA f2(s[1],c[1],a[1],b[1],d[1]);
FA f3(s[2],c[2],a[2],b[2],d[2]);
FA f4(s[3],c[3],a[3],b[3],d[3]);
FA f5(s[4],c[4],a[4],b[4],d[4]);
FA f6(s[5],c[5],a[5],b[5],d[5]);
FA f7(s[6],c[6],a[6],b[6],d[6]);
FA f8(s[7],c[7],a[7],b[7],d[7]);
FA f9(s[8],c[8],a[8],b[8],d[8]);
FA f10(s[9],c[9],a[9],b[9],d[9]);
endmodule


