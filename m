Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C58DCCA46D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:27:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E05A112623;
	Fri, 16 Oct 2026 07:27:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA7311262C
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135644; x=1823671644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fOOFKtn0HAQbtrrcEMA90FzG3RC/oN548GPh5y5nTbc=;
 b=mPAKoP3YfpJk5AmEpfS06ZP8EiCAwQ17mTO4aDEkCAXW6Wv1e5Suy0M5
 lcKSDng7VQNZdz4EEpzVUwXIlosyM8BpVXnh2XNZX+DnnF0DpXg6wzt1+
 544oqPcZjwPhbZeDY0llJNhfrQa01G7pVhpEPNbVb2LJd7eAF5UVJg1hO
 FQ04QXp2Nwge944G3mdwDjyvtlKaXQciQMQWML5So5ueF3cbf7qMRkdjx
 i/tKQrY+oRCv6j90Slc8iQHP6qj4dy2SystBxRi3uzR4i6MWccgzo0ZQ6
 onXoSVPZ3LkFm7L2BW7HBFdFx7NMK79hzEDEio6LCDzDKNnRdjAH0PpHJ Q==;
X-CSE-ConnectionGUID: Q9blG/XmT2qi51jMgtU0+A==
X-CSE-MsgGUID: 9T5IjsBORga826WsF16Dig==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="806158"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="806158"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:27:24 -0700
X-CSE-ConnectionGUID: Uf+TokBuT16HJY2pl26peQ==
X-CSE-MsgGUID: pJcdvViFQVmYRBFX2YIEjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="3673971"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa013.fm.intel.com with ESMTP; 16 Oct 2026 00:27:20 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v10 8/9] drm/xe: Introduce xe_wedge
Date: Fri, 16 Oct 2026 12:56:02 +0530
Message-ID: <20261016072623.457392-9-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016072623.457392-1-raag.jadav@intel.com>
References: <20261016072623.457392-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Consolidate wedging implementation into a dedicated xe_wedge component
for better maintainability. While at it, rename all wedge helpers
to match with component name.

No functional impact.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Acked-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v2: Also move struct xe_wedge and wedged_mode debt to xe_wedge (Lukasz, Michal)
    Naming and aesthetic adjustments (Lukasz, Michal)
v3: Respect the component namespace (Rodrigo)
    Avoid chaining header includes (Rodrigo)
    Squash debugfs changes with xe_wedge patch (Lukasz)
v4: Include xe_sriov.h (Rodrigo)
---
 Documentation/gpu/xe/xe_device.rst          |   2 +-
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c |   3 +-
 drivers/gpu/drm/xe/xe_amc.c                 |   5 +-
 drivers/gpu/drm/xe/xe_bo.c                  |   3 +-
 drivers/gpu/drm/xe/xe_debugfs.c             |  66 +----
 drivers/gpu/drm/xe/xe_device.c              | 179 +------------
 drivers/gpu/drm/xe/xe_device.h              |   9 -
 drivers/gpu/drm/xe/xe_device_types.h        |  30 +--
 drivers/gpu/drm/xe/xe_gsc.c                 |   5 +-
 drivers/gpu/drm/xe/xe_gt.c                  |  12 +-
 drivers/gpu/drm/xe/xe_gt.h                  |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |   3 +-
 drivers/gpu/drm/xe/xe_guc.c                 |   4 +-
 drivers/gpu/drm/xe/xe_guc.h                 |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c              |   7 +-
 drivers/gpu/drm/xe/xe_guc_pc.c              |  11 +-
 drivers/gpu/drm/xe/xe_guc_rc.c              |   5 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          |  15 +-
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c       |   3 +-
 drivers/gpu/drm/xe/xe_mert.c                |   7 +-
 drivers/gpu/drm/xe/xe_pci_error.c           |   9 +-
 drivers/gpu/drm/xe/xe_ras.c                 |   3 +-
 drivers/gpu/drm/xe/xe_sriov_pf.c            |   3 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c  |   3 +-
 drivers/gpu/drm/xe/xe_uc.c                  |   6 +-
 drivers/gpu/drm/xe/xe_uc.h                  |   2 +-
 drivers/gpu/drm/xe/xe_wedge.c               | 262 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wedge.h               |  24 ++
 drivers/gpu/drm/xe/xe_wedge_types.h         |  44 ++++
 30 files changed, 405 insertions(+), 325 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_wedge.c
 create mode 100644 drivers/gpu/drm/xe/xe_wedge.h
 create mode 100644 drivers/gpu/drm/xe/xe_wedge_types.h

diff --git a/Documentation/gpu/xe/xe_device.rst b/Documentation/gpu/xe/xe_device.rst
index d3a022362ade..8baed81580c9 100644
--- a/Documentation/gpu/xe/xe_device.rst
+++ b/Documentation/gpu/xe/xe_device.rst
@@ -6,7 +6,7 @@
 Xe Device Wedging
 ==================
 
-.. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
+.. kernel-doc:: drivers/gpu/drm/xe/xe_wedge.c
    :doc: Xe Device Wedging
 
 ====================
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 011f7ef54086..bc203940f114 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -154,6 +154,7 @@ xe-y += xe_bb.o \
 	xe_vsec.o \
 	xe_wa.o \
 	xe_wait_user_fence.o \
+	xe_wedge.o \
 	xe_wopcm.o
 
 xe-$(CONFIG_I2C)	+= xe_i2c.o \
diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
index 27740b40c8ae..57ea88cce92d 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
@@ -15,6 +15,7 @@
 #include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_pm.h"
+#include "xe_wedge.h"
 
 /**
  * xe_kunit_helper_alloc_xe_device - Allocate a &xe_device for a KUnit test.
@@ -123,7 +124,7 @@ int xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
 	kunit_info(test, "running on %s device\n", xe->info.platform_name);
 
-	KUNIT_ASSERT_FALSE(test, xe_device_wedged(xe));
+	KUNIT_ASSERT_FALSE(test, xe_wedged(xe));
 	xe_pm_runtime_get(xe);
 	KUNIT_ASSERT_EQ(test, 0, kunit_add_action_or_reset(test, put_xe_pm_runtime, xe));
 
diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
index b13aa539e888..452f238a0d7a 100644
--- a/drivers/gpu/drm/xe/xe_amc.c
+++ b/drivers/gpu/drm/xe/xe_amc.c
@@ -18,6 +18,7 @@
 #include "xe_device.h"
 #include "xe_i2c.h"
 #include "xe_mmio.h"
+#include "xe_wedge.h"
 
 /**
  * DOC: Add-In Management Controller (AMC)
@@ -162,8 +163,8 @@ static void xe_amc_work(struct work_struct *work)
 	case AMC_ALERT_OOB_RESET:
 	case AMC_ALERT_CATERR:
 		dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", amc_alert[alert_reason]);
-		xe_device_declare_wedged(i2c_client_to_xe_device(client),
-					 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
+		xe_wedge_declare(i2c_client_to_xe_device(client),
+				 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 		break;
 	default:
 		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 12e523c61c1f..10a3f156a9d3 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -41,6 +41,7 @@
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
 #include "xe_vram_types.h"
+#include "xe_wedge.h"
 
 const char *const xe_mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
 	[XE_PL_SYSTEM] = "system",
@@ -2203,7 +2204,7 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
 	int err = 0;
 	int idx;
 
-	if (xe_device_wedged(xe) || !drm_dev_enter(&xe->drm, &idx))
+	if (xe_wedged(xe) || !drm_dev_enter(&xe->drm, &idx))
 		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
 
 	ret = xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 926020c7526e..e59d4964d811 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -18,13 +18,12 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_debugfs.h"
-#include "xe_gt_printk.h"
-#include "xe_guc_ads.h"
 #include "xe_hw_engine.h"
 #include "xe_mmio.h"
 #include "xe_pagefault.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
+#include "xe_printk.h"
 #include "xe_psmi.h"
 #include "xe_pxp_debugfs.h"
 #include "xe_sriov.h"
@@ -36,6 +35,7 @@
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vsec.h"
 #include "xe_wa.h"
+#include "xe_wedge.h"
 
 #ifdef CONFIG_DRM_XE_DEBUG
 #include "xe_bo_evict.h"
@@ -424,58 +424,6 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
 	return simple_read_from_buffer(ubuf, size, pos, buf, len);
 }
 
-static int __wedged_mode_set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
-{
-	bool enable_engine_reset;
-	int ret;
-
-	enable_engine_reset = (mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET);
-	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
-						       enable_engine_reset);
-	if (ret)
-		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
-
-	return ret;
-}
-
-static int wedged_mode_set_reset_policy(struct xe_device *xe, enum xe_wedged_mode mode)
-{
-	struct xe_gt *gt;
-	int ret;
-	u8 id;
-
-	guard(xe_pm_runtime)(xe);
-	for_each_gt(gt, xe, id) {
-		ret = __wedged_mode_set_reset_policy(gt, mode);
-		if (ret) {
-			if (id > 0) {
-				xe->wedged.inconsistent_reset = true;
-				drm_err(&xe->drm, "Inconsistent reset policy state between GTs\n");
-			}
-			return ret;
-		}
-	}
-
-	xe->wedged.inconsistent_reset = false;
-
-	return 0;
-}
-
-static bool wedged_mode_needs_policy_update(struct xe_device *xe, enum xe_wedged_mode mode)
-{
-	if (xe->wedged.inconsistent_reset)
-		return true;
-
-	if (xe->wedged.mode == mode)
-		return false;
-
-	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET ||
-	    mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
-		return true;
-
-	return false;
-}
-
 static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 			       size_t size, loff_t *pos)
 {
@@ -487,18 +435,10 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 	if (ret)
 		return ret;
 
-	ret = xe_device_validate_wedged_mode(xe, wedged_mode);
+	ret = xe_wedge_set_mode(xe, wedged_mode);
 	if (ret)
 		return ret;
 
-	if (wedged_mode_needs_policy_update(xe, wedged_mode)) {
-		ret = wedged_mode_set_reset_policy(xe, wedged_mode);
-		if (ret)
-			return ret;
-	}
-
-	xe->wedged.mode = wedged_mode;
-
 	return size;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0cab9044691e..9de173995a78 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -81,6 +81,7 @@
 #include "xe_vsec.h"
 #include "xe_wait_user_fence.h"
 #include "xe_wa.h"
+#include "xe_wedge.h"
 
 #include <generated/xe_device_wa_oob.h>
 #include <generated/xe_wa_oob.h>
@@ -238,7 +239,7 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
 	long ret;
 
-	if (xe_device_wedged(xe))
+	if (xe_wedged(xe))
 		return -ECANCELED;
 
 	ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
@@ -256,7 +257,7 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
 	long ret;
 
-	if (xe_device_wedged(xe))
+	if (xe_wedged(xe))
 		return -ECANCELED;
 
 	ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
@@ -697,16 +698,6 @@ static int xe_device_vram_alloc(struct xe_device *xe)
 	return 0;
 }
 
-static void wedged_work(struct work_struct *work);
-static void xe_device_wedged_fini(struct drm_device *drm, void *arg);
-
-static int xe_device_wedged_init(struct xe_device *xe)
-{
-	INIT_WORK(&xe->wedged.work, wedged_work);
-
-	return drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
-}
-
 /**
  * xe_device_probe_early: Device early probe
  * @xe: xe device instance
@@ -766,16 +757,11 @@ int xe_device_probe_early(struct xe_device *xe)
 	 */
 	assert_lmem_ready(xe);
 
-	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
-			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
-	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
-		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
-
 	err = xe_device_vram_alloc(xe);
 	if (err)
 		return err;
 
-	err = xe_device_wedged_init(xe);
+	err = xe_wedge_init(xe);
 	if (err)
 		return err;
 
@@ -865,14 +851,6 @@ static void detect_preproduction_hw(struct xe_device *xe)
 	}
 }
 
-static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
-{
-	struct xe_device *xe = arg;
-
-	if (atomic_read(&xe->wedged.flag))
-		xe_pm_runtime_put(xe);
-}
-
 #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
 static int xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
 {
@@ -1116,7 +1094,7 @@ int xe_device_probe(struct xe_device *xe)
 	/*
 	 * Process and log any errors detected by hardware. Possible results can
 	 * include declaring the device as wedged, which must be done only after
-	 * xe_device_wedged_fini() is registered.
+	 * xe_wedge_fini() is registered.
 	 */
 	xe_ras_process_errors(xe);
 
@@ -1355,153 +1333,6 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
 }
 
-/**
- * DOC: Xe Device Wedging
- *
- * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
- * When device is in wedged state, every IOCTL will be blocked and GT cannot
- * be used. The conditions under which the driver declares the device wedged
- * depend on the wedged mode configuration (see &enum xe_wedged_mode). The
- * default recovery method for a wedged state is rebind/bus-reset.
- *
- * Another recovery method is vendor-specific. Below are the cases that send
- * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
- *
- * Case: Firmware Flash
- * --------------------
- *
- * Identification Hint
- * +++++++++++++++++++
- *
- * ``WEDGED=vendor-specific`` drm device wedged uevent with
- * :ref:`Runtime Survivability mode <xe-survivability-mode>` is used to notify
- * admin/userspace consumer about the need for a firmware flash.
- *
- * Recovery Procedure
- * ++++++++++++++++++
- *
- * Once ``WEDGED=vendor-specific`` drm device wedged uevent is received, follow
- * the below steps
- *
- * - Check Runtime Survivability mode sysfs.
- *   If enabled, firmware flash is required to recover the device.
- *
- *   /sys/bus/pci/devices/<device>/survivability_mode
- *
- * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
- *   firmware and restore device to normal operation.
- */
-
-static void wedged_work(struct work_struct *work)
-{
-	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
-
-	/* Notify userspace of wedged device */
-	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
-}
-
-#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
-#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
-
-/**
- * xe_device_declare_wedged - Declare device wedged
- * @xe: xe device instance
- * @method: method(s) to be used for recovery
- *
- * This is a final state that can only be cleared with the recovery method
- * specified in the drm wedged uevent.
- *
- * In this state every IOCTL will be blocked so the GT cannot be used.
- * In general it will be called upon any critical error such as gt reset
- * failure or guc loading failure. Userspace will be notified of this state
- * through device wedged uevent.
- * If xe.wedged module parameter is set to 2, this function will be called
- * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
- * snapshot capture. In this mode, GT reset won't be attempted so the state of
- * the issue is preserved for further debugging.
- */
-void xe_device_declare_wedged(struct xe_device *xe, unsigned long method)
-{
-	struct xe_gt *gt;
-	u8 id;
-
-	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
-		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
-		return;
-	}
-
-	if (!atomic_xchg(&xe->wedged.flag, 1)) {
-		xe->needs_flr_on_fini = true;
-		xe_pm_runtime_get_noresume(xe);
-
-		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
-		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
-			    "For recovery procedure, refer to %s\n"
-			    "Please file a _new_ bug report at %s\n",
-			    WEDGED_URL, XE_BUG_URL);
-
-		for_each_initialized_gt(gt, xe, id)
-			xe_gt_declare_wedged(gt);
-
-		/*
-		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
-		 * hangs, so wedge the device with 'none' recovery method and have
-		 * it available to the user for debugging.
-		 */
-		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
-			xe->wedged.method = DRM_WEDGE_RECOVERY_NONE;
-		else
-			xe->wedged.method = method;
-
-		schedule_work(&xe->wedged.work);
-	}
-}
-
-/**
- * xe_device_validate_wedged_mode - Check if given mode is supported
- * @xe: the &xe_device
- * @mode: requested mode to validate
- *
- * Check whether the provided wedged mode is supported.
- *
- * Return: 0 if mode is supported, error code otherwise.
- */
-int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
-{
-	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
-		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
-		return -EINVAL;
-	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
-		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
-		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
-			mode, xe_wedged_mode_to_string(mode),
-			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
-		return -EPERM;
-	}
-
-	return 0;
-}
-
-/**
- * xe_wedged_mode_to_string - Convert enum value to string.
- * @mode: the &xe_wedged_mode to convert
- *
- * Returns: wedged mode as a user friendly string.
- */
-const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode)
-{
-	switch (mode) {
-	case XE_WEDGED_MODE_NEVER:
-		return "never";
-	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
-		return "upon-critical-error";
-	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
-		return "upon-any-hang-no-reset";
-	default:
-		return "<invalid>";
-	}
-}
-
 /**
  * xe_device_asid_to_vm() - Find VM from ASID
  * @xe: the &xe_device
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 9f35370c0851..6df60edcb8f8 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -211,11 +211,6 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
 void xe_device_td_flush(struct xe_device *xe);
 void xe_device_l2_flush(struct xe_device *xe, bool force);
 
-static inline bool xe_device_wedged(struct xe_device *xe)
-{
-	return atomic_read(&xe->wedged.flag);
-}
-
 #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
 static inline bool xe_debug_page_size_supported(struct xe_device *xe)
 {
@@ -264,10 +259,6 @@ static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
 }
 #endif
 
-void xe_device_declare_wedged(struct xe_device *xe, unsigned long method);
-int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
-const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
-
 struct xe_file *xe_file_get(struct xe_file *xef);
 void xe_file_put(struct xe_file *xef);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 039bf13a2581..0eb36fd91539 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -31,6 +31,7 @@
 #include "xe_sysctrl_types.h"
 #include "xe_tile_types.h"
 #include "xe_validation.h"
+#include "xe_wedge_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
@@ -48,22 +49,6 @@ struct xe_pxp;
 struct xe_ttm_stolen_mgr;
 struct xe_vram_region;
 
-/**
- * enum xe_wedged_mode - possible wedged modes
- * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
- * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
- *	when critical error occurs like GT reset failure or firmware failure.
- *	This is the default mode.
- * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
- *	any hang. In this mode, engine resets are disabled to avoid automatic
- *	recovery attempts. This mode is primarily intended for debugging hangs.
- */
-enum xe_wedged_mode {
-	XE_WEDGED_MODE_NEVER = 0,
-	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
-	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
-};
-
 #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
 /**
  * enum xe_page_size_alloc_ctrl_mode - User BO page-size allocation control modes
@@ -543,18 +528,7 @@ struct xe_device {
 	atomic_t in_reset;
 
 	/** @wedged: Struct to control Wedged States and mode */
-	struct {
-		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
-		atomic_t flag;
-		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
-		enum xe_wedged_mode mode;
-		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
-		unsigned long method;
-		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
-		bool inconsistent_reset;
-		/** @wedged.work: Worker to defer non-atomic calls */
-		struct work_struct work;
-	} wedged;
+	struct xe_wedge wedged;
 
 	/** @devres_group: devres group */
 	void *devres_group;
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 2bbe0f20ff8d..db669a953886 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -31,6 +31,7 @@
 #include "xe_sched_job.h"
 #include "xe_uc_fw.h"
 #include "xe_wa.h"
+#include "xe_wedge.h"
 #include "instructions/xe_gsc_commands.h"
 #include "regs/xe_gsc_regs.h"
 #include "regs/xe_gt_regs.h"
@@ -340,8 +341,8 @@ static int gsc_er_complete(struct xe_gt *gt)
 		 * declare the device as wedged.
 		 */
 		xe_gt_err(gt, "GSC ER timed out!\n");
-		xe_device_declare_wedged(gt_to_xe(gt),
-					 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
+		xe_wedge_declare(gt_to_xe(gt),
+				 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 		return -EIO;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 26035641ff0e..9b6b1420e463 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -68,6 +68,7 @@
 #include "xe_uc_fw.h"
 #include "xe_vm.h"
 #include "xe_wa.h"
+#include "xe_wedge.h"
 #include "xe_wopcm.h"
 
 #define GRDOM_RESET_TIMEOUT_MS	5
@@ -947,7 +948,7 @@ static void gt_reset_worker(struct work_struct *w)
 	unsigned int fw_ref;
 	int err;
 
-	if (xe_device_wedged(gt_to_xe(gt)))
+	if (xe_wedged(gt_to_xe(gt)))
 		goto err_pm_put;
 
 	if (xe_device_is_in_reset(gt_to_xe(gt)))
@@ -1006,8 +1007,7 @@ static void gt_reset_worker(struct work_struct *w)
 
 err_fail:
 	xe_log_err_fatal(gt, GT, err, "reset failed\n");
-	xe_device_declare_wedged(gt_to_xe(gt),
-				 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
+	xe_wedge_declare(gt_to_xe(gt), DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 err_pm_put:
 	xe_pm_runtime_put(gt_to_xe(gt));
 }
@@ -1215,18 +1215,18 @@ static void gt_wedge_worker(struct work_struct *w)
 	struct xe_gt *gt = container_of(w, typeof(*gt), wedge.worker);
 
 	xe_device_assert_mem_access(gt_to_xe(gt));
-	xe_uc_declare_wedged(&gt->uc);
+	xe_uc_wedge_declare(&gt->uc);
 	xe_tlb_inval_reset(&gt->tlb_inval);
 }
 
 /**
- * xe_gt_declare_wedged() - Declare GT wedged
+ * xe_gt_wedge_declare() - Declare GT wedged
  * @gt: the GT object
  *
  * Wedge the GT which stops all submission, saves desired debug state, and
  * cleans up anything which could timeout.
  */
-void xe_gt_declare_wedged(struct xe_gt *gt)
+void xe_gt_wedge_declare(struct xe_gt *gt)
 {
 	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
 
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 92d934d50244..7b6952fe804c 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -40,7 +40,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
 int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
 void xe_gt_mmio_init(struct xe_gt *gt);
-void xe_gt_declare_wedged(struct xe_gt *gt);
+void xe_gt_wedge_declare(struct xe_gt *gt);
 int xe_gt_record_default_lrcs(struct xe_gt *gt);
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 28ec83bb8100..2a5f2064ad3e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -37,6 +37,7 @@
 #include "xe_tile_sriov_vf.h"
 #include "xe_tlb_inval.h"
 #include "xe_uc_fw.h"
+#include "xe_wedge.h"
 #include "xe_wopcm.h"
 
 #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
@@ -1462,7 +1463,7 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 fail:
 	vf_post_migration_abort(gt);
 	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
-	xe_device_declare_wedged(xe, DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
+	xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 	return;
 
 queue:
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 3ab4cb9e4964..7d239a0829fb 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1829,13 +1829,13 @@ int xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 }
 
 /**
- * xe_guc_declare_wedged() - Declare GuC wedged
+ * xe_guc_wedge_declare() - Declare GuC wedged
  * @guc: the GuC object
  *
  * Wedge the GuC which stops all submission, saves desired debug state, and
  * cleans up anything which could timeout.
  */
-void xe_guc_declare_wedged(struct xe_guc *guc)
+void xe_guc_wedge_declare(struct xe_guc *guc)
 {
 	xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
 
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index c4eca40d69cf..75c4b9acb065 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -62,7 +62,7 @@ void xe_guc_reset_wait(struct xe_guc *guc);
 void xe_guc_stop_prepare(struct xe_guc *guc);
 void xe_guc_stop(struct xe_guc *guc);
 int xe_guc_start(struct xe_guc *guc);
-void xe_guc_declare_wedged(struct xe_guc *guc);
+void xe_guc_wedge_declare(struct xe_guc *guc);
 bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc);
 bool xe_guc_has_paging_engine(struct xe_guc *guc);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index e865d50e8b77..6113beda144b 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -36,6 +36,7 @@
 #include "xe_sleep.h"
 #include "xe_sriov_vf.h"
 #include "xe_trace_guc.h"
+#include "xe_wedge.h"
 
 static void receive_g2h(struct xe_guc_ct *ct);
 static void g2h_worker_func(struct work_struct *w);
@@ -1064,7 +1065,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 	xe_gt_assert(gt, g2h_len || !num_g2h);
 	lockdep_assert_held(&ct->lock);
 
-	if (xe_device_wedged(ct_to_xe(ct))) {
+	if (xe_wedged(ct_to_xe(ct))) {
 		ret = -ENOTRECOVERABLE;
 		goto out;
 	}
@@ -1489,7 +1490,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	if (g2h_fence.fail) {
 		if (g2h_fence.cancel) {
 			xe_gt_dbg(gt, "H2G request %#x canceled!\n", action[0]);
-			ret = xe_device_wedged(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
+			ret = xe_wedged(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
 			goto unlock;
 		}
 		xe_gt_err(gt, "H2G request %#x failed: error %#x hint %#x\n",
@@ -1828,7 +1829,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
 	lockdep_assert_held(&ct->fast_lock);
 
-	if (xe_device_wedged(xe))
+	if (xe_wedged(xe))
 		return -ENOTRECOVERABLE;
 
 	if (ct->state == XE_GUC_CT_STATE_DISABLED)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index e0105222a2c7..9558d7196a51 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -36,6 +36,7 @@
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_wa.h"
+#include "xe_wedge.h"
 
 #define MCHBAR_MIRROR_BASE_SNB	0x140000
 
@@ -188,7 +189,7 @@ static int pc_action_reset(struct xe_guc_pc *pc)
 	int ret;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
+	if (ret && !(xe_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
 		xe_gt_err(pc_to_gt(pc), "GuC PC reset failed: %pe\n",
 			  ERR_PTR(ret));
 
@@ -212,7 +213,7 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
 
 	/* Blocking here to ensure the results are ready before reading them */
 	ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
-	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
+	if (ret && !(xe_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
 		xe_gt_err(pc_to_gt(pc), "GuC PC query task state failed: %pe\n",
 			  ERR_PTR(ret));
 
@@ -235,7 +236,7 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
+	if (ret && !(xe_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
 		xe_gt_err(pc_to_gt(pc), "GuC PC set param[%u]=%u failed: %pe\n",
 			  id, value, ERR_PTR(ret));
 
@@ -257,7 +258,7 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
+	if (ret && !(xe_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
 		xe_gt_err(pc_to_gt(pc), "GuC PC unset param failed: %pe",
 			  ERR_PTR(ret));
 
@@ -1357,7 +1358,7 @@ static void xe_guc_pc_fini_hw(void *arg)
 	struct xe_guc_pc *pc = arg;
 	struct xe_device *xe = pc_to_xe(pc);
 
-	if (xe_device_wedged(xe))
+	if (xe_wedged(xe))
 		return;
 
 	xe_guc_pc_stop(pc);
diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
index 99fa127b261f..fa3062ab134a 100644
--- a/drivers/gpu/drm/xe/xe_guc_rc.c
+++ b/drivers/gpu/drm/xe/xe_guc_rc.c
@@ -16,6 +16,7 @@
 #include "xe_guc_pc.h"
 #include "xe_guc_rc.h"
 #include "xe_pm.h"
+#include "xe_wedge.h"
 
 /**
  * DOC: GuC RC (Render C-states)
@@ -40,7 +41,7 @@ static int guc_action_setup_gucrc(struct xe_guc *guc, u32 control)
 	int ret;
 
 	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == -ECANCELED))
+	if (ret && !(xe_wedged(guc_to_xe(guc)) && ret == -ECANCELED))
 		xe_gt_err(guc_to_gt(guc),
 			  "GuC RC setup %s(%u) failed (%pe)\n",
 			   control == GUCRC_HOST_CONTROL ? "HOST_CONTROL" :
@@ -73,7 +74,7 @@ static void xe_guc_rc_fini_hw(void *arg)
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
 
-	if (xe_device_wedged(xe))
+	if (xe_wedged(xe))
 		return;
 
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 319956fc4315..2fcc4e3bfa24 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -50,6 +50,7 @@
 #include "xe_trace.h"
 #include "xe_uc_fw.h"
 #include "xe_vm.h"
+#include "xe_wedge.h"
 
 #define XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN		6
 
@@ -1450,10 +1451,10 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
 	if (xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
 		return false;
 
-	if (xe_device_wedged(xe))
+	if (xe_wedged(xe))
 		return true;
 
-	xe_device_declare_wedged(xe, DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
+	xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 
 	return true;
 }
@@ -1666,7 +1667,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	if (!exec_queue_killed(q))
 		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
 	else
-		wedged = xe_device_wedged(xe);
+		wedged = xe_wedged(xe);
 
 	/*
 	 * Only tag as GPU hang if this is the original timeout, not a
@@ -1786,8 +1787,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	}
 
 	if (wedge_device)
-		xe_device_declare_wedged(gt_to_xe(q->gt),
-					 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
+		xe_wedge_declare(gt_to_xe(q->gt),
+				 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 
 	/*
 	 * We want the job added back to the pending list so it gets freed; this
@@ -2552,7 +2553,7 @@ static int guc_exec_queue_wait_suspend_done(struct xe_exec_queue *q, bool blocki
 						       WAIT_COND, HZ * 5);
 	}
 
-	if (!blocking && vf_recovery(guc) && !xe_device_wedged(xe))
+	if (!blocking && vf_recovery(guc) && !xe_wedged(xe))
 		return -EAGAIN;
 
 	if (!ret)
@@ -2812,7 +2813,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
 
 void xe_guc_submit_reset_wait(struct xe_guc *guc)
 {
-	wait_event(guc->ct.wq, xe_device_wedged(guc_to_xe(guc)) ||
+	wait_event(guc->ct.wq, xe_wedged(guc_to_xe(guc)) ||
 		   !xe_guc_read_stopped(guc));
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 111fef781b2a..dd38d95c6014 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -19,6 +19,7 @@
 #include "xe_sa.h"
 #include "xe_tlb_inval.h"
 #include "xe_vm.h"
+#include "xe_wedge.h"
 
 #include "regs/xe_guc_regs.h"
 
@@ -77,7 +78,7 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 		};
 
 		return send_tlb_inval(guc, action, ARRAY_SIZE(action));
-	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
+	} else if (xe_device_uc_enabled(xe) && !xe_wedged(xe)) {
 		struct xe_mmio *mmio = &gt->mmio;
 
 		if (IS_SRIOV_VF(xe))
diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
index 934be933d57f..a2eae6088c1a 100644
--- a/drivers/gpu/drm/xe/xe_mert.c
+++ b/drivers/gpu/drm/xe/xe_mert.c
@@ -11,6 +11,7 @@
 #include "xe_mmio.h"
 #include "xe_sriov_printk.h"
 #include "xe_tile.h"
+#include "xe_wedge.h"
 
 /**
  * xe_mert_init_early() - Initialize MERT data
@@ -74,8 +75,7 @@ static void mert_handle_cat_error(struct xe_device *xe)
 		break;
 	case CATERR_UNMAPPED_GGTT:
 		xe_sriov_err(xe, "MERT: CAT_ERR: Access to an unmapped GGTT!\n");
-		xe_device_declare_wedged(xe,
-					 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
+		xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 		break;
 	case CATERR_LMTT_FAULT:
 		xe_sriov_dbg_ratelimited(xe, "MERT: CAT_ERR: VF%u LMTT fault!\n", vfid);
@@ -83,8 +83,7 @@ static void mert_handle_cat_error(struct xe_device *xe)
 		break;
 	default:
 		xe_sriov_err(xe, "MERT: Unexpected CAT_ERR code=%#x!\n", code);
-		xe_device_declare_wedged(xe,
-					 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
+		xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 		break;
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index a5c8fd67738c..9bf0da3a3d15 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -13,6 +13,7 @@
 #include "xe_printk.h"
 #include "xe_ras.h"
 #include "xe_survivability_mode.h"
+#include "xe_wedge.h"
 
 static void prepare_device_for_reset(struct pci_dev *pdev)
 {
@@ -22,7 +23,7 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
 
 	/*
 	 * Wedge the device to prevent userspace access but do not send the uevent.
-	 * xe_device_wedged_fini() releases runtime pm if wedged flag is set, so acquire a runtime
+	 * xe_wedge_fini() releases runtime pm if wedged flag is set, so acquire a runtime
 	 * pm reference to avoid underflow.
 	 */
 	if (!atomic_xchg(&xe->wedged.flag, 1))
@@ -31,7 +32,7 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
 	xe_device_set_in_reset(xe);
 
 	for_each_gt(gt, xe, id) {
-		xe_gt_declare_wedged(gt);
+		xe_gt_wedge_declare(gt);
 		flush_work(&gt->wedge.worker);
 	}
 
@@ -63,7 +64,7 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
 		return PCI_ERS_RESULT_DISCONNECT;
 
 	/* If the device is already wedged or in survivability mode, do not attempt recovery */
-	if (xe_survivability_mode_is_boot_enabled(xe) || xe_device_wedged(xe))
+	if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
 		return PCI_ERS_RESULT_DISCONNECT;
 
 	switch (state) {
@@ -88,7 +89,7 @@ static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
 
 	/* User wants to debug the error, prevent reset */
 	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
-		xe_device_declare_wedged(xe, DRM_WEDGE_RECOVERY_NONE);
+		xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_NONE);
 		return PCI_ERS_RESULT_DISCONNECT;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 9cbd1d1e3be0..0072bb4cc5df 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -19,6 +19,7 @@
 #include "xe_sysctrl_mailbox.h"
 #include "xe_sysctrl_mailbox_types.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_wedge.h"
 
 /* Any non-null entry marks the page as offlined by firmware */
 #define XE_RAS_PAGE_OFFLINED		xa_mk_value(1)
@@ -563,7 +564,7 @@ static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
 
 static void punit_error_handler(struct xe_device *xe)
 {
-	xe_device_declare_wedged(xe, DRM_WEDGE_RECOVERY_COLD_RESET);
+	xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_COLD_RESET);
 }
 
 static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index 33bd754d138f..ce0db26203ec 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -19,6 +19,7 @@
 #include "xe_sriov_pf_service.h"
 #include "xe_sriov_pf_sysfs.h"
 #include "xe_sriov_printk.h"
+#include "xe_wedge.h"
 
 static unsigned int wanted_max_vfs(struct xe_device *xe)
 {
@@ -157,7 +158,7 @@ int xe_sriov_pf_wait_ready(struct xe_device *xe)
 	unsigned int id;
 	int err;
 
-	if (xe_device_wedged(xe))
+	if (xe_wedged(xe))
 		return -ECANCELED;
 
 	for_each_gt(gt, xe, id) {
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index ca031576fecb..d73cdad0b3a9 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -20,6 +20,7 @@
 #include "xe_pcode_api.h"
 #include "xe_printk.h"
 #include "xe_vsec.h"
+#include "xe_wedge.h"
 
 /**
  * DOC: Survivability Mode
@@ -446,7 +447,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
 	xe_log_err(xe, SURVIVABILITY, 0, "Runtime Mode enabled!\n");
 
-	xe_device_declare_wedged(xe, DRM_WEDGE_RECOVERY_VENDOR);
+	xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_VENDOR);
 
 	xe_log_err(xe, SURVIVABILITY, 0, "Firmware flash required!\n");
 	xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 65f59f06177f..686c28856014 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -326,15 +326,15 @@ void xe_uc_runtime_resume(struct xe_uc *uc)
 }
 
 /**
- * xe_uc_declare_wedged() - Declare UC wedged
+ * xe_uc_wedge_declare() - Declare UC wedged
  * @uc: the UC object
  *
  * Wedge the UC which stops all submission, saves desired debug state, and
  * cleans up anything which could timeout.
  */
-void xe_uc_declare_wedged(struct xe_uc *uc)
+void xe_uc_wedge_declare(struct xe_uc *uc)
 {
 	xe_gt_assert(uc_to_gt(uc), uc_to_xe(uc)->wedged.mode);
 
-	xe_guc_declare_wedged(&uc->guc);
+	xe_guc_wedge_declare(&uc->guc);
 }
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 255a54a8f876..23bc0ce1c42f 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -21,6 +21,6 @@ int xe_uc_start(struct xe_uc *uc);
 void xe_uc_suspend_prepare(struct xe_uc *uc);
 int xe_uc_suspend(struct xe_uc *uc);
 int xe_uc_sanitize_reset(struct xe_uc *uc);
-void xe_uc_declare_wedged(struct xe_uc *uc);
+void xe_uc_wedge_declare(struct xe_uc *uc);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
new file mode 100644
index 000000000000..2f35937c5e66
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_wedge.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
+
+#include "xe_defaults.h"
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_gt_printk.h"
+#include "xe_guc_ads.h"
+#include "xe_log.h"
+#include "xe_module.h"
+#include "xe_pm.h"
+#include "xe_printk.h"
+#include "xe_sriov.h"
+#include "xe_wedge.h"
+
+/**
+ * DOC: Xe Device Wedging
+ *
+ * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
+ * When device is in wedged state, every IOCTL will be blocked and GT cannot
+ * be used. The conditions under which the driver declares the device wedged
+ * depend on the wedge mode configuration (see &enum xe_wedged_mode). The
+ * default recovery method for a wedged state is rebind/bus-reset.
+ *
+ * Another recovery method is vendor-specific. Below are the cases that send
+ * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
+ *
+ * Case: Firmware Flash
+ * --------------------
+ *
+ * Identification Hint
+ * +++++++++++++++++++
+ *
+ * ``WEDGED=vendor-specific`` drm device wedged uevent with
+ * :ref:`Runtime Survivability mode <xe-survivability-mode>` is used to notify
+ * admin/userspace consumer about the need for a firmware flash.
+ *
+ * Recovery Procedure
+ * ++++++++++++++++++
+ *
+ * Once ``WEDGED=vendor-specific`` drm device wedged uevent is received, follow
+ * the below steps
+ *
+ * - Check Runtime Survivability mode sysfs.
+ *   If enabled, firmware flash is required to recover the device.
+ *
+ *   /sys/bus/pci/devices/<device>/survivability_mode
+ *
+ * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
+ *   firmware and restore device to normal operation.
+ */
+
+static void wedge_work(struct work_struct *work)
+{
+	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
+
+	/* Notify userspace of wedged device */
+	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
+}
+
+#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
+#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
+
+/**
+ * xe_wedge_declare() - Declare device wedged
+ * @xe: xe device instance
+ * @method: method(s) to be used for recovery
+ *
+ * This is the final state that can only be cleared with the recovery method
+ * specified in the drm wedged uevent.
+ *
+ * In this state every IOCTL will be blocked so the GT cannot be used.
+ * In general it will be called upon any critical error such as gt reset
+ * failure or guc loading failure. Userspace will be notified of this state
+ * through device wedged uevent.
+ *
+ * If xe.wedged module parameter is set to 2, this function will be called
+ * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
+ * snapshot capture. In this mode, GT reset won't be attempted so the state of
+ * the issue is preserved for further debugging.
+ *
+ * Since the wedge handling is done as part of worker thread, this is safe for
+ * atomic callers.
+ */
+void xe_wedge_declare(struct xe_device *xe, unsigned long method)
+{
+	struct xe_gt *gt;
+	u8 id;
+
+	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
+		xe_dbg(xe, "Wedged mode is forcibly disabled\n");
+		return;
+	}
+
+	if (atomic_xchg(&xe->wedged.flag, 1))
+		return;
+
+	xe->needs_flr_on_fini = true;
+	xe_pm_runtime_get_noresume(xe);
+
+	xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
+	xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
+			"For recovery procedure, refer to %s\n"
+			"Please file a _new_ bug report at %s\n",
+			WEDGED_URL, XE_BUG_URL);
+
+	for_each_initialized_gt(gt, xe, id)
+		xe_gt_wedge_declare(gt);
+
+	/*
+	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
+	 * hangs, so wedge the device with 'none' recovery method and have
+	 * it available to the user for debugging.
+	 */
+	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+		xe->wedged.method = DRM_WEDGE_RECOVERY_NONE;
+	else
+		xe->wedged.method = method;
+
+	schedule_work(&xe->wedged.work);
+}
+
+static const char *wedge_mode_to_string(enum xe_wedged_mode mode)
+{
+	switch (mode) {
+	case XE_WEDGED_MODE_NEVER:
+		return "never";
+	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
+		return "upon-critical-error";
+	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
+		return "upon-any-hang-no-reset";
+	default:
+		return "<invalid>";
+	}
+}
+
+static int wedge_validate_mode(struct xe_device *xe, unsigned int mode)
+{
+	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
+		xe_dbg(xe, "wedged_mode: invalid value (%u)\n", mode);
+		return -EINVAL;
+	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
+		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
+		xe_dbg(xe, "wedged_mode: (%u) %s mode is not supported for %s\n",
+		       mode, wedge_mode_to_string(mode),
+		       xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
+		return -EPERM;
+	}
+
+	return 0;
+}
+
+static bool wedge_mode_needs_policy_update(struct xe_device *xe, enum xe_wedged_mode mode)
+{
+	if (xe->wedged.inconsistent_reset)
+		return true;
+
+	if (xe->wedged.mode == mode)
+		return false;
+
+	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET ||
+	    mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+		return true;
+
+	return false;
+}
+
+static int __wedge_mode_set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
+{
+	bool enable_engine_reset;
+	int ret;
+
+	enable_engine_reset = (mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET);
+	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
+						       enable_engine_reset);
+	if (ret)
+		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
+
+	return ret;
+}
+
+static int wedge_mode_set_reset_policy(struct xe_device *xe, enum xe_wedged_mode mode)
+{
+	struct xe_gt *gt;
+	int ret;
+	u8 id;
+
+	guard(xe_pm_runtime)(xe);
+	for_each_gt(gt, xe, id) {
+		ret = __wedge_mode_set_reset_policy(gt, mode);
+		if (ret) {
+			if (id > 0) {
+				xe->wedged.inconsistent_reset = true;
+				xe_err(xe, "Inconsistent reset policy state between GTs\n");
+			}
+			return ret;
+		}
+	}
+
+	xe->wedged.inconsistent_reset = false;
+
+	return 0;
+}
+
+/**
+ * xe_wedge_set_mode() - Set wedge mode
+ * @xe: xe device instance
+ * @mode: wedge mode to be set
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode)
+{
+	int ret;
+
+	ret = wedge_validate_mode(xe, mode);
+	if (ret)
+		return ret;
+
+	if (wedge_mode_needs_policy_update(xe, mode)) {
+		ret = wedge_mode_set_reset_policy(xe, mode);
+		if (ret)
+			return ret;
+	}
+
+	xe->wedged.mode = mode;
+
+	return ret;
+}
+
+static void xe_wedge_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_device *xe = arg;
+
+	disable_work_sync(&xe->wedged.work);
+
+	if (atomic_read(&xe->wedged.flag))
+		xe_pm_runtime_put(xe);
+}
+
+/**
+ * xe_wedge_init() - Initialize wedge
+ * @xe: xe device instance
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_wedge_init(struct xe_device *xe)
+{
+	INIT_WORK(&xe->wedged.work, wedge_work);
+
+	xe->wedged.mode = wedge_validate_mode(xe, xe_modparam.wedged_mode) ?
+			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
+	xe_dbg(xe, "wedged_mode: setting mode (%u) %s\n",
+	       xe->wedged.mode, wedge_mode_to_string(xe->wedged.mode));
+
+	return drmm_add_action_or_reset(&xe->drm, xe_wedge_fini, xe);
+}
diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
new file mode 100644
index 000000000000..3b5499dfc30d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_wedge.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_WEDGE_H_
+#define _XE_WEDGE_H_
+
+#include <linux/atomic.h>
+#include <linux/types.h>
+
+#include "xe_device_types.h"
+#include "xe_wedge_types.h"
+
+static inline bool xe_wedged(struct xe_device *xe)
+{
+	return atomic_read(&xe->wedged.flag);
+}
+
+void xe_wedge_declare(struct xe_device *xe, unsigned long method);
+int xe_wedge_init(struct xe_device *xe);
+int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_wedge_types.h b/drivers/gpu/drm/xe/xe_wedge_types.h
new file mode 100644
index 000000000000..e472c5fcbd26
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_wedge_types.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_WEDGE_TYPES_H_
+#define _XE_WEDGE_TYPES_H_
+
+#include <linux/types.h>
+#include <linux/workqueue_types.h>
+
+/**
+ * enum xe_wedged_mode - Possible wedge modes
+ * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
+ * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
+ *	when critical error occurs like GT reset failure or firmware failure.
+ *	This is the default mode.
+ * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
+ *	any hang. In this mode, engine resets are disabled to avoid automatic
+ *	recovery attempts. This mode is primarily intended for debugging hangs.
+ */
+enum xe_wedged_mode {
+	XE_WEDGED_MODE_NEVER = 0,
+	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
+	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
+};
+
+/**
+ * struct xe_wedge - Struct to control Wedged States and mode
+ */
+struct xe_wedge {
+	/** @flag: Xe device faced a critical error and is now blocked. */
+	atomic_t flag;
+	/** @mode: Mode controlled by kernel parameter and debugfs */
+	enum xe_wedged_mode mode;
+	/** @method: Recovery method to be sent in the drm device wedged uevent */
+	unsigned long method;
+	/** @inconsistent_reset: Inconsistent reset policy state between GTs */
+	bool inconsistent_reset;
+	/** @work: Worker to defer non-atomic calls */
+	struct work_struct work;
+};
+
+#endif
-- 
2.43.0

