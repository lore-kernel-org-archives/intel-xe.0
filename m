Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BE8C61DFD
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 08:34:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE47610F09E;
	Wed,  2 Sep 2026 08:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jjYlQbyl";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726A210F09E;
 Wed,  2 Sep 2026 08:34:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 270C1438B9;
 Wed,  2 Sep 2026 08:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C9F1F000E9;
 Wed,  2 Sep 2026 08:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788338060;
 bh=cAm23oYgxxDMz5JBk7BvuEsOm7z+kAsPau02lhJSdtU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=jjYlQbylmHi9Onfy8Y6XwfMctAO2xo00GJ0Q7ut6jEQe1kHg6K539kbsI0O3XIoC3
 jSlgGsO+WVatmDT6cJktfLIaYCVSdI1JnzVdSAcLWjrid3kfWQiwO+I/4tGnlVBeKu
 Fey+zQGvryYZkJYF4NGztRPKkWIlrw5/2egV0bcV3uoK23NP/xeFhO0RmqOhFRlrop
 dof13+Umkm3qvbXLvHD2yMLjiAL/JCcUeRWrxGP27tnYJP4td3YC8dQGGuOUGS4efH
 1VC+QkqJ9Kee4yhSyPABIrItCwHgBzLacRs1MXI1L3avvNNLPwF6TPIjJHJHiarVdy
 YRcRS8txwEqVA==
From: sashiko-bot@kernel.org
Subject: Re: [CI 1/9] drm/i915/color: Add CSC on SDR plane color pipeline
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260902075417.656673-2-chaitanya.kumar.borah@intel.com>
References: <20260902075417.656673-1-chaitanya.kumar.borah@intel.com>
 <20260902075417.656673-2-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 08:34:19 +0000
Message-Id: <20260902083419.D0C9F1F000E9@smtp.kernel.org>
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
- [High] The patch relies on core DRM functions and enum values that are no=
t defined anywhere in the kernel tree.
- [Medium] The newly added SDR plane color pipeline is entirely unreachable=
 because the caller function restricts pipeline initialization exclusively =
to HDR planes.
- [Medium] The fixed-function CSC colorop state is exposed to userspace, bu=
t the driver completely ignores its configuration when programming the hard=
ware.

Pre-existing issues:
- [High] The error cleanup path for colorop initialization calls `drm_color=
op_cleanup` on partially initialized objects, causing a NULL pointer derefe=
rence.
- [High] Missing error handling for `kasprintf` memory allocation failure l=
eads to a kernel panic.
--

commit d4c7800e456ca3d700da2c92787c702c23a7fcd5
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: drm/i915/color: Add CSC on SDR plane color pipeline

This commit introduces a fixed-function CSC block to the SDR plane color
pipeline as a DRM_COLOROP_FIXED_MATRIX color operation. It adds the new
pipeline definition and initializes it for SDR planes during setup.

> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/driver=
s/gpu/drm/i915/display/intel_color_pipeline.c
> index 6cf8080ee8000..efd4375c43318 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
[ ... ]
> @@ -43,6 +43,18 @@ static const enum intel_color_block hdr_plane_pipeline=
[] =3D {
>  	INTEL_PLANE_CB_POST_CSC_LUT,
>  };
> =20
> +static const enum intel_color_block sdr_plane_yuv_pipeline[] =3D {
> +	INTEL_PLANE_CB_CSC_FF,
> +};
> +
> +static const u64 intel_plane_supported_csc_ff =3D
> +		BIT(DRM_COLOROP_FM_YCBCR601_FULL_RGB) |
> +		BIT(DRM_COLOROP_FM_YCBCR601_LIMITED_RGB) |
> +		BIT(DRM_COLOROP_FM_YCBCR709_FULL_RGB) |
> +		BIT(DRM_COLOROP_FM_YCBCR709_LIMITED_RGB) |
> +		BIT(DRM_COLOROP_FM_YCBCR2020_NC_FULL_RGB) |
> +		BIT(DRM_COLOROP_FM_YCBCR2020_NC_LIMITED_RGB);

[Severity: High]
Are these enum values (e.g., DRM_COLOROP_FM_YCBCR601_FULL_RGB) defined
in the kernel tree? It appears they are not defined anywhere, which would
cause a compilation failure. Is there a prerequisite patch missing from
this series?

[ ... ]
> @@ -92,6 +104,12 @@ struct intel_colorop *intel_color_pipeline_plane_add_=
colorop(struct drm_plane *p
>  							  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>  							  DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  		break;
> +	case INTEL_PLANE_CB_CSC_FF:
> +		ret =3D drm_plane_colorop_fixed_matrix_init(dev, &colorop->base, plane,
> +							  &intel_colorop_funcs,
> +							  intel_plane_supported_csc_ff,
> +							  DRM_COLOROP_FLAG_ALLOW_BYPASS);

[Severity: High]
Is drm_plane_colorop_fixed_matrix_init() implemented in another patch?
This core DRM function does not seem to be defined in the tree, which will
cause a build failure.

[Severity: High]
This isn't a bug introduced by this patch, but can the error path for this=
=20
initialization lead to a NULL pointer dereference?=20

If drm_plane_colorop_fixed_matrix_init() fails early, it jumps to the
cleanup label:

	if (ret)
		goto cleanup;
    ...
cleanup:
	intel_colorop_destroy(&colorop->base);

This calls drm_colorop_cleanup(), which dereferences colorop->dev:

void drm_colorop_cleanup(struct drm_colorop *colorop)
{
	struct drm_device *dev =3D colorop->dev;
	struct drm_mode_config *config =3D &dev->mode_config;

Since colorop was just allocated with kzalloc and colorop->dev might not
be set yet if initialization fails early, could dev be NULL here?

> +		break;
>  	default:
>  		drm_err(plane->dev, "Invalid colorop id [%d]", id);
>  		ret =3D -EINVAL;
> @@ -126,9 +144,12 @@ int _intel_color_pipeline_plane_init(struct drm_plan=
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

[Severity: Medium]
Will this newly added SDR pipeline logic ever be reached? The caller
function intel_color_pipeline_plane_init() unconditionally restricts
pipeline initialization to HDR planes with an early return:

int intel_color_pipeline_plane_init(...)
{
    ...
	/* Currently expose pipeline only for HDR planes */
	if (!icl_is_hdr_plane(display, to_intel_plane(plane)->id))
		return 0;

	ret =3D _intel_color_pipeline_plane_init(plane, &pipelines[len], pipe);
    ...
}

Does this early return make the sdr_plane_yuv_pipeline dead code?

[Severity: High]
This isn't a bug introduced by this patch, but does the kasprintf() call=20
slightly below this block in _intel_color_pipeline_plane_init() need a=20
NULL check?

	list->name =3D kasprintf(GFP_KERNEL, "Color Pipeline %d", ...);
    return 0;

If kasprintf() fails due to OOM and returns NULL, the function still
returns 0 (success). Could this propagate a NULL pointer to=20
drm_property_add_enum(), leading to a kernel panic when it tries to read
the name length?

[Severity: Medium]
Once the fixed-function CSC colorop state (INTEL_PLANE_CB_CSC_FF) is set=20
by userspace, does the driver correctly apply it to the hardware?

Looking at intel_plane_color_copy_uapi_to_hw_state(), there appears to be no
logic in intel_plane_colorop_replace_blob() to extract the new fixed matrix=
=20
configuration. Furthermore, the hardware programming in glk_plane_color_ctl=
()
continues to rely on the legacy hw.color_encoding field:

static u32 glk_plane_color_ctl(const struct intel_plane_state *plane_state)
{
    ...
	if (fb->format->is_yuv && !icl_is_hdr_plane(display, plane->id)) {
		switch (plane_state->hw.color_encoding) {
		case DRM_COLOR_YCBCR_BT709:
    ...

Could this result in the hardware being programmed with the legacy state
instead of the newly requested color pipeline configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902075417.6566=
73-2-chaitanya.kumar.borah@intel.com?part=3D1
