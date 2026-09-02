Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4CCC61DFD
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 08:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A4D10F09E;
	Wed,  2 Sep 2026 08:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nA3Lb6jU";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF4310F09E;
 Wed,  2 Sep 2026 08:34:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DCFEB600C8;
 Wed,  2 Sep 2026 08:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F341F000E9;
 Wed,  2 Sep 2026 08:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788338091;
 bh=vNinhm/6sEkk0yHhHxCYOJTXyTnLSbLzIM9Ay2Wv2ZU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nA3Lb6jUjf30uzzGXb5xV0dIxyEmJIeo1offuMZeuAjG7CApBPm1/4iV72cFGvMDE
 o0S4hwlNjiyFNVFYxfp9zX2UwtqD7Dxhki5AB8ZfvSe5w9AkcfXCD0L9XAq2CGvhSk
 byx1/eA5hRemA17NYOM39eTHq+iK6FcNu0YYqghaKSym2Wczlg02F8T8vTna6dJ4d8
 Soyu27xwZBa/e9eqViJRU4CO79K2Fl1HN0U0y0eUsKFyX1G25biAhQxWliQ18sAzWN
 HzJz3IpUD9vkgCSiRidYR76+sGzB2mb7yRtLxM5HkaxjdAQXPJKxLuO9Tk1UO4zw9r
 rxS4e4uBJK/QA==
From: sashiko-bot@kernel.org
Subject: Re: [CI 8/9] drm/i915/color: Add color pipeline support for SDR planes
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260902075417.656673-9-chaitanya.kumar.borah@intel.com>
References: <20260902075417.656673-1-chaitanya.kumar.borah@intel.com>
 <20260902075417.656673-9-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 08:34:50 +0000
Message-Id: <20260902083451.67F341F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Exposing the color pipeline for SDR planes to user-space causes vi=
sual corruption and hardware state mismatches because the underlying hardwa=
re programming functions still artificially restrict operations to HDR plan=
es.

Pre-existing issues:
- [Critical] Dangling DRM object IDR pointer when colorop initialization fa=
ils (or on cleanup) leads to a Use-After-Free.
- [High] Missing NULL check after `kasprintf()` in `_intel_color_pipeline_p=
lane_init()` leads to a NULL pointer dereference when string allocation fai=
ls.
--

commit 4a507c298b13a8efe368f825fd9f9b9e49485cef
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

drm/i915/color: Add color pipeline support for SDR planes

Now that everything is in place expose the SDR plane color pipeline
to user-space.

> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/driver=
s/gpu/drm/i915/display/intel_color_pipeline.c
> index 6cf8080ee8000..4ea1f34dfb10e 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> @@ -155,17 +155,11 @@ int _intel_color_pipeline_plane_init(struct drm_pla=
ne *plane, struct drm_prop_en
> =20
>  int intel_color_pipeline_plane_init(struct drm_plane *plane, enum pipe p=
ipe)
>  {
> -	struct drm_device *dev =3D plane->dev;
> -	struct intel_display *display =3D to_intel_display(dev);
>  	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES] =3D {};
>  	int len =3D 0;
>  	int ret =3D 0;
>  	int i;
> =20
> -	/* Currently expose pipeline only for HDR planes */
> -	if (!icl_is_hdr_plane(display, to_intel_plane(plane)->id))
> -		return 0;
> -

[Severity: High]
Does removing this check cause unprogrammed hardware blocks to be activated?

By exposing the color pipeline to user-space for SDR planes, user-space can
configure the pipeline. If configured, glk_plane_color_ctl() sets the enable
bits (like PLANE_COLOR_PRE_CSC_GAMMA_ENABLE).=20

However, functions that program the LUT and CSC registers still appear to
skip SDR planes:

drivers/gpu/drm/i915/display/intel_color.c:xelpd_program_plane_pre_csc_lut(=
) {
    if (!icl_is_hdr_plane(display, plane))
        return;
    ...
}

This early return pattern also exists in xelpd_load_plane_csc_matrix() and
xelpd_program_plane_post_csc_lut().=20

Could this regression lead to visual corruption or hardware state mismatches
if the pipeline is enabled but the registers are never programmed?

>  	/* Add pipeline consisting of transfer functions */

[Severity: High]
This is a pre-existing issue, but does _intel_color_pipeline_plane_init()=20
need to check the return value of kasprintf()?

In _intel_color_pipeline_plane_init():

    list->name =3D kasprintf(GFP_KERNEL, "Color Pipeline %d", ...);
    return 0;

If kasprintf() fails, list->name is NULL. When this is passed down during=20
property registration, drm_property_add_enum() calls strlen(name):

drivers/gpu/drm/drm_property.c:drm_property_add_enum() {
    if (WARN_ON(strlen(name) >=3D DRM_PROP_NAME_LEN))
        return -EINVAL;
    ...
}

Can this lead to a NULL pointer dereference under memory pressure?

>  	ret =3D _intel_color_pipeline_plane_init(plane, &pipelines[len], pipe);
>  	if (ret)

[Severity: Critical]
This is a pre-existing issue, but can a failure during colorop=20
initialization or destruction lead to a use-after-free?

When drm_plane_colorop_init() is called, it successfully registers the=20
colorop with the DRM core mode object IDR:

drivers/gpu/drm/drm_colorop.c:drm_plane_colorop_init() {
    ret =3D drm_mode_object_add(dev, &colorop->base, DRM_MODE_OBJECT_COLORO=
P);
    ...
}

However, if an error occurs and intel_colorop_destroy() is called (such
as on the error path of _intel_color_pipeline_plane_init()), or when=20
drm_colorop_cleanup() is executed, the structure memory is freed but=20
drm_mode_object_unregister() is never called to remove the object from=20
the IDR.

Does this leave a dangling pointer in the mode object IDR that could be=20
accessed via the DRM_IOCTL_MODE_OBJ_GETPROPERTIES ioctl?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902075417.6566=
73-9-chaitanya.kumar.borah@intel.com?part=3D1
