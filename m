Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D061CDB474
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 02:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898C210E35F;
	Wed, 18 Oct 2023 02:42:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8647810E360
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 02:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697596928; x=1729132928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q48xS9gZNwY1vmbJK7waM+KCbF8WcvIN3c+9xs7wuYY=;
 b=XarVchY9Q2O4gGhgVJ6s77ORIo/7PCD7ZcYHLUm6s6namMslp8LGTe9D
 6cM+bWhiq7Yan+sYgynWvWKBOk6O17Yi6RktZhvGra4MHdHEtw54Mjp4H
 wT5QS4kC1AkZnWUas0ijwxt0vMd3ZpRoOr1pNs26Rt64yF1WcdpGY7vkR
 bGvNa55VtsiGfCEIME2Cbhk9ROnar2HLy85HVMvj/iNpRWwptCVs17tsq
 dJNTQ5hwTgu+GPn070/Uh2YfrYCZwDhEpJ+XKxtbjsye8YA0aWnmA1FBj
 GVjN7/H+AsxY9AaLbss6bHkWyzvSecDfmw5zgmFDFuotTGvhrm/Nn2LXW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="7476076"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="7476076"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 19:42:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="900141858"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; d="scan'208";a="900141858"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga001.fm.intel.com with ESMTP; 17 Oct 2023 19:40:03 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 18 Oct 2023 08:18:33 +0530
Message-Id: <20231018024838.1223255-6-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018024838.1223255-1-himal.prasad.ghimiray@intel.com>
References: <20231018024838.1223255-1-himal.prasad.ghimiray@intel.com>
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
index 1e94ee72a34f..9ac817c1dd03 100644
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

