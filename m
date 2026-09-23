Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2DCC98302
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 17:45:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC40610F128;
	Wed, 23 Sep 2026 17:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ehJrROTa";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F3710F142;
 Wed, 23 Sep 2026 17:45:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id ABFFF600AA;
 Wed, 23 Sep 2026 17:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F0B31F000FF;
 Wed, 23 Sep 2026 17:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790185510;
 bh=84cTYRc8uvR5FCgFamQhYWFmQc7RoTfwDKr5uhBG96s=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ehJrROTaNNa2ZF2F2EKB15ZuoqDKU4TdbAbckmqGuYcFdmfCw0Co5qTOmVza5h44v
 GlYdtXadI3Uw94zXIVQouDHmiaKgdW0BvxWg6Npcvk/jPpTyYcdYjGHNGzyJ9tcx/H
 wVPOxnQ1DVyRpqsNEyxalFpqjltI7Rr4LMRRFQ4a6sMQPJLLuRRVs5mFR8jqpBSPr5
 d+2KLNtcr3OO7nCB/4qyYWVwy6+BAfPOgD/r5bnCLQ0+cEybN7DaJFreaaFDDv45is
 8/3g8FwHdUkIQ7AvJk+R4rz6y0CyPaUounLi1U/uFMw78LinqlpuhFJomu5z8IhDz0
 0ZS5tV392eAww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] drm/i915/fbc: nuke CFB if Plane setting (except
 for surf addr) changes
To: "Austin Hu" <austin.hu@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260923172803.1011636-4-austin.hu@intel.com>
References: <20260812215350.3753102-1-austin.hu@intel.com>
 <20260923172803.1011636-4-austin.hu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 17:45:09 +0000
Message-Id: <20260923174510.2F0B31F000FF@smtp.kernel.org>
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
- [Low] drm/i915/fbc: redundant full dirty rect assignment is dead code
--

commit b3f8f671dc6c5ad11aa10ae1d17ed6ba529a91c9
Author: Austin Hu <austin.hu@intel.com>

    drm/i915/fbc: nuke CFB if Plane setting (except for surf addr) changes
   =20
    When FBC Dirty Rectangle mode is enabled, any non-PLANE_SURF register
    update requires fetching the full plane frame buffer from memory to
    re-compress and update the CFB in stolen memory. This commit checks
    plane state attributes during atomic commits and forces a full CFB nuke
    if any setting other than the surface address changes.

> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i=
915/display/intel_fbc.c
> index e8583092de663..1ab583eadfcb3 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c

[ ... ]

> @@ -1583,7 +1633,15 @@ __intel_fbc_prepare_dirty_rect(const struct intel_=
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

[Severity: Low]
Is this fallback assignment to *fbc_dirty_rect dead code?

If intel_fbc_can_flip_nuke() returns false here, that same condition causes
__intel_fbc_pre_update() to unconditionally call intel_fbc_deactivate(),
disabling FBC in hardware.

When FBC is subsequently reactivated in __intel_fbc_post_update(), the
hardware naturally fetches the entire plane from scratch to build the initi=
al
compressed framebuffer.

Doesn't this disable/enable cycle bypass the programmed XE3_FBC_DIRTY_RECT
register on the first frame, meaning this assignment never takes effect?

> +	} else if (drm_rect_visible(damage)) {
>  		int y1, y2;
> =20
>  		if (plane_state->hw.rotation & DRM_MODE_ROTATE_180) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923172803.1011=
636-1-austin.hu@intel.com?part=3D3
