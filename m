Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C12EC47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 05:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4690F10E2A1;
	Fri, 22 Mar 2024 05:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lbdo7qvL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A557910E2A1
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 05:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711086522; x=1742622522;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=92aYwr0YgEN6sWsVnzLHn7Tu/SH8kLppLzhRZ3pL4Dw=;
 b=Lbdo7qvL3Y1C30Rc3Ar3IJbILOYVopgabpxUxXGpwM5J+DYX7rDSTESr
 wxKl7m8krqIQsU0CjmFBJ2c4oSKL06XmruYBOJmn2E4EZmomVU5DNlvq+
 dsVQP9LhgufXsvhIV+YIgv0x2nTwRkpcArSgcT9S9vh55kBicrO7w9vDm
 LX6RA5T3f96R5c7rdvw4PGWYUcNNSu+AG0RNKgyaMxC9vK1/M9bhKhPKO
 OyqmtziJBPuPLgtMoTOzsc8YkGAhXDRsqx+fBPO/Du9L2iRsFtKQWz+0q
 sBKHljU0Fi0u+vtuUBirh0Wjsg8HDmV6w8nRAEcCjuKW7VtaOuaFSAvjJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6054563"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="6054563"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 22:48:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="19431401"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by fmviesa004.fm.intel.com with ESMTP; 21 Mar 2024 22:48:39 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2] drm/xe : avoid the risky function sprintf
Date: Thu,  7 Dec 2023 03:19:03 +0530
Message-Id: <20231206214903.46065-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

These errors were highlighted by Static analyzer. Used snprintf instead of sprint.

Static analyzer Reported "Calling risky function (DC.STRING_BUFFER)”

v2: Removed hard coded values abd used sizeof()

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c               |  2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            | 12 +++----
 drivers/gpu/drm/xe/xe_gt_debugfs.c            |  2 +-
 drivers/gpu/drm/xe/xe_gt_idle.c               |  4 +--
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 36 +++++++++----------
 drivers/gpu/drm/xe/xe_hw_fence.c              |  2 +-
 6 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 8abdf3c17e1d..70532d67eb99 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -129,7 +129,7 @@ void xe_debugfs_register(struct xe_device *xe)
 		if (man) {
 			char name[16];
 
-			sprintf(name, "vram%d_mm", mem_type - XE_PL_VRAM0);
+			snprintf(name, 16, "vram%d_mm", mem_type - XE_PL_VRAM0);
 			ttm_resource_manager_create_debugfs(man, root, name);
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 730eb7d2a639..14d6c1d6e434 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -225,22 +225,22 @@ void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance)
 {
 	switch (q->class) {
 	case XE_ENGINE_CLASS_RENDER:
-		sprintf(q->name, "rcs%d", instance);
+		snprintf(q->name, MAX_FENCE_NAME_LEN, "rcs%d", instance);
 		break;
 	case XE_ENGINE_CLASS_VIDEO_DECODE:
-		sprintf(q->name, "vcs%d", instance);
+		snprintf(q->name, MAX_FENCE_NAME_LEN, "vcs%d", instance);
 		break;
 	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
-		sprintf(q->name, "vecs%d", instance);
+		snprintf(q->name, MAX_FENCE_NAME_LEN, "vecs%d", instance);
 		break;
 	case XE_ENGINE_CLASS_COPY:
-		sprintf(q->name, "bcs%d", instance);
+		snprintf(q->name, MAX_FENCE_NAME_LEN, "bcs%d", instance);
 		break;
 	case XE_ENGINE_CLASS_COMPUTE:
-		sprintf(q->name, "ccs%d", instance);
+		snprintf(q->name, MAX_FENCE_NAME_LEN, "ccs%d", instance);
 		break;
 	case XE_ENGINE_CLASS_OTHER:
-		sprintf(q->name, "gsccs%d", instance);
+		snprintf(q->name, MAX_FENCE_NAME_LEN, "gsccs%d", instance);
 		break;
 	default:
 		XE_WARN_ON(q->class);
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 6b4dc2927727..3af85b2f6625 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -261,7 +261,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 
 	xe_gt_assert(gt, minor->debugfs_root);
 
-	sprintf(name, "gt%d", gt->info.id);
+	snprintf(name, sizeof(name), "gt%d", gt->info.id);
 	root = debugfs_create_dir(name, minor->debugfs_root);
 	if (IS_ERR(root)) {
 		drm_warn(&xe->drm, "Create GT directory failed");
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 2984680de3f9..bc1426f8d731 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -166,10 +166,10 @@ void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
 	}
 
 	if (xe_gt_is_media_type(gt)) {
-		sprintf(gtidle->name, "gt%d-mc", gt->info.id);
+		snprintf(gtidle->name, sizeof(gtidle->name), "gt%d-mc", gt->info.id);
 		gtidle->idle_residency = xe_guc_pc_mc6_residency;
 	} else {
-		sprintf(gtidle->name, "gt%d-rc", gt->info.id);
+		snprintf(gtidle->name, sizeof(gtidle->name), "gt%d-rc", gt->info.id);
 		gtidle->idle_residency = xe_guc_pc_rc6_residency;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index c17cce53f19d..f85a40d87829 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -71,7 +71,7 @@ static ssize_t job_timeout_max_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_max);
+	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->sched_props.job_timeout_max);
 }
 
 static const struct kobj_attribute job_timeout_max_attr =
@@ -107,7 +107,7 @@ static ssize_t job_timeout_min_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_min);
+	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->sched_props.job_timeout_min);
 }
 
 static const struct kobj_attribute job_timeout_min_attr =
@@ -140,7 +140,7 @@ static ssize_t job_timeout_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_ms);
+	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->sched_props.job_timeout_ms);
 }
 
 static const struct kobj_attribute job_timeout_attr =
@@ -151,7 +151,7 @@ static ssize_t job_timeout_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_ms);
+	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->defaults.job_timeout_ms);
 }
 
 static const struct kobj_attribute job_timeout_def =
@@ -162,7 +162,7 @@ static ssize_t job_timeout_min_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_min);
+	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->defaults.job_timeout_min);
 }
 
 static const struct kobj_attribute job_timeout_min_def =
@@ -173,7 +173,7 @@ static ssize_t job_timeout_max_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_max);
+	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->defaults.job_timeout_max);
 }
 
 static const struct kobj_attribute job_timeout_max_def =
@@ -232,7 +232,7 @@ static ssize_t timeslice_duration_max_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_max);
+	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->sched_props.timeslice_max);
 }
 
 static const struct kobj_attribute timeslice_duration_max_attr =
@@ -270,7 +270,7 @@ static ssize_t timeslice_duration_min_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_min);
+	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->sched_props.timeslice_min);
 }
 
 static const struct kobj_attribute timeslice_duration_min_attr =
@@ -282,7 +282,7 @@ static ssize_t timeslice_duration_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_us);
+	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->sched_props.timeslice_us);
 }
 
 static const struct kobj_attribute timeslice_duration_attr =
@@ -294,7 +294,7 @@ static ssize_t timeslice_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.timeslice_us);
+	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->defaults.timeslice_us);
 }
 
 static const struct kobj_attribute timeslice_duration_def =
@@ -305,7 +305,7 @@ static ssize_t timeslice_min_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min);
+	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->defaults.timeslice_min);
 }
 
 static const struct kobj_attribute timeslice_duration_min_def =
@@ -316,7 +316,7 @@ static ssize_t timeslice_max_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max);
+	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->defaults.timeslice_max);
 }
 
 static const struct kobj_attribute timeslice_duration_max_def =
@@ -349,7 +349,7 @@ static ssize_t preempt_timeout_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_us);
+	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->sched_props.preempt_timeout_us);
 }
 
 static const struct kobj_attribute preempt_timeout_attr =
@@ -361,7 +361,7 @@ static ssize_t preempt_timeout_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_us);
+	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->defaults.preempt_timeout_us);
 }
 
 static const struct kobj_attribute preempt_timeout_def =
@@ -373,7 +373,7 @@ static ssize_t preempt_timeout_min_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_min);
+	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->defaults.preempt_timeout_min);
 }
 
 static const struct kobj_attribute preempt_timeout_min_def =
@@ -385,7 +385,7 @@ static ssize_t preempt_timeout_max_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_max);
+	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->defaults.preempt_timeout_max);
 }
 
 static const struct kobj_attribute preempt_timeout_max_def =
@@ -421,7 +421,7 @@ static ssize_t preempt_timeout_max_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_max);
+	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->sched_props.preempt_timeout_max);
 }
 
 static const struct kobj_attribute preempt_timeout_max_attr =
@@ -458,7 +458,7 @@ static ssize_t preempt_timeout_min_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_min);
+	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->sched_props.preempt_timeout_min);
 }
 
 static const struct kobj_attribute preempt_timeout_min_attr =
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index a5de3e7b0bd6..91245002d965 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -130,7 +130,7 @@ void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
 	ctx->irq = irq;
 	ctx->dma_fence_ctx = dma_fence_context_alloc(1);
 	ctx->next_seqno = XE_FENCE_INITIAL_SEQNO;
-	sprintf(ctx->name, "%s", name);
+	snprintf(ctx->name, MAX_FENCE_NAME_LEN, "%s", name);
 }
 
 void xe_hw_fence_ctx_finish(struct xe_hw_fence_ctx *ctx)
-- 
2.25.1

