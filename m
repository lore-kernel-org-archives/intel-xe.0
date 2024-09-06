Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804B8CE7AE8
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 09:02:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA5C10E9D0;
	Fri,  6 Sep 2024 09:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BMqy6byh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFFF10E9D0
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 09:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725613337; x=1757149337;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=okOcYcFQzEEUAN8bXXE/72inhkLILBO3jRaG/xX2Yrc=;
 b=BMqy6byhCHlT8FPft4gVroLyCMWAKQGzujCDE9qepiwvEPB6I4FyN26k
 g/icWA8uWIj55onY8xwH6e1g12j7YGsmYRjlciy3LVMS6vL26UXeDB6rC
 YgnK3jCDWcQ0KOUlHF6JicTpODU6LwQvcqOw9sYiIPP4kKQ3LVQERBHPU
 exVRVKOsaQ/d+fH3O65wx3LHiXKwougIsqMUBD6GPPhdDTsPve8/VkiaI
 p1TnXJmOUI9E3dfjyRah5irHyjf+zbCzLwK1O1YMav+ftcRv/JrsCVWYD
 pYh+CXBJvCYhJjMLCc9lSjUnR6hG1M0vnAwrLb8acXiER676wjj24YMvs Q==;
X-CSE-ConnectionGUID: CKswe4NTQ06FLMi5kCFoGg==
X-CSE-MsgGUID: pe01ix7VRaK7P1BplsSE8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24165724"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="24165724"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 02:02:17 -0700
X-CSE-ConnectionGUID: /8xGfFa3TDWAePS29eh0BA==
X-CSE-MsgGUID: bUPaJK/IQn6lRpP4iWFD9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="70697283"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.27])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 02:02:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: Re: [PATCH 14/43] drm/xe/compat-i915: Convert register access to
 use xe_mmio
In-Reply-To: <20240904002100.2023834-59-matthew.d.roper@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-59-matthew.d.roper@intel.com>
Date: Fri, 06 Sep 2024 12:02:09 +0300
Message-ID: <87cylhnoj2.fsf@intel.com>
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

On Tue, 03 Sep 2024, Matt Roper <matthew.d.roper@intel.com> wrote:
> Stop using GT pointers for register access.
>
> Since display (via compat-i915) was the only part of the driver doing
> 8-bit and 16-bit register reads, this also allows us to drop the
> _Generic wrapper macro on these two functions.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  .../drm/xe/compat-i915-headers/intel_uncore.h | 36 +++++++++----------
>  drivers/gpu/drm/xe/xe_mmio.c                  |  4 +--
>  drivers/gpu/drm/xe/xe_mmio.h                  |  7 ++--
>  3 files changed, 22 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> index eb5b5f0e4bd9..ee3469d4ae73 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> @@ -10,11 +10,11 @@
>  #include "xe_device_types.h"
>  #include "xe_mmio.h"
>  
> -static inline struct xe_gt *__compat_uncore_to_gt(struct intel_uncore *uncore)
> +static inline struct xe_mmio *__compat_uncore_to_mmio(struct intel_uncore *uncore)
>  {
>  	struct xe_device *xe = container_of(uncore, struct xe_device, uncore);
>  
> -	return xe_root_mmio_gt(xe);
> +	return xe_root_tile_mmio(xe);
>  }

Side note, I'd be really interested in ideas getting from the intel_de.h
struct intel_display based interfaces to both i915 struct intel_uncore
and xe struct xe_mmio based interfaces.

Is the easiest common denominator actually a struct drm_device based
interface? At the calling side, we shouldn't use or have any idea about
i915 or xe specifics, like struct drm_i915_private, struct xe_device,
struct intel_uncore, struct xe_mmio, struct intel_gt or struct xe_gt,
etc.

BR,
Jani.


>  
>  static inline struct xe_tile *__compat_uncore_to_tile(struct intel_uncore *uncore)
> @@ -29,7 +29,7 @@ static inline u32 intel_uncore_read(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
> +	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
>  }
>  
>  static inline u8 intel_uncore_read8(struct intel_uncore *uncore,
> @@ -37,7 +37,7 @@ static inline u8 intel_uncore_read8(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_read8(__compat_uncore_to_gt(uncore), reg);
> +	return xe_mmio_read8(__compat_uncore_to_mmio(uncore), reg);
>  }
>  
>  static inline u16 intel_uncore_read16(struct intel_uncore *uncore,
> @@ -45,7 +45,7 @@ static inline u16 intel_uncore_read16(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_read16(__compat_uncore_to_gt(uncore), reg);
> +	return xe_mmio_read16(__compat_uncore_to_mmio(uncore), reg);
>  }
>  
>  static inline u64
> @@ -57,11 +57,11 @@ intel_uncore_read64_2x32(struct intel_uncore *uncore,
>  	u32 upper, lower, old_upper;
>  	int loop = 0;
>  
> -	upper = xe_mmio_read32(__compat_uncore_to_gt(uncore), upper_reg);
> +	upper = xe_mmio_read32(__compat_uncore_to_mmio(uncore), upper_reg);
>  	do {
>  		old_upper = upper;
> -		lower = xe_mmio_read32(__compat_uncore_to_gt(uncore), lower_reg);
> -		upper = xe_mmio_read32(__compat_uncore_to_gt(uncore), upper_reg);
> +		lower = xe_mmio_read32(__compat_uncore_to_mmio(uncore), lower_reg);
> +		upper = xe_mmio_read32(__compat_uncore_to_mmio(uncore), upper_reg);
>  	} while (upper != old_upper && loop++ < 2);
>  
>  	return (u64)upper << 32 | lower;
> @@ -72,7 +72,7 @@ static inline void intel_uncore_posting_read(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
> +	xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
>  }
>  
>  static inline void intel_uncore_write(struct intel_uncore *uncore,
> @@ -80,7 +80,7 @@ static inline void intel_uncore_write(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
> +	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
>  }
>  
>  static inline u32 intel_uncore_rmw(struct intel_uncore *uncore,
> @@ -88,7 +88,7 @@ static inline u32 intel_uncore_rmw(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_rmw32(__compat_uncore_to_gt(uncore), reg, clear, set);
> +	return xe_mmio_rmw32(__compat_uncore_to_mmio(uncore), reg, clear, set);
>  }
>  
>  static inline int intel_wait_for_register(struct intel_uncore *uncore,
> @@ -97,7 +97,7 @@ static inline int intel_wait_for_register(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
> +	return xe_mmio_wait32(__compat_uncore_to_mmio(uncore), reg, mask, value,
>  			      timeout * USEC_PER_MSEC, NULL, false);
>  }
>  
> @@ -107,7 +107,7 @@ static inline int intel_wait_for_register_fw(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
> +	return xe_mmio_wait32(__compat_uncore_to_mmio(uncore), reg, mask, value,
>  			      timeout * USEC_PER_MSEC, NULL, false);
>  }
>  
> @@ -118,7 +118,7 @@ __intel_wait_for_register(struct intel_uncore *uncore, i915_reg_t i915_reg,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
> +	return xe_mmio_wait32(__compat_uncore_to_mmio(uncore), reg, mask, value,
>  			      fast_timeout_us + 1000 * slow_timeout_ms,
>  			      out_value, false);
>  }
> @@ -128,7 +128,7 @@ static inline u32 intel_uncore_read_fw(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
> +	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
>  }
>  
>  static inline void intel_uncore_write_fw(struct intel_uncore *uncore,
> @@ -136,7 +136,7 @@ static inline void intel_uncore_write_fw(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
> +	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
>  }
>  
>  static inline u32 intel_uncore_read_notrace(struct intel_uncore *uncore,
> @@ -144,7 +144,7 @@ static inline u32 intel_uncore_read_notrace(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
> +	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
>  }
>  
>  static inline void intel_uncore_write_notrace(struct intel_uncore *uncore,
> @@ -152,7 +152,7 @@ static inline void intel_uncore_write_notrace(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
> +	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
>  }
>  
>  static inline void __iomem *intel_uncore_regs(struct intel_uncore *uncore)
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 92f0bda0ae30..dbede6056bee 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -200,7 +200,7 @@ static void mmio_flush_pending_writes(struct xe_mmio *mmio)
>  		writel(0, mmio->regs + DUMMY_REG_OFFSET);
>  }
>  
> -u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
> +u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
>  {
>  	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>  	u8 val;
> @@ -214,7 +214,7 @@ u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
>  	return val;
>  }
>  
> -u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
> +u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
>  {
>  	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>  	u16 val;
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index ac6846447c52..99e3b58c9bb2 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -27,11 +27,8 @@ int xe_mmio_probe_tiles(struct xe_device *xe);
>  		 const struct xe_mmio *: (ptr), \
>  		 struct xe_mmio *: (ptr))
>  
> -u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
> -#define xe_mmio_read8(p, reg) __xe_mmio_read8(__to_xe_mmio(p), reg)
> -
> -u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
> -#define xe_mmio_read16(p, reg) __xe_mmio_read16(__to_xe_mmio(p), reg)
> +u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
> +u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
>  
>  void __xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val);
>  #define xe_mmio_write32(p, reg, val) __xe_mmio_write32(__to_xe_mmio(p), reg, val)

-- 
Jani Nikula, Intel
