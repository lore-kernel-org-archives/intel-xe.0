Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD661C04FDF
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 13:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9836D10E2A6;
	Mon, 31 Jul 2023 13:06:55 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816C810E2A6
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Jul 2023 13:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690808814; x=1722344814;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D8JjJAGZEgsA0smsaOnHqLC9fyhQLJ7jpEOjVGdLvEM=;
 b=NsW7JBGYU83UBdC9Eo64f6irM+m3h0aK7KEwchMwKLXi58DO35LR3eLv
 mrvHWXULPi/G+DB8v+MVYo1r2d+osm7Sz5mBeKbxb6RjihZ0XHLjgFYj/
 8WfdOTRe+/H4RewhqxMskbwwdocRE3k77XNsAYaIvhWlIhILQ1MU6eQtH
 E6SWncs7OXk718IVfUwY9ydCdURmb8zP4IKd3BPkUy8YN29+DFIDkOtX8
 f2cBFvlVZmE6YuYn/JXzJngrzNnEcYtwbhZyl6iJugdUUv6YOUU8GnxIW
 jLhAMm5ccP23dTf1yeumqDfD85Nj+hWekAgEydPUWZGbw4KGhU72UBrWX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="399960968"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="399960968"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 06:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763379483"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="763379483"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga001.jf.intel.com with ESMTP; 31 Jul 2023 06:06:50 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 31 Jul 2023 18:43:33 +0530
Message-Id: <20230731131337.1100068-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230731131337.1100068-1-tejas.upadhyay@intel.com>
References: <20230731131337.1100068-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V10 2/6] drm/xe: Add sysfs for default engine
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

V9 :
   - Remove jiffies for job_timeout_ms - Matt
V8 :
   - replace xe_engine with xe_hw_engine - Matt
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

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c                |   6 +-
 drivers/gpu/drm/xe/xe_gt_types.h              |   3 +
 drivers/gpu/drm/xe/xe_guc_submit.c            |   3 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |   9 ++
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 118 +++++++++++++++---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |  19 +++
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |  37 ++++++
 7 files changed, 172 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index c30810a687b1..f4eb67915bfc 100644
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
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 78a9fe9f0bd3..d70460feeb96 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -286,6 +286,9 @@ struct xe_gt {
 	/** @hw_engines: hardware engines on the GT */
 	struct xe_hw_engine hw_engines[XE_NUM_HW_ENGINES];
 
+	/** @eclass: per hardware engine class interface on the GT */
+	struct xe_hw_engine_class_intf  eclass[XE_ENGINE_CLASS_MAX];
+
 	/** @pcode: GT's PCODE */
 	struct {
 		/** @lock: protecting GT's PCODE mailbox data */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8d2b50e03ed2..ce0466a06e51 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1129,7 +1129,8 @@ static int guc_engine_init(struct xe_engine *e)
 	ge->engine = e;
 	init_waitqueue_head(&ge->suspend_wait);
 
-	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT : HZ * 5;
+	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT :
+		  e->hwe->eclass->sched_props.job_timeout_ms;
 	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index ead5aa285619..b7be7b0acb35 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -362,6 +362,15 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	hwe->fence_irq = &gt->fence_irq[info->class];
 	hwe->engine_id = id;
 
+	if (!gt->eclass[hwe->class].sched_props.job_timeout_ms) {
+		gt->eclass[hwe->class].sched_props.job_timeout_ms = 5 * 1000;
+		gt->eclass[hwe->class].sched_props.timeslice_us = 1 * 1000;
+		gt->eclass[hwe->class].sched_props.preempt_timeout_us = 640 * 1000;
+		/* Record default props */
+		gt->eclass[hwe->class].defaults = gt->eclass[hwe->class].sched_props;
+	}
+	hwe->eclass = &gt->eclass[hwe->class];
+
 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
 	xe_wa_process_engine(hwe);
 	hw_engine_setup_default_state(hwe);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index ad57faf69f9a..90be3bda4146 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -10,6 +10,8 @@
 #include "xe_hw_engine_class_sysfs.h"
 
 #define MAX_ENGINE_CLASS_NAME_LEN    16
+static int xe_add_hw_engine_class_defaults(struct kobject *parent);
+
 static void kobj_xe_hw_engine_release(struct kobject *kobj)
 {
 	kfree(kobj);
@@ -20,22 +22,88 @@ static const struct kobj_type kobj_xe_hw_engine_type = {
 	.sysfs_ops = &kobj_sysfs_ops
 };
 
-static struct kobject *
-kobj_xe_hw_engine(struct kobject *parent, char *name)
+static struct kobj_eclass *
+kobj_xe_hw_engine_class(struct kobject *parent, char *name)
+{
+	struct kobj_eclass *keclass;
+
+	keclass = kzalloc(sizeof(*keclass), GFP_KERNEL);
+	if (!keclass)
+		return NULL;
+
+	kobject_init(&keclass->base, &kobj_xe_hw_engine_type);
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
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
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
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
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
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
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
+static int xe_add_hw_engine_class_defaults(struct kobject *parent)
 {
 	struct kobject *kobj;
+	int err = 0;
 
 	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
 	if (!kobj)
-		return NULL;
+		return -ENOMEM;
 
 	kobject_init(kobj, &kobj_xe_hw_engine_type);
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
 
 static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj)
@@ -72,14 +140,12 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
 	kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
 
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
@@ -107,15 +173,29 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
 			strcpy(name, "ccs");
 			break;
 		default:
-			kobject_put(kobj);
-			return -EINVAL;
+			err = -EINVAL;
+			goto err_object;
 		}
 
-		khwe = kobj_xe_hw_engine(kobj, name);
-		if (!khwe) {
-			kobject_put(kobj);
-			return -EINVAL;
+		keclass = kobj_xe_hw_engine_class(kobj, name);
+		if (!keclass) {
+			err = -EINVAL;
+			goto err_object;
 		}
+
+		keclass->eclass = hwe->eclass;
+		err = xe_add_hw_engine_class_defaults(&keclass->base);
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
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
index b96125443db9..c6199c75c234 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
@@ -10,4 +10,23 @@
 
 int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
 
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
+	/** @eclass: A pointer to the hw engine class interface */
+	struct xe_hw_engine_class_intf *eclass;
+};
+
+static inline struct xe_hw_engine_class_intf *kobj_to_eclass(struct kobject *kobj)
+{
+	return container_of(kobj, struct kobj_eclass, base)->eclass;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 803d557cf5aa..97d9ba31b5fc 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -63,6 +63,41 @@ struct xe_bo;
 struct xe_execlist_port;
 struct xe_gt;
 
+/**
+ * struct xe_hw_engine_class_intf - per hw engine class struct interface
+ *
+ * Contains all the hw engine properties per engine class.
+ *
+ * @sched_props: scheduling properties
+ * @defaults: default scheduling properties
+ */
+struct xe_hw_engine_class_intf {
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
@@ -107,6 +142,8 @@ struct xe_hw_engine {
 	void (*irq_handler)(struct xe_hw_engine *hwe, u16 intr_vec);
 	/** @engine_id: id  for this hw engine */
 	enum xe_hw_engine_id engine_id;
+	/** @eclass: pointer to per hw engine class interface */
+	struct xe_hw_engine_class_intf *eclass;
 };
 
 /**
-- 
2.25.1

