Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B486C61DBC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EE310E13C;
	Tue, 25 Aug 2026 17:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Qo0kxZ8/";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140B310E13C;
 Tue, 25 Aug 2026 17:16:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2A0AE60254;
 Tue, 25 Aug 2026 17:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4E61F00A3A;
 Tue, 25 Aug 2026 17:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787678171;
 bh=ykR+FbR5z26lAk1N6kT3fi9GYZQTz4CcRAVrGkD73RM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Qo0kxZ8/DfqxHohSbnEq2LpNq+4Xbz+TBhzXYcfbIVSId+9JkxLAoo504jQj5sG90
 Zqaj5wM3PTyMTe4zvnm154xNBGAO94C6UjeA4Nxz5bRe7O0GK4pzUyr0i6KXoqH/5/
 NWd8da/59jjl5NA2mcelbrtFYzx4fGbzpahe2KWdP+ZjHn6N7+QbFU0cCVY7gNwm9k
 hmST2KzG4inQwu5qjv+LKtj9BwIox+6mpsar5iEtb/yuZyO4prt5Yqt9VBuMSr8ldk
 +JoES6TczXOnzm68qVuV0MtnkLQa3LAqsHY/ZP2ex+oW1pR2aYwvUu+wHuQLDARQaQ
 PQbo95QcQcaug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] drm/i915/fbc: fbc_dirty_rect restrictions and
 logging
To: "Austin Hu" <austin.hu@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260825165629.1799744-2-austin.hu@intel.com>
References: <20260812215350.3753102-1-austin.hu@intel.com>
 <20260825165629.1799744-2-austin.hu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:16:11 +0000
Message-Id: <20260825171611.9E4E61F00A3A@smtp.kernel.org>
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
- [High] Incorrect 180-degree rotation math negates `y_offset` instead of m=
aintaining it, resulting in a 0-height dirty rectangle that breaks FBC upda=
tes.
- [Medium] Spurious 'FBC dirty rect out of range' debug logging on every fr=
ame update during 180-degree rotation.
--

commit 4adeca8228048877f976377febbd0e77586bd42c
Author: Charlton Lin <charlton.lin@intel.com>

drm/i915/fbc: fbc_dirty_rect restrictions and logging

This commit clamps the fbc dirty rectangle coordinates to the valid frame
buffer range to prevent out-of-bounds access. It also adds a debug message
to log when clamping occurs.

> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i=
915/display/intel_fbc.c
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
[ ... ]
> @@ -1535,11 +1538,41 @@ __intel_fbc_prepare_dirty_rect(const struct intel=
_plane_state *plane_state,
>  		return;
>  	}
> =20
> -	if (drm_rect_visible(damage))
> -		*fbc_dirty_rect =3D *damage;
> -	else
> +	if (drm_rect_visible(damage)) {
> +		int y1, y2;
> +
> +		if (plane_state->hw.rotation & DRM_MODE_ROTATE_180) {
> +			/* Under 180 degree rotation, coordinate system is inverted */
> +			int inv_y1 =3D height - damage->y2;
> +			int inv_y2 =3D height - damage->y1;
> +
> +			y1 =3D clamp(y_offset + inv_y1, y_offset, y_end);
> +			y2 =3D clamp(y_offset + inv_y2, y_offset, y_end);

[Severity: High]
Does this calculation erroneously mix relative sizes with absolute
coordinates?

The math `height - damage->y2` seems to assume `damage` is viewport-relativ=
e,
but it is actually in absolute framebuffer coordinates (which contains
`y_offset`). When `y_offset` is added back here, it effectively cancels out.

If `y_offset >=3D height`, this strictly clamps to `y_offset`, resulting in
a 0-height dirty rectangle (`y1 =3D y2 =3D y_offset`), which can cause a
regression for fbc screen updates when 180-degree rotation is active.

This issue does not appear to be fixed in the subsequent patch in the serie=
s.

> +		} else {
> +			y1 =3D clamp(damage->y1, y_offset, y_end);
> +			y2 =3D clamp(damage->y2, y_offset, y_end);
> +		}
> +
> +		/*
> +		 * Clamp dirty rect to the valid FB range [y_offset, y_end].
> +		 * Per Bspec:
> +		 *   start_line >=3D y_offset
> +		 *   end_line <=3D y_offset + plane_height
> +		 */
> +		if (y1 !=3D damage->y1 || y2 !=3D damage->y2)

[Severity: Medium]
Will this condition trigger a false positive on every frame update during
180-degree rotation?

The check `y1 !=3D damage->y1` directly compares the newly inverted coordin=
ate
(`y1`) against the original non-inverted coordinate (`damage->y1`). This
will almost always evaluate to true regardless of whether any actual
clamping occurred.

This can potentially spam the kernel log with false positive 'fbc dirty
rect out of range' messages whenever kms debugging is enabled.

This issue also does not appear to be fixed in the subsequent patch in the
series.

> +			drm_dbg_kms(display->drm,
> +				    "[PLANE:%d:%s] FBC dirty rect out of range: y1=3D%d y2=3D%d clam=
ped to y1=3D%d y2=3D%d (y_offset=3D%d y_end=3D%d)\n",
> +				    plane->base.base.id, plane->base.name,
> +				    damage->y1, damage->y2, y1, y2, y_offset, y_end);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812215350.3753=
102-1-austin.hu@intel.com?part=3D1
