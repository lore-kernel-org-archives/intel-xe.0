Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C47E606A31B
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 21:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OcLgvYbA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D1810E2A8;
	Fri, 23 Oct 2026 21:22:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F1F10E2A8
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 21:22:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DA8F2601F6;
 Fri, 23 Oct 2026 21:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688121F031E2;
 Fri, 23 Oct 2026 21:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792790523;
 bh=9aKlHnmjJqHSfpAFaLp0qAygO7dUGQL9YxTd+KF93ec=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=OcLgvYbAn11aQaM7hPr4JcfrrSHEATfGolUiaQhKFA4qs+TqvZIspGE/sm2LEhOaU
 0yPDhrDY3WCMg8Zb6PW0/p8Q6jGFDuu8PsNLfRb31AA/j18oyVMV3Bw4WWfuX4f/9Q
 3vkJ/Zl/BwhLbGvDj5DN1/Pqk7MGDfAcbot3uvf3GJY0h8hUx3tYDfXjtWgUhjssWs
 ssIUt3x4GTTg7kHDsHQx7eYOx+vdaMSR19h1BKUsUR42h2645Ru0DXAB9ia4A5pbin
 +thM3n5zE2SagxThLDrcFxHmS9WwiiSn/JHww2yfIB8AVVEdvbKTdQO9bgsWcypK8z
 gH00YxsZIClZQ==
Message-ID: <sashiko-outbox-183249@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/10] drm/xe: Drop early and redundant workaround
 checks in adjust_idledly()
To: "Gustavo Sousa" <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261023-wa_16031259911-v1-6-b0453f79c4e1@intel.com>
References: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
 <20261023-wa_16031259911-v1-6-b0453f79c4e1@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 21:22:02 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/xe: 32-bit multiplication overflow in adjust_idledly()
--

commit 1632f9f2c26646be902e4438963fff43c54e34fd
Author: Gustavo Sousa <gustavo.sousa@intel.com>

drm/xe: Drop early and redundant workaround checks in adjust_idledly()

This commit removes the outer workaround check in adjust_idledly() and
unindents the body now that each workaround check is scoped to its own
conditional block and the function returns early when no workaround
applies.

> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> index e201fa96ee867..00af7344067d3 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -600,77 +600,75 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
>  		return;
> =20
> -	if (XE_GT_WA(gt, 16023105232) || XE_GT_WA(gt, 14025941587)) {
> -		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown cryst=
al clock. */
> -		if (!idledly_units_ps)
> -			return;
> +	/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crysta=
l clock. */
> +	if (!idledly_units_ps)
> +		return;
> =20
> -		if (XE_GT_WA(gt, 14025941587))
> -			min_idledly_ps =3D max(min_idledly_ps, 5000000);
> +	if (XE_GT_WA(gt, 14025941587))
> +		min_idledly_ps =3D max(min_idledly_ps, 5000000);
> =20
> -		if (XE_GT_WA(gt, 16023105232)) {
> -			u32 maxcnt_units_ps =3D 640000;
> -			u32 maxcnt =3D xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio=
_base));
> +	if (XE_GT_WA(gt, 16023105232)) {
> +		u32 maxcnt_units_ps =3D 640000;
> +		u32 maxcnt =3D xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_=
base));
> =20
> -			max_idledly_ps =3D min_t(u64,
> -					       max_idledly_ps,
> -					       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
> +		max_idledly_ps =3D min_t(u64,
> +				       max_idledly_ps,
> +				       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
> =20
> -			clear_inhibit_switch =3D true;
> -		}
> +		clear_inhibit_switch =3D true;
> +	}
> =20
> -		/* No applicable workaround found. */
> -		if (min_idledly_ps =3D=3D 0 && max_idledly_ps =3D=3D -1 && !clear_inhi=
bit_switch)
> -			return;
> +	/* No applicable workaround found. */
> +	if (min_idledly_ps =3D=3D 0 && max_idledly_ps =3D=3D -1 && !clear_inhib=
it_switch)
> +		return;
> =20
> -		idledly_reg_val =3D xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_b=
ase));
> +	idledly_reg_val =3D xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_ba=
se));
> =20
> -		if (clear_inhibit_switch && idledly_reg_val & INHIBIT_SWITCH_UNTIL_PRE=
EMPTED) {
> -			idledly_reg_val &=3D ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> -			wa_applied =3D true;
> -		}
> +	if (clear_inhibit_switch && idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREE=
MPTED) {
> +		idledly_reg_val &=3D ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> +		wa_applied =3D true;
> +	}
> +
> +	idledly =3D REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> +	idledly_ps =3D idledly * idledly_units_ps;
> +	idledly_hw_ps =3D idledly_ps;
> =20
> -		idledly =3D REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> +	/*
> +	 * min_idledly_ps is applied before max_idledly_ps, which takes
> +	 * priority if the two ever conflict (not expected in practice).
> +	 */
> +	if (idledly_ps < min_idledly_ps) {
> +		idledly =3D DIV_ROUND_UP_ULL(min_idledly_ps, idledly_units_ps);
>  		idledly_ps =3D idledly * idledly_units_ps;
> -		idledly_hw_ps =3D idledly_ps;
> +		wa_applied =3D true;
> +	}
> =20
> -		/*
> -		 * min_idledly_ps is applied before max_idledly_ps, which takes
> -		 * priority if the two ever conflict (not expected in practice).
> -		 */
> -		if (idledly_ps < min_idledly_ps) {
> -			idledly =3D DIV_ROUND_UP_ULL(min_idledly_ps, idledly_units_ps);
> +	if (idledly_ps >=3D max_idledly_ps) {
> +		if (max_idledly_ps) {
> +			idledly =3D DIV_ROUND_DOWN_ULL(max_idledly_ps - 1, idledly_units_ps);
>  			idledly_ps =3D idledly * idledly_units_ps;

[Severity: Medium]
Can the picosecond multiplications in adjust_idledly() overflow 32 bits?

In the Wa_16023105232 check:

	max_idledly_ps =3D min_t(u64,
			       max_idledly_ps,
			       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);

both REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) and maxcnt_units_ps (640000)
have type u32. The multiplication is evaluated in 32-bit unsigned
arithmetic before min_t(u64, ...) widens the result to u64. Since
IDLE_WAIT_TIME is REG_GENMASK(19, 0), any register value of 6711 ticks or
greater (~4.295 ms out of the ~671 ms range) exceeds U32_MAX when
multiplied by 640000 and wraps around.

Similarly, idledly (extracted from the 21-bit IDLE_DELAY field) and
idledly_units_ps (8 * gt->info.timestamp_base) are both u32:

	idledly_ps =3D idledly * idledly_units_ps;

At all three assignments of idledly_ps in adjust_idledly(), the product is
computed in 32-bit arithmetic before being assigned to the u64 idledly_ps
variable, which overflows whenever the delay exceeds ~4.295 ms.

When reached during GT initialization via:

  xe_gt_init()
    -> gt_init_with_all_forcewake()
      -> xe_hw_engines_init()
        -> hw_engine_init()
          -> adjust_idledly()

this truncation can trigger a spurious xe_gt_WARN_ON(gt, idledly_hw_ps >=3D
max_idledly_ps) warning and program an improperly clamped IDLE_DELAY value
into RING_IDLEDLY.

Should maxcnt_units_ps and idledly_units_ps be declared as u64 (or the
multiplications use mul_u32_u32() / a u64 cast) so the products are
evaluated in 64-bit arithmetic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-wa_1603125=
9911-v1-0-b0453f79c4e1@intel.com?part=3D6
