Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45017C79FAA
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 07:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEC310EF75;
	Wed,  9 Sep 2026 07:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jV9j7WT3";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3649D10EF75
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 07:38:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1F3AF41501;
 Wed,  9 Sep 2026 07:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64991F00A3A;
 Wed,  9 Sep 2026 07:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788939506;
 bh=/TO3YlliQlsPsDqWGzJVuRQ7ag6Mn80WJWyNscVbhrA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=jV9j7WT3EJ2Yu+bzDQJ0EIqVrG34ZHsuaH3W/Yy7Mx2GH7zlli8Jhdps3gijljGx0
 jNOT90S50Dvfpq2yO7i4OsbIgcXQ702w3iITTh6UM3EUyZh8pQRPc7bKn8wpul0BwV
 wGcA+bcqM0dHxcNcE6YmFJlDhUbbfmO/epV3n0Ky1YGejDsqfG+RPKRufhyKB0qoOe
 QFY+QhmFRo47KWfj87bTu8eieq/ZBzMs0aw/NkO6lrtuiTGLUBnCpiYeLJsgs1As1v
 t0w7J6oCqKlapXSbtJ6VnzJbkLvS2JsR8dIbi1afULXQ3nfWmJcCGhkagEHIXF/J02
 hHVkwRnvwa6Og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/xe: harden adjust_idledly() against
 divide-by-zero and overflow
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909072540.99303-2-tilak.tirumalesh.tangudu@intel.com>
References: <20260909072540.99303-1-tilak.tirumalesh.tangudu@intel.com>
 <20260909072540.99303-2-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 07:38:25 +0000
Message-Id: <20260909073825.D64991F00A3A@smtp.kernel.org>
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
- [High] Returning early when `maxcnt =3D=3D 0` bypasses the workaround log=
ic and fails to clear the `INHIBIT_SWITCH_UNTIL_PREEMPTED` bit if it was se=
t in hardware.

Pre-existing issues:
- [High] Using `DIV_ROUND_CLOSEST_ULL` can round up, resulting in an `idled=
ly` value that is greater than or equal to `maxcnt`, violating the workarou=
nd's core requirement and causing continuous kernel warnings.
--

commit 33df9c0262d14ae39bdd6d5eab48d83f8de9e00b
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

drm/xe: harden adjust_idledly() against divide-by-zero and overflow

This commit addresses corner-case issues in adjust_idledly() that could
cause kernel panics, wrap-arounds, or integer overflows. It adds early
returns for zero timestamp_base or IDLE_WAIT_TIME and upgrades
tick-to-ns math to 64-bit using DIV_ROUND_CLOSEST_ULL().

> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> index 010499766fce2..6ffb0ece05612 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -594,18 +594,29 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  	bool inhibit_switch =3D 0;
> =20
>  	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) {
> +		/* xe_gt_clock_init() zeroes timestamp_base on unknown crystal clock. =
*/
> +		if (!idledly_units_ps) {
> +			xe_gt_warn(gt, "idledly WA skipped: timestamp_base is 0\n");
> +			return;
> +		}
> +
>  		idledly =3D xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
>  		maxcnt =3D xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base=
));
> =20
>  		inhibit_switch =3D idledly & INHIBIT_SWITCH_UNTIL_PREEMPTED;
>  		idledly =3D REG_FIELD_GET(IDLE_DELAY, idledly);
> -		idledly =3D DIV_ROUND_CLOSEST(idledly * idledly_units_ps, 1000);
> +		idledly =3D DIV_ROUND_CLOSEST_ULL((u64)idledly * idledly_units_ps, 100=
0);
>  		maxcnt =3D REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
> +
> +		/* Return early rather than underflow maxcnt - 1 on a zero IDLE_WAIT_T=
IME. */
> +		if (!maxcnt)
> +			return;

[Severity: High]
Does returning early here bypass the workaround logic and fail to clear the
INHIBIT_SWITCH_UNTIL_PREEMPTED bit?

The commit message explicitly states that IDLE_WAIT_TIME can read back as 0.
If maxcnt evaluates to 0 and the inhibit_switch bit was set in hardware,
this early return skips the subsequent register write entirely, leaving the
context switch inhibit bit permanently active. The workaround should
gracefully clear the inhibit bit even if it cannot set a valid delay.

> +
>  		maxcnt *=3D maxcnt_units_ns;
> =20
>  		if (xe_gt_WARN_ON(gt, idledly >=3D maxcnt || inhibit_switch)) {
> -			idledly =3D DIV_ROUND_CLOSEST(((maxcnt - 1) * 1000),
> -						    idledly_units_ps);
> +			idledly =3D DIV_ROUND_CLOSEST_ULL((u64)(maxcnt - 1) * 1000,
> +							idledly_units_ps);

[Severity: High]
This is a pre-existing issue, but does using DIV_ROUND_CLOSEST_ULL here
cause the resulting idledly to round up and violate the maxcnt constraint?

Because DIV_ROUND_CLOSEST_ULL rounds to the nearest integer, the resulting
tick count can exceed maxcnt. For example, on a 12MHz crystal platform with
timestamp_base =3D 83333, idledly_units_ps is 666664 ps. If maxcnt is 1, ma=
xcnt
in ns is 640. The calculation gives 639000 / 666664, which rounds to 1 tick.
When read back on the next invocation, 1 tick converts to 667 ns, and
667 >=3D 640 evaluates to true, triggering constant xe_gt_WARN_ON spam.

Should floor division be used instead to ensure idledly remains strictly
less than maxcnt?

>  			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
>  		}
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909072540.9930=
3-1-tilak.tirumalesh.tangudu@intel.com?part=3D1
