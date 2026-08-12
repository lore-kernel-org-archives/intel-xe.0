Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080F0C5CFDB
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 22:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9CB10F14E;
	Wed, 12 Aug 2026 22:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fCSrwo95";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138F010F133;
 Wed, 12 Aug 2026 22:10:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F4028600AD;
 Wed, 12 Aug 2026 22:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B601F000E9;
 Wed, 12 Aug 2026 22:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786572624;
 bh=ubDQc/K/dCguULMbJ5jFzOBaeHiIN2/i0D1kTbdCJPk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=fCSrwo95AKvr/Z0wzDni9U6rbGPAxScx0WMFWqm6YQ1dj/3nifuJUhLLoLRz052aZ
 3coUI9xL8U5uhKCXJK/sHFu025zTrRnr/lnKX4pIPecYWinfV7ksAQP2AdOrgUdT6Y
 yeCFwGxFCisTICcEi4NuJMfykwHYHE8NesKLagRTMWFGNzmFTbq8ktyKuoUil/6v/b
 daF6LAhV4QnHRR1VMMN66sHMMPGUw/yirlP0x0PbP7NK0X7cN3m90bczyWGXuMC1bF
 XJcunLJzBmiy2oimErvSluekpY3p9PNRXCYn1rEoa859bIalW9YdnuBJp1S/qKOFjz
 IphBYBQuqDaOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/i915/fbc: nuke CFB if Plane setting (except for
 surf addr) changes
To: "Austin Hu" <austin.hu@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260812215350.3753102-3-austin.hu@intel.com>
References: <20260812215350.3753102-1-austin.hu@intel.com>
 <20260812215350.3753102-3-austin.hu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 22:10:23 +0000
Message-Id: <20260812221024.67B601F000E9@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 22:17:09 +0000
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
- [Medium] Strict equality check on `uapi.src` forces a full FBC CFB nuke o=
n vertical panning (Y-offset changes), defeating dirty rectangle optimizati=
ons for scrolling.

Pre-existing issues:
- [High] Incorrect damage coordinate inversion math for 180-degree rotated =
planes results in 0-height dirty rectangles, freezing screen updates.
--

--- Patch [2]: [PATCH 2/2] drm/i915/fbc: nuke CFB if Plane setting (except =
for surf addr) changes ---
commit 50b0481138fde60ac48db330dd972dfba35b3f10
Author: Austin Hu <austin.hu@intel.com>

drm/i915/fbc: nuke CFB if Plane setting (except for surf addr) changes
   =20
When FBC Dirty Rectangle mode is enabled, any non-PLANE_SURF register
update requires fetching the full plane frame buffer from memory to
re-compress and update the CFB in stolen memory. This commit checks
plane state attributes during atomic commits and forces a full CFB
nuke if any setting other than the surface address changes.

> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i=
915/display/intel_fbc.c
> index c0fed695af0da..6bf5c09476713 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -1516,8 +1516,124 @@ static bool intel_fbc_is_ok(const struct intel_pl=
ane_state *plane_state)
>  		intel_fbc_is_cfb_ok(plane_state);
>  }
> =20
> +/*
> + * From BSpec about "FBC Dirty Rectangle", when Dirty Rectangle mode is =
active,

[ ... ]

> +static bool intel_fbc_dirty_rect_needs_nuke(struct intel_atomic_state *s=
tate,
> +					    struct intel_plane *plane)
> +{
> +	struct intel_display *display =3D to_intel_display(state);

[ ... ]

> +	if (skl_plane_aux_dist(old_plane_state, 0) !=3D
> +	    skl_plane_aux_dist(new_plane_state, 0)) {
> +		drm_dbg_kms(display->drm,
> +			    "[PLANE:%d:%s] AUX_DIST changed in FBC DIRTY RECT\n",
> +			    plane->base.base.id, plane->base.name);
> +		return true;
> +	}
> +
> +	if (!drm_rect_equals(&old_plane_state->uapi.src,
> +			     &new_plane_state->uapi.src) ||
> +	    !drm_rect_equals(&old_plane_state->uapi.dst,
> +			     &new_plane_state->uapi.dst)) {

[Severity: Medium]
Does this strict equality check on uapi.src accidentally force a full CFB
nuke during vertical panning?

A vertical pan (scrolling) changes uapi.src.y1 to shift the viewport, which
translates to a surface address update (PLANE_OFFSET / PLANE_SURF registers=
).
Because drm_rect_equals() checks the coordinates (x1 and y1), it fails when
panning, erroneously triggering a full CFB nuke on every frame of the scrol=
l.

Should this perhaps verify drm_rect_width() and drm_rect_height() instead
to allow pure viewport shifts?

> +		drm_dbg_kms(display->drm,
> +			    "[PLANE:%d:%s] Size/coords changed in FBC DIRTY RECT\n",
> +			    plane->base.base.id, plane->base.name);
> +		return true;
> +	}
> +
> +	if (old_plane_state->hw.alpha !=3D new_plane_state->hw.alpha) {

[ ... ]

>  static void
> -__intel_fbc_prepare_dirty_rect(const struct intel_plane_state *plane_sta=
te,
> +__intel_fbc_prepare_dirty_rect(struct intel_atomic_state *state,
> +			       const struct intel_plane_state *plane_state,
>  			       const struct intel_crtc_state *crtc_state)
>  {
>  	struct intel_plane *plane =3D to_intel_plane(plane_state->uapi.plane);
> @@ -1538,7 +1654,10 @@ __intel_fbc_prepare_dirty_rect(const struct intel_=
plane_state *plane_state,
>  		return;
>  	}
> =20
> -	if (drm_rect_visible(damage)) {
> +	if (intel_fbc_dirty_rect_needs_nuke(state, plane)) {
> +		/* compress the entire region due to non PLANE_SURF updating. */
> +		*fbc_dirty_rect =3D DRM_RECT_INIT(0, y_offset, width, height);
> +	} else if (drm_rect_visible(damage)) {
>  		int y1, y2;
> =20
>  		if (plane_state->hw.rotation & DRM_MODE_ROTATE_180) {
>  			/* Under 180 degree rotation, coordinate system is inverted */
>  			int inv_y1 =3D height - damage->y2;
>  			int inv_y2 =3D height - damage->y1;
> =20
>  			y1 =3D clamp(y_offset + inv_y1, y_offset, y_end);
>  			y2 =3D clamp(y_offset + inv_y2, y_offset, y_end);

[Severity: High]
This is a pre-existing issue, but does this math incorrectly treat absolute
framebuffer coordinates as relative coordinates, resulting in zero-height
dirty rectangles for 180-degree rotated displays?

The damage clip is already in absolute framebuffer coordinates, meaning
damage->y2 resides between y_offset and y_end. Subtracting this from the
plane's height produces a value that, when added to y_offset, is almost
always less than y_offset.=20

The clamp() function then pins both y1 and y2 strictly to y_offset,
programming a zero-height dirty rectangle and freezing screen updates on
rotated displays.

Could this be corrected to account for the absolute offset, perhaps using
something like y_end - (damage->y2 - y_offset)?

>  		} else {
>  			y1 =3D clamp(damage->y1, y_offset, y_end);
>  			y2 =3D clamp(damage->y2, y_offset, y_end);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812215350.3753=
102-1-austin.hu@intel.com?part=3D2
