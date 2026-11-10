Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A48606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 22:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M9irWvNA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A5110E031;
	Tue, 10 Nov 2026 22:05:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6511310E031
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 22:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794348351; x=1825884351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EN817M4tdS6kaj0aeHqDjiNXyWKqAjQSRE0UdXeQZl8=;
 b=M9irWvNAAnm9l0t736AAqvpt86vK3h5Kquqt2CFyYHD+WQdwJSo6KkSz
 NuhwYXhIVd7WtsLV3tDWNtFj6UOYcc3WycwFRWmE/DJQuMTEetfj2NVBa
 lJrcSdjfl4VryRQlfZM02b7Pagac4hXv25nkExOONHOkDPvS5fpxoN5El
 Jv04V9UCQ2zaLKhaKmEdKiwUzHH8kNEm46u3mvw92X2vLk9Got0/KT5Lu
 zyp5TJJLuEZiExHJ1Td4jCCQVIRV6KBCN2sjmJ/DNvE8/RBoy/Y+8mE5N
 WXAkKORpmuVFGXzrjsc5VE5ksNZM+zzziLIWMBKnyg41W8ICdXow0QHkE g==;
X-CSE-ConnectionGUID: t2v3pfJrSTaZe/j52rtLiQ==
X-CSE-MsgGUID: zs7PYxfFR3CgHPfQ6DNMqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3136977"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3136977"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 14:05:45 -0800
X-CSE-ConnectionGUID: rOt99k0tTimqQO94xxCh5w==
X-CSE-MsgGUID: wTKljYWGSfOHK1LSVO0b3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8692277"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa007.fm.intel.com with ESMTP; 10 Nov 2026 14:05:44 -0800
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jia.yao@intel.com, rodrigo.vivi@intel.com,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v2 2/3] drm/xe/forcewake: flush delayed release at power and
 teardown boundaries
Date: Tue, 10 Nov 2026 22:05:41 +0000
Message-ID: <20261110220542.432595-3-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110220542.432595-1-zongyao.bai@intel.com>
References: <20261017031856.2723986-1-zongyao.bai@intel.com>
 <20261110220542.432595-1-zongyao.bai@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add xe_force_wake_flush(), which cancels the delayed release work and
puts the domains it was holding to sleep. Use it, through a scoped class
that flushes after the final put, in system suspend and runtime suspend,
before the device is powered off. Delayed release stays enabled for use
after resume.

Add xe_force_wake_stop(), which also disables the work for good. Use it
in GT shutdown, after the reset, and on device removal and
post-registration probe failure. A put_delay() after the stop puts the
domain to sleep right away, so nothing is left awake after the stop.

Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c           | 11 ++++++
 drivers/gpu/drm/xe/xe_force_wake.c       | 44 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_force_wake.h       | 18 ++++++++++
 drivers/gpu/drm/xe/xe_force_wake_types.h | 29 ++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.c               | 10 +++---
 5 files changed, 108 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 273e2c45fea9..f6d769900e43 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -897,6 +897,15 @@ static void xe_uid_probe(struct xe_device *xe)
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
@@ -1112,6 +1121,7 @@ int xe_device_probe(struct xe_device *xe)
 err_unregister_display:
 	xe_display_unregister(xe);
 	drm_dev_unregister(&xe->drm);
+	xe_device_force_wake_stop(xe);
 
 	return err;
 }
@@ -1121,6 +1131,7 @@ void xe_device_remove(struct xe_device *xe)
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
+	xe_device_force_wake_stop(xe);
 
 	xe_bo_pci_dev_remove_all(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index d09d138c1084..0a4c03a52b57 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -404,6 +404,50 @@ static void xe_force_wake_delayed_release_work(struct work_struct *work)
 	xe_pm_runtime_put(xe);
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
+ * Like xe_force_wake_flush(), but also disable delayed release, so it cannot
+ * start again. Used on device removal and shutdown, once no forcewake
+ * user that may release with xe_force_wake_put_delay() is left.
+ */
+void xe_force_wake_stop(struct xe_force_wake *fw)
+{
+	xe_force_wake_disable_delayed(fw);
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
index 95bcc9ec2d74..5ad289670319 100644
--- a/drivers/gpu/drm/xe/xe_force_wake_types.h
+++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
@@ -99,6 +99,35 @@ struct xe_force_wake_domain {
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
+ * Once @delayed_enabled is cleared, a final put_delay behaves like a final
+ * put and DELAYED HOLD becomes unreachable.
+ *
+ * ASLEEP:       neither @awake_domains nor @delayed_domains has the domain.
+ * REFERENCED:   @awake_domains has the domain, @delayed_domains does not.
+ * DELAYED HOLD: both masks have the domain; @delayed_release_work is
+ *               pending or running. Each final put_delay moves
+ *               @hold_until forward.
  */
 struct xe_force_wake {
 	/** @gt: back pointers to GT */
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 98c4464d9cd0..2be58bb09180 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -1008,7 +1008,7 @@ int xe_gt_suspend(struct xe_gt *gt)
 	xe_gt_dbg(gt, "suspending\n");
 	xe_gt_sanitize(gt);
 
-	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	CLASS(xe_force_wake_flush, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
 		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
 		return -ETIMEDOUT;
@@ -1031,8 +1031,10 @@ int xe_gt_suspend(struct xe_gt *gt)
 
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
@@ -1100,7 +1102,7 @@ int xe_gt_runtime_suspend(struct xe_gt *gt)
 {
 	xe_gt_dbg(gt, "runtime suspending\n");
 
-	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	CLASS(xe_force_wake_flush, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
 		xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
 		return -ETIMEDOUT;
-- 
2.43.0

