Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C3EC5DF69
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 22:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF30410F149;
	Wed, 12 Aug 2026 22:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eufxawFp";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDCC10F127;
 Wed, 12 Aug 2026 22:08:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C618D41901;
 Wed, 12 Aug 2026 22:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73EEF1F000E9;
 Wed, 12 Aug 2026 22:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786572533;
 bh=a3qGFz47d9tRqfTr/CL2zuwTvComG4Do3HqW+E3BCi4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=eufxawFpsmEiiUaXsCALx7Ki8kf3H7IUYSuZsMRbzmwGRNgPndJrhc6KKHOKhq+T4
 cfkgakzPGwD8kcYnKcXLFWi0Qea1C9KKGlNWhKfh++8VYBfVEMRDsYrqJMWNKTHO5A
 Gvu8fyWvBg/JNQhSK/GRoNW28UsTz19GmHOBaPjMThmFjU6+YnKelY1A0irRIGVso1
 j/KS/0N8EqOSB751AtfOkTdclSJYaKcYRlm3PisxlcQuxJgvIUvzpcTqwqFG1hfD1R
 fp1BSViwj9bQAxfJqVJj7/9xmNRu0V6TScBG6UX+S8kTUkwXTpDDyHdohjkG6OKt5V
 ABjnQiR8kCYbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/i915/fbc: fbc_dirty_rect restrictions and logging
To: "Austin Hu" <austin.hu@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260812215350.3753102-2-austin.hu@intel.com>
References: <20260812215350.3753102-1-austin.hu@intel.com>
 <20260812215350.3753102-2-austin.hu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 22:08:52 +0000
Message-Id: <20260812220853.73EEF1F000E9@smtp.kernel.org>
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
- [High] Incorrect coordinate space math in the 180-degree rotation branch =
causes the FBC dirty rectangle to collapse, breaking FBC tracking.
- [Medium] The 'FBC dirty rect out of range' debug warning will trigger spu=
riously on almost every frame when the plane is rotated 180 degrees.
--

--- Patch [1]: [PATCH 1/2] drm/i915/fbc: fbc_dirty_rect restrictions and lo=
gging ---
commit 234fb7237db4bb8e467458e88cc6ed3f6e850511
Author: Charlton Lin <charlton.lin@intel.com>

drm/i915/fbc: fbc_dirty_rect restrictions and logging

Clamp the FBC dirty rectangle coordinates to the valid frame buffer
range [y_offset, y_end] to prevent out-of-bounds coordinates, and
log a debug message when clamping occurs.

> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i=
915/display/intel_fbc.c
> index f61b4a218d6ef..c0fed695af0da 100644
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
Can this math result in collapsed dirty rectangles?

Because damage->y2 already includes the absolute y_offset, height - damage-=
>y2
yields a large negative number. When y_offset is added back, the result fal=
ls
well below y_offset, causing both y1 and y2 to unconditionally clamp to
y_offset.

This collapses the FBC dirty rectangle to a 0-height region starting at
y_offset, entirely missing the actual damaged pixels.

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
> +			drm_dbg_kms(display->drm,
> +				    "[PLANE:%d:%s] FBC dirty rect out of range: y1=3D%d y2=3D%d clam=
ped to y1=3D%d y2=3D%d (y_offset=3D%d y_end=3D%d)\n",
> +				    plane->base.base.id, plane->base.name,
> +				    damage->y1, damage->y2, y1, y2, y_offset, y_end);

[Severity: Medium]
Will this warning trigger spuriously on almost every frame when the plane is
rotated 180 degrees?

For 180-degree planes, the code intentionally alters y1 and y2 to represent
inverted coordinates. The warning condition compares these new inverted
coordinates directly against the original, non-inverted coordinates.

Because an inverted coordinate will inherently mismatch a non-inverted one,
this condition evaluates to true on nearly every atomic update involving da=
mage
for rotated planes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812215350.3753=
102-1-austin.hu@intel.com?part=3D1
