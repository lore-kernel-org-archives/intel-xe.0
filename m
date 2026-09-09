Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEDCC79FB7
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7AE10F20E;
	Wed,  9 Sep 2026 16:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cfpFQWCi";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E736710F20E
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 16:33:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D15FD4045A;
 Wed,  9 Sep 2026 16:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA771F000FF;
 Wed,  9 Sep 2026 16:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788971587;
 bh=ysCZKNt+3uXamS1lTbTO10GvBir7iCQrPccwv/Cq2qQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=cfpFQWCiCGMEEbpTACLo2HX9G0w5v+7jE12Kmcegr1boHIas2TatqfqWXsI22noYB
 s/TEZcFqsvxEr1HaZS0OXEACshZf92+Rm0QOZtFC7VRDWJ1ahwTX0PJjnVwMlUsHw4
 w7b123u0PPz4ZvZ9aXHHo1UzNTaZiI2g2sj+1W34/rTToGDT4M8GLbOU0Mj+/0719N
 7xlNLG6gN2ePu7yFBhm0EPKtYY5CloWWo6PNzfN8MqrNRgYLAwclxGjZxTF6tucCpG
 +ZAeKE2l0DGAW49am4bXMBWZN1E+knapybYHRAk6CovlRvkfDPIFj4wQH1KJbElce4
 ATwWUX9JWh5PQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p
 platforms
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909161844.125147-3-tilak.tirumalesh.tangudu@intel.com>
References: <20260909161844.125147-1-tilak.tirumalesh.tangudu@intel.com>
 <20260909161844.125147-3-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 16:33:07 +0000
Message-Id: <20260909163307.8AA771F000FF@smtp.kernel.org>
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
- [Medium] Tick quantization rounding up causes `idledly` to exceed `maxcnt=
`, triggering spurious kernel warnings and WA invariant violations.
--

commit d777113f52ced7ebda03cbb9155258701e427a45
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms

This commit avoids programming the IDLEDLY timer to less than 5 microsecond=
s.
It applies wa_14025941587 to Graphics Versions 20.01 to 35.11 and Media
Versions 13.01 to 35.03.

> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> index c86890e09b555..37cd7fe38c2b5 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
[ ... ]
> @@ -588,33 +588,78 @@ static void hw_engine_init_early(struct xe_gt *gt, =
struct xe_hw_engine *hwe,
>  static void adjust_idledly(struct xe_hw_engine *hwe)
>  {
>  	struct xe_gt *gt =3D hwe->gt;
[ ... ]
> +		if (XE_GT_WA(gt, 16023105232) &&
> +		    xe_gt_WARN_ON(gt, idledly >=3D maxcnt || inhibit_switch)) {
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Medium]
Will this warning spuriously fire on subsequent reads?

If maxcnt is unprogrammed (0), the two workarounds conflict entirely (one
forcing 5000, the other forcing 0), which would cause a WARN_ON and clamp
cycle on every reset.

Additionally, if maxcnt tightly bounds the 5000ns minimum, the tick
quantization rounding up below can push the delay time above maxcnt. On the
next engine reset or resume, this triggers this xe_gt_WARN_ON() and forces a
clamp, causing idledly to oscillate and violate the invariants of
Wa_16023105232.

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
                                                                 ^^^^^^^^^^=
^^^^^^^^

[Severity: Medium]
Does this ceiling division push the delay time above the maxcnt boundary?

When maxcnt is close to the 5000ns minimum (e.g. 5120ns), rounding up idled=
ly
to ticks produces a delay (e.g. 5417ns) that exceeds maxcnt, storing a value
that will fail the Wa_16023105232 check on the next read.

> +
> +			idledly_reg_val &=3D ~IDLE_DELAY;
> +			idledly_reg_val |=3D REG_FIELD_PREP(IDLE_DELAY, idledly_ticks);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909161844.1251=
47-1-tilak.tirumalesh.tangudu@intel.com?part=3D2
