Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B186C98321
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 17:55:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3417410FBCD;
	Fri, 25 Sep 2026 17:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W5WZpOTi";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD41D10FBC4;
 Fri, 25 Sep 2026 17:55:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 21BF86025F;
 Fri, 25 Sep 2026 17:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED1A1F000FF;
 Fri, 25 Sep 2026 17:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790358953;
 bh=Nq738Gvptmwj0ks0Rk/AewJIA7BF8GMAxOiETsIb0e4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=W5WZpOTiPhlmISAfzpM3uvfw6FvzVAlFGh6gnoygn7yLngCpySZ/QpZlbLQRumZ3D
 W3VVPct06t87Q0wdwpLzis3jb/tIPs0Bag6wb0caL3rbb/Z9kazfBRoO8X6WDVMulo
 cekzrhrAN3yQSqOI0wode4lzthrjfjo4uCFLsfygQp77mc0Q5p/qQlB6cOo+oXlBFT
 P5HyqZtVa+O1k3yR2KG1g8BC5X7IIKlLFY2jh21b7uSGkaxltKR4j/fIclXQJH8kM2
 6rQ2ZN/NLVL0v5h0sKGI4zjTyGdxItNKpeZeRoC7je3hswzykWwaIA4XpjV4VAel/K
 OLGsCYbJxkpsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] drm/i915/fbc: nuke CFB if Plane setting (except
 for surf addr) changes
To: "Austin Hu" <austin.hu@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260925173658.1042048-4-austin.hu@intel.com>
References: <20260925173658.1042048-1-austin.hu@intel.com>
 <20260925173658.1042048-4-austin.hu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 17:55:53 +0000
Message-Id: <20260925175553.9ED1A1F000FF@smtp.kernel.org>
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
- [High] drm/i915/fbc: Severe performance regression due to overloaded FBC =
nuke checks
- [High] drm/i915/fbc: Missing state checks cause visual corruption with FB=
C dirty rect
--

commit 224f5233b9e570c9b8787cab16713f38059127bf
Author: Austin Hu <austin.hu@intel.com>

drm/i915/fbc: nuke CFB if Plane setting (except for surf addr) changes

When FBC Dirty Rectangle mode is enabled, any non-PLANE_SURF register update
requires fetching the full plane frame buffer from memory to re-compress and
update the CFB in stolen memory. This commit checks plane state attributes
during atomic commits and forces a full CFB nuke if any setting other than
the surface address changes.

> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i=
915/display/intel_fbc.c
> index 3915dea9edb1e..0d3b25e7a9fc1 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
[ ... ]
> @@ -1548,14 +1549,63 @@ static bool intel_fbc_can_flip_nuke(struct intel_=
atomic_state *state,
>  	    intel_fbc_override_cfb_stride(new_plane_state))
>  		return false;
> =20
> +	if (!HAS_FBC_DIRTY_RECT(display))
> +		return true;
> +
> +	/*
> +	 * From BSpec about "FBC Dirty Rectangle", when Dirty Rectangle mode is
> +	 * active, partial updates only apply to surface address changes. Any o=
ther
> +	 * plane state modification requires Plane to fetch full-plane pixel da=
ta
> +	 * from memory to re-compress and update the entire CFB in stolen memor=
y.
> +	 * Once fully re-compressed, subsequent atomic commits go ahead with FBC
> +	 * dirty rectangle updates for smooth visual updates.
> +	 *
> +	 * So check other Plane attribute changed except for its surface addres=
s by
> +	 * referring to intel_async_flip_check_hw() which also checks async fli=
p.
> +	 */
> +
> +	/* Includes pixel_blend_mode, color_encoding & color_range checking. */
> +	if (old_plane_state->color_ctl !=3D new_plane_state->color_ctl)
> +		return false;

[Severity: High]
Does this code miss checks for other plane properties, potentially causing
visual corruption?

The commit dictates that any non-PLANE_SURF register update requires a full=
 CFB
nuke in FBC Dirty Rectangle mode. However, intel_fbc_can_flip_nuke() misses
checks for plane_state->ccval (Clear Color Value), plane_state->ctl (Plane
Control), and plane_state->scaler_id.

If an unprivileged DRM client updates these properties (e.g., changing the
clear color via fast clear), the function returns true, skipping the full
dirty rect expansion. The hardware would then fail to re-compress the new
pixel data, leaving artifacts on the display.

> +
> +	if (!drm_rect_equals(&old_plane_state->uapi.src,
> +			     &new_plane_state->uapi.src) ||
> +	    !drm_rect_equals(&old_plane_state->uapi.dst,
> +			     &new_plane_state->uapi.dst))
> +		return false;
[ ... ]
> @@ -1573,7 +1623,15 @@ __intel_fbc_prepare_dirty_rect(const struct intel_=
plane_state *plane_state,
>  		return;
>  	}
> =20
> -	if (drm_rect_visible(damage)) {
> +	if (!intel_fbc_can_flip_nuke(state, crtc, plane)) {
> +		if (HAS_FBC_DIRTY_RECT(display))
> +			drm_dbg_kms(display->drm,
> +				    "[PLANE:%d:%s] Non surf addr changed for FBC DIRTY RECT\n",
> +				    plane->base.base.id, plane->base.name);
> +
> +		/* compress the entire region due to non PLANE_SURF updating. */
> +		*fbc_dirty_rect =3D DRM_RECT_INIT(0, y_offset, width, height);
> +	} else if (drm_rect_visible(damage)) {

[Severity: High]
Could reusing intel_fbc_can_flip_nuke() here cause a severe performance
degradation due to unnecessary vblank stalls during atomic plane updates?

When FBC Dirty Rect mode is enabled (Display Version 30+), changing plane
properties (like moving a window, modifying alpha, or color bounds) causes
intel_fbc_can_flip_nuke() to return false.

This will cause intel_fbc_deactivate() to be triggered in
__intel_fbc_pre_update() (which checks intel_fbc_can_flip_nuke()), which se=
ts
need_vblank_wait =3D true.=20

It seems the dirty rect expansion is inadvertently coupled with the FBC
deactivation logic. This is reachable by any userspace application performi=
ng
non-surface address plane updates (like window dragging), leading to consta=
nt
vblank stalls and visual stuttering.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925173658.1042=
048-1-austin.hu@intel.com?part=3D3
