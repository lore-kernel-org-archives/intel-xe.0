Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995C4C88E75
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 03:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540C0896EC;
	Wed, 16 Sep 2026 03:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aObzt9Cy";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E01D6896EC;
 Wed, 16 Sep 2026 03:08:43 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1424560008;
 Wed, 16 Sep 2026 03:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C57D1F000FF;
 Wed, 16 Sep 2026 03:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789528122;
 bh=ZuTSLOMnezNW+eQB5qiJDONObooRW6Sw/8p9IJSCAS8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=aObzt9CyuoNd/u0uXcunl9spe3e8nmt/bINGCEeGtBaBevP/QQKENBN7z3IcfXDWW
 cVyaF0Phw/GRMJ9rApfMAYkGN6TivvTyPlCLeI9iouj0P+8GxV40ji/u4Nhpu6M8IW
 ZrOPjomVSdJHkkYsdR0yNkbRq/0KYvEQAoZCKfPcge8EHRcMvwXeDt4Tn10iE/BJSX
 XwWyJPhyD9+FWfNZIQSRTyeMWHzo0U3Cz3ZNXh7yY4vHaV808kRuRTFxQ+cps2ezdG
 09si3MLDgiKaUlLBCjDMmUnbx53FxcxWHcRDyukWMcuwa5KP3RXBOX3yJPTemetjyi
 c2/1zs5ITVt0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260916025710.432281-4-suraj.kandpal@intel.com>
References: <20260916025710.432281-1-suraj.kandpal@intel.com>
 <20260916025710.432281-4-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 03:08:42 +0000
Message-Id: <20260916030842.8C57D1F000FF@smtp.kernel.org>
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
- [Medium] drm/i915/dp_mst: mode_valid prunes modes on UHBR due to M/N rati=
o logic flaw
--

commit d987781a69cc401d2c2bdee227fee0cfd510d97e
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/dp_mst: Limit M/N ratio for MST

This commit enforces the maximum M/N ratio limit for MST configurations in
mst_connector_mode_valid_ctx(), mirroring the SST path. It evaluates the
limit using the highest available link rate, dropping modes if the maximum
rate cannot support the required ratio.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 6a869d0f6ffc0..3f4ab9573d0c0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
[ ... ]
> @@ -1564,6 +1565,15 @@ mst_connector_mode_valid_ctx(struct drm_connector =
*_connector,
>  					   min_link_bpp_x16,
>  					   bw_overhead_flags);
> =20
> +	if (intel_dp_link_caps_get_max_config(intel_dp->link.caps,
> +					      INTEL_DP_LINK_CAPS_ORDER_KEY_RATE_LANE,
> +					      INTEL_DP_LINK_CAPS_FILTER_ALL,
> +					      &max_rate_config) &&
> +	    !intel_dp_can_support_m_n(display, mode->clock, max_rate_config.rat=
e)) {

[Severity: Medium]
Will this logic incorrectly prune high pixel-clock display modes (like
4K@240Hz or 8K) on UHBR-capable displays?

The commit message states "the ratio shrinks as the link rate grows", but
when crossing from HBR3 (8.1 Gbps, 8b/10b, 10-bit symbol) to UHBR10 (10 Gbp=
s,
128b/132b, 32-bit symbol), the symbol clock drops drastically.

Since the M/N ratio is proportional to pixel_clock / symbol_clock, evaluati=
ng
at the UHBR10 rate inflates the ratio. This might cause the ratio to exceed
the max limit (10) and fail here, even though the mode might have passed if
evaluated at HBR3.

Does this falsely prevent valid high-bandwidth modes from reaching the comp=
ute
config stage on modern DP 2.0/2.1 monitors?

> +		*status =3D MODE_CLOCK_HIGH;
> +		return 0;
> +	}
> +
>  	/*
>  	 * TODO:
>  	 * - Also check if compression would allow for the mode

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916025710.4322=
81-1-suraj.kandpal@intel.com?part=3D3
