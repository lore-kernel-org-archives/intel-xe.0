Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D11C88E75
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 06:10:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F338010F18F;
	Fri, 18 Sep 2026 06:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YCIBr5hb";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30F110F188;
 Fri, 18 Sep 2026 06:10:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E1687601EF;
 Fri, 18 Sep 2026 06:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3841F000FF;
 Fri, 18 Sep 2026 06:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789711856;
 bh=9FUEUMacvov3pu6zhmq9Ryh4lb5uAtPwv0202Jv1LP0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=YCIBr5hb6LVt34ymagthuIRlxQfHMkP9cBA6nQf019cnfUVPbOGihV457FRJdSZYV
 eYmF7mVmNF8jRMSdOyI6zkNLBN/Zsuhxt08vHTLtC7LrpzqQqjJEOD8s2IjopP41D/
 8U3g2ijvPvh6mwF0klXfJBuHwIMqghMoUmEEgQ/ygtjipEPKBH4hNzRYmnMwkCcs89
 jgClv3Z5nnlVrZoGr9PLy7SmUBtdDh9ujL/bEhukup6vwxxiRs9uqcgGQlfzZ2QGwT
 m6D8zXyaFG7fMpzdGIN5KTWyYT4C2uF7m2/COQqe8yvyGfBJDDbVsWss8SeYTWhENu
 CtGB+1MgQ2N9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/dp: Disable DC5/6 before AUX programming
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260918060426.1162123-1-suraj.kandpal@intel.com>
References: <20260918060426.1162123-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 06:10:55 +0000
Message-Id: <20260918061056.6F3841F000FF@smtp.kernel.org>
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
- [Low] drm/i915/dp: missing 'if' keyword before HAS_LT_PHY() causing build=
 error
--

commit 50d9f2e05d7a2031877229580c7c2591f8281933
Author: Suraj Kandpal <suraj.kandpal@intel.com>

drm/i915/dp: Disable DC5/6 before AUX programming

This commit disables DC5/6 before AUX programming for platforms with LT PHY.
It ensures that step 4 of the AUX programming sequence is honored since the
LT PHY powers down the PHY.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/dr=
m/i915/display/intel_dp_aux.c
> index 3cb07b0a901cf..350dac72c9961 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> @@ -286,6 +287,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> =20
>  	aux_wakeref =3D intel_display_power_get(display, aux_domain);
> =20
> +	(HAS_LT_PHY(display))
> +		dc_off_wakeref =3D intel_display_power_get(display, POWER_DOMAIN_DC_OF=
F);
> +

[Severity: Low]
Is there a missing 'if' keyword here in intel_dp_aux_xfer()? This appears to
introduce a syntax error by having the expression (HAS_LT_PHY(display))
adjacent to the assignment without a control flow statement, which will cau=
se
a build failure.

>  	/*
>  	 * The PPS state needs to be locked for:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918060426.1162=
123-1-suraj.kandpal@intel.com?part=3D1
