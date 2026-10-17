Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52ED0CCA463
	for <intel-xe@archiver.kernel.org>; Sat, 17 Oct 2026 03:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A5310E1F9;
	Sat, 17 Oct 2026 03:19:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891F510E1F9
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Oct 2026 03:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792207145; x=1823743145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KPwXTR0OY/2O7Ab5sHQcezklbRcyd21ngUHweqkKKng=;
 b=S5V67BgsNWAcUI8iOe/njHUL6HlWw7IVU3gTm7PlVdgyqGglBwfcL3So
 jeUo1VCUO2V3ZEUkznS9/hUVCLPgce6Hu2CNwy25WG3xKnF2JtmROZiIt
 uT+2DaECHevc0f65pt2Ra4gL+R9lGZISJXHgtz0J/07628mirID2LYUlV
 cLbd0fqHzByYOFEaHmplQTyyphQhCy+oJNbUYGwKwbCy5SxLWazhmqHar
 6rl5okI4nZ5c1KDVFdfNcN6PlauBlCkbrNErCW3tsjqz25ilNl2rQwx57
 QFEszsK0ZKelC9nH34cSf7Pp4r13oWUMqZQX/cRCeKftcMgkJ9JIvMGIY Q==;
X-CSE-ConnectionGUID: 88ly/6y8RQSpBVTtrB0DoQ==
X-CSE-MsgGUID: plGy7mjrSiGJQewcwPQgIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="982109"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="982109"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 20:18:59 -0700
X-CSE-ConnectionGUID: ENiDQK0xTUO7dwaYtJ8sAg==
X-CSE-MsgGUID: nU5tSO8/Rny7LlNqf/iAUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2556671"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa010.fm.intel.com with ESMTP; 16 Oct 2026 20:18:59 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH 1/3] drm/xe/forcewake: add delayed release with hysteresis
Date: Sat, 17 Oct 2026 03:18:54 +0000
Message-ID: <20261017031856.2723986-2-zongyao.bai@intel.com>
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

Add xe_force_wake_put_delay(), which keeps a domain awake for a short hold
time after its last reference is dropped instead of putting it to sleep
immediately. A xe_force_wake_get() within that time reuses the awake domain
without a wake request and ACK wait, which makes repeated short accesses
cheaper.

The domain is put to sleep from a delayed work, in process context, so
the sleep ACK can be waited for in the same way as a regular put. The work
sleeps only the domains whose hold time expired and which still have no
reference, and requeues itself for the rest. The hold time is a couple of
jiffies.

Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c       | 184 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_force_wake.h       |  21 ++-
 drivers/gpu/drm/xe/xe_force_wake_types.h |  14 ++
 drivers/gpu/drm/xe/xe_gt.c               |   5 +-
 4 files changed, 197 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 197e2197bd0a..71517bc4ffe6 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -6,16 +6,22 @@
 #include "xe_force_wake.h"
 
 #include <drm/drm_util.h>
+#include <linux/device.h>
+#include <linux/workqueue.h>
 
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_reg_defs.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
 #include "xe_sriov.h"
 
 #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
 
+/* Minimum hold of a delayed release, in jiffies. */
+#define XE_FORCE_WAKE_HOLD_JIFFIES	2
+
 static const char *str_wake_sleep(bool wake)
 {
 	return wake ? "wake" : "sleep";
@@ -42,12 +48,22 @@ static void init_domain(struct xe_force_wake *fw,
 	mark_domain_initialized(fw, id);
 }
 
-void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
+static void xe_force_wake_disable_work(void *arg)
+{
+	struct xe_force_wake *fw = arg;
+
+	disable_delayed_work_sync(&fw->delayed_release_work);
+}
+
+static void xe_force_wake_delayed_release_work(struct work_struct *work);
+
+int xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
 	fw->gt = gt;
 	spin_lock_init(&fw->lock);
+	INIT_DELAYED_WORK(&fw->delayed_release_work, xe_force_wake_delayed_release_work);
 
 	if (xe->info.graphics_verx100 >= 1270) {
 		init_domain(fw, XE_FW_DOMAIN_ID_GT,
@@ -58,6 +74,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 			    FORCEWAKE_GT,
 			    FORCEWAKE_ACK_GT);
 	}
+
+	return devm_add_action_or_reset(xe->drm.dev, xe_force_wake_disable_work, fw);
 }
 
 void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
@@ -187,8 +205,13 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 	spin_lock_irqsave(&fw->lock, flags);
 	for_each_fw_domain_masked(domain, ref_rqst, fw, tmp) {
 		if (!domain->ref++) {
-			awake_rqst |= BIT(domain->id);
-			domain_wake(gt, domain);
+			if (fw->delayed_domains & BIT(domain->id)) {
+				/* Still awake from a delayed release: reuse it. */
+				fw->delayed_domains &= ~BIT(domain->id);
+			} else {
+				awake_rqst |= BIT(domain->id);
+				domain_wake(gt, domain);
+			}
 		}
 		ref_incr |= BIT(domain->id);
 	}
@@ -212,23 +235,46 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
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
+/*
+ * Put the @mask domains to sleep and wait for the acknowledgment. Must be
+ * called with fw->lock held. Returns the mask of domains that failed to
+ * acknowledge.
  */
-void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
+static unsigned int xe_force_wake_sleep_locked(struct xe_force_wake *fw,
+					       unsigned int mask)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
-	unsigned int tmp, sleep = 0;
+	unsigned int tmp, ack_fail = 0;
+
+	lockdep_assert_held(&fw->lock);
+
+	for_each_fw_domain_masked(domain, mask, fw, tmp)
+		domain_sleep(gt, domain);
+
+	for_each_fw_domain_masked(domain, mask, fw, tmp) {
+		if (domain_sleep_wait(gt, domain) == 0)
+			fw->awake_domains &= ~BIT(domain->id);
+		else
+			ack_fail |= BIT(domain->id);
+	}
+
+	return ack_fail;
+}
+
+static void xe_force_wake_warn_sleep_fail(struct xe_gt *gt, unsigned int ack_fail)
+{
+	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
+		   str_plural(hweight_long(ack_fail)), ack_fail);
+}
+
+static void __xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref,
+				bool delayed)
+{
+	struct xe_gt *gt = fw->gt;
+	struct xe_force_wake_domain *domain;
+	unsigned int tmp, sleep = 0, ack_fail;
 	unsigned long flags;
-	int ack_fail = 0;
 
 	/*
 	 * Avoid unnecessary lock and unlock when the function is called
@@ -244,21 +290,111 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
 	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
 		xe_gt_assert(gt, domain->ref);
 
-		if (!--domain->ref) {
+		if (--domain->ref)
+			continue;
+
+		if (delayed) {
+			domain->hold_until = jiffies + XE_FORCE_WAKE_HOLD_JIFFIES;
+			fw->delayed_domains |= BIT(domain->id);
+			/*
+			 * queue_delayed_work() returns false both when the work
+			 * is already pending and when flush/stop has disabled
+			 * it. A pending worker releases the domain later, a
+			 * disabled one never will, so release it right away.
+			 *
+			 * If the worker starts and clears PENDING between the
+			 * two checks, it is misread as disabled and released
+			 * early. That is safe: the delayed bit is cleared
+			 * under fw->lock, so the worker does not see the
+			 * domain and does not sleep it again. Only this one
+			 * hold is lost.
+			 */
+			if (!queue_delayed_work(system_percpu_wq, &fw->delayed_release_work,
+						XE_FORCE_WAKE_HOLD_JIFFIES) &&
+			    !delayed_work_pending(&fw->delayed_release_work)) {
+				fw->delayed_domains &= ~BIT(domain->id);
+				sleep |= BIT(domain->id);
+			}
+		} else {
 			sleep |= BIT(domain->id);
-			domain_sleep(gt, domain);
 		}
 	}
-	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
-		if (domain_sleep_wait(gt, domain) == 0)
-			fw->awake_domains &= ~BIT(domain->id);
-		else
-			ack_fail |= BIT(domain->id);
+	ack_fail = xe_force_wake_sleep_locked(fw, sleep);
+	spin_unlock_irqrestore(&fw->lock, flags);
+
+	xe_force_wake_warn_sleep_fail(gt, ack_fail);
+}
+
+/**
+ * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
+ * @fw: Pointer to the force wake structure
+ * @fw_ref: return of xe_force_wake_get()
+ *
+ * This function reduces the reference counts for domains in fw_ref. If
+ * refcount for any of the specified domain reaches 0, it puts the domain to sleep
+ * and waits for acknowledgment for domain to sleep within 50 milisec timeout.
+ * Warns in case of timeout of ack from domain.
+ */
+void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
+{
+	__xe_force_wake_put(fw, fw_ref, false);
+}
+
+/**
+ * xe_force_wake_put_delay - Decrement the refcount, delaying the sleep request
+ * @fw: Pointer to the force wake structure
+ * @fw_ref: return of xe_force_wake_get()
+ *
+ * Like xe_force_wake_put(), but a domain whose refcount reaches 0 is kept
+ * awake for a short hold time instead of being put to sleep right away. An
+ * xe_force_wake_get() during that time reuses the awake domain without a
+ * wake request, which makes repeated short accesses cheaper. The domain is
+ * put to sleep by a worker once the hold time expires without a new user.
+ *
+ * Meant for opt-in hot paths that are expected to be repeated shortly after.
+ */
+void xe_force_wake_put_delay(struct xe_force_wake *fw, unsigned int fw_ref)
+{
+	__xe_force_wake_put(fw, fw_ref, true);
+}
+
+/*
+ * Put the delayed domains whose hold time expired to sleep, and requeue for
+ * the remaining ones.
+ */
+static void xe_force_wake_delayed_release_work(struct work_struct *work)
+{
+	struct xe_force_wake *fw = container_of(to_delayed_work(work),
+						struct xe_force_wake, delayed_release_work);
+	struct xe_gt *gt = fw->gt;
+	struct xe_force_wake_domain *domain;
+	unsigned int tmp, expired = 0, ack_fail;
+	unsigned long flags, next = 0;
+	bool remaining = false;
+
+	xe_gt_assert(gt, !xe_pm_runtime_suspended(gt_to_xe(gt)));
+
+	spin_lock_irqsave(&fw->lock, flags);
+	for_each_fw_domain_masked(domain, fw->delayed_domains, fw, tmp) {
+		if (time_before(jiffies, domain->hold_until)) {
+			if (!remaining || time_before(domain->hold_until, next))
+				next = domain->hold_until;
+			remaining = true;
+			continue;
+		}
+
+		expired |= BIT(domain->id);
+		fw->delayed_domains &= ~BIT(domain->id);
 	}
+
+	ack_fail = xe_force_wake_sleep_locked(fw, expired);
+
+	if (remaining)
+		queue_delayed_work(system_percpu_wq, &fw->delayed_release_work,
+				   next - jiffies);
 	spin_unlock_irqrestore(&fw->lock, flags);
 
-	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
-		   str_plural(hweight_long(ack_fail)), ack_fail);
+	xe_force_wake_warn_sleep_fail(gt, ack_fail);
 }
 
 const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id)
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index e2721f205d6c..35a2252c762a 100644
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
 
@@ -103,6 +104,22 @@ DEFINE_CLASS(xe_force_wake, struct xe_force_wake_ref,
 #define xe_with_force_wake(ref, fw, domains) \
 	__xe_with_force_wake(ref, fw, domains, __UNIQUE_ID(done))
 
+/*
+ * Same as the xe_force_wake class, but the domains are released with
+ * xe_force_wake_put_delay().
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
index 14b7b86e801b..5c16511c6f36 100644
--- a/drivers/gpu/drm/xe/xe_force_wake_types.h
+++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 #include "regs/xe_reg_defs.h"
 
@@ -82,6 +83,11 @@ struct xe_force_wake_domain {
 	u32 mask;
 	/** @ref: domain reference */
 	u32 ref;
+	/**
+	 * @hold_until: jiffies value until which a delayed release keeps the
+	 * domain awake. Protected by &xe_force_wake.lock.
+	 */
+	unsigned long hold_until;
 };
 
 /**
@@ -101,6 +107,14 @@ struct xe_force_wake {
 	spinlock_t lock;
 	/** @awake_domains: mask of all domains awake */
 	unsigned int awake_domains;
+	/**
+	 * @delayed_domains: mask of unreferenced domains that are kept awake
+	 * until @delayed_release_work puts them to sleep. A subset of
+	 * @awake_domains.
+	 */
+	unsigned int delayed_domains;
+	/** @delayed_release_work: puts expired @delayed_domains to sleep */
+	struct delayed_work delayed_release_work;
 	/** @initialized_domains: mask of all initialized domains */
 	unsigned int initialized_domains;
 	/** @domains: force wake domains */
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

