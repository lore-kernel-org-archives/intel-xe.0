Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ED8C35FEE
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 07:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD2E10E166;
	Tue, 17 Sep 2024 07:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DsLed9PX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02AEA10E431
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 07:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726559757; x=1758095757;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=dOQ5nwFfMwegGl8GNo+Id8uA2xmT+7y/uirvJb/SHqc=;
 b=DsLed9PXCAgpGTWtyokauMBgd4YqAlHTYi4FAMg9/18a5EsxxwEqv7cC
 7V6iRdXj8XJJgI32lEymx8mJtuYpZMzUFiLUkJaqvXXFSpZMwwZ4X7kC3
 6uJfRUTkoPauU6SbALkBiU8viLJU6VjIQxcYBBMxwy6uDhLmhKABf4HvN
 YOSwauqqi+B8cv0LgH4fgLfz5u9FDAPzOEMJypf7rZJ4l4zcLna8w+BZD
 tjPc3J15K5l7JbO4NpjC3eWBZ455DESqmNCeujF89z1oGxSjKzZsc6zyV
 Ndy3Uf/plARek4seXHWIFDt/RT3tr1Eh4JS3aymJOTKp5INH5RBRtp7Y5 Q==;
X-CSE-ConnectionGUID: 47H/4Iw1TFGOKLBIzp4lfg==
X-CSE-MsgGUID: VUJ97boJQbGm8SgTskXTiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25528435"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="25528435"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 00:55:57 -0700
X-CSE-ConnectionGUID: S5EFUaPWTTS1wYXiJzu7iQ==
X-CSE-MsgGUID: gdwHcBIrRoaiyKMgbj11gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69077323"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 00:55:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe: Move display reference timestamp readout
 to display/
In-Reply-To: <20240913162910.4145142-4-matthew.d.roper@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240913162910.4145142-4-matthew.d.roper@intel.com>
Date: Tue, 17 Sep 2024 10:55:52 +0300
Message-ID: <87jzfad88n.fsf@intel.com>
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

On Fri, 13 Sep 2024, Matt Roper <matthew.d.roper@intel.com> wrote:
> It's quite unusual to read display registers as part of GT
> initialization, but use of the display reference timestamp is one
> approach to calculating the GT clock frequency on older platforms.
> Rename the function that does this readout and move it to display/ to
> make it more clear what's actually happening when this route is taken.
> Also add an assert that we've probed display before calling this
> function since we never expect this to be the route taken on platforms
> that lack display.
>
> In the future we may want to move to an intel_display implementation
> that can be shared with i915, but we'll leave that for later.
>
> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Mixed feelings about this. On the one hand moving to display seems
appropriate, but adding any new stuff to xe_display.c means more stuff
to clean up for later.

As you know, i915 does this as well in i915 core. The next logical step
is then to have this in i915/display, and share the code between i915
and xe. Adding another interface for i915/display.

Worth it? Display itself doesn't seem to have a use for this. I don't
know.


BR,
Jani.



> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/display/xe_display.h |  4 ++++
>  drivers/gpu/drm/xe/xe_gt_clock.c        | 24 ++++++------------------
>  3 files changed, 28 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index a3131a67e5b1..ac6d08a5cc73 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -29,6 +29,7 @@
>  #include "intel_hdcp.h"
>  #include "intel_hotplug.h"
>  #include "intel_opregion.h"
> +#include "xe_mmio.h"
>  #include "xe_module.h"
>  
>  /* Xe device functions */
> @@ -510,3 +511,20 @@ int xe_display_probe(struct xe_device *xe)
>  	unset_display_features(xe);
>  	return 0;
>  }
> +
> +u32 xe_display_read_ref_ts_freq(struct xe_device *xe)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	u32 ts_override = xe_mmio_read32(mmio, TIMESTAMP_OVERRIDE);
> +	u32 base_freq, frac_freq;
> +
> +	base_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK,
> +				  ts_override) + 1;
> +	base_freq *= 1000000;
> +
> +	frac_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK,
> +				  ts_override);
> +	frac_freq = 1000000 / (frac_freq + 1);
> +
> +	return base_freq + frac_freq;
> +}
> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
> index 17afa537aee5..40030cac7fe9 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.h
> +++ b/drivers/gpu/drm/xe/display/xe_display.h
> @@ -43,6 +43,8 @@ void xe_display_pm_resume(struct xe_device *xe);
>  void xe_display_pm_runtime_suspend(struct xe_device *xe);
>  void xe_display_pm_runtime_resume(struct xe_device *xe);
>  
> +u32 xe_display_read_ref_ts_freq(struct xe_device *xe);
> +
>  #else
>  
>  static inline int xe_display_driver_probe_defer(struct pci_dev *pdev) { return 0; }
> @@ -76,5 +78,7 @@ static inline void xe_display_pm_resume(struct xe_device *xe) {}
>  static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
>  static inline void xe_display_pm_runtime_resume(struct xe_device *xe) {}
>  
> +static u32 xe_display_read_ref_ts_freq(struct xe_device *xe) { return 0; }
> +
>  #endif /* CONFIG_DRM_XE_DISPLAY */
>  #endif /* _XE_DISPLAY_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index cc2ae159298e..886c071c10f5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -7,6 +7,7 @@
>  
>  #include "xe_gt_clock.h"
>  
> +#include "display/xe_display.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
>  #include "xe_assert.h"
> @@ -15,22 +16,6 @@
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  
> -static u32 read_reference_ts_freq(struct xe_gt *gt)
> -{
> -	u32 ts_override = xe_mmio_read32(&gt->mmio, TIMESTAMP_OVERRIDE);
> -	u32 base_freq, frac_freq;
> -
> -	base_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK,
> -				  ts_override) + 1;
> -	base_freq *= 1000000;
> -
> -	frac_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK,
> -				  ts_override);
> -	frac_freq = 1000000 / (frac_freq + 1);
> -
> -	return base_freq + frac_freq;
> -}
> -
>  static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>  {
>  	const u32 f19_2_mhz = 19200000;
> @@ -57,14 +42,17 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>  
>  int xe_gt_clock_init(struct xe_gt *gt)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	u32 ctc_reg = xe_mmio_read32(&gt->mmio, CTC_MODE);
>  	u32 freq = 0;
>  
>  	/* Assuming gen11+ so assert this assumption is correct */
> -	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
> +	xe_gt_assert(gt, GRAPHICS_VER(xe) >= 11);
>  
>  	if (ctc_reg & CTC_SOURCE_DIVIDE_LOGIC) {
> -		freq = read_reference_ts_freq(gt);
> +		xe_gt_assert(gt, xe->info.probe_display);
> +
> +		freq = xe_display_read_ref_ts_freq(xe);
>  	} else {
>  		u32 c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);

-- 
Jani Nikula, Intel
