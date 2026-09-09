Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152ABC79FAA
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 07:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05D310EF75;
	Wed,  9 Sep 2026 07:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KvGpdL4Y";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A2D10EF75
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 07:39:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0057B41940;
 Wed,  9 Sep 2026 07:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDAD1F00A3A;
 Wed,  9 Sep 2026 07:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788939566;
 bh=LyswCk3XqonkaEPEyhdfZe5aK1GgbgU2YOPWIn9BYJ0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=KvGpdL4YtALhPf1NBfhjl7o7Znl5rDvvJTtLL+Gkrt2iuu2ag7ZHAHanVYT5cHtbo
 +xR28gq1KAf6JmfCLPTGjucSw14W2Xkx4FTtqOE2MLw8JTc+oTOT9uW6IiZOHw86+Z
 tjy6qe6EsVRG9tZ4oCcxjTpB57Tr5FCWoETY+XAs4W4p2+MfXNm7VreA30is9M2B0g
 CnNFSAmBLK9Qb+US9cHuzsg5Mx8OzmYaeQvosk+w7FQzgqMaNPoChGKIRZ/w9kfPnP
 3KpOaLEBFWH9KhMuYGEbVaONPnC0sRFLtgclEeoaKHt4yDRetJsaIdMw4SMt1A2b/6
 5SQXpH510h8FA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p
 platforms
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909072540.99303-3-tilak.tirumalesh.tangudu@intel.com>
References: <20260909072540.99303-1-tilak.tirumalesh.tangudu@intel.com>
 <20260909072540.99303-3-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 07:39:26 +0000
Message-Id: <20260909073926.ADDAD1F00A3A@smtp.kernel.org>
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
- [Medium] Early return when maxcnt is 0 silently bypasses Wa_14025941587
- [Medium] Mutated idledly variable causes spurious WARN_ON and violates WA=
 14025941587 constraint
--

commit ca2474376ef20b3f47a408b5ebe9a4945d93d22c
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms

Avoid programming the IDLEDLY timer to less than 5 microseconds.
Apply wa_14025941587 to Graphics Versions 20.01 to 35.11
and Media Versions 13.01 to 35.03

> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> index 6ffb0ece05612..033740c34aa66 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
[ ... ]
> @@ -614,10 +618,38 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
> =20
>  		maxcnt *=3D maxcnt_units_ns;
> =20
> -		if (xe_gt_WARN_ON(gt, idledly >=3D maxcnt || inhibit_switch)) {
> -			idledly =3D DIV_ROUND_CLOSEST_ULL((u64)(maxcnt - 1) * 1000,
> -							idledly_units_ps);
> -			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);

[Severity: Medium]
In adjust_idledly(), there is an existing check just before this hunk:

	maxcnt =3D REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);

	if (!maxcnt)
		return;

If maxcnt evaluates to 0, the function executes an early return. Does this
unintentionally bypass the new Wa_14025941587 workaround added below,
skipping the 5 microsecond limit enforcement if the initial maxcnt from the
hardware happens to be 0?

> +		/* Wa_14025941587: applied prior to Wa_16023105232,
> +		 * as the latter has higher priority, although conflict
> +		 * is not expected.
> +		 */
> +		if (XE_GT_WA(gt, 14025941587) &&
> +		    idledly < mincnt_idledly_ns) {
> +			idledly =3D mincnt_idledly_ns;
> +			wa_applied =3D true;
> +		}
> +
> +		if (XE_GT_WA(gt, 16023105232) &&
> +		    xe_gt_WARN_ON(gt, idledly >=3D maxcnt || inhibit_switch)) {
> +			idledly =3D (maxcnt - 1);

[Severity: Medium]
Can this sequence trigger a spurious WARN_ON and violate the 5000ns minimum?

If the original idledly is less than 5000ns, WA 14025941587 mutates idledly
to 5000. Immediately after, if maxcnt happens to be 5000 or less (e.g. 4480=
),
the WARN_ON will trigger because it evaluates the mutated idledly
(5000 >=3D 4480), even if the original hardware value was safe (e.g.
2000 < 4480).=20

Following the WARN_ON, idledly is then set to maxcnt - 1 (e.g. 4479), which
silently breaks the 5000ns minimum required by Wa_14025941587.

Should the second workaround evaluate the original hardware state rather th=
an
the software-mutated value?

> +			wa_applied =3D true;
> +			/* inhibit_switch override to keep
> +			 * semantics of Wa_16023105232
> +			 */
> +			if (inhibit_switch)
> +				idledly_reg_val &=3D ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909072540.9930=
3-1-tilak.tirumalesh.tangudu@intel.com?part=3D2
