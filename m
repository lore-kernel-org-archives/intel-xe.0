Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF58C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 17:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12AC10F0B7;
	Wed, 12 Aug 2026 17:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SQehkbWL";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17A510E40E;
 Wed, 12 Aug 2026 09:56:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AF907600E2;
 Wed, 12 Aug 2026 09:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF811F00A3A;
 Wed, 12 Aug 2026 09:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786528561;
 bh=FTU4Bin/eEQuRB8kRdtrGGCOV8y84sXhHFUmMhev5pM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=SQehkbWL07NOsDkrgEP5b1WJ3caLbzwBsLVTp0WBBKb95bP2zDnMxvPyPzEtYz2D6
 IFsIRzCk2QP8serd8BpInWDvFIcUOXoCXjPigVT6pDkRf+Rrk2Ux5jyUCvsYfWEn+4
 M84dmGldFkFyAYQgJ9EanbpnQR9JNoFyPoN7aWA5mWDWdSoqJE49jx32Kcb3GjFIhK
 vh+81Qf3/omJc8CaaFo6m3XHWpAt4jKc1/4jLaQ0Wwio/itnWha8m65EfFSBxecqpk
 jmUJj0YihT6JQk3wyyJ2Q8p/hUJZlPU7Z7D1x5MXkdNqrnVmEg+oK0U7qjnVphso43
 UP5/MVZpeALZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] [DO_NOT_REVIEW] drm/i915/color: Add color pipeline
 support for SDR planes
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260812085908.3159828-2-chaitanya.kumar.borah@intel.com>
References: <20260812085908.3159828-1-chaitanya.kumar.borah@intel.com>
 <20260812085908.3159828-2-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 09:56:00 +0000
Message-Id: <20260812095601.3AF811F00A3A@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 17:41:21 +0000
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

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Silent removal of `PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH` programming=
 breaks HDR plane post-CSC LUT configuration.
- [High] Missing call to `icl_program_input_csc` for HDR planes leaves hard=
ware coefficients uninitialized when CSC is enabled via the color pipeline =
on non-YUV framebuffers.
- [Medium] Bitwise truncation of `supported_fm` on 32-bit platforms bypasse=
s API validation.

Pre-existing issues:
- [High] Dangling pointer in DRM object IDR due to missing `drm_mode_object=
_unregister()` in `drm_colorop_cleanup()`.
- [High] Unchecked `kasprintf()` failure leads to a NULL pointer dereferenc=
e during color pipeline property creation.
--

--- Patch [1]: [PATCH 1/2] [DO_NOT_REVIEW] drm/i915/color: Add color pipeli=
ne support for SDR planes ---
commit 4109ddb0966a40508785d60da4c2c5b6e3b098a0
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: drm/i915/color: Add color pipeline support for SDR planes

This patch adds color pipeline support for SDR planes and introduces
fixed matrix color operations. It introduces new capabilities to program
pre-CSC and post-CSC LUTs conditionally based on whether a plane is HDR
or SDR.

Link: https://lore.kernel.org/intel-gfx/20260804123107.2256124-1-chaitanya.=
kumar.borah@intel.com/

> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 682fcc6515259..95da03d6c65c8 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -453,6 +463,80 @@ int drm_plane_colorop_3dlut_init(struct drm_device *=
dev, struct drm_colorop *col
>  }
>  EXPORT_SYMBOL(drm_plane_colorop_3dlut_init);
> =20
> +/**
> + * drm_plane_colorop_fixed_matrix_init - Initialize a DRM_COLOROP_FIXED_=
MATRIX
> + *
> + * @dev: DRM device
> + * @colorop: The drm_colorop object to initialize
> + * @plane: The associated drm_plane
> + * @funcs: control functions for the new colorop
> + * @supported_fm: A bitfield of supported drm_colorop_fixed_matrix_type =
enum values,
> + *               created using BIT(fixed_matrix_type) and combined with =
the OR '|'
> + *               operator.
> + * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
> + * @return zero on success, -E value on failure
> + */
> +int drm_plane_colorop_fixed_matrix_init(struct drm_device *dev, struct d=
rm_colorop *colorop,
> +					struct drm_plane *plane,
> +					const struct drm_colorop_funcs *funcs,
> +					u64 supported_fm, uint32_t flags)
> +{
> +	struct drm_prop_enum_list enum_list[DRM_COLOROP_FM_COUNT];
> +	int i, len;
> +	struct drm_property *prop;
> +	int ret;
> +
> +	if (!supported_fm) {
> +		drm_err(dev,
> +			"No supported FM type op for new Fixed Matrix colorop on [PLANE:%d:%s=
]\n",
> +			plane->base.id, plane->name);
> +		return -EINVAL;
> +	}
> +
> +	if ((supported_fm & -BIT(DRM_COLOROP_FM_COUNT)) !=3D 0) {

[Severity: Medium]
Does this bitwise truncation bypass API validation on 32-bit platforms?

Since the BIT() macro evaluates to an unsigned long,=20
-BIT(DRM_COLOROP_FM_COUNT) will be a 32-bit value on 32-bit architectures.

When bitwise-ANDed with the u64 supported_fm parameter, it will be
zero-extended rather than sign-extended.=20

Can this cause any unsupported bits in the upper 32 bits to evaluate to 0=20
and silently bypass the error check during driver initialization?

> +		drm_err(dev, "Unknown Fixed Matrix provided on [PLANE:%d:%s]\n",
> +			plane->base.id, plane->name);
> +		return -EINVAL;
> +	}

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm=
/i915/display/intel_color.c
> index 87ced9f6ff408..f1df0f9ba7624 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -3998,25 +3998,17 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb =
*dsb,
>  }
> =20
>  static void
> -xelpd_program_plane_post_csc_lut(struct intel_dsb *dsb,
> -				 const struct intel_plane_state *plane_state)
> +xelpd_load_hdr_post_csc_lut(struct intel_display *display,
> +			    struct intel_dsb *dsb,
> +			    enum pipe pipe,
> +			    enum plane_id plane,
> +			    const struct drm_color_lut32 *post_csc_lut)
>  {
> -	struct intel_display *display =3D to_intel_display(plane_state);
> -	const struct drm_plane_state *state =3D &plane_state->uapi;
> -	enum pipe pipe =3D to_intel_plane(state->plane)->pipe;
> -	enum plane_id plane =3D to_intel_plane(state->plane)->id;
> -	const struct drm_color_lut32 *post_csc_lut =3D plane_state->hw.gamma_lu=
t->data;
>  	int i, lut_size =3D 32;
>  	u32 lut_val;
> =20
> -	if (!icl_is_hdr_plane(display, plane))
> -		return;
> -
>  	intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, pl=
ane, 0),
>  			   PLANE_PAL_PREC_AUTO_INCREMENT);
> -	/* TODO: Add macro */
> -	intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pip=
e, plane, 0),
> -			   PLANE_PAL_PREC_AUTO_INCREMENT);

[Severity: High]
Does the removal of PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH programming here
break HDR plane post-CSC LUT configuration?

When programming post-CSC LUTs on HDR planes, the hardware requires the
SEG0_INDEX_ENH register to be configured to auto-increment before writing
the LUT data. With the refactoring of xelpd_program_plane_post_csc_lut()
into xelpd_load_hdr_post_csc_lut(), it looks like these register writes
were completely removed.

Could this lead to hardware state machine misconfigurations and display
corruption on HDR planes during atomic modesets?

> =20
>  	for (i =3D 0; i < lut_size + 3; i++) {
>  		if (post_csc_lut) {

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/driver=
s/gpu/drm/i915/display/intel_color_pipeline.c
> index 6cf8080ee8000..38cfd6ed585d0 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
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
> =20
>  	for (i =3D 0; i < pipeline_len; i++) {

[Severity: High]
This is a pre-existing issue, but can an unchecked kasprintf() failure
lead to a NULL pointer dereference during color pipeline property creation?

Looking further down in _intel_color_pipeline_plane_init() in
drivers/gpu/drm/i915/display/intel_color_pipeline.c:

_intel_color_pipeline_plane_init()
    list->name =3D kasprintf(GFP_KERNEL, "Color Pipeline %d", ...);
    return 0;

If memory allocation fails, kasprintf() returns NULL. This is blindly
assigned to list->name, which is then passed into
drm_plane_create_color_pipeline_property() and subsequently to
drm_property_add_enum() which calls strlen(name).

Could this structural guarantee of a kernel panic be prevented with a
NULL check?

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers=
/gpu/drm/i915/display/skl_universal_plane.c
> index 07a6832933521..222c3b6bbe467 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -1240,37 +1240,47 @@ static u32 glk_plane_color_ctl_crtc(const struct =
intel_crtc_state *crtc_state)
>  	return plane_color_ctl;
>  }
> =20
> -static u32 glk_plane_color_ctl(const struct intel_plane_state *plane_sta=
te)
> +static u32 glk_plane_color_ctl_input_csc(const struct intel_plane_state =
*plane_state)
>  {
>  	struct intel_display *display =3D to_intel_display(plane_state);
>  	const struct drm_framebuffer *fb =3D plane_state->hw.fb;
>  	struct intel_plane *plane =3D to_intel_plane(plane_state->uapi.plane);
> -	u32 plane_color_ctl =3D 0;
> +	bool color_pipeline =3D !!plane_state->uapi.color_pipeline;
> +	bool needs_csc =3D color_pipeline ? plane_state->hw.csc_ff_enable : fb-=
>format->is_yuv;
> +	u32 ctl =3D 0;
> =20
> -	plane_color_ctl |=3D PLANE_COLOR_PLANE_GAMMA_DISABLE;
> -	plane_color_ctl |=3D glk_plane_color_ctl_alpha(plane_state);
> +	if (!needs_csc)
> +		return 0;
> =20
> -	if (fb->format->is_yuv && !icl_is_hdr_plane(display, plane->id)) {
> +	if (!icl_is_hdr_plane(display, plane->id)) {
>  		switch (plane_state->hw.color_encoding) {
>  		case DRM_COLOR_YCBCR_BT709:
> -			plane_color_ctl |=3D PLANE_COLOR_CSC_MODE_YUV709_TO_RGB709;
> +			ctl |=3D PLANE_COLOR_CSC_MODE_YUV709_TO_RGB709;
>  			break;
>  		case DRM_COLOR_YCBCR_BT2020:
> -			plane_color_ctl |=3D
> -				PLANE_COLOR_CSC_MODE_YUV2020_TO_RGB2020;
> +			ctl |=3D PLANE_COLOR_CSC_MODE_YUV2020_TO_RGB2020;
>  			break;
>  		default:
> -			plane_color_ctl |=3D
> -				PLANE_COLOR_CSC_MODE_YUV601_TO_RGB601;
> +			ctl |=3D PLANE_COLOR_CSC_MODE_YUV601_TO_RGB601;
>  		}
> -		if (plane_state->hw.color_range =3D=3D DRM_COLOR_YCBCR_FULL_RANGE)
> -			plane_color_ctl |=3D PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE;
> -	} else if (fb->format->is_yuv) {
> -		plane_color_ctl |=3D PLANE_COLOR_INPUT_CSC_ENABLE;
> -		if (plane_state->hw.color_range =3D=3D DRM_COLOR_YCBCR_FULL_RANGE)
> -			plane_color_ctl |=3D PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE;
> +	} else {
> +		ctl |=3D PLANE_COLOR_INPUT_CSC_ENABLE;
>  	}

[Severity: High]
Does the introduction of plane_state->hw.csc_ff_enable leave hardware
coefficients uninitialized in skl_plane_update_noarm()?

When userspace enables the INTEL_PLANE_CB_CSC_FF fixed matrix colorop on
an RGB framebuffer on an HDR plane, glk_plane_color_ctl_input_csc() sets
the PLANE_COLOR_INPUT_CSC_ENABLE bit here.

However, skl_plane_update_noarm() evaluates whether to actually program
the hardware using the framebuffer format:

skl_plane_update_noarm()
    if (fb->format->is_yuv && icl_is_hdr_plane(display, plane_id))
        icl_program_input_csc(dsb, plane, plane_state);

Because it is an RGB buffer, the programming is skipped, leaving the hardwa=
re
to use uninitialized or stale input CSC coefficient registers.

Should skl_plane_update_noarm() be updated to also check if CSC is enabled
via the new color pipeline?

[ ... ]

[Severity: High]
This is a pre-existing issue, but does drm_colorop_cleanup() leave a
dangling pointer in the DRM object IDR?

Looking at drm_colorop_cleanup() in drivers/gpu/drm/drm_colorop.c:

drm_colorop_cleanup()
    list_del(&colorop->head);
    config->num_colorop--;

If drm_plane_colorop_fixed_matrix_init() fails after drm_mode_object_add()
is called, the error path invokes this function. It removes the colorop
from the list and frees it, but neglects to call
drm_mode_object_unregister() to remove the object ID from
dev->mode_config.object_idr.

Could this lead to a Use-After-Free (UAF) if a lookup is performed on the
leaked object ID later?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812085908.3159=
828-1-chaitanya.kumar.borah@intel.com?part=3D1
