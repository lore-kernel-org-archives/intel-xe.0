Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A1C606A328
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 07:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mL9omUHm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DA910FA1C;
	Wed,  4 Nov 2026 07:49:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A884D10FA21
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 07:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793778562; x=1825314562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+zK0xroejS1d59yEW+k4E+pRR87FAcGBn6IlFv7oi+w=;
 b=mL9omUHm9R3KI7cjL6KbwPjzbgQqf8pd9uH+FLWz28+dFHsNcAqpn/FH
 NO3Yn9vY9CrB78lHxqZ3RdLD6KhzY5ZFMoXR06qVYqfIVfsMIn+k4tsw5
 neOc4Ldi7OAiqxHdtceYJsL7lrNhh3oT4F2z+7/gxFbmr+ZOqnZw4bB9o
 0Dyp0DRrgRkV7wLbYMR85EXa75xybUQCmM3+0iP9IY8PKiL/VZ1QaZQV1
 YpUqLQGlJm/iI0NI+X4mWOZvypFjVZZSa9aaPBjobKj0Xvj/nGJvaIqr0
 0iBDnGsHAzDOO4uQdRBXTD9XPxNepxSL0OcIK6APiiZmSBNkhRU/k7Uit w==;
X-CSE-ConnectionGUID: 8iGR2DcpRlewsOyZ5zrdUw==
X-CSE-MsgGUID: hPv7FvNaSUiA5nvrbo7JbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2536168"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2536168"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 23:49:22 -0800
X-CSE-ConnectionGUID: LgVgYkOwQVi7Vt9azMQCyQ==
X-CSE-MsgGUID: Vjp8BuLMS7adcULtQVVVcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="8520979"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa013.fm.intel.com with ESMTP; 03 Nov 2026 23:49:19 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, lukas@wunner.de,
 daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v13 08/10] drm/xe: Introduce temporary device wedging
Date: Wed,  4 Nov 2026 13:17:36 +0530
Message-ID: <20261104074813.1415191-9-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104074813.1415191-1-raag.jadav@intel.com>
References: <20261104074813.1415191-1-raag.jadav@intel.com>
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

Currently, wedged state is serving a single usecase where the device is
permanently declared wedged, but this doesn't allow any wedged state
management for runtime usecases. In preparation of usecases which require
to facilitate temporary device wedging, convert wedged.flag to wedged.ref
which serves as a driver internal refcount for wedged state and blocks
critical path execution during device lifetime. While at it, introduce
wedged.perm which signifies permanent device wedging and operates
independent of the refcount allowing relevant cleanup action on unwind
path.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 v9: Redesign to prevent races (Sashiko)
v10: Spell out temporary device wedging in subject (Lukasz)
v11: Update GuC CT path to check against permanent wedging (Lukasz, Riana)
     Put wedge reference only if device is wedged during resume() (Riana)
v12: s/xe_wedge_not_recoverable/xe_wedged_permanent (Riana)
     Refine documentation (Riana)
v13: Prevent PM ref leak on slot reset failure (Sashiko)
---
 drivers/gpu/drm/xe/xe_device.c      |  8 ++---
 drivers/gpu/drm/xe/xe_guc_ct.c      |  6 ++--
 drivers/gpu/drm/xe/xe_pci.c         |  2 ++
 drivers/gpu/drm/xe/xe_pci_error.c   | 24 +++++++--------
 drivers/gpu/drm/xe/xe_wedge.c       | 48 ++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_wedge.h       | 13 +++++++-
 drivers/gpu/drm/xe/xe_wedge_types.h | 13 ++++++--
 7 files changed, 88 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ed23d4f0051a..a487380573f3 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -731,6 +731,10 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (IS_SRIOV_VF(xe))
 		vf_update_device_info(xe);
 
+	err = xe_wedge_init(xe);
+	if (err)
+		return err;
+
 	/*
 	 * Check for pcode uncore_init status to confirm if the SoC
 	 * initialization is complete. Until done, any MMIO or lmem access from
@@ -763,10 +767,6 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = xe_wedge_init(xe);
-	if (err)
-		return err;
-
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 0a1b37fa0efb..5b43ca73f6dd 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1162,7 +1162,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 	xe_gt_assert(gt, g2h_len || !num_g2h);
 	lockdep_assert_held(&ct->lock);
 
-	if (xe_wedged(ct_to_xe(ct))) {
+	if (xe_wedged_permanent(ct_to_xe(ct))) {
 		ret = -ENOTRECOVERABLE;
 		goto out;
 	}
@@ -1591,7 +1591,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	if (g2h_fence.fail) {
 		if (g2h_fence.cancel) {
 			xe_gt_dbg(gt, "H2G request %#x canceled!\n", action[0]);
-			ret = xe_wedged(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
+			ret = xe_wedged_permanent(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
 			goto unlock;
 		}
 		xe_gt_err(gt, "H2G request %#x failed: error %#x hint %#x\n",
@@ -1936,7 +1936,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	lockdep_assert_held(&ct->fast_lock);
 
 	/* Keep in sync with g2h_err_is_fatal() */
-	if (xe_wedged(xe))
+	if (xe_wedged_permanent(xe))
 		return -ENOTRECOVERABLE;
 
 	if (ct->state == XE_GUC_CT_STATE_DISABLED)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3fa842c22a50..664d65149ff5 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -39,6 +39,7 @@
 #include "xe_survivability_mode.h"
 #include "xe_tile.h"
 #include "xe_tile_printk.h"
+#include "xe_wedge.h"
 
 enum toggle_d3cold {
 	D3COLD_DISABLE,
@@ -1404,6 +1405,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	 */
 	xe_assert(xe, !IS_SRIOV_VF(xe));
 	xe_assert(xe, !pci_num_vf(pdev));
+	xe_assert(xe, !xe_wedged(xe));
 
 	flags = memalloc_noreclaim_save();
 	pme_enabled = xe->pme.capable && !xe->d3cold.allowed &&
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 9bf0da3a3d15..46d4150771f1 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -21,13 +21,8 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
 	struct xe_gt *gt;
 	u8 id;
 
-	/*
-	 * Wedge the device to prevent userspace access but do not send the uevent.
-	 * xe_wedge_fini() releases runtime pm if wedged flag is set, so acquire a runtime
-	 * pm reference to avoid underflow.
-	 */
-	if (!atomic_xchg(&xe->wedged.flag, 1))
-		xe_pm_runtime_get_noresume(xe);
+	/* Wedge the device to prevent userspace access but do not send the uevent. */
+	xe_wedge_get(xe);
 
 	xe_device_set_in_reset(xe);
 
@@ -41,10 +36,16 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
 
 static pci_ers_result_t ras_action_to_pci_result(struct pci_dev *pdev, u8 action)
 {
+	struct xe_device *xe = xe_any_to_xe(pdev);
+
 	switch (action) {
 	case XE_RAS_RECOVERY_ACTION_RECOVERED:
 		return PCI_ERS_RESULT_RECOVERED;
 	case XE_RAS_RECOVERY_ACTION_RESET:
+		/* We should not be doing such ugly hacks, reuse FLR callbacks and drop this. */
+		if (atomic_xchg(&xe->wedged.perm, 1))
+			return PCI_ERS_RESULT_DISCONNECT;
+
 		prepare_device_for_reset(pdev);
 		return PCI_ERS_RESULT_NEED_RESET;
 	case XE_RAS_RECOVERY_ACTION_DISCONNECT:
@@ -71,6 +72,10 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
 	case pci_channel_io_normal:
 		return PCI_ERS_RESULT_CAN_RECOVER;
 	case pci_channel_io_frozen:
+		/* We should not be doing such ugly hacks, reuse FLR callbacks and drop this. */
+		if (atomic_xchg(&xe->wedged.perm, 1))
+			return PCI_ERS_RESULT_DISCONNECT;
+
 		prepare_device_for_reset(pdev);
 		return PCI_ERS_RESULT_NEED_RESET;
 	default:
@@ -128,9 +133,6 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 
 	xe = pdev_to_xe_device(pdev);
 
-	/* Wedge the device to prevent I/O operations till the resume callback */
-	atomic_set(&xe->wedged.flag, 1);
-
 	return PCI_ERS_RESULT_RECOVERED;
 }
 
@@ -139,8 +141,6 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 
 	xe_info(xe, "PCI error: resume\n");
-
-	atomic_set(&xe->wedged.flag, 0);
 }
 
 const struct pci_error_handlers xe_pci_error_handlers = {
diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
index 2f35937c5e66..8596c1a7e7c0 100644
--- a/drivers/gpu/drm/xe/xe_wedge.c
+++ b/drivers/gpu/drm/xe/xe_wedge.c
@@ -6,6 +6,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 
+#include "xe_assert.h"
 #include "xe_defaults.h"
 #include "xe_device.h"
 #include "xe_gt.h"
@@ -55,6 +56,43 @@
  *   firmware and restore device to normal operation.
  */
 
+/**
+ * xe_wedge_get() - Acquire wedge reference
+ * @xe: xe device instance
+ *
+ * Get runtime PM reference and block critical path execution.
+ *
+ * Use this for driver internal usecases which require temporarily blocking
+ * userspace access to the device during autonomous recovery, like PCIe FLR
+ * and bus reset. For everything else, use xe_wedge_declare().
+ */
+void xe_wedge_get(struct xe_device *xe)
+{
+	int ref;
+
+	/* We should not be runtime suspending as long as critical paths are blocked */
+	xe_pm_runtime_get_noresume(xe);
+
+	ref = atomic_inc_return(&xe->wedged.ref);
+	xe_assert(xe, ref > 0);
+}
+
+/**
+ * xe_wedge_put() - Relinquish wedge reference
+ * @xe: xe device instance
+ *
+ * Restore critical path execution and put runtime PM reference.
+ */
+void xe_wedge_put(struct xe_device *xe)
+{
+	int ref;
+
+	ref = atomic_dec_return(&xe->wedged.ref);
+	xe_assert(xe, ref >= 0);
+
+	xe_pm_runtime_put(xe);
+}
+
 static void wedge_work(struct work_struct *work)
 {
 	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
@@ -97,11 +135,11 @@ void xe_wedge_declare(struct xe_device *xe, unsigned long method)
 		return;
 	}
 
-	if (atomic_xchg(&xe->wedged.flag, 1))
+	if (atomic_xchg(&xe->wedged.perm, 1))
 		return;
 
+	xe_wedge_get(xe);
 	xe->needs_flr_on_fini = true;
-	xe_pm_runtime_get_noresume(xe);
 
 	xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
 	xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
@@ -239,8 +277,10 @@ static void xe_wedge_fini(struct drm_device *drm, void *arg)
 
 	disable_work_sync(&xe->wedged.work);
 
-	if (atomic_read(&xe->wedged.flag))
-		xe_pm_runtime_put(xe);
+	if (atomic_read(&xe->wedged.perm))
+		xe_wedge_put(xe);
+
+	xe_assert(xe, !xe_wedged(xe));
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
index 3b5499dfc30d..f2cab855db35 100644
--- a/drivers/gpu/drm/xe/xe_wedge.h
+++ b/drivers/gpu/drm/xe/xe_wedge.h
@@ -14,11 +14,22 @@
 
 static inline bool xe_wedged(struct xe_device *xe)
 {
-	return atomic_read(&xe->wedged.flag);
+	return atomic_read(&xe->wedged.ref);
+}
+
+/*
+ * Do not abuse this. Prefer xe_wedged() where possible. Only use this
+ * as a last resort where xe_wedged() is problematic.
+ */
+static inline bool xe_wedged_permanent(struct xe_device *xe)
+{
+	return atomic_read(&xe->wedged.perm);
 }
 
 void xe_wedge_declare(struct xe_device *xe, unsigned long method);
 int xe_wedge_init(struct xe_device *xe);
 int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode);
+void xe_wedge_get(struct xe_device *xe);
+void xe_wedge_put(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wedge_types.h b/drivers/gpu/drm/xe/xe_wedge_types.h
index e472c5fcbd26..0ca9f30dbda0 100644
--- a/drivers/gpu/drm/xe/xe_wedge_types.h
+++ b/drivers/gpu/drm/xe/xe_wedge_types.h
@@ -29,8 +29,17 @@ enum xe_wedged_mode {
  * struct xe_wedge - Struct to control Wedged States and mode
  */
 struct xe_wedge {
-	/** @flag: Xe device faced a critical error and is now blocked. */
-	atomic_t flag;
+	/**
+	 * @ref: Refcount for wedged device, blocks critical path execution. Used for
+	 * driver internal usecases which require temporarily blocking userspace access
+	 * to the device during autonomous recovery, like PCIe FLR and bus reset.
+	 */
+	atomic_t ref;
+	/**
+	 * @perm: Permanently wedged device, not recoverable. Only to be set when
+	 * notifying userspace of wedged device through drm wedged uevent.
+	 */
+	atomic_t perm;
 	/** @mode: Mode controlled by kernel parameter and debugfs */
 	enum xe_wedged_mode mode;
 	/** @method: Recovery method to be sent in the drm device wedged uevent */
-- 
2.43.0

