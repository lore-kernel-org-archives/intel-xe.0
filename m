Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0FD606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 21:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NaccoN8j
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D7510E2A8;
	Fri, 23 Oct 2026 21:19:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456BF10E2A8
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 21:19:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D17564341F;
 Fri, 23 Oct 2026 21:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D121F01825;
 Fri, 23 Oct 2026 21:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792790352;
 bh=8OSnad7OsRwMc9OFSAgQMo1KTIlRNz2NuVFg6jxJwEs=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=NaccoN8jtu0R/UFUX0Lf2cZ++wDOgKKdp/KaxR5oW3G+ybqb3urCMLLj6DWzRNecj
 V2m43uK+PV4rUc4y98yKlLCo+nbo+iPSOUWaJKVoQbV09Mr/GV1Xtndedy+fWg5Muv
 QWyCYsSYTj60VGXBbOhKFNO13KBcjXIfa6kcBzZ0nZJH6whwRyQKm684tOH1DaskNx
 jJN/VRlpe+KsewixwUptyhaQp8d9Dj4gHgRwGk4Nzi2X3xIKHjLSP5t2TSU/5KvHJK
 jyOU96ZQMOvZCb5sgSmtzyWQYk6SRktpbdSXSnVa8UhVmvvjMbXa5VT3mo9J5eddpo
 rLxkvoXJ5uLgQ==
Message-ID: <sashiko-outbox-183245@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/10] drm/xe: Use picosecond as common unit in
 adjust_idledly()
To: "Gustavo Sousa" <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261023-wa_16031259911-v1-3-b0453f79c4e1@intel.com>
References: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
 <20261023-wa_16031259911-v1-3-b0453f79c4e1@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 21:19:12 +0000
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
- [High] drm/xe: 32-bit multiplication overflow in adjust_idledly()
--

commit 6274ddb08f811b772af3c2cc759b8be4b565872c
Author: Gustavo Sousa <gustavo.sousa@intel.com>

drm/xe: Use picosecond as common unit in adjust_idledly()

This commit changes adjust_idledly() to use picoseconds instead of
nanoseconds as the common unit of time to avoid precision loss and
eliminate extra integer divisions.

> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> index 6872d1ca656e2..dcc8a6d53c5d0 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -585,17 +585,19 @@ static void hw_engine_init_early(struct xe_gt *gt, =
struct xe_hw_engine *hwe,
>  	xe_reg_whitelist_process_engine(hwe);
>  }
> =20
> -static u32 idledly_floor_ticks(u32 idledly_ns, u32 idledly_units_ps)
> +static u32 idledly_floor_ticks(u64 idledly_ps, u32 idledly_units_ps)
>  {
> -	return DIV_ROUND_DOWN_ULL((u64)idledly_ns * 1000, idledly_units_ps);
> +	return DIV_ROUND_DOWN_ULL(idledly_ps, idledly_units_ps);
>  }
> =20
>  static void adjust_idledly(struct xe_hw_engine *hwe)
>  {
>  	struct xe_gt *gt =3D hwe->gt;
> -	u32 idledly, idledly_hw, idledly_reg_val, maxcnt;
> +	u32 idledly_reg_val, maxcnt_reg_val;
>  	u32 idledly_units_ps =3D 8 * gt->info.timestamp_base;
> -	u32 maxcnt_units_ns =3D 640;
> +	u32 maxcnt_units_ps =3D 640000;
> +	u64 idledly_ps, idledly_hw_ps;
> +	u64 maxcnt_ps;
>  	bool inhibit_switch =3D false;
>  	bool wa_applied =3D false;
>  	bool clamped_below_maxcnt =3D false;
> @@ -604,29 +606,27 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  		return;
> =20
>  	if (XE_GT_WA(gt, 16023105232) || XE_GT_WA(gt, 14025941587)) {
> -		u32 mincnt_idledly_ns =3D 5000;
> +		u32 mincnt_idledly_ps =3D 5000000;
> =20
>  		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown cryst=
al clock. */
>  		if (!idledly_units_ps)
>  			return;
> =20
>  		idledly_reg_val =3D xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_b=
ase));
> -		maxcnt =3D xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base=
));
> -
>  		inhibit_switch =3D idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> -		idledly =3D REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> -		idledly =3D DIV_ROUND_CLOSEST_ULL((u64)idledly * idledly_units_ps, 100=
0);
> -		idledly_hw =3D idledly;
> -		maxcnt =3D REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
> -		maxcnt *=3D maxcnt_units_ns;
> +		idledly_ps =3D REG_FIELD_GET(IDLE_DELAY, idledly_reg_val) * idledly_un=
its_ps;
> +		idledly_hw_ps =3D idledly_ps;
> +
> +		maxcnt_reg_val =3D xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->m=
mio_base));
> +		maxcnt_ps =3D REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt_reg_val) * maxcnt_u=
nits_ps;

[Severity: High]
Can the multiplications computing idledly_ps and maxcnt_ps in
adjust_idledly() overflow 32-bit unsigned arithmetic before being widened
to u64?

In include/drm/intel/reg_bits.h, REG_FIELD_GET() returns a u32:

    #define REG_FIELD_GET(__mask, __val)	((u32)FIELD_GET(__mask, __val))

Because idledly_units_ps and maxcnt_units_ps are both declared as u32,
both multiplications are evaluated in 32-bit arithmetic before assignment
to u64 idledly_ps and u64 maxcnt_ps.

For idledly_ps, dropping the (u64) cast that was added in commit
d864065ea25e ("drm/xe: harden adjust_idledly() against divide-by-zero and
overflow") means IDLE_DELAY (a 21-bit field, REG_GENMASK(20, 0)) multiplied
by idledly_units_ps (up to 666,664 ps) wraps around U32_MAX whenever
IDLE_DELAY is >=3D 6443 ticks.

Similarly, for maxcnt_ps, scaling the unit multiplier from 640 ns to
640,000 ps in u32 means IDLE_WAIT_TIME (a 20-bit field, REG_GENMASK(19, 0))
multiplied by maxcnt_units_ps wraps around U32_MAX whenever IDLE_WAIT_TIME
is >=3D 6711 ticks (~4.29 ms out of its ~671 ms range).

When either product wraps, xe_gt_WARN_ON(gt, idledly_hw_ps >=3D maxcnt_ps)
can trigger spuriously, and the Wa_14025941587 and Wa_16023105232 checks
can program a corrupted IDLE_DELAY tick count into RING_IDLEDLY.

Should idledly_units_ps and maxcnt_units_ps be declared as u64 (or the
operands cast to u64 before multiplying)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-wa_1603125=
9911-v1-0-b0453f79c4e1@intel.com?part=3D3
