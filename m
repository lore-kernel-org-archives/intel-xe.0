Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EA5C5CFCF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 00:07:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E191410F153;
	Thu, 13 Aug 2026 00:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqvfxBNw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660E810E480
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 00:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786579619; x=1818115619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ylDlH6Vqgc8YwE4t8MUCERZPII70sgQecyZGGH0w+lQ=;
 b=QqvfxBNwp+rC8XkUYOucCuVe2fqe5y82BRMhb43cbNAW7UITg0xNp+CW
 BQDFmiSZsDzYQ3zQaW18YQ4uKFvY+G3wC5lv/uug7xeCsfcpdxEVBiCsl
 lf6KBDKhkWLdlFaO0AjVUzcY3Kp4x3j+v9MnxqTKPDqbVuNhA9kLbpczK
 SSLneVztFS2NcVvkC14cFXtuBym7P/69PwvLUBzO2Y6OdeZtOjWH9nRvL
 TBta9u6VNGnswAxr0T2kxGzn3xcWEuOvoHUKEDy0GoBo1w9e3dqSshfby
 V4u7N5OY0YZB0F4WqkcLxxQa8YQHHi+RJRxteTHMbdKy556GSCkshVZAv w==;
X-CSE-ConnectionGUID: NyWzE5tTTPail5AFYyXjhw==
X-CSE-MsgGUID: VkKwk5PKQcOtnBVZRi0O9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="89670930"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="89670930"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 17:06:58 -0700
X-CSE-ConnectionGUID: r0AdHj1STr2f2/+VpVtvcA==
X-CSE-MsgGUID: ynwJ9HIKSvyI7onD6GKqKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="302048064"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa001.jf.intel.com with ESMTP; 12 Aug 2026 17:06:58 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jia.yao@intel.com, matthew.brost@intel.com,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v5 2/4] drm/xe/forcewake: add delayed-release state machine
Date: Thu, 13 Aug 2026 00:06:52 +0000
Message-ID: <20260813000654.2712317-3-zongyao.bai@intel.com>
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

Add an opt-in forcewake release path that keeps an idle domain awake
for a short hold interval. A subsequent get can reuse the domain
without issuing another wake request or waiting for its ACK. Without a
recorded delayed-release request, normal puts release immediately.

If a delayed release is requested while other references remain,
whichever put drops the final reference honors that request.(Matt)

Use a per-domain hrtimer and state protected by the forcewake lock to
preserve a newer hold interval armed while an older timer callback is
running. Remember delayed-release requests while other references
remain, and reconcile timer-issued sleep acknowledgments before a
subsequent wake.(Sashiko, Matt)

Register a devm cleanup action to synchronously cancel the timers
before the forcewake state is destroyed.(Sashiko, Matt)

This patch provides only the infrastructure; no caller opts in yet.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Assisted-by: GitHub-Copilot:gpt-5.6-sol
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_defaults.h         |   1 +
 drivers/gpu/drm/xe/xe_device.c           |   2 +
 drivers/gpu/drm/xe/xe_device_types.h     |   3 +
 drivers/gpu/drm/xe/xe_force_wake.c       | 166 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_force_wake.h       |  23 +++-
 drivers/gpu/drm/xe/xe_force_wake_types.h |  26 +++-
 drivers/gpu/drm/xe/xe_gt.c               |   5 +-
 7 files changed, 204 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
index 0884224ef7c7..de009af8c77f 100644
--- a/drivers/gpu/drm/xe/xe_defaults.h
+++ b/drivers/gpu/drm/xe/xe_defaults.h
@@ -22,6 +22,7 @@
 #define XE_DEFAULT_WEDGED_MODE			XE_WEDGED_MODE_UPON_CRITICAL_ERROR
 #define XE_DEFAULT_WEDGED_MODE_STR		"upon-critical-error"
 #define XE_DEFAULT_SVM_NOTIFIER_SIZE		512
+#define XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US	100
 #define XE_DEFAULT_NUM_PF_WORK			2
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 81b31325e581..21d02809c3a4 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -552,6 +552,8 @@ int xe_device_init_early(struct xe_device *xe)
 
 	xe_device_parse_modparam(xe);
 
+	xe->forcewake_hold_delay_us = XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US;
+
 	err = xe_irq_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 180d450a6deb..4c16bb7e44bb 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -568,6 +568,9 @@ struct xe_device {
 	/** @min_run_period_pf_ms: LR VM (page fault mode) timeslice */
 	u32 min_run_period_pf_ms;
 
+	/** @forcewake_hold_delay_us: Delayed forcewake release window in microseconds. */
+	u32 forcewake_hold_delay_us;
+
 #ifdef TEST_VM_OPS_ERROR
 	/**
 	 * @vm_inject_error_position: inject errors at different places in VM
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 197e2197bd0a..3f5013c7424c 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -6,12 +6,17 @@
 #include "xe_force_wake.h"
 
 #include <drm/drm_util.h>
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/hrtimer.h>
 
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_reg_defs.h"
+#include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
 #include "xe_sriov.h"
 
 #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
@@ -27,6 +32,8 @@ static void mark_domain_initialized(struct xe_force_wake *fw,
 	fw->initialized_domains |= BIT(id);
 }
 
+static enum hrtimer_restart xe_force_wake_domain_timer(struct hrtimer *timer);
+
 static void init_domain(struct xe_force_wake *fw,
 			enum xe_force_wake_domain_id id,
 			struct xe_reg reg, struct xe_reg ack)
@@ -38,11 +45,24 @@ static void init_domain(struct xe_force_wake *fw,
 	domain->reg_ack = ack;
 	domain->val = FORCEWAKE_MT(FORCEWAKE_KERNEL);
 	domain->mask = FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL);
+	domain->fw_back = fw;
+	hrtimer_setup(&domain->sleep_timer, xe_force_wake_domain_timer,
+		      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 
 	mark_domain_initialized(fw, id);
 }
 
-void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
+static void xe_force_wake_fini(void *arg)
+{
+	struct xe_force_wake *fw = arg;
+	struct xe_force_wake_domain *domain;
+	unsigned int tmp;
+
+	for_each_fw_domain(domain, fw, tmp)
+		hrtimer_cancel(&domain->sleep_timer);
+}
+
+int xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
@@ -58,6 +78,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 			    FORCEWAKE_GT,
 			    FORCEWAKE_ACK_GT);
 	}
+
+	return devm_add_action_or_reset(xe->drm.dev, xe_force_wake_fini, fw);
 }
 
 void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
@@ -148,6 +170,59 @@ static int domain_sleep_wait(struct xe_gt *gt,
 	return __domain_wait(gt, domain, false);
 }
 
+static void assert_domain_state(struct xe_force_wake *fw,
+				struct xe_force_wake_domain *domain)
+{
+	unsigned int domain_mask = BIT(domain->id);
+
+	lockdep_assert_held(&fw->lock);
+	xe_gt_assert(fw->gt,
+		     !domain->delayed_release_requested || domain->ref);
+	xe_gt_assert(fw->gt,
+		     !(fw->delayed_release_domains & domain_mask) ||
+		     !domain->ref);
+	xe_gt_assert(fw->gt,
+		     !(fw->sleep_ack_pending_domains & domain_mask) ||
+		     !domain->ref);
+	xe_gt_assert(fw->gt,
+		     !(fw->sleep_ack_pending_domains & domain_mask) ||
+		     !(fw->awake_domains & domain_mask));
+	xe_gt_assert(fw->gt,
+		     !(fw->sleep_ack_pending_domains & domain_mask) ||
+		     !(fw->delayed_release_domains & domain_mask));
+}
+
+static enum hrtimer_restart xe_force_wake_domain_timer(struct hrtimer *timer)
+{
+	struct xe_force_wake_domain *domain =
+		container_of(timer, struct xe_force_wake_domain, sleep_timer);
+	struct xe_force_wake *fw = domain->fw_back;
+	struct xe_gt *gt = fw->gt;
+
+	xe_gt_assert(gt, !xe_pm_runtime_suspended(gt_to_xe(gt)));
+
+	guard(spinlock_irqsave)(&fw->lock);
+	assert_domain_state(fw, domain);
+
+	if (!(fw->delayed_release_domains & BIT(domain->id)) || domain->ref)
+		return HRTIMER_NORESTART;
+
+	/*
+	 * The core dequeues an expiring timer before invoking its callback, so
+	 * a queued timer here is a newer hold interval armed by put().
+	 */
+	if (hrtimer_is_queued(timer))
+		return HRTIMER_NORESTART;
+
+	fw->delayed_release_domains &= ~BIT(domain->id);
+	fw->sleep_ack_pending_domains |= BIT(domain->id);
+	domain_sleep(gt, domain);
+	fw->awake_domains &= ~BIT(domain->id);
+	assert_domain_state(fw, domain);
+
+	return HRTIMER_NORESTART;
+}
+
 /**
  * xe_force_wake_get() : Increase the domain refcount
  * @fw: struct xe_force_wake
@@ -176,6 +251,7 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
 	unsigned int ref_incr = 0, awake_rqst = 0, awake_failed = 0;
+	unsigned int sleep_failed = 0;
 	unsigned int tmp, ref_rqst;
 	unsigned long flags;
 
@@ -186,11 +262,29 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 	ref_rqst = (domains == XE_FORCEWAKE_ALL) ? fw->initialized_domains : domains;
 	spin_lock_irqsave(&fw->lock, flags);
 	for_each_fw_domain_masked(domain, ref_rqst, fw, tmp) {
+		assert_domain_state(fw, domain);
 		if (!domain->ref++) {
-			awake_rqst |= BIT(domain->id);
-			domain_wake(gt, domain);
+			if (fw->sleep_ack_pending_domains & BIT(domain->id)) {
+				if (domain_sleep_wait(gt, domain))
+					sleep_failed |= BIT(domain->id);
+				fw->sleep_ack_pending_domains &= ~BIT(domain->id);
+				awake_rqst |= BIT(domain->id);
+				domain_wake(gt, domain);
+			} else if ((fw->awake_domains & BIT(domain->id)) &&
+				   (fw->delayed_release_domains & BIT(domain->id))) {
+				fw->delayed_release_domains &= ~BIT(domain->id);
+				/*
+				 * A running callback will re-check the cleared bit and
+				 * nonzero reference under fw->lock before issuing sleep.
+				 */
+				hrtimer_try_to_cancel(&domain->sleep_timer);
+			} else {
+				awake_rqst |= BIT(domain->id);
+				domain_wake(gt, domain);
+			}
 		}
 		ref_incr |= BIT(domain->id);
+		assert_domain_state(fw, domain);
 	}
 	for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
 		if (domain_wake_wait(gt, domain) == 0) {
@@ -203,6 +297,9 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 	ref_incr &= ~awake_failed;
 	spin_unlock_irqrestore(&fw->lock, flags);
 
+	xe_gt_WARN(gt, sleep_failed,
+		   "Forcewake domain%s %#x failed to acknowledge pending sleep request\n",
+		   str_plural(hweight_long(sleep_failed)), sleep_failed);
 	xe_gt_WARN(gt, awake_failed, "Forcewake domain%s %#x failed to acknowledge awake request\n",
 		   str_plural(hweight_long(awake_failed)), awake_failed);
 
@@ -212,23 +309,14 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 	return ref_incr;
 }
 
-/**
- * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
- * @fw: Pointer to the force wake structure
- * @fw_ref: return of xe_force_wake_get()
- *
- * This function reduces the reference counts for domains in fw_ref. If
- * refcount for any of the specified domain reaches 0, it puts the domain to sleep
- * and waits for acknowledgment for domain to sleep within 50 milisec timeout.
- * Warns in case of timeout of ack from domain.
- */
-void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
+static void __xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref,
+				bool delayed_release)
 {
 	struct xe_gt *gt = fw->gt;
+	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_force_wake_domain *domain;
-	unsigned int tmp, sleep = 0;
+	unsigned int tmp, sleep = 0, ack_fail = 0;
 	unsigned long flags;
-	int ack_fail = 0;
 
 	/*
 	 * Avoid unnecessary lock and unlock when the function is called
@@ -242,12 +330,24 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
 
 	spin_lock_irqsave(&fw->lock, flags);
 	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
+		assert_domain_state(fw, domain);
 		xe_gt_assert(gt, domain->ref);
 
 		if (!--domain->ref) {
-			sleep |= BIT(domain->id);
-			domain_sleep(gt, domain);
+			if (delayed_release || domain->delayed_release_requested) {
+				domain->delayed_release_requested = false;
+				fw->delayed_release_domains |= BIT(domain->id);
+				hrtimer_start(&domain->sleep_timer,
+					      us_to_ktime(xe->forcewake_hold_delay_us),
+					      HRTIMER_MODE_REL);
+			} else {
+				sleep |= BIT(domain->id);
+				domain_sleep(gt, domain);
+			}
+		} else if (delayed_release) {
+			domain->delayed_release_requested = true;
 		}
+		assert_domain_state(fw, domain);
 	}
 	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
 		if (domain_sleep_wait(gt, domain) == 0)
@@ -261,6 +361,36 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
 		   str_plural(hweight_long(ack_fail)), ack_fail);
 }
 
+/**
+ * xe_force_wake_put - Release forcewake domains
+ * @fw: Pointer to the force wake structure
+ * @fw_ref: Result from xe_force_wake_get()
+ *
+ * Drops the referenced domains. The final put requests sleep and waits for
+ * its ACK, unless a delayed release was previously recorded for the domain.
+ */
+void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
+{
+	__xe_force_wake_put(fw, fw_ref, false);
+}
+
+/**
+ * xe_force_wake_put_delay - Release forcewake after a delay
+ * @fw: Pointer to the force wake structure
+ * @fw_ref: Result from xe_force_wake_get()
+ *
+ * Drops references like xe_force_wake_put(), but delays the sleep request
+ * when the final reference is released. A get before the timer expires reuses
+ * the awake domain without forcewake MMIO; otherwise the timer requests sleep.
+ *
+ * If references remain, the delayed release is recorded and honored by the
+ * put that releases the final reference.
+ */
+void xe_force_wake_put_delay(struct xe_force_wake *fw, unsigned int fw_ref)
+{
+	__xe_force_wake_put(fw, fw_ref, true);
+}
+
 const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id)
 {
 	switch (id) {
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index e2721f205d6c..8da675d8db0b 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -11,13 +11,14 @@
 
 struct xe_gt;
 
-void xe_force_wake_init_gt(struct xe_gt *gt,
-			   struct xe_force_wake *fw);
+int xe_force_wake_init_gt(struct xe_gt *gt,
+			  struct xe_force_wake *fw);
 void xe_force_wake_init_engines(struct xe_gt *gt,
 				struct xe_force_wake *fw);
 unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 					    enum xe_force_wake_domains domains);
 void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
+void xe_force_wake_put_delay(struct xe_force_wake *fw, unsigned int fw_ref);
 
 const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id);
 
@@ -103,6 +104,24 @@ DEFINE_CLASS(xe_force_wake, struct xe_force_wake_ref,
 #define xe_with_force_wake(ref, fw, domains) \
 	__xe_with_force_wake(ref, fw, domains, __UNIQUE_ID(done))
 
+/*
+ * Same as xe_with_force_wake(), but releases forcewake via
+ * xe_force_wake_put_delay() instead of xe_force_wake_put() on scope exit.
+ * Only use this for hot paths where the caller expects forcewake to be
+ * re-acquired again shortly.
+ */
+DEFINE_CLASS(xe_force_wake_delay, struct xe_force_wake_ref,
+	     xe_force_wake_put_delay(_T.fw, _T.domains),
+	     xe_force_wake_constructor(fw, domains),
+	     struct xe_force_wake *fw, unsigned int domains);
+
+#define __xe_with_force_wake_delay(ref, fw, domains, done) \
+	for (CLASS(xe_force_wake_delay, ref)(fw, domains), *(done) = NULL; \
+	     !(done); (done) = (void *)1)
+
+#define xe_with_force_wake_delay(ref, fw, domains) \
+	__xe_with_force_wake_delay(ref, fw, domains, __UNIQUE_ID(done))
+
 /*
  * Used when xe_force_wake_constructor() has already been called by another
  * function and the current function is responsible for releasing the forcewake
diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
index 14b7b86e801b..28c6f6dc87a3 100644
--- a/drivers/gpu/drm/xe/xe_force_wake_types.h
+++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_FORCE_WAKE_TYPES_H_
 #define _XE_FORCE_WAKE_TYPES_H_
 
+#include <linux/hrtimer.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
 
@@ -51,6 +52,8 @@ enum xe_force_wake_domains {
 	XE_FORCEWAKE_ALL	= BIT(XE_FW_DOMAIN_ID_COUNT)
 };
 
+struct xe_force_wake;
+
 /**
  * struct xe_force_wake_domain - Xe force wake power domain
  *
@@ -76,12 +79,23 @@ struct xe_force_wake_domain {
 	struct xe_reg reg_ctl;
 	/** @reg_ack: domain ack register address */
 	struct xe_reg reg_ack;
+	/** @sleep_timer: hrtimer for the delayed sleep request */
+	struct hrtimer sleep_timer;
+	/** @fw_back: back pointer to parent xe_force_wake */
+	struct xe_force_wake *fw_back;
 	/** @val: domain wake write value */
 	u32 val;
 	/** @mask: domain mask */
 	u32 mask;
-	/** @ref: domain reference */
+	/** @ref: domain reference, protected by @fw_back->lock */
 	u32 ref;
+	/**
+	 * @delayed_release_requested: xe_force_wake_put_delay() was called
+	 * while the domain still had other references held; whichever call
+	 * drops the last reference must honor the delayed-release request.
+	 * Protected by @fw_back->lock.
+	 */
+	bool delayed_release_requested;
 };
 
 /**
@@ -101,6 +115,16 @@ struct xe_force_wake {
 	spinlock_t lock;
 	/** @awake_domains: mask of all domains awake */
 	unsigned int awake_domains;
+	/**
+	 * @delayed_release_domains: mask of domains in DELAYED HOLD.
+	 * Protected by @lock.
+	 */
+	unsigned int delayed_release_domains;
+	/**
+	 * @sleep_ack_pending_domains: mask of domains in SLEEP SENT.
+	 * Protected by @lock.
+	 */
+	unsigned int sleep_ack_pending_domains;
 	/** @initialized_domains: mask of all initialized domains */
 	unsigned int initialized_domains;
 	/** @domains: force wake domains */
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index dfdacc0f6de9..efe425dbcc85 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -512,7 +512,10 @@ int xe_gt_init_early(struct xe_gt *gt)
 
 	xe_wa_process_gt_oob(gt);
 
-	xe_force_wake_init_gt(gt, gt_to_fw(gt));
+	err = xe_force_wake_init_gt(gt, gt_to_fw(gt));
+	if (err)
+		return err;
+
 	spin_lock_init(&gt->global_invl_lock);
 
 	err = xe_gt_tlb_inval_init_early(gt);
-- 
2.43.0

