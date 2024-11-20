Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D30D743F3
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 23:44:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5995410E14C;
	Wed, 20 Nov 2024 23:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nfdkyF/D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFAC10E09A
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Nov 2024 23:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732146244; x=1763682244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JF/rLd72yBaNerqk3aOInUTtEKbNxGgCKikBsNwY9HU=;
 b=nfdkyF/DbLNeNWtFr0GOq/ZFfu9bLMbhe/wdWX74dFhD58OhDTUmpvgh
 9vEwMXWNWBPSOkb7rL6ApaQE+fvaOJTM/v+lC5Ql7eZvRLwlIMxBU4vZF
 HzZiHYzGUc6s4JUC9q3ifoy+7z4OIcZ0NZyJUbyoMMAHoRuJHhfUJNDUQ
 GzxkDtS0vZbpDrly4RZdzcemZa3btJwF2nU57pBatnQmbU2moAgRALGb2
 d4JaWs8jhpHkFWuCA5rq7idrlDjg/Lo+Zg/tsXVBLXcVZMMboELTquHhu
 bnQ+3lOCZ997c5opzj3tEtNetaNm+rrD3LSekz1GuJcBqC3eHqo4ExcdK A==;
X-CSE-ConnectionGUID: iCf0P+q7TEOiOxl6ZbT5nQ==
X-CSE-MsgGUID: XFS48WjOSd6Kk3kciK3o9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="54733274"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="54733274"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:44:04 -0800
X-CSE-ConnectionGUID: awTFG271RRioRAvUBT2tag==
X-CSE-MsgGUID: Q3jSXd6rRh6IByroIdkpdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="90453625"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:44:04 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 01/12] drm/xe/pxp: Initialize PXP structure and KCR reg
Date: Wed, 20 Nov 2024 15:43:41 -0800
Message-ID: <20241120234353.1037180-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
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

As the first step towards adding PXP support, hook in the PXP init
function, allocate the PXP structure and initialize the KCR register to
allow PXP HWDRM sessions.

v2: remove unneeded includes, free PXP memory on error (John)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../xe/compat-i915-headers/pxp/intel_pxp.h    |   4 +-
 drivers/gpu/drm/xe/regs/xe_pxp_regs.h         |  17 +++
 drivers/gpu/drm/xe/xe_device.c                |   6 +
 drivers/gpu/drm/xe/xe_device_types.h          |   8 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +
 drivers/gpu/drm/xe/xe_pxp.c                   | 107 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_pxp.h                   |  13 +++
 drivers/gpu/drm/xe/xe_pxp_types.h             |  26 +++++
 9 files changed, 180 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_pxp_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_pxp.c
 create mode 100644 drivers/gpu/drm/xe/xe_pxp.h
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a93e6fcc0ad9..3c0bd3c814de 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -86,6 +86,7 @@ xe-y += xe_bb.o \
 	xe_preempt_fence.o \
 	xe_pt.o \
 	xe_pt_walk.o \
+	xe_pxp.o \
 	xe_query.o \
 	xe_range_fence.o \
 	xe_reg_sr.o \
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
index 5dfc587c8237..419e8e926f00 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
@@ -10,9 +10,9 @@
 #include <linux/types.h>
 
 struct drm_gem_object;
-struct intel_pxp;
+struct xe_pxp;
 
-static inline int intel_pxp_key_check(struct intel_pxp *pxp,
+static inline int intel_pxp_key_check(struct xe_pxp *pxp,
 				      struct drm_gem_object *obj,
 				      bool assign)
 {
diff --git a/drivers/gpu/drm/xe/regs/xe_pxp_regs.h b/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
new file mode 100644
index 000000000000..d67cf210d23d
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2024, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __XE_PXP_REGS_H__
+#define __XE_PXP_REGS_H__
+
+#include "regs/xe_regs.h"
+
+/* The following registers are only valid on platforms with a media GT */
+
+/* KCR enable/disable control */
+#define KCR_INIT				XE_REG(0x3860f0)
+#define   KCR_INIT_ALLOW_DISPLAY_ME_WRITES	REG_BIT(14)
+
+#endif /* __XE_PXP_REGS_H__ */
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 930bb2750e2e..b79cf470c169 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -49,6 +49,7 @@
 #include "xe_pat.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
+#include "xe_pxp.h"
 #include "xe_query.h"
 #include "xe_sriov.h"
 #include "xe_tile.h"
@@ -746,6 +747,11 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_fini_oa;
 
+	/* A PXP init failure is not fatal */
+	err = xe_pxp_init(xe);
+	if (err && err != -EOPNOTSUPP)
+		drm_err(&xe->drm, "PXP initialization failed: %pe\n", ERR_PTR(err));
+
 	err = drm_dev_register(&xe->drm, 0);
 	if (err)
 		goto err_fini_display;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8592f1b02db1..7f420d2e3ccc 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -34,6 +34,7 @@
 
 struct xe_ggtt;
 struct xe_pat_ops;
+struct xe_pxp;
 
 #define XE_BO_INVALID_OFFSET	LONG_MAX
 
@@ -306,6 +307,8 @@ struct xe_device {
 		u8 has_llc:1;
 		/** @info.has_mmio_ext: Device has extra MMIO address range */
 		u8 has_mmio_ext:1;
+		/** @info.has_pxp: Device has PXP support */
+		u8 has_pxp:1;
 		/** @info.has_range_tlb_invalidation: Has range based TLB invalidations */
 		u8 has_range_tlb_invalidation:1;
 		/** @info.has_sriov: Supports SR-IOV */
@@ -496,6 +499,9 @@ struct xe_device {
 	/** @oa: oa observation subsystem */
 	struct xe_oa oa;
 
+	/** @pxp: Encapsulate Protected Xe Path support */
+	struct xe_pxp *pxp;
+
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
@@ -568,8 +574,6 @@ struct xe_device {
 		unsigned int czclk_freq;
 		unsigned int fsb_freq, mem_freq, is_ddr3;
 	};
-
-	void *pxp;
 #endif
 };
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 9b81e7d00a86..de5034979ec3 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -62,6 +62,7 @@ struct xe_device_desc {
 	u8 has_heci_cscfi:1;
 	u8 has_llc:1;
 	u8 has_mmio_ext:1;
+	u8 has_pxp:1;
 	u8 has_sriov:1;
 	u8 skip_guc_pc:1;
 	u8 skip_mtcfg:1;
@@ -623,6 +624,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
 	xe->info.has_llc = desc->has_llc;
 	xe->info.has_mmio_ext = desc->has_mmio_ext;
+	xe->info.has_pxp = desc->has_pxp;
 	xe->info.has_sriov = desc->has_sriov;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
new file mode 100644
index 000000000000..1a4d12d37d96
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2024 Intel Corporation.
+ */
+
+#include "xe_pxp.h"
+
+#include <drm/drm_managed.h>
+
+#include "xe_device_types.h"
+#include "xe_force_wake.h"
+#include "xe_gt.h"
+#include "xe_gt_types.h"
+#include "xe_mmio.h"
+#include "xe_pxp_types.h"
+#include "xe_uc_fw.h"
+#include "regs/xe_pxp_regs.h"
+
+/**
+ * DOC: PXP
+ *
+ * PXP (Protected Xe Path) allows execution and flip to display of protected
+ * (i.e. encrypted) objects. This feature is currently only supported in
+ * integrated parts.
+ */
+
+static bool pxp_is_supported(const struct xe_device *xe)
+{
+	return xe->info.has_pxp && IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY);
+}
+
+static int kcr_pxp_set_status(const struct xe_pxp *pxp, bool enable)
+{
+	u32 val = enable ? _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES) :
+		  _MASKED_BIT_DISABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES);
+	unsigned int fw_ref;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(pxp->gt), XE_FW_GT);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT))
+		return -EIO;
+
+	xe_mmio_write32(&pxp->gt->mmio, KCR_INIT, val);
+	xe_force_wake_put(gt_to_fw(pxp->gt), fw_ref);
+
+	return 0;
+}
+
+static int kcr_pxp_enable(const struct xe_pxp *pxp)
+{
+	return kcr_pxp_set_status(pxp, true);
+}
+
+/**
+ * xe_pxp_init - initialize PXP support
+ * @xe: the xe_device structure
+ *
+ * Initialize the HW state and allocate the objects required for PXP support.
+ * Note that some of the requirement for PXP support (GSC proxy init, HuC auth)
+ * are performed asynchronously as part of the GSC init. PXP can only be used
+ * after both this function and the async worker have completed.
+ *
+ * Returns -EOPNOTSUPP if PXP is not supported, 0 if PXP initialization is
+ * successful, other errno value if there is an error during the init.
+ */
+int xe_pxp_init(struct xe_device *xe)
+{
+	struct xe_gt *gt = xe->tiles[0].media_gt;
+	struct xe_pxp *pxp;
+	int err;
+
+	if (!pxp_is_supported(xe))
+		return -EOPNOTSUPP;
+
+	/* we only support PXP on single tile devices with a media GT */
+	if (xe->info.tile_count > 1 || !gt)
+		return -EOPNOTSUPP;
+
+	/* The GSCCS is required for submissions to the GSC FW */
+	if (!(gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0)))
+		return -EOPNOTSUPP;
+
+	/* PXP requires both GSC and HuC firmwares to be available */
+	if (!xe_uc_fw_is_loadable(&gt->uc.gsc.fw) ||
+	    !xe_uc_fw_is_loadable(&gt->uc.huc.fw)) {
+		drm_info(&xe->drm, "skipping PXP init due to missing FW dependencies");
+		return -EOPNOTSUPP;
+	}
+
+	pxp = drmm_kzalloc(&xe->drm, sizeof(struct xe_pxp), GFP_KERNEL);
+	if (!pxp)
+		return -ENOMEM;
+
+	pxp->xe = xe;
+	pxp->gt = gt;
+
+	err = kcr_pxp_enable(pxp);
+	if (err)
+		goto out_free;
+
+	xe->pxp = pxp;
+
+	return 0;
+
+out_free:
+	drmm_kfree(&xe->drm, pxp);
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
new file mode 100644
index 000000000000..00f5e688c0d9
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pxp.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2024, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __XE_PXP_H__
+#define __XE_PXP_H__
+
+struct xe_device;
+
+int xe_pxp_init(struct xe_device *xe);
+
+#endif /* __XE_PXP_H__ */
diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
new file mode 100644
index 000000000000..4639cf49d267
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pxp_types.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2024, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __XE_PXP_TYPES_H__
+#define __XE_PXP_TYPES_H__
+
+struct xe_device;
+struct xe_gt;
+
+/**
+ * struct xe_pxp - pxp state
+ */
+struct xe_pxp {
+	/** @xe: Backpoiner to the xe_device struct */
+	struct xe_device *xe;
+
+	/**
+	 * @gt: pointer to the gt that owns the submission-side of PXP
+	 * (VDBOX, KCR and GSC)
+	 */
+	struct xe_gt *gt;
+};
+
+#endif /* __XE_PXP_TYPES_H__ */
-- 
2.43.0

