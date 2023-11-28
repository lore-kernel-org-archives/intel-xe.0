Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BE3C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 10:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB66A10E475;
	Tue, 28 Nov 2023 10:04:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5ECF10E475
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 10:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701165851; x=1732701851;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=WkwfOVGiDrPPIfgE2lITjYgyO1wh8RtUYdZZcv2C1Js=;
 b=oIh974xdN5lKd/PsRyGtwHvandepZTRgU3y9DUz0FhDCRKHBpQ+p4Qr4
 RZ8k+4uGxHZHs/aBDK0Tb+zVJEVwMgbNzwuzMhBU1/J1EVNH/WBC9xGt6
 dOV/nbtmc84CEPrWSk0nXSVZCdwe44+0qy7nH4crcQmZFGh1PmxUfxvPH
 bHQB9b6uo8mYMRXThqxHVQI+SFv6A/FZP+OnSOhpPlNCfdnTazh2ItLsZ
 17yL4FAl/aHuh83I/yzg4t/JnzGRwFebIUJErAjANUa10tgrwP2WPjyXQ
 yI1L67lPd8/6luyq+MMuv178eFrpmQcVfE0Ph8PBQZakT+cUv0tgYyhf9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="479091272"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="479091272"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 02:04:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="718334105"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="718334105"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 02:04:09 -0800
Message-ID: <9fa96965-3393-45d4-8b8d-6fb9596a5fdf@linux.intel.com>
Date: Tue, 28 Nov 2023 15:36:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20231127141125.2913415-1-riana.tauro@intel.com>
 <20231127141125.2913415-5-riana.tauro@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20231127141125.2913415-5-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 4/8] RFC drm/xe/guc: Add PMU counter for
 total active ticks
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


On 11/27/23 19:41, Riana Tauro wrote:
> GuC provides engine busyness ticks as a 64 bit counter which count
> as clock ticks. These counters are maintained in a
> shared memory buffer and internally updated on a continuous basis.
>
> GuC also provides a periodically total active ticks that GT has been
> active for. This counter is exposed to the user such that busyness can
> be calculated as a percentage using
>
> busyness % = (engine active ticks/total active ticks) * 100.
is the total active ticks from epoch, but PMU is relative from instance of event open
so i'm just thinking if total active ticks will be less than  engine active ticks in which case the
% will be greater than 100.

rather why don't we just expose engine busyness in ns like we did in i915.

@Tvrtko, any thoughts please?

Thanks,
Aravind.
>
> This patch provides a pmu counter for total active ticks.
>
> This is listed by perf tool as
>
> sudo ./perf list
> 	  xe_0000_03_00.0/total-active-ticks-gt0/            [Kernel PMU event]
>
> and can be read using
>
> sudo ./perf stat -e xe_0000_03_00.0/total-active-ticks-gt0/ -I 1000
>         time 	    counts  unit 	events
>     1.001332764    58942964    xe_0000_03_00.0/total-active-ticks-gt0/
>     2.011421147	   21191869    xe_0000_03_00.0/total-active-ticks-gt0/
>     3.013223865	   19269012    xe_0000_03_00.0/total-active-ticks-gt0/
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c                  | 11 +++
>  drivers/gpu/drm/xe/xe_gt.h                  |  1 +
>  drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 75 +++++++++++++++++----
>  drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  1 +
>  drivers/gpu/drm/xe/xe_pmu.c                 |  7 ++
>  include/uapi/drm/xe_drm.h                   |  1 +
>  6 files changed, 83 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index f06c74a7c6d0..2379462685f2 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -765,6 +765,17 @@ struct xe_hw_engine *xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt,
>  	return NULL;
>  }
>  
> +/**
> + * xe_gt_total_active_ticks - Return total active ticks
> + * @gt: GT structure
> + *
> + * Returns total active ticks that the GT was active for.
> + */
> +u64 xe_gt_total_active_ticks(struct xe_gt *gt)
> +{
> +	return xe_guc_engine_busyness_active_ticks(&gt->uc.guc);
> +}
> +
>  /**
>   * xe_gt_engine_busy_ticks - Return current accumulated engine busyness ticks
>   * @gt: GT structure
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index e23a6ceff863..023cb7c0c32d 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -41,6 +41,7 @@ void xe_gt_reset_async(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
>  
>  u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe);
> +u64 xe_gt_total_active_ticks(struct xe_gt *gt);
>  
>  /**
>   * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
> index 611bafd14d1a..dcf468ee30ea 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
> @@ -19,7 +19,16 @@
>   * timer internal to GuC. The update rate is guaranteed to be at least 2Hz (but with
>   * a caveat that is not real time, best effort only).
>   *
> + * In addition to the engine busyness ticks, there is also a total time count which
> + * is a free running GT timestamp counter.
> + *
> + * Note that counters should be used as ratios of each other for calculating a
> + * percentage.
> + *
>   * engine busyness ticks (ticks_engine) : clock ticks for which engine was active
> + * total active ticks (ticks_gt)	: total clock ticks
> + *
> + * engine busyness % = (ticks_engine / ticks_gt) * 100
>   */
>  
>  static bool guc_engine_busyness_supported(struct xe_guc *guc)
> @@ -41,48 +50,69 @@ static bool guc_engine_busyness_supported(struct xe_guc *guc)
>  
>  static void guc_engine_busyness_usage_map(struct xe_guc *guc,
>  					  struct xe_hw_engine *hwe,
> -					  struct iosys_map *engine_map)
> +					  struct iosys_map *engine_map,
> +					  struct iosys_map *global_map)
>  {
>  	struct iosys_map *map;
>  	size_t offset;
>  	u32 instance;
>  	u8 guc_class;
>  
> -	guc_class = xe_engine_class_to_guc_class(hwe->class);
> -	instance = hwe->logical_instance;
> +	if (hwe) {
> +		guc_class = xe_engine_class_to_guc_class(hwe->class);
> +		instance = hwe->logical_instance;
> +	}
>  
>  	map = &guc->busy.bo->vmap;
>  
> -	offset = offsetof(struct guc_engine_observation_data,
> -			  engine_data[guc_class][instance]);
> +	if (hwe) {
> +		offset = offsetof(struct guc_engine_observation_data,
> +				  engine_data[guc_class][instance]);
>  
> -	*engine_map = IOSYS_MAP_INIT_OFFSET(map, offset);
> +		*engine_map = IOSYS_MAP_INIT_OFFSET(map, offset);
> +	}
> +
> +	*global_map = IOSYS_MAP_INIT_OFFSET(map, 0);
>  }
>  
>  static void guc_engine_busyness_get_usage(struct xe_guc *guc,
>  					  struct xe_hw_engine *hwe,
> -					  u64 *_ticks_engine)
> +					  u64 *_ticks_engine,
> +					  u64 *_ticks_gt)
>  {
> -	struct iosys_map engine_map;
> -	u64 ticks_engine = 0;
> +	struct iosys_map engine_map, global_map;
> +	u64 ticks_engine = 0, ticks_gt = 0;
>  	int i = 0;
>  
> -	guc_engine_busyness_usage_map(guc, hwe, &engine_map);
> +	guc_engine_busyness_usage_map(guc, hwe, &engine_map, &global_map);
>  
>  #define read_engine_usage(map_, field_) \
>  	iosys_map_rd_field(map_, 0, struct guc_engine_data, field_)
>  
> +#define read_global_field(map_, field_) \
> +	iosys_map_rd_field(map_, 0, struct guc_engine_observation_data, field_)
> +
>  	do {
> -		ticks_engine = read_engine_usage(&engine_map, total_execution_ticks);
> +		if (hwe)
> +			ticks_engine = read_engine_usage(&engine_map, total_execution_ticks);
> +
> +		ticks_gt = read_global_field(&global_map, gt_timestamp);
>  
> -		if (read_engine_usage(&engine_map, total_execution_ticks) == ticks_engine)
> +		if (hwe && read_engine_usage(&engine_map, total_execution_ticks) != ticks_engine)
> +			continue;
> +
> +		if (read_global_field(&global_map, gt_timestamp) == ticks_gt)
>  			break;
>  	} while (++i < 6);
>  
>  #undef read_engine_usage
> +#undef read_global_field
>  
>  	if (_ticks_engine)
>  		*_ticks_engine = ticks_engine;
> +
> +	if (_ticks_gt)
> +		*_ticks_gt = ticks_gt;
>  }
>  
>  static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
> @@ -112,6 +142,25 @@ static void guc_engine_busyness_fini(struct drm_device *drm, void *arg)
>  	xe_bo_unpin_map_no_vm(guc->busy.bo);
>  }
>  
> +/*
> + * xe_guc_engine_busyness_active_ticks - Gets the total active ticks
> + * @guc: The GuC object
> + *
> + * Returns total active ticks that the GT has been running for.
> + */
> +u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc)
> +{
> +	u64 ticks_gt;
> +
> +	/* Engine busyness supported only on GuC >= 70.11.1 */
> +	if (!guc_engine_busyness_supported(guc))
> +		return 0;
> +
> +	guc_engine_busyness_get_usage(guc, NULL, NULL, &ticks_gt);
> +
> +	return ticks_gt;
> +}
> +
>  /*
>   * xe_guc_engine_busyness_ticks - Gets current accumulated
>   *				  engine busyness ticks
> @@ -128,7 +177,7 @@ u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>  	if (!guc_engine_busyness_supported(guc))
>  		return 0;
>  
> -	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine);
> +	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine, NULL);
>  
>  	return ticks_engine;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
> index d70f06209896..57325910ebc4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
> @@ -12,6 +12,7 @@ struct xe_hw_engine;
>  struct xe_guc;
>  
>  int xe_guc_engine_busyness_init(struct xe_guc *guc);
> +u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc);
>  u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index 6dd5c97129f2..0beb660689da 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -9,6 +9,7 @@
>  
>  #include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
> +#include "xe_gt.h"
>  #include "xe_gt_clock.h"
>  #include "xe_mmio.h"
>  
> @@ -124,6 +125,8 @@ config_status(struct xe_device *xe, u64 config)
>  		if (!(gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0))))
>  			return -ENOENT;
>  		break;
> +	case DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0):
> +		break;
>  	default:
>  		return -ENOENT;
>  	}
> @@ -186,6 +189,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>  	case DRM_XE_PMU_MEDIA_GROUP_BUSY(0):
>  		val = engine_group_busyness_read(gt, config);
>  		break;
> +	case DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0):
> +		val = xe_gt_total_active_ticks(gt);
> +		break;
>  	default:
>  		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>  	}
> @@ -357,6 +363,7 @@ create_event_attributes(struct xe_pmu *pmu)
>  		__event(1, "copy-group-busy", "ns"),
>  		__event(2, "media-group-busy", "ns"),
>  		__event(3, "any-engine-group-busy", "ns"),
> +		__event(4, "total-active-ticks", NULL),
>  	};
>  
>  	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 88f3aca02b08..6f38f836b705 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1016,6 +1016,7 @@ struct drm_xe_wait_user_fence {
>  #define DRM_XE_PMU_COPY_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 1)
>  #define DRM_XE_PMU_MEDIA_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 2)
>  #define DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 3)
> +#define DRM_XE_PMU_TOTAL_ACTIVE_TICKS(gt)	___DRM_XE_PMU_OTHER(gt, 4)
>  
>  #if defined(__cplusplus)
>  }
