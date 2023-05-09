Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094B5C77B75
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 08:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D546D10E357;
	Tue,  9 May 2023 08:22:29 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2579910E357
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 08:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683620547; x=1715156547;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wIXEFcON/aiYEDZFuljwRp8JcSeJFrZwjgI3i+NwGNU=;
 b=eKoVeGS0P+T3TNHLubfMfoP1CT+AZ1CTqDgvIM+ZQzwh7HZPqH6diz82
 6jxLz9ihpX1hOVgl28DvF2tDjwvUxJOsCq4O1q+YW2zKEY4lXIvfDSxF2
 WEpYKfQodk9/SJexN/NoCL3w1Ml4N8Sa0YelJhW3EroomTb/bK+Ki4fcB
 6P/4nr9J5Ukm9/qQWTLUxU+EqBLBTViF3PLrY3Wc54gky+DEIkuWsDCE5
 bfvcf2o6nbNVktvJmwPMzcEiYhVT76sw8QMQ6mRDIEo6cOZqFzgFQmOAR
 yl8dfxgQlEcu3rbKeahUTHslZN00YS0lhy+a4FxA3a+xzS6jEqZiFMDoX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="415402749"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="415402749"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 01:22:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="843014175"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="843014175"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga001.fm.intel.com with ESMTP; 09 May 2023 01:22:23 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  9 May 2023 13:55:58 +0530
Message-Id: <20230509082558.614913-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace when engine/gt
 reset fails.
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
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Send uevent in case of engine reset or gt reset failure.
This intimation can be used by userspace monitoring tool to do the
device level reset/reboot when GT reset fails. udevadm can be used to
monitor the uevents.

v2:
-Add NULL check for xe_gt_hw_engine return(Aravind)
-Arrange variables in Christmas tree order(Tejas)
-Check GUC_GSC_OTHER_CLASS(Tejas)

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c         | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h        | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c | 23 +++++++++++++++++++++++
 include/uapi/drm/xe_drm.h          |  8 ++++++++
 4 files changed, 68 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3afca3dd9657..2c3ffa1db74e 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -8,6 +8,7 @@
 #include <linux/minmax.h>
 
 #include <drm/drm_managed.h>
+#include <drm/xe_drm.h>
 
 #include "regs/xe_gt_regs.h"
 #include "xe_bb.h"
@@ -590,6 +591,20 @@ static int do_gt_restart(struct xe_gt *gt)
 	return 0;
 }
 
+static void xe_uevent_gt_reset_failure(struct xe_device *xe, u8 id)
+{
+	char *reset_event[5];
+
+	reset_event[0] = XE_RESET_FAILED_UEVENT "=1";
+	reset_event[1] = "RESET_ENABLED=1";
+	reset_event[2] = "RESET_UNIT=gt";
+	reset_event[3] = kasprintf(GFP_KERNEL, "RESET_ID=%d", id);
+	reset_event[4] = NULL;
+	kobject_uevent_env(&xe->drm.primary->kdev->kobj, KOBJ_CHANGE, reset_event);
+
+	kfree(reset_event[3]);
+}
+
 static int gt_reset(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -639,6 +654,9 @@ static int gt_reset(struct xe_gt *gt)
 	xe_device_mem_access_put(gt_to_xe(gt));
 	drm_err(&xe->drm, "GT reset failed, err=%d\n", err);
 
+	/* Notify userspace about gt reset failure */
+	xe_uevent_gt_reset_failure(xe, gt->info.id);
+
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 74a74051f354..a3637eeaaa37 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -56,4 +56,23 @@ static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
 	}
 }
 
+static inline u16 xe_guc_class_to_engine_class(u8 guc_class)
+{
+	switch (guc_class) {
+	case GUC_RENDER_CLASS:
+		return XE_ENGINE_CLASS_RENDER;
+	case GUC_VIDEO_CLASS:
+		return XE_ENGINE_CLASS_VIDEO_DECODE;
+	case GUC_VIDEOENHANCE_CLASS:
+		return XE_ENGINE_CLASS_VIDEO_ENHANCE;
+	case GUC_BLITTER_CLASS:
+		return XE_ENGINE_CLASS_COPY;
+	case GUC_COMPUTE_CLASS:
+		return XE_ENGINE_CLASS_COMPUTE;
+	case GUC_GSC_OTHER_CLASS:
+	default:
+		XE_WARN_ON(guc_class);
+		return -1;
+	}
+}
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e857013070b9..d068af0ca7df 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -12,6 +12,7 @@
 #include <linux/dma-fence-array.h>
 
 #include <drm/drm_managed.h>
+#include <drm/xe_drm.h>
 
 #include "regs/xe_lrc_layout.h"
 #include "xe_device.h"
@@ -1589,10 +1590,26 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 	return 0;
 }
 
+static void xe_uevent_engine_reset_failure(struct xe_device *xe, const char *name)
+{
+	char *reset_event[5];
+
+	reset_event[0] = XE_RESET_FAILED_UEVENT "=1";
+	reset_event[1] = "RESET_ENABLED=1";
+	reset_event[2] = "RESET_UNIT=engine";
+	reset_event[3] = kasprintf(GFP_KERNEL, "RESET_ID=%s", name);
+	reset_event[4] = NULL;
+	kobject_uevent_env(&xe->drm.primary->kdev->kobj, KOBJ_CHANGE, reset_event);
+
+	kfree(reset_event[3]);
+}
+
 int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_hw_engine *hwe;
 	u8 guc_class, instance;
+	u16 engine_class;
 	u32 reason;
 
 	if (unlikely(len != 3)) {
@@ -1608,6 +1625,12 @@ int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	drm_err(&xe->drm, "GuC engine reset request failed on %d:%d because 0x%08X",
 		guc_class, instance, reason);
 
+	/* Notify userspace about engine reset failure */
+	engine_class = xe_guc_class_to_engine_class(guc_class);
+	hwe = xe_gt_hw_engine(guc_to_gt(guc), engine_class, instance, false);
+	if (hwe)
+		xe_uevent_engine_reset_failure(xe, hwe->name);
+
 	xe_gt_reset_async(guc_to_gt(guc));
 
 	return 0;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b0b80aae3ee8..79ef5947c172 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -36,6 +36,14 @@ extern "C" {
  * subject to backwards-compatibility constraints.
  */
 
+/*
+ * Uevents generated by xe on it's device node.
+ *
+ * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset engine
+ *	or gt fails. The value supplied with the event is always 1.
+ */
+#define XE_RESET_FAILED_UEVENT "RESET_FAILED"
+
 /**
  * struct xe_user_extension - Base class for defining a chain of extensions
  *
-- 
2.25.1

