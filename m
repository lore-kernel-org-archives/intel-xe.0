Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D34C48291
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 11:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EDE10F7E1;
	Mon,  5 Feb 2024 11:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFa1JShg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55E510F971
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 11:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707131422; x=1738667422;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=FuFYZOn8REbqUNVEAif2ARgrK+5n1s4PXozXR8A/RmE=;
 b=NFa1JShgGVUVShFvr44S1lBvfwL2QgX7tb7MmJDJY9ho1XnMaaTBmYXL
 hfmtl/JDH9ZLRO7zzVcpLlevCfhvI6b0YMrHh2J7kK3VOUw9mThYwhnvo
 bRuY+vnk/E6QUw97Hg99wqqm0xlBRFMzUw3g1IGsgb4sK/6n8HmAHgqKW
 lBTLdvl9djR994bGrQM/T11Bid29+7PHjSIqRQFewJSl0pqH5V7EuPERe
 cGsc6ZMbnJG8hju6+zJn8YJBrBdM8u3l5kyePnaC4L03l+/moPw8OV+ii
 TmRHhca0CsC5p3wecbdmu+91B/lxX1zNqieyzPMvymFmpJagdgWi8qGu6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="18025275"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="18025275"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 03:10:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="31781928"
Received: from vgolodni-mobl.ger.corp.intel.com (HELO [10.252.0.151])
 ([10.252.0.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 03:10:21 -0800
Message-ID: <6303efb2-d36f-4666-803d-abe55ced98b4@intel.com>
Date: Mon, 5 Feb 2024 11:10:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 14/34] drm/xe: Runtime PM wake on every debugfs call
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-15-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-15-rodrigo.vivi@intel.com>
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

On 26/01/2024 20:30, Rodrigo Vivi wrote:
> Let's ensure our PCI device is awaken on every debugfs call.
> Let's increase the runtime_pm protection and start moving
> that to the outer bounds.
> 
> Also remove the mem_access get_put helpers, now that they are not
> needed anymore.

Wrong commit?

> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Otherwise,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_debugfs.c     | 10 +++---
>   drivers/gpu/drm/xe/xe_gt_debugfs.c  | 53 ++++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_guc_debugfs.c |  9 ++---
>   drivers/gpu/drm/xe/xe_huc_debugfs.c |  5 +--
>   drivers/gpu/drm/xe/xe_ttm_sys_mgr.c |  5 ++-
>   5 files changed, 66 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 01db5b27bec5..8abdf3c17e1d 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -12,6 +12,7 @@
>   #include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_gt_debugfs.h"
> +#include "xe_pm.h"
>   #include "xe_step.h"
>   
>   #ifdef CONFIG_DRM_XE_DEBUG
> @@ -37,6 +38,8 @@ static int info(struct seq_file *m, void *data)
>   	struct xe_gt *gt;
>   	u8 id;
>   
> +	xe_pm_runtime_get(xe);
> +
>   	drm_printf(&p, "graphics_verx100 %d\n", xe->info.graphics_verx100);
>   	drm_printf(&p, "media_verx100 %d\n", xe->info.media_verx100);
>   	drm_printf(&p, "stepping G:%s M:%s D:%s B:%s\n",
> @@ -63,6 +66,7 @@ static int info(struct seq_file *m, void *data)
>   			   gt->info.engine_mask);
>   	}
>   
> +	xe_pm_runtime_put(xe);
>   	return 0;
>   }
>   
> @@ -76,8 +80,7 @@ static int forcewake_open(struct inode *inode, struct file *file)
>   	struct xe_gt *gt;
>   	u8 id;
>   
> -	xe_device_mem_access_get(xe);
> -
> +	xe_pm_runtime_get(xe);
>   	for_each_gt(gt, xe, id)
>   		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>   
> @@ -92,8 +95,7 @@ static int forcewake_release(struct inode *inode, struct file *file)
>   
>   	for_each_gt(gt, xe, id)
>   		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> -
> -	xe_device_mem_access_put(xe);
> +	xe_pm_runtime_put(xe);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c4b67cf09f8f..6b4dc2927727 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -18,6 +18,7 @@
>   #include "xe_lrc.h"
>   #include "xe_macros.h"
>   #include "xe_pat.h"
> +#include "xe_pm.h"
>   #include "xe_reg_sr.h"
>   #include "xe_reg_whitelist.h"
>   #include "xe_uc_debugfs.h"
> @@ -37,10 +38,10 @@ static int hw_engines(struct seq_file *m, void *data)
>   	enum xe_hw_engine_id id;
>   	int err;
>   
> -	xe_device_mem_access_get(xe);
> +	xe_pm_runtime_get(xe);
>   	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	if (err) {
> -		xe_device_mem_access_put(xe);
> +		xe_pm_runtime_put(xe);
>   		return err;
>   	}
>   
> @@ -48,7 +49,7 @@ static int hw_engines(struct seq_file *m, void *data)
>   		xe_hw_engine_print(hwe, &p);
>   
>   	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	xe_device_mem_access_put(xe);
> +	xe_pm_runtime_put(xe);
>   	if (err)
>   		return err;
>   
> @@ -59,18 +60,23 @@ static int force_reset(struct seq_file *m, void *data)
>   {
>   	struct xe_gt *gt = node_to_gt(m->private);
>   
> +	xe_pm_runtime_get(gt_to_xe(gt));
>   	xe_gt_reset_async(gt);
> +	xe_pm_runtime_put(gt_to_xe(gt));
>   
>   	return 0;
>   }
>   
>   static int sa_info(struct seq_file *m, void *data)
>   {
> -	struct xe_tile *tile = gt_to_tile(node_to_gt(m->private));
> +	struct xe_gt *gt = node_to_gt(m->private);
> +	struct xe_tile *tile = gt_to_tile(gt);
>   	struct drm_printer p = drm_seq_file_printer(m);
>   
> +	xe_pm_runtime_get(gt_to_xe(gt));
>   	drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, &p,
>   				     tile->mem.kernel_bb_pool->gpu_addr);
> +	xe_pm_runtime_put(gt_to_xe(gt));
>   
>   	return 0;
>   }
> @@ -80,7 +86,9 @@ static int topology(struct seq_file *m, void *data)
>   	struct xe_gt *gt = node_to_gt(m->private);
>   	struct drm_printer p = drm_seq_file_printer(m);
>   
> +	xe_pm_runtime_get(gt_to_xe(gt));
>   	xe_gt_topology_dump(gt, &p);
> +	xe_pm_runtime_put(gt_to_xe(gt));
>   
>   	return 0;
>   }
> @@ -90,7 +98,9 @@ static int steering(struct seq_file *m, void *data)
>   	struct xe_gt *gt = node_to_gt(m->private);
>   	struct drm_printer p = drm_seq_file_printer(m);
>   
> +	xe_pm_runtime_get(gt_to_xe(gt));
>   	xe_gt_mcr_steering_dump(gt, &p);
> +	xe_pm_runtime_put(gt_to_xe(gt));
>   
>   	return 0;
>   }
> @@ -99,8 +109,13 @@ static int ggtt(struct seq_file *m, void *data)
>   {
>   	struct xe_gt *gt = node_to_gt(m->private);
>   	struct drm_printer p = drm_seq_file_printer(m);
> +	int ret;
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +	ret = xe_ggtt_dump(gt_to_tile(gt)->mem.ggtt, &p);
> +	xe_pm_runtime_put(gt_to_xe(gt));
>   
> -	return xe_ggtt_dump(gt_to_tile(gt)->mem.ggtt, &p);
> +	return ret;
>   }
>   
>   static int register_save_restore(struct seq_file *m, void *data)
> @@ -110,6 +125,8 @@ static int register_save_restore(struct seq_file *m, void *data)
>   	struct xe_hw_engine *hwe;
>   	enum xe_hw_engine_id id;
>   
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +
>   	xe_reg_sr_dump(&gt->reg_sr, &p);
>   	drm_printf(&p, "\n");
>   
> @@ -127,6 +144,8 @@ static int register_save_restore(struct seq_file *m, void *data)
>   	for_each_hw_engine(hwe, gt, id)
>   		xe_reg_whitelist_dump(&hwe->reg_whitelist, &p);
>   
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
>   	return 0;
>   }
>   
> @@ -135,7 +154,9 @@ static int workarounds(struct seq_file *m, void *data)
>   	struct xe_gt *gt = node_to_gt(m->private);
>   	struct drm_printer p = drm_seq_file_printer(m);
>   
> +	xe_pm_runtime_get(gt_to_xe(gt));
>   	xe_wa_dump(gt, &p);
> +	xe_pm_runtime_put(gt_to_xe(gt));
>   
>   	return 0;
>   }
> @@ -145,48 +166,70 @@ static int pat(struct seq_file *m, void *data)
>   	struct xe_gt *gt = node_to_gt(m->private);
>   	struct drm_printer p = drm_seq_file_printer(m);
>   
> +	xe_pm_runtime_get(gt_to_xe(gt));
>   	xe_pat_dump(gt, &p);
> +	xe_pm_runtime_put(gt_to_xe(gt));
>   
>   	return 0;
>   }
>   
>   static int rcs_default_lrc(struct seq_file *m, void *data)
>   {
> +	struct xe_gt *gt = node_to_gt(m->private);
>   	struct drm_printer p = drm_seq_file_printer(m);
>   
> +	xe_pm_runtime_get(gt_to_xe(gt));
>   	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_RENDER);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
>   	return 0;
>   }
>   
>   static int ccs_default_lrc(struct seq_file *m, void *data)
>   {
> +	struct xe_gt *gt = node_to_gt(m->private);
>   	struct drm_printer p = drm_seq_file_printer(m);
>   
> +	xe_pm_runtime_get(gt_to_xe(gt));
>   	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COMPUTE);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
>   	return 0;
>   }
>   
>   static int bcs_default_lrc(struct seq_file *m, void *data)
>   {
> +	struct xe_gt *gt = node_to_gt(m->private);
>   	struct drm_printer p = drm_seq_file_printer(m);
>   
> +	xe_pm_runtime_get(gt_to_xe(gt));
>   	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COPY);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
>   	return 0;
>   }
>   
>   static int vcs_default_lrc(struct seq_file *m, void *data)
>   {
> +	struct xe_gt *gt = node_to_gt(m->private);
>   	struct drm_printer p = drm_seq_file_printer(m);
>   
> +	xe_pm_runtime_get(gt_to_xe(gt));
>   	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_DECODE);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
>   	return 0;
>   }
>   
>   static int vecs_default_lrc(struct seq_file *m, void *data)
>   {
> +	struct xe_gt *gt = node_to_gt(m->private);
>   	struct drm_printer p = drm_seq_file_printer(m);
>   
> +	xe_pm_runtime_get(gt_to_xe(gt));
>   	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_ENHANCE);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> index ffd7d53bcc42..d3822cbea273 100644
> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> @@ -14,6 +14,7 @@
>   #include "xe_guc_ct.h"
>   #include "xe_guc_log.h"
>   #include "xe_macros.h"
> +#include "xe_pm.h"
>   
>   static struct xe_guc *node_to_guc(struct drm_info_node *node)
>   {
> @@ -26,9 +27,9 @@ static int guc_info(struct seq_file *m, void *data)
>   	struct xe_device *xe = guc_to_xe(guc);
>   	struct drm_printer p = drm_seq_file_printer(m);
>   
> -	xe_device_mem_access_get(xe);
> +	xe_pm_runtime_get(xe);
>   	xe_guc_print_info(guc, &p);
> -	xe_device_mem_access_put(xe);
> +	xe_pm_runtime_put(xe);
>   
>   	return 0;
>   }
> @@ -39,9 +40,9 @@ static int guc_log(struct seq_file *m, void *data)
>   	struct xe_device *xe = guc_to_xe(guc);
>   	struct drm_printer p = drm_seq_file_printer(m);
>   
> -	xe_device_mem_access_get(xe);
> +	xe_pm_runtime_get(xe);
>   	xe_guc_log_print(&guc->log, &p);
> -	xe_device_mem_access_put(xe);
> +	xe_pm_runtime_put(xe);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_huc_debugfs.c b/drivers/gpu/drm/xe/xe_huc_debugfs.c
> index 18585a7eeb9d..3a888a40188b 100644
> --- a/drivers/gpu/drm/xe/xe_huc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_huc_debugfs.c
> @@ -12,6 +12,7 @@
>   #include "xe_gt.h"
>   #include "xe_huc.h"
>   #include "xe_macros.h"
> +#include "xe_pm.h"
>   
>   static struct xe_gt *
>   huc_to_gt(struct xe_huc *huc)
> @@ -36,9 +37,9 @@ static int huc_info(struct seq_file *m, void *data)
>   	struct xe_device *xe = huc_to_xe(huc);
>   	struct drm_printer p = drm_seq_file_printer(m);
>   
> -	xe_device_mem_access_get(xe);
> +	xe_pm_runtime_get(xe);
>   	xe_huc_print_info(huc, &p);
> -	xe_device_mem_access_put(xe);
> +	xe_pm_runtime_put(xe);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> index 3e1fa0c832ca..9844a8edbfe1 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> @@ -73,7 +73,10 @@ static void xe_ttm_sys_mgr_del(struct ttm_resource_manager *man,
>   static void xe_ttm_sys_mgr_debug(struct ttm_resource_manager *man,
>   				 struct drm_printer *printer)
>   {
> -
> +	/*
> +	 * This function is called by debugfs entry and would require
> +	 * pm_runtime_{get,put} wrappers around any operation.
> +	 */
>   }
>   
>   static const struct ttm_resource_manager_func xe_ttm_sys_mgr_func = {
