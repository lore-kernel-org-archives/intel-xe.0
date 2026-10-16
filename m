Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34F1CCA464
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 10:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763BF10E14B;
	Fri, 16 Oct 2026 10:47:20 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8169A10E14B;
 Fri, 16 Oct 2026 10:47:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AEC9260008;
 Fri, 16 Oct 2026 10:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A6E71F000C4;
 Fri, 16 Oct 2026 10:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792147633;
 bh=fJiPJNib7nRKhXvRd+KSuYEiEc0+WMy0yoHfP4Smk3Q=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=oUl1xgoHc3AIjQCNO37KWf8u0n8LKBwhzdp1ZO72l10dyiBvAd5fhpu180jmZW6mo
 8sWy9iG+EEfdOv3BOYRsjJerxJ5hjV7iStZVTBP9e3ci1nw0vkogBkTpD+AMltkiYs
 n5eSfDK5SHBv7fggiE97IyeorBmMwcBccgEmRVMzNRaPFIQmSMTLV/IsNHm3Y8w3lR
 +krccXVohVKh7BPBfx0iRdrtE/Hpems+SndjTBoSHFVhYCkABdZv47sXEzQGGvFtzf
 FIq5NZn+LL+QHYsrMt1OiJdMqoYBf7MHVLIBhZzDI2gXmPup3EEHV6BZdj07BjNSME
 w3NObmb3Ie46Q==
Message-ID: <sashiko-outbox-174203@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/i915/dsc: Fix QP table index calculation for
 bpp selection
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261016101713.230013-2-ankit.k.nautiyal@intel.com>
References: <20261016101713.230013-1-ankit.k.nautiyal@intel.com>
 <20261016101713.230013-2-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 10:47:12 +0000
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
- [Medium] drm/i915/dsc: incomplete fix due to unscaled fractional_bits in =
QP index calculation
--

commit f16f36523ce6f8e8fca7d8b3376a00ba0a384a25
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: drm/i915/dsc: Fix QP table index calculation for bpp selection

This patch fixes the QP table index calculation for a given bpp by restoring
a missing multiplier of 2 for the integer portion of the calculation. This
aims to ensure proper table layout alignment.

> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/=
i915/display/intel_vdsc.c
> index 8f06c3a4d56df..7a573c2b6a7dd 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
[ ... ]
> @@ -261,7 +261,7 @@ calculate_rc_params(struct drm_dsc_config *vdsc_cfg)
>  		 * and so on.
>  		 * 0.5 fractional part with 4 decimal precision becomes 5000
>  		 */
> -		bpp_i  =3D ((bpp - 6) + (fractional_bits < 5000 ? 0 : 1));
> +		bpp_i  =3D (2 * (bpp - 6) + (fractional_bits < 5000 ? 0 : 1));

[Severity: Medium]
Does this calculation completely fix the index calculation, or is there a
missing scaling factor for fractional_bits?

Earlier in calculate_rc_params(), fractional_bits is extracted directly from
a Q4 value:
   =20
    int fractional_bits =3D fxp_q4_to_frac(vdsc_cfg->bits_per_pixel);

Since fxp_q4_to_frac() returns the raw Q4 fractional bits (which are strict=
ly
in the range 0-15), the condition (fractional_bits < 5000) will always eval=
uate
to true.=20

Because of this, the expression (fractional_bits < 5000 ? 0 : 1) will always
evaluate to 0, which means the 0.5 fractional bpp increment is ignored. Is
fractional_bits missing the 10000 scaling factor expected by this logic?

> =20
>  		for (buf_i =3D 0; buf_i < DSC_NUM_BUF_RANGES; buf_i++) {
>  			u8 range_bpg_offset;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016101713.2300=
13-1-ankit.k.nautiyal@intel.com?part=3D1
