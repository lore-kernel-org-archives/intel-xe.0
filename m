Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B945FC5CFDB
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 22:17:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE6C10F141;
	Wed, 12 Aug 2026 22:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eTMDAcme";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A9D10F126
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:57:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B5AA360A84;
 Wed, 12 Aug 2026 19:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D571F000E9;
 Wed, 12 Aug 2026 19:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786564630;
 bh=I3JzRenz3JRs3ouNRyk8VfzgaJZhacFtaPMxNz2JKH4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=eTMDAcme6vJmqYhRRkfOkQr4xO9+k82v6xDzsvi8/bZ5PzK7bUw1ASJxRnoIxxM3G
 5AfcXC+J8letEjhdKR8wanxnLj91Bk/Vvx+8ztatDLLbjRiqIsgTN5SpWrBjUoTRKa
 Hj4tiuiEuAQPobkQY6ed2iwhbMyIhUrwHm7BGHNNExJPgBdwWraLZ3TjM6vx3w6VSW
 CCeH7Vn6vCcPYz3t0pRwtGaE4lmsEOEcm64FIYs0oEegzVj1Pc4ZJJXZXU6mGktv5w
 zRihkv67txtsyTW+lQNPrI0wTCnEBzsNTIlt/0G5HJLAWRlqeSMGmhD3sMjBYUpq7M
 2lsed+EaUh8gA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/10] drm/xe/vsec: Crescent Island PMT callbacks
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260812193742.2170188-20-michael.j.ruhl@intel.com>
References: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
 <20260812193742.2170188-20-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 19:57:09 +0000
Message-Id: <20260812195710.42D571F000E9@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 22:17:09 +0000
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
- [High] Improper MMIO access for 32-bit control registers using byte-wise =
copies (memcpy_toio/memcpy_fromio).
--

--- Patch [8]: [PATCH v2 08/10] drm/xe/vsec: Crescent Island PMT callbacks =
---
commit 664ab77147de6f456af0ceaeae6a996ddd3d6a40
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
drm/xe/vsec: Crescent Island PMT callbacks

This commit introduces callbacks to get the status and control information=
=20
for CRI PMT usage. It adds the glue logic to register the CRI PMT=20
functionality in the xe driver.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index dc42b9492428a..578d59048b39c 100644
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

[Severity: High]
Will this cause unsupported requests or return garbage on some platforms?

Using memcpy_fromio() for a 32-bit register read often falls back to
byte-wise transactions (like rep movsb) instead of a single 32-bit atomic
transaction. For MMIO control registers, issuing four 1-byte PCIe
transactions can cause the hardware to drop the request.

Should this use readl() or the driver's xe_mmio_read32() wrapper instead
to guarantee the correct 32-bit transaction width?

> +
> +	mutex_unlock(&xe->pmt.lock);
> +	xe_pm_runtime_put(xe);
> +
> +dev_exit:
> +	drm_dev_exit(idx);
> +
> +	return ret;
> +}
> +
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

[Severity: High]
Does this have the same byte-wise transaction issue?

Similar to the read path above, using memcpy_toio() for a single 32-bit
register write can result in 4 byte-sized MMIO writes. Should this use
writel() or xe_mmio_write32() to ensure a single 32-bit atomic write?

> +
> +	mutex_unlock(&xe->pmt.lock);
> +	xe_pm_runtime_put(xe);
> +
> +dev_exit:
> +	drm_dev_exit(idx);
> +
> +	return ret;
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812193742.2170=
188-12-michael.j.ruhl@intel.com?part=3D8
