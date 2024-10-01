Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F15CEACD5
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 14:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7390210E646;
	Tue,  1 Oct 2024 14:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VuVfIynI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B7510E655
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 14:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727794437; x=1759330437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jx9oTbb5qXd0RnUO+hrWeqkZS7FL3mIAdIkYeZA/MN8=;
 b=VuVfIynIM0zWGnnR//L/6195/LWLGGjfxDkDpTVIi0BjgwA4tNMb63FV
 NdMQOzc5zrJGlbZIXXuVGA2iYR5uPUosjphAD0Bf71bdoIxvA64rUbowi
 eLZmr//P7BY7fAGqvmzGYX992NAuLsyR9b7AvIv7/egTT82gf8wURzH6V
 GfVdHUObRVCIGqEC/gh1GWjRHNkcBLCoXbJpE0D0PQV4570/7uoXhdxOA
 J15H0DLlIgzVy9uSjX1eIgxXMhJkxgg8hDKxwlXs/VnYYo2pQPjgxrmvj
 hS24cRVfZ7/2oTW8PSctYOAj1I4PwMyl5W8t5dWPqGTkkGEu8SFV6EhBt g==;
X-CSE-ConnectionGUID: /9GV3iReT/2ydKnwHdixnQ==
X-CSE-MsgGUID: VAXR9Y+kSu+S5G5qNIPpDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27091431"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="27091431"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:57 -0700
X-CSE-ConnectionGUID: XDHU0wJyR9aVCUuRCYyQHQ==
X-CSE-MsgGUID: v94bIXMmRs+bi8BkXcEhEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="97048783"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:55 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Christoph Manszewski <christoph.manszewski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 17/18] drm/xe/eudebug: Dynamically toggle debugger
 functionality
Date: Tue,  1 Oct 2024 17:43:05 +0300
Message-Id: <20241001144306.1991001-18-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
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

From: Christoph Manszewski <christoph.manszewski@intel.com>

Make it possible to dynamically enable/disable debugger funtionality,
including the setting and unsetting of required hw register values via a
sysfs entry located at '/sys/class/drm/card<X>/device/enable_eudebug'.

This entry uses 'kstrtobool' and as such it accepts inputs as documented
by this function, in particular '0' and '1'.

v2: use new discovery_lock to gain exclusivity (Mika)

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |   2 -
 drivers/gpu/drm/xe/xe_device_types.h |   3 +
 drivers/gpu/drm/xe/xe_eudebug.c      | 125 +++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_eudebug.h      |   2 -
 drivers/gpu/drm/xe/xe_exec_queue.c   |   5 ++
 drivers/gpu/drm/xe/xe_hw_engine.c    |   1 -
 drivers/gpu/drm/xe/xe_reg_sr.c       |  21 +++--
 drivers/gpu/drm/xe/xe_reg_sr.h       |   4 +-
 drivers/gpu/drm/xe/xe_rtp.c          |   2 +-
 9 files changed, 133 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e0d55e11ace6..0647c17a79dd 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -781,8 +781,6 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_debugfs_register(xe);
 
-	xe_eudebug_init_late(xe);
-
 	xe_hwmon_register(xe);
 
 	for_each_gt(gt, xe, id)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 40b0f61b64b8..fc448d44752e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -549,6 +549,9 @@ struct xe_device {
 		/** discovery_lock: used for discovery to block xe ioctls */
 		struct rw_semaphore discovery_lock;
 
+		/** @enable: is the debugging functionality enabled */
+		bool enable;
+
 		/** @attention_scan: attention scan worker */
 		struct delayed_work attention_scan;
 	} eudebug;
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index faa49ba55b78..6e26245556d4 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -2000,9 +2000,6 @@ xe_eudebug_connect(struct xe_device *xe,
 
 	param->version = DRM_XE_EUDEBUG_VERSION;
 
-	if (!xe->eudebug.available)
-		return -EOPNOTSUPP;
-
 	d = kzalloc(sizeof(*d), GFP_KERNEL);
 	if (!d)
 		return -ENOMEM;
@@ -2062,17 +2059,19 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
 {
 	struct xe_device *xe = to_xe_device(dev);
 	struct drm_xe_eudebug_connect * const param = data;
-	int ret = 0;
 
-	ret = xe_eudebug_connect(xe, param);
+	lockdep_assert_held(&xe->eudebug.discovery_lock);
 
-	return ret;
+	if (!xe->eudebug.enable)
+		return -ENODEV;
+
+	return xe_eudebug_connect(xe, param);
 }
 
 #undef XE_REG_MCR
 #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
 
-void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe)
+static void xe_eudebug_reinit_hw_engine(struct xe_hw_engine *hwe, bool enable)
 {
 	struct xe_gt *gt = hwe->gt;
 	struct xe_device *xe = gt_to_xe(gt);
@@ -2087,22 +2086,22 @@ void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe)
 		struct xe_reg_sr_entry sr_entry = {
 			.reg = ROW_CHICKEN,
 			.clr_bits = STALL_DOP_GATING_DISABLE,
-			.set_bits = STALL_DOP_GATING_DISABLE,
+			.set_bits = enable ? STALL_DOP_GATING_DISABLE : 0,
 			.read_mask = STALL_DOP_GATING_DISABLE,
 		};
 
-		xe_reg_sr_add(&hwe->reg_sr, &sr_entry, gt);
+		xe_reg_sr_add(&hwe->reg_sr, &sr_entry, gt, true);
 	}
 
 	if (XE_WA(gt, 14015474168)) {
 		struct xe_reg_sr_entry sr_entry = {
 			.reg = ROW_CHICKEN2,
 			.clr_bits = XEHPC_DISABLE_BTB,
-			.set_bits = XEHPC_DISABLE_BTB,
+			.set_bits = enable ? XEHPC_DISABLE_BTB : 0,
 			.read_mask = XEHPC_DISABLE_BTB,
 		};
 
-		xe_reg_sr_add(&hwe->reg_sr, &sr_entry, gt);
+		xe_reg_sr_add(&hwe->reg_sr, &sr_entry, gt, true);
 	}
 
 	if (xe->info.graphics_verx100 >= 1200) {
@@ -2112,27 +2111,112 @@ void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe)
 		struct xe_reg_sr_entry sr_entry = {
 			.reg = TD_CTL,
 			.clr_bits = mask,
-			.set_bits = mask,
+			.set_bits = enable ? mask : 0,
 			.read_mask = mask,
 		};
 
-		xe_reg_sr_add(&hwe->reg_sr, &sr_entry, gt);
+		xe_reg_sr_add(&hwe->reg_sr, &sr_entry, gt, true);
 	}
 
 	if (xe->info.graphics_verx100 >= 1250) {
 		struct xe_reg_sr_entry sr_entry = {
 			.reg = TD_CTL,
 			.clr_bits = TD_CTL_GLOBAL_DEBUG_ENABLE,
-			.set_bits = TD_CTL_GLOBAL_DEBUG_ENABLE,
+			.set_bits = enable ? TD_CTL_GLOBAL_DEBUG_ENABLE : 0,
 			.read_mask = TD_CTL_GLOBAL_DEBUG_ENABLE,
 		};
 
-		xe_reg_sr_add(&hwe->reg_sr, &sr_entry, gt);
+		xe_reg_sr_add(&hwe->reg_sr, &sr_entry, gt, true);
+	}
+}
+
+static int xe_eudebug_enable(struct xe_device *xe, bool enable)
+{
+	struct xe_gt *gt;
+	int i;
+	u8 id;
+
+	if (!xe->eudebug.available)
+		return -EOPNOTSUPP;
+
+	/*
+	 * The connect ioctl has read lock so we can
+	 * serialize with taking write
+	 */
+	down_write(&xe->eudebug.discovery_lock);
+
+	if (!enable && !list_empty(&xe->eudebug.list)) {
+		up_write(&xe->eudebug.discovery_lock);
+		return -EBUSY;
+	}
+
+	if (enable == xe->eudebug.enable) {
+		up_write(&xe->eudebug.discovery_lock);
+		return 0;
 	}
+
+	for_each_gt(gt, xe, id) {
+		for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++) {
+			if (!(gt->info.engine_mask & BIT(i)))
+				continue;
+
+			xe_eudebug_reinit_hw_engine(&gt->hw_engines[i], enable);
+		}
+
+		xe_gt_reset_async(gt);
+		flush_work(&gt->reset.worker);
+	}
+
+	xe->eudebug.enable = enable;
+	up_write(&xe->eudebug.discovery_lock);
+
+	if (enable)
+		attention_scan_flush(xe);
+	else
+		attention_scan_cancel(xe);
+
+	return 0;
+}
+
+static ssize_t enable_eudebug_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+
+	return sysfs_emit(buf, "%u\n", xe->eudebug.enable);
+}
+
+static ssize_t enable_eudebug_store(struct device *dev, struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+	bool enable;
+	int ret;
+
+	ret = kstrtobool(buf, &enable);
+	if (ret)
+		return ret;
+
+	ret = xe_eudebug_enable(xe, enable);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(enable_eudebug);
+
+static void xe_eudebug_sysfs_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+
+	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_enable_eudebug.attr);
 }
 
 void xe_eudebug_init(struct xe_device *xe)
 {
+	struct device *dev = xe->drm.dev;
+	int ret;
+
 	spin_lock_init(&xe->eudebug.lock);
 	INIT_LIST_HEAD(&xe->eudebug.list);
 	INIT_LIST_HEAD(&xe->clients.list);
@@ -2141,14 +2225,17 @@ void xe_eudebug_init(struct xe_device *xe)
 
 	xe->eudebug.ordered_wq = alloc_ordered_workqueue("xe-eudebug-ordered-wq", 0);
 	xe->eudebug.available = !!xe->eudebug.ordered_wq;
-}
 
-void xe_eudebug_init_late(struct xe_device *xe)
-{
 	if (!xe->eudebug.available)
 		return;
 
-	attention_scan_flush(xe);
+	ret = sysfs_create_file(&xe->drm.dev->kobj, &dev_attr_enable_eudebug.attr);
+	if (ret)
+		drm_warn(&xe->drm, "eudebug sysfs init failed: %d, debugger unavailable\n", ret);
+	else
+		devm_add_action_or_reset(dev, xe_eudebug_sysfs_fini, xe);
+
+	xe->eudebug.available = ret == 0;
 }
 
 void xe_eudebug_fini(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index 766d0a94d200..403f52148da3 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -26,9 +26,7 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
 			     struct drm_file *file);
 
 void xe_eudebug_init(struct xe_device *xe);
-void xe_eudebug_init_late(struct xe_device *xe);
 void xe_eudebug_fini(struct xe_device *xe);
-void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe);
 
 void xe_eudebug_file_open(struct xe_file *xef);
 void xe_eudebug_file_close(struct xe_file *xef);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index c2d6993ac103..011d8bb477d4 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -422,6 +422,11 @@ static int exec_queue_set_eudebug(struct xe_device *xe, struct xe_exec_queue *q,
 			 !(value & DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)))
 		return -EINVAL;
 
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+	if (XE_IOCTL_DBG(xe, !xe->eudebug.enable))
+		return -EPERM;
+#endif
+
 	q->eudebug_flags = EXEC_QUEUE_EUDEBUG_FLAG_ENABLE;
 	q->sched_props.preempt_timeout_us = 0;
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 8e9a08395042..28c8cabf508c 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -558,7 +558,6 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_tuning_process_engine(hwe);
 	xe_wa_process_engine(hwe);
 	hw_engine_setup_default_state(hwe);
-	xe_eudebug_init_hw_engine(hwe);
 
 	xe_reg_sr_init(&hwe->reg_whitelist, hwe->name, gt_to_xe(gt));
 	xe_reg_whitelist_process_engine(hwe);
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 191cb4121acd..023989adbe05 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -93,22 +93,31 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
 
 int xe_reg_sr_add(struct xe_reg_sr *sr,
 		  const struct xe_reg_sr_entry *e,
-		  struct xe_gt *gt)
+		  struct xe_gt *gt,
+		  bool overwrite)
 {
 	unsigned long idx = e->reg.addr;
 	struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
 	int ret;
 
 	if (pentry) {
-		if (!compatible_entries(pentry, e)) {
+		if (overwrite && e->set_bits) {
+			pentry->clr_bits |= e->clr_bits;
+			pentry->set_bits |= e->set_bits;
+			pentry->read_mask |= e->read_mask;
+		} else if (overwrite && !e->set_bits) {
+			pentry->clr_bits |= e->clr_bits;
+			pentry->set_bits &= ~e->clr_bits;
+			pentry->read_mask |= e->read_mask;
+		} else if (!compatible_entries(pentry, e)) {
 			ret = -EINVAL;
 			goto fail;
+		} else {
+			pentry->clr_bits |= e->clr_bits;
+			pentry->set_bits |= e->set_bits;
+			pentry->read_mask |= e->read_mask;
 		}
 
-		pentry->clr_bits |= e->clr_bits;
-		pentry->set_bits |= e->set_bits;
-		pentry->read_mask |= e->read_mask;
-
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
index 51fbba423e27..d67fafdcd847 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr.h
@@ -6,6 +6,8 @@
 #ifndef _XE_REG_SR_
 #define _XE_REG_SR_
 
+#include <linux/types.h>
+
 /*
  * Reg save/restore bookkeeping
  */
@@ -21,7 +23,7 @@ int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe)
 void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
 
 int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e,
-		  struct xe_gt *gt);
+		  struct xe_gt *gt, bool overwrite);
 void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt);
 void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe);
 
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index b13d4d62f0b1..6006f7c90cac 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -153,7 +153,7 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
 	};
 
 	sr_entry.reg.addr += mmio_base;
-	xe_reg_sr_add(sr, &sr_entry, gt);
+	xe_reg_sr_add(sr, &sr_entry, gt, false);
 }
 
 static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
-- 
2.34.1

