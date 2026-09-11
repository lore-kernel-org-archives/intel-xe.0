Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AD2C88E41
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 04:30:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D9A10E2DB;
	Fri, 11 Sep 2026 04:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AjeoPwOl";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3579B10E2DB;
 Fri, 11 Sep 2026 04:30:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E41F3437AB;
 Fri, 11 Sep 2026 04:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902A11F000FF;
 Fri, 11 Sep 2026 04:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789101019;
 bh=w6yfoVNmJmIeqWl5Cl3cND5iFK5jas8/tvsLk1pdOXg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=AjeoPwOl70IWl08u8ABiaITMLA9/e2IE+dl7kJWD2vuFoA5lTW1gULvxSaWNGqB2d
 6kGN+QwWfL1FA9BUlba9HdHDifq4+GjXAHISFb/mPZvHM/H0uGSRD0vIHOFtSU/qFf
 FD/C1oCkGmQMjqUVOP/NYhcgweRQaw37ACAyt71M6lKuqWBVRqA0M6M+iLdJTXTH/5
 gryaqxtpmSVP4I3yxJqj4+eNjZGSLVYpipXex5gCSqgYAQiUtbvYn4w4o/woKDE/uK
 fnklsiqDPLcmtDnkwEA5FQbFVuyEGqQ2dRFVLiiMTxQdS1YY1dlpkhjra9fn2jyynW
 EBIrxUvGDSaGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260911041449.3699400-4-suraj.kandpal@intel.com>
References: <20260911041449.3699400-1-suraj.kandpal@intel.com>
 <20260911041449.3699400-4-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 04:30:19 +0000
Message-Id: <20260911043019.902A11F000FF@smtp.kernel.org>
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
- [Medium] The M/N ratio check in mst_connector_mode_valid_ctx uses the lin=
k rate of the max bandwidth configuration, falsely rejecting valid display =
modes that could be supported by a narrower but faster configuration.
--

commit 98416996dd21ed919f77966254ec5cd4baea6754
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
drm/i915/dp_mst: Limit M/N ratio for MST

This commit adds M/N ratio limits for DisplayPort MST configurations by=20
pruning modes in mst_connector_mode_valid_ctx() that exceed hardware=20
limits. It mirrors the SST mode validation logic.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 6a869d0f6ffc0..796374cebf051 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
[ ... ]
> @@ -1564,6 +1564,11 @@ mst_connector_mode_valid_ctx(struct drm_connector =
*_connector,
>  					   min_link_bpp_x16,
>  					   bw_overhead_flags);
> =20
> +	if (!intel_dp_can_support_m_n(display, mode->clock, max_link_clock)) {
> +		*status =3D MODE_CLOCK_HIGH;
> +		return 0;
> +	}
> +

[Severity: Medium]
The commit message states this check is added "using the highest link rate=
=20
available", mirroring the SST mode_valid check. However, max_link_clock=20
here is derived from max_bw_config.

Could this falsely reject valid display modes if the link capabilities=20
result in a max bandwidth configuration with a lower symbol clock than an=20
alternative configuration?=20

For example, if max_bw_config falls back to RBR x 4 (162MHz) but an=20
alternative HBR x 2 (270MHz) configuration is available, a mode's pixel=20
clock might exceed the M/N limit for the 162MHz config but safely fit=20
within the bandwidth and M/N limits of the 270MHz configuration. Does this=
=20
logic prematurely restrict those modes to the M/N ratio of the max=20
bandwidth config?

>  	/*
>  	 * TODO:
>  	 * - Also check if compression would allow for the mode

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911041449.3699=
400-1-suraj.kandpal@intel.com?part=3D3
