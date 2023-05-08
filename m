Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F06C77B73
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 13:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3158410E2AD;
	Mon,  8 May 2023 13:44:55 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2441410E2AD
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 13:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683553493; x=1715089493;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Iu4GjC3Kst30yupxZG8kwphm4hf7jRsPIXKBLVi+HA=;
 b=iJ/H729txwgwSU6JNRSU2KaaVbqmZO8f0KuXa+Rqc5Lmo61Vdwz4T64H
 gHOOJUEO3MYovIPNUGJGCXZVH9LoX2FPVyIw1jtSDJdqTGPphPq/D03Hw
 LJMST1dNK+gnjHSylRVjd8lemaxec62Ee0bqUmG1Yfz7ZclkAQ9qDpcaS
 47SxsaZDzEuAsFE75ghB3VOrqt4f+3pyK+WiyLww8KR24DhczYbdcqsn9
 29+XQG6ThFWcmlDVYnfpOoC+eBJaS0Kr3Sfl+TkOcdEGUImcPGWO8xOsr
 2ViHfk6RwxhQf337FpfZ2nTt7Q2nBqWgbFAyElRpL3Hwfk0bSPmQfM0NG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="329270765"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="329270765"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 06:44:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="842698196"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="842698196"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga001.fm.intel.com with ESMTP; 08 May 2023 06:44:50 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 19:18:23 +0530
Message-Id: <20230508134823.585186-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 1/1] drm/xe: Notify Userspace when engine/gt reset
 fails.
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

Send uevent in case of engine reset or gt reset failure.
L0 sysman would like to generate device reset needed event when
gt reset fails
https://one-api.gitlab-pages.devtools.intel.com/level_zero/sysman/api.html#_CPPv441ZES_EVENT_TYPE_FLAG_DEVICE_RESET_REQUIRED

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c         | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h        | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c | 23 +++++++++++++++++++++++
 include/uapi/drm/xe_drm.h          |  8 ++++++++
 4 files changed, 67 insertions(+)

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
index 74a74051f354..845c57b95562 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -56,4 +56,22 @@ static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
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
+	default:
+		XE_WARN_ON(guc_class);
+		return -1;
+	}
+}
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e857013070b9..663908573d5c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -12,6 +12,7 @@
 #include <linux/dma-fence-array.h>
 
 #include <drm/drm_managed.h>
+#include <drm/xe_drm.h>
 
 #include "regs/xe_lrc_layout.h"
 #include "xe_device.h"
@@ -1589,9 +1590,25 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
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
+	u16 engine_class;
 	u8 guc_class, instance;
 	u32 reason;
 
@@ -1608,6 +1625,12 @@ int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	drm_err(&xe->drm, "GuC engine reset request failed on %d:%d because 0x%08X",
 		guc_class, instance, reason);
 
+	engine_class = xe_guc_class_to_engine_class(guc_class);
+	hwe = xe_gt_hw_engine(guc_to_gt(guc), engine_class, instance, false);
+
+	/* Notify userspace about engine reset failure */
+	xe_uevent_engine_reset_failure(xe, hwe->name);
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

