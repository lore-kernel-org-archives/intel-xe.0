Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D72ACCA463
	for <intel-xe@archiver.kernel.org>; Sat, 17 Oct 2026 03:19:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CE610E35B;
	Sat, 17 Oct 2026 03:19:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4ABD10E2BD
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Oct 2026 03:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792207145; x=1823743145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sc1eyuvLJu8xa6CIHsd9Wc6d5ZAebSmehEPpol3kewg=;
 b=WMAMU3HlWob0iUhcfN5eTyJN7S0UDhCNJZdCgjXs4CfzShWXg4r0Tg4B
 Lp7/XFjvEWvDtUE6UE3iYgwGLgiA/fcmlPRiNYXxOSZU0kRSggM+TwN8j
 9KaS4RwyxtmbZ6SmoIz7b1g5td6KLFmsP7pBuH/fyC0heI9eHWrpJb5/0
 Cb2NXga2Ny54lEqLxynaeoAlUHi5oqZU/+bzj3DTv1Tyir3F5M1Fy7vJz
 L23fV6cxofMC8N66AAKjYMzzSlNHIFEjeT2BydKHrt7bnFVl7a+/a5911
 lUolyuiXYHAL39x5UVjiZBGYpGcddgjG4UHZFx/8ARi3fzbt54l/V7qaQ A==;
X-CSE-ConnectionGUID: GS9qHgD0S4+2ZSMzgOtWtQ==
X-CSE-MsgGUID: CcU06evmS2mymDs2AWagsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="982110"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="982110"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 20:18:59 -0700
X-CSE-ConnectionGUID: 5xM+vK/PTbCQyXA5cj4Qpg==
X-CSE-MsgGUID: V1hD+W7SQfKq6DFmDVWQkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2556674"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa010.fm.intel.com with ESMTP; 16 Oct 2026 20:18:59 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH 2/3] drm/xe/forcewake: flush delayed release at power and
 teardown boundaries
Date: Sat, 17 Oct 2026 03:18:55 +0000
Message-ID: <20261017031856.2723986-3-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017031856.2723986-1-zongyao.bai@intel.com>
References: <20261017031856.2723986-1-zongyao.bai@intel.com>
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

Add xe_force_wake_flush(), which cancels the delayed release work and
puts the domains it was holding to sleep. Use it, through a scoped class
that flushes after the final put, in system suspend and runtime suspend,
before the device is powered off. Delayed release stays enabled for use
after resume.

Add xe_force_wake_stop(), which also disables the work for good. Use it
in GT shutdown, after the reset, and on device removal and
post-registration probe failure. A delayed put that finds the work
disabled puts the domain to sleep right away, so nothing is left awake
after the stop.

Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c           | 11 ++++++
 drivers/gpu/drm/xe/xe_force_wake.c       | 44 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_force_wake.h       | 18 ++++++++++
 drivers/gpu/drm/xe/xe_force_wake_types.h | 28 +++++++++++++++
 drivers/gpu/drm/xe/xe_gt.c               | 10 +++---
 5 files changed, 107 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6c214799b65b..15ba0158aae5 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -886,6 +886,15 @@ static void xe_uid_probe(struct xe_device *xe)
 		xe->device_uid = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), CRI_DEVICE_UID);
 }
 
+static void xe_device_force_wake_stop(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	u8 id;
+
+	for_each_gt(gt, xe, id)
+		xe_force_wake_stop(gt_to_fw(gt));
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -1117,6 +1126,7 @@ int xe_device_probe(struct xe_device *xe)
 err_unregister_display:
 	xe_display_unregister(xe);
 	drm_dev_unregister(&xe->drm);
+	xe_device_force_wake_stop(xe);
 
 	return err;
 }
@@ -1126,6 +1136,7 @@ void xe_device_remove(struct xe_device *xe)
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
+	xe_device_force_wake_stop(xe);
 
 	xe_bo_pci_dev_remove_all(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 71517bc4ffe6..8aaf52c5aec4 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -397,6 +397,50 @@ static void xe_force_wake_delayed_release_work(struct work_struct *work)
 	xe_force_wake_warn_sleep_fail(gt, ack_fail);
 }
 
+static void xe_force_wake_settle_delayed(struct xe_force_wake *fw)
+{
+	unsigned int ack_fail;
+	unsigned long flags;
+
+	spin_lock_irqsave(&fw->lock, flags);
+	ack_fail = xe_force_wake_sleep_locked(fw, fw->delayed_domains);
+	fw->delayed_domains = 0;
+	spin_unlock_irqrestore(&fw->lock, flags);
+
+	xe_force_wake_warn_sleep_fail(fw->gt, ack_fail);
+}
+
+/**
+ * xe_force_wake_flush - Put all delayed domains to sleep now
+ * @fw: Pointer to the force wake structure
+ *
+ * Cancel the pending delayed release and put the domains it was holding awake
+ * to sleep right away. Delayed release stays enabled, so it can be used again
+ * after resume.
+ *
+ * Used before powering the device off, once no forcewake reference is held
+ * and no new delayed release can start.
+ */
+void xe_force_wake_flush(struct xe_force_wake *fw)
+{
+	cancel_delayed_work_sync(&fw->delayed_release_work);
+	xe_force_wake_settle_delayed(fw);
+}
+
+/**
+ * xe_force_wake_stop - Stop delayed release for good
+ * @fw: Pointer to the force wake structure
+ *
+ * Like xe_force_wake_flush(), but also disable the delayed release work, so it
+ * cannot run again. Used on device removal and shutdown, once no forcewake
+ * user that may release with xe_force_wake_put_delay() is left.
+ */
+void xe_force_wake_stop(struct xe_force_wake *fw)
+{
+	disable_delayed_work_sync(&fw->delayed_release_work);
+	xe_force_wake_settle_delayed(fw);
+}
+
 const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id)
 {
 	switch (id) {
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 35a2252c762a..89cf8fbef8e4 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -19,6 +19,8 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 					    enum xe_force_wake_domains domains);
 void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
 void xe_force_wake_put_delay(struct xe_force_wake *fw, unsigned int fw_ref);
+void xe_force_wake_flush(struct xe_force_wake *fw);
+void xe_force_wake_stop(struct xe_force_wake *fw);
 
 const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id);
 
@@ -104,6 +106,22 @@ DEFINE_CLASS(xe_force_wake, struct xe_force_wake_ref,
 #define xe_with_force_wake(ref, fw, domains) \
 	__xe_with_force_wake(ref, fw, domains, __UNIQUE_ID(done))
 
+/*
+ * Same as the xe_force_wake class, but flush the delayed release after the
+ * domains are put. For paths that power the device off.
+ */
+static inline void xe_force_wake_put_and_flush(struct xe_force_wake *fw,
+					       unsigned int fw_ref)
+{
+	xe_force_wake_put(fw, fw_ref);
+	xe_force_wake_flush(fw);
+}
+
+DEFINE_CLASS(xe_force_wake_flush, struct xe_force_wake_ref,
+	     xe_force_wake_put_and_flush(_T.fw, _T.domains),
+	     xe_force_wake_constructor(fw, domains),
+	     struct xe_force_wake *fw, unsigned int domains);
+
 /*
  * Same as the xe_force_wake class, but the domains are released with
  * xe_force_wake_put_delay().
diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
index 5c16511c6f36..63e87ff9cad2 100644
--- a/drivers/gpu/drm/xe/xe_force_wake_types.h
+++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
@@ -99,6 +99,34 @@ struct xe_force_wake_domain {
  * Currently only used for GT power domains (where the term "forcewake" is used
  * in the hardware documentation), although the interface could be extended to
  * power wells in other parts of the hardware in the future.
+ *
+ * Delayed-release state flow of a domain, protected by @lock:
+ *
+ *  +------------+                                  +--------------+
+ *  |   ASLEEP   | ------- get: wake -------------> |  REFERENCED  |
+ *  |  ref == 0  | <------ final put: sleep ------- |   ref > 0    |
+ *  +------------+                                  +--------------+
+ *        ^                                           |         ^
+ *        |                         final put_delay   |         |
+ *        |                                           |         | get: reuse
+ *        |                                           |         | no MMIO
+ *        |                                           v         |
+ *        |                                         +--------------+
+ *        |                                         | DELAYED HOLD |
+ *        +---- worker after @hold_until, --------- |   ref == 0   |
+ *              or flush/stop: sleep                +--------------+
+ *                                                    |          ^
+ *                                                    |          |
+ *                                                    +----------+
+ *                                         worker before @hold_until: requeue
+ *
+ * Once @delayed_release_work has been disabled, a final put_delay behaves
+ * like a final put and DELAYED HOLD becomes unreachable.
+ *
+ * ASLEEP:       neither @awake_domains nor @delayed_domains has the domain.
+ * REFERENCED:   @awake_domains has the domain, @delayed_domains does not.
+ * DELAYED HOLD: both masks have the domain; @delayed_release_work is
+ *               pending. Each final put_delay moves @hold_until forward.
  */
 struct xe_force_wake {
 	/** @gt: back pointers to GT */
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 5ed96807fe34..a0a238f1a451 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -1025,7 +1025,7 @@ int xe_gt_suspend(struct xe_gt *gt)
 	xe_gt_dbg(gt, "suspending\n");
 	xe_gt_sanitize(gt);
 
-	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	CLASS(xe_force_wake_flush, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
 		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
 		return -ETIMEDOUT;
@@ -1048,8 +1048,10 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 void xe_gt_shutdown(struct xe_gt *gt)
 {
-	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	do_gt_reset(gt);
+	xe_with_force_wake(fw_ref, gt_to_fw(gt), XE_FORCEWAKE_ALL)
+		do_gt_reset(gt);
+
+	xe_force_wake_stop(gt_to_fw(gt));
 }
 
 /**
@@ -1104,7 +1106,7 @@ int xe_gt_runtime_suspend(struct xe_gt *gt)
 {
 	xe_gt_dbg(gt, "runtime suspending\n");
 
-	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	CLASS(xe_force_wake_flush, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
 		xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
 		return -ETIMEDOUT;
-- 
2.43.0

