Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DFCC61DD3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 12:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6AD10ECB7;
	Tue,  1 Sep 2026 12:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OGhfeUuR";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091AE10ECB7;
 Tue,  1 Sep 2026 12:59:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BE6AB41A5E;
 Tue,  1 Sep 2026 12:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E891F000E9;
 Tue,  1 Sep 2026 12:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788267594;
 bh=wXLcTbnL/ObDRZILQoNGf11CVQCzKBQx4wxHnQc70S0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=OGhfeUuRGlgApQCupXJejQR4yVYdQ3m27zpPlpY2vVzGIjOvfylHw6gbgegNz5gA2
 384OLPDFTEAqu5Nk2OWUW6tMfRbExJkW33RnjNIbnmQ4tH67vAJOL/bEINeHzNqm47
 gL9y3EZ6/HnFmyy6g4zBfSvM0hI9E5vVhNXupdEtecBeb9siPaUVJgUsEZCXItBQtI
 fEhEnPmptECAvw6MbGO/QYqCKIOeDPPTQipLtP+5aB4QEMXgGm36gE6LbNJGfXfSnW
 TnShA23amtbEQTPLflkzzJtKCM07UdjF9x8w6gZJaOq3ubSwWgQLklD9bhD+oYstH2
 M4RND+rG//SxQ==
From: sashiko-bot@kernel.org
Subject: Re: [DO_NOT_REVIEW v2 1/2] drm/i915/color: Add color pipeline
 support for SDR planes
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260901120254.629261-2-chaitanya.kumar.borah@intel.com>
References: <20260901120254.629261-1-chaitanya.kumar.borah@intel.com>
 <20260901120254.629261-2-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 12:59:54 +0000
Message-Id: <20260901125954.78E891F000E9@smtp.kernel.org>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The commit references undefined DRM core UAPI structures, enums, an=
d functions, causing a compilation failure.

Pre-existing issues:
- [High] Unchecked memory allocation via `kasprintf` leads to a NULL pointe=
r dereference when creating the color pipeline property.
--

commit c28893e0173187dd4a064073c1ffc14ec288c788
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
drm/i915/color: Add color pipeline support for SDR planes

This commit adds color pipeline support for SDR planes in the i915 driver.
It introduces fixed matrix handling for YUV to RGB conversions and exposes
color pipelines for SDR planes alongside the existing HDR support.

Link: https://lore.kernel.org/intel-gfx/20260804123107.2256124-1-chaitanya.=
kumar.borah@intel.com/

> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/driver=
s/gpu/drm/i915/display/intel_color_pipeline.c
> index 6cf8080ee8000..38cfd6ed585d0 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> @@ -92,6 +105,12 @@ struct intel_colorop *intel_color_pipeline_plane_add_=
colorop(struct drm_plane *p
>  							  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>  							  DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  		break;
> +	case INTEL_PLANE_CB_CSC_FF:
> +		ret =3D drm_plane_colorop_fixed_matrix_init(dev, &colorop->base, plane,
> +							  &intel_colorop_funcs,
> +							  intel_plane_supported_csc_ff,
> +							  DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +		break;

[Severity: Low]
Does this code rely on out-of-tree patches? The function
drm_plane_colorop_fixed_matrix_init does not appear to exist in the current
DRM core tree, which causes a build failure in
intel_color_pipeline_plane_add_colorop when compiling the kernel with this
patch applied.

[ ... ]

> @@ -126,9 +145,12 @@ int _intel_color_pipeline_plane_init(struct drm_plan=
e *plane, struct drm_prop_en
>  	if (plane_has_3dlut(display, pipe, plane)) {
>  		pipeline =3D xe3plpd_primary_plane_pipeline;
>  		pipeline_len =3D ARRAY_SIZE(xe3plpd_primary_plane_pipeline);
> -	} else {
> +	} else if (icl_is_hdr_plane(display, to_intel_plane(plane)->id)) {
>  		pipeline =3D hdr_plane_pipeline;
>  		pipeline_len =3D ARRAY_SIZE(hdr_plane_pipeline);
> +	} else {
> +		pipeline =3D sdr_plane_yuv_pipeline;
> +		pipeline_len =3D ARRAY_SIZE(sdr_plane_yuv_pipeline);
>  	}

[Severity: High]
This is a pre-existing issue, but later in _intel_color_pipeline_plane_init,
kasprintf is used to allocate the name property for the color pipeline:

    list->name =3D kasprintf(GFP_KERNEL, "Color Pipeline %d",
                           colorop[0]->base.base.id);
    return 0;

If memory allocation fails under pressure and kasprintf returns a NULL poin=
ter,
the function still returns 0 (success). This NULL pointer is subsequently
passed to drm_property_add_enum via drm_plane_create_color_pipeline_propert=
y.

Since drm_property_add_enum calls strlen on the name, would this lead to a
NULL pointer dereference and kernel panic during driver initialization?

> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm=
/i915/display/intel_plane.c
> index d0f99a87c42e8..25ca049009efb 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> @@ -462,6 +462,42 @@ intel_plane_colorop_replace_blob(struct intel_plane_=
state *plane_state,
>  	return false;
>  }
> =20
> +static u32
> +fixedmatrix_colorop_to_encoding(enum drm_colorop_fixed_matrix_type fm_ty=
pe)
> +{
> +	switch (fm_type) {
> +	case DRM_COLOROP_FM_YCBCR709_FULL_RGB:

[Severity: Low]
Are the new format macros defined in the DRM core? Using
DRM_COLOROP_FM_YCBCR709_FULL_RGB (and the related macros below) results in a
compilation failure in fixedmatrix_colorop_to_encoding because the values
appear to be undefined in the current tree.

[ ... ]

> @@ -485,11 +522,23 @@ intel_plane_color_copy_uapi_to_hw_state(struct inte=
l_atomic_state *state,
>  	while (iter_colorop) {
>  		for_each_new_colorop_in_state(&state->base, colorop, new_colorop_state=
, i) {
>  			if (new_colorop_state->colorop =3D=3D iter_colorop) {
> -				blob =3D new_colorop_state->bypass ? NULL : new_colorop_state->data;
>  				intel_colorop =3D to_intel_colorop(colorop);
> -				changed |=3D intel_plane_colorop_replace_blob(plane_state,
> +				if (intel_colorop->id =3D=3D INTEL_PLANE_CB_CSC_FF) {
> +					fm_type =3D new_colorop_state->fixed_matrix_type;

[Severity: Low]
Does drm_colorop_state include a fixed_matrix_type field? Accessing
new_colorop_state->fixed_matrix_type in intel_plane_color_copy_uapi_to_hw_s=
tate
causes a build failure because the field is not present in the struct
drm_colorop_state definition in the DRM UAPI headers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901120254.6292=
61-1-chaitanya.kumar.borah@intel.com?part=3D1
