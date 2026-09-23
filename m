Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF20C98302
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 17:44:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B9810E954;
	Wed, 23 Sep 2026 17:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z+STUzxb";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361F510E93B;
 Wed, 23 Sep 2026 17:44:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BF03143C75;
 Wed, 23 Sep 2026 17:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DEA21F000FF;
 Wed, 23 Sep 2026 17:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790185484;
 bh=C3GO3ZeQS/WmC83mmaqsvJ9NtR68d1KBgbJQ/i2CECM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Z+STUzxbW7G5xuVmSnmrLdpSmA3MIIxvrPDA7Ed36tdjNKfuSH6c7thIJMpivo6lX
 3dBrPR26dUeoak/7Y3XRbO5ZVG+0CQ19N1fU2f4/2KBC6KCKf4RfyfwGrsfHWtITJD
 iCGwzLoHEHcJc87dZcZIf343YIvaD5KvrEmjIcOizq3WirKUJfA4+rTjJDKgwZu24r
 ZEo1fdBViLdAV1rR2uYASA3gkoM8v/qdKU+DhNzmCzQSLJbk2E5g8WuJtmMu2SAmNo
 CnNu7xcc4tQRmoNhphwtVdv5KEfCoxXvz1ZaJGlcz8DzOcK1QWR/xFOGGI1yg0CvEJ
 P1UVzAcRObHJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] drm/i915/fbc: fbc_dirty_rect restrictions and
 logging
To: "Austin Hu" <austin.hu@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260923172803.1011636-3-austin.hu@intel.com>
References: <20260812215350.3753102-1-austin.hu@intel.com>
 <20260923172803.1011636-3-austin.hu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 17:44:43 +0000
Message-Id: <20260923174444.6DEA21F000FF@smtp.kernel.org>
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
- [High] drm/i915/fbc: invalid FBC dirty rect for 180-degree rotation when =
y_offset > 0
- [Medium] drm/i915/fbc: spurious debug log spam on 180-degree rotated plan=
es
--

commit e741ad7c090c4e479fc0c403a1f27d2b43fe1e44
Author: Charlton Lin <charlton.lin@intel.com>

drm/i915/fbc: fbc_dirty_rect restrictions and logging

Clamp the FBC dirty rectangle coordinates to the valid frame buffer
range [y_offset, y_end] to prevent out-of-bounds coordinates, and
log a debug message when clamping occurs.

> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i=
915/display/intel_fbc.c
> index 0f841e5b42826..e8583092de663 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c

[ ... ]

> @@ -1580,11 +1583,41 @@ __intel_fbc_prepare_dirty_rect(const struct intel=
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
Does this math work correctly when y_offset is greater than 0?

Since damage coordinates are in absolute framebuffer space and bounded by
[y_offset, y_end], damage->y2 can be larger than height when y_offset > 0.
This would cause inv_y1 to become negative.=20

Adding this negative value to y_offset makes the result less than y_offset,
causing the clamp() to always collapse the dirty rect coordinate to y_offse=
t.
Will this cause screen update failures for rotated planes with a source cro=
p?

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
Will this condition generate false positive log spam when the plane has
180-degree rotation?

For a rotated plane, y1 and y2 are computed as inverted coordinates, but
this check compares them directly against the original non-inverted damage
coordinates. Since inversion naturally changes the coordinate values,
won't this almost always evaluate to true and falsely log that clamping
occurred?

> +			drm_dbg_kms(display->drm,
> +				    "[PLANE:%d:%s] FBC dirty rect out of range: y1=3D%d y2=3D%d clam=
ped to y1=3D%d y2=3D%d (y_offset=3D%d y_end=3D%d)\n",
> +				    plane->base.base.id, plane->base.name,
> +				    damage->y1, damage->y2, y1, y2, y_offset, y_end);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923172803.1011=
636-1-austin.hu@intel.com?part=3D2
