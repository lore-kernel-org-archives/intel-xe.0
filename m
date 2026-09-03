Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F580C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A3510F67F;
	Thu,  3 Sep 2026 15:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ExiW5cqN";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37B610F67F
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:15:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7778E411DD;
 Thu,  3 Sep 2026 15:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D41F1F000E9;
 Thu,  3 Sep 2026 15:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788448523;
 bh=SL4TgZ8WTx6rjaWGiJn8/KMnko+FuFyIuH4dpgIg+Ek=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ExiW5cqNopSNoQ7r5RK4uLeuH9q0YrSEhf2nvYXfkc6ZTQmbzL0PmMWckSuO1HvDp
 fmKxgHUb1E4lUWaDs8I9/g/BYCke/hR2DzujT2Vu801JWOC/63oHwXGxrGRGgWftJM
 UlsVicsAUa7npl/ZnWMsH1Jva8K3jhDwh0UaQVh/33KAvKPuHqkKhmNabaQ/osqqgl
 5B36niV9zOsjj+6qWnP845RdmGUWbGd0kAV/JGH5CW7XO/Vrd1usGlNEhPDtJqNtAP
 KtnVm2fEMxigNHuc5gM/V+DYK2biW3pRJjziVh0gMTsREmRFpuGV6GkL6bsgAePoq+
 kHZ/bbfTgS7hQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 14/27] drm/xe/eudebug: Add hw enablement
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903145952.848051-15-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-15-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:15:22 +0000
Message-Id: <20260903151523.3D41F1F000E9@smtp.kernel.org>
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
- [High] The overwrite logic in `xe_reg_sr_add` fails to clear previously s=
et bits when `e->set_bits` is non-zero, corrupting register state.
- [Low] Redundant duplicate macro definition of `STALL_DOP_GATING_DISABLE`.
--

commit 5a2461057e026a59c99e9e1133f757b575f16e78
Author: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: drm/xe/eudebug: Add hw enablement

This commit implements eudebug mode enabling by programming TD_CTL and other
registers. It introduces eudebug-related workarounds and modifies the
register save/restore logic to allow dynamic manipulation with overwrites.

> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/re=
gs/xe_gt_regs.h
> index 8056d007c23e2..7537fc1a9c3fa 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
[ ... ]
> @@ -546,11 +558,13 @@
>  #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
>  #define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
>  #define   EARLY_EOT_DIS				REG_BIT(1)
> +#define   STALL_DOP_GATING_DISABLE		REG_BIT(5)

[Severity: Low]
Does this code inadvertently redefine STALL_DOP_GATING_DISABLE? This isn't a
bug, but the macro is redefined with the exact same value immediately after
its original definition.

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_s=
r.c
> index e328f50725572..72919a5612a5a 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
[ ... ]
> @@ -114,15 +115,20 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>  	reg =3D sanitize_mcr(sr, e, gt);
> =20
>  	if (pentry) {
> -		if (!compatible_entries(pentry, e)) {
> +		if (!overwrite && !compatible_entries(pentry, e)) {
>  			ret =3D -EINVAL;
>  			goto fail;
>  		}
> =20
>  		pentry->clr_bits |=3D e->clr_bits;
> -		pentry->set_bits |=3D e->set_bits;
>  		pentry->read_mask |=3D e->read_mask;
> =20
> +		/* An overwrite with nothing to set clears instead */
> +		if (overwrite && !e->set_bits)
> +			pentry->set_bits &=3D ~e->clr_bits;
> +		else
> +			pentry->set_bits |=3D e->set_bits;
> +
>  		return 0;
>  	}

[Severity: High]
Does this logic bypass clearing e->clr_bits when e->set_bits is non-zero
during an overwrite in xe_reg_sr_add()?

If xe_reg_sr_add() is called with overwrite =3D true and e->set_bits !=3D 0=
, the
old bits intersecting with e->clr_bits do not appear to be cleared from
pentry->set_bits before the new bits are logically OR-ed. Could this result
in hardware registers being programmed with corrupted, logically OR-ed valu=
es
instead of the requested explicit values?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903145952.8480=
51-1-mika.kuoppala@linux.intel.com?part=3D14
