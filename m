Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9484C98328
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 17:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B4410FBB9;
	Fri, 25 Sep 2026 17:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZKfHx3H7";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF4910E5F5;
 Fri, 25 Sep 2026 17:52:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id ACB4860136;
 Fri, 25 Sep 2026 17:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370F51F000FF;
 Fri, 25 Sep 2026 17:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790358776;
 bh=8V76VPlwV3L5MhzW5pZRm9YL5ggiD6WM0NkZwA3CLIk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ZKfHx3H7dgutbZlH7uMgWeH13KPNpPyD96RKvX7Nq9zCfiKYiOv0npg6fjb1hxQQw
 VsKpwY8Ov9m/uog++OEhlUOst1L1ejG7YlqlgFqyvZ3wcoHMLWx3BcpHsSo/ogaeop
 grOSociQSjcB4qcbwvNJbtIIYlSJ9PT4OQfynebxDmMtc7UpmDfJxmc/jQLc8sCWsc
 7EjxrqMrWiOZ3cUEw4AA+bTfc9yiIzpsKjbrhyv6X38SMqSmbh6KycYbdEM1G73z0F
 yKij6i+N/ffbNLVzTLmzUhFNBuUS+bWrHPURmbtKZwtPDY/8OgqKwH59yzPbdmRUfT
 0GqdYLrPSiX9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] drm/i915/fbc: fbc_dirty_rect restrictions and
 logging
To: "Austin Hu" <austin.hu@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260925173658.1042048-3-austin.hu@intel.com>
References: <20260925173658.1042048-1-austin.hu@intel.com>
 <20260925173658.1042048-3-austin.hu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 17:52:55 +0000
Message-Id: <20260925175256.370F51F000FF@smtp.kernel.org>
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
- [High] drm/i915/fbc: collapsed FBC dirty rect for panned or rotated planes
--

commit 688db83891029bf71adf9b522ab593681a2edb50
Author: Charlton Lin <charlton.lin@intel.com>

    drm/i915/fbc: fbc_dirty_rect restrictions and logging
   =20
    Clamp the FBC dirty rectangle coordinates to the valid frame buffer
    range [y_offset, y_end] to prevent out-of-bounds coordinates, and
    log a debug message when clamping occurs.

> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i=
915/display/intel_fbc.c
> index c6f9e6506f630..3915dea9edb1e 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -1556,11 +1556,14 @@ __intel_fbc_prepare_dirty_rect(const struct intel=
_plane_state *plane_state,
>  			       const struct intel_crtc_state *crtc_state)
>  {

[ ... ]

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
Does subtracting an absolute coordinate from a relative size here break the
dirty rect for rotated planes?

The damage rectangle coordinates are in absolute framebuffer space, while
height and y_offset are relative. If an absolute coordinate like damage->y2
exceeds the relative height, inv_y1 becomes negative.

Could this cause y_offset + inv_y1 to fall below y_offset, forcing clamp()
to always return y_offset and collapse the FBC dirty rect to zero height?

> +		} else {
> +			y1 =3D clamp(damage->y1, y_offset, y_end);
> +			y2 =3D clamp(damage->y2, y_offset, y_end);

[Severity: High]
Are absolute coordinates being incorrectly clamped against tile-relative bo=
unds
here in __intel_fbc_prepare_dirty_rect()?

For panned planes where the source Y offset is non-zero, damage->y1 might be
much larger than the relative y_end. For example, if damage->y1 is 500 and
y_end is 120, wouldn't clamping an absolute damage coordinate against y_end
force both y1 and y2 to y_end?

Could this result in the dirty rect collapsing to zero height and halting
compressed framebuffer updates?

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

[Severity: High]
Since absolute damage coordinates will naturally differ from tile-relative
clamped coordinates, will this condition evaluate to true incorrectly?

If so, does this falsely trigger the debug message and spam the kernel logs
whenever panned or rotated planes are configured by a compositor?

> +
> +		fbc_dirty_rect->x1 =3D damage->x1;
> +		fbc_dirty_rect->x2 =3D damage->x2;
> +		fbc_dirty_rect->y1 =3D y1;
> +		fbc_dirty_rect->y2 =3D y2;
> +	} else {
>  		/* dirty rect must cover at least one line */
>  		*fbc_dirty_rect =3D DRM_RECT_INIT(0, y_offset, width, 1);
> +	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925173658.1042=
048-1-austin.hu@intel.com?part=3D2
