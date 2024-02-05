Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15BDC48291
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 10:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE4210F49C;
	Mon,  5 Feb 2024 10:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MynMnfAF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EA010F49C
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 10:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707130546; x=1738666546;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Ehvpcl9sUlplTvI0owpcbLmxnr/mkPxQIiN1yUhwqO0=;
 b=MynMnfAFhzsaRX520B7MUHACeQSNub9IdoxffPX+KlqB4tyuq7dDXm99
 I5pk5SlK87GiJ3Ax0YKAVDWIuYEwwXzmLYHt9TQuBvfnET/jukgO9eeUk
 swdfTmnxkOuH52nWZd1K/xPesBFqZUFS7X18zPqLCDdrtWDDxBMUVzVOO
 YJSbwNDUVVCC+rWp4nxyQCP43L6YMkf+ECeeb5CQiHOAtHMqAVTwvRgjn
 ojk1YBE8Lel8dOeCM9zgbVIHlEl48k04AOZu9B1ttOczUEc+MKyDjCChg
 5TIS0YLEZTYpsMm66I1haNlfeLkAJnLrB5x7+EiEQfSQMD0uDrvCGa3Xr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11868539"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="11868539"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 02:55:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="23937360"
Received: from vgolodni-mobl.ger.corp.intel.com (HELO [10.252.0.151])
 ([10.252.0.151])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 02:55:44 -0800
Message-ID: <b5c42b69-cbc1-4c1b-959f-202847456636@intel.com>
Date: Mon, 5 Feb 2024 10:55:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 11/34] drm/xe: Runtime PM wake on every sysfs call
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-12-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-12-rodrigo.vivi@intel.com>
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
> Let's ensure our PCI device is awaken on every sysfs call.
> Let's increase the runtime_pm protection and start moving
> that to the outer bounds.
> 
> For now, for the files with small number of attr functions,
> let's only call the runtime pm functions directly.
> For the hw_engines entries with many files, let's add
> the sysfs_ops wrapper.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_sysfs.c          |  4 ++
>   drivers/gpu/drm/xe/xe_gt_freq.c               | 38 +++++++++++-
>   drivers/gpu/drm/xe/xe_gt_idle.c               | 23 +++++++-
>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     |  3 +
>   drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 58 ++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |  7 +++
>   drivers/gpu/drm/xe/xe_tile_sysfs.c            |  1 +
>   7 files changed, 129 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index 99113a5a2b84..e47c8ad1bb17 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -35,7 +35,9 @@ vram_d3cold_threshold_show(struct device *dev,
>   	if (!xe)
>   		return -EINVAL;
>   
> +	xe_pm_runtime_get(xe);

Does it make sense to use the get_sync/ioctl version?

Assuming CI is happy,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   	ret = sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
> +	xe_pm_runtime_put(xe);
>   
>   	return ret;
>   }
> @@ -58,7 +60,9 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>   
>   	drm_dbg(&xe->drm, "vram_d3cold_threshold: %u\n", vram_d3cold_threshold);
>   
> +	xe_pm_runtime_get(xe);
>   	ret = xe_pm_set_vram_threshold(xe, vram_d3cold_threshold);
> +	xe_pm_runtime_put(xe);
>   
>   	return ret ?: count;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index e5b0f4ecdbe8..32b9a743629c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -15,6 +15,7 @@
>   #include "xe_gt_sysfs.h"
>   #include "xe_gt_throttle_sysfs.h"
>   #include "xe_guc_pc.h"
> +#include "xe_pm.h"
>   
>   /**
>    * DOC: Xe GT Frequency Management
> @@ -49,12 +50,23 @@ dev_to_pc(struct device *dev)
>   	return &kobj_to_gt(dev->kobj.parent)->uc.guc.pc;
>   }
>   
> +static struct xe_device *
> +dev_to_xe(struct device *dev)
> +{
> +	return gt_to_xe(kobj_to_gt(dev->kobj.parent));
> +}
> +
>   static ssize_t act_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	u32 freq;
> +
> +	xe_pm_runtime_get(dev_to_xe(dev));
> +	freq = xe_guc_pc_get_act_freq(pc);
> +	xe_pm_runtime_put(dev_to_xe(dev));
>   
> -	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_act_freq(pc));
> +	return sysfs_emit(buf, "%d\n", freq);
>   }
>   static DEVICE_ATTR_RO(act_freq);
>   
> @@ -65,7 +77,9 @@ static ssize_t cur_freq_show(struct device *dev,
>   	u32 freq;
>   	ssize_t ret;
>   
> +	xe_pm_runtime_get(dev_to_xe(dev));
>   	ret = xe_guc_pc_get_cur_freq(pc, &freq);
> +	xe_pm_runtime_put(dev_to_xe(dev));
>   	if (ret)
>   		return ret;
>   
> @@ -77,8 +91,13 @@ static ssize_t rp0_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	u32 freq;
> +
> +	xe_pm_runtime_get(dev_to_xe(dev));
> +	freq = xe_guc_pc_get_rp0_freq(pc);
> +	xe_pm_runtime_put(dev_to_xe(dev));
>   
> -	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rp0_freq(pc));
> +	return sysfs_emit(buf, "%d\n", freq);
>   }
>   static DEVICE_ATTR_RO(rp0_freq);
>   
> @@ -86,8 +105,13 @@ static ssize_t rpe_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	u32 freq;
> +
> +	xe_pm_runtime_get(dev_to_xe(dev));
> +	freq = xe_guc_pc_get_rpe_freq(pc);
> +	xe_pm_runtime_put(dev_to_xe(dev));
>   
> -	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rpe_freq(pc));
> +	return sysfs_emit(buf, "%d\n", freq);
>   }
>   static DEVICE_ATTR_RO(rpe_freq);
>   
> @@ -107,7 +131,9 @@ static ssize_t min_freq_show(struct device *dev,
>   	u32 freq;
>   	ssize_t ret;
>   
> +	xe_pm_runtime_get(dev_to_xe(dev));
>   	ret = xe_guc_pc_get_min_freq(pc, &freq);
> +	xe_pm_runtime_put(dev_to_xe(dev));
>   	if (ret)
>   		return ret;
>   
> @@ -125,7 +151,9 @@ static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
>   	if (ret)
>   		return ret;
>   
> +	xe_pm_runtime_get(dev_to_xe(dev));
>   	ret = xe_guc_pc_set_min_freq(pc, freq);
> +	xe_pm_runtime_put(dev_to_xe(dev));
>   	if (ret)
>   		return ret;
>   
> @@ -140,7 +168,9 @@ static ssize_t max_freq_show(struct device *dev,
>   	u32 freq;
>   	ssize_t ret;
>   
> +	xe_pm_runtime_get(dev_to_xe(dev));
>   	ret = xe_guc_pc_get_max_freq(pc, &freq);
> +	xe_pm_runtime_put(dev_to_xe(dev));
>   	if (ret)
>   		return ret;
>   
> @@ -158,7 +188,9 @@ static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
>   	if (ret)
>   		return ret;
>   
> +	xe_pm_runtime_get(dev_to_xe(dev));
>   	ret = xe_guc_pc_set_max_freq(pc, freq);
> +	xe_pm_runtime_put(dev_to_xe(dev));
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 9358f7336889..824ff458011f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -12,6 +12,7 @@
>   #include "xe_guc_pc.h"
>   #include "regs/xe_gt_regs.h"
>   #include "xe_mmio.h"
> +#include "xe_pm.h"
>   
>   /**
>    * DOC: Xe GT Idle
> @@ -40,6 +41,15 @@ static struct xe_guc_pc *gtidle_to_pc(struct xe_gt_idle *gtidle)
>   	return &gtidle_to_gt(gtidle)->uc.guc.pc;
>   }
>   
> +static struct xe_device *
> +pc_to_xe(struct xe_guc_pc *pc)
> +{
> +	struct xe_guc *guc = container_of(pc, struct xe_guc, pc);
> +	struct xe_gt *gt = container_of(guc, struct xe_gt, uc.guc);
> +
> +	return gt_to_xe(gt);
> +}
> +
>   static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
>   {
>   	switch (state) {
> @@ -86,8 +96,14 @@ static ssize_t name_show(struct device *dev,
>   			 struct device_attribute *attr, char *buff)
>   {
>   	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
> +	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
> +	ssize_t ret;
> +
> +	xe_pm_runtime_get(pc_to_xe(pc));
> +	ret = sysfs_emit(buff, "%s\n", gtidle->name);
> +	xe_pm_runtime_put(pc_to_xe(pc));
>   
> -	return sysfs_emit(buff, "%s\n", gtidle->name);
> +	return ret;
>   }
>   static DEVICE_ATTR_RO(name);
>   
> @@ -98,7 +114,9 @@ static ssize_t idle_status_show(struct device *dev,
>   	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>   	enum xe_gt_idle_state state;
>   
> +	xe_pm_runtime_get(pc_to_xe(pc));
>   	state = gtidle->idle_status(pc);
> +	xe_pm_runtime_put(pc_to_xe(pc));
>   
>   	return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state));
>   }
> @@ -111,7 +129,10 @@ static ssize_t idle_residency_ms_show(struct device *dev,
>   	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>   	u64 residency;
>   
> +	xe_pm_runtime_get(pc_to_xe(pc));
>   	residency = gtidle->idle_residency(pc);
> +	xe_pm_runtime_put(pc_to_xe(pc));
> +
>   	return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, residency));
>   }
>   static DEVICE_ATTR_RO(idle_residency_ms);
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> index 63d640591a52..9c33045ff1ef 100644
> --- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> @@ -11,6 +11,7 @@
>   #include "xe_gt_sysfs.h"
>   #include "xe_gt_throttle_sysfs.h"
>   #include "xe_mmio.h"
> +#include "xe_pm.h"
>   
>   /**
>    * DOC: Xe GT Throttle
> @@ -38,10 +39,12 @@ static u32 read_perf_limit_reasons(struct xe_gt *gt)
>   {
>   	u32 reg;
>   
> +	xe_pm_runtime_get(gt_to_xe(gt));
>   	if (xe_gt_is_media_type(gt))
>   		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>   	else
>   		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
> +	xe_pm_runtime_put(gt_to_xe(gt));
>   
>   	return reg;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index 2345fb42fa39..9e23ca7f45ad 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -9,6 +9,7 @@
>   
>   #include "xe_gt.h"
>   #include "xe_hw_engine_class_sysfs.h"
> +#include "xe_pm.h"
>   
>   #define MAX_ENGINE_CLASS_NAME_LEN    16
>   static int xe_add_hw_engine_class_defaults(struct xe_device *xe,
> @@ -513,6 +514,7 @@ kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, char *name
>   		kobject_put(&keclass->base);
>   		return NULL;
>   	}
> +	keclass->xe = xe;
>   
>   	err = drmm_add_action_or_reset(&xe->drm, kobj_xe_hw_engine_class_fini,
>   				       &keclass->base);
> @@ -567,9 +569,63 @@ static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj)
>   	kfree(kobj);
>   }
>   
> +#include "xe_pm.h"
> +
> +static inline struct xe_device *pdev_to_xe_device(struct pci_dev *pdev)
> +{
> +	return pci_get_drvdata(pdev);
> +}
> +
> +static inline struct xe_device *to_xe_device(const struct drm_device *dev)
> +{
> +	return container_of(dev, struct xe_device, drm);
> +}
> +
> +static ssize_t xe_hw_engine_class_sysfs_attr_show(struct kobject *kobj,
> +						  struct attribute *attr,
> +						  char *buf)
> +{
> +	struct xe_device *xe = kobj_to_xe(kobj);
> +	struct kobj_attribute *kattr;
> +	ssize_t ret = -EIO;
> +
> +	kattr = container_of(attr, struct kobj_attribute, attr);
> +	if (kattr->show) {
> +		xe_pm_runtime_get(xe);
> +		ret = kattr->show(kobj, kattr, buf);
> +		xe_pm_runtime_put(xe);
> +	}
> +
> +	return ret;
> +}
> +
> +static ssize_t xe_hw_engine_class_sysfs_attr_store(struct kobject *kobj,
> +						   struct attribute *attr,
> +						   const char *buf,
> +						   size_t count)
> +{
> +	struct xe_device *xe = kobj_to_xe(kobj);
> +	struct kobj_attribute *kattr;
> +	ssize_t ret = -EIO;
> +
> +	kattr = container_of(attr, struct kobj_attribute, attr);
> +	if (kattr->store) {
> +		xe_pm_runtime_get(xe);
> +		ret = kattr->store(kobj, kattr, buf, count);
> +		xe_pm_runtime_put(xe);
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct sysfs_ops xe_hw_engine_class_sysfs_ops = {
> +	.show = xe_hw_engine_class_sysfs_attr_show,
> +	.store = xe_hw_engine_class_sysfs_attr_store,
> +};
> +
>   static const struct kobj_type xe_hw_engine_sysfs_kobj_type = {
>   	.release = xe_hw_engine_sysfs_kobj_release,
> -	.sysfs_ops = &kobj_sysfs_ops,
> +	.sysfs_ops = &xe_hw_engine_class_sysfs_ops,
>   };
>   
>   static void hw_engine_class_sysfs_fini(struct drm_device *drm, void *arg)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> index ec5ba673b314..28a0d7c909c0 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> @@ -26,6 +26,8 @@ struct kobj_eclass {
>   	struct kobject base;
>   	/** @eclass: A pointer to the hw engine class interface */
>   	struct xe_hw_engine_class_intf *eclass;
> +	/** @xe: A pointer to the xe device */
> +	struct xe_device *xe;
>   };
>   
>   static inline struct xe_hw_engine_class_intf *kobj_to_eclass(struct kobject *kobj)
> @@ -33,4 +35,9 @@ static inline struct xe_hw_engine_class_intf *kobj_to_eclass(struct kobject *kob
>   	return container_of(kobj, struct kobj_eclass, base)->eclass;
>   }
>   
> +static inline struct xe_device *kobj_to_xe(struct kobject *kobj)
> +{
> +	return container_of(kobj, struct kobj_eclass, base)->xe;
> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 0662968d7bcb..237a0761d3ad 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -7,6 +7,7 @@
>   #include <linux/sysfs.h>
>   #include <drm/drm_managed.h>
>   
> +#include "xe_pm.h"
>   #include "xe_tile.h"
>   #include "xe_tile_sysfs.h"
>   #include "xe_vram_freq.h"
