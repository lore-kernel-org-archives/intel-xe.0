Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6774BC54E4A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 08:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177ED10F905;
	Fri,  8 Mar 2024 08:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q1x74nSm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6102910F901
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 08:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709887499; x=1741423499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9T+RKMeZeEc5fLKUKaCTIjrw/H8lpZn9aTXLHZQfeaM=;
 b=Q1x74nSmqKKziBTm3VAaG6GHbJ87sqWf8+65pnRiheEwUUI23zkTEvFF
 jBlCbGgZCaIQmjPAO8z0367so92ks8Pi43MIJw8qXW+bVsIl14SSHfQDk
 GUTRFn1R5/NzvJI0KCWJgemTQF1oKys5kTJ0Rkd1LLcjmVUGkaIK/jOry
 RQ25nf1GIigYD53vphnoy7vKeKg3H/ARh7d8ZPY+uLumZt1HMwTtl9O+F
 9WXUP9AgOzxwdvsFdB/rCmBfDpaPBLx6fQ+riU2pQbhy6472UJWbrmFZD
 TGKpPydNu1V/2BOh9XQkxj8id40qAlIkWa59wkGgCnQT7gUH5yF386vuc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="22122941"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="22122941"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:44:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="14958192"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:44:54 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 aravind.iddamsetty@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, rodrigo.vivi@intel.com
Subject: [PATCH 1/2] RFC drm/xe: check pcode init status only on root gt of
 root tile
Date: Fri,  8 Mar 2024 14:25:16 +0530
Message-Id: <20240308085517.2030484-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240308085517.2030484-1-riana.tauro@intel.com>
References: <20240308085517.2030484-1-riana.tauro@intel.com>
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

v2: Add lock/unlocked version of pcode_mailbox_rw
    to allow pcode init to be called in device
    early probe (Rodrigo)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 21 +++++---
 drivers/gpu/drm/xe/xe_pcode.c  | 93 ++++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_pcode.h  |  3 +-
 drivers/gpu/drm/xe/xe_pm.c     | 16 +++---
 4 files changed, 78 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 919ad88f0495..83dd60f68566 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -413,8 +413,14 @@ static int xe_set_dma_info(struct xe_device *xe)
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
@@ -428,6 +434,10 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_pcode_ready(xe_root_mmio_gt(xe), false);
+	if (err)
+		return err;
+
 	return 0;
 }
 
@@ -506,11 +516,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	for_each_gt(gt, xe, id) {
-		err = xe_pcode_probe(gt);
-		if (err)
-			return err;
-	}
+	for_each_gt(gt, xe, id)
+		xe_pcode_probe(gt);
 
 	err = xe_display_init_noirq(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index b324dc2a5deb..6c0009fcd2fe 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -43,8 +43,6 @@ static int pcode_mailbox_status(struct xe_gt *gt)
 		[PCODE_ERROR_MASK] = {-EPROTO, "Unknown"},
 	};
 
-	lockdep_assert_held(&gt->pcode.lock);
-
 	err = xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_ERROR_MASK;
 	if (err) {
 		drm_err(&gt_to_xe(gt)->drm, "PCODE Mailbox failed: %d %s", err,
@@ -55,17 +53,15 @@ static int pcode_mailbox_status(struct xe_gt *gt)
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
 
@@ -87,6 +83,18 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
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
@@ -109,15 +117,19 @@ int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1)
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
 
@@ -158,8 +170,8 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
 
 	mutex_lock(&gt->pcode.lock);
 
-	ret = xe_pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
-				   false, timeout_base_ms * 1000);
+	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
+				false, timeout_base_ms * 1000, true);
 	if (!ret)
 		goto out;
 
@@ -177,8 +189,8 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
 		"PCODE timeout, retrying with preemption disabled\n");
 	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 1);
 	preempt_disable();
-	ret = xe_pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
-				   true, timeout_base_ms * 1000);
+	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
+				true, timeout_base_ms * 1000, true);
 	preempt_enable();
 
 out:
@@ -238,15 +250,16 @@ int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
 }
 
 /**
- * xe_pcode_init - Ensure PCODE is initialized
+ * xe_pcode_ready - Ensure PCODE is initialized
  * @gt: gt instance
+ * @locked: true if lock held, false otherwise
  *
- * This function ensures that PCODE is properly initialized. To be called during
- * probe and resume paths.
+ * This function ensures that PCODE is properly initialized. Can be called
+ * without locks only in early probe.
  *
  * It returns 0 on success, and -error number on failure.
  */
-int xe_pcode_init(struct xe_gt *gt)
+int xe_pcode_ready(struct xe_gt *gt, bool locked)
 {
 	u32 status, request = DGFX_GET_INIT_STATUS;
 	int timeout_us = 180000000; /* 3 min */
@@ -258,12 +271,10 @@ int xe_pcode_init(struct xe_gt *gt)
 	if (!IS_DGFX(gt_to_xe(gt)))
 		return 0;
 
-	mutex_lock(&gt->pcode.lock);
-	ret = xe_pcode_try_request(gt, DGFX_PCODE_STATUS, request,
-				   DGFX_INIT_STATUS_COMPLETE,
-				   DGFX_INIT_STATUS_COMPLETE,
-				   &status, false, timeout_us);
-	mutex_unlock(&gt->pcode.lock);
+	ret = pcode_try_request(gt, DGFX_PCODE_STATUS, request,
+				DGFX_INIT_STATUS_COMPLETE,
+				DGFX_INIT_STATUS_COMPLETE,
+				&status, false, timeout_us, locked);
 
 	if (ret)
 		drm_err(&gt_to_xe(gt)->drm,
@@ -273,24 +284,32 @@ int xe_pcode_init(struct xe_gt *gt)
 }
 
 /**
- * xe_pcode_probe - Prepare xe_pcode and also ensure PCODE is initialized.
+ * xe_pcode_init - initialize pcode
  * @gt: gt instance
  *
- * This function initializes the xe_pcode component, and when needed, it ensures
- * that PCODE has properly performed its initialization and it is really ready
- * to go. To be called once only during probe.
+ * This function initializes pcode. Used in resume paths
  *
  * It returns 0 on success, and -error number on failure.
  */
-int xe_pcode_probe(struct xe_gt *gt)
+int xe_pcode_init(struct xe_gt *gt)
 {
-	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->pcode.lock);
+	int ret;
 
-	if (gt_to_xe(gt)->info.skip_pcode)
-		return 0;
+	mutex_lock(&gt->pcode.lock);
+	ret = xe_pcode_ready(gt, true);
+	mutex_unlock(&gt->pcode.lock);
 
-	if (!IS_DGFX(gt_to_xe(gt)))
-		return 0;
+	return ret;
+}
 
-	return xe_pcode_init(gt);
+/**
+ * xe_pcode_probe - Prepare pcode component
+ * @gt: gt instance
+ *
+ * This function initializes the xe_pcode component.
+ * To be called once only during probe.
+ */
+void xe_pcode_probe(struct xe_gt *gt)
+{
+	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->pcode.lock);
 }
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index 08cb1d047cba..e597dcc8ad9f 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -9,8 +9,9 @@
 #include <linux/types.h>
 struct xe_gt;
 
-int xe_pcode_probe(struct xe_gt *gt);
+void xe_pcode_probe(struct xe_gt *gt);
 int xe_pcode_init(struct xe_gt *gt);
+int xe_pcode_ready(struct xe_gt *gt, bool locked);
 int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
 				 u32 max_gt_freq);
 int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 9fbb6f6c598a..83c316254e43 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -121,11 +121,9 @@ int xe_pm_resume(struct xe_device *xe)
 	for_each_tile(tile, xe, id)
 		xe_wa_apply_tile_workarounds(tile);
 
-	for_each_gt(gt, xe, id) {
-		err = xe_pcode_init(gt);
-		if (err)
-			return err;
-	}
+	err = xe_pcode_init(xe_root_mmio_gt(xe));
+	if (err)
+		return err;
 
 	xe_display_pm_resume_early(xe);
 
@@ -374,11 +372,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
 
 	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
-		for_each_gt(gt, xe, id) {
-			err = xe_pcode_init(gt);
-			if (err)
-				goto out;
-		}
+		err = xe_pcode_init(xe_root_mmio_gt(xe));
+		if (err)
+			goto out;
 
 		/*
 		 * This only restores pinned memory which is the memory
-- 
2.40.0

