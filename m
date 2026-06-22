Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C99CCD98F2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 15:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1407910E614;
	Mon, 22 Jun 2026 15:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GiUN8j5P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84D610E614
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 15:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782142776; x=1813678776;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=lM2up0OMUuR2hJmBQ1m8yBs9QJrVsbk2iPaI2GJydgo=;
 b=GiUN8j5PkRdEiI2V6SZPBNSjovWvFEvRE9xsv60EvHhqyJdgYyfq1DlG
 Ll+3BusPPJDwNGtTssepJKwIXbL+nLHaCAnajS+MwhdZh5+EKl5UjXbO8
 R+BwHRQQBKS3wLOz4+XRB/ijUc7h2OmxOzTABlm02v+biqZNpJf66+Hzr
 SFhtYSzhlp2D/aBsDQnRzB3zDZQurqJCAY0ojliwW8LbhFU672kKlK3Vv
 aY9AWyPdXH8OwW/V1y5hH3pquqEKuZYU70/T1DIItWpZValJakJalCZlT
 cr5QKyUJu+a5PclmwIaPrDRLslefn5k+1yllWieMdZlxa627L/tRZCFPG Q==;
X-CSE-ConnectionGUID: f7if5T6vTCas2K6ZhIDnSw==
X-CSE-MsgGUID: cD+UYDF6SR2uf9PZCZwqqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="70392713"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="70392713"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 08:39:35 -0700
X-CSE-ConnectionGUID: BvsPGl0KRNq92e/3pQ6tIg==
X-CSE-MsgGUID: Mq743uhcS4qGamzBZbAghg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="246334565"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO [10.245.245.133])
 ([10.245.245.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 08:39:34 -0700
Message-ID: <c8d29b22-9d58-4630-add2-28951c681ced@intel.com>
Date: Mon, 22 Jun 2026 16:39:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/xe/mmio: Verify MMIO is available
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260622132342.19600-1-michal.wajdeczko@intel.com>
 <20260622132342.19600-2-michal.wajdeczko@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260622132342.19600-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 22/06/2026 14:23, Michal Wajdeczko wrote:
> We shouldn't access device registers after the device was unplugged
> or the MMIO bar (GTTMMADR) was unmapped. Instead of relying on the
> NPD splat due to zeroed tile->mmio.regs, which might be unreliable
> anyway as not all xe_mmio structs are using that directly, add an
> explicit check during all xe_mmio read/write operations to test if
> xe->mmio.regs are still mapped and safely abort with WARN if not.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
> v1: https://patchwork.freedesktop.org/patch/728625/?series=167403&rev=1
> v2: https://patchwork.freedesktop.org/patch/731360/?series=168108&rev=1
> v3: use WARN and early abort to avoid Oops (sashiko)
> ---
>   drivers/gpu/drm/xe/xe_mmio.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 78adb303b663..7e0cefcd16bd 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -17,6 +17,7 @@
>   #include "xe_device.h"
>   #include "xe_gt_sriov_vf.h"
>   #include "xe_sriov.h"
> +#include "xe_tile_printk.h"
>   #include "xe_trace.h"
>   #include "xe_wa.h"
>   
> @@ -128,6 +129,11 @@ void xe_mmio_init(struct xe_mmio *mmio, struct xe_tile *tile, void __iomem *ptr,
>   	mmio->tile = tile;
>   }
>   
> +static bool mmio_available(struct xe_mmio *mmio)
> +{
> +	return !xe_tile_WARN_ON_ONCE(mmio->tile, !mmio->tile->xe->mmio.regs);
> +}
> +
>   static void mmio_flush_pending_writes(struct xe_mmio *mmio)
>   {
>   #define DUMMY_REG_OFFSET	0x130030
> @@ -146,6 +152,9 @@ u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
>   	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>   	u8 val;
>   
> +	if (!mmio_available(mmio))
> +		return 0;
> +
>   	mmio_flush_pending_writes(mmio);
>   
>   	val = readb(mmio->regs + addr);
> @@ -158,6 +167,9 @@ void xe_mmio_write8(struct xe_mmio *mmio, struct xe_reg reg, u8 val)
>   {
>   	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>   
> +	if (!mmio_available(mmio))
> +		return;
> +
>   	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
>   
>   	writeb(val, mmio->regs + addr);
> @@ -168,6 +180,9 @@ u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
>   	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>   	u16 val;
>   
> +	if (!mmio_available(mmio))
> +		return 0;
> +
>   	mmio_flush_pending_writes(mmio);
>   
>   	val = readw(mmio->regs + addr);
> @@ -180,6 +195,9 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
>   {
>   	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>   
> +	if (!mmio_available(mmio))
> +		return;
> +
>   	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
>   
>   	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
> @@ -194,6 +212,9 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
>   	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>   	u32 val;
>   
> +	if (!mmio_available(mmio))
> +		return 0;
> +
>   	mmio_flush_pending_writes(mmio);
>   
>   	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))

