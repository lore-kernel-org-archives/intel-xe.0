Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CC3C44536
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 11:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E059F10E98A;
	Thu, 22 Jan 2026 11:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0A+SRu9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821CE10E98A;
 Thu, 22 Jan 2026 11:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769081814; x=1800617814;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=memREqZU5vkSQkIvjsRfAYZRvebhBCPJCQWOcsKZqrQ=;
 b=G0A+SRu9thUPB4lkzQYwdIdaUNT7n320dh+6BBwBVOhNGxP0WiqaDdyX
 uGTilAKQXt2CpB2XHkfDIgrZOrS5uOYvQY6jks7z6QjrIfq+ZX55woNzW
 I2XxS+iL6GNxa6l1ElWs9IHOrXBw8m5DkCJPBqmeAMutPzumgOQpCQcuy
 kSb5oggvFVlVLHoLel/2paKeuum6m0pMJ1rgYA5UaErepG+UNzI+3sWWQ
 5+U+UcWrN68k/fDm58JRwbXmu1FfD2PoQcTrG8r7rrybAoJOsvBXTQ64T
 5hfzQiTcWYREfb/qoPP5FP2Sx7KN5MMUA3cc5/9MULZvvwqdXVXHWAL0M w==;
X-CSE-ConnectionGUID: boxYrMHjQpaFaQ+BIJXTrA==
X-CSE-MsgGUID: YW29G6gjRYi6sFeDrhC/zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70222341"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="70222341"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:36:54 -0800
X-CSE-ConnectionGUID: wGijcoQcTN+Y4es4MkWYtA==
X-CSE-MsgGUID: qdSTgfmJQROPHTjbk3S6jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="210856117"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:36:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v2 06/19] drm/{i915, xe}: Remove i915_reg.h from
 intel_display_device.c
In-Reply-To: <20260121232414.707192-7-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260121232414.707192-1-uma.shankar@intel.com>
 <20260121232414.707192-7-uma.shankar@intel.com>
Date: Thu, 22 Jan 2026 13:36:48 +0200
Message-ID: <e3b2fb8eefcfe7362bd24cd626a8ee7d2c4f4fce@intel.com>
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

On Thu, 22 Jan 2026, Uma Shankar <uma.shankar@intel.com> wrote:
> Move GU_CNTL_PROTECTED to common header, this helps
> intel_display_device.c free from i915_reg.h dependency.

This doesn't mention the GMD ID stuff.

>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_device.c | 2 +-
>  drivers/gpu/drm/i915/display/intel_display_regs.h   | 3 +++
>  drivers/gpu/drm/i915/i915_reg.h                     | 8 --------
>  include/drm/intel/intel_gmd_common_regs.h           | 5 +++++
>  4 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
> index 471f236c9ddf..f7cc4198a870 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> @@ -9,8 +9,8 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_print.h>
>  #include <drm/intel/pciids.h>
> +#include <drm/intel/intel_gmd_common_regs.h>
>  
> -#include "i915_reg.h"
>  #include "intel_cx0_phy_regs.h"
>  #include "intel_de.h"
>  #include "intel_display.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
> index 5136b7166775..3447ee229354 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -6,6 +6,9 @@
>  
>  #include "intel_display_reg_defs.h"
>  
> +#define GU_CNTL_PROTECTED		_MMIO(0x10100C)
> +#define   DEPRESENT			REG_BIT(9)
> +
>  #define _GEN7_PIPEA_DE_LOAD_SL	0x70068
>  #define _GEN7_PIPEB_DE_LOAD_SL	0x71068
>  #define GEN7_PIPE_DE_LOAD_SL(pipe) _MMIO_PIPE(pipe, _GEN7_PIPEA_DE_LOAD_SL, _GEN7_PIPEB_DE_LOAD_SL)
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 35122c997b8a..fac24a649d61 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -117,9 +117,6 @@
>   *  #define GEN8_BAR                    _MMIO(0xb888)
>   */
>  
> -#define GU_CNTL_PROTECTED		_MMIO(0x10100C)
> -#define   DEPRESENT			REG_BIT(9)
> -
>  #define GU_CNTL				_MMIO(0x101010)
>  #define   LMEM_INIT			REG_BIT(7)
>  #define   DRIVERFLR			REG_BIT(31)
> @@ -925,11 +922,6 @@
>  #define   MASK_WAKEMEM				REG_BIT(13)
>  #define   DDI_CLOCK_REG_ACCESS			REG_BIT(7)
>  
> -#define GMD_ID_DISPLAY				_MMIO(0x510a0)
> -#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
> -#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
> -#define   GMD_ID_STEP				REG_GENMASK(5, 0)
> -
>  /* PCH */
>  
>  #define SDEISR  _MMIO(0xc4000)
> diff --git a/include/drm/intel/intel_gmd_common_regs.h b/include/drm/intel/intel_gmd_common_regs.h
> index 8e9a574c87d9..489d59379ab0 100644
> --- a/include/drm/intel/intel_gmd_common_regs.h
> +++ b/include/drm/intel/intel_gmd_common_regs.h
> @@ -105,4 +105,9 @@
>  #define     PCODE_MBOX_DOMAIN_NONE		0x0
>  #define     PCODE_MBOX_DOMAIN_MEDIAFF		0x3
>  
> +#define GMD_ID_DISPLAY				_MMIO(0x510a0)
> +#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
> +#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
> +#define   GMD_ID_STEP				REG_GENMASK(5, 0)

Only display uses GMD_ID_DISPLAY register. I'd put this in display regs,
and define the register contents with GMD_ID_DISPLAY_* even if the
register contents are identical for display and non-display GMD
registers.

Main point is, we should use the common regs file as little as possible.

BR,
Jani.

> +
>  #endif

-- 
Jani Nikula, Intel
