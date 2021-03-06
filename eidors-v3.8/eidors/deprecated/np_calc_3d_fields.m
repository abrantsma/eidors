function v_f= np_calc_3d_fields( fwd_model, img)
% NP_CALC_3D_FIELDS: J= np_calc_3d_fields( fwd_model, img)
% Calculate measurement fields using preconditioned conjugate gradients
% v_f       = Measurement fields
% fwd_model = forward model
% img = image background for jacobian calc

% (C) 2005 Andy Adler. License: GPL version 2 or version 3
% $Id: np_calc_3d_fields.m 3052 2012-06-06 15:48:35Z aadler $

% Here we use caching differently. The v_h previous depends only
%  on the fwd_model (depending on the image wouldn't help, because
%  it changes). It is used as the first guess for m_3d_fields

warning('EIDORS:deprecated','NP_CALC_3D_FIELDS is deprecated as of 06-Jun-2012. ');

p= np_fwd_parameters( fwd_model );
s_mat= calc_system_mat( fwd_model, img );

%Set the tolerance for the pcg
tol = 1e-5;

v_f = eidors_obj('get-cache', fwd_model, 'np_2003_3d_fields');

[v_f] = m_3d_fields(p.vtx, p.n_elec, p.indH, ...
s_mat.E, tol, p.gnd_ind, v_f);

eidors_obj('set-cache', fwd_model, 'np_2003_image_prior', v_f);
