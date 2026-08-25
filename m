Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E77AC61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF70C10E13C;
	Tue, 25 Aug 2026 17:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IK2qnTgO";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B1010EB2D;
 Tue, 25 Aug 2026 17:14:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 59D81401F6;
 Tue, 25 Aug 2026 17:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E761F000E9;
 Tue, 25 Aug 2026 17:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787678040;
 bh=ekRsERilmeFnunAs+NgPmm+bpj8J1LCW/HrPqsMQVfw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=IK2qnTgO3ejg9GYiN04ikjHSnUD19uh5K1eS0HM45nq11rsjJXGgOM1XrbyPArCLB
 RPqIYjzW9n0328Hk3b+JCBzVDiqAI8wcITA4yL/vl3Z/gla89WJgScjg1+Cr/vyD8R
 IZ5cXH2M38kgdPSted93/q31/UaJBs554929liHC4/53gAazN2u9gLgo3BI7x8G1oG
 jUv/rk3PC+0ex0a5am42T07cVObqXpNtjrN8D3qLRRa9VGeH4jP3tmT/5ziywLJIBP
 CLD9SGyr/FM7BaQr8VIIhxUWOITzBZyCSuAXJ8AaGP5q2dXQbi0t3oBIdM+NEbINHv
 c5M3NifsyVHwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] drm/i915/fbc: nuke CFB if Plane setting (except
 for surf addr) changes
To: "Austin Hu" <austin.hu@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260825165629.1799744-3-austin.hu@intel.com>
References: <20260812215350.3753102-1-austin.hu@intel.com>
 <20260825165629.1799744-3-austin.hu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:13:59 +0000
Message-Id: <20260825171400.10E761F000E9@smtp.kernel.org>
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
- [High] Incorrect coordinate inversion for 180-degree rotation causes empt=
y or truncated FBC dirty rectangles.
- [Medium] intel_fbc_can_flip_nuke fails to detect color_encoding changes o=
n ICL+ HDR planes.
- [Medium] intel_fbc_can_flip_nuke fails to check for Color Key (ckey) chan=
ges.
- [Medium] intel_fbc_can_flip_nuke fails to check for Fast Clear Color Valu=
e (ccval) changes.
--

commit 10fd2eb7ca0c8e663bc8d78356bb0bf9afd6b14b
Author: Austin Hu <austin.hu@intel.com>

drm/i915/fbc: nuke CFB if Plane setting (except for surf addr) changes

This commit forces a full compressed framebuffer (CFB) nuke when any plane
state attribute other than the surface address changes while FBC Dirty
Rectangle mode is enabled. It checks various plane state attributes during
atomic commits to determine if the full plane pixel data needs to be
re-compressed.

> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i=
915/display/intel_fbc.c
> index c0fed695af0da..34c0e42dfdab6 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
[ ... ]
> @@ -1516,11 +1516,106 @@ static bool intel_fbc_is_ok(const struct intel_p=
lane_state *plane_state)
[ ... ]
> +	/* Includes pixel_blend_mode, color_encoding & color_range checking. */
> +	if (old_plane_state->color_ctl !=3D new_plane_state->color_ctl)
> +		return false;

[Severity: Medium]
Is checking color_ctl sufficient for detecting color encoding changes on IC=
L+
HDR planes? For these planes, the color encoding (like BT.2020 vs BT.709) is
not stored in color_ctl, but is directly programmed via
plane_state->hw.color_encoding. Will this cause the display to show stale F=
BC
data if the color encoding changes but color_ctl remains the same?

[ ... ]
> +	if (old_plane_state->decrypt !=3D new_plane_state->decrypt)
> +		return false;
> +
> +	if (old_plane_state->cus_ctl !=3D new_plane_state->cus_ctl)
> +		return false;
> +
> +	return true;
> +}

[Severity: Medium]
Are we missing checks for Color Key changes here? If userspace updates
the color key properties, plane_state->ckey and plane_state->ctl are modifi=
ed.
Since they are omitted from this check, could this update the PLANE_KEYVAL
registers without triggering the necessary FBC nuke?

[Severity: Medium]
Similarly, does this function need to compare the fast clear color values
(old_plane_state->ccval and new_plane_state->ccval)? If the clear color val=
ue
changes for a compressed framebuffer, FBC dirty rect updates might proceed
without full CFB re-compression, potentially corrupting display content.

[ ... ]
> @@ -1538,7 +1633,15 @@ __intel_fbc_prepare_dirty_rect(const struct intel_=
plane_state *plane_state,
[ ... ]
> -	if (drm_rect_visible(damage)) {
> +	if (!intel_fbc_can_flip_nuke(state, crtc, plane)) {
[ ... ]
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
Does this coordinate inversion for 180-degree rotation correctly account for
the y_offset? Since the damage->y1 and damage->y2 coordinates are already in
absolute memory coordinates (and include the y_offset), calculating
inv_y1 =3D height - damage->y2 and then adding y_offset back appears to
mathematically subtract y_offset entirely. Could this result in empty or
mis-clamped dirty rectangles when the screen is rotated 180 degrees?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812215350.3753=
102-1-austin.hu@intel.com?part=3D2
