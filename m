Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974B7E87823
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 12:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942D610E63C;
	Tue,  3 Feb 2026 12:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CtspQlGm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD1510E102;
 Tue,  3 Feb 2026 12:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770122850; x=1801658850;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=wLeDDx9y97jeXtCzsGUQxyRU2q3suaUrfG+cSpuf6CM=;
 b=CtspQlGmT84lkvEus+zcldIiu0kOlsBtRIpjcWWx/+KM2pDUYo5a/FVe
 MugSsHMFHy618tFkKdfxMWlVzi6oJcDuBkVi+BiH7ra1DrUcShHm2tXeP
 QBu8MqxoQhxaHOglzmRbrlcbNl3C3a+QGB7BoLW4XO1jxzjY/W23uDNeU
 KkFz1pvIrCi9bEeepgKOSUE74RBDsPemVAknF+OLdk2TjLrpbCWFD9yg9
 gs3FI0cqMyaAeEEW2B/w7XbU+y72NYki/V9HT9vX1quayhHmMD9Vg23Ke
 9kROqzfT604H0of2gyybNgPhNCG3EMu7EvgE+6I/lsNx4fraC1NeFzaNN w==;
X-CSE-ConnectionGUID: 2tGtKy1mSJeQaSyhqJ0Iag==
X-CSE-MsgGUID: p5qNawLJRuu4OBHdt9fG5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71198299"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="71198299"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 04:47:29 -0800
X-CSE-ConnectionGUID: lZQfLCeXQte2zpjPjsv/9w==
X-CSE-MsgGUID: SYkoEUnjRXeL1pU/HySudg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="209130518"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.205])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 04:47:26 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v3 15/19] drm/i915: Remove i915_reg.h from intel_fifo_underrun.c
In-Reply-To: <20260129211358.1240283-16-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260129211358.1240283-1-uma.shankar@intel.com>
 <20260129211358.1240283-16-uma.shankar@intel.com>
Date: Tue, 03 Feb 2026 14:47:24 +0200
Message-ID: <4336e44d7e5c71453d26883b6d9f0cc0c90ab0b5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 30 Jan 2026, Uma Shankar <uma.shankar@intel.com> wrote:
> Move GEN7_ERR_INT reg to common header to make intel_fifo_underrun.c
> free from including i915_reg.h.
>
> v2: Move GEN7_ERR_INT regs to display header (Jani)
>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  .../gpu/drm/i915/display/intel_display_regs.h | 23 +++++++++++++++++++
>  .../drm/i915/display/intel_fifo_underrun.c    |  1 -
>  drivers/gpu/drm/i915/i915_reg.h               | 23 -------------------
>  3 files changed, 23 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
> index 23626ee2d4ce..ab2ef267c9ce 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -91,6 +91,29 @@
>  #define   DERRMR_PIPEC_VBLANK		(1 << 21)
>  #define   DERRMR_PIPEC_HBLANK		(1 << 22)
>  
> +#define GEN7_ERR_INT	_MMIO(0x44040)
> +#define   ERR_INT_POISON		(1 << 31)
> +#define   ERR_INT_INVALID_GTT_PTE	(1 << 29)
> +#define   ERR_INT_INVALID_PTE_DATA	(1 << 28)
> +#define   ERR_INT_SPRITE_C_FAULT	(1 << 23)
> +#define   ERR_INT_PRIMARY_C_FAULT	(1 << 22)
> +#define   ERR_INT_CURSOR_C_FAULT	(1 << 21)
> +#define   ERR_INT_SPRITE_B_FAULT	(1 << 20)
> +#define   ERR_INT_PRIMARY_B_FAULT	(1 << 19)
> +#define   ERR_INT_CURSOR_B_FAULT	(1 << 18)
> +#define   ERR_INT_SPRITE_A_FAULT	(1 << 17)
> +#define   ERR_INT_PRIMARY_A_FAULT	(1 << 16)
> +#define   ERR_INT_CURSOR_A_FAULT	(1 << 15)
> +#define   ERR_INT_MMIO_UNCLAIMED	(1 << 13)
> +#define   ERR_INT_PIPE_CRC_DONE_C	(1 << 8)
> +#define   ERR_INT_FIFO_UNDERRUN_C	(1 << 6)
> +#define   ERR_INT_PIPE_CRC_DONE_B	(1 << 5)
> +#define   ERR_INT_FIFO_UNDERRUN_B	(1 << 3)
> +#define   ERR_INT_PIPE_CRC_DONE_A	(1 << 2)
> +#define   ERR_INT_PIPE_CRC_DONE(pipe)	(1 << (2 + (pipe) * 3))
> +#define   ERR_INT_FIFO_UNDERRUN_A	(1 << 0)
> +#define   ERR_INT_FIFO_UNDERRUN(pipe)	(1 << ((pipe) * 3))
> +
>  #define VLV_IRQ_REGS		I915_IRQ_REGS(VLV_IMR, \
>  					      VLV_IER, \
>  					      VLV_IIR)
> diff --git a/drivers/gpu/drm/i915/display/intel_fifo_underrun.c b/drivers/gpu/drm/i915/display/intel_fifo_underrun.c
> index b413b3e871d8..bf047180def9 100644
> --- a/drivers/gpu/drm/i915/display/intel_fifo_underrun.c
> +++ b/drivers/gpu/drm/i915/display/intel_fifo_underrun.c
> @@ -29,7 +29,6 @@
>  
>  #include <drm/drm_print.h>
>  
> -#include "i915_reg.h"
>  #include "intel_de.h"
>  #include "intel_display_irq.h"
>  #include "intel_display_regs.h"
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index b23ac1b8f495..611ae5861450 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -327,29 +327,6 @@
>  #define GEN7_MEDIA_MAX_REQ_COUNT	_MMIO(0x4070)
>  #define GEN7_GFX_MAX_REQ_COUNT		_MMIO(0x4074)
>  
> -#define GEN7_ERR_INT	_MMIO(0x44040)
> -#define   ERR_INT_POISON		(1 << 31)
> -#define   ERR_INT_INVALID_GTT_PTE	(1 << 29)
> -#define   ERR_INT_INVALID_PTE_DATA	(1 << 28)
> -#define   ERR_INT_SPRITE_C_FAULT	(1 << 23)
> -#define   ERR_INT_PRIMARY_C_FAULT	(1 << 22)
> -#define   ERR_INT_CURSOR_C_FAULT	(1 << 21)
> -#define   ERR_INT_SPRITE_B_FAULT	(1 << 20)
> -#define   ERR_INT_PRIMARY_B_FAULT	(1 << 19)
> -#define   ERR_INT_CURSOR_B_FAULT	(1 << 18)
> -#define   ERR_INT_SPRITE_A_FAULT	(1 << 17)
> -#define   ERR_INT_PRIMARY_A_FAULT	(1 << 16)
> -#define   ERR_INT_CURSOR_A_FAULT	(1 << 15)
> -#define   ERR_INT_MMIO_UNCLAIMED	(1 << 13)
> -#define   ERR_INT_PIPE_CRC_DONE_C	(1 << 8)
> -#define   ERR_INT_FIFO_UNDERRUN_C	(1 << 6)
> -#define   ERR_INT_PIPE_CRC_DONE_B	(1 << 5)
> -#define   ERR_INT_FIFO_UNDERRUN_B	(1 << 3)
> -#define   ERR_INT_PIPE_CRC_DONE_A	(1 << 2)
> -#define   ERR_INT_PIPE_CRC_DONE(pipe)	(1 << (2 + (pipe) * 3))
> -#define   ERR_INT_FIFO_UNDERRUN_A	(1 << 0)
> -#define   ERR_INT_FIFO_UNDERRUN(pipe)	(1 << ((pipe) * 3))
> -
>  #define FPGA_DBG		_MMIO(0x42300)
>  #define   FPGA_DBG_RM_NOCLAIM	REG_BIT(31)

-- 
Jani Nikula, Intel
