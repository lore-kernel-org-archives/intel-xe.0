Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A07C624D0
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 08:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6173610F094;
	Wed,  2 Sep 2026 08:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fxKhacQi";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856FE10F094;
 Wed,  2 Sep 2026 08:28:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AC11C600D0;
 Wed,  2 Sep 2026 08:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454571F000E9;
 Wed,  2 Sep 2026 08:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788337735;
 bh=JL7xSamR5dbSwBfncaEpKvqJ+6R0Wm7W+7HgciO2D4w=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=fxKhacQiRAcvQ8Z4qQvUsajYtvVr7X8f1EJ/5AjzbnAMsdFI5hfWQhkUFbXtS/6xl
 DbY18LQg7xI7HmTRdN21w7M/1Z0G1KcDp7DTWi9qDlo5ulWr9jFrGOpuS/Od8dAmCC
 N7BPH6aPH3KvNsY7E3W3L3igGP4g4bHnuwzQIY5s4s2cyfJc0O/82bhvhqKm/In9CV
 jNYZEbVgHtbYDdxQOp9ZwfYLsZutV6f4V9kM/FOFYggd0r+0+yN2hCi/TZ7UvxhviG
 rTEfNiMwYzQwhUX2Gqkrbnv1cSN+DPeTlzQ2J/Xcjyxm2akfwbTWxU9bSzw7x6n4pf
 7X8ZO/fcboi1Q==
From: sashiko-bot@kernel.org
Subject: Re: [CI 9/9] drm/i915/color: Add YUV buffer support on HDR planes
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260902075417.656673-10-chaitanya.kumar.borah@intel.com>
References: <20260902075417.656673-1-chaitanya.kumar.borah@intel.com>
 <20260902075417.656673-10-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 08:28:54 +0000
Message-Id: <20260902082855.454571F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Logic Error / Fatal Initialization Error: Unhandled color block in=
 `intel_color_pipeline_plane_add_colorop`.
- [High] Hardware Configuration Error: `PLANE_COLOR_INPUT_CSC_ENABLE` is ig=
nored for RGB framebuffers when `csc_ff_enable` is true.
- [Low] Compilation Failure: Undeclared enum value `INTEL_PLANE_CB_CSC_FF`.
- [Low] Compilation Failure: Undeclared struct member `csc_ff_enable`.
--

commit 1c6f477c5724be8b1a87f5ec970f9c13fe79be33
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

drm/i915/color: Add YUV buffer support on HDR planes

This commit adds the INTEL_PLANE_CB_CSC_FF color block as the first stage
for HDR planes to enable YUV-to-RGB color space conversion. It also updates
icl_program_input_csc() to account for color pipeline programming.

> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/driver=
s/gpu/drm/i915/display/intel_color_pipeline.c
> index 6cf8080ee8000..71451a196e165 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
[ ... ]
> @@ -31,6 +31,7 @@ static const struct drm_colorop_funcs intel_colorop_fun=
cs =3D {
>   * the pipeline totally unusable.
>   */
>  static const enum intel_color_block xe3plpd_primary_plane_pipeline[] =3D=
 {
> +	INTEL_PLANE_CB_CSC_FF,

[Severity: Low]
Is INTEL_PLANE_CB_CSC_FF defined in this tree? It appears to be an
undeclared enum value here, which will cause a compilation failure.

>  	INTEL_PLANE_CB_PRE_CSC_LUT,
>  	INTEL_PLANE_CB_CSC,
[ ... ]
> @@ -38,6 +39,7 @@ static const enum intel_color_block xe3plpd_primary_pla=
ne_pipeline[] =3D {
>  };
> =20
>  static const enum intel_color_block hdr_plane_pipeline[] =3D {
> +	INTEL_PLANE_CB_CSC_FF,

[Severity: High]
How is this new color block handled during pipeline creation? Looking at
intel_color_pipeline_plane_add_colorop(), there doesn't seem to be a case
for INTEL_PLANE_CB_CSC_FF, meaning it will hit the default path:

intel_color_pipeline_plane_add_colorop() {
    ...
    default:
        drm_err(plane->dev, "Invalid colorop id [%d]", id);
        ret =3D -EINVAL;
    ...
}

Will this cause pipeline creation to immediately abort and return -EINVAL
when encountering this new block?

>  	INTEL_PLANE_CB_PRE_CSC_LUT,
>  	INTEL_PLANE_CB_CSC,
[ ... ]
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers=
/gpu/drm/i915/display/skl_universal_plane.c
> index 5cda1ab90e40f..c6ec77c38cc50 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
[ ... ]
> @@ -1616,7 +1616,8 @@ icl_plane_update_noarm(struct intel_dsb *dsb,
>  	intel_de_write_dsb(display, dsb, PLANE_COLOR_CTL(pipe, plane_id),
>  			   plane_color_ctl);
> =20
> -	if (fb->format->is_yuv && icl_is_hdr_plane(display, plane_id))
> +	if (icl_is_hdr_plane(display, plane_id) &&
> +	    (fb->format->is_yuv || plane_state->hw.csc_ff_enable))

[Severity: Low]
Does struct intel_plane_state contain csc_ff_enable in its hw member?
This looks like an undeclared struct member that will break the build.

[Severity: High]
When csc_ff_enable is explicitly requested for RGB buffers, will the
hardware actually enable the CSC block?

In glk_plane_color_ctl(), the enable bit is only set if the framebuffer
format is YUV:

glk_plane_color_ctl() {
    ...
    } else if (fb->format->is_yuv) {
        plane_color_ctl |=3D PLANE_COLOR_INPUT_CSC_ENABLE;
    ...
}

Does this mean the fixed-function CSC hardware block remains disabled in
PLANE_COLOR_CTL when we have an RGB framebuffer with csc_ff_enable set to
true?

>  		icl_program_input_csc(dsb, plane, plane_state);
> =20
>  	skl_write_plane_wm(dsb, plane, crtc_state);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902075417.6566=
73-10-chaitanya.kumar.borah@intel.com?part=3D1
