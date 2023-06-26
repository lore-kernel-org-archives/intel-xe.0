Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AFDEB64DD
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 10:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7E410E1D4;
	Mon, 26 Jun 2023 10:10:52 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1E910E12C
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 10:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687774246; x=1719310246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9bnPUmI6jclVTNqJzzq2G4dzxUdu+k2j821ycWnCqcw=;
 b=ntDpM5odKDMKdAKN5du/Sb5dY0QAwl/wXG01YQqYwBEhrIk+I/S7zh9P
 sNvFi12IGzMKGxouO193E9Ejnfm/aVL5tMQUPCqqdvCHz+TlwkIOOdrll
 JaFMKAgHLgQClM4xVVe8p6PZ36rGqUKrY3FXVQS1nVWGLi4jykAnWPgUE
 /IcpEqApfplX1IzfzA/faH/F/iNBp/Qv6D6w12hGRcTeBEqWWHoWQP47n
 fMITrBOiX0lK5DcsZUwZiooF23ykdL1vZ2ykBeoUFwRjlvtoUB9F8ttCa
 01OrQMnjD4nECLIr1ejd6gOO+dYxGNxe2mmebWj5IZwQ71QvLOtwcwJPD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="447614542"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="447614542"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:10:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="693434367"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="693434367"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga006.jf.intel.com with ESMTP; 26 Jun 2023 03:10:44 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 15:46:44 +0530
Message-Id: <20230626101648.3480340-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626101648.3480340-1-tejas.upadhyay@intel.com>
References: <20230626101648.3480340-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2 2/6] drm/xe: Add sysfs for default engine
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
DUT# cat /sys/class/drm/card1/device/gt0/engines/bcs/.defaults/
job_timeout_ms         preempt_timeout_us     timeslice_duration_us

where,
@job_timeout_ms: The time after which a job is removed from the scheduler.
@preempt_timeout_us: How long to wait (in microseconds) for a preemption
                     event to occur when submitting a new context.
@timeslice_duration_us: Each context is scheduled for execution for the
                        timeslice duration, before switching to the next
                        context.

V2 :
   - Use sysfs_create_files in this patch - Niranjana
   - Handle prototype error for xe_add_engine_defaults - CI hooks
   - Remove unused member sysfs_hwe - Niranjana

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c          |  4 +-
 drivers/gpu/drm/xe/xe_gt_sysfs.c        | 93 +++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sysfs.h        |  5 ++
 drivers/gpu/drm/xe/xe_gt_sysfs_types.h  | 13 ++++
 drivers/gpu/drm/xe/xe_guc_submit.c      |  5 +-
 drivers/gpu/drm/xe/xe_hw_engine.c       |  5 ++
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  9 +++
 7 files changed, 125 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 6e6b2913f766..33d1fbae560d 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -54,8 +54,8 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
 	INIT_LIST_HEAD(&e->multi_gt_link);
 
 	/* FIXME: Wire up to configurable default value */
-	e->sched_props.timeslice_us = 1 * 1000;
-	e->sched_props.preempt_timeout_us = 640 * 1000;
+	e->sched_props.timeslice_us = hwe->sched_props.timeslice_us;
+	e->sched_props.preempt_timeout_us = hwe->sched_props.preempt_timeout_us;
 
 	if (xe_engine_is_parallel(e)) {
 		e->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index 7528cc723699..43be5efc1865 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -12,6 +12,8 @@
 
 #include "xe_gt.h"
 
+int xe_add_engine_defaults(struct kobject *parent);
+
 static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
 {
 	kfree(kobj);
@@ -32,22 +34,91 @@ static struct kobj_type kobj_xe_engine_type = {
 	.sysfs_ops = &kobj_sysfs_ops
 };
 
-static struct kobject *
-kobj_xe_engine(struct kobject *parent, char *name)
+static ssize_t job_timeout_default(struct kobject *kobj,
+				   struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
+
+	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_ms);
+}
+
+static struct kobj_attribute job_timeout_def =
+__ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
+
+static ssize_t timeslice_default(struct kobject *kobj,
+				 struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
+
+	return sprintf(buf, "%u\n", hwe->defaults.timeslice_us);
+}
+
+static struct kobj_attribute timeslice_duration_def =
+__ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
+
+static ssize_t preempt_timeout_default(struct kobject *kobj,
+				       struct kobj_attribute *attr,
+				       char *buf)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
+
+	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_us);
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
+int xe_add_engine_defaults(struct kobject *parent)
 {
 	struct kobject *kobj;
+	int err = 0;
 
 	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
 	if (!kobj)
-		return NULL;
+		return -ENOMEM;
 
 	kobject_init(kobj, &kobj_xe_engine_type);
-	if (kobject_add(kobj, parent, "%s", name)) {
+
+	err = kobject_add(kobj, parent, "%s", ".defaults");
+	if (err)
+		goto err_object;
+
+	err = sysfs_create_files(kobj, defaults);
+	if (err)
+		goto err_object;
+
+	if (0) {
+err_object:
 		kobject_put(kobj);
+		return err;
+	}
+
+	return err;
+}
+
+static struct kobj_hwe *
+kobj_xe_engine(struct kobject *parent, char *name)
+{
+	struct kobj_hwe *khwe;
+
+	khwe = kzalloc(sizeof(*khwe), GFP_KERNEL);
+	if (!khwe)
+		return NULL;
+
+	kobject_init(&khwe->base, &kobj_xe_engine_type);
+	if (kobject_add(&khwe->base, parent, "%s", name)) {
+		kobject_put(&khwe->base);
 		return NULL;
 	}
 
-	return kobj;
+	return khwe;
 }
 
 int xe_gt_sysfs_engines(struct xe_gt *gt)
@@ -72,7 +143,7 @@ int xe_gt_sysfs_engines(struct xe_gt *gt)
 
 	for_each_hw_engine(hwe, gt, id) {
 		char name[MAX_ENGINE_NAME_LEN];
-		struct kobject *khwe;
+		struct kobj_hwe *khwe;
 
 		if ((hwe->class == XE_ENGINE_CLASS_OTHER) ||
 		    (hwe->class == XE_ENGINE_CLASS_MAX))
@@ -109,6 +180,16 @@ int xe_gt_sysfs_engines(struct xe_gt *gt)
 			kobject_put(kobj);
 			return -EINVAL;
 		}
+
+		khwe->hwe = hwe;
+		err = xe_add_engine_defaults(&khwe->base);
+		if (err) {
+			kobject_put(kobj);
+			drm_warn(&gt_to_xe(gt)->drm,
+				 "Warning: adding .defaults to engines failed!, err: %d\n",
+				 err);
+			return err;
+		}
 	}
 
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h b/drivers/gpu/drm/xe/xe_gt_sysfs.h
index a531aebd10d6..a539cf031c7d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
@@ -19,4 +19,9 @@ kobj_to_gt(struct kobject *kobj)
 	return container_of(kobj, struct kobj_gt, base)->gt;
 }
 
+static inline struct xe_hw_engine *kobj_to_hwe(struct kobject *kobj)
+{
+	return container_of(kobj, struct kobj_hwe, base)->hwe;
+}
+
 #endif /* _XE_GT_SYSFS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs_types.h b/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
index d3bc6b83360f..d0a5eae1bbb4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
@@ -23,4 +23,17 @@ struct kobj_gt {
 	struct xe_gt *gt;
 };
 
+/**
+ * struct kobj_hwe - A hwe's kobject struct that connects the kobject and the
+ * hwe.
+ *
+ * When dealing with multiple hwe, this struct helps to understand which hwe
+ * needs to be addressed on a given sysfs call.
+ */
+struct kobj_hwe {
+	/** @base: The actual kobject */
+	struct kobject base;
+	/** @hwe: A pointer to the hwe itself */
+	struct xe_hw_engine *hwe;
+};
 #endif	/* _XE_GT_SYSFS_TYPES_H_ */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 86c445903560..ecea38e9e639 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1128,7 +1128,8 @@ static int guc_engine_init(struct xe_engine *e)
 	ge->engine = e;
 	init_waitqueue_head(&ge->suspend_wait);
 
-	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT : HZ * 5;
+	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT :
+		  e->hwe->sched_props.job_timeout_ms;
 	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
@@ -1136,6 +1137,8 @@ static int guc_engine_init(struct xe_engine *e)
 			     gt_to_xe(e->gt)->drm.dev);
 	if (err)
 		goto err_free;
+	/* Record timeout value, in order to show current set timeout */
+	e->hwe->sched_props.job_timeout_ms = timeout;
 
 	sched = &ge->sched;
 	err = drm_sched_entity_init(&ge->entity, DRM_SCHED_PRIORITY_NORMAL,
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b7b02c96e998..bd94155a28b3 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -361,6 +361,11 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	hwe->name = info->name;
 	hwe->fence_irq = &gt->fence_irq[info->class];
 	hwe->engine_id = id;
+	/* FIXME: Wire up to configurable default value */
+	hwe->sched_props.job_timeout_ms = HZ * 5;
+	hwe->sched_props.timeslice_us = 1 * 1000;
+	hwe->sched_props.preempt_timeout_us = 640 * 1000;
+	hwe->defaults = hwe->sched_props; /* Record default props */
 
 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
 	xe_wa_process_engine(hwe);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index d788e67312b9..7a8d275df6db 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -107,6 +107,15 @@ struct xe_hw_engine {
 	void (*irq_handler)(struct xe_hw_engine *, u16);
 	/** @engine_id: id  for this hw engine */
 	enum xe_hw_engine_id engine_id;
+	/** @sched_props: scheduling properties */
+	struct {
+		/** @set_job_timeout: Set job timeout in ms for engine */
+		u32 job_timeout_ms;
+		/** @timeslice_us: timeslice period in micro-seconds */
+		u32 timeslice_us;
+		/** @preempt_timeout_us: preemption timeout in micro-seconds */
+		u32 preempt_timeout_us;
+	} sched_props, defaults;
 };
 
 /**
-- 
2.25.1

