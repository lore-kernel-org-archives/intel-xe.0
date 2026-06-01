Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA922CD6E55
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 21:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC2A10E9D8;
	Mon,  1 Jun 2026 21:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O1bMSVAZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3EA10E9D8
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 21:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780349887; x=1811885887;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6oeO2bJxBPJ1hHbKRVY/t+BnsjDYtYSLMfzKrdO/h9U=;
 b=O1bMSVAZzFhUsmulGnWHbDVw5PBUglqLNypW/JmGFeJgll/Rt80eX2BK
 JFDFUZzb9HOHLpar4VwK+a3yNVnLEMSLE9Z1Cr4AUENLJNmFF3YuCBcJU
 XY6zH7iqqsLUC6jRCj08G8XGmq434vw8jAO8QRsomOpRqqrElGoRU6qzg
 5PXzMkqT3CBgxuMMp5zT9+KLFJkpGbAtt+YJ+ELmJDfOWRtWMBvpM+hmY
 g+rJOdVPOIGNR53D0TCt0CpmpIhaeE+LON9qCOZugM4k9jonV8tymAJSw
 Z7CC9uBs7pgOWc8NCarnkKRCk4WAU99TYuKDHEo3ODPE/b2Is5mfMuySJ A==;
X-CSE-ConnectionGUID: viDeFn8hQzCd6TuUsrXhvw==
X-CSE-MsgGUID: /1IOzRO6Sb6bzcISB6bADQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="92230605"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="92230605"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 14:38:07 -0700
X-CSE-ConnectionGUID: WcHb6HUxT7KlvvyfXjziAw==
X-CSE-MsgGUID: rbwUT2RySouautAjN1LJaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="243797955"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa009.jf.intel.com with ESMTP; 01 Jun 2026 14:38:06 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jia.yao@intel.com,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH] drm/xe/forcewake: add delayed-release optimization
Date: Mon,  1 Jun 2026 21:38:04 +0000
Message-ID: <20260601213804.707256-1-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add delayed-release optimization:
    - Add domain sleep 200us after xe_force_wake_put()
    - Skip MMIO wake in xe_force_wake_get() if domain still awake.
Reduces frequent wake/sleep cycles for back-to-back operations.
Examples of scenarios: zeDeviceGetGlobalTimestamps read by VTune, PTI

Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c       | 111 +++++++++++++++++------
 drivers/gpu/drm/xe/xe_force_wake.h       |   4 +-
 drivers/gpu/drm/xe/xe_force_wake_types.h |  11 +++
 drivers/gpu/drm/xe/xe_gt.c               |   4 +-
 4 files changed, 99 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 197e2197bd0a..183a17fa6d68 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -6,15 +6,20 @@
 #include "xe_force_wake.h"
 
 #include <drm/drm_util.h>
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
+#define XE_FORCE_WAKE_HOLD_DELAY_US	200
 
 static const char *str_wake_sleep(bool wake)
 {
@@ -27,6 +32,8 @@ static void mark_domain_initialized(struct xe_force_wake *fw,
 	fw->initialized_domains |= BIT(id);
 }
 
+static enum hrtimer_restart xe_force_wake_domain_timer(struct hrtimer *timer);
+
 static void init_domain(struct xe_force_wake *fw,
 			enum xe_force_wake_domain_id id,
 			struct xe_reg reg, struct xe_reg ack)
@@ -38,11 +45,29 @@ static void init_domain(struct xe_force_wake *fw,
 	domain->reg_ack = ack;
 	domain->val = FORCEWAKE_MT(FORCEWAKE_KERNEL);
 	domain->mask = FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL);
+	domain->fw_back = fw;
+	hrtimer_setup(&domain->timer, xe_force_wake_domain_timer,
+		      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 
 	mark_domain_initialized(fw, id);
 }
 
-void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
+static void xe_force_wake_fini(void *arg)
+{
+	struct xe_force_wake *fw = arg;
+	struct xe_gt *gt = fw->gt;
+	struct xe_force_wake_domain *domain;
+	unsigned int tmp;
+
+	for_each_fw_domain(domain, fw, tmp) {
+		xe_gt_WARN(gt, domain->ref,
+			   "Forcewake domain %d still referenced (%u) at teardown\n",
+			   domain->id, domain->ref);
+		hrtimer_cancel(&domain->timer);
+	}
+}
+
+int xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
@@ -58,6 +83,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 			    FORCEWAKE_GT,
 			    FORCEWAKE_ACK_GT);
 	}
+
+	return devm_add_action_or_reset(xe->drm.dev, xe_force_wake_fini, fw);
 }
 
 void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
@@ -142,10 +169,36 @@ static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
 	__domain_ctl(gt, domain, false);
 }
 
-static int domain_sleep_wait(struct xe_gt *gt,
-			     struct xe_force_wake_domain *domain)
+static enum hrtimer_restart xe_force_wake_domain_timer(struct hrtimer *timer)
 {
-	return __domain_wait(gt, domain, false);
+	struct xe_force_wake_domain *domain =
+		container_of(timer, struct xe_force_wake_domain, timer);
+	struct xe_force_wake *fw = domain->fw_back;
+	struct xe_gt *gt = fw->gt;
+	unsigned long flags;
+
+	xe_gt_assert(gt, !xe_pm_runtime_suspended(gt_to_xe(gt)));
+
+	spin_lock_irqsave(&fw->lock, flags);
+
+	if (!(fw->timer_domains & BIT(domain->id)) || domain->ref) {
+		spin_unlock_irqrestore(&fw->lock, flags);
+		return HRTIMER_NORESTART;
+	}
+	if (domain->timer_rearm) {
+		domain->timer_rearm = false;
+		spin_unlock_irqrestore(&fw->lock, flags);
+		hrtimer_forward_now(timer,
+				    ns_to_ktime(XE_FORCE_WAKE_HOLD_DELAY_US *
+						NSEC_PER_USEC));
+		return HRTIMER_RESTART;
+	}
+	fw->timer_domains &= ~BIT(domain->id);
+	domain_sleep(gt, domain);
+	fw->awake_domains &= ~BIT(domain->id);
+	spin_unlock_irqrestore(&fw->lock, flags);
+
+	return HRTIMER_NORESTART;
 }
 
 /**
@@ -187,8 +240,13 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 	spin_lock_irqsave(&fw->lock, flags);
 	for_each_fw_domain_masked(domain, ref_rqst, fw, tmp) {
 		if (!domain->ref++) {
-			awake_rqst |= BIT(domain->id);
-			domain_wake(gt, domain);
+			if (fw->awake_domains & BIT(domain->id)) {
+				fw->timer_domains &= ~BIT(domain->id);
+				hrtimer_try_to_cancel(&domain->timer);
+			} else {
+				awake_rqst |= BIT(domain->id);
+				domain_wake(gt, domain);
+			}
 		}
 		ref_incr |= BIT(domain->id);
 	}
@@ -213,27 +271,25 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 }
 
 /**
- * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
+ * xe_force_wake_put - Decrement the refcount and arm the delayed-sleep timer
  * @fw: Pointer to the force wake structure
  * @fw_ref: return of xe_force_wake_get()
  *
- * This function reduces the reference counts for domains in fw_ref. If
- * refcount for any of the specified domain reaches 0, it puts the domain to sleep
- * and waits for acknowledgment for domain to sleep within 50 milisec timeout.
- * Warns in case of timeout of ack from domain.
+ * This function reduces the reference counts for domains in fw_ref.  When a
+ * domain's refcount reaches 0 the sleep request is not issued immediately;
+ * instead a hrtimer is armed for XE_FORCE_WAKE_HOLD_DELAY_US so that a rapid
+ * xe_force_wake_get() can reuse the still-awake domain at zero MMIO cost.  On
+ * timer expiry, if the domain is still idle, the sleep request is written.
+ * Mirroring i915's fw_domains_put(), the deferred sleep is fire-and-forget:
+ * no sleep ACK is polled, since the next wake re-waits for the wake ACK.
  */
 void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
-	unsigned int tmp, sleep = 0;
+	unsigned int tmp;
 	unsigned long flags;
-	int ack_fail = 0;
 
-	/*
-	 * Avoid unnecessary lock and unlock when the function is called
-	 * in error path of individual domains.
-	 */
 	if (!fw_ref)
 		return;
 
@@ -245,20 +301,19 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
 		xe_gt_assert(gt, domain->ref);
 
 		if (!--domain->ref) {
-			sleep |= BIT(domain->id);
-			domain_sleep(gt, domain);
+			fw->timer_domains |= BIT(domain->id);
+			if (hrtimer_callback_running(&domain->timer)) {
+				domain->timer_rearm = true;
+			} else {
+				domain->timer_rearm = false;
+				hrtimer_start(&domain->timer,
+					      ns_to_ktime(XE_FORCE_WAKE_HOLD_DELAY_US *
+							  NSEC_PER_USEC),
+				      HRTIMER_MODE_REL);
+			}
 		}
 	}
-	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
-		if (domain_sleep_wait(gt, domain) == 0)
-			fw->awake_domains &= ~BIT(domain->id);
-		else
-			ack_fail |= BIT(domain->id);
-	}
 	spin_unlock_irqrestore(&fw->lock, flags);
-
-	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
-		   str_plural(hweight_long(ack_fail)), ack_fail);
 }
 
 const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id)
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index e2721f205d6c..19679b923dca 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -11,8 +11,8 @@
 
 struct xe_gt;
 
-void xe_force_wake_init_gt(struct xe_gt *gt,
-			   struct xe_force_wake *fw);
+int xe_force_wake_init_gt(struct xe_gt *gt,
+			  struct xe_force_wake *fw);
 void xe_force_wake_init_engines(struct xe_gt *gt,
 				struct xe_force_wake *fw);
 unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
index 14b7b86e801b..ee5675069fe0 100644
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
@@ -82,6 +85,12 @@ struct xe_force_wake_domain {
 	u32 mask;
 	/** @ref: domain reference */
 	u32 ref;
+	/** @timer_rearm: put() ran while callback was in-flight; callback must restart timer */
+	bool timer_rearm;
+	/** @timer: hrtimer for delayed sleep request */
+	struct hrtimer timer;
+	/** @fw_back: back pointer to parent xe_force_wake */
+	struct xe_force_wake *fw_back;
 };
 
 /**
@@ -101,6 +110,8 @@ struct xe_force_wake {
 	spinlock_t lock;
 	/** @awake_domains: mask of all domains awake */
 	unsigned int awake_domains;
+	/** @timer_domains: mask of domains with an outstanding delayed-sleep timer */
+	unsigned int timer_domains;
 	/** @initialized_domains: mask of all initialized domains */
 	unsigned int initialized_domains;
 	/** @domains: force wake domains */
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 783eb6d631b5..43a79698cd04 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -511,7 +511,9 @@ int xe_gt_init_early(struct xe_gt *gt)
 
 	xe_wa_process_gt_oob(gt);
 
-	xe_force_wake_init_gt(gt, gt_to_fw(gt));
+	err = xe_force_wake_init_gt(gt, gt_to_fw(gt));
+	if (err)
+		return err;
 	spin_lock_init(&gt->global_invl_lock);
 
 	err = xe_gt_tlb_inval_init_early(gt);
-- 
2.43.0

