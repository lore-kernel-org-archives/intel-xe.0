Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CBB606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 21:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W96QDiVf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9EDA10E2A8;
	Fri, 23 Oct 2026 21:23:12 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAA910E2A8
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 21:23:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 517DE600D1;
 Fri, 23 Oct 2026 21:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D697E1F01825;
 Fri, 23 Oct 2026 21:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792790585;
 bh=mVpzCIlsGjbCWpYB3bwlEGKhvazSU+O2C+neZWm79cI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=W96QDiVfsAZ+JGvV5qbU6lKsX8UT3NhM/PJY9yymWOEpZRy2gvhwtZu+YLQmLsftF
 q+ny8aeKoNcCpBv+/WONp59K+oGseDUi1mmWkPyBB7KuxDXZDhw3TGnotwZsdVScDi
 DYqk5TQ7sEqyFd3K/6MjfEpUXgi/VB0xpvaGLScAo3Svc640N+gGyFpel7if8NXgMn
 tBeRAoIsGQaP4zCVSAXa0BekqtGlgMzuxhxA++rJyMsoe+Blx9LAaNibkmK+mulwIQ
 Xo7R/fJr/PGAu130WnzXFzLHsIuPke06xMOdHet+zd61DFr591tCfb2Tt66cLgpQhL
 Ih69XQoIhDg1A==
Message-ID: <sashiko-outbox-183251@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/10] drm/xe: Factor out {min,max}_idledly_ps in
 adjust_idledly()
To: "Gustavo Sousa" <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261023-wa_16031259911-v1-4-b0453f79c4e1@intel.com>
References: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
 <20261023-wa_16031259911-v1-4-b0453f79c4e1@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 21:23:04 +0000
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

commit 032b173104de210ca0228dd31e057951f3cde20d
Author: Gustavo Sousa <gustavo.sousa@intel.com>

drm/xe: Factor out {min,max}_idledly_ps in adjust_idledly()

This commit reorganizes adjust_idledly() so that workaround-specific logic
computes min_idledly_ps and max_idledly_ps before applying and rounding
those limits to the RING_IDLEDLY register field.

> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> index dcc8a6d53c5d0..2d2a80cc2da35 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -585,99 +585,81 @@ static void hw_engine_init_early(struct xe_gt *gt, =
struct xe_hw_engine *hwe,
>  	xe_reg_whitelist_process_engine(hwe);
>  }
> =20
> -static u32 idledly_floor_ticks(u64 idledly_ps, u32 idledly_units_ps)
> -{
> -	return DIV_ROUND_DOWN_ULL(idledly_ps, idledly_units_ps);
> -}
> -
>  static void adjust_idledly(struct xe_hw_engine *hwe)
>  {
>  	struct xe_gt *gt =3D hwe->gt;
> -	u32 idledly_reg_val, maxcnt_reg_val;
> +	u32 idledly_reg_val;
> +	u32 idledly;
>  	u32 idledly_units_ps =3D 8 * gt->info.timestamp_base;
> -	u32 maxcnt_units_ps =3D 640000;
>  	u64 idledly_ps, idledly_hw_ps;
> -	u64 maxcnt_ps;
> +	u64 min_idledly_ps =3D 0;
> +	u64 max_idledly_ps =3D -1;
>  	bool inhibit_switch =3D false;
>  	bool wa_applied =3D false;
> -	bool clamped_below_maxcnt =3D false;
> =20
>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
>  		return;
> =20
>  	if (XE_GT_WA(gt, 16023105232) || XE_GT_WA(gt, 14025941587)) {
> -		u32 mincnt_idledly_ps =3D 5000000;
> -
>  		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown cryst=
al clock. */
>  		if (!idledly_units_ps)
>  			return;
> =20
>  		idledly_reg_val =3D xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_b=
ase));
>  		inhibit_switch =3D idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> -		idledly_ps =3D REG_FIELD_GET(IDLE_DELAY, idledly_reg_val) * idledly_un=
its_ps;
> +		idledly =3D REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> +		idledly_ps =3D idledly * idledly_units_ps;
>  		idledly_hw_ps =3D idledly_ps;
> =20
> -		maxcnt_reg_val =3D xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->m=
mio_base));
> -		maxcnt_ps =3D REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt_reg_val) * maxcnt_u=
nits_ps;
> -
> -		/*
> -		 * Wa_14025941587 is applied before Wa_16023105232, which takes
> -		 * priority if the two ever conflict (not expected in practice).
> -		 */
> -		if (XE_GT_WA(gt, 14025941587) &&
> -		    idledly_ps < mincnt_idledly_ps) {
> -			idledly_ps =3D mincnt_idledly_ps;
> -			wa_applied =3D true;
> -		}
> +		if (XE_GT_WA(gt, 14025941587))
> +			min_idledly_ps =3D max(min_idledly_ps, 5000000);
> =20
>  		if (XE_GT_WA(gt, 16023105232)) {
> +			u32 maxcnt_units_ps =3D 640000;
> +			u32 maxcnt =3D xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio=
_base));
> +
> +			max_idledly_ps =3D min_t(u64,
> +					       max_idledly_ps,
> +					       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
> +
>  			/* Clear the inhibit switch without disturbing a valid delay. */
>  			if (inhibit_switch) {
>  				idledly_reg_val &=3D ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
>  				wa_applied =3D true;
>  			}
> +		}
> =20
> -			/* Warn only on the value read from hardware. */
> -			xe_gt_WARN_ON(gt, idledly_hw_ps >=3D maxcnt_ps);
> +		/*
> +		 * min_idledly_ps is applied before max_idledly_ps, which takes
> +		 * priority if the two ever conflict (not expected in practice).
> +		 */
> +		if (idledly_ps < min_idledly_ps) {
> +			idledly =3D DIV_ROUND_UP_ULL(min_idledly_ps, idledly_units_ps);
> +			idledly_ps =3D idledly * idledly_units_ps;
> +			wa_applied =3D true;
> +		}
> =20
> -			if (idledly_ps >=3D maxcnt_ps) {
> -				/* maxcnt may be 0 if IDLE_WAIT_TIME is unprogrammed. */
> -				idledly_ps =3D maxcnt_ps ? maxcnt_ps - 1 : 0;
> -				clamped_below_maxcnt =3D true;
> -				wa_applied =3D true;
> +		if (idledly_ps >=3D max_idledly_ps) {
> +			if (max_idledly_ps) {
> +				idledly =3D DIV_ROUND_DOWN_ULL(max_idledly_ps - 1, idledly_units_ps);
> +				idledly_ps =3D idledly * idledly_units_ps;

[Severity: Medium]
Can these tick-to-picosecond multiplications in adjust_idledly() in
drivers/gpu/drm/xe/xe_hw_engine.c overflow 32 bits before being widened to
u64?

When hw_engine_init() calls adjust_idledly() on non-VF platforms where
Wa_16023105232 or Wa_14025941587 is active, idledly, idledly_units_ps (up to
8 * 83333 =3D 666,664 ps), maxcnt_units_ps (640,000 ps), and the return val=
ue
of REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) are all u32.

In the three assignments:

	idledly_ps =3D idledly * idledly_units_ps;

both operands are u32. Since IDLE_DELAY is a 21-bit field (REG_GENMASK(20, =
0),
up to 2,097,151 ticks), the product can reach ~1.398e12 ps and wraps modulo
2^32 for idledly >=3D 6443 ticks before assignment to u64 idledly_ps.

Similarly, in:

	max_idledly_ps =3D min_t(u64,
			       max_idledly_ps,
			       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);

REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps is evaluated in 32-=
bit
unsigned arithmetic before min_t(u64, ...) casts the result to u64. Because
IDLE_WAIT_TIME is a 20-bit field (REG_GENMASK(19, 0), up to 1,048,575 ticks=
),
the product can reach ~6.71e11 ps and wraps 32 bits for IDLE_WAIT_TIME >=3D=
 6711
ticks, which can misprogram RING_IDLEDLY or trigger false
xe_gt_WARN_ON(gt, idledly_hw_ps >=3D max_idledly_ps) warnings.

Commit d864065ea25e ("drm/xe: harden adjust_idledly() against divide-by-zero
and overflow") previously added explicit (u64) casts to prevent 32-bit
truncation when converting ticks to time units. Should idledly_units_ps and
maxcnt_units_ps (or the multiplication operands) be promoted to u64 here as
well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-wa_1603125=
9911-v1-0-b0453f79c4e1@intel.com?part=3D4
