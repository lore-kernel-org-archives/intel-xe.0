Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7006CE7FDCF
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 11:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A7610E31E;
	Tue,  3 Feb 2026 11:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QBmjfLB5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE7610E31B;
 Tue,  3 Feb 2026 11:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770119452; x=1801655452;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=t0YQO5O2IZFKurNSc/J4TfIQCC0rJpkl6Mzv7UaRB1g=;
 b=QBmjfLB5Bq75V0LSRr217XclopR4A6weaoFM2xkqGquOMZBG4g06BtQ1
 nqwkXrixhjKqNLub2rQwj54dE55hXRm8f19MCd2xyhtzCbI+JeSQft+qy
 Nynd4fCeYmyX7H+b9XfBW/CdhvJ8KOn/hucO2VZzYuoq8pUUP42Bq0rYe
 RXkbHxfOsT2j042zP1WCX3d0/sU35gkXrGdvF2G6PXovMAbBU5ZYb0lSh
 HR1kekYmuxKOf5QjN2T/Re7DhDDAD/kRyujZN1cvIl8jJWjRhVU8qAL8Z
 R/7Nv4u21In3mVPeYl+puqcVXj0ZTgXP872yvg7m6NGR5poxiImR8n0cN Q==;
X-CSE-ConnectionGUID: mXKtWJ4PT7yJEXm6Q9ZkBA==
X-CSE-MsgGUID: d+r1VbflQRW8gjwn9lJuqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="70305693"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="70305693"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 03:50:50 -0800
X-CSE-ConnectionGUID: nM7PzXJmTTi23dYmonqCzg==
X-CSE-MsgGUID: f5CQIAfvRhuMQqLh34hnDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="247433987"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.205])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 03:50:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v3 07/19] drm/i915: Remove i915_reg.h from intel_dram.c
In-Reply-To: <20260129211358.1240283-8-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260129211358.1240283-1-uma.shankar@intel.com>
 <20260129211358.1240283-8-uma.shankar@intel.com>
Date: Tue, 03 Feb 2026 13:50:45 +0200
Message-ID: <b4abcc0081e9f63c756e1bc3767ad16cc92e13af@intel.com>
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
> Make intel_dram.c free from including i915_reg.h.
>
> v2: Move mem config register to newly added pcode header (Jani)
>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dram.c | 2 +-
>  drivers/gpu/drm/i915/i915_reg.h           | 6 ------
>  include/drm/intel/intel_pcode.h           | 6 ++++++
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dram.c b/drivers/gpu/drm/i915/display/intel_dram.c
> index 3b9879714ea9..3366e18f594e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dram.c
> +++ b/drivers/gpu/drm/i915/display/intel_dram.c
> @@ -7,8 +7,8 @@
>  
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
> +#include <drm/intel/intel_pcode.h>
>  
> -#include "i915_reg.h"
>  #include "intel_display_core.h"
>  #include "intel_display_utils.h"
>  #include "intel_dram.h"
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 4341308c3b2b..bc466d8c8c60 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -1010,12 +1010,6 @@
>  #define OROM_OFFSET				_MMIO(0x1020c0)
>  #define   OROM_OFFSET_MASK			REG_GENMASK(20, 16)
>  
> -#define MTL_MEM_SS_INFO_GLOBAL			_MMIO(0x45700)
> -#define   XE3P_ECC_IMPACTING_DE			REG_BIT(12)
> -#define   MTL_N_OF_ENABLED_QGV_POINTS_MASK	REG_GENMASK(11, 8)
> -#define   MTL_N_OF_POPULATED_CH_MASK		REG_GENMASK(7, 4)
> -#define   MTL_DDR_TYPE_MASK			REG_GENMASK(3, 0)
> -
>  #define MTL_MEDIA_GSI_BASE		0x380000
>  
>  #endif /* _I915_REG_H_ */
> diff --git a/include/drm/intel/intel_pcode.h b/include/drm/intel/intel_pcode.h
> index 8e9a574c87d9..f6f894ba9b20 100644
> --- a/include/drm/intel/intel_pcode.h
> +++ b/include/drm/intel/intel_pcode.h
> @@ -105,4 +105,10 @@
>  #define     PCODE_MBOX_DOMAIN_NONE		0x0
>  #define     PCODE_MBOX_DOMAIN_MEDIAFF		0x3
>  
> +#define MTL_MEM_SS_INFO_GLOBAL			_MMIO(0x45700)
> +#define   XE3P_ECC_IMPACTING_DE			REG_BIT(12)
> +#define   MTL_N_OF_ENABLED_QGV_POINTS_MASK	REG_GENMASK(11, 8)
> +#define   MTL_N_OF_POPULATED_CH_MASK		REG_GENMASK(7, 4)
> +#define   MTL_DDR_TYPE_MASK			REG_GENMASK(3, 0)

This isn't related to pcode, and this is only used in display. Why here?

BR,
Jani.

> +
>  #endif

-- 
Jani Nikula, Intel
