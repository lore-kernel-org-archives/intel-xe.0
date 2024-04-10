Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F971CD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 08:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0F710E8AA;
	Wed, 10 Apr 2024 08:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSfORIFv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA6810E8AA
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 08:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712738343; x=1744274343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=874kO04n9vR4cmTjEizrvmM/imH8qAe0mAS1lpeD1i8=;
 b=dSfORIFvoWju3HqPJIbQNypkYKy0LCNeD+Pg+QvDmF2o0xIBwpNEWjXq
 VYpcW1u2BtMtYqjGTjmC7Xmm4TSD+dIEWe9oI7eHAeTc11tBpDLwlpzl6
 EfDKYwXmnWoRCyrn/4isMgOgyWdkqZ4sIKV3xwhim4y/olyjNsDXGBHZE
 2aZWwY5g3kVL+yPrBwCAisExy5tsE6xqmZxU6lnb7gpwLZR1dPwfVjiFK
 8Rp6XJ+CAn0zvAm1lUlT5PrewhbO0W2prgXPxW/MheSKBJgg1APyBFw5p
 bcyC99tcws112k9BC72IaOPrFP6Q5vbDwpsDTXf+urUXCwOzVZq0dWDE9 Q==;
X-CSE-ConnectionGUID: AijeNMcaSjqQAw0dkmy+fw==
X-CSE-MsgGUID: AlmF8LuIT0yBorY+jSnffQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11877654"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11877654"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 01:39:03 -0700
X-CSE-ConnectionGUID: fMmns6m6T5OLFC71ZYN0og==
X-CSE-MsgGUID: 9rrKQP16QPiKjRGAAMBiSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20556271"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 01:39:02 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com
Subject: [CI 1/2] drm/xe: check pcode init status only on root gt of root tile
Date: Wed, 10 Apr 2024 14:20:04 +0530
Message-Id: <20240410085005.1126343-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240410085005.1126343-1-riana.tauro@intel.com>
References: <20240410085005.1126343-1-riana.tauro@intel.com>
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

The root tile indicates the pcode initialization is complete
when all tiles have completed their initialization.
So the mailbox can be polled only on the root tile.
Check pcode init status only on root tile and move it to
device probe early as root tile is initialized there.
Also make similar changes in resume paths.

v2: add lock/unlocked version of pcode_mailbox_rw
    to allow pcode init to be called in device
    early probe (Rodrigo)

v3: add code description about using root tile
    change function names to xe_pcode_probe_early
    and xe_pcode_init (Rodrigo)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  21 ++++--
 drivers/gpu/drm/xe/xe_pcode.c  | 115 ++++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_pcode.h  |   6 +-
 drivers/gpu/drm/xe/xe_pm.c     |  16 ++---
 4 files changed, 94 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9083f5e02dd9..a05623a8c163 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -422,8 +422,14 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return err;
 }
 
-/*
- * Initialize MMIO resources that don't require any knowledge about tile count.
+/**
+ * xe_device_probe_early: Device early probe
+ * @xe: xe device instance
+ *
+ * Initialize MMIO resources that don't require any
+ * knowledge about tile count. Also initialize pcode
+ *
+ * Return: 0 on success, error code on failure
  */
 int xe_device_probe_early(struct xe_device *xe)
 {
@@ -439,6 +445,10 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_pcode_probe_early(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 
@@ -517,11 +527,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	for_each_gt(gt, xe, id) {
-		err = xe_pcode_probe(gt);
-		if (err)
-			return err;
-	}
+	for_each_gt(gt, xe, id)
+		xe_pcode_init(gt);
 
 	err = xe_display_init_noirq(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 627e094c7cbe..c010ef16fbf5 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_mmio.h"
 #include "xe_pcode_api.h"
@@ -43,8 +44,6 @@ static int pcode_mailbox_status(struct xe_gt *gt)
 		[PCODE_ERROR_MASK] = {-EPROTO, "Unknown"},
 	};
 
-	lockdep_assert_held(&gt->pcode.lock);
-
 	err = xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_ERROR_MASK;
 	if (err) {
 		drm_err(&gt_to_xe(gt)->drm, "PCODE Mailbox failed: %d %s", err,
@@ -55,17 +54,15 @@ static int pcode_mailbox_status(struct xe_gt *gt)
 	return 0;
 }
 
-static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
-			    unsigned int timeout_ms, bool return_data,
-			    bool atomic)
+static int __pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
+			      unsigned int timeout_ms, bool return_data,
+			      bool atomic)
 {
 	int err;
 
 	if (gt_to_xe(gt)->info.skip_pcode)
 		return 0;
 
-	lockdep_assert_held(&gt->pcode.lock);
-
 	if ((xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_READY) != 0)
 		return -EAGAIN;
 
@@ -87,6 +84,18 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
 	return pcode_mailbox_status(gt);
 }
 
+static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
+			    unsigned int timeout_ms, bool return_data,
+			    bool atomic)
+{
+	if (gt_to_xe(gt)->info.skip_pcode)
+		return 0;
+
+	lockdep_assert_held(&gt->pcode.lock);
+
+	return __pcode_mailbox_rw(gt, mbox, data0, data1, timeout_ms, return_data, atomic);
+}
+
 int xe_pcode_write_timeout(struct xe_gt *gt, u32 mbox, u32 data, int timeout)
 {
 	int err;
@@ -109,15 +118,19 @@ int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1)
 	return err;
 }
 
-static int xe_pcode_try_request(struct xe_gt *gt, u32 mbox,
-				u32 request, u32 reply_mask, u32 reply,
-				u32 *status, bool atomic, int timeout_us)
+static int pcode_try_request(struct xe_gt *gt, u32 mbox,
+			     u32 request, u32 reply_mask, u32 reply,
+			     u32 *status, bool atomic, int timeout_us, bool locked)
 {
 	int slept, wait = 10;
 
 	for (slept = 0; slept < timeout_us; slept += wait) {
-		*status = pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
-					   atomic);
+		if (locked)
+			*status = pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
+						   atomic);
+		else
+			*status = __pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
+						     atomic);
 		if ((*status == 0) && ((request & reply_mask) == reply))
 			return 0;
 
@@ -158,8 +171,8 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
 
 	mutex_lock(&gt->pcode.lock);
 
-	ret = xe_pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
-				   false, timeout_base_ms * 1000);
+	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
+				false, timeout_base_ms * 1000, true);
 	if (!ret)
 		goto out;
 
@@ -177,8 +190,8 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
 		"PCODE timeout, retrying with preemption disabled\n");
 	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 1);
 	preempt_disable();
-	ret = xe_pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
-				   true, timeout_base_ms * 1000);
+	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
+				true, timeout_base_ms * 1000, true);
 	preempt_enable();
 
 out:
@@ -238,59 +251,71 @@ int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
 }
 
 /**
- * xe_pcode_init - Ensure PCODE is initialized
- * @gt: gt instance
+ * xe_pcode_ready - Ensure PCODE is initialized
+ * @xe: xe instance
+ * @locked: true if lock held, false otherwise
  *
- * This function ensures that PCODE is properly initialized. To be called during
- * probe and resume paths.
+ * PCODE init mailbox is polled only on root gt of root tile
+ * as the root tile provides the initialization is complete only
+ * after all the tiles have completed the initialization.
+ * Called only on early probe without locks and with locks in
+ * resume path.
  *
- * It returns 0 on success, and -error number on failure.
+ * Returns 0 on success, and -error number on failure.
  */
-int xe_pcode_init(struct xe_gt *gt)
+int xe_pcode_ready(struct xe_device *xe, bool locked)
 {
 	u32 status, request = DGFX_GET_INIT_STATUS;
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	int timeout_us = 180000000; /* 3 min */
 	int ret;
 
-	if (gt_to_xe(gt)->info.skip_pcode)
+	if (xe->info.skip_pcode)
 		return 0;
 
-	if (!IS_DGFX(gt_to_xe(gt)))
+	if (!IS_DGFX(xe))
 		return 0;
 
-	mutex_lock(&gt->pcode.lock);
-	ret = xe_pcode_try_request(gt, DGFX_PCODE_STATUS, request,
-				   DGFX_INIT_STATUS_COMPLETE,
-				   DGFX_INIT_STATUS_COMPLETE,
-				   &status, false, timeout_us);
-	mutex_unlock(&gt->pcode.lock);
+	if (locked)
+		mutex_lock(&gt->pcode.lock);
+
+	ret = pcode_try_request(gt, DGFX_PCODE_STATUS, request,
+				DGFX_INIT_STATUS_COMPLETE,
+				DGFX_INIT_STATUS_COMPLETE,
+				&status, false, timeout_us, locked);
+
+	if (locked)
+		mutex_unlock(&gt->pcode.lock);
 
 	if (ret)
-		drm_err(&gt_to_xe(gt)->drm,
+		drm_err(&xe->drm,
 			"PCODE initialization timedout after: 3 min\n");
 
 	return ret;
 }
 
 /**
- * xe_pcode_probe - Prepare xe_pcode and also ensure PCODE is initialized.
+ * xe_pcode_init: initialize components of PCODE
  * @gt: gt instance
  *
- * This function initializes the xe_pcode component, and when needed, it ensures
- * that PCODE has properly performed its initialization and it is really ready
- * to go. To be called once only during probe.
- *
- * It returns 0 on success, and -error number on failure.
+ * This function initializes the xe_pcode component.
+ * To be called once only during probe.
  */
-int xe_pcode_probe(struct xe_gt *gt)
+void xe_pcode_init(struct xe_gt *gt)
 {
 	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->pcode.lock);
+}
 
-	if (gt_to_xe(gt)->info.skip_pcode)
-		return 0;
-
-	if (!IS_DGFX(gt_to_xe(gt)))
-		return 0;
-
-	return xe_pcode_init(gt);
+/**
+ * xe_pcode_probe_early: initializes PCODE
+ * @xe: xe instance
+ *
+ * This function checks the initialization status of PCODE
+ * To be called once only during early probe without locks.
+ *
+ * Returns 0 on success, error code otherwise
+ */
+int xe_pcode_probe_early(struct xe_device *xe)
+{
+	return xe_pcode_ready(xe, false);
 }
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index 08cb1d047cba..3f54c6d2a57d 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -8,9 +8,11 @@
 
 #include <linux/types.h>
 struct xe_gt;
+struct xe_device;
 
-int xe_pcode_probe(struct xe_gt *gt);
-int xe_pcode_init(struct xe_gt *gt);
+void xe_pcode_init(struct xe_gt *gt);
+int xe_pcode_probe_early(struct xe_device *xe);
+int xe_pcode_ready(struct xe_device *xe, bool locked);
 int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
 				 u32 max_gt_freq);
 int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index cc650a92c2fc..f1fc83845c01 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -129,11 +129,9 @@ int xe_pm_resume(struct xe_device *xe)
 	for_each_tile(tile, xe, id)
 		xe_wa_apply_tile_workarounds(tile);
 
-	for_each_gt(gt, xe, id) {
-		err = xe_pcode_init(gt);
-		if (err)
-			goto err;
-	}
+	err = xe_pcode_ready(xe, true);
+	if (err)
+		return err;
 
 	xe_display_pm_resume_early(xe);
 
@@ -386,11 +384,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
 
 	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
-		for_each_gt(gt, xe, id) {
-			err = xe_pcode_init(gt);
-			if (err)
-				goto out;
-		}
+		err = xe_pcode_ready(xe, true);
+		if (err)
+			goto out;
 
 		/*
 		 * This only restores pinned memory which is the memory
-- 
2.40.0

