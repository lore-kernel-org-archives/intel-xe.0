Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDA0CDB47F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 08:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE26710E19C;
	Thu, 25 Jun 2026 08:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRItmAO7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127EC10E19C
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 08:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782375564; x=1813911564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2radia4SPYXpTOkXxXaDdsIhR7KucmeQ9CMv4oqVW9U=;
 b=NRItmAO7CFWo0URklbMMb+wSxEXeVbjxXfJKuzVdcJhJKwW+JidCz9MK
 MxwtNqudnkJlkfKWqV8NjzfY81mO0PrPGCvUq6cAOE0PxAqGBcVGois7S
 T7buugk3AohE3L3VibuWjKZS4e9MSD2HiFAAnV8HGj1/MqmCF4yZh4Gqh
 El7Ud1c4TwNJUNKaNWSjVaU2rjL9cGhWYVNYvJnG9AykgT8qqX4daCIMi
 Z81X9G4vURg2IpVGBtQtHM5zL+PKcBN1Fh4Ih3V64J03bc8Q91Vz9pS8K
 /q+JVWX05g+tu2zERr6bUHkYbnIgOG+snahTeS9HU0Uo2CF7tjzeAP/+4 w==;
X-CSE-ConnectionGUID: pNXe0BJCQuWJ76pPP+M7EA==
X-CSE-MsgGUID: 8PXFXBYSRx+Xqi78Tr5Twg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="105940669"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="105940669"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 01:19:23 -0700
X-CSE-ConnectionGUID: E/LOfZrISaC89voQ3hEM+Q==
X-CSE-MsgGUID: 4zoE687pSsWrKFXy+elUHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="288565948"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa001.jf.intel.com with ESMTP; 25 Jun 2026 01:19:24 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jia.yao@intel.com, matthew.brost@intel.com,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v3] drm/xe/forcewake: add delayed-release optimization
Date: Thu, 25 Jun 2026 08:19:20 +0000
Message-ID: <20260625081920.3978174-1-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260601213804.707256-1-zongyao.bai@intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
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
 - Add domain sleep XE_FORCE_WAKE_HOLD_DELAY_US after xe_force_wake_put()
 - Skip MMIO wake in xe_force_wake_get() if domain still awake.
Reduces frequent wake/sleep cycles for back-to-back operations.
Examples of scenarios: zeDeviceGetGlobalTimestamps read by VTune, PTI

v2:
 - Add xe_force_wake_flush() and call it on the runtime/system
   suspend paths to ensure no deferred-sleep runs after GT power-off.
   (Sashiko)

v3:
 - Add configfs for XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US. (Matt)
 - Modify the default value of forcewake_hold_delay_us to 100. (Maarten)
 - Use guard(spinlock_irqsave) in the delayed-sleep timer callback. (Matt)
 - Drop the redundant refcount WARN in xe_force_wake_fini(). (Matt)
 - Document the spinlock protection of the timer_rearm / timer_domains
   fields, and reorder struct xe_force_wake_domain by member type. (Matt)

Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Assisted-by: GitHub-Copilot:claude-opus-4.8 #v2
Assisted-by: GitHub-Copilot:claude-opus-4.8 #v3
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c         |  67 +++++++++++
 drivers/gpu/drm/xe/xe_configfs.h         |   5 +
 drivers/gpu/drm/xe/xe_defaults.h         |   1 +
 drivers/gpu/drm/xe/xe_device.c           |   2 +
 drivers/gpu/drm/xe/xe_device_types.h     |   3 +
 drivers/gpu/drm/xe/xe_force_wake.c       | 135 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_force_wake.h       |  23 +++-
 drivers/gpu/drm/xe/xe_force_wake_types.h |  17 +++
 drivers/gpu/drm/xe/xe_gt.c               |  27 +++--
 9 files changed, 249 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 32102600a148..c17ec2e20992 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -237,6 +237,18 @@
  *
  * This setting only takes effect when probing the device.
  *
+ * Force wake hold delay:
+ * ----------------------
+ *
+ * Delay in microseconds before an idle forcewake domain is put to sleep after
+ * the last reference is dropped.  Keeping the domain awake for this short
+ * window lets rapid back-to-back accesses reuse a still-awake domain without
+ * paying the cost of a full wake + ACK cycle each time.  Example::
+ *
+ *	# echo 100 > /sys/kernel/config/xe/0000:03:00.0/forcewake_hold_delay_us
+ *
+ * This attribute can only be set before binding to the device.
+ *
  * Remove devices
  * ==============
  *
@@ -262,6 +274,7 @@ struct xe_config_group_device {
 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
 		bool survivability_mode;
 		bool enable_psmi;
+		u32 forcewake_hold_delay_us;
 		struct {
 			unsigned int max_vfs;
 			bool admin_only_pf;
@@ -281,6 +294,7 @@ static const struct xe_config_device device_defaults = {
 	.engines_allowed = U64_MAX,
 	.survivability_mode = false,
 	.enable_psmi = false,
+	.forcewake_hold_delay_us = XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US,
 	.sriov = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
@@ -575,6 +589,36 @@ static ssize_t enable_psmi_store(struct config_item *item, const char *page, siz
 	return len;
 }
 
+static ssize_t forcewake_hold_delay_us_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%u\n", dev->forcewake_hold_delay_us);
+}
+
+static ssize_t forcewake_hold_delay_us_store(struct config_item *item,
+					     const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	u32 val;
+	int ret;
+
+	ret = kstrtouint(page, 0, &val);
+	if (ret)
+		return ret;
+
+	if (!val)
+		return -EINVAL;
+
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
+	dev->config.forcewake_hold_delay_us = val;
+
+	return len;
+}
+
 static bool wa_bb_read_advance(bool dereference, char **p,
 			       const char *append, size_t len,
 			       size_t *max_size)
@@ -814,6 +858,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, engines_allowed);
+CONFIGFS_ATTR(, forcewake_hold_delay_us);
 CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, survivability_mode);
 
@@ -822,6 +867,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_ctx_restore_post_bb,
 	&attr_enable_psmi,
 	&attr_engines_allowed,
+	&attr_forcewake_hold_delay_us,
 	&attr_gt_types_allowed,
 	&attr_survivability_mode,
 	NULL,
@@ -1099,6 +1145,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
 	PRI_CUSTOM_ATTR("%d", survivability_mode);
+	PRI_CUSTOM_ATTR("%u", forcewake_hold_delay_us);
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
 #undef PRI_CUSTOM_ATTR
@@ -1225,6 +1272,26 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
 	return ret;
 }
 
+/**
+ * xe_configfs_get_forcewake_hold_delay_us - get configfs forcewake_hold_delay_us setting
+ * @pdev: pci device
+ *
+ * Return: forcewake_hold_delay_us setting in configfs
+ */
+u32 xe_configfs_get_forcewake_hold_delay_us(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	u32 ret;
+
+	if (!dev)
+		return device_defaults.forcewake_hold_delay_us;
+
+	ret = dev->config.forcewake_hold_delay_us;
+	config_group_put(&dev->group);
+
+	return ret;
+}
+
 /**
  * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
  * @pdev: pci device
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 07d62bf0c152..a54e9bba3208 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -23,6 +23,7 @@ bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
 bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
+u32 xe_configfs_get_forcewake_hold_delay_us(struct pci_dev *pdev);
 u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 				       enum xe_engine_class class,
 				       const u32 **cs);
@@ -42,6 +43,10 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return
 static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
+static inline u32 xe_configfs_get_forcewake_hold_delay_us(struct pci_dev *pdev)
+{
+	return XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US;
+}
 static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 						     enum xe_engine_class class,
 						     const u32 **cs) { return 0; }
diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
index c8ae1d5f3d60..3d8f57a54547 100644
--- a/drivers/gpu/drm/xe/xe_defaults.h
+++ b/drivers/gpu/drm/xe/xe_defaults.h
@@ -22,5 +22,6 @@
 #define XE_DEFAULT_WEDGED_MODE			XE_WEDGED_MODE_UPON_CRITICAL_ERROR
 #define XE_DEFAULT_WEDGED_MODE_STR		"upon-critical-error"
 #define XE_DEFAULT_SVM_NOTIFIER_SIZE		512
+#define XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US	100
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d224861b6f6f..75e8e4f7bc59 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -541,6 +541,8 @@ int xe_device_init_early(struct xe_device *xe)
 
 	xe->atomic_svm_timeslice_ms = 5;
 	xe->min_run_period_lr_ms = 5;
+	xe->forcewake_hold_delay_us =
+		xe_configfs_get_forcewake_hold_delay_us(to_pci_dev(xe->drm.dev));
 
 	err = xe_irq_init(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 32dd2ffbc796..a52e419be3c9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -524,6 +524,9 @@ struct xe_device {
 	/** @min_run_period_pf_ms: LR VM (page fault mode) timeslice */
 	u32 min_run_period_pf_ms;
 
+	/** @forcewake_hold_delay_us: Delayed forcewake release window in microseconds. */
+	u32 forcewake_hold_delay_us;
+
 #ifdef TEST_VM_OPS_ERROR
 	/**
 	 * @vm_inject_error_position: inject errors at different places in VM
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 197e2197bd0a..e91f2ffc8655 100644
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
+	hrtimer_setup(&domain->timer, xe_force_wake_domain_timer,
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
+		hrtimer_cancel(&domain->timer);
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
@@ -142,10 +164,34 @@ static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
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
+	struct xe_device *xe = gt_to_xe(gt);
+
+	xe_gt_assert(gt, !xe_pm_runtime_suspended(gt_to_xe(gt)));
+
+	guard(spinlock_irqsave)(&fw->lock);
+
+	if (!(fw->timer_domains & BIT(domain->id)) || domain->ref)
+		return HRTIMER_NORESTART;
+
+	if (domain->timer_rearm) {
+		domain->timer_rearm = false;
+		hrtimer_forward_now(timer,
+				    ns_to_ktime(xe->forcewake_hold_delay_us *
+						NSEC_PER_USEC));
+		return HRTIMER_RESTART;
+	}
+
+	fw->timer_domains &= ~BIT(domain->id);
+	domain_sleep(gt, domain);
+	fw->awake_domains &= ~BIT(domain->id);
+
+	return HRTIMER_NORESTART;
 }
 
 /**
@@ -187,8 +233,13 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
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
@@ -213,22 +264,23 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
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
+ * instead a hrtimer is armed for xe->forcewake_hold_delay_us so that a rapid
+ * xe_force_wake_get() can reuse the still-awake domain at zero MMIO cost.  On
+ * timer expiry, if the domain is still idle, the sleep request is written.
  */
 void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
 {
 	struct xe_gt *gt = fw->gt;
+	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_force_wake_domain *domain;
-	unsigned int tmp, sleep = 0;
+	unsigned int tmp;
 	unsigned long flags;
-	int ack_fail = 0;
 
 	/*
 	 * Avoid unnecessary lock and unlock when the function is called
@@ -245,20 +297,59 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
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
+					      ns_to_ktime(xe->forcewake_hold_delay_us *
+							  NSEC_PER_USEC),
+				      HRTIMER_MODE_REL);
+			}
 		}
 	}
-	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
-		if (domain_sleep_wait(gt, domain) == 0)
+	spin_unlock_irqrestore(&fw->lock, flags);
+}
+
+/**
+ * xe_force_wake_flush - Cancel pending delayed-sleep timers and settle domains
+ * @fw: Pointer to the force wake structure
+ *
+ * The delayed-release optimization in xe_force_wake_put() arms a short hrtimer
+ * instead of putting an idle domain to sleep immediately.  That deferred sleep
+ * performs MMIO and must not be allowed to run after the device has been
+ * powered down.  Callers on the runtime/system suspend path must therefore
+ * flush any outstanding timers once forcewake has been fully released, before
+ * the hardware is powered off.
+ *
+ * For every domain this cancels the pending timer (synchronously waiting for an
+ * in-flight callback to finish) and, if the domain is still idle with an
+ * outstanding deferred sleep, performs the sleep request right away so the
+ * domain is left in a consistent, fully-asleep state.  hrtimer_cancel() must be
+ * called without holding fw->lock, since the timer callback takes that same
+ * lock.
+ */
+void xe_force_wake_flush(struct xe_force_wake *fw)
+{
+	struct xe_gt *gt = fw->gt;
+	struct xe_force_wake_domain *domain;
+	unsigned int tmp;
+	unsigned long flags;
+
+	for_each_fw_domain(domain, fw, tmp)
+		hrtimer_cancel(&domain->timer);
+
+	spin_lock_irqsave(&fw->lock, flags);
+	for_each_fw_domain(domain, fw, tmp) {
+		domain->timer_rearm = false;
+		if ((fw->timer_domains & BIT(domain->id)) && !domain->ref) {
+			fw->timer_domains &= ~BIT(domain->id);
+			domain_sleep(gt, domain);
 			fw->awake_domains &= ~BIT(domain->id);
-		else
-			ack_fail |= BIT(domain->id);
+		}
 	}
 	spin_unlock_irqrestore(&fw->lock, flags);
-
-	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
-		   str_plural(hweight_long(ack_fail)), ack_fail);
 }
 
 const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id)
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index e2721f205d6c..1b6d5efead38 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -11,13 +11,32 @@
 
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
+void xe_force_wake_flush(struct xe_force_wake *fw);
+
+/**
+ * xe_force_wake_put_and_flush - Release forcewake and settle any deferred sleep
+ * @fw: Pointer to the force wake structure
+ * @fw_ref: return of xe_force_wake_get()
+ *
+ * Convenience helper for paths that must guarantee the domain is fully asleep
+ * before returning (typically right before the GT is powered off on
+ * runtime/system suspend). Because the flush has to run after the final put
+ * but before HW power-off, scope-based cleanup via CLASS(xe_force_wake, ...)
+ * cannot be used here.
+ */
+static inline void
+xe_force_wake_put_and_flush(struct xe_force_wake *fw, unsigned int fw_ref)
+{
+	xe_force_wake_put(fw, fw_ref);
+	xe_force_wake_flush(fw);
+}
 
 const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id);
 
diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
index 14b7b86e801b..14c256bd487e 100644
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
@@ -76,12 +79,21 @@ struct xe_force_wake_domain {
 	struct xe_reg reg_ctl;
 	/** @reg_ack: domain ack register address */
 	struct xe_reg reg_ack;
+	/** @timer: hrtimer for delayed sleep request */
+	struct hrtimer timer;
+	/** @fw_back: back pointer to parent xe_force_wake */
+	struct xe_force_wake *fw_back;
 	/** @val: domain wake write value */
 	u32 val;
 	/** @mask: domain mask */
 	u32 mask;
 	/** @ref: domain reference */
 	u32 ref;
+	/**
+	 * @timer_rearm: put() ran while callback was in-flight; callback must
+	 * restart timer. Protected by @fw_back->lock.
+	 */
+	bool timer_rearm;
 };
 
 /**
@@ -101,6 +113,11 @@ struct xe_force_wake {
 	spinlock_t lock;
 	/** @awake_domains: mask of all domains awake */
 	unsigned int awake_domains;
+	/**
+	 * @timer_domains: mask of domains with an outstanding delayed-sleep
+	 * timer. Protected by @lock.
+	 */
+	unsigned int timer_domains;
 	/** @initialized_domains: mask of all initialized domains */
 	unsigned int initialized_domains;
 	/** @domains: force wake domains */
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 783eb6d631b5..fdae8333fefc 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -511,7 +511,10 @@ int xe_gt_init_early(struct xe_gt *gt)
 
 	xe_wa_process_gt_oob(gt);
 
-	xe_force_wake_init_gt(gt, gt_to_fw(gt));
+	err = xe_force_wake_init_gt(gt, gt_to_fw(gt));
+	if (err)
+		return err;
+
 	spin_lock_init(&gt->global_invl_lock);
 
 	err = xe_gt_tlb_inval_init_early(gt);
@@ -998,13 +1001,15 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
 
 int xe_gt_suspend(struct xe_gt *gt)
 {
+	unsigned int fw_ref;
 	int err;
 
 	xe_gt_dbg(gt, "suspending\n");
 	xe_gt_sanitize(gt);
 
-	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
 		return -ETIMEDOUT;
 	}
@@ -1012,7 +1017,7 @@ int xe_gt_suspend(struct xe_gt *gt)
 	err = xe_uc_suspend(&gt->uc);
 	if (err) {
 		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
-		return err;
+		goto err_force_wake;
 	}
 
 	xe_gt_idle_disable_pg(gt);
@@ -1021,7 +1026,10 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 	xe_gt_dbg(gt, "suspended\n");
 
-	return 0;
+err_force_wake:
+	xe_force_wake_put_and_flush(gt_to_fw(gt), fw_ref);
+
+	return err;
 }
 
 void xe_gt_shutdown(struct xe_gt *gt)
@@ -1080,10 +1088,13 @@ int xe_gt_resume(struct xe_gt *gt)
  */
 int xe_gt_runtime_suspend(struct xe_gt *gt)
 {
+	unsigned int fw_ref;
+
 	xe_gt_dbg(gt, "runtime suspending\n");
 
-	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 		xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
 		return -ETIMEDOUT;
 	}
@@ -1093,6 +1104,8 @@ int xe_gt_runtime_suspend(struct xe_gt *gt)
 
 	xe_gt_dbg(gt, "runtime suspended\n");
 
+	xe_force_wake_put_and_flush(gt_to_fw(gt), fw_ref);
+
 	return 0;
 }
 
-- 
2.43.0

