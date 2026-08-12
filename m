Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AA8C5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 17:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8F410F0C7;
	Wed, 12 Aug 2026 17:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y00/HttH";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB2010EF37;
 Wed, 12 Aug 2026 09:48:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9AB7D402E3;
 Wed, 12 Aug 2026 09:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F861F000E9;
 Wed, 12 Aug 2026 09:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786528108;
 bh=Shuu8h32fjaafvOYqd4y3lauXwYeqNl2YbsS1l35PNY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Y00/HttH5EuhxWd14KiVWy8b9UvNQq0htj6da97XAFgSqvSZn2Qx/XHioecevBIQ7
 KTCBYQ7d3WYgMiuYQhvrjr+r5/v11t5VebHKJuDKSxQX0c5QFmXWGkYjL8MzMq65N9
 mMA9dXZosb23PbLDGKkLr48hf+R5aEXGQ6hRzWlv2v9QfE29GM32Ubl8ejusOzX1tc
 r7lKzYG0S8Tf9TeUUVuixzp5WolDHDpzABBaj31ZeM69FfTEVzj4CyncuOMyo5DDWR
 07lk/qfojZdgPTCJtEYDNI6JqHLNADlAFqA3oF8FPPKbIqGtV2e7dmm4/V6skzSUY/
 VUAW56pzita6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/i915/color: Add YUV buffer support on HDR planes
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260812085908.3159828-3-chaitanya.kumar.borah@intel.com>
References: <20260812085908.3159828-1-chaitanya.kumar.borah@intel.com>
 <20260812085908.3159828-3-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 09:48:27 +0000
Message-Id: <20260812094828.47F861F000E9@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 17:41:20 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Adding INTEL_PLANE_CB_CSC_FF to the color pipeline arrays incr=
eases their size beyond the MAX_COLOROP limit, causing a stack buffer overf=
low.
--

--- Patch [2]: [PATCH 2/2] drm/i915/color: Add YUV buffer support on HDR pl=
anes ---
commit 659bb21b3ebb587a758df27788a2ccbde4332e70
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

drm/i915/color: Add YUV buffer support on HDR planes

This commit adds the INTEL_PLANE_CB_CSC_FF (fixed function CSC) color
block as the first stage for HDR planes to enable YUV-to-RGB color space
conversion. It also updates the CSC programming logic to account for the
color pipeline programming.

> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/driver=
s/gpu/drm/i915/display/intel_color_pipeline.c
> index 38cfd6ed585d0..3f76b8d80430b 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> @@ -31,6 +31,7 @@ static const struct drm_colorop_funcs intel_colorop_fun=
cs =3D {
>   * the pipeline totally unusable.
>   */
>  static const enum intel_color_block xe3plpd_primary_plane_pipeline[] =3D=
 {
> +	INTEL_PLANE_CB_CSC_FF,
>  	INTEL_PLANE_CB_PRE_CSC_LUT,
>  	INTEL_PLANE_CB_CSC,
>  	INTEL_PLANE_CB_3DLUT,
> @@ -38,6 +39,7 @@ static const enum intel_color_block xe3plpd_primary_pla=
ne_pipeline[] =3D {
>  };

[Severity: Critical]
By adding this element, xe3plpd_primary_plane_pipeline now has 5 elements.
However, MAX_COLOROP is still defined as 4 in this file.

When initializing the pipeline in _intel_color_pipeline_plane_init(), the l=
ocal
colorop array is sized using MAX_COLOROP:

	struct intel_colorop *colorop[MAX_COLOROP];
	...
	if (plane_has_3dlut(display, pipe, plane)) {
		pipeline =3D xe3plpd_primary_plane_pipeline;
		pipeline_len =3D ARRAY_SIZE(xe3plpd_primary_plane_pipeline);
	}
	...
	for (i =3D 0; i < pipeline_len; i++) {
		colorop[i] =3D intel_color_pipeline_plane_add_colorop(plane, prev,
								    pipeline[i]);

Since pipeline_len evaluates to 5 for xe3plpd_primary_plane_pipeline, does =
this
loop overflow the colorop[] stack array on the final iteration?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812085908.3159=
828-1-chaitanya.kumar.borah@intel.com?part=3D2
