Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F67C001DC
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 13:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE59010E480;
	Wed, 26 Jul 2023 13:19:15 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5EE10E47B
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 13:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690377552; x=1721913552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xm3Izh695HYLC5BZ0vA9vl7dcI7rdiGGirko24hkfCg=;
 b=O4IdCzReiCFwj2CRNnMRvFsYJPHqmhpG67hzlizGpepE9OclokNFw7iZ
 28TEZu2iMZTwNSpwRj99aKaLm6tH7PrjTPY5U50pGKagF+WcgajA9xQWH
 fQS+QK2ygExdXSquF/lf/swnK62FX8KmvbS/JZk8PW67rIeObAiJKJ89D
 CC+AVvQbmojZB+aiIRF6OiVpxdnt2xtJ03u6I6AJYXH0SkNzt97fGSuQ0
 s50KPodGH8kbG4UXH9fnnulYN/Q8u0W9IXBhKmeN3iS6zSQygnchDRXHD
 KyzR47E1WurOeAMKLsjyfdvIaTSKNYWSA9ruemF5ywqbySu8T3tXIfjgs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371624336"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="371624336"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 06:19:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="676695730"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="676695730"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 26 Jul 2023 06:19:09 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jul 2023 18:55:46 +0530
Message-Id: <20230726132550.846300-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230726132550.846300-1-tejas.upadhyay@intel.com>
References: <20230726132550.846300-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V8 2/6] drm/xe: Add sysfs for default engine
 scheduler properties
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

For each HW engine under GT we are adding defaults sysfs
entry to list all engine scheduler properties and its
default values. So that it will be easier for user to
fetch default values of these properties anytime to go
back to default.

For example,
DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/bcs/.defaults/
job_timeout_ms         preempt_timeout_us     timeslice_duration_us

where,
@job_timeout_ms: The time after which a job is removed from the scheduler.
@preempt_timeout_us: How long to wait (in microseconds) for a preemption
                     event to occur when submitting a new context.
@timeslice_duration_us: Each context is scheduled for execution for the
                        timeslice duration, before switching to the next
                        context.

V7 :
   - Push all errors to one error path at every places - Niranjana
   - Describe struct member to resolve kernel doc err - CI hooks
V6 :
   - Use engine class interface instead of hw engine
     in sysfs for better interfacing readability - Niranjana
V5 :
   - Scheduling props should apply per class engine not per hardware engine - Matt
   - Do not record value of job_timeout_ms if changed based on dma_fence - Matt
V4 :
   - Resolve merge conflicts - CI
V3 :
   - Rearrange code in its own file
   - Rebase
   - Update commit message to reflect tile addition
V2 :
   - Use sysfs_create_files in this patch - Niranjana
   - Handle prototype error for xe_add_engine_defaults - CI hooks
   - Remove unused member sysfs_hwe - Niranjana

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c             |   6 +-
 drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 116 +++++++++++++++++----
 drivers/gpu/drm/xe/xe_engine_class_sysfs.h |  20 ++++
 drivers/gpu/drm/xe/xe_gt_types.h           |   3 +
 drivers/gpu/drm/xe/xe_guc_submit.c         |   3 +-
 drivers/gpu/drm/xe/xe_hw_engine.c          |  10 ++
 drivers/gpu/drm/xe/xe_hw_engine_types.h    |  40 +++++++
 7 files changed, 176 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 0102dad16e29..9e167b113963 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -53,9 +53,9 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
 	INIT_LIST_HEAD(&e->compute.link);
 	INIT_LIST_HEAD(&e->multi_gt_link);
 
-	/* FIXME: Wire up to configurable default value */
-	e->sched_props.timeslice_us = 1 * 1000;
-	e->sched_props.preempt_timeout_us = 640 * 1000;
+	e->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
+	e->sched_props.preempt_timeout_us =
+				hwe->eclass->sched_props.preempt_timeout_us;
 
 	if (xe_engine_is_parallel(e)) {
 		e->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
index 9959b0362d71..cec8428d87a7 100644
--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
@@ -9,6 +9,8 @@
 
 #include "xe_engine_class_sysfs.h"
 
+static int xe_add_engine_class_defaults(struct kobject *parent);
+
 static void kobj_xe_engine_release(struct kobject *kobj)
 {
 	kfree(kobj);
@@ -19,22 +21,88 @@ static const struct kobj_type kobj_xe_engine_type = {
 	.sysfs_ops = &kobj_sysfs_ops
 };
 
-static struct kobject *
+static struct kobj_eclass *
 kobj_xe_engine(struct kobject *parent, char *name)
+{
+	struct kobj_eclass *keclass;
+
+	keclass = kzalloc(sizeof(*keclass), GFP_KERNEL);
+	if (!keclass)
+		return NULL;
+
+	kobject_init(&keclass->base, &kobj_xe_engine_type);
+	if (kobject_add(&keclass->base, parent, "%s", name)) {
+		kobject_put(&keclass->base);
+		return NULL;
+	}
+
+	return keclass;
+}
+
+static ssize_t job_timeout_default(struct kobject *kobj,
+				   struct kobj_attribute *attr, char *buf)
+{
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
+
+	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_ms);
+}
+
+static struct kobj_attribute job_timeout_def =
+__ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
+
+static ssize_t timeslice_default(struct kobject *kobj,
+				 struct kobj_attribute *attr, char *buf)
+{
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
+
+	return sprintf(buf, "%u\n", eclass->defaults.timeslice_us);
+}
+
+static struct kobj_attribute timeslice_duration_def =
+__ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
+
+static ssize_t preempt_timeout_default(struct kobject *kobj,
+				       struct kobj_attribute *attr,
+				       char *buf)
+{
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
+
+	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_us);
+}
+
+static struct kobj_attribute preempt_timeout_def =
+__ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
+
+static const struct attribute *defaults[] = {
+	&job_timeout_def.attr,
+	&timeslice_duration_def.attr,
+	&preempt_timeout_def.attr,
+	NULL
+};
+
+static int xe_add_engine_class_defaults(struct kobject *parent)
 {
 	struct kobject *kobj;
+	int err = 0;
 
 	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
 	if (!kobj)
-		return NULL;
+		return -ENOMEM;
 
 	kobject_init(kobj, &kobj_xe_engine_type);
-	if (kobject_add(kobj, parent, "%s", name)) {
-		kobject_put(kobj);
-		return NULL;
-	}
 
-	return kobj;
+	err = kobject_add(kobj, parent, "%s", ".defaults");
+	if (err)
+		goto err_object;
+
+	err = sysfs_create_files(kobj, defaults);
+	if (err)
+		goto err_object;
+
+	return err;
+err_object:
+	kobject_put(kobj);
+	return err;
 }
 
 static void xe_engine_sysfs_kobj_release(struct kobject *kobj)
@@ -62,14 +130,12 @@ int xe_engine_class_sysfs_init(struct xe_gt *gt)
 	kobject_init(kobj, &xe_engine_sysfs_kobj_type);
 
 	err = kobject_add(kobj, gt->sysfs, "engines");
-	if (err) {
-		kobject_put(kobj);
-		return err;
-	}
+	if (err)
+		goto err_object;
 
 	for_each_hw_engine(hwe, gt, id) {
 		char name[MAX_ENGINE_CLASS_NAME_LEN];
-		struct kobject *khwe;
+		struct kobj_eclass *keclass;
 
 		if (hwe->class == XE_ENGINE_CLASS_OTHER ||
 		    hwe->class == XE_ENGINE_CLASS_MAX)
@@ -97,15 +163,29 @@ int xe_engine_class_sysfs_init(struct xe_gt *gt)
 			strcpy(name, "ccs");
 			break;
 		default:
-			kobject_put(kobj);
-			return -EINVAL;
+			err = -EINVAL;
+			goto err_object;
 		}
 
-		khwe = kobj_xe_engine(kobj, name);
-		if (!khwe) {
-			kobject_put(kobj);
-			return -EINVAL;
+		keclass = kobj_xe_engine(kobj, name);
+		if (!keclass) {
+			err = -EINVAL;
+			goto err_object;
 		}
+
+		keclass->eclass = hwe->eclass;
+		err = xe_add_engine_class_defaults(&keclass->base);
+		if (err) {
+			drm_warn(&gt_to_xe(gt)->drm,
+				 "Warning: adding .defaults to engines failed!, err: %d\n",
+				 err);
+			goto err_object;
+		}
+
 	}
+
+	return err;
+err_object:
+	kobject_put(kobj);
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
index f195dacc1ec6..683726563059 100644
--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
@@ -10,4 +10,24 @@
 
 #define MAX_ENGINE_CLASS_NAME_LEN    16
 int xe_engine_class_sysfs_init(struct xe_gt *gt);
+
+/**
+ * struct kobj_eclass - A eclass's kobject struct that connects the kobject and the
+ * eclass.
+ *
+ * When dealing with multiple eclass, this struct helps to understand which eclass
+ * needs to be addressed on a given sysfs call.
+ */
+struct kobj_eclass {
+	/** @base: The actual kobject */
+	struct kobject base;
+	/** @eclass: A pointer to the engine class interface */
+	struct xe_engine_class_intf *eclass;
+};
+
+static inline struct xe_engine_class_intf *kobj_to_eclass(struct kobject *kobj)
+{
+	return container_of(kobj, struct kobj_eclass, base)->eclass;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 78a9fe9f0bd3..d8d9151cca62 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -286,6 +286,9 @@ struct xe_gt {
 	/** @hw_engines: hardware engines on the GT */
 	struct xe_hw_engine hw_engines[XE_NUM_HW_ENGINES];
 
+	/** @eclass: per class engine interface on the GT */
+	struct xe_engine_class_intf  eclass[XE_ENGINE_CLASS_MAX];
+
 	/** @pcode: GT's PCODE */
 	struct {
 		/** @lock: protecting GT's PCODE mailbox data */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 911d4965c27c..7978f7efd702 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1128,7 +1128,8 @@ static int guc_engine_init(struct xe_engine *e)
 	ge->engine = e;
 	init_waitqueue_head(&ge->suspend_wait);
 
-	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT : HZ * 5;
+	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT :
+		  e->hwe->eclass->sched_props.job_timeout_ms;
 	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 1af5cccd1142..96c32a815c90 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -362,6 +362,16 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	hwe->fence_irq = &gt->fence_irq[info->class];
 	hwe->engine_id = id;
 
+	if (!gt->eclass[hwe->class].init_done) {
+		gt->eclass[hwe->class].sched_props.job_timeout_ms = HZ * 5;
+		gt->eclass[hwe->class].sched_props.timeslice_us = 1 * 1000;
+		gt->eclass[hwe->class].sched_props.preempt_timeout_us = 640 * 1000;
+		/* Record default props */
+		gt->eclass[hwe->class].defaults = gt->eclass[hwe->class].sched_props;
+		gt->eclass[hwe->class].init_done = true;
+	}
+	hwe->eclass = &gt->eclass[hwe->class];
+
 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
 	xe_wa_process_engine(hwe);
 	hw_engine_setup_default_state(hwe);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 803d557cf5aa..c257c1f8cd45 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -63,6 +63,44 @@ struct xe_bo;
 struct xe_execlist_port;
 struct xe_gt;
 
+/**
+ * struct xe_engine_class_intf - per engine class struct interface
+ *
+ * Contains all the engine properties per class engine.
+ *
+ * @init_done: Mark init status for this engine class struct
+ * @sched_props: scheduling properties
+ * @defaults: default scheduling properties
+ */
+struct xe_engine_class_intf {
+	/** @init_done: Mark init status for this engine class struct */
+	bool init_done;
+	/**
+	 * @sched_props: scheduling properties
+	 * @defaults: default scheduling properties
+	 */
+	struct {
+		/** @set_job_timeout: Set job timeout in ms for engine */
+		u32 job_timeout_ms;
+		/** @job_timeout_min: Min job timeout in ms for engine */
+		u32 job_timeout_min;
+		/** @job_timeout_max: Max job timeout in ms for engine */
+		u32 job_timeout_max;
+		/** @timeslice_us: timeslice period in micro-seconds */
+		u32 timeslice_us;
+		/** @timeslice_min: min timeslice period in micro-seconds */
+		u32 timeslice_min;
+		/** @timeslice_max: max timeslice period in micro-seconds */
+		u32 timeslice_max;
+		/** @preempt_timeout_us: preemption timeout in micro-seconds */
+		u32 preempt_timeout_us;
+		/** @preempt_timeout_min: min preemption timeout in micro-seconds */
+		u32 preempt_timeout_min;
+		/** @preempt_timeout_max: max preemption timeout in micro-seconds */
+		u32 preempt_timeout_max;
+	} sched_props, defaults;
+};
+
 /**
  * struct xe_hw_engine - Hardware engine
  *
@@ -107,6 +145,8 @@ struct xe_hw_engine {
 	void (*irq_handler)(struct xe_hw_engine *hwe, u16 intr_vec);
 	/** @engine_id: id  for this hw engine */
 	enum xe_hw_engine_id engine_id;
+	/** @eclass: pointer to per engine class interface */
+	struct xe_engine_class_intf *eclass;
 };
 
 /**
-- 
2.25.1

