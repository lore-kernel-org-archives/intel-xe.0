Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C26F606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 00:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GDTxKXks
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC7C10EABD;
	Tue, 17 Nov 2026 00:28:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918E010F565
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 00:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794875306; x=1826411306;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4UpDKLIC1Z2pr+Homd+TJSn45vDtCzkzKYq3zV8hghg=;
 b=GDTxKXksbg6gP3Z8EjmLtioIr3lDccyo4YAJpFnfYEKpjGX/smLHudzI
 nNTdmKRL6myAXDrdjPJA8+XvZL+8uD5qAcH/Hglju0EN5QxeTL9quukr+
 j7vbgf5cmBcLRXeNR/bS6f4f6EvbELodCCc/XCqP3MMwpbIZYfisss//h
 E4LS7aBiJnW5amUKb/jkljsHCypXjyECB8QSQzdHb+7dxCG67sNVWh0aT
 YRkql9bjCNw4di9vihWSWEibmEnMFIgEwdN/QGoN/7uZNaowAwQw3YMul
 r4VPeKdn+9sjrtTjn2nSDGaOefO+O+PNp6tK4gsMht3ORxwO48oC9UkqC A==;
X-CSE-ConnectionGUID: wYuKik8XR+qXOx2+/lz0WQ==
X-CSE-MsgGUID: SxNeeHJWSpGOFWosBRWbDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3532375"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3532375"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 16:28:21 -0800
X-CSE-ConnectionGUID: BK4GYJ2IQ/WRBk6WTpWpHQ==
X-CSE-MsgGUID: ef8XWUDLS4y8V0gNPYu9Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; d="scan'208";a="10078966"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa007.fm.intel.com with ESMTP; 16 Nov 2026 16:28:21 -0800
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zongyao Bai <zongyao.bai@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 1/3] drm/xe/forcewake: add delayed release with hysteresis
Date: Tue, 17 Nov 2026 00:28:17 +0000
Message-ID: <20261117002819.535438-2-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117002819.535438-1-zongyao.bai@intel.com>
References: <20261017031856.2723986-1-zongyao.bai@intel.com>
 <20261117002819.535438-1-zongyao.bai@intel.com>
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

Add xe_force_wake_put_delay(), which keeps a domain awake for a short hold
time after its last reference is dropped instead of putting it to sleep
immediately. A xe_force_wake_get() within that time reuses the awake domain
without a wake request and ACK wait, which makes repeated short accesses
cheaper.

The domain is put to sleep from a delayed work, in process context, so
the sleep ACK can be waited for in the same way as a regular put. The work
sleeps only the domains whose hold time expired and which still have no
reference, and requeues itself for the rest. The hold time is 5 ms, but
never less than two jiffies. The work does not resume the device. If a
runtime suspend is in progress it retries later.

Delayed release can be disabled for good under the forcewake lock, after
which a put_delay() releases the domain right away.

Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c       | 201 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_force_wake.h       |  24 ++-
 drivers/gpu/drm/xe/xe_force_wake_types.h |  19 +++
 drivers/gpu/drm/xe/xe_gt.c               |   5 +-
 4 files changed, 221 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 197e2197bd0a..1b69e8e1e8eb 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -6,16 +6,29 @@
 #include "xe_force_wake.h"
 
 #include <drm/drm_util.h>
+#include <linux/device.h>
+#include <linux/pm_runtime.h>
+#include <linux/workqueue.h>
 
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_reg_defs.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
 #include "xe_sriov.h"
 
 #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
 
+/* Hold time of a delayed release. */
+#define XE_FORCE_WAKE_HOLD_MS		5
+
+/* Keep the hold at two jiffies or more, so it spans a full tick on any HZ. */
+static unsigned long xe_force_wake_hold_jiffies(unsigned int hold_ms)
+{
+	return max(msecs_to_jiffies(hold_ms), 2UL);
+}
+
 static const char *str_wake_sleep(bool wake)
 {
 	return wake ? "wake" : "sleep";
@@ -42,12 +55,33 @@ static void init_domain(struct xe_force_wake *fw,
 	mark_domain_initialized(fw, id);
 }
 
-void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
+static void xe_force_wake_disable_delayed(struct xe_force_wake *fw)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&fw->lock, flags);
+	fw->delayed_enabled = false;
+	spin_unlock_irqrestore(&fw->lock, flags);
+
+	/* Not under fw->lock, the worker takes it. */
+	disable_delayed_work_sync(&fw->delayed_release_work);
+}
+
+static void xe_force_wake_disable_work(void *arg)
+{
+	xe_force_wake_disable_delayed(arg);
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
+	fw->delayed_enabled = true;
 
 	if (xe->info.graphics_verx100 >= 1270) {
 		init_domain(fw, XE_FW_DOMAIN_ID_GT,
@@ -58,6 +92,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 			    FORCEWAKE_GT,
 			    FORCEWAKE_ACK_GT);
 	}
+
+	return devm_add_action_or_reset(xe->drm.dev, xe_force_wake_disable_work, fw);
 }
 
 void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
@@ -187,8 +223,13 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
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
@@ -212,23 +253,46 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
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
+				unsigned int hold_ms)
+{
+	struct xe_gt *gt = fw->gt;
+	struct xe_force_wake_domain *domain;
+	unsigned int tmp, sleep = 0, ack_fail;
 	unsigned long flags;
-	int ack_fail = 0;
 
 	/*
 	 * Avoid unnecessary lock and unlock when the function is called
@@ -244,21 +308,110 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
 	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
 		xe_gt_assert(gt, domain->ref);
 
-		if (!--domain->ref) {
+		if (--domain->ref)
+			continue;
+
+		if (hold_ms && fw->delayed_enabled) {
+			unsigned long hold = xe_force_wake_hold_jiffies(hold_ms);
+
+			domain->hold_until = jiffies + hold;
+			fw->delayed_domains |= BIT(domain->id);
+			/* No-op if pending, the worker requeues for the latest hold. */
+			queue_delayed_work(system_percpu_wq,
+					   &fw->delayed_release_work, hold);
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
+	__xe_force_wake_put(fw, fw_ref, 0);
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
+	__xe_force_wake_put(fw, fw_ref, XE_FORCE_WAKE_HOLD_MS);
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
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_force_wake_domain *domain;
+	unsigned int tmp, expired = 0, ack_fail;
+	unsigned long flags, next = 0;
+	bool remaining = false;
+	int rpm;
+
+	/*
+	 * Never resume from here. If a runtime suspend is in progress, retry
+	 * later. Without runtime PM the device stays powered.
+	 */
+	rpm = pm_runtime_get_if_active(xe->drm.dev);
+	if (!rpm) {
+		queue_delayed_work(system_percpu_wq, &fw->delayed_release_work,
+				   xe_force_wake_hold_jiffies(XE_FORCE_WAKE_HOLD_MS));
+		return;
+	}
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
+	if (rpm > 0)
+		xe_pm_runtime_put(xe);
 }
 
 const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id)
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index e2721f205d6c..fc504af9d219 100644
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
 
@@ -53,7 +54,8 @@ xe_force_wake_assert_held(struct xe_force_wake *fw,
 			  enum xe_force_wake_domains domain)
 {
 	xe_gt_assert(fw->gt, domain != XE_FORCEWAKE_ALL);
-	xe_gt_assert(fw->gt, fw->awake_domains & domain);
+	/* A domain in delayed release is awake but may sleep at any time. */
+	xe_gt_assert(fw->gt, fw->awake_domains & ~fw->delayed_domains & domain);
 }
 
 /**
@@ -103,6 +105,22 @@ DEFINE_CLASS(xe_force_wake, struct xe_force_wake_ref,
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
index 14b7b86e801b..95bcc9ec2d74 100644
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
@@ -101,6 +107,19 @@ struct xe_force_wake {
 	spinlock_t lock;
 	/** @awake_domains: mask of all domains awake */
 	unsigned int awake_domains;
+	/**
+	 * @delayed_domains: mask of unreferenced domains that are kept awake
+	 * until @delayed_release_work puts them to sleep. A subset of
+	 * @awake_domains.
+	 */
+	unsigned int delayed_domains;
+	/**
+	 * @delayed_enabled: whether xe_force_wake_put_delay() may keep a domain
+	 * awake. Protected by @lock.
+	 */
+	bool delayed_enabled;
+	/** @delayed_release_work: puts expired @delayed_domains to sleep */
+	struct delayed_work delayed_release_work;
 	/** @initialized_domains: mask of all initialized domains */
 	unsigned int initialized_domains;
 	/** @domains: force wake domains */
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b751b5044f3c..98c4464d9cd0 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -487,7 +487,10 @@ int xe_gt_init_early(struct xe_gt *gt)
 
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

