Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2F3CD5BD5
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 09:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7CD10EE9A;
	Thu, 28 May 2026 09:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQIs/lWR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E0C10EE9F
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 09:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779959614; x=1811495614;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=nNS9TrDgb8C/jSu1tUzjqfqwUZJY0b6PEypqUakhvzw=;
 b=mQIs/lWR/JNBKU8UxJ7J7veuv16HQqnDC2a3Xf85LPO9cCatr7aGdB+/
 RJiFEP8mynePfr75POYO+L/BNvv1IQ8uvG/xmbXZXmQu9nBtTlKi7fDIK
 YgDtxsMwjjhlyo4gaoilgGapShfHpX7lLEMpJOKRJUmfurKMb8tOaa8e1
 CIWXo6tTd8RkbTdui1zoqWWcTRTeWo+dcj/j88U3aEcuyGPJgokvEW+0e
 yUSAvMBqA1GEFTW/3TxvSQ2McDp6sFDrpsYxcZoMcx0KOo0EdGvofde2T
 J62Cak6N8Ik8UtYsG22BDIJTTCKeK1rlOSroz7mT/0ljRjR7vg44d2efh g==;
X-CSE-ConnectionGUID: BiPTVTlRSRCGsJcFcEeHAg==
X-CSE-MsgGUID: 9EtsGZSfQVq3ut+KLuxo+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80700425"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="80700425"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 02:13:34 -0700
X-CSE-ConnectionGUID: TnuJ7tcESjCBK/oJcxLLIA==
X-CSE-MsgGUID: hvUwJl35QoqY0PTN1OsCUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="241466755"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.236])
 ([10.245.245.236])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 02:13:33 -0700
Message-ID: <754ed1a5-ed12-4e0e-bafc-5775106d8e14@intel.com>
Date: Thu, 28 May 2026 10:13:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/mmio: Assert MMIO is available
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260527175437.22585-1-michal.wajdeczko@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260527175437.22585-1-michal.wajdeczko@intel.com>
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

On 27/05/2026 18:54, Michal Wajdeczko wrote:
> We shouldn't access device registers after the device was unplugged.
> Instead of relying on the NPD splat due to zeroed xe.mmio.regs, which
> might be unreliable anyway as not all xe_mmio are using that directly,
> add an explicit assert during xe_mmio read/write operations to catch
> invalid accesses to MMIO after device was unplugged.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mmio.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 78adb303b663..b77a717f0556 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -10,6 +10,7 @@
>   #include <linux/minmax.h>
>   #include <linux/pci.h>
>   
> +#include <drm/drm_drv.h>
>   #include <drm/drm_managed.h>
>   #include <drm/drm_print.h>
>   
> @@ -128,6 +129,11 @@ void xe_mmio_init(struct xe_mmio *mmio, struct xe_tile *tile, void __iomem *ptr,
>   	mmio->tile = tile;
>   }
>   
> +static void mmio_assert_available(struct xe_mmio *mmio)
> +{
> +	xe_tile_assert(mmio->tile, !drm_dev_is_unplugged(&mmio->tile->xe->drm));

Yeah, I was hopeful this would work, but as per CI the unplug=true needs 
to happen before the devm actions run, so we get a pile of false 
positives with this. I think the best we can do is NULL, or perhaps 
mmio.unplugged and check that here?

> +}
> +
>   static void mmio_flush_pending_writes(struct xe_mmio *mmio)
>   {
>   #define DUMMY_REG_OFFSET	0x130030
> @@ -146,6 +152,7 @@ u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
>   	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>   	u8 val;
>   
> +	mmio_assert_available(mmio);
>   	mmio_flush_pending_writes(mmio);
>   
>   	val = readb(mmio->regs + addr);
> @@ -158,6 +165,7 @@ void xe_mmio_write8(struct xe_mmio *mmio, struct xe_reg reg, u8 val)
>   {
>   	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>   
> +	mmio_assert_available(mmio);
>   	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
>   
>   	writeb(val, mmio->regs + addr);
> @@ -168,6 +176,7 @@ u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
>   	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>   	u16 val;
>   
> +	mmio_assert_available(mmio);
>   	mmio_flush_pending_writes(mmio);
>   
>   	val = readw(mmio->regs + addr);
> @@ -180,6 +189,7 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
>   {
>   	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>   
> +	mmio_assert_available(mmio);
>   	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
>   
>   	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
> @@ -194,6 +204,7 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
>   	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>   	u32 val;
>   
> +	mmio_assert_available(mmio);
>   	mmio_flush_pending_writes(mmio);
>   
>   	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))

