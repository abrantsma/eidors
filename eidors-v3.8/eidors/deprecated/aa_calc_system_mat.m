function s_mat= aa_calc_system_mat( fwd_model, img)
% AA_CALC_SYSTEM_MAT: SS= aa_calc_system_mat( fwd_model, img)
% Calc system matrix for Andy Adler's EIT code
% fwd_model = forward model
% img       = image background for system matrix calc
% s_mat.E = CC' * SS * conductivites * CC;
% where:
%   SS  = Unconnected system Matrix
%   CC  = Connectivity Matrix

% (C) 2005 Andy Adler. License: GPL version 2 or version 3
% $Id: aa_calc_system_mat.m 3087 2012-06-07 18:11:42Z aadler $

warning('EIDORS:deprecated','AA_CALC_SYSTEM_MAT is deprecated as of 07-Jun-2012. Use SYSTEM_MAT_1ST_ORDER instead.');

FC= system_mat_fields( fwd_model);
lFC= size(FC,1);

elem_sigma = kron( img.elem_data(:), ones(elem_dim(fwd_model),1) );

ES= ones(lFC,1);
ES(1:length(elem_sigma))= elem_sigma;
ES= spdiags(ES,0,lFC,lFC);

s_mat.E= FC' * ES * FC;

