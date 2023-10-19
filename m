Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3CCCDB484
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 13:21:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD89C10E4DB;
	Thu, 19 Oct 2023 13:21:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9782810E4EC
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 13:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697721681; x=1729257681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n9PO8kvt5ayH/eO1nWqwC4qjlHg/4vB1C3G8YByaLzI=;
 b=gtkujN2mVQsLogKTUKfkX03iABqPhKbh7wlaMIvzZVOGX3bQSjREK18x
 sax1nTrkMBPi+vsURj/yz62VVMuj8si3B/EnfZamiG8j90aq1HPm+lFHs
 SNed/uEG6vcOOc+9b5VlnXZ97KTEJ5YUPsf20gDDXNqhKjXB2/29+fBow
 xw38roGiGYWc6Uy1LU3gt2ePa16EtpdVtaFbWOFqgkiwk0r5GO+t7pZG/
 pW/Mv1PQ+1oDesHecYyCeG0iBiLvbj6NWnfcNJkQSPvh0NwuaPQBvozYl
 In0/aP0u0Bx+8e1qXTO7L4Xr4ZukccQ2SX/4xI33AKi/yD2rZ4RU/UTx9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385124035"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="385124035"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 06:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="757028199"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="757028199"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga002.jf.intel.com with ESMTP; 19 Oct 2023 06:19:01 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 19 Oct 2023 18:55:29 +0530
Message-Id: <20231019132534.1374903-7-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019132534.1374903-1-himal.prasad.ghimiray@intel.com>
References: <20231019132534.1374903-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 06/11] drm/xe: Notify userspace about GSC HW
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

TODO: Since XE_RESET_FAILED_UEVENT and XE_GSC_HW_HEALTH_UEVENT
both pass DEVICE_STATUS=NEEDS_RESET. Use same Uevent to determine
the RESET_REQUIRED and pass reasons for reset required as additional
info.

v2
- No need to provide tile info in uevent because error is
accepted only in tile0. (Aravind)

v3
- Use pci node to send uevent.
- Pass RESET_REASON for uevent.

Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_hw_error.c     | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h     |  3 ++-
 drivers/gpu/drm/xe/xe_irq.c          |  4 ++++
 include/uapi/drm/xe_drm.h            |  9 +++++++++
 5 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 3b371e0f6168..bc7b545ce37b 100644
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
index 84533ef6a51e..644e63d4d717 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <drm/xe_drm.h>
+
 #include "xe_hw_error.h"
 
 #include "regs/xe_regs.h"
@@ -378,6 +380,20 @@ xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
 		xe_gt_hw_error_log_vector_reg(gt, hw_err);
 }
 
+void xe_gsc_hw_error_work(struct work_struct *work)
+{
+	struct xe_tile *tile = container_of(work, typeof(*tile), gsc_hw_err_work);
+	struct pci_dev *pdev = to_pci_dev(tile_to_xe(tile)->drm.dev);
+	char *csc_hw_error_event[3];
+
+	csc_hw_error_event[0] = XE_GSC_HW_HEALTH_UEVENT "=1";
+	csc_hw_error_event[1] = "RESET_REASON=CSC_HW_ERROR";
+	csc_hw_error_event[2] = NULL;
+
+	kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE,
+			   csc_hw_error_event);
+}
+
 static void
 xe_gsc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
@@ -435,6 +451,7 @@ xe_gsc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 			drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
 					    "Tile0 reported GSC %s %s error, bit[%d] is set\n",
 					    name, hw_err_str, errbit);
+			schedule_work(&tile->gsc_hw_err_work);
 		}
 		if (indx != XE_HW_ERR_TILE_UNSPEC)
 			xe_update_hw_error_cnt(&tile_to_xe(tile)->drm,
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index 997747b6b603..3c02fbd3b256 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -7,6 +7,7 @@
 
 #include <linux/stddef.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 #define XE_RAS_REG_SIZE 32
 
@@ -106,5 +107,5 @@ struct xe_tile;
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
index 24bf8f0f52e8..4e5e57bc9f69 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -16,6 +16,15 @@ extern "C" {
  * subject to backwards-compatibility constraints.
  */
 
+/**
+ * DOC: uevent generated by xe on it's pci node.
+ *
+ * XE_GSC_HW_HEALTH_UEVENT - Event is generated when GSC reports HW
+ * errors. The value supplied with the event is always "NEEDS_RESET"
+ * Additional information supplied is "RESET_REASON=CSC_HW_ERROR".
+ */
+#define XE_GSC_HW_HEALTH_UEVENT "DEVICE_STATUS"
+
 /**
  * DOC: uevent generated by xe on it's pci node.
  *
-- 
2.25.1

