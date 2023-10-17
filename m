Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AE5CDB483
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 04:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE24E10E262;
	Tue, 17 Oct 2023 04:09:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0532610E267
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 04:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697515759; x=1729051759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5zV836hFUp86U3qFF0OhLPzcHX3679QVHO5Ix3+fN9k=;
 b=kK030KXp3XRPy82jUtVtIBXGfpv8NcQawxZbhlcfbs50EyoBTjwEDR+X
 xe9n1syz+T5mMrecuaUulAJqH8jKAQNBzIdn9ccc7dq1NgmkFcG4Uph/n
 cQYoaMon/Jic/1UjWgvF0hny7hps4Vs4Fy2hzKW2GYzx0drugwch4PFvX
 sW9P9wjT0XNZ32optPukS1F4T0NMcrVsVAY2YHPeJu8spqiW5HnmbRKJW
 21J1rsW036LrwU/HFxHmvRR29yw+hzhcub+7F7jIHo/tLAHlD6VYUerAx
 Q8W9HJaoUhOYYo2eIDS5H9I8iGGymzh1AzxWtFRqGa2ojL27UVJctK4u8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="416769908"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="416769908"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 21:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="791073853"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="791073853"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga001.jf.intel.com with ESMTP; 16 Oct 2023 21:09:17 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 17 Oct 2023 09:45:45 +0530
Message-Id: <20231017041550.1172643-6-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231017041550.1172643-1-himal.prasad.ghimiray@intel.com>
References: <20231017041550.1172643-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 05/10] drm/xe: Notify userspace about GSC HW
 errors.
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

Send uevent incase of nonfatal errors reported by gsc.

v2
- No need to provide tile info in uevent because error is
accepted only in tile0. (Aravind)

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_hw_error.c     | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h     |  3 ++-
 drivers/gpu/drm/xe/xe_irq.c          |  4 ++++
 include/uapi/drm/xe_drm.h            |  8 ++++++++
 5 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 2998ee517f0d..d2ee5549d20c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -196,6 +196,9 @@ struct xe_tile {
 	struct tile_hw_errors {
 		struct xarray hw_error;
 	} errors;
+
+	/** @gsc_hw_err_work: worker for uevent to report GSC HW errors */
+	struct work_struct gsc_hw_err_work;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index f2e751bf9dd5..4760362d6374 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <drm/xe_drm.h>
+
 #include "xe_hw_error.h"
 
 #include "regs/xe_regs.h"
@@ -387,6 +389,19 @@ xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
 		xe_gt_hw_error_log_vector_reg(gt, hw_err);
 }
 
+void xe_gsc_hw_error_work(struct work_struct *work)
+{
+	struct xe_tile *tile = container_of(work, typeof(*tile), gsc_hw_err_work);
+	char *csc_hw_error_event[3];
+
+	csc_hw_error_event[0] = XE_GSC_HW_HEALTH_UEVENT "=1";
+	csc_hw_error_event[1] = "RESET_REQUIRED=1";
+	csc_hw_error_event[2] = NULL;
+
+	kobject_uevent_env(&tile->xe->drm.primary->kdev->kobj, KOBJ_CHANGE,
+			   csc_hw_error_event);
+}
+
 static void
 xe_gsc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
@@ -443,6 +458,7 @@ xe_gsc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 			drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
 					    "Tile0 reported GSC %s %s error, bit[%d] is set\n",
 					    name, hw_err_str, errbit);
+			schedule_work(&tile->gsc_hw_err_work);
 		}
 		if (indx != XE_HW_ERR_TILE_UNSPEC)
 			xe_update_hw_error_cnt(&tile_to_xe(tile)->drm,
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index 1dad66a85799..8f6275997063 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -7,6 +7,7 @@
 
 #include <linux/stddef.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 #define XE_RAS_REG_SIZE 32
 
@@ -110,5 +111,5 @@ struct xe_tile;
 void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
 void xe_assign_hw_err_regs(struct xe_device *xe);
 void xe_process_hw_errors(struct xe_device *xe);
-
+void xe_gsc_hw_error_work(struct work_struct *work);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 8365a4cb0c45..bc0f01a2abc1 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -614,6 +614,10 @@ int xe_irq_install(struct xe_device *xe)
 	irq_handler_t irq_handler;
 	int err, irq;
 
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+
+	INIT_WORK(&tile->gsc_hw_err_work, xe_gsc_hw_error_work);
+
 	irq_handler = xe_irq_handler(xe);
 	if (!irq_handler) {
 		drm_err(&xe->drm, "No supported interrupt handler");
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d48d8e3c898c..06f6fce1531d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -16,6 +16,14 @@ extern "C" {
  * subject to backwards-compatibility constraints.
  */
 
+/**
+ * DOC: uevent generated by xe on it's tile node.
+ *
+ * XE_GSC_HW_HEALTH_UEVENT - Event is generated when GSC reports HW
+ * errors. The value supplied with the event is always "RESET_REQUIRED=1".
+ */
+#define XE_GSC_HW_HEALTH_UEVENT "DEVICE_STATUS"
+
 /**
  * DOC: uevent generated by xe on it's pci node.
  *
-- 
2.25.1

