Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6403FC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 20:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0271010E464;
	Thu,  3 Sep 2026 20:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JeT9I6ky";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B831410E464
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 20:26:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 440A2432E9;
 Thu,  3 Sep 2026 20:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092791F00A3D;
 Thu,  3 Sep 2026 20:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788467171;
 bh=1PM8lZnMWZg3x6SO3EBg2fPICUWpzVKfxtGJrKBvbrc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=JeT9I6ky1ixgYu7yttpmIcgqwZ1/pVRDtjcSLPUp9VerIqlF7/YE/f0yftzobMfP8
 mmYTiXfLMWrlqxNzyaR+v2wVp7xbJJCIqy8T/vXn/P+pw4qGuOJ7BypsximxBcpWfQ
 ByWZkZdYOsazkxdn2y9mSGDL1hMVbHnG1NLSmhz0a5GDmzlVhhr5ppTduOONKQx4Nt
 ObZ7iaxRYHT2H5fTah0eMokf7VVBGg3cKrF5O7TzOGY/kFTTg3JFpVTYBV/0mlNj4r
 DGqxBaCoGYkeDVkkiVZaeg9iS7a3vr2cCsHBpgw8rqQJLMcSTPjXSn1DsY9b/GMRHy
 uvwSSIqQRB+lA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 14/18] drm/xe/vsec: Crescent Island PMT callbacks
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903201002.1064889-34-michael.j.ruhl@intel.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
 <20260903201002.1064889-34-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 20:26:10 +0000
Message-Id: <20260903202611.092791F00A3D@smtp.kernel.org>
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
- [Medium] Using memcpy_toio() and memcpy_fromio() for 32-bit MMIO control =
registers violates atomicity, lacks memory barriers, and breaks endianness =
on big-endian architectures.
--

commit dbad67bc0c83cc3b6a60d78b23589e00b666a0f0
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Crescent Island PMT callbacks

This commit introduces callbacks for Crescent Island PMT support to access
the discovery status and control areas. It adds the glue logic and registers
the functionality for the XE_CRESCENTISLAND platform.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 0438810337dd3..336c4b7d284bc 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> +static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 o=
ffset)
> +{
[ ... ]
> +	xe_pm_runtime_get(xe);
> +	mutex_lock(&xe->pmt.lock);
> +
> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +	memcpy_fromio(reg, disc_addr, sizeof(*reg));

[Severity: Medium]
Does using memcpy_fromio() here instead of readl() cause endianness issues
on big-endian platforms?

Since this is reading a 32-bit register, memcpy_fromio() omits endian
conversion and implicit memory barriers. It might also break atomicity or
cause PCIe target aborts if the underlying implementation falls back to 8-b=
it
byte accesses, which some hardware rejects for 32-bit registers.

> +
> +	mutex_unlock(&xe->pmt.lock);
> +	xe_pm_runtime_put(xe);
[ ... ]
> +static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 o=
ffset)
> +{
[ ... ]
> +	xe_pm_runtime_get(xe);
> +	mutex_lock(&xe->pmt.lock);
> +
> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +	memcpy_toio(disc_addr, &reg, sizeof(reg));

[Severity: Medium]
Could memcpy_toio() write these bytes in CPU endianness instead of the
device's expected little-endian format?=20

Using writel() here would properly handle endianness conversion, ensure=20
I/O memory barriers, and guarantee a single atomic 32-bit write operation.

> +
> +	mutex_unlock(&xe->pmt.lock);
> +	xe_pm_runtime_put(xe);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903201002.1064=
889-20-michael.j.ruhl@intel.com?part=3D14
