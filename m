Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EDEC531DE
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 01:54:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3CE10EA5B;
	Sat, 10 Aug 2024 01:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A0nSAXLF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F2C10EA56
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Aug 2024 01:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723254894; x=1754790894;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=G4yzJdxG/Y86CbzAvlXg5FAeNnVkMuKEirkPtQW7H+Y=;
 b=A0nSAXLF22jgN+cpt82wOyNTPX4u3WP2gwO9IhBGcAbjbgkj3EXQXeXu
 K5HBKtSE1IaW4WiYvyfGwe2eUaOW8+7i71GI03MQI77DXASdNpBQYfAik
 Z4+MIxU7o/KmJM2RnXX4wfG2Icju7+GtVm8avSLrgYK+v1/XyoUERtlaj
 TOAG4l+wI/Btsfdr+LwcJxFoZeOrBrFNmSZ1M98v25Y3C1iuUq/fPeuSE
 KiuvxGfa1hBoYPWWtXC54UGDOyh6zE9jY64U3NtS+fYyx2ZR5bf9wAQoo
 sZGX4uSzlZAvU6Z/aET5DER6q4fikWuRm329qM9Sh8gDimI7bPiOPr4XU Q==;
X-CSE-ConnectionGUID: lOKChkkgQ8C4CltvcFASQw==
X-CSE-MsgGUID: MYhmc2fpRVK2foawfXYlYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21420027"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="21420027"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:53 -0700
X-CSE-ConnectionGUID: UHpixYP0TXSorXujskrdAg==
X-CSE-MsgGUID: yGHvMarXSdGmBmjZC/Dc5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="57813385"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 05/11] drm/xe: Add driver load error injection
Date: Fri,  9 Aug 2024 18:55:38 -0700
Message-Id: <20240810015544.3443258-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810015544.3443258-1-matthew.brost@intel.com>
References: <20240810015544.3443258-1-matthew.brost@intel.com>
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

Port over i915 driver load error injection.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 31 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h       | 15 ++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
 drivers/gpu/drm/xe/xe_gt.c           |  5 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c  |  4 ++++
 drivers/gpu/drm/xe/xe_guc.c          |  8 +++++++
 drivers/gpu/drm/xe/xe_guc_ads.c      |  5 +++++
 drivers/gpu/drm/xe/xe_guc_ct.c       |  4 ++++
 drivers/gpu/drm/xe/xe_guc_log.c      |  5 +++++
 drivers/gpu/drm/xe/xe_mmio.c         |  5 +++++
 drivers/gpu/drm/xe/xe_module.c       |  5 +++++
 drivers/gpu/drm/xe/xe_module.h       |  3 +++
 drivers/gpu/drm/xe/xe_pci.c          |  9 ++++++++
 drivers/gpu/drm/xe/xe_pm.c           |  8 +++++++
 drivers/gpu/drm/xe/xe_sriov.c        |  8 ++++++-
 drivers/gpu/drm/xe/xe_tile.c         |  4 ++++
 drivers/gpu/drm/xe/xe_uc.c           |  4 ++++
 drivers/gpu/drm/xe/xe_wa.c           |  5 +++++
 drivers/gpu/drm/xe/xe_wopcm.c        |  4 ++++
 19 files changed, 135 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1aba6f9eaa19..f6cd13ed6d20 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -374,6 +374,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (WARN_ON(err))
 		goto err;
 
+	err = xe_device_inject_driver_load_error(xe);
+	if (err)
+		goto err;
+
 	return xe;
 
 err:
@@ -477,6 +481,10 @@ static int xe_set_dma_info(struct xe_device *xe)
 	if (err)
 		goto mask_err;
 
+	err = xe_device_inject_driver_load_error(xe);
+	if (err)
+		goto mask_err;
+
 	return 0;
 
 mask_err:
@@ -580,6 +588,10 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_device_inject_driver_load_error(xe);
+	if (err)
+		return err;
+
 	xe->wedged.mode = xe_modparam.wedged_mode;
 
 	return 0;
@@ -995,3 +1007,22 @@ void xe_device_declare_wedged(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_declare_wedged(gt);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+int __xe_device_inject_driver_load_error(struct xe_device *xe, int err,
+					 const char *func, int line)
+{
+        if (xe->inject_driver_load_error >= xe_modparam.inject_driver_load_error)
+                return 0;
+
+        if (++xe->inject_driver_load_error < xe_modparam.inject_driver_load_error)
+                return 0;
+
+        drm_info(&xe->drm, "Injecting failure %d at checkpoint %u [%s:%d]\n",
+                 err, xe->inject_driver_load_error, func, line);
+
+        xe_modparam.inject_driver_load_error = 0;
+        return err;
+
+}
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index db6cc8d0d6b8..4f7e9cdac9fe 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -179,4 +179,19 @@ void xe_device_declare_wedged(struct xe_device *xe);
 struct xe_file *xe_file_get(struct xe_file *xef);
 void xe_file_put(struct xe_file *xef);
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+
+int __xe_device_inject_driver_load_error(struct xe_device *xe, int err,
+					 const char *func, int line);
+
+#define xe_device_inject_driver_load_error(__xe) \
+	__xe_device_inject_driver_load_error(__xe, -ENODEV, __func__, __LINE__)
+
+#else
+
+#define xe_device_inject_driver_load_error(__xe) \
+	({ BUILD_BUG_ON_INVALID(__xe); 0; })
+
+#endif
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5b7292a9a66d..3e620314eec2 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -484,6 +484,10 @@ struct xe_device {
 		int mode;
 	} wedged;
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+	int inject_driver_load_error;
+#endif
+
 #ifdef TEST_VM_OPS_ERROR
 	/**
 	 * @vm_inject_error_position: inject errors at different places in VM
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 58895ed22f6e..8209079c0334 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -389,6 +389,10 @@ int xe_gt_init_early(struct xe_gt *gt)
 	xe_pcode_init(gt);
 	spin_lock_init(&gt->global_invl_lock);
 
+	err = xe_device_inject_driver_load_error(gt_to_xe(gt));
+	if (err)
+		return err;
+
 	return 0;
 }
 
@@ -570,6 +574,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 	xe_gt_topology_init(gt);
 	xe_gt_mcr_init(gt);
 
+	err = xe_device_inject_driver_load_error(gt_to_xe(gt));
 out_fw:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 out:
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index ef239440963c..897815ddf954 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -57,6 +57,10 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	err = xe_device_inject_driver_load_error(gt_to_xe(gt));
+	if (err)
+		return err;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index de0fe9e65746..980691c178c4 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -354,6 +354,10 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
+	ret = xe_device_inject_driver_load_error(guc_to_xe(guc));
+	if (ret)
+		goto out;
+
 	guc_init_params(guc);
 
 	xe_guc_comm_init_early(guc);
@@ -411,6 +415,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
+	ret = xe_device_inject_driver_load_error(guc_to_xe(guc));
+	if (ret)
+		return ret;
+
 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index d1902a8581ca..1944912ef9b8 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -402,6 +402,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 	struct xe_gt *gt = ads_to_gt(ads);
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_bo *bo;
+	int err;
 
 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
 	ads->regset_size = calculate_regset_size(gt);
@@ -416,6 +417,10 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 
 	ads->bo = bo;
 
+	err = xe_device_inject_driver_load_error(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index beeeb120d1fc..76a26aaabb13 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -197,6 +197,10 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	if (err)
 		return err;
 
+	err = xe_device_inject_driver_load_error(xe);
+	if (err)
+		return err;
+
 	xe_gt_assert(gt, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
 	ct->state = XE_GUC_CT_STATE_DISABLED;
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index a37ee3419428..f26c37e3ee3a 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -82,6 +82,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
 	struct xe_device *xe = log_to_xe(log);
 	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
 	struct xe_bo *bo;
+	int err;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
 					  XE_BO_FLAG_SYSTEM |
@@ -94,5 +95,9 @@ int xe_guc_log_init(struct xe_guc_log *log)
 	log->bo = bo;
 	log->level = xe_modparam.guc_log_level;
 
+	err = xe_device_inject_driver_load_error(log_to_xe(log));
+	if (err)
+		return err;
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f5bdb540e823..12ad2f73e8a4 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -137,6 +137,11 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
 {
 	size_t tile_mmio_size = SZ_16M;
 	size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
+	int err;
+
+	err = xe_device_inject_driver_load_error(xe);
+	if (err)
+		return err;
 
 	mmio_multi_tile_setup(xe, tile_mmio_size);
 	mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 7bb99e451fcc..972b64a9f514 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -53,6 +53,11 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
 MODULE_PARM_DESC(force_probe,
 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+module_param_named_unsafe(inject_driver_load_error, xe_modparam.inject_driver_load_error, int, 0600);
+MODULE_PARM_DESC(inject_driver_load_error, "Inject driver load error");
+#endif
+
 #ifdef CONFIG_PCI_IOV
 module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
 MODULE_PARM_DESC(max_vfs,
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 61a0d28a28c8..409ea10be942 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -20,6 +20,9 @@ struct xe_modparam {
 	char *force_probe;
 #ifdef CONFIG_PCI_IOV
 	unsigned int max_vfs;
+#endif
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+	int inject_driver_load_error;
 #endif
 	int wedged_mode;
 };
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index f818aa69f3ca..8b278c83128a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -629,6 +629,10 @@ static int xe_info_init_early(struct xe_device *xe,
 	if (err)
 		return err;
 
+	err = xe_device_inject_driver_load_error(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 
@@ -645,6 +649,7 @@ static int xe_info_init(struct xe_device *xe,
 	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
 	struct xe_tile *tile;
 	struct xe_gt *gt;
+	int err;
 	u8 id;
 
 	/*
@@ -745,6 +750,10 @@ static int xe_info_init(struct xe_device *xe,
 		gt->info.id = xe->info.gt_count++;
 	}
 
+	err = xe_device_inject_driver_load_error(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 9f3c14fd9f33..64d992c12364 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -231,6 +231,10 @@ int xe_pm_init_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_device_inject_driver_load_error(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 
@@ -264,6 +268,10 @@ int xe_pm_init(struct xe_device *xe)
 
 	xe_pm_runtime_init(xe);
 
+	err = xe_device_inject_driver_load_error(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 5a1d65e4f19f..1e738f1d80df 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -102,11 +102,17 @@ static void fini_sriov(struct drm_device *drm, void *arg)
  */
 int xe_sriov_init(struct xe_device *xe)
 {
+	int err;
+
 	if (!IS_SRIOV(xe))
 		return 0;
 
+	err = xe_device_inject_driver_load_error(xe);
+	if (err)
+		return err;
+
 	if (IS_SRIOV_PF(xe)) {
-		int err = xe_sriov_pf_init_early(xe);
+		err = xe_sriov_pf_init_early(xe);
 
 		if (err)
 			return err;
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 15ea0a942f67..2d25c7b59b0d 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -124,6 +124,10 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 	if (IS_ERR(tile->primary_gt))
 		return PTR_ERR(tile->primary_gt);
 
+	err = xe_device_inject_driver_load_error(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 0d073a9987c2..a3786020838b 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -62,6 +62,10 @@ int xe_uc_init(struct xe_uc *uc)
 	if (ret)
 		goto err;
 
+	ret = xe_device_inject_driver_load_error(uc_to_xe(uc));
+	if (ret)
+		goto err;
+
 	return 0;
 
 err:
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 564e32e44e3b..e558715d8027 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -821,6 +821,7 @@ int xe_wa_init(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	size_t n_oob, n_lrc, n_engine, n_gt, total;
 	unsigned long *p;
+	int err;
 
 	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
 	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
@@ -840,6 +841,10 @@ int xe_wa_init(struct xe_gt *gt)
 	p += n_lrc;
 	gt->wa_active.oob = p;
 
+	err = xe_device_inject_driver_load_error(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index d3a99157e523..edaad1c93e58 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -263,6 +263,10 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
 		return -E2BIG;
 	}
 
+	ret = xe_device_inject_driver_load_error(xe);
+	if (ret)
+		return ret;
+
 	if (!locked)
 		ret = __wopcm_init_regs(xe, gt, wopcm);
 
-- 
2.34.1

