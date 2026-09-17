Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDA5C982D1
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 00:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7037410E363;
	Thu, 17 Sep 2026 00:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QzQWATBF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E5C10E363
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 00:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789603625; x=1821139625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ntz5xnUDMGBrfhlL4mCS49hogsYmh7Fgd9TLkR1ZGwM=;
 b=QzQWATBFM3S2Ai23CneKODZNoUTDTo2p/zBFTfvs8WvvxqqHjN+Yo9Ey
 MlutIbmQRMTASkvSuNMff81KHVIe66yvLvItDqkFC+unwoJcwB71Td7P3
 wskL56rVFgd7mwWABoTaBHWGB48SYaEHQU/VosK4/aqhxHuiijGsYtTRO
 9opcieUU/hMFiNydzD0ekJD8IP8UHR/vf0KmVunPZil3sDS3PQvfONXpn
 wVu7wQ33FdtX4+ZTG3Hgk99GsUzIlKSpbdNGt6+w7Yp0r9E96swzP+nv7
 XeVZamaFQvedxxfs6EV/u+aXdf9r6KYOME/emixqgmKez4zW+tnGfPWpE g==;
X-CSE-ConnectionGUID: p4izhz5bSq2SUOrgRPVxeA==
X-CSE-MsgGUID: maAmRQHKRf+8HbGuOISfAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101143921"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101143921"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 17:07:04 -0700
X-CSE-ConnectionGUID: TJROp6O+RTOkhLRGyKrO8A==
X-CSE-MsgGUID: pyJ088BOSTyfav5KQsueCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="267280400"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa009.fm.intel.com with ESMTP; 16 Sep 2026 17:07:03 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jia.yao@intel.com, Zongyao Bai <zongyao.bai@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v6 2/4] drm/xe/forcewake: add delayed-release state machine
Date: Thu, 17 Sep 2026 00:06:59 +0000
Message-ID: <20260917000701.1751733-3-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917000701.1751733-1-zongyao.bai@intel.com>
References: <20260720221306.1173028-1-zongyao.bai@intel.com>
 <20260917000701.1751733-1-zongyao.bai@intel.com>
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

Provide an opt-in delayed-release mode for clients that perform bursty
MMIO access. After the final delayed put, keep the forcewake domain awake
for a hold interval. A get during that interval can reuse the awake domain
without another wake request or ACK wait. Existing forcewake users retain
immediate-release behavior.

Preserve a delayed-release request across overlapping references so that
the put dropping the final reference honors it. Ensure that timer expiry,
domain reuse, and a newer hold interval converge to a consistent domain
state before the next hardware access.

Model a terminal mode for teardown that prevents further delayed releases
without disabling normal forcewake get/put operations. Cleanup also waits
for delayed callbacks to finish before their storage can be released.

This patch only provides the mechanism; no caller opts into delayed
release yet.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Assisted-by: GitHub-Copilot:gpt-5.6-sol
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_defaults.h         |   1 +
 drivers/gpu/drm/xe/xe_device.c           |   2 +
 drivers/gpu/drm/xe/xe_device_types.h     |   3 +
 drivers/gpu/drm/xe/xe_force_wake.c       | 180 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_force_wake.h       |  23 ++-
 drivers/gpu/drm/xe/xe_force_wake_types.h |  47 ++++++
 drivers/gpu/drm/xe/xe_gt.c               |   5 +-
 7 files changed, 240 insertions(+), 21 deletions(-)

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
index 5e6dd4a97dc8..4bb7719e5251 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -471,6 +471,8 @@ int xe_device_init_early(struct xe_device *xe)
 
 	xe_device_parse_modparam(xe);
 
+	xe->forcewake_hold_delay_us = XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US;
+
 	err = xe_irq_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4661bfce2f4e..4cf184150292 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -575,6 +575,9 @@ struct xe_device {
 	/** @min_run_period_pf_ms: LR VM (page fault mode) timeslice */
 	u32 min_run_period_pf_ms;
 
+	/** @forcewake_hold_delay_us: Delayed forcewake release window in microseconds. */
+	u32 forcewake_hold_delay_us;
+
 #ifdef TEST_VM_OPS_ERROR
 	/**
 	 * @vm_inject_error_position: inject errors at different places in VM
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 197e2197bd0a..3d2f66b93025 100644
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
 
+static enum hrtimer_restart xe_force_wake_delayed_release_timer(struct hrtimer *timer);
+
 static void init_domain(struct xe_force_wake *fw,
 			enum xe_force_wake_domain_id id,
 			struct xe_reg reg, struct xe_reg ack)
@@ -38,11 +45,24 @@ static void init_domain(struct xe_force_wake *fw,
 	domain->reg_ack = ack;
 	domain->val = FORCEWAKE_MT(FORCEWAKE_KERNEL);
 	domain->mask = FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL);
+	domain->fw_back = fw;
+	hrtimer_setup(&domain->sleep_timer, xe_force_wake_delayed_release_timer,
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
@@ -148,6 +170,65 @@ static int domain_sleep_wait(struct xe_gt *gt,
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
+static enum hrtimer_restart xe_force_wake_delayed_release_timer(struct hrtimer *timer)
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
+	/*
+	 * Delayed release was disabled after this timer was armed. Leave the
+	 * domain state untouched: the caller that disabled delayed release
+	 * requests sleep and waits for its ACK.
+	 */
+	if (fw->delayed_release_disabled)
+		return HRTIMER_NORESTART;
+
+	/*
+	 * Ignore an obsolete callback: the domain was reused, its delayed hold was
+	 * canceled, or a newer hold interval is queued.
+	 */
+	if (!(fw->delayed_release_domains & BIT(domain->id)) || domain->ref ||
+	    hrtimer_is_queued(timer))
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
@@ -176,6 +257,7 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
 	unsigned int ref_incr = 0, awake_rqst = 0, awake_failed = 0;
+	unsigned int sleep_failed = 0;
 	unsigned int tmp, ref_rqst;
 	unsigned long flags;
 
@@ -186,11 +268,29 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
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
@@ -203,6 +303,9 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 	ref_incr &= ~awake_failed;
 	spin_unlock_irqrestore(&fw->lock, flags);
 
+	xe_gt_WARN(gt, sleep_failed,
+		   "Forcewake domain%s %#x failed to acknowledge pending sleep request\n",
+		   str_plural(hweight_long(sleep_failed)), sleep_failed);
 	xe_gt_WARN(gt, awake_failed, "Forcewake domain%s %#x failed to acknowledge awake request\n",
 		   str_plural(hweight_long(awake_failed)), awake_failed);
 
@@ -212,23 +315,14 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
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
@@ -242,12 +336,32 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
 
 	spin_lock_irqsave(&fw->lock, flags);
 	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
+		assert_domain_state(fw, domain);
 		xe_gt_assert(gt, domain->ref);
 
 		if (!--domain->ref) {
-			sleep |= BIT(domain->id);
-			domain_sleep(gt, domain);
+			if (!fw->delayed_release_disabled &&
+			    (delayed_release || domain->delayed_release_requested)) {
+				domain->delayed_release_requested = false;
+				fw->delayed_release_domains |= BIT(domain->id);
+				hrtimer_start(&domain->sleep_timer,
+					      us_to_ktime(xe->forcewake_hold_delay_us),
+					      HRTIMER_MODE_REL);
+			} else {
+				/*
+				 * Drop any recorded request: the domain is
+				 * going to sleep now, and a request that
+				 * outlived its last reference would break the
+				 * state invariants.
+				 */
+				domain->delayed_release_requested = false;
+				sleep |= BIT(domain->id);
+				domain_sleep(gt, domain);
+			}
+		} else if (delayed_release && !fw->delayed_release_disabled) {
+			domain->delayed_release_requested = true;
 		}
+		assert_domain_state(fw, domain);
 	}
 	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
 		if (domain_sleep_wait(gt, domain) == 0)
@@ -261,6 +375,36 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
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
index 14b7b86e801b..b47f39de2436 100644
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
 	/** @ref: domain reference */
 	u32 ref;
+	/**
+	 * @delayed_release_requested: Records a xe_force_wake_put_delay() while
+	 * a reference is still held. The final put consumes this request and
+	 * delays the release, unless delayed release has been
+	 * disabled. Protected by @fw_back->lock.
+	 */
+	bool delayed_release_requested;
 };
 
 /**
@@ -93,6 +107,22 @@ struct xe_force_wake_domain {
  * Currently only used for GT power domains (where the term "forcewake" is used
  * in the hardware documentation), although the interface could be extended to
  * power wells in other parts of the hardware in the future.
+ *
+ * Delayed-release state representation, protected by @lock:
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
@@ -101,8 +131,25 @@ struct xe_force_wake {
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
+	/**
+	 * @delayed_release_disabled: set when delayed release has been
+	 * permanently disabled for this GT. Once set it is never cleared: no
+	 * new delayed release may be armed or recorded. Normal wake/sleep
+	 * reference counting is unaffected. Protected by @lock.
+	 */
+	bool delayed_release_disabled;
 	/** @domains: force wake domains */
 	struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
 };
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 775c826b68b4..5ed96807fe34 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -515,7 +515,10 @@ int xe_gt_init_early(struct xe_gt *gt)
 
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

