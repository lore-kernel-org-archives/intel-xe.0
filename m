Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C66C0032E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 04:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997D210E586;
	Fri, 20 Oct 2023 04:49:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5538110E585
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 04:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697777341; x=1729313341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2eANYM4635lWcJRR/vzP4BjsnXw/aZXL7Qnh7PNgEE8=;
 b=bY/l12Qu5PQuxcJhWSEgDYp8JWwS4di/SDqI600zKnZSQBOAhombxZgO
 d3wwwGNkow9cohIRSFZ8w1b8cYnW0VLlQPcKjGXgPmexTSwxBzqEioXw3
 9TAuHejCwF8sqG1Hmx6KfAYFWLmmmst78CR7mxeUv62Advu1eZQrZE9UH
 kYCCKoeRLR7m9v3rS2WTGVQ6FGMVbQ1WO7zOpvcILLAY1QOIPd0cDLgy7
 Faum1JBU7R3MOg1hivPQMDrGwQCQrwjUCao/TEJ9XYPVubQkftUz/RLjK
 lRLMSAZWnHLdtfO++XK3CPaQNjnGfObdCth4YhwcGDGqwLpzuyQ5/EnoB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="390310810"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="390310810"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 21:49:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="847959817"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="847959817"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Oct 2023 21:48:59 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 20 Oct 2023 10:25:28 +0530
Message-Id: <20231020045533.1425375-8-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020045533.1425375-1-himal.prasad.ghimiray@intel.com>
References: <20231020045533.1425375-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 07/12] drm/xe: Notify userspace about GSC HW
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

v3
- Use pci node to send uevent.
- Pass RESET_REASON for uevent.

v4
- Use XE_RESET_REQUIRED_UEVENT for GSC HW error.
- Define reason for reset.

Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_hw_error.c     | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h     |  3 ++-
 drivers/gpu/drm/xe/xe_irq.c          |  4 ++++
 include/uapi/drm/xe_drm.h            |  6 ++++++
 5 files changed, 32 insertions(+), 1 deletion(-)

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
index 84533ef6a51e..b9d669c150a1 100644
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
+	csc_hw_error_event[0] = XE_RESET_REQUIRED_UEVENT;
+	csc_hw_error_event[1] = XE_RESET_REQUIRED_UEVENT_REASON_GSC;
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
index e82e7c00a7e1..f8d859c82d72 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -7,6 +7,7 @@
 
 #include <linux/stddef.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 #define XE_RAS_REG_SIZE 32
 
@@ -104,5 +105,5 @@ struct xe_tile;
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
index ae1b1c7528d5..60cc6418d9a7 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -32,6 +32,12 @@ extern "C" {
  */
 #define XE_RESET_REQUIRED_UEVENT_REASON_GT    "REASON=GT_RESET_FAILED"
 
+/**
+ * XE_RESET_REQUIRED_UEVENT_REASON_GSC - Reason provided to XE_RESET_REQUIRED_UEVENT
+ * incase of GSC HW reporting Uncorrectable errors. The GSC errors are reported only
+ * on TILE0, therefore no additional information is supplied for this reason.
+ */
+#define XE_RESET_REQUIRED_UEVENT_REASON_GSC    "REASON=GSC_HW_ERROR"
 
 /**
  * struct xe_user_extension - Base class for defining a chain of extensions
-- 
2.25.1

