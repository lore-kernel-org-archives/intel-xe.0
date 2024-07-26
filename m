Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836CCC3DA7E
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 14:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B24810E9B1;
	Fri, 26 Jul 2024 14:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDZIq+qj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B7E10E9AC
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 14:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722003466; x=1753539466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oSJPR8WdrhJR1iHovwbxxKZJyrEb+zOViME0IauEH5M=;
 b=RDZIq+qjd8aCQzVjHKHfWY/5E3Og/3Z4eFJ4nIFgbFd4wTVkn52YBjwu
 fy4WYw/kVbSBk+wb1ePuEz60mFZm7jIMeakHvA8vH7GngXqg+//0jzfT7
 sHdXM4Kr33yJW1CMnxHsENOyjgyGbnidteCVPUVIIULlLq2VDaNVQhiy9
 8HevKH90XuyWWIcv7SIcrFnowfoAs8O+Kp+5xNSvYfkOruoDkJvNxj9ja
 Q+5XNKrNnB8pdGQh1xUIGjTe3C5nRclF1O5/9ZpP+9PDbTg25dSaTcN9w
 x13xs6wY4Z5geMqaFEvd0DnBnxBOV/2EDNRktgBtm0KTDA+8Dc3cRGLYe w==;
X-CSE-ConnectionGUID: QH4aDqm1Tu6eyT3kpoaKIw==
X-CSE-MsgGUID: u1m0jdqET3ilzPeGKWY8Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23598798"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="23598798"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:46 -0700
X-CSE-ConnectionGUID: Flw4IqO6QLeLG+1T3deH1A==
X-CSE-MsgGUID: Iz1t2vI2TB6ZC/3bCSwDng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57861471"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:44 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Christoph Manszewski <christoph.manszewski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH 20/21] drm/xe/eudebug: Dynamically toggle debugger
 functionality
Date: Fri, 26 Jul 2024 17:08:17 +0300
Message-Id: <20240726140818.54304-21-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
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

1) Adjust to xe_rtp graphics ranges changes.
2) Fix pile placement. Wa 14019869343 (aka. 16021232320) was
added later in the pile, move disablement to appropriate commit.
3) flush reset (Christoph)
4) dont allow exec queue enable if feature is disabled (Dominik)
5) bind to drm sysfs functions (Maciej)

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |   2 -
 drivers/gpu/drm/xe/xe_device_types.h |   5 +
 drivers/gpu/drm/xe/xe_eudebug.c      | 174 +++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_eudebug.h      |   2 -
 drivers/gpu/drm/xe/xe_exec_queue.c   |   3 +
 drivers/gpu/drm/xe/xe_hw_engine.c    |   1 -
 drivers/gpu/drm/xe/xe_reg_sr.c       |  21 +++-
 drivers/gpu/drm/xe/xe_reg_sr.h       |   4 +-
 drivers/gpu/drm/xe/xe_rtp.c          |   2 +-
 drivers/gpu/drm/xe/xe_rtp_types.h    |   1 +
 10 files changed, 178 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 268faa1800c4..30a2bf2a7e00 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -785,8 +785,6 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_debugfs_register(xe);
 
-	xe_eudebug_init_late(xe);
-
 	xe_hwmon_register(xe);
 
 	for_each_gt(gt, xe, id)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index beb1f3c8dc63..17aedbba3130 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -517,6 +517,11 @@ struct xe_device {
 		/** @ordered_wq: used to discovery */
 		struct workqueue_struct *ordered_wq;
 
+		/** @enable_lock: protects the enable toggle */
+		struct mutex enable_lock;
+		/** @enable: is the debugging functionality enabled */
+		bool enable;
+
 		/** @attention_scan: attention scan worker */
 		struct delayed_work attention_scan;
 	} eudebug;
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index a80ffb64df15..80066f787ec2 100644
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
@@ -2064,70 +2061,199 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
 	struct drm_xe_eudebug_connect * const param = data;
 	int ret = 0;
 
+	mutex_lock(&xe->eudebug.enable_lock);
+
+	if (!xe->eudebug.enable) {
+		mutex_unlock(&xe->eudebug.enable_lock);
+		return -ENODEV;
+	}
+
 	ret = xe_eudebug_connect(xe, param);
 
+	mutex_unlock(&xe->eudebug.enable_lock);
+
 	return ret;
 }
 
 #undef XE_REG_MCR
 #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
 
-void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe)
+static void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe)
 {
 	const struct xe_rtp_entry_sr eudebug_was[] = {
-		{ XE_RTP_NAME("GlobalDebugEnable"),
-		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210),
-			       ENGINE_CLASS(RENDER)),
-		  XE_RTP_ACTIONS(SET(CS_DEBUG_MODE2(RENDER_RING_BASE),
-				     GLOBAL_DEBUG_ENABLE))
-		},
 		{ XE_RTP_NAME("TdCtlDebugEnable"),
 		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 3499),
 			       FUNC(xe_rtp_match_first_render_or_compute)),
 		  XE_RTP_ACTIONS(SET(TD_CTL,
 				     TD_CTL_BREAKPOINT_ENABLE |
 				     TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE |
-				     TD_CTL_FEH_AND_FEE_ENABLE))
+				     TD_CTL_FEH_AND_FEE_ENABLE,
+				     XE_RTP_ACTION_FLAG(OVERWRITE)))
 		},
 		{ XE_RTP_NAME("TdCtlGlobalDebugEnable"),
 		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, XE_RTP_END_VERSION_UNDEFINED),
 			       FUNC(xe_rtp_match_first_render_or_compute)),
-		  XE_RTP_ACTIONS(SET(TD_CTL, TD_CTL_GLOBAL_DEBUG_ENABLE))
+		  XE_RTP_ACTIONS(SET(TD_CTL, TD_CTL_GLOBAL_DEBUG_ENABLE,
+				     XE_RTP_ACTION_FLAG(OVERWRITE)))
 		},
 		{ XE_RTP_NAME("18022722726"),
 		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, 1274),
 			       FUNC(xe_rtp_match_first_render_or_compute)),
-		  XE_RTP_ACTIONS(SET(ROW_CHICKEN, STALL_DOP_GATING_DISABLE))
+		  XE_RTP_ACTIONS(SET(ROW_CHICKEN, STALL_DOP_GATING_DISABLE,
+				     XE_RTP_ACTION_FLAG(OVERWRITE)))
 		},
 		{ XE_RTP_NAME("14015527279"),
 		  XE_RTP_RULES(PLATFORM(PVC),
 			       FUNC(xe_rtp_match_first_render_or_compute)),
-		  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, XEHPC_DISABLE_BTB))
+		  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, XEHPC_DISABLE_BTB,
+				     XE_RTP_ACTION_FLAG(OVERWRITE)))
 		},
 		{}
 	};
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
-	struct xe_device *xe = gt_to_xe(hwe->gt);
 
-	if (xe->eudebug.available)
-		xe_rtp_process_to_sr(&ctx, eudebug_was, &hwe->reg_sr);
+	xe_rtp_process_to_sr(&ctx, eudebug_was, &hwe->reg_sr);
+}
+
+static void xe_eudebug_fini_hw_engine(struct xe_hw_engine *hwe)
+{
+	const struct xe_rtp_entry_sr eudebug_was[] = {
+		{ XE_RTP_NAME("TdCtlDebugEnable"),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 3499),
+			       FUNC(xe_rtp_match_first_render_or_compute)),
+		  XE_RTP_ACTIONS(CLR(TD_CTL,
+				     TD_CTL_BREAKPOINT_ENABLE |
+				     TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE |
+				     TD_CTL_FEH_AND_FEE_ENABLE,
+				     XE_RTP_ACTION_FLAG(OVERWRITE)))
+		},
+		{ XE_RTP_NAME("TdCtlGlobalDebugEnable"),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, XE_RTP_END_VERSION_UNDEFINED),
+			       FUNC(xe_rtp_match_first_render_or_compute)),
+		  XE_RTP_ACTIONS(CLR(TD_CTL, TD_CTL_GLOBAL_DEBUG_ENABLE,
+				     XE_RTP_ACTION_FLAG(OVERWRITE)))
+		},
+		{ XE_RTP_NAME("18022722726"),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, 1274),
+			       FUNC(xe_rtp_match_first_render_or_compute)),
+		  XE_RTP_ACTIONS(CLR(ROW_CHICKEN, STALL_DOP_GATING_DISABLE,
+				     XE_RTP_ACTION_FLAG(OVERWRITE)))
+		},
+		{ XE_RTP_NAME("14015527279"),
+		  XE_RTP_RULES(PLATFORM(PVC),
+			       FUNC(xe_rtp_match_first_render_or_compute)),
+		  XE_RTP_ACTIONS(CLR(ROW_CHICKEN2, XEHPC_DISABLE_BTB,
+				     XE_RTP_ACTION_FLAG(OVERWRITE)))
+		},
+		{}
+	};
+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
+
+	xe_rtp_process_to_sr(&ctx, eudebug_was, &hwe->reg_sr);
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
+	/* XXX: TODO hold list lock? */
+	mutex_lock(&xe->eudebug.enable_lock);
+
+	if (!enable && !list_empty(&xe->eudebug.list)) {
+		mutex_unlock(&xe->eudebug.enable_lock);
+		return -EBUSY;
+	}
+
+	if (enable == xe->eudebug.enable) {
+		mutex_unlock(&xe->eudebug.enable_lock);
+		return 0;
+	}
+
+	for_each_gt(gt, xe, id) {
+		for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++) {
+			if (!(gt->info.engine_mask & BIT(i)))
+				continue;
+
+			if (enable)
+				xe_eudebug_init_hw_engine(&gt->hw_engines[i]);
+			else
+				xe_eudebug_fini_hw_engine(&gt->hw_engines[i]);
+		}
+
+		xe_gt_reset_async(gt);
+		flush_work(&gt->reset.worker);
+	}
+
+	if (enable)
+		attention_scan_flush(xe);
+	else
+		attention_scan_cancel(xe);
+
+	xe->eudebug.enable = enable;
+	mutex_unlock(&xe->eudebug.enable_lock);
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
 	INIT_DELAYED_WORK(&xe->eudebug.attention_scan, attention_scan_fn);
 
-	xe->eudebug.available = true;
-}
+	drmm_mutex_init(&xe->drm, &xe->eudebug.enable_lock);
+	xe->eudebug.enable = false;
 
-void xe_eudebug_init_late(struct xe_device *xe)
-{
-	if (!xe->eudebug.available)
-		return;
 
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
index 02c9ba56e752..2f66aa87a0f6 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -24,9 +24,7 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
 			     struct drm_file *file);
 
 void xe_eudebug_init(struct xe_device *xe);
-void xe_eudebug_init_late(struct xe_device *xe);
 void xe_eudebug_fini(struct xe_device *xe);
-void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe);
 
 void xe_eudebug_file_open(struct xe_file *xef);
 void xe_eudebug_file_close(struct xe_file *xef);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index bc2edade5e5b..b6fc65ab8aa9 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -360,6 +360,9 @@ static int exec_queue_set_eudebug(struct xe_device *xe, struct xe_exec_queue *q,
 			 !(value & DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)))
 		return -EINVAL;
 
+	if (XE_IOCTL_DBG(xe, !xe->eudebug.enable))
+		return -EPERM;
+
 	q->eudebug_flags = EXEC_QUEUE_EUDEBUG_FLAG_ENABLE;
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 74813bc20787..0f90416be0ba 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -504,7 +504,6 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_tuning_process_engine(hwe);
 	xe_wa_process_engine(hwe);
 	hw_engine_setup_default_state(hwe);
-	xe_eudebug_init_hw_engine(hwe);
 
 	xe_reg_sr_init(&hwe->reg_whitelist, hwe->name, gt_to_xe(gt));
 	xe_reg_whitelist_process_engine(hwe);
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 440ac572f6e5..a7671722a84e 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -92,22 +92,31 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
 
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
index 02e28274282f..5643bcde52bd 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -153,7 +153,7 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
 	};
 
 	sr_entry.reg.addr += mmio_base;
-	xe_reg_sr_add(sr, &sr_entry, gt);
+	xe_reg_sr_add(sr, &sr_entry, gt, action->flags & XE_RTP_ACTION_FLAG_OVERWRITE);
 }
 
 static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index 1b76b947c706..20d228067da3 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -33,6 +33,7 @@ struct xe_rtp_action {
 	/** @read_mask: mask for bits to consider when reading value back */
 	u32			read_mask;
 #define XE_RTP_ACTION_FLAG_ENGINE_BASE		BIT(0)
+#define XE_RTP_ACTION_FLAG_OVERWRITE		BIT(1)
 	/** @flags: flags to apply on rule evaluation or action */
 	u8			flags;
 };
-- 
2.34.1

