Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29C3C5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:34:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922A310E91E;
	Tue, 25 Aug 2026 06:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jxBcHO9H";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC41410E91E;
 Tue, 25 Aug 2026 06:34:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B4FC5405CA;
 Tue, 25 Aug 2026 06:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635F31F000E9;
 Tue, 25 Aug 2026 06:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787639660;
 bh=DNUvtlNdOyfOguuYAQV80f7CrK8qZdM6h8/ulvDiPus=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=jxBcHO9HqAVCeZf61MzHiHpwMCsP3EOSR2Wvni/CtOn6pQQy7fdcEr8aioYU6/uuS
 4R+3/KtJyGRU3cZCajGNiyiORsJI94nI8gZ5xghBjPg1ov0qBikBe+yEs/dz51zyzJ
 ++hZyU5uQuWrLpyW9m5gA9PEDz+3AIbT+JO556CHPSaHkp9YoAHAAof99U+7l/ueA1
 tPFCyOPsKHMslzzqvJUOzIrfplrGz/zg+lEsn+4nrzxPjgNAE8Lt3Hdc3s+1sVADEP
 3piqcNGiuj/KfiWuTy/ooNzhHspYzu2iqOo/jphQX0J+a3fMfYzL9t6QSFT/NTSFUW
 j6dTtSoWpDA9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/15] drm/i915/alpm: table based establishment period
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260825054536.3455704-8-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-8-animesh.manna@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 06:34:19 +0000
Message-Id: <20260825063420.635F31F000E9@smtp.kernel.org>
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
- [High] Unchecked negative error codes from drm_dp_lttpr_count() cause an =
out-of-bounds array read and integer underflow.

Pre-existing issues:
- [High] 32-bit signed integer overflow in `tml_phy_lock` calculation corru=
pts ALPM wake time.
--

--- Patch [7]: [PATCH v5 07/15] drm/i915/alpm: table based establishment pe=
riod ---
commit 39688e03d0da05abea5d53e9441ff2410c77a69c
Author: Animesh Manna <animesh.manna@intel.com>
Subject: drm/i915/alpm: table based establishment period

This patch introduces a table-based lookup for the establishment period
in intel_alpm.c. It uses the link rate and LTTPR count to find the period
from a 2D array, falling back to a computed value if not found.

> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index af2733805505e..078e04bb69d29 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c

[ ... ]

> @@ -129,8 +215,17 @@ static int get_establishment_period(struct intel_dp =
*intel_dp,
>  	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP)) {
>  		tcds =3D (7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1) * tml_phy_lock;

[Severity: High]
This isn't a bug introduced by this patch, but does the calculation for
tml_phy_lock suffer from a 32-bit signed integer overflow?

Looking earlier in get_establishment_period():

int tml_phy_lock =3D 1000 * 1000 * tps4 / crtc_state->port_clock / 10;

The expression 1000 * 1000 * tps4 evaluates using 32-bit signed integer
math. For both DP (tps4 =3D 2520) and UHBR (tps4 =3D 12672), the intermedia=
te
result exceeds INT_MAX (2,147,483,647) and overflows (to -212643840 for
UHBR). This negative value propagates into tml_phy_lock and causes tcds to
subtract time instead of adding it, which could corrupt the ALPM wake time.

>  	} else {
> +		int idx =3D get_link_rate_index(crtc_state->port_clock);
> +
>  		tcds =3D 7 * tml_phy_lock;
>  		lttpr_count =3D drm_dp_lttpr_count(intel_dp->lttpr_common_caps);
> +
> +		if (idx !=3D LINK_RATE_INVALID &&
> +		    lttpr_count < DEFAULT_MAX_LTTPR_COUNT &&

[Severity: High]
If a buggy or malicious DP sink returns an invalid LTTPR configuration,
drm_dp_lttpr_count() can return a negative error code (e.g., -ERANGE
or -EINVAL). Since lttpr_count is signed, will it incorrectly pass this
lttpr_count < DEFAULT_MAX_LTTPR_COUNT check?

> +		    establishment_periods[lttpr_count][idx]) {
> +			establishment_period =3D establishment_periods[lttpr_count][idx];

Could this negative lttpr_count then be used as an array index on this
line, causing an out-of-bounds memory read? If the out-of-bounds read
accesses an unmapped page it could trigger a kernel oops.

Furthermore, if the lookup is bypassed, the negative lttpr_count could cause
severe integer underflow in the fallback calculation later in this function:

int tdcs =3D (SILENCE_PERIOD_TIME + t1 + tcs +
            (lttpr_count - 1) * (tlw + tlfps_period));

> +			return establishment_period;
> +		}
>  	}
> =20
>  	if (lttpr_count) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825054536.3455=
704-1-animesh.manna@intel.com?part=3D7
