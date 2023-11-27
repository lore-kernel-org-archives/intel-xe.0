Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45738C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 09:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7BB10E217;
	Mon, 27 Nov 2023 09:48:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4262810E216
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 09:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701078522; x=1732614522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=88TfkyURXx/3sHCF5BoggJbVB9GGy9P8OarQUwUZSHg=;
 b=gxGhCicvHGCpgG1psGXmyn5ArpAcv64Gk11+YJr6IKW/x8d5hyMW5nqn
 bkl3PDoz1eYemYVmhv8zHpX68u3u3DkPj30HRRLcg4VmLnl0zdk9qRSh6
 kP4p/7a5bd1gaNUl7SDhOzQO9vdRphoKqmZ4wUqQ7UU7cIcbQVHsPCSoJ
 y0ZD2SOJdCOIrpW8wGbbsXV4GqUJz5dpldrCQdf4YzRL6fh4y7Vd5O9ES
 Cp5uL2SJAF3RpwwjrsEJ64vr5Oa8x0iMNA19qBL0xEQepSbtue8/cUwJh
 KL8h7pht9rmBQxSuDmNdigHfP0B0Gl0HVR8nmeJKdsLqxWHof0WLAZ5uc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="5919285"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="5919285"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 01:48:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="1015493265"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; d="scan'208";a="1015493265"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by fmsmga006.fm.intel.com with ESMTP; 27 Nov 2023 01:48:40 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 15:32:49 +0530
Message-Id: <20231127100249.168117-2-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231127100249.168117-1-sujaritha.sundaresan@intel.com>
References: <20231127100249.168117-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] drm/xe: Add a new sub directory for gt
 frequencies
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add a new sub directory "freq" for gt frequencies and rename
exisiting frequency sysfs attributes to align with devfreq
requirements.

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_types.h     |   4 +
 drivers/gpu/drm/xe/xe_guc_pc.c       | 125 ++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_guc_pc_types.h |   3 +
 3 files changed, 82 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index d3f2793684e2..ea1e05a46288 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -8,6 +8,7 @@
 
 #include "xe_force_wake_types.h"
 #include "xe_gt_idle_sysfs_types.h"
+#include "xe_guc_pc_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence_types.h"
 #include "xe_reg_sr_types.h"
@@ -270,6 +271,9 @@ struct xe_gt {
 	/** @gtidle: idle properties of GT */
 	struct xe_gt_idle gtidle;
 
+	/** @frq: frequencies of GT */
+	struct xe_gt_frq frq;
+
 	/** @exec_queue_ops: submission backend exec queue operations */
 	const struct xe_exec_queue_ops *exec_queue_ops;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index e9dd6c3d750b..d0b625d8b1dc 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -57,15 +57,15 @@
  * Xe's GuC PC provides a sysfs API for frequency management:
  *
  * device/gt#/freq_* *read-only* files:
- * - freq_act: The actual resolved frequency decided by PCODE.
- * - freq_cur: The current one requested by GuC PC to the Hardware.
- * - freq_rpn: The Render Performance (RP) N level, which is the minimal one.
- * - freq_rpe: The Render Performance (RP) E level, which is the efficient one.
- * - freq_rp0: The Render Performance (RP) 0 level, which is the maximum one.
+ * - act_freq: The actual resolved frequency decided by PCODE.
+ * - cur_freq: The current one requested by GuC PC to the Hardware.
+ * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
+ * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
+ * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
  *
  * device/gt#/freq_* *read-write* files:
- * - freq_min: GuC PC min request.
- * - freq_max: GuC PC max request.
+ * - min_freq: GuC PC min request.
+ * - max_freq: GuC PC max request.
  *             If max <= min, then freq_min becomes a fixed frequency request.
  *
  * Render-C States:
@@ -97,18 +97,29 @@ pc_to_gt(struct xe_guc_pc *pc)
 	return container_of(pc, struct xe_gt, uc.guc.pc);
 }
 
-static struct xe_guc_pc *
-dev_to_pc(struct device *dev)
-{
-	return &kobj_to_gt(&dev->kobj)->uc.guc.pc;
-}
-
 static struct iosys_map *
 pc_to_maps(struct xe_guc_pc *pc)
 {
 	return &pc->bo->vmap;
 }
 
+static struct xe_gt_frq *dev_to_frq(struct device *dev)
+{
+	struct kobject *kobj = &dev->kobj;
+
+	return &kobj_to_gt(kobj->parent)->frq;
+}
+
+static struct xe_gt *frq_to_gt(struct xe_gt_frq *frq)
+{
+	return container_of(frq, struct xe_gt, frq);
+}
+
+static struct xe_guc_pc *frq_to_pc(struct xe_gt_frq *frq)
+{
+	return &frq_to_gt(frq)->uc.guc.pc;
+}
+
 #define slpc_shared_data_read(pc_, field_) \
 	xe_map_rd_field(pc_to_xe(pc_), pc_to_maps(pc_), 0, \
 			struct slpc_shared_data, field_)
@@ -385,11 +396,11 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
 	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
 }
 
-static ssize_t freq_act_show(struct device *dev,
+static ssize_t act_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
-	struct kobject *kobj = &dev->kobj;
-	struct xe_gt *gt = kobj_to_gt(kobj);
+	struct xe_gt_frq *frq = dev_to_frq(dev);
+	struct xe_gt *gt = frq_to_gt(frq);
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 freq;
 	ssize_t ret;
@@ -410,13 +421,13 @@ static ssize_t freq_act_show(struct device *dev,
 	xe_device_mem_access_put(gt_to_xe(gt));
 	return ret;
 }
-static DEVICE_ATTR_RO(freq_act);
+static DEVICE_ATTR_RO(act_freq);
 
-static ssize_t freq_cur_show(struct device *dev,
+static ssize_t cur_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
-	struct kobject *kobj = &dev->kobj;
-	struct xe_gt *gt = kobj_to_gt(kobj);
+	struct xe_gt_frq *frq = dev_to_frq(dev);
+	struct xe_gt *gt = frq_to_gt(frq);
 	u32 freq;
 	ssize_t ret;
 
@@ -439,21 +450,23 @@ static ssize_t freq_cur_show(struct device *dev,
 	xe_device_mem_access_put(gt_to_xe(gt));
 	return ret;
 }
-static DEVICE_ATTR_RO(freq_cur);
+static DEVICE_ATTR_RO(cur_freq);
 
-static ssize_t freq_rp0_show(struct device *dev,
+static ssize_t rp0_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
+	struct xe_gt_frq *frq = dev_to_frq(dev);
+	struct xe_guc_pc *pc = frq_to_pc(frq);
 
 	return sysfs_emit(buf, "%d\n", pc->rp0_freq);
 }
-static DEVICE_ATTR_RO(freq_rp0);
+static DEVICE_ATTR_RO(rp0_freq);
 
-static ssize_t freq_rpe_show(struct device *dev,
+static ssize_t rpe_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
+	struct xe_gt_frq *frq = dev_to_frq(dev);
+	struct xe_guc_pc *pc = frq_to_pc(frq);
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 
@@ -462,22 +475,24 @@ static ssize_t freq_rpe_show(struct device *dev,
 	xe_device_mem_access_put(xe);
 	return sysfs_emit(buf, "%d\n", pc->rpe_freq);
 }
-static DEVICE_ATTR_RO(freq_rpe);
+static DEVICE_ATTR_RO(rpe_freq);
 
-static ssize_t freq_rpn_show(struct device *dev,
+static ssize_t rpn_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
+	struct xe_gt_frq *frq = dev_to_frq(dev);
+	struct xe_guc_pc *pc = frq_to_pc(frq);
 
 	return sysfs_emit(buf, "%d\n", pc->rpn_freq);
 }
-static DEVICE_ATTR_RO(freq_rpn);
+static DEVICE_ATTR_RO(rpn_freq);
 
-static ssize_t freq_min_show(struct device *dev,
+static ssize_t min_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
-	struct xe_gt *gt = pc_to_gt(pc);
+	struct xe_gt_frq *frq = dev_to_frq(dev);
+	struct xe_guc_pc *pc = frq_to_pc(frq);
+	struct xe_gt *gt = frq_to_gt(frq);
 	ssize_t ret;
 
 	xe_device_mem_access_get(pc_to_xe(pc));
@@ -510,10 +525,11 @@ static ssize_t freq_min_show(struct device *dev,
 	return ret;
 }
 
-static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
+static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
 			      const char *buff, size_t count)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
+	struct xe_gt_frq *frq = dev_to_frq(dev);
+	struct xe_guc_pc *pc = frq_to_pc(frq);
 	u32 freq;
 	ssize_t ret;
 
@@ -540,12 +556,13 @@ static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
 	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret ?: count;
 }
-static DEVICE_ATTR_RW(freq_min);
+static DEVICE_ATTR_RW(min_freq);
 
-static ssize_t freq_max_show(struct device *dev,
+static ssize_t max_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
+	struct xe_gt_frq *frq = dev_to_frq(dev);
+	struct xe_guc_pc *pc = frq_to_pc(frq);
 	ssize_t ret;
 
 	xe_device_mem_access_get(pc_to_xe(pc));
@@ -568,10 +585,11 @@ static ssize_t freq_max_show(struct device *dev,
 	return ret;
 }
 
-static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
+static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
 			      const char *buff, size_t count)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
+	struct xe_gt_frq *frq = dev_to_frq(dev);
+	struct xe_guc_pc *pc = frq_to_pc(frq);
 	u32 freq;
 	ssize_t ret;
 
@@ -598,7 +616,7 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
 	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret ?: count;
 }
-static DEVICE_ATTR_RW(freq_max);
+static DEVICE_ATTR_RW(max_freq);
 
 /**
  * xe_guc_pc_c_status - get the current GT C state
@@ -664,13 +682,13 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
 }
 
 static const struct attribute *pc_attrs[] = {
-	&dev_attr_freq_act.attr,
-	&dev_attr_freq_cur.attr,
-	&dev_attr_freq_rp0.attr,
-	&dev_attr_freq_rpe.attr,
-	&dev_attr_freq_rpn.attr,
-	&dev_attr_freq_min.attr,
-	&dev_attr_freq_max.attr,
+	&dev_attr_act_freq.attr,
+	&dev_attr_cur_freq.attr,
+	&dev_attr_rp0_freq.attr,
+	&dev_attr_rpe_freq.attr,
+	&dev_attr_rpn_freq.attr,
+	&dev_attr_min_freq.attr,
+	&dev_attr_max_freq.attr,
 	NULL
 };
 
@@ -950,6 +968,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_bo *bo;
+	struct kobject *kobj;
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
 	int err;
 
@@ -965,9 +984,15 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	pc->bo = bo;
 
-	err = sysfs_create_files(gt->sysfs, pc_attrs);
-	if (err)
+	kobj = kobject_create_and_add("freq", gt->sysfs);
+	if (!kobj)
+		return -ENOMEM;
+
+	err = sysfs_create_files(kobj, pc_attrs);
+	if (err) {
+		kobject_put(kobj);
 		return err;
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
index 2afd0dbc3542..a48c22687ca8 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
@@ -31,4 +31,7 @@ struct xe_guc_pc {
 	bool freq_ready;
 };
 
+struct xe_gt_frq {
+};
+
 #endif	/* _XE_GUC_PC_TYPES_H_ */
-- 
2.25.1

