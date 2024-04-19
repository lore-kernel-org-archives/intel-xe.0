Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E12CC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 16:37:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1408910FA1F;
	Fri, 19 Apr 2024 16:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+1Xf9uE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8505110F9B0
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 16:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713544638; x=1745080638;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+d09882ALEfP0MWchJNVZSCXaJeOkHs1uz7LKqprRzc=;
 b=A+1Xf9uE18OjUGOuyDizqUqW8bvigTtidpJ1j8fmvi2imaiw8wi4/lh9
 RSC51+u5PEMI6vT4d22EZnhxE9Dzhy4Nzwj+areoXA0a5tj3AcPWZkC/1
 nl0jWTMrIy2cREGzg0abDcDWjmsy+p9m4OvmNKP4tFHUn7CdYUkgQrYVN
 EA+jCUPj8A4bkmIufxSQhq4PcqRguKkU7AVgj9hl6iXUucuS5D3TME87v
 aAUzMtOBANTMlFRbixt/SObj/yTsKH0WsCosCtFIJf317vz8Z5NHMxMIM
 VenA68/zX+RJ8w1kg1BCHUdjkbQC4bM3gAna29QRQHudq7kdcR3fOo5Tm Q==;
X-CSE-ConnectionGUID: e/XWpyDPTIivoG6zv52Lhw==
X-CSE-MsgGUID: KCPsItRUTHaZUe8AbQbgNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9014322"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9014322"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 09:37:18 -0700
X-CSE-ConnectionGUID: HwLWIwzrTYmc0ZisBlTn8A==
X-CSE-MsgGUID: Uy2C7HOOQCCi2RR3SB8lsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23449898"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 19 Apr 2024 09:37:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 19 Apr 2024 19:37:15 +0300
Date: Fri, 19 Apr 2024 19:37:15 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Add reg read/write trace
Message-ID: <ZiKdu4Hpn8ugUy7f@intel.com>
References: <20240418222243.3285041-1-radhakrishna.sripada@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418222243.3285041-1-radhakrishna.sripada@intel.com>
X-Patchwork-Hint: comment
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

On Thu, Apr 18, 2024 at 03:22:43PM -0700, Radhakrishna Sripada wrote:
> This will help debug register read/writes and provides
> a way to trace all the mmio transactions.
> 
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c  | 20 +++++++++++++++++---
>  drivers/gpu/drm/xe/xe_trace.h | 28 ++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 334637511e75..659c19d4f0a6 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -22,6 +22,7 @@
>  #include "xe_module.h"
>  #include "xe_sriov.h"
>  #include "xe_tile.h"
> +#include "xe_trace.h"
>  
>  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
>  #define TILE_COUNT		REG_GENMASK(15, 8)
> @@ -423,21 +424,29 @@ int xe_mmio_init(struct xe_device *xe)
>  u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> +	u8 val;
>  
>  	if (reg.addr < gt->mmio.adj_limit)
>  		reg.addr += gt->mmio.adj_offset;
>  
> -	return readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
> +	val = readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
> +	trace_xe_reg_rw(false, reg, val, sizeof(val), true);
> +
> +	return val;
>  }
>  
>  u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> +	u16 val;
>  
>  	if (reg.addr < gt->mmio.adj_limit)
>  		reg.addr += gt->mmio.adj_offset;
>  
> -	return readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
> +	val = readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
> +	trace_xe_reg_rw(false, reg, val, sizeof(val), true);
> +
> +	return val;
>  }
>  
>  void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
> @@ -447,17 +456,22 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>  	if (reg.addr < gt->mmio.adj_limit)
>  		reg.addr += gt->mmio.adj_offset;
>  
> +	trace_xe_reg_rw(true, reg, val, sizeof(val), true);
>  	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
>  }
>  
>  u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> +	u32 val;
>  
>  	if (reg.addr < gt->mmio.adj_limit)
>  		reg.addr += gt->mmio.adj_offset;
>  
> -	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
> +	val = readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
> +	trace_xe_reg_rw(false, reg, val, sizeof(val), true);
> +
> +	return val;
>  }
>  
>  u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 2d56cfc09e42..41d778dd43c6 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -621,6 +621,34 @@ DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
>  
>  );
>  
> +TRACE_EVENT_CONDITION(xe_reg_rw,
> +	TP_PROTO(bool write, u32 reg, u64 val, int len, bool trace),
> +
> +	TP_ARGS(write, reg, val, len, trace),
> +
> +	TP_CONDITION(trace),
> +
> +	TP_STRUCT__entry(
> +		__field(u64, val)
> +		__field(u32, reg)
> +		__field(u16, write)
> +		__field(u16, len)
> +		),
> +
> +	TP_fast_assign(
> +		__entry->val = (u64)val;
> +		__entry->reg = reg;
> +		__entry->write = write;
> +		__entry->len = len;
> +		),
> +
> +	TP_printk("%s reg=0x%x, len=%d, val=(0x%x, 0x%x)",

Someone should do something about all the i915 and xe
tracepoints that lack the device information. Currently
those are somewhat useless on any multi-gpu system (unless
you can guarantee only gpu is actually doing something).

> +		__entry->write ? "write" : "read",
> +		__entry->reg, __entry->len,
> +		(u32)(__entry->val & 0xffffffff),
> +		(u32)(__entry->val >> 32))
> +);
> +
>  #endif
>  
>  /* This part must be outside protection */
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
