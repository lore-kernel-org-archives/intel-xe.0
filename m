Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38360C7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 21:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A6310E620;
	Fri, 19 May 2023 21:26:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CFE10E620
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 21:26:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70C9760CA4;
 Fri, 19 May 2023 21:26:39 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 6207AC433EF;
 Fri, 19 May 2023 21:26:36 +0000 (UTC)
Date: Fri, 19 May 2023 17:26:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <ZGfphz6PAEfT9J31@rdvivi-mobl4>
References: <20230512052050.1308879-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230512052050.1308879-1-riana.tauro@intel.com>
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe: add a new sysfs directory for
 gtidle properties
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
Cc: anshuman.gupta@intel.com, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 10:50:50AM +0530, Riana Tauro wrote:
> Add a new sysfs directory under devices/gt#/ called gtidle
> to contain idle properties of GT such as name, idle_status,
> idle_residency_ms
> 
> v2: abstract using function pointers (Anshuman)
>     use device_attr (Badal)
>     move rc functions to guc_pc
>     change name to gt_idle (Rodrigo)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile           |   1 +
>  drivers/gpu/drm/xe/xe_gt.c            |   5 +
>  drivers/gpu/drm/xe/xe_gt_idle.c       | 134 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_idle.h       |  18 ++++
>  drivers/gpu/drm/xe/xe_gt_idle_types.h |  39 ++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h      |   4 +
>  drivers/gpu/drm/xe/xe_guc_pc.c        |  87 +++++++++++------
>  drivers/gpu/drm/xe/xe_guc_pc.h        |   5 +
>  8 files changed, 261 insertions(+), 32 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_idle.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_idle.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 84ad0e949044..93bec17ee0de 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -44,6 +44,7 @@ xe-y += xe_bb.o \
>  	xe_gt.o \
>  	xe_gt_clock.o \
>  	xe_gt_debugfs.o \
> +	xe_gt_idle.o \
>  	xe_gt_mcr.o \
>  	xe_gt_pagefault.o \
>  	xe_gt_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 0d4664e344da..9e1f7343f256 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -18,6 +18,7 @@
>  #include "xe_force_wake.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt_clock.h"
> +#include "xe_gt_idle.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_pagefault.h"
>  #include "xe_gt_sysfs.h"
> @@ -381,6 +382,10 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> +	err = xe_gt_idle_init(&gt->gtidle);
> +	if (err)
> +		goto err_force_wake;
> +
>  	/* XXX: Fake that we pull the engine mask from hwconfig blob */
>  	gt->info.engine_mask = gt->info.__engine_mask;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> new file mode 100644
> index 000000000000..0060d8584485
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -0,0 +1,134 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +#include "regs/xe_gt_regs.h"
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_idle.h"
> +#include "xe_guc_pc.h"
> +#include "xe_mmio.h"
> +
> +/**
> + * GT Idle:
> + * ================

Please use the right DOC: annotation.
Probably with something like DOC: Xe GT Idle

> + *
> + * Provides sysfs entries for idle states of GT
> + *
> + * device/gt#/gtidle/name - name of the state
> + * device/gt#/gtidle/idle_residency_ms - Provides residency of the idle state in ms
> + * device/gt#/gtidle/idle_status - Provides current idle state
> + */
> +
> +static struct xe_gt_idle *kobj_to_gtidle(struct kobject *kobj)
> +{
> +	return container_of(kobj, struct gtidle_kobj, base)->gtidle;
> +}
> +
> +static ssize_t name_show(struct device *dev,
> +			 struct device_attribute *attr, char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj);
> +	ssize_t ret;
> +
> +	ret = sysfs_emit(buff, gtidle->name);
> +
> +	return ret;
> +}
> +static DEVICE_ATTR_RO(name);
> +
> +static ssize_t idle_status_show(struct device *dev,
> +				struct device_attribute *attr, char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj);
> +	ssize_t ret;
> +
> +	gtidle->idle_status(gtidle);
> +	ret = sysfs_emit(buff, gtidle->state);
> +
> +	return ret;
> +}
> +static DEVICE_ATTR_RO(idle_status);
> +
> +static ssize_t idle_residency_ms_show(struct device *dev,
> +				      struct device_attribute *attr, char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj);
> +	ssize_t ret;
> +
> +	ret = sysfs_emit(buff, "%llu\n", gtidle->residency_ms(gtidle));
> +
> +	return ret;
> +}
> +static DEVICE_ATTR_RO(idle_residency_ms);
> +
> +static const struct attribute *gt_idle_attrs[] = {
> +	&dev_attr_name.attr,
> +	&dev_attr_idle_status.attr,
> +	&dev_attr_idle_residency_ms.attr,
> +	NULL,
> +};
> +
> +static void gt_idle_kobj_release(struct kobject *kobj)
> +{
> +	kfree(kobj);
> +}
> +
> +static struct kobj_type gt_idle_kobj_type = {
> +	.release = gt_idle_kobj_release,
> +	.sysfs_ops = &kobj_sysfs_ops,
> +};
> +
> +static void gt_idle_fini(struct drm_device *drm, void *arg)
> +{
> +	struct gtidle_kobj *gtidle_kobj = arg;
> +
> +	sysfs_remove_files(&gtidle_kobj->base, gt_idle_attrs);
> +	kobject_put(&gtidle_kobj->base);
> +}
> +
> +int xe_gt_idle_init(struct xe_gt_idle *gtidle)
> +{
> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct gtidle_kobj *gtidle_kobj;
> +	int err;
> +
> +	gtidle_kobj = kzalloc(sizeof(*gtidle_kobj), GFP_KERNEL);
> +
> +	if (!gtidle_kobj)
> +		return -ENOMEM;
> +
> +	err = kobject_init_and_add(&gtidle_kobj->base, &gt_idle_kobj_type, gt->sysfs, "gtidle");
> +	if (err)
> +		goto exit_kobj;
> +
> +	gtidle_kobj->gtidle = gtidle;
> +
> +	gtidle->residency_ms = xe_rc6_residency_ms;
> +	gtidle->idle_status = xe_rc_status;
> +	sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
> +
> +	err = sysfs_create_files(&gtidle_kobj->base, gt_idle_attrs);
> +	if (err)
> +		goto exit_kobj;
> +
> +	err = drmm_add_action_or_reset(&xe->drm, gt_idle_fini, gtidle_kobj);
> +	if (err)
> +		goto exit;
> +
> +	return 0;
> +
> +exit:
> +	sysfs_remove_files(&gtidle_kobj->base, gt_idle_attrs);
> +
> +exit_kobj:
> +	kobject_put(&gtidle_kobj->base);
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> new file mode 100644
> index 000000000000..ac0ab970a3f7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_IDLE_H_
> +#define _XE_GT_IDLE_H_
> +
> +#include "xe_gt.h"
> +#include "xe_gt_idle_types.h"
> +
> +int xe_gt_idle_init(struct xe_gt_idle *gtidle);
> +
> +static inline struct xe_gt *gtidle_to_gt(struct xe_gt_idle *gtidle)
> +{
> +	return container_of(gtidle, struct xe_gt, gtidle);
> +}
> +#endif /* _XE_GT_IDLE_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h b/drivers/gpu/drm/xe/xe_gt_idle_types.h
> new file mode 100644
> index 000000000000..bc9c59249b6c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_IDLE_TYPES_H_
> +#define _XE_GT_IDLE_TYPES_H_
> +
> +#include <linux/kobject.h>
> +#include <linux/types.h>
> +
> +/**
> + * struct xe_gt_idle - A struct that contains idle properties based on gt
> + */
> +struct xe_gt_idle {
> +	/** @name: name */
> +	char name[16];
> +	/** @state: current idle state */
> +	const char *state;
> +	/** @cur_residency: raw driver copy of idle residency */
> +	u64 cur_residency;
> +	/** @prev_residency: previous residency counter */
> +	u64 prev_residency;
> +	/** @idle_status: get the current idle state */
> +	void (*idle_status)(struct xe_gt_idle *gtidle);
> +	/** @residency_ms: get idle residency in ms */
> +	u64 (*residency_ms)(struct xe_gt_idle *gtidle);
> +};
> +
> +/**
> + * struct gtidle_kobj - A kobject struct that connects the kobject and xe_gt_idle
> + */
> +struct gtidle_kobj {
> +	/** @base: The actual kobject */
> +	struct kobject base;
> +	/** @gtidle: A pointer to the struct xe_gt_idle */
> +	struct xe_gt_idle *gtidle;
> +};
> +#endif /* _XE_GT_IDLE_TYPES_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 7c47d67aa8be..90b2d34efe5b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_GT_TYPES_H_
>  
>  #include "xe_force_wake_types.h"
> +#include "xe_gt_idle_types.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_hw_fence_types.h"
>  #include "xe_reg_sr_types.h"
> @@ -287,6 +288,9 @@ struct xe_gt {
>  	/** @uc: micro controllers on the GT */
>  	struct xe_uc uc;
>  
> +	/** @gtidle: idle properties of GT */
> +	struct xe_gt_idle gtidle;
> +
>  	/** @engine_ops: submission backend engine operations */
>  	const struct xe_engine_ops *engine_ops;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 72d460d5323b..e83283cbcb00 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -14,6 +14,7 @@
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_gt_idle.h"
>  #include "xe_gt_sysfs.h"
>  #include "xe_gt_types.h"
>  #include "xe_guc_ct.h"
> @@ -40,6 +41,9 @@
>  #define GT_FREQUENCY_MULTIPLIER	50
>  #define GEN9_FREQ_SCALER	3
>  
> +/* Multiplier for  RC6 Residency counter in units of 1.28us */
> +#define XE_RC6_MULTIPLIER	1280
> +
>  /**
>   * DOC: GuC Power Conservation (PC)
>   *
> @@ -76,12 +80,7 @@
>   *
>   * Render-C states is also a GuC PC feature that is now enabled in Xe for
>   * all platforms.
> - * Xe's GuC PC provides a sysfs API for Render-C States:
>   *
> - * device/gt#/rc* *read-only* files:
> - * - rc_status: Provide the actual immediate status of Render-C: (rc0 or rc6)
> - * - rc6_residency: Provide the rc6_residency counter in units of 1.28 uSec.
> - *                  Prone to overflows.
>   */
>  
>  static struct xe_guc *
> @@ -580,11 +579,41 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
>  }
>  static DEVICE_ATTR_RW(freq_max);
>  
> -static ssize_t rc_status_show(struct device *dev,
> -			      struct device_attribute *attr, char *buff)
> +u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency,
> +		     u32 residency_multiplier)
>  {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
> -	struct xe_gt *gt = pc_to_gt(pc);
> +	u64 delta, overflow_residency, prev_residency;
> +
> +	overflow_residency = BIT_ULL(32);
> +	/*
> +	 * Counter wrap handling
> +	 * Store previous hw counter values for counter wrap-around handling
> +	 * Relying on sufficient frequency of queries otherwise counters can still wrap.
> +	 */
> +	prev_residency = gtidle->prev_residency;
> +	gtidle->prev_residency = cur_residency;
> +
> +	/* delta */
> +	if (cur_residency >= prev_residency)
> +		delta = cur_residency - prev_residency;
> +	else
> +		delta = cur_residency + (overflow_residency - prev_residency);
> +
> +	/* Add delta to extended raw driver copy of idle residency */
> +	cur_residency = gtidle->cur_residency + delta;
> +	gtidle->cur_residency = cur_residency;
> +
> +	/* residency multiplier in ns, convert to ms */
> +	return mul_u64_u32_div(cur_residency, residency_multiplier, 1e6);
> +}
> +
> +/**
> + * xe_rc_status - get the current Render C state
> + * @gtidle - xe_gt_idle instance
> + */
> +void xe_rc_status(struct xe_gt_idle *gtidle)
> +{
> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>  	u32 reg;
>  
>  	xe_device_mem_access_get(gt_to_xe(gt));
> @@ -593,37 +622,33 @@ static ssize_t rc_status_show(struct device *dev,
>  
>  	switch (REG_FIELD_GET(RCN_MASK, reg)) {
>  	case GT_RC6:
> -		return sysfs_emit(buff, "rc6\n");
> +		gtidle->state = "rc6\n";
> +		return;
>  	case GT_RC0:
> -		return sysfs_emit(buff, "rc0\n");
> +		gtidle->state = "rc0\n";
> +		return;
>  	default:
> -		return -ENOENT;
> +		gtidle->state = "unknown\n";
>  	}
>  }
> -static DEVICE_ATTR_RO(rc_status);
>  
> -static ssize_t rc6_residency_show(struct device *dev,
> -				  struct device_attribute *attr, char *buff)
> +/**
> + * xe_rc6_residency_ms - rc6 residency in ms
> + * @gtidle - xe_gt_idle instance
> + */
> +u64 xe_rc6_residency_ms(struct xe_gt_idle *gtidle)
>  {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
> -	struct xe_gt *gt = pc_to_gt(pc);
> -	u32 reg;
> -	ssize_t ret;
> -
> -	xe_device_mem_access_get(pc_to_xe(pc));
> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (ret)
> -		goto out;
> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
> +	u64 reg, rc6_residency;
>  
> +	xe_device_mem_access_get(gt_to_xe(gt));
>  	reg = xe_mmio_read32(gt, GT_GFX_RC6.reg);
> -	ret = sysfs_emit(buff, "%u\n", reg);
>  
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> -out:
> -	xe_device_mem_access_put(pc_to_xe(pc));
> -	return ret;
> +	rc6_residency = get_residency_ms(gtidle, reg, XE_RC6_MULTIPLIER);
> +
> +	xe_device_mem_access_put(gt_to_xe(gt));
> +	return rc6_residency;
>  }
> -static DEVICE_ATTR_RO(rc6_residency);
>  
>  static const struct attribute *pc_attrs[] = {
>  	&dev_attr_freq_act.attr,
> @@ -633,8 +658,6 @@ static const struct attribute *pc_attrs[] = {
>  	&dev_attr_freq_rpn.attr,
>  	&dev_attr_freq_min.attr,
>  	&dev_attr_freq_max.attr,
> -	&dev_attr_rc_status.attr,
> -	&dev_attr_rc6_residency.attr,
>  	NULL
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index da29e4934868..a6abac189c8a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -8,8 +8,13 @@
>  
>  #include "xe_guc_pc_types.h"
>  
> +struct xe_gt_idle;
> +
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
>  int xe_guc_pc_start(struct xe_guc_pc *pc);
>  int xe_guc_pc_stop(struct xe_guc_pc *pc);
>  
> +void xe_rc_status(struct xe_gt_idle *gtidle);
> +u64 xe_rc6_residency_ms(struct xe_gt_idle *gtidle);
> +
>  #endif /* _XE_GUC_PC_H_ */
> -- 
> 2.40.0
> 

It looks we will still have some interaction(s) to get this ready,
but I like the idea. Looks clean to me.

Also this doesn't conflict with the Matt series for the tile vs gt
split, as I was afraid.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
