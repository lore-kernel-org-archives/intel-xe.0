Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80162EDE99A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 15:22:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4579810E623;
	Tue, 10 Sep 2024 15:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VwDxUo+i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1081C10E61F
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 15:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725981771; x=1757517771;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YXYg7eebjtPuuEoFGwxjMA0RAM3lysIihoxa7ceoaxw=;
 b=VwDxUo+iUrh3QUanmYK2uRm68guNPfFQvTlE2dLFSGU2h+Fkp1zNJ49+
 HF8tF9H58d4pupuzoEaCIb4204FXxP8tHPPqrXlELdWfnW27PgrDtJ2mF
 6a4CAN1RcBcPHpqxfmwFG2Z0eBaDY6rzvGN8X9QI1rVGRHybSTkzrUBT2
 cYq1E6EYA4LZtANdySAnv4y+qobMk7SUwL70m+qB4IWJFWKwmehJ/JzCA
 0hJUGJCBnoE23p2NnjNzRPEz109B0WhFIMJJI6Nd7gHB5bIuZt8JwuCOW
 A9M6cNBmo4KgU6ckPFWyP2WytNR6x459PwE90jgir23dUqTN6ummasfMe w==;
X-CSE-ConnectionGUID: IBjvJWK7QUmC1p9jlFuW2A==
X-CSE-MsgGUID: l7JiHw1mSLSHjxl4HQHpVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24878895"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24878895"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 08:22:50 -0700
X-CSE-ConnectionGUID: BBwbX2LHTkG9K3o0K2NnnA==
X-CSE-MsgGUID: sLihroYyQjaujeQFogB3Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67358100"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 08:22:49 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5] drm/xe: Add driver load error injection
Date: Tue, 10 Sep 2024 17:22:41 +0200
Message-ID: <20240910152241.1554435-1-francois.dugast@intel.com>
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

Those new macros inject errors by overriding return codes. They must
manually be called, preferably at the very beginning of the function
that will fault, otherwise if not possible by turning this pattern:

    err = foo();
    if (err)
        return err;

into:

    err = foo();
    err = xe_device_inject_driver_probe_error(xe, err);
    if (err)
        return err;

When CONFIG_DRM_XE_DEBUG is not set, this has no effect.

When CONFIG_DRM_XE_DEBUG is set, the error code at checkpoint X will
be overridden when the module argument inject_driver_load_error is
set to value X. By doing so, it is possible to test proper error
handling and improve robustness for current and future code. A few
injection points are added in this patch but more need to be added.
One way to use this error injection at driver probe is:

    for i in {1..200}; do
        echo "Run $i"
        modprobe xe inject_driver_probe_error=$i;
        rmmod xe;
    done

In the future this is expected to be replaced by the infrastructure
provided by fault-inject.h

v2: Fix style and build errors, modparam to 0 after probe, rename to
    xe_device_inject_driver_probe_error, check type when compiled out,
    add _return macro, move some uses to the beginning of the function
v3: Rebase
v4: Improve commit message and comments, keep if/return rather than
    change the flow inside the macro (Lucas De Marchi)
v5: Rebase, add comments, keep existing return points (Lucas De Marchi)
    Add finish wrapper, move to function beginning for all xe functions
    (Michal Wajdeczko) Bolt into i915 error injection (Jani Nikula)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/ext/i915_utils.c |  4 +-
 drivers/gpu/drm/xe/xe_device.c              | 48 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h              | 30 +++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h        |  5 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c |  5 +++
 drivers/gpu/drm/xe/xe_guc.c                 |  1 +
 drivers/gpu/drm/xe/xe_guc_ct.c              |  1 +
 drivers/gpu/drm/xe/xe_guc_pc.c              |  4 ++
 drivers/gpu/drm/xe/xe_mmio.c                |  5 +++
 drivers/gpu/drm/xe/xe_module.c              | 17 ++++++++
 drivers/gpu/drm/xe/xe_module.h              |  3 ++
 drivers/gpu/drm/xe/xe_pci.c                 |  5 +++
 drivers/gpu/drm/xe/xe_pm.c                  |  5 +++
 drivers/gpu/drm/xe/xe_sriov.c               |  7 ++-
 drivers/gpu/drm/xe/xe_sriov_pf.c            |  6 +++
 drivers/gpu/drm/xe/xe_tile.c                | 13 ++++++
 drivers/gpu/drm/xe/xe_uc.c                  |  4 ++
 drivers/gpu/drm/xe/xe_wa.c                  |  8 +++-
 drivers/gpu/drm/xe/xe_wopcm.c               |  7 ++-
 19 files changed, 172 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/i915_utils.c b/drivers/gpu/drm/xe/display/ext/i915_utils.c
index 43b10a2cc508..11d8377a125f 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_utils.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_utils.c
@@ -4,6 +4,7 @@
  */
 
 #include "i915_drv.h"
+#include "xe_device.h"
 
 bool i915_vtd_active(struct drm_i915_private *i915)
 {
@@ -16,11 +17,10 @@ bool i915_vtd_active(struct drm_i915_private *i915)
 
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
 
-/* i915 specific, just put here for shutting it up */
 int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
 			      const char *func, int line)
 {
-	return 0;
+	return __xe_device_inject_driver_probe_error(i915, err, 0, func, line);
 }
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 449b85035d3a..f22d94ff302e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -319,6 +319,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
 			      xe->drm.anon_inode->i_mapping,
 			      xe->drm.vma_offset_manager, false, false);
+	err = xe_device_inject_driver_probe_error_override(xe, err);
 	if (WARN_ON(err))
 		goto err;
 
@@ -477,6 +478,7 @@ static int xe_set_dma_info(struct xe_device *xe)
 		goto mask_err;
 
 	err = dma_set_coherent_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
+	err = xe_device_inject_driver_probe_error_override(xe, err);
 	if (err)
 		goto mask_err;
 
@@ -498,6 +500,11 @@ static int wait_for_lmem_ready(struct xe_device *xe)
 {
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	unsigned long timeout, start;
+	int err;
+
+	err = xe_device_inject_driver_probe_error(xe);
+	if (err)
+		return err;
 
 	if (!IS_DGFX(xe))
 		return 0;
@@ -750,6 +757,8 @@ int xe_device_probe(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_sanitize_freq(gt);
 
+	xe_device_inject_driver_probe_error_finish();
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_fini_display:
@@ -1000,3 +1009,42 @@ void xe_device_declare_wedged(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_declare_wedged(gt);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+/**
+ * __xe_device_inject_driver_probe_error - Inject an error during device probe
+ * @xe: xe device instance
+ * @err_injected: the error to inject
+ * @err_real: the error returned by the actual function
+ * @func: the name of the function where this is called from
+ * @line: the line where this is called from
+ *
+ * This is not meant to be called directly, only through xe_device_inject_driver_probe_error.
+ *
+ * Return: err_real if != 0, err_injected otherwise
+ */
+int __xe_device_inject_driver_probe_error(struct xe_device *xe, int err_injected, int err_real,
+					  const char *func, int line)
+{
+	if (err_real != 0)
+		return err_real;
+
+	if (xe->inject_driver_probe_error >= xe_modparam.inject_driver_probe_error)
+		return 0;
+
+	if (++xe->inject_driver_probe_error < xe_modparam.inject_driver_probe_error)
+		return 0;
+
+	drm_info(&xe->drm, "Injecting failure %d at checkpoint %u [%s:%d]\n",
+		 err_injected, xe->inject_driver_probe_error, func, line);
+
+	xe_modparam.inject_driver_probe_error = 0;
+	return err_injected;
+}
+
+void __xe_device_inject_driver_probe_error_finish(void)
+{
+	/* After probe finishes, stop checking for error injection */
+	xe_modparam.inject_driver_probe_error = 0;
+}
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 894f04770454..c410e55b6b09 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -178,4 +178,34 @@ void xe_device_declare_wedged(struct xe_device *xe);
 struct xe_file *xe_file_get(struct xe_file *xef);
 void xe_file_put(struct xe_file *xef);
 
+#define XE_DEVICE_INJECTED_ERR -ENODEV
+#define xe_device_inject_driver_probe_error(__xe) \
+	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, 0, __func__, __LINE__)
+#define xe_device_inject_driver_probe_error_override(__xe, __err_real) \
+	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, __err_real, __func__, \
+					      __LINE__)
+#define xe_device_inject_driver_probe_error_finish()	\
+	__xe_device_inject_driver_probe_error_finish()
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+
+int __xe_device_inject_driver_probe_error(struct xe_device *xe,
+					  int err_injected, int err_real,
+					  const char *func, int line);
+
+void __xe_device_inject_driver_probe_error_finish(void);
+
+#else
+
+static inline int __xe_device_inject_driver_probe_error(struct xe_device *xe,
+							int err_injected, int err_real,
+							const char *func, int line)
+{
+	return 0;
+}
+
+static inline void __xe_device_inject_driver_probe_error_finish(void) {};
+
+#endif
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index ec7eb7811126..582b8b7cdee4 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -487,6 +487,11 @@ struct xe_device {
 		int mode;
 	} wedged;
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+	/** @inject_driver_probe_error: Counter used for error injection during probe */
+	int inject_driver_probe_error;
+#endif
+
 #ifdef TEST_VM_OPS_ERROR
 	/**
 	 * @vm_inject_error_position: inject errors at different places in VM
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
index 0e23b7ea4f3e..b5da321bbbea 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
@@ -12,6 +12,7 @@
 #include "regs/xe_guc_regs.h"
 #include "regs/xe_regs.h"
 
+#include "xe_device.h"
 #include "xe_mmio.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_gt_sriov_pf_helpers.h"
@@ -275,6 +276,10 @@ int xe_gt_sriov_pf_service_init(struct xe_gt *gt)
 {
 	int err;
 
+	err = xe_device_inject_driver_probe_error(gt_to_xe(gt));
+	if (err)
+		return err;
+
 	pf_init_versions(gt);
 
 	err = pf_alloc_runtime_info(gt);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 5599464013bd..eb764b44ced7 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -353,6 +353,7 @@ int xe_guc_init(struct xe_guc *guc)
 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
 
 	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
+	ret = xe_device_inject_driver_probe_error_override(guc_to_xe(guc), ret);
 	if (ret)
 		goto out;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 4b95f75b1546..51ffb05605bb 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -202,6 +202,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	ct->bo = bo;
 
 	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
+	err = xe_device_inject_driver_probe_error_override(xe, err);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 034b29984d5e..d27d843057e7 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1064,6 +1064,10 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
 	int err;
 
+	err = xe_device_inject_driver_probe_error(xe);
+	if (err)
+		return err;
+
 	if (xe->info.skip_guc_pc)
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 3fd462fda625..a4cf082d3261 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -136,6 +136,11 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
 {
 	size_t tile_mmio_size = SZ_16M;
 	size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
+	int err;
+
+	err = xe_device_inject_driver_probe_error(xe);
+	if (err)
+		return err;
 
 	mmio_multi_tile_setup(xe, tile_mmio_size);
 	mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 77ce9f9ca7a5..3de603e0438f 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -56,6 +56,23 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
 MODULE_PARM_DESC(force_probe,
 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+/*
+ * The error code at checkpoint X will be overridden when the module argument
+ * inject_driver_load_error is set to value X. By doing so, it is possible to
+ * test proper error handling and improve robustness for current and future
+ * code. One way to test multiple error injection points:
+ *
+ * for i in {1..200}; do
+ *     echo "Run $i"
+ *     modprobe xe inject_driver_probe_error=$i;
+ *     rmmod xe;
+ * done
+ */
+module_param_named_unsafe(inject_driver_probe_error, xe_modparam.inject_driver_probe_error, int, 0600);
+MODULE_PARM_DESC(inject_driver_probe_error, "Inject driver probe error");
+#endif
+
 #ifdef CONFIG_PCI_IOV
 module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
 MODULE_PARM_DESC(max_vfs,
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 161a5e6f717f..47cefaf8d79b 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -20,6 +20,9 @@ struct xe_modparam {
 	char *force_probe;
 #ifdef CONFIG_PCI_IOV
 	unsigned int max_vfs;
+#endif
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+	int inject_driver_probe_error;
 #endif
 	int wedged_mode;
 };
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3bce0e550a63..9bb60b300727 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -644,8 +644,13 @@ static int xe_info_init(struct xe_device *xe,
 	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
 	struct xe_tile *tile;
 	struct xe_gt *gt;
+	int err;
 	u8 id;
 
+	err = xe_device_inject_driver_probe_error(xe);
+	if (err)
+		return err;
+
 	/*
 	 * If this platform supports GMD_ID, we'll detect the proper IP
 	 * descriptor to use from hardware registers. desc->graphics will only
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 9c59a30d7646..a059be07a11d 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -258,6 +258,7 @@ int xe_pm_init_early(struct xe_device *xe)
 		return err;
 
 	err = drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
+	err = xe_device_inject_driver_probe_error_override(xe, err);
 	if (err)
 		return err;
 
@@ -276,6 +277,10 @@ int xe_pm_init(struct xe_device *xe)
 {
 	int err;
 
+	err = xe_device_inject_driver_probe_error(xe);
+	if (err)
+		return err;
+
 	/* For now suspend/resume is only allowed with GuC */
 	if (!xe_device_uc_enabled(xe))
 		return 0;
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 5a1d65e4f19f..c7512d8acc28 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -102,11 +102,13 @@ static void fini_sriov(struct drm_device *drm, void *arg)
  */
 int xe_sriov_init(struct xe_device *xe)
 {
+	int err;
+
 	if (!IS_SRIOV(xe))
 		return 0;
 
 	if (IS_SRIOV_PF(xe)) {
-		int err = xe_sriov_pf_init_early(xe);
+		err = xe_sriov_pf_init_early(xe);
 
 		if (err)
 			return err;
@@ -114,7 +116,8 @@ int xe_sriov_init(struct xe_device *xe)
 
 	xe_assert(xe, !xe->sriov.wq);
 	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
-	if (!xe->sriov.wq)
+	err = xe_device_inject_driver_probe_error(xe);
+	if (!xe->sriov.wq || err)
 		return -ENOMEM;
 
 	return drmm_add_action_or_reset(&xe->drm, fini_sriov, xe);
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index 0f721ae17b26..8d75bb6570f0 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -80,8 +80,14 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
  */
 int xe_sriov_pf_init_early(struct xe_device *xe)
 {
+	int err;
+
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
+	err = xe_device_inject_driver_probe_error(xe);
+	if (err)
+		return err;
+
 	return drmm_mutex_init(&xe->drm, &xe->sriov.pf.master_lock);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index dda5268507d8..774668ac67b4 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -114,6 +114,10 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 {
 	int err;
 
+	err = xe_device_inject_driver_probe_error(xe);
+	if (err)
+		return err;
+
 	tile->xe = xe;
 	tile->id = id;
 
@@ -127,6 +131,15 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 
 	xe_pcode_init(tile);
 
+	/*
+	 * xe_tile_alloc() and xe_gt_alloc() only fail with -ENOMEM.
+	 * drmm_zalloc() is used so resources will be freed even if
+	 * an error is injected.
+	 */
+	err = xe_device_inject_driver_probe_error(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 0d073a9987c2..6eaef7a3c58e 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -135,6 +135,10 @@ int xe_uc_init_hwconfig(struct xe_uc *uc)
 {
 	int ret;
 
+	ret = xe_device_inject_driver_probe_error(uc_to_xe(uc));
+	if (ret)
+		return ret;
+
 	/* GuC submission not enabled, nothing to do */
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 28b7f95b6c2f..8baad6106968 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -825,6 +825,11 @@ int xe_wa_init(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	size_t n_oob, n_lrc, n_engine, n_gt, total;
 	unsigned long *p;
+	int err;
+
+	err = xe_device_inject_driver_probe_error(xe);
+	if (err)
+		return err;
 
 	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
 	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
@@ -833,7 +838,8 @@ int xe_wa_init(struct xe_gt *gt)
 	total = n_gt + n_engine + n_lrc + n_oob;
 
 	p = drmm_kzalloc(&xe->drm, sizeof(*p) * total, GFP_KERNEL);
-	if (!p)
+	err = xe_device_inject_driver_probe_error(xe);
+	if (!p || err)
 		return -ENOMEM;
 
 	gt->wa_active.gt = p;
diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index d3a99157e523..70674b30c4c6 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -206,6 +206,10 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
 	bool locked;
 	int ret = 0;
 
+	ret = xe_device_inject_driver_probe_error(xe);
+	if (ret)
+		return ret;
+
 	if (!guc_fw_size)
 		return -EINVAL;
 
@@ -252,8 +256,9 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
 		guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
 
 check:
+	ret = xe_device_inject_driver_probe_error_override(xe, ret);
 	if (__check_layout(xe, wopcm->size, guc_wopcm_base, guc_wopcm_size,
-			   guc_fw_size, huc_fw_size)) {
+			   guc_fw_size, huc_fw_size) && !ret) {
 		wopcm->guc.base = guc_wopcm_base;
 		wopcm->guc.size = guc_wopcm_size;
 		XE_WARN_ON(!wopcm->guc.base);
-- 
2.43.0

