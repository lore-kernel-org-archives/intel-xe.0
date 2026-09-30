Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87276CA5FC4
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 22:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413E710E295;
	Wed, 30 Sep 2026 22:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IduBNLeu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EADF10E24E
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 22:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790806105; x=1822342105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4lgwurRWecI7vpAHmaix0UG/G1nrCWC9oc7nbUTDiMk=;
 b=IduBNLeuA/I4gcsm1/eGbtzb0Ny4L3faDwAzI2cBguxKdVrZUsDtaTL/
 dPSYaJ5wAl67SgB2tJtQB6+rVTKhXFCLdoBzXr5RD7IecOtWdNQ7UY+az
 av2CRXIXE5VY2Q7lmHVkAACo4fPEQ5njGKcbfmUrh40ETk1FG6rCqdZ/7
 AqFoHrUg/ft/wmOMqY0ExDxJWP4+AaKptFdE00MSyaby6n5zaj4M/6buh
 kiN7yH9Lfofw52wFYR+M9UnIj2mZgBl+Fc4WPOtVcPYvSja4R4UsHtHw9
 NJLxeT51GvvRgw2wcEFzeyJAgY2tpMi3r24HOJDWgd4IdbfLTO/B5c83N w==;
X-CSE-ConnectionGUID: QXbFLy4AS+yUP9v6eMYBKg==
X-CSE-MsgGUID: XNg0P2WLTGKN6pnAnTuvsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="117084166"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="117084166"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 15:08:24 -0700
X-CSE-ConnectionGUID: DGM+TTidT7adO/Z558LQRg==
X-CSE-MsgGUID: IVTB/lN4QNmbyJrBHvPosw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="279607851"
Received: from cyp05.fm.intel.com ([10.36.55.41])
 by orviesa005.jf.intel.com with ESMTP; 30 Sep 2026 15:08:24 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jia.yao@intel.com, rodrigo.vivi@intel.com,
 Zongyao Bai <zongyao.bai@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v10 3/4] drm/xe/forcewake: quiesce delayed release across PM
 and teardown
Date: Wed, 30 Sep 2026 15:08:19 -0700
Message-ID: <20260930220820.2184643-4-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930220820.2184643-1-zongyao.bai@intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260930220820.2184643-1-zongyao.bai@intel.com>
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

Delayed-release timers access forcewake MMIO and must not remain active
across power transitions or device teardown.

- For system and runtime suspend, add xe_force_wake_flush() to cancel
  delayed-release timers, issue deferred sleep requests, and wait for
  pending sleep acknowledgments. Delayed release remains enabled after
  resume.

- For shutdown, removal, post-registration probe unwind, and devres
  teardown, add xe_force_wake_stop() to permanently disable new delayed
  releases before canceling timers and settling pending state. Normal
  forcewake get/put operations remain available afterwards. Register the
  device-wide stop action after the Driver-FLR action so reverse devres
  ordering settles delayed forcewake state while MMIO is still valid.
  Keep the per-GT cleanup as an idempotent fallback for earlier probe
  failures.

- For PCI error-recovery paths where MMIO may no longer reach the device,
  add xe_force_wake_stop_nosettle() to disable delayed release, cancel
  timers, and discard delayed-release bookkeeping without accessing MMIO.
  Use it before pci_disable_device() on reset and from error-recovery paths
  that return PCI_ERS_RESULT_DISCONNECT.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Assisted-by: LLM
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c           |  28 ++++
 drivers/gpu/drm/xe/xe_device.h           |   1 +
 drivers/gpu/drm/xe/xe_force_wake.c       | 177 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_force_wake.h       |  25 ++++
 drivers/gpu/drm/xe/xe_force_wake_types.h |  76 ++++++++++
 drivers/gpu/drm/xe/xe_gt.c               |  13 +-
 drivers/gpu/drm/xe/xe_pci_error.c        |  23 ++-
 7 files changed, 326 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e0e793fec4bf..38ec3da8cc74 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -631,6 +631,25 @@ static void xe_device_sanitize(void *arg)
 		xe_gt_sanitize(gt);
 }
 
+static void xe_device_force_wake_stop(void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_gt *gt;
+	u8 id;
+
+	for_each_gt(gt, xe, id)
+		xe_force_wake_stop(gt_to_fw(gt));
+}
+
+void xe_device_force_wake_stop_nosettle(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	u8 id;
+
+	for_each_gt(gt, xe, id)
+		xe_force_wake_stop_nosettle(gt_to_fw(gt));
+}
+
 static int xe_set_dma_info(struct xe_device *xe)
 {
 	unsigned int mask_size = xe->info.dma_mask_size;
@@ -934,6 +953,13 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	/*
+	 * Register after Driver-FLR so delayed forcewake release runs before FLR.
+	 */
+	err = devm_add_action_or_reset(xe->drm.dev, xe_device_force_wake_stop, xe);
+	if (err)
+		return err;
+
 	err = probe_has_flat_ccs(xe);
 	if (err)
 		return err;
@@ -1110,6 +1136,7 @@ int xe_device_probe(struct xe_device *xe)
 err_unregister_display:
 	xe_display_unregister(xe);
 	drm_dev_unplug(&xe->drm);
+	xe_device_force_wake_stop(xe);
 
 	return err;
 }
@@ -1119,6 +1146,7 @@ void xe_device_remove(struct xe_device *xe)
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
+	xe_device_force_wake_stop(xe);
 
 	xe_bo_pci_dev_remove_all(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 6d3d6d5eba29..443d489707dc 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -49,6 +49,7 @@ int xe_device_probe_early(struct xe_device *xe);
 int xe_device_probe(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
 void xe_device_shutdown(struct xe_device *xe);
+void xe_device_force_wake_stop_nosettle(struct xe_device *xe);
 
 void xe_device_wmb(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 3d2f66b93025..e58f24fd6667 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -52,14 +52,14 @@ static void init_domain(struct xe_force_wake *fw,
 	mark_domain_initialized(fw, id);
 }
 
+/*
+ * Covers probe failures before the device-wide stop action is registered.
+ * On later failures, that action runs before Driver-FLR, leaving this
+ * per-GT action as an idempotent fallback.
+ */
 static void xe_force_wake_fini(void *arg)
 {
-	struct xe_force_wake *fw = arg;
-	struct xe_force_wake_domain *domain;
-	unsigned int tmp;
-
-	for_each_fw_domain(domain, fw, tmp)
-		hrtimer_cancel(&domain->sleep_timer);
+	xe_force_wake_stop(arg);
 }
 
 int xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
@@ -207,7 +207,8 @@ static enum hrtimer_restart xe_force_wake_delayed_release_timer(struct hrtimer *
 	/*
 	 * Delayed release was disabled after this timer was armed. Leave the
 	 * domain state untouched: the caller that disabled delayed release
-	 * requests sleep and waits for its ACK.
+	 * requests sleep and waits for its ACK, or discards the state if the
+	 * device is no longer reachable.
 	 */
 	if (fw->delayed_release_disabled)
 		return HRTIMER_NORESTART;
@@ -381,7 +382,8 @@ static void __xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref,
  * @fw_ref: Result from xe_force_wake_get()
  *
  * Drops the referenced domains. The final put requests sleep and waits for
- * its ACK, unless a delayed release was previously recorded for the domain.
+ * its ACK, unless a delayed release was previously recorded for the domain
+ * and delayed release is still enabled.
  */
 void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
 {
@@ -399,12 +401,171 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
  *
  * If references remain, the delayed release is recorded and honored by the
  * put that releases the final reference.
+ *
+ * After xe_force_wake_stop() this behaves exactly like xe_force_wake_put():
+ * nothing is delayed and nothing is recorded.
  */
 void xe_force_wake_put_delay(struct xe_force_wake *fw, unsigned int fw_ref)
 {
 	__xe_force_wake_put(fw, fw_ref, true);
 }
 
+/*
+ * Settle the domains that are waiting to go to sleep: clear any recorded
+ * delayed-release request, request sleep for the domains still holding a
+ * delayed release with no reference left, and wait for every outstanding
+ * sleep acknowledgment. Returns the mask of domains that failed to ACK.
+ */
+static unsigned int __xe_force_wake_settle_delayed_release_locked(struct xe_force_wake *fw)
+{
+	struct xe_gt *gt = fw->gt;
+	struct xe_force_wake_domain *domain;
+	unsigned int tmp, sleep, ack_fail = 0;
+
+	lockdep_assert_held(&fw->lock);
+
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
+
+	return ack_fail;
+}
+
+/*
+ * Disable delayed release and cancel the armed timers. Disabling first
+ * ensures a put racing with this cannot arm a new timer behind the cancel
+ * loop. The timers are canceled outside fw->lock because their callbacks
+ * acquire it.
+ */
+static void __xe_force_wake_disable_delayed_release(struct xe_force_wake *fw)
+{
+	struct xe_force_wake_domain *domain;
+	unsigned long flags;
+	unsigned int tmp;
+
+	spin_lock_irqsave(&fw->lock, flags);
+	fw->delayed_release_disabled = true;
+	for_each_fw_domain(domain, fw, tmp)
+		domain->delayed_release_requested = false;
+	spin_unlock_irqrestore(&fw->lock, flags);
+
+	for_each_fw_domain(domain, fw, tmp)
+		hrtimer_cancel(&domain->sleep_timer);
+}
+
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
+ *
+ * Delayed release stays enabled afterwards. Use xe_force_wake_stop() on
+ * teardown paths, where a terminal effect is required.
+ */
+void xe_force_wake_flush(struct xe_force_wake *fw)
+{
+	struct xe_gt *gt = fw->gt;
+	struct xe_force_wake_domain *domain;
+	unsigned int tmp, ack_fail;
+	unsigned long flags;
+
+	for_each_fw_domain(domain, fw, tmp)
+		hrtimer_cancel(&domain->sleep_timer);
+
+	spin_lock_irqsave(&fw->lock, flags);
+	ack_fail = __xe_force_wake_settle_delayed_release_locked(fw);
+	spin_unlock_irqrestore(&fw->lock, flags);
+
+	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
+		   str_plural(hweight_long(ack_fail)), ack_fail);
+}
+
+/**
+ * xe_force_wake_stop - Disable delayed forcewake release and settle the domains
+ * @fw: Pointer to the force wake structure
+ *
+ * Permanently disables delayed release for @fw, cancels any armed timer and
+ * completes the pending sleep requests and ACK waits. Unlike
+ * xe_force_wake_flush(), the effect is terminal: once this returns no new
+ * delayed release can be armed or recorded, so a caller that has quiesced its
+ * forcewake users does not have to serialize against them afterwards.
+ *
+ * Only delayed release is disabled. Normal wake and sleep reference counting
+ * keeps working, so the caller may still use forcewake after this call.
+ *
+ * The function is idempotent, and accesses no MMIO when there is nothing left
+ * to settle.
+ */
+void xe_force_wake_stop(struct xe_force_wake *fw)
+{
+	struct xe_gt *gt = fw->gt;
+	unsigned long flags;
+	unsigned int ack_fail;
+
+	__xe_force_wake_disable_delayed_release(fw);
+
+	spin_lock_irqsave(&fw->lock, flags);
+	ack_fail = __xe_force_wake_settle_delayed_release_locked(fw);
+	spin_unlock_irqrestore(&fw->lock, flags);
+
+	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
+		   str_plural(hweight_long(ack_fail)), ack_fail);
+}
+
+/**
+ * xe_force_wake_stop_nosettle - Disable delayed forcewake release without MMIO
+ * @fw: Pointer to the force wake structure
+ *
+ * Same terminal effect as xe_force_wake_stop(), except that the pending
+ * delayed releases are discarded instead of being settled. No MMIO is
+ * accessed, so the hardware is left with whatever forcewake state it had.
+ *
+ * This is meant for callers that can no longer reach the device. Use
+ * xe_force_wake_stop() whenever MMIO is still meaningful.
+ *
+ * The function is idempotent, and may be called before or after
+ * xe_force_wake_stop().
+ */
+void xe_force_wake_stop_nosettle(struct xe_force_wake *fw)
+{
+	unsigned long flags;
+
+	__xe_force_wake_disable_delayed_release(fw);
+
+	/*
+	 * Drop the delayed-release bookkeeping. The reference counts and
+	 * @awake_domains are left alone: a user still holding a reference
+	 * keeps owning its domain.
+	 */
+	spin_lock_irqsave(&fw->lock, flags);
+	fw->delayed_release_domains = 0;
+	fw->sleep_ack_pending_domains = 0;
+	spin_unlock_irqrestore(&fw->lock, flags);
+}
+
 const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id)
 {
 	switch (id) {
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 8da675d8db0b..d099b615dae0 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -19,6 +19,25 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 					    enum xe_force_wake_domains domains);
 void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
 void xe_force_wake_put_delay(struct xe_force_wake *fw, unsigned int fw_ref);
+void xe_force_wake_flush(struct xe_force_wake *fw);
+void xe_force_wake_stop(struct xe_force_wake *fw);
+void xe_force_wake_stop_nosettle(struct xe_force_wake *fw);
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
 
@@ -93,6 +112,12 @@ DEFINE_CLASS(xe_force_wake, struct xe_force_wake_ref,
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
index b47f39de2436..b3b416a60db1 100644
--- a/drivers/gpu/drm/xe/xe_force_wake_types.h
+++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
@@ -123,6 +123,82 @@ struct xe_force_wake_domain {
  * ASLEEP:
  *   domain->ref == 0; neither delayed-release state mask nor @awake_domains
  *   contains the domain.
+ *
+ * ABANDONED:
+ *   domain->ref == 0; neither delayed-release state mask contains the
+ *   domain, but @awake_domains does.
+ *
+ * Lifetime operations:
+ *
+ * xe_force_wake_flush() drains delayed state and leaves delayed release
+ * enabled. xe_force_wake_stop() disables delayed release and drains delayed
+ * state. xe_force_wake_stop_nosettle() disables delayed release and discards
+ * delayed state without accessing the hardware.
+ *
+ * While delayed release is enabled (the initial state):
+ *
+ *                       final delayed put
+ *    +------------+ ----------------------> +---------------+
+ *    | REFERENCED |                         | DELAYED HOLD  |-----+-----+
+ *    | ref > 0    | <---------------------- | ref == 0      |     |     |
+ *    +------+-----+   get: cancel and reuse +-------+-------+     |     |
+ *           |                                       |             |     |
+ *           |                                timer expires        |     |
+ *  final immediate put                              |             |     |
+ *           |                                       v             |     |
+ *           |                              +---------------+      |     |
+ *           |                              | SLEEP SENT    |      |     |
+ *           |                              | ref == 0      |      |     |
+ *           |                              +--------+------+      |     |
+ *           |                                       |             |     |
+ *           v                                       |             |     |
+ *    +-------------+ <---wait for ACK (flush/stop)--+             |     |
+ *    | ASLEEP      |                                              |     |
+ *    | ref == 0    | <-----send sleep immediately, wait for ACK---+     |
+ *    +-------------+        - flush: suspend/runtime suspend            |
+ *                           - stop: shutdown/remove/probe unwind/devres |
+ *                                                                       |
+ *    +-------------+                                                    |
+ *    | ABANDONED   | <--------------------------------------------------+
+ *    | ref == 0    |  stop_nosettle: PCI AER reset/disconnect
+ *    +-------------+  discard without MMIO
+ *
+ * Once delayed release has been disabled (during shutdown, removal, probe
+ * unwind, devres teardown, or PCI reset/disconnect handling):
+ *
+ *                    final put: sleep, wait for ACK
+ *    +------------+ --------------------------> +-------------+
+ *    | REFERENCED |                             | ASLEEP      |
+ *    | ref > 0    | <-------------------------- | ref == 0    |
+ *    +------------+           get               +-------------+
+ *         ^
+ *         |  get: wake, wait for ACK
+ *         |
+ *    +-------------+
+ *    | ABANDONED   |
+ *    | ref == 0    |
+ *    +-------------+
+ *
+ * Disabling removes the only edge into DELAYED HOLD, so DELAYED HOLD and
+ * SLEEP SENT become unreachable afterwards. Domains already in either state
+ * are resolved once by the operation that disabled delayed release:
+ *
+ *   drain    DELAYED HOLD -> sleep, then wait for ACK -> ASLEEP
+ *            SLEEP SENT   -> wait for ACK             -> ASLEEP
+ *
+ *   discard  DELAYED HOLD -> ABANDONED
+ *            SLEEP SENT   -> ASLEEP, ACK never observed
+ *
+ * Draining is used while the hardware is reachable. Discarding drops the
+ * software state without MMIO when the hardware cannot be reached, so it may
+ * leave forcewake asserted until the device is reset.
+ *
+ * A get from SLEEP SENT first reconciles the sleep ACK, then wakes the
+ * domain and returns it to REFERENCED. While delayed release is enabled, a
+ * delayed put that is not the final put sets
+ * domain->delayed_release_requested, and the final put consumes that request
+ * and transitions the domain to DELAYED HOLD. A final put that does not take
+ * the delayed path clears any recorded request.
  */
 struct xe_force_wake {
 	/** @gt: back pointers to GT */
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 5ed96807fe34..cc2889aa2102 100644
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
@@ -1048,7 +1048,14 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 void xe_gt_shutdown(struct xe_gt *gt)
 {
-	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	CLASS(xe_force_wake_flush, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+
+	/*
+	 * Delayed release is disabled here so that no timer can outlive this
+	 * GT; normal forcewake is still required by do_gt_reset() below.
+	 */
+	xe_force_wake_stop(gt_to_fw(gt));
+
 	do_gt_reset(gt);
 }
 
@@ -1104,7 +1111,7 @@ int xe_gt_runtime_suspend(struct xe_gt *gt)
 {
 	xe_gt_dbg(gt, "runtime suspending\n");
 
-	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	CLASS(xe_force_wake_flush, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
 		xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
 		return -ETIMEDOUT;
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 79ce0c671549..701685aeaea9 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -33,11 +33,22 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
 	for_each_gt(gt, xe, id)
 		xe_gt_declare_wedged(gt);
 
+	xe_device_force_wake_stop_nosettle(xe);
+
 	pci_disable_device(pdev);
 }
 
+static pci_ers_result_t xe_pci_error_disconnect(struct xe_device *xe)
+{
+	xe_device_force_wake_stop_nosettle(xe);
+
+	return PCI_ERS_RESULT_DISCONNECT;
+}
+
 static pci_ers_result_t ras_action_to_pci_result(struct pci_dev *pdev, u8 action)
 {
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
 	switch (action) {
 	case XE_RAS_RECOVERY_ACTION_RECOVERED:
 		return PCI_ERS_RESULT_RECOVERED;
@@ -45,9 +56,9 @@ static pci_ers_result_t ras_action_to_pci_result(struct pci_dev *pdev, u8 action
 		prepare_device_for_reset(pdev);
 		return PCI_ERS_RESULT_NEED_RESET;
 	case XE_RAS_RECOVERY_ACTION_DISCONNECT:
-		return PCI_ERS_RESULT_DISCONNECT;
+		return xe_pci_error_disconnect(xe);
 	default:
-		return PCI_ERS_RESULT_DISCONNECT;
+		return xe_pci_error_disconnect(xe);
 	}
 }
 
@@ -58,11 +69,11 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
 	xe_info(xe, "PCI error: detected state = %d\n", state);
 
 	if (state == pci_channel_io_perm_failure)
-		return PCI_ERS_RESULT_DISCONNECT;
+		return xe_pci_error_disconnect(xe);
 
 	/* If the device is already wedged or in survivability mode, do not attempt recovery */
 	if (xe_survivability_mode_is_boot_enabled(xe) || xe_device_wedged(xe))
-		return PCI_ERS_RESULT_DISCONNECT;
+		return xe_pci_error_disconnect(xe);
 
 	switch (state) {
 	case pci_channel_io_normal:
@@ -72,7 +83,7 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
 		return PCI_ERS_RESULT_NEED_RESET;
 	default:
 		xe_info(xe, "PCI error: unknown state %d\n", state);
-		return PCI_ERS_RESULT_DISCONNECT;
+		return xe_pci_error_disconnect(xe);
 	}
 }
 
@@ -87,7 +98,7 @@ static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
 	/* User wants to debug the error, prevent reset */
 	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
 		xe_device_declare_wedged(xe);
-		return PCI_ERS_RESULT_DISCONNECT;
+		return xe_pci_error_disconnect(xe);
 	}
 
 	return ras_action_to_pci_result(pdev, action);
-- 
2.43.0

