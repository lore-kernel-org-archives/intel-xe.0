Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AD8C79FA0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 08:49:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DFE10E81A;
	Tue,  8 Sep 2026 08:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k5utOLkS";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3B010E81A
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 08:49:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 66FD743925;
 Tue,  8 Sep 2026 08:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A571F00A3D;
 Tue,  8 Sep 2026 08:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788857394;
 bh=iP07Ypy4uF5HKnWmVKuIi4W8tcfkWbTDPhfw+tL7NQY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=k5utOLkS4AC2jtCnfCCwW70WC+nn0oNRCbNcy4dea5X/cZvCXi+MydU4/74TSiOA8
 p59b4VWeLjx4J0AzCWli5xUFThvsE0yld7u6VtVMLwoPq6AHQ1Szzaf9k/G9F4L/2a
 lknQ4LYFbUlmpVYgQ6E/jvze5vIAfTrVRVGak5n+KaAOhjhvFlz+6BVjTQNHYtBz5H
 vS/tzUqZPi+NejW8fh9u/tx17A+sQDihmhnz3OZAfH9PZf6yQVd5fy2NxuGQIglbo/
 NJL7ziniovCaOTwjYUMUjDCQlLg+bYn7X+TbfIrK/uTVW5hqHo5uxUDfmqEpO9AzsW
 2eQj8lULwXz1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260908083656.51704-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260908083656.51704-1-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 08:49:53 +0000
Message-Id: <20260908084954.36A571F00A3D@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Potential division by zero in DIV_ROUND_CLOSEST if the GT crystal =
clock frequency is invalid or unrecognized.
- [High] 32-bit integer overflow during nanosecond unit conversions for `id=
ledly` causes incorrect delay calculations and erroneous hardware timer pro=
gramming.
- [High] Integer underflow when maxcnt is zero leads to a massive delay cal=
culation that subsequently overflows.
--

commit 36b72781bea702adafa74030ffeb7bc9ba2efaf8
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

    drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
   =20
    Avoid IDLEDLY timer programming lessthan 5 micro secs.
    Apply wa_14025941587 to Graphics Versions 20.01 to 35.11
    and Media Versions 13.01 to 35.03

> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> index 010499766fce2..5a87f26d7dd4a 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -588,25 +588,57 @@ static void hw_engine_init_early(struct xe_gt *gt, =
struct xe_hw_engine *hwe,
>  static void adjust_idledly(struct xe_hw_engine *hwe)
>  {
[ ... ]
> -		inhibit_switch =3D idledly & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> -		idledly =3D REG_FIELD_GET(IDLE_DELAY, idledly);
> +		inhibit_switch =3D idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> +		idledly =3D REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
>  		idledly =3D DIV_ROUND_CLOSEST(idledly * idledly_units_ps, 1000);

[Severity: High]
This is a pre-existing issue, but does this multiplication overflow 32 bits?

With idledly capable of being up to 21-bits and idledly_units_ps typically
around 666,664, the multiplication can reach ~1.4 trillion, which
overflows the 32-bit limit before DIV_ROUND_CLOSEST is evaluated. This wrap
around could cause an incorrect delay calculation.

>  		maxcnt =3D REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
>  		maxcnt *=3D maxcnt_units_ns;
[ ... ]
> +		if (XE_GT_WA(gt, 16023105232) &&
> +		    xe_gt_WARN_ON(gt, idledly >=3D maxcnt || inhibit_switch)) {
> +			idledly =3D (maxcnt - 1);

[Severity: High]
This is a pre-existing issue, but does this subtraction underflow if maxcnt
evaluates to 0?

If the hardware initializes with 0 in the IDLE_WAIT_TIME field, maxcnt will
be 0. Because idledly is unsigned, idledly >=3D maxcnt will be true, causing
idledly to underflow to U32_MAX.

> +			wa_applied =3D true;
> +			/* inhibit_switch override to keep
> +			 * semantics of Wa_16023105232
> +			 */
> +			if (inhibit_switch)
> +				idledly_reg_val &=3D ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> +		}
> +
> +		if (wa_applied) {
> +			idledly_reg_val &=3D ~IDLE_DELAY;
> +			idledly_reg_val |=3D REG_FIELD_PREP(IDLE_DELAY,
> +						 DIV_ROUND_CLOSEST(idledly * 1000,
> +								   idledly_units_ps));

[Severity: High]
This is a pre-existing issue, but does this code suffer from a division by
zero panic?

If the hardware register RPM_CONFIG0 contains an unrecognized crystal clock
frequency, xe_gt_clock_init() sets gt->info.timestamp_base to 0. This makes
idledly_units_ps evaluate to 0, which triggers a panic here.

Also, does the idledly * 1000 multiplication overflow the 32-bit limit?

If maxcnt was 0 and idledly underflowed to U32_MAX earlier, this
multiplication reaches ~4.29 trillion, causing another silent overflow
before the division and programming an incorrect delay into the hardware.

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908083656.5170=
4-1-tilak.tirumalesh.tangudu@intel.com?part=3D1
