Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71805C3DA4A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 19:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D56C10E529;
	Wed, 14 Aug 2024 19:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e5TOwPg7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6132210E52F
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 19:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723663414; x=1755199414;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0ij2NnIH4LmK2p1IPJfiblCyIDC6xDq4Vng8FbYeL3A=;
 b=e5TOwPg7FpgIwDWgQFcHyvVMNKLcK0kLojOCKzifwCvPOa4yGwvXYlq8
 pYIehjSrcymO4yW+xbwtOS4xzVJnUsfWIXKQXyB+CSGkRhLqBgQidnf5o
 Ya8lWZk2X9nWHOyirUTdpZQ5iGwRMJaag+WEOBue1bMqWUXdMFbOlCb8q
 eyKQTWLiESgGYvdcTXkjpG/cjOgGT6gT7edNaKcVc2zVZdO6KiIuwUeM5
 83kddIYuz55Ir6DALxxC5SixXglPn9ABEA7JS67ht5MvwRGGqnBqpTxMk
 gg8kO6RZAU471CxUjhH828AyyHNM1fTth/Mfx/kxSnDoAy3/cQrIm7cqk g==;
X-CSE-ConnectionGUID: CqgGSB/TSfCg4G1RAI9e5A==
X-CSE-MsgGUID: 5EihDRj4Qei+huoYALZBkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="47305867"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="47305867"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 12:23:34 -0700
X-CSE-ConnectionGUID: FpUZaH60Qy+VJHR7nw/+0A==
X-CSE-MsgGUID: +D7L7VosQAW9FeBSyeXNjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="58754517"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.108])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 12:23:32 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4] drm/xe: Add driver load error injection
Date: Wed, 14 Aug 2024 21:23:22 +0200
Message-ID: <20240814192322.604388-1-francois.dugast@intel.com>
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
manually be called, typically by turning this pattern:

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

    for i in {1..200}; do echo "Run $i"; modprobe xe inject_driver_probe_error=$i; rmmod xe; done

In the future this is expected to be replaced by the infrastructure
provided by fault-inject.h

v2: Fix style and build errors, modparam to 0 after probe, rename to
    xe_device_inject_driver_probe_error, check type when compiled out,
    add _return macro, move some uses to the beginning of the function
v3: Rebase
v4: Improve commit message and comments, keep if/return rather than
    change the flow inside the macro (Lucas De Marchi)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 41 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h       | 23 ++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  5 ++++
 drivers/gpu/drm/xe/xe_gt.c           |  2 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c  |  2 ++
 drivers/gpu/drm/xe/xe_guc.c          |  2 ++
 drivers/gpu/drm/xe/xe_guc_ct.c       |  1 +
 drivers/gpu/drm/xe/xe_mmio.c         |  5 ++++
 drivers/gpu/drm/xe/xe_module.c       |  5 ++++
 drivers/gpu/drm/xe/xe_module.h       |  3 ++
 drivers/gpu/drm/xe/xe_pci.c          |  6 ++++
 drivers/gpu/drm/xe/xe_pm.c           |  5 ++++
 drivers/gpu/drm/xe/xe_sriov.c        |  6 ++++
 drivers/gpu/drm/xe/xe_tile.c         |  4 +++
 drivers/gpu/drm/xe/xe_uc.c           |  1 +
 drivers/gpu/drm/xe/xe_wa.c           |  5 ++++
 drivers/gpu/drm/xe/xe_wopcm.c        |  4 +++
 17 files changed, 120 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 206328387150..a2ccdc4115ac 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -316,6 +316,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
 			      xe->drm.anon_inode->i_mapping,
 			      xe->drm.vma_offset_manager, false, false);
+	err = xe_device_inject_driver_probe_error_override(xe, err);
 	if (WARN_ON(err))
 		goto err;
 
@@ -474,6 +475,7 @@ static int xe_set_dma_info(struct xe_device *xe)
 		goto mask_err;
 
 	err = dma_set_coherent_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
+	err = xe_device_inject_driver_probe_error_override(xe, err);
 	if (err)
 		goto mask_err;
 
@@ -577,6 +579,7 @@ int xe_device_probe_early(struct xe_device *xe)
 		return err;
 
 	err = wait_for_lmem_ready(xe);
+	err = xe_device_inject_driver_probe_error_override(xe, err);
 	if (err)
 		return err;
 
@@ -745,6 +748,11 @@ int xe_device_probe(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_sanitize_freq(gt);
 
+#ifdef CONFIG_DRM_XE_DEBUG
+	/* After probe finishes, stop checking for error injection */
+	xe_modparam.inject_driver_probe_error = 0;
+#endif
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_fini_display:
@@ -995,3 +1003,36 @@ void xe_device_declare_wedged(struct xe_device *xe)
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
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 2c96f1b2aafd..0d0187819e92 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -184,4 +184,27 @@ void xe_device_declare_wedged(struct xe_device *xe);
 struct xe_file *xe_file_get(struct xe_file *xef);
 void xe_file_put(struct xe_file *xef);
 
+#define XE_DEVICE_INJECTED_ERR -ENODEV
+#define xe_device_inject_driver_probe_error(__xe) \
+	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, 0, __func__, __LINE__)
+#define xe_device_inject_driver_probe_error_override(__xe, __err_real) \
+	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, __err_real, __func__, \
+					      __LINE__)
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+
+int __xe_device_inject_driver_probe_error(struct xe_device *xe,
+					  int err_injected, int err_real,
+					  const char *func, int line);
+#else
+
+static inline int __xe_device_inject_driver_probe_error(struct xe_device *xe,
+							int err_injected, int err_real,
+							const char *func, int line)
+{
+	return 0;
+}
+
+#endif
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 16a24eadd94b..5097376aec28 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -491,6 +491,11 @@ struct xe_device {
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
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 58895ed22f6e..b90acc7eedba 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -378,6 +378,7 @@ int xe_gt_init_early(struct xe_gt *gt)
 	xe_reg_sr_init(&gt->reg_sr, "GT", gt_to_xe(gt));
 
 	err = xe_wa_init(gt);
+	err = xe_device_inject_driver_probe_error_override(gt_to_xe(gt), err);
 	if (err)
 		return err;
 
@@ -564,6 +565,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 		goto out_fw;
 
 	err = xe_uc_init_hwconfig(&gt->uc);
+	err = xe_device_inject_driver_probe_error_override(gt_to_xe(gt), err);
 	if (err)
 		goto out_fw;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index ef239440963c..09e1fe745ada 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -7,6 +7,7 @@
 
 #include "regs/xe_regs.h"
 
+#include "xe_device.h"
 #include "xe_gt_sriov_pf.h"
 #include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_helpers.h"
@@ -54,6 +55,7 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
 		return err;
 
 	err = xe_gt_sriov_pf_service_init(gt);
+	err = xe_device_inject_driver_probe_error_override(gt_to_xe(gt), err);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index de0fe9e65746..74e598294f90 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -351,6 +351,7 @@ int xe_guc_init(struct xe_guc *guc)
 		goto out;
 
 	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
+	ret = xe_device_inject_driver_probe_error_override(guc_to_xe(guc), ret);
 	if (ret)
 		goto out;
 
@@ -408,6 +409,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 		return ret;
 
 	ret = xe_guc_pc_init(&guc->pc);
+	ret = xe_device_inject_driver_probe_error_override(guc_to_xe(guc), ret);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index beeeb120d1fc..ed715a252f6a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -194,6 +194,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	ct->bo = bo;
 
 	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
+	err = xe_device_inject_driver_probe_error_override(xe, err);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index bdcc7282385c..af322f5c8159 100644
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
index 923460119cec..806b6c1f8a7f 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -53,6 +53,11 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
 MODULE_PARM_DESC(force_probe,
 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
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
index 3c34b032ebf4..bac07779d353 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -626,6 +626,7 @@ static int xe_info_init_early(struct xe_device *xe,
 				 desc->has_display;
 
 	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
+	err = xe_device_inject_driver_probe_error_override(xe, err);
 	if (err)
 		return err;
 
@@ -645,8 +646,13 @@ static int xe_info_init(struct xe_device *xe,
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
index 9f3c14fd9f33..2de8383b745d 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -228,6 +228,7 @@ int xe_pm_init_early(struct xe_device *xe)
 		return err;
 
 	err = drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
+	err = xe_device_inject_driver_probe_error_override(xe, err);
 	if (err)
 		return err;
 
@@ -246,6 +247,10 @@ int xe_pm_init(struct xe_device *xe)
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
index 5a1d65e4f19f..b19b06c72870 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -102,9 +102,15 @@ static void fini_sriov(struct drm_device *drm, void *arg)
  */
 int xe_sriov_init(struct xe_device *xe)
 {
+	int err;
+
 	if (!IS_SRIOV(xe))
 		return 0;
 
+	err = xe_device_inject_driver_probe_error(xe);
+	if (err)
+		return err;
+
 	if (IS_SRIOV_PF(xe)) {
 		int err = xe_sriov_pf_init_early(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 15ea0a942f67..d70f1f61c096 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -124,6 +124,10 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 	if (IS_ERR(tile->primary_gt))
 		return PTR_ERR(tile->primary_gt);
 
+	err = xe_device_inject_driver_probe_error(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 0d073a9987c2..0c40fbdf21ee 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -59,6 +59,7 @@ int xe_uc_init(struct xe_uc *uc)
 		return 0;
 
 	ret = xe_wopcm_init(&uc->wopcm);
+	ret = xe_device_inject_driver_probe_error_override(uc_to_xe(uc), ret);
 	if (ret)
 		goto err;
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 28b7f95b6c2f..156a77b27593 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -825,6 +825,7 @@ int xe_wa_init(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	size_t n_oob, n_lrc, n_engine, n_gt, total;
 	unsigned long *p;
+	int err;
 
 	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
 	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
@@ -836,6 +837,10 @@ int xe_wa_init(struct xe_gt *gt)
 	if (!p)
 		return -ENOMEM;
 
+	err = xe_device_inject_driver_probe_error(xe);
+	if (err)
+		return err;
+
 	gt->wa_active.gt = p;
 	p += n_gt;
 	gt->wa_active.engine = p;
diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index d3a99157e523..c9be9d31d3ae 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -263,6 +263,10 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
 		return -E2BIG;
 	}
 
+	ret = xe_device_inject_driver_probe_error(xe);
+	if (ret)
+		return ret;
+
 	if (!locked)
 		ret = __wopcm_init_regs(xe, gt, wopcm);
 
-- 
2.43.0

