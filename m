Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC72CC88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 11:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDEC10FBA3;
	Tue, 15 Sep 2026 11:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CQHILxEC";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9919D10FBA5
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 11:25:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C4D25602BA;
 Tue, 15 Sep 2026 11:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBC51F00893;
 Tue, 15 Sep 2026 11:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789471510;
 bh=9YyGgPnyoQWwuc7pPJgSmhaS/vwNnuEWm2DRifRBZb4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=CQHILxECiKmJs1SNCGRQlUaddSx3Ga/igBzz/s0orhwof3XMwwb+HVorb3VecSL/D
 dfkr+ZZ7jMOqzw/hgS7aPEsJjVb9DbfbqVQ+7SCwKvFs37NFau6kMUusXQyIvO1D1J
 W2GDvV/4lHK/hTrW8+5sUzrPlUwnPdPSAe/W9O2ptDFNB9260ZOh6EW6h3wl2vY0si
 HYsv1Ub3pKEe37BIbfRD3+PPicpTHV7hgyg4EulP4ADBLZCFHn6ZXQyxIFcxI7yYsn
 2arOd3iWKCoPu14ix7bPddlE110CzTEJCtaHnOVCsOGl0Dtt+SGlGBvlC8sZTUX3Jl
 DprIkI6G/yiiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p
 platforms
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260915111314.564847-3-tilak.tirumalesh.tangudu@intel.com>
References: <20260915111314.564847-1-tilak.tirumalesh.tangudu@intel.com>
 <20260915111314.564847-3-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 11:25:09 +0000
Message-Id: <20260915112510.4FBC51F00893@smtp.kernel.org>
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
- [Medium] xe: tick quantization bypasses Wa_16023105232 upper bound check
--

commit 0bd0a59b09bd7c0fa136c7d141c58df4e531535b
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

    drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
   =20
    Avoid programming the IDLEDLY timer to less than 5 microseconds.
    Apply wa_14025941587 to Graphics Versions 20.01 to 35.11
    and Media Versions 13.01 to 35.03

> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> index e5e761c33fa68..a0c29aacbbfe1 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
[ ... ]
> @@ -588,31 +588,76 @@ static void hw_engine_init_early(struct xe_gt *gt, =
struct xe_hw_engine *hwe,
>  static void adjust_idledly(struct xe_hw_engine *hwe)
>  {
[ ... ]
> +		if (XE_GT_WA(gt, 16023105232) &&
> +		    xe_gt_WARN_ON(gt, idledly >=3D maxcnt || inhibit_switch)) {

[Severity: Medium]
Does this upper bound check fail to account for the subsequent tick
quantization?

If maxcnt is slightly larger than the 5000ns minimum (e.g., 5120ns),
the idledly >=3D maxcnt check will evaluate to false and the value won't
be clamped.

> +			/* maxcnt may be 0 if IDLE_WAIT_TIME is unprogrammed. */
> +			idledly =3D maxcnt ? maxcnt - 1 : 0;
> +			clamped_below_maxcnt =3D true;
> +			wa_applied =3D true;
> +			/* inhibit_switch override to keep
> +			 * semantics of Wa_16023105232
> +			 */
> +			if (inhibit_switch)
> +				idledly_reg_val &=3D ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> +		}
> +
> +		if (wa_applied) {
> +			u32 idledly_ticks;
> +
> +			/*
> +			 * Wa_16023105232 requires idledly < maxcnt, so floor
> +			 * that clamp; otherwise round up to guarantee the
> +			 * Wa_14025941587 minimum survives tick quantization.
> +			 */
> +			if (clamped_below_maxcnt)
> +				idledly_ticks =3D DIV_ROUND_DOWN_ULL((u64)idledly * 1000,
> +								   idledly_units_ps);
> +			else
> +				idledly_ticks =3D DIV_ROUND_UP_ULL((u64)idledly * 1000,
> +								 idledly_units_ps);

[Severity: Medium]
Will this round-up push the programmed delay above maxcnt, silently
violating Wa_16023105232?

If the check above bypassed clamping (because 5000 < 5120), we take the else
branch here. Using DIV_ROUND_UP_ULL, 5000ns can round up by an extra tick. =
For
instance, on a 19.2MHz clock (416.66ns per tick), 5000ns rounds up to 13 ti=
cks
(5416ns).

Since 5416ns > 5120ns, the programmed IDLE_DELAY will end up exceeding
IDLE_WAIT_TIME in the hardware.

> +
> +			idledly_reg_val &=3D ~IDLE_DELAY;
> +			idledly_reg_val |=3D REG_FIELD_PREP(IDLE_DELAY, idledly_ticks);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915111314.5648=
47-1-tilak.tirumalesh.tangudu@intel.com?part=3D2
