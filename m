Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3915AC5CFDB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 00:07:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE9A10E474;
	Thu, 13 Aug 2026 00:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hPDcS015";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CC010F153
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 00:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786579619; x=1818115619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=swmzHtJxWd6suhsDEPWE7eudycSrowCtwx6P1CiyUOM=;
 b=hPDcS015LKIr2e5Sm6aqXCcYlzYe4RBbb06DfTQTVJFkhKeqJH+rnDxu
 +Fx+NGltYg6wiQzdaw4fTsjIYAvxZzJpLJ4BLu4NeCUK9kXZbMxOGWcDQ
 sZ3KdQPbHTt9oA+p4khpuW1yhCgY6LGqK06eL9iUnnyogBTdHmU7STSSY
 hvGZAJOscZ3Z4FVp1BtcPwUyP7Lo1GJIuiJh1ws/XyG76JIf7PYFaD7Ls
 CZ0e/F+riNOsBzgkBstAh8MP22XCcfvt2bCIRCwYJQbnam8K7jeZ0tM3U
 ljZfqnF9+s4yvzfRnKAgwYF1mQq+QyI8LS20UitneXeYu1HXno0hdDt7/ w==;
X-CSE-ConnectionGUID: AP6TEWIGRY2f+fB9nw7w0w==
X-CSE-MsgGUID: 0Rp8nJknR2C0UqkvSGhLsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="89670931"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="89670931"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 17:06:58 -0700
X-CSE-ConnectionGUID: x0+miZZxQOWeAvnbFHv/Ww==
X-CSE-MsgGUID: AI4/AK3GS8aD0GIWu7PB/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="302048067"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa001.jf.intel.com with ESMTP; 12 Aug 2026 17:06:58 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jia.yao@intel.com, matthew.brost@intel.com,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v5 3/4] drm/xe/forcewake: flush delayed release at power
 boundaries
Date: Thu, 13 Aug 2026 00:06:53 +0000
Message-ID: <20260813000654.2712317-4-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813000654.2712317-1-zongyao.bai@intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
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

Add a synchronous forcewake flush that cancels per-domain timers and
settles pending sleep acknowledgments. Provide a scoped cleanup class
so the final put is always followed by the flush before the caller
continues toward power-off.

Use it for system suspend, runtime suspend, and shutdown. After DRM
unplug has quiesced engine-cycle readers, flush every GT during remove
and post-registration probe unwind so delayed callbacks cannot cross
teardown or a later device FLR.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Assisted-by: GitHub-Copilot:gpt-5.6-sol
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c           | 11 ++++++
 drivers/gpu/drm/xe/xe_force_wake.c       | 49 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_force_wake.h       | 23 +++++++++++
 drivers/gpu/drm/xe/xe_force_wake_types.h | 42 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.c               |  7 ++--
 5 files changed, 129 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 21d02809c3a4..d69fd8236b0f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -711,6 +711,15 @@ static void xe_device_sanitize(void *arg)
 		xe_gt_sanitize(gt);
 }
 
+static void xe_device_force_wake_flush(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	u8 id;
+
+	for_each_gt(gt, xe, id)
+		xe_force_wake_flush(gt_to_fw(gt));
+}
+
 static int xe_set_dma_info(struct xe_device *xe)
 {
 	unsigned int mask_size = xe->info.dma_mask_size;
@@ -1169,6 +1178,7 @@ int xe_device_probe(struct xe_device *xe)
 err_unregister_display:
 	xe_display_unregister(xe);
 	drm_dev_unplug(&xe->drm);
+	xe_device_force_wake_flush(xe);
 
 	return err;
 }
@@ -1178,6 +1188,7 @@ void xe_device_remove(struct xe_device *xe)
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
+	xe_device_force_wake_flush(xe);
 
 	xe_bo_pci_dev_remove_all(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 3f5013c7424c..ef43899e1f7d 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -391,6 +391,55 @@ void xe_force_wake_put_delay(struct xe_force_wake *fw, unsigned int fw_ref)
 	__xe_force_wake_put(fw, fw_ref, true);
 }
 
+/**
+ * xe_force_wake_flush - Flush delayed forcewake releases
+ * @fw: Pointer to the force wake structure
+ *
+ * Synchronously cancels delayed-release timers and completes pending sleep
+ * requests and ACK waits. This must be called after the final forcewake put
+ * and before power-off because the timer callback accesses MMIO.
+ *
+ * The caller must ensure no forcewake reference outlives this call and
+ * serialize against new delayed releases or final puts that consume a
+ * recorded delayed-release request. Timers are canceled before taking
+ * fw->lock because their callbacks acquire the same lock.
+ */
+void xe_force_wake_flush(struct xe_force_wake *fw)
+{
+	struct xe_gt *gt = fw->gt;
+	struct xe_force_wake_domain *domain;
+	unsigned int tmp, sleep, ack_fail = 0;
+	unsigned long flags;
+
+	for_each_fw_domain(domain, fw, tmp)
+		hrtimer_cancel(&domain->sleep_timer);
+
+	spin_lock_irqsave(&fw->lock, flags);
+	sleep = fw->sleep_ack_pending_domains;
+	for_each_fw_domain(domain, fw, tmp) {
+		assert_domain_state(fw, domain);
+		domain->delayed_release_requested = false;
+		if ((fw->delayed_release_domains & BIT(domain->id)) &&
+		    !domain->ref) {
+			fw->delayed_release_domains &= ~BIT(domain->id);
+			sleep |= BIT(domain->id);
+			domain_sleep(gt, domain);
+		}
+		assert_domain_state(fw, domain);
+	}
+	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
+		fw->sleep_ack_pending_domains &= ~BIT(domain->id);
+		if (domain_sleep_wait(gt, domain) == 0)
+			fw->awake_domains &= ~BIT(domain->id);
+		else
+			ack_fail |= BIT(domain->id);
+	}
+	spin_unlock_irqrestore(&fw->lock, flags);
+
+	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
+		   str_plural(hweight_long(ack_fail)), ack_fail);
+}
+
 const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id)
 {
 	switch (id) {
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 8da675d8db0b..ac37a0177d7b 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -19,6 +19,23 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 					    enum xe_force_wake_domains domains);
 void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
 void xe_force_wake_put_delay(struct xe_force_wake *fw, unsigned int fw_ref);
+void xe_force_wake_flush(struct xe_force_wake *fw);
+
+/**
+ * xe_force_wake_put_and_flush - Release forcewake and flush deferred sleep
+ * @fw: Pointer to the force wake structure
+ * @fw_ref: return of xe_force_wake_get()
+ *
+ * Convenience helper for paths that must complete or cancel deferred-release
+ * work before powering off the GT. Sleep acknowledgment failures are reported
+ * by xe_force_wake_flush().
+ */
+static inline void
+xe_force_wake_put_and_flush(struct xe_force_wake *fw, unsigned int fw_ref)
+{
+	xe_force_wake_put(fw, fw_ref);
+	xe_force_wake_flush(fw);
+}
 
 const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id);
 
@@ -93,6 +110,12 @@ DEFINE_CLASS(xe_force_wake, struct xe_force_wake_ref,
 	     xe_force_wake_constructor(fw, domains),
 	     struct xe_force_wake *fw, unsigned int domains);
 
+/* Release forcewake and flush delayed-release work on scope exit. */
+DEFINE_CLASS(xe_force_wake_flush, struct xe_force_wake_ref,
+	     xe_force_wake_put_and_flush(_T.fw, _T.domains),
+	     xe_force_wake_constructor(fw, domains),
+	     struct xe_force_wake *fw, unsigned int domains);
+
 /*
  * Scoped helper for the forcewake class, using the same trick as scoped_guard()
  * to bind the lifetime to the next statement/block.
diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
index 28c6f6dc87a3..3f20f91b3a70 100644
--- a/drivers/gpu/drm/xe/xe_force_wake_types.h
+++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
@@ -107,6 +107,48 @@ struct xe_force_wake_domain {
  * Currently only used for GT power domains (where the term "forcewake" is used
  * in the hardware documentation), although the interface could be extended to
  * power wells in other parts of the hardware in the future.
+ *
+ * Delayed-release state flow, protected by @lock:
+ *
+ *                         final delayed put
+ *        +------------+ ----------------------> +---------------+
+ *        | REFERENCED |                         | DELAYED HOLD  |
+ *        | ref > 0    | <---------------------- | ref == 0      |
+ *        +------+-----+   get: cancel and reuse +-------+-------+
+ *               |                                      |
+ *               |                                      | timer expires
+ *      final immediate put                             v
+ *               |                              +---------------+
+ *               |                              | SLEEP SENT    |
+ *               |                              | ref == 0      |
+ *               |                              +-------+-------+
+ *               |                                      |
+ *               v                                      v
+ *        +-------------+ <------------------ flush: wait for ACK
+ *        | ASLEEP      |
+ *        | ref == 0    | <--- flush delayed hold
+ *        +-------------+
+ *
+ * A get from SLEEP SENT first reconciles the sleep ACK, then wakes the
+ * domain and returns it to REFERENCED. A delayed put that is not the final
+ * put sets domain->delayed_release_requested. The final put consumes that
+ * request and transitions the domain to DELAYED HOLD.
+ *
+ * Successful-path state representation at stable boundaries:
+ *
+ * REFERENCED:
+ *   domain->ref > 0; domain->delayed_release_requested may be set.
+ *
+ * DELAYED HOLD:
+ *   domain->ref == 0; @delayed_release_domains contains the domain.
+ *
+ * SLEEP SENT:
+ *   domain->ref == 0; @sleep_ack_pending_domains contains the domain and
+ *   @awake_domains does not.
+ *
+ * ASLEEP:
+ *   domain->ref == 0; neither delayed-release state mask nor @awake_domains
+ *   contains the domain.
  */
 struct xe_force_wake {
 	/** @gt: back pointers to GT */
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index efe425dbcc85..8e7c5f82d362 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -1013,7 +1013,7 @@ int xe_gt_suspend(struct xe_gt *gt)
 	xe_gt_dbg(gt, "suspending\n");
 	xe_gt_sanitize(gt);
 
-	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	CLASS(xe_force_wake_flush, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
 		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
 		return -ETIMEDOUT;
@@ -1036,7 +1036,8 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 void xe_gt_shutdown(struct xe_gt *gt)
 {
-	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	CLASS(xe_force_wake_flush, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+
 	do_gt_reset(gt);
 }
 
@@ -1092,7 +1093,7 @@ int xe_gt_runtime_suspend(struct xe_gt *gt)
 {
 	xe_gt_dbg(gt, "runtime suspending\n");
 
-	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	CLASS(xe_force_wake_flush, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
 		xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
 		return -ETIMEDOUT;
-- 
2.43.0

