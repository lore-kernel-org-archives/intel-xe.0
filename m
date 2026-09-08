Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B284DC79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 17:09:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631B810E07A;
	Tue,  8 Sep 2026 17:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FTARQRIe";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1015110E07A
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 17:09:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C96F640F53;
 Tue,  8 Sep 2026 17:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2551F00A3A;
 Tue,  8 Sep 2026 17:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788887364;
 bh=RX1FeFm+K14k2w0I9oYCAdvnrKGsYEJFRz3oAo3a3VQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=FTARQRIenmHRb0fM97gm959ybDRhPMajwHXfIfkoURl9B4zUwsMG5Fk+6empUNY+8
 bUhoHp8hKVxglFARCw+0JMaA3aMOF1zGZE3fGUQg50AL9o44B8gG+0VwE7s6AZR7h7
 IJ4aWw1h/QeJH4Fcf2I8Um7ILCCS2EAk2crSBy+xJf6OWnWXdVdC8AHQ7NB3Le/o7J
 yBApErmzvtSgds9vxAe+h77SZBFBv1wjrqYQtOzt2I9LPxbGshQuUJP8j/Z2TbO6QR
 GAnxiruV/dGYF+JZF7e5DtuEFbC0D9tFp5Ae4T6Bwok1VwjZJaTC2UuRbZLARX5iCV
 28vgv4hzui5og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260908165225.61456-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260908165225.61456-1-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 17:09:24 +0000
Message-Id: <20260908170924.8B2551F00A3A@smtp.kernel.org>
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
- [High] 32-bit integer overflow in `adjust_idledly` time conversions corru=
pts valid hardware configurations.

Pre-existing issues:
- [High] Division by zero in `adjust_idledly` causes kernel panic on unreco=
gnized crystal clock frequencies.
--

commit 26320e76aeba5d2445adb7b8fbd5db0002118926
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms

This patch applies wa_14025941587 to Graphic and Media versions to avoid
programming the IDLEDLY timer to less than 5 microseconds. It refactors
adjust_idledly() to support both the new and existing workarounds.

> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> index 010499766fce2..5a87f26d7dd4a 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
[ ... ]
> @@ -588,25 +588,57 @@ static void hw_engine_init_early(struct xe_gt *gt, =
struct xe_hw_engine *hwe,
>  static void adjust_idledly(struct xe_hw_engine *hwe)
>  {
>  	struct xe_gt *gt =3D hwe->gt;
> -	u32 idledly, maxcnt;
> +	u32 idledly, idledly_reg_val, maxcnt;
>  	u32 idledly_units_ps =3D 8 * gt->info.timestamp_base;
>  	u32 maxcnt_units_ns =3D 640;
> -	bool inhibit_switch =3D 0;
> +	bool inhibit_switch =3D false;
> +	bool wa_applied =3D false;
> =20
> -	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) {
> -		idledly =3D xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> +	if ((!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) ||
> +	    XE_GT_WA(gt, 14025941587)) {
> +		u32 mincnt_idledly_ns =3D 5000;
> +
> +		idledly_reg_val =3D xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_b=
ase));
>  		maxcnt =3D xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base=
));
> =20
> -		inhibit_switch =3D idledly & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> -		idledly =3D REG_FIELD_GET(IDLE_DELAY, idledly);
> +		inhibit_switch =3D idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> +		idledly =3D REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
>  		idledly =3D DIV_ROUND_CLOSEST(idledly * idledly_units_ps, 1000);

[Severity: High]
Does this multiplication overflow for delays > 4.29ms? Both idledly and
idledly_units_ps are 32-bit u32 variables, so the multiplication is done in
32-bit math. With idledly_units_ps typically around 666,664, any valid
register delay > 6442 (4.29ms) will overflow U32_MAX, resulting in a falsely
small value. Should this be cast to u64 and use DIV_ROUND_CLOSEST_ULL()
instead?

>  		maxcnt =3D REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
>  		maxcnt *=3D maxcnt_units_ns;
> =20
> -		if (xe_gt_WARN_ON(gt, idledly >=3D maxcnt || inhibit_switch)) {
> -			idledly =3D DIV_ROUND_CLOSEST(((maxcnt - 1) * 1000),
> -						    idledly_units_ps);
> -			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
> +		/* Wa_14025941587: applied prior to Wa_16023105232,
> +		 * as the latter has higher priority, although conflict
> +		 * is not expected.
> +		 */
> +		if (XE_GT_WA(gt, 14025941587) &&
> +		    idledly < mincnt_idledly_ns) {
> +			idledly =3D mincnt_idledly_ns;
> +			wa_applied =3D true;
> +		}

[Severity: High]
If the earlier 32-bit multiplication overflows and produces a falsely small
wrapped value for idledly, will this workaround erroneously clamp a valid
large delay to a tiny 5us value, corrupting the hardware state?

[ ... ]
> +		if (wa_applied) {
> +			idledly_reg_val &=3D ~IDLE_DELAY;
> +			idledly_reg_val |=3D REG_FIELD_PREP(IDLE_DELAY,
> +						 DIV_ROUND_CLOSEST(idledly * 1000,
> +								   idledly_units_ps));

[Severity: High]
Can this write-back calculation also overflow 32-bit math if the intended
delay is large, writing corrupted garbage back to the register?

[Severity: High]
This is a pre-existing issue, but if idledly_units_ps is 0, will this cause
an unconditional kernel panic?

If read_crystal_clock() encounters an unrecognized clock frequency, it logs
a warning and sets *timestamp_base =3D 0, causing idledly_units_ps to be 0.
Because the idledly calculation above will also be 0, the check
idledly < mincnt_idledly_ns is now guaranteed to be true, setting
wa_applied =3D true.

When DIV_ROUND_CLOSEST performs division by the second argument
(idledly_units_ps), it seems it will trigger an immediate division by zero
exception. Should we check for zero before dividing?

> +			xe_gt_dbg(gt, "idledly %s: set %u max=3D%u inh=3D%u ts=3D%u\n",
> +				  hwe->name, idledly, maxcnt,
> +				  !!inhibit_switch, gt->info.timestamp_base);
> +			xe_mmio_write32(&gt->mmio,
> +					RING_IDLEDLY(hwe->mmio_base),
> +					idledly_reg_val);
>  		}
>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908165225.6145=
6-1-tilak.tirumalesh.tangudu@intel.com?part=3D1
