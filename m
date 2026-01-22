Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E177AC44500
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 11:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A312E10E985;
	Thu, 22 Jan 2026 11:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQdUoj1S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8F510E984;
 Thu, 22 Jan 2026 11:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769081195; x=1800617195;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QUuGzP4RszsC6DB0tL8JbfBhdmBjnnjU8CDdb5DrXVA=;
 b=SQdUoj1SFoN+vjYQTuWizlHdIpNuNM7FiWUOv3lH8Dn86vLqxd6KQNvI
 TIgBZ1ntsuI+792uuu1nN4sE3XR9KIQ1ucd4XJfBYGeXmNF0qxOqtQKEy
 3LHANknhCzRwjCdUeAAQdL9Gx/eMc/gmsM1TYGMzgve12pAju9Szd14JK
 7I0ufyUcNAt8LRUz7ewYjqz6hmBXJVpEoSoiC4CuueRCrdXyyYxeb/4DX
 eApTrPlHLFV40OHeVv5mC/jYsUBSeCnH954DORpBT0A5di2/CHJ6KO5CR
 rvuDxkidjBtOlNQLQmLAJpTe/gOrkJPDrE/L1hIm/C6xcFidSbNvX2FeX Q==;
X-CSE-ConnectionGUID: sOTZYwBuR1ynKJPJbyOLjQ==
X-CSE-MsgGUID: TbXkkvgNQLWpv1l+m7HEnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81038696"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="81038696"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:26:35 -0800
X-CSE-ConnectionGUID: 2lWSnozyRoSJfy4kz4S3tQ==
X-CSE-MsgGUID: sk6+0zAaRweXgD2iunaNww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="237378341"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:26:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v2 02/19] drm/{i915, xe}: Extract South chicken registers from
 i915_reg.h to display
In-Reply-To: <20260121232414.707192-3-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260121232414.707192-1-uma.shankar@intel.com>
 <20260121232414.707192-3-uma.shankar@intel.com>
Date: Thu, 22 Jan 2026 13:26:29 +0200
Message-ID: <099215c667f4e0019c9200fb5558fcadff9d04bc@intel.com>
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
> Extract South Chicken registers from i915_reg.h to display header.
> This allows intel_pch_refclk.c not to include i915_reg.h
>
> v2: Drop common header in include and use display_regs.h (Jani)
>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>

Just drm/i915 is sufficient as subject prefix.

It's mildly annoying that there's a bunch of whitespace changes bundled
in here. They should be kept separate, if only to speed up review by 10x
with 'git show --color-moved' which works wonders for pure code
movement. Subsequent separate whitespace changes, in turn, are a breeze
to review with 'git show -w'.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  .../gpu/drm/i915/display/intel_display_regs.h | 28 +++++++++++++++++++
>  .../gpu/drm/i915/display/intel_pch_refclk.c   |  1 -
>  drivers/gpu/drm/i915/i915_reg.h               | 27 ------------------
>  3 files changed, 28 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
> index 9f8fbfb2e115..4759a9600d3f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -2864,6 +2864,34 @@ enum skl_power_gate {
>  #define  SFUSE_STRAP_DDIC_DETECTED	(1 << 1)
>  #define  SFUSE_STRAP_DDID_DETECTED	(1 << 0)
>  
> +#define SOUTH_CHICKEN1			_MMIO(0xc2000)
> +#define  FDIA_PHASE_SYNC_SHIFT_OVR	19
> +#define  FDIA_PHASE_SYNC_SHIFT_EN	18
> +#define  INVERT_DDIE_HPD		REG_BIT(28)
> +#define  INVERT_DDID_HPD_MTP		REG_BIT(27)
> +#define  INVERT_TC4_HPD			REG_BIT(26)
> +#define  INVERT_TC3_HPD			REG_BIT(25)
> +#define  INVERT_TC2_HPD			REG_BIT(24)
> +#define  INVERT_TC1_HPD			REG_BIT(23)
> +#define  INVERT_DDID_HPD		(1 << 18)
> +#define  INVERT_DDIC_HPD		(1 << 17)
> +#define  INVERT_DDIB_HPD                (1 << 16)
> +#define  INVERT_DDIA_HPD                (1 << 15)
> +#define  FDI_PHASE_SYNC_OVR(pipe)	(1 << (FDIA_PHASE_SYNC_SHIFT_OVR - ((pipe) * 2)))
> +#define  FDI_PHASE_SYNC_EN(pipe)	(1 << (FDIA_PHASE_SYNC_SHIFT_EN - ((pipe) * 2)))
> +#define  FDI_BC_BIFURCATION_SELECT	(1 << 12)
> +#define  CHASSIS_CLK_REQ_DURATION_MASK	(0xf << 8)
> +#define  CHASSIS_CLK_REQ_DURATION(x)	((x) << 8)
> +#define  SBCLK_RUN_REFCLK_DIS		(1 << 7)
> +#define  ICP_SECOND_PPS_IO_SELECT	REG_BIT(2)
> +#define  SPT_PWM_GRANULARITY		(1 << 0)
> +
> +#define SOUTH_CHICKEN2			_MMIO(0xc2004)
> +#define  FDI_MPHY_IOSFSB_RESET_STATUS	(1 << 13)
> +#define  FDI_MPHY_IOSFSB_RESET_CTL	(1 << 12)
> +#define  LPT_PWM_GRANULARITY		(1 << 5)
> +#define  DPLS_EDP_PPS_FIX_DIS		(1 << 0)
> +
>  /* Gen4+ Timestamp and Pipe Frame time stamp registers */
>  #define GEN4_TIMESTAMP		_MMIO(0x2358)
>  #define ILK_TIMESTAMP_HI	_MMIO(0x70070)
> diff --git a/drivers/gpu/drm/i915/display/intel_pch_refclk.c b/drivers/gpu/drm/i915/display/intel_pch_refclk.c
> index 9a89bb6dcf65..5f88663ef5e8 100644
> --- a/drivers/gpu/drm/i915/display/intel_pch_refclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_pch_refclk.c
> @@ -5,7 +5,6 @@
>  
>  #include <drm/drm_print.h>
>  
> -#include "i915_reg.h"
>  #include "intel_de.h"
>  #include "intel_display_regs.h"
>  #include "intel_display_types.h"
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index d247e107f42f..80ea0df40b1e 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -1022,33 +1022,6 @@
>  #define   TRANS_CHICKEN1_HDMIUNIT_GC_DISABLE	REG_BIT(10)
>  #define   TRANS_CHICKEN1_DP0UNIT_GC_DISABLE	REG_BIT(4)
>  
> -#define SOUTH_CHICKEN1		_MMIO(0xc2000)
> -#define  FDIA_PHASE_SYNC_SHIFT_OVR	19
> -#define  FDIA_PHASE_SYNC_SHIFT_EN	18
> -#define  INVERT_DDIE_HPD			REG_BIT(28)
> -#define  INVERT_DDID_HPD_MTP			REG_BIT(27)
> -#define  INVERT_TC4_HPD				REG_BIT(26)
> -#define  INVERT_TC3_HPD				REG_BIT(25)
> -#define  INVERT_TC2_HPD				REG_BIT(24)
> -#define  INVERT_TC1_HPD				REG_BIT(23)
> -#define  INVERT_DDID_HPD			(1 << 18)
> -#define  INVERT_DDIC_HPD			(1 << 17)
> -#define  INVERT_DDIB_HPD			(1 << 16)
> -#define  INVERT_DDIA_HPD			(1 << 15)
> -#define  FDI_PHASE_SYNC_OVR(pipe) (1 << (FDIA_PHASE_SYNC_SHIFT_OVR - ((pipe) * 2)))
> -#define  FDI_PHASE_SYNC_EN(pipe) (1 << (FDIA_PHASE_SYNC_SHIFT_EN - ((pipe) * 2)))
> -#define  FDI_BC_BIFURCATION_SELECT	(1 << 12)
> -#define  CHASSIS_CLK_REQ_DURATION_MASK	(0xf << 8)
> -#define  CHASSIS_CLK_REQ_DURATION(x)	((x) << 8)
> -#define  SBCLK_RUN_REFCLK_DIS		(1 << 7)
> -#define  ICP_SECOND_PPS_IO_SELECT	REG_BIT(2)
> -#define  SPT_PWM_GRANULARITY		(1 << 0)
> -#define SOUTH_CHICKEN2		_MMIO(0xc2004)
> -#define  FDI_MPHY_IOSFSB_RESET_STATUS	(1 << 13)
> -#define  FDI_MPHY_IOSFSB_RESET_CTL	(1 << 12)
> -#define  LPT_PWM_GRANULARITY		(1 << 5)
> -#define  DPLS_EDP_PPS_FIX_DIS		(1 << 0)
> -
>  #define SOUTH_DSPCLK_GATE_D	_MMIO(0xc2020)
>  #define  PCH_GMBUSUNIT_CLOCK_GATE_DISABLE (1 << 31)
>  #define  PCH_DPLUNIT_CLOCK_GATE_DISABLE (1 << 30)

-- 
Jani Nikula, Intel
