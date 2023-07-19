Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DFAEB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 12:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7D110E46B;
	Wed, 19 Jul 2023 12:10:16 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BA010E46B
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 12:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689768614; x=1721304614;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2PU6RDS6Y+ep6Rcxpb3E191NIGHSMqBf74H9Lqtxhns=;
 b=EPJeyC4PT9NEn0o8QzmcMRW5+UMqsSdEDs9NR1NJ/Yaow04n1gTuZALP
 wYV1D/eBtsoQqq8tu8fj8yvFR5xfMNwBiiqF1MPNKFgyhi6kP+YdLUsTm
 feU+oRbwiDYY/SZIcfkTeac0J6/Hay5TlB4CT+iaRfzCGaIJaJM2UCkW8
 JoBYUtct0T/7lMVVukunQB8UKIooEtSdwBrGghno0293dM3KGt5xvrIO5
 pzdaf68z17DryPXb3/rVjwK8QRx+/Z66D/Gckv0bLMBOqwTigeuTPEKth
 blj+BibEazxM+VR5RVNm/LC+ND+Mt2xl7w/1kUiGDmaEMJ9XY/1YG27Ze A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="351310712"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="351310712"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 05:10:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="1054679043"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="1054679043"
Received: from vshulan-mobl1.ccr.corp.intel.com (HELO 93c69208e017.intel.com)
 ([10.251.223.230])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 05:10:11 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Jul 2023 12:09:58 +0000
Message-Id: <20230719120958.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Cleanup style warnings and errors
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix 6 errors and 20 warnings reported by checkpatch.pl.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 .../xe/compat-i915-headers/soc/intel_dram.h   |  5 ++++
 .../xe/compat-i915-headers/soc/intel_pch.h    |  5 ++++
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 --
 drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
 drivers/gpu/drm/xe/xe_execlist.c              |  4 ++--
 drivers/gpu/drm/xe/xe_gt_mcr.c                |  2 +-
 drivers/gpu/drm/xe/xe_gt_sysfs.c              |  1 -
 drivers/gpu/drm/xe/xe_guc.c                   | 14 +++++------
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |  2 +-
 drivers/gpu/drm/xe/xe_map.h                   |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  2 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c         | 24 ++++++++++++++-----
 drivers/gpu/drm/xe/xe_res_cursor.h            | 11 ++++-----
 drivers/gpu/drm/xe/xe_wopcm.c                 | 10 ++++----
 14 files changed, 50 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
index 1532ca7e0af6..65707e20c557 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
@@ -1 +1,6 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
 #include "../../../i915/soc/intel_dram.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
index 823803f7e853..9c46556d33a4 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
@@ -1 +1,6 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
 #include "../../../i915/soc/intel_pch.h"
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index fad4c66a8226..37cba91be10d 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -250,8 +250,6 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 	 * pretend the BIOS never had it enabled.
 	 */
 	intel_plane_disable_noatomic(crtc, plane);
-
-	return;
 }
 
 static void plane_config_fini(struct intel_initial_plane_config *plane_config)
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 8e086c9bd309..828a9fea420b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1821,7 +1821,7 @@ int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
 	XE_BUG_ON(!ww);
 
 	tv_bo.num_shared = num_resv;
-	tv_bo.bo = &bo->ttm;;
+	tv_bo.bo = &bo->ttm;
 	list_add_tail(&tv_bo.head, &objs);
 
 	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 46293c9bb6a8..202789482be1 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -47,7 +47,7 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
 	struct xe_device *xe = gt_to_xe(gt);
 	u64 lrc_desc;
 
-	printk(KERN_INFO "__start_lrc(%s, 0x%p, %u)\n", hwe->name, lrc, ctx_id);
+	printk(KERN_INFO "%s(%s, 0x%p, %u)\n", __func__, hwe->name, lrc, ctx_id);
 
 	lrc_desc = xe_lrc_descriptor(lrc);
 
@@ -125,7 +125,7 @@ static void __xe_execlist_port_idle(struct xe_execlist_port *port)
 	if (!port->running_exl)
 		return;
 
-	printk(KERN_INFO "__xe_execlist_port_idle(%d:%d)\n", port->hwe->class,
+	printk(KERN_INFO "%s(%d:%d)\n", __func__, port->hwe->class,
 	       port->hwe->instance);
 
 	xe_lrc_write_ring(&port->hwe->kernel_lrc, noop, sizeof(noop));
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index ff4075387564..c56815af0686 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -273,7 +273,7 @@ static void init_steering_inst0(struct xe_gt *gt)
 
 static const struct {
 	const char *name;
-	void (*init)(struct xe_gt *);
+	void (*init)(struct xe_gt *gt);
 } xe_steering_types[] = {
 	[L3BANK] =	{ "L3BANK",	init_steering_l3bank },
 	[MSLICE] =	{ "MSLICE",	init_steering_mslice },
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index b955940e8dc6..fa059326b2f4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -38,7 +38,6 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
 
 	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
 	if (!kg) {
-		drm_warn(&xe->drm, "Allocating kobject failed.\n");
 		return;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index ed90d738d673..8ae026838702 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -396,14 +396,12 @@ static int guc_wait_ucode(struct xe_guc *guc)
 		struct drm_printer p = drm_info_printer(drm->dev);
 
 		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
-		drm_info(drm, "GuC load failed: status: Reset = %d, "
-			"BootROM = 0x%02X, UKernel = 0x%02X, "
-			"MIA = 0x%02X, Auth = 0x%02X\n",
-			REG_FIELD_GET(GS_MIA_IN_RESET, status),
-			REG_FIELD_GET(GS_BOOTROM_MASK, status),
-			REG_FIELD_GET(GS_UKERNEL_MASK, status),
-			REG_FIELD_GET(GS_MIA_MASK, status),
-			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
+		drm_info(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
+			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
+			 REG_FIELD_GET(GS_BOOTROM_MASK, status),
+			 REG_FIELD_GET(GS_UKERNEL_MASK, status),
+			 REG_FIELD_GET(GS_MIA_MASK, status),
+			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
 
 		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
 			drm_info(drm, "GuC firmware signature verification failed\n");
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index d788e67312b9..803d557cf5aa 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -104,7 +104,7 @@ struct xe_hw_engine {
 	/** @fence_irq: fence IRQ to run when a hw engine IRQ is received */
 	struct xe_hw_fence_irq *fence_irq;
 	/** @irq_handler: IRQ handler to run when hw engine IRQ is received */
-	void (*irq_handler)(struct xe_hw_engine *, u16);
+	void (*irq_handler)(struct xe_hw_engine *hwe, u16 intr_vec);
 	/** @engine_id: id  for this hw engine */
 	enum xe_hw_engine_id engine_id;
 };
diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
index 032c2e8b5438..f62e0c8b67ab 100644
--- a/drivers/gpu/drm/xe/xe_map.h
+++ b/drivers/gpu/drm/xe/xe_map.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: MIT
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright © 2022 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index f17de52b51f9..444127f37103 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -475,7 +475,7 @@ static void emit_pte(struct xe_migrate *m,
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
 
-			xe_res_next(cur, min(size, (u32)PAGE_SIZE));
+			xe_res_next(cur, min_t(u32, size, PAGE_SIZE));
 			cur_ofs += 8;
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index ea6dd7d71b59..e83781f9a516 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -89,18 +89,30 @@ void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
 	deny = val & RING_FORCE_TO_NONPRIV_DENY;
 
 	switch (val & RING_FORCE_TO_NONPRIV_RANGE_MASK) {
-	case RING_FORCE_TO_NONPRIV_RANGE_4: range_bit = 4; break;
-	case RING_FORCE_TO_NONPRIV_RANGE_16: range_bit = 6; break;
-	case RING_FORCE_TO_NONPRIV_RANGE_64: range_bit = 8; break;
+	case RING_FORCE_TO_NONPRIV_RANGE_4:
+		range_bit = 4;
+		break;
+	case RING_FORCE_TO_NONPRIV_RANGE_16:
+		range_bit = 6;
+		break;
+	case RING_FORCE_TO_NONPRIV_RANGE_64:
+		range_bit = 8;
+		break;
 	}
 
 	range_start = reg & REG_GENMASK(25, range_bit);
 	range_end = range_start | REG_GENMASK(range_bit, 0);
 
 	switch (val & RING_FORCE_TO_NONPRIV_ACCESS_MASK) {
-	case RING_FORCE_TO_NONPRIV_ACCESS_RW: access_str = "rw"; break;
-	case RING_FORCE_TO_NONPRIV_ACCESS_RD: access_str = "read"; break;
-	case RING_FORCE_TO_NONPRIV_ACCESS_WR: access_str = "write"; break;
+	case RING_FORCE_TO_NONPRIV_ACCESS_RW:
+		access_str = "rw";
+		break;
+	case RING_FORCE_TO_NONPRIV_ACCESS_RD:
+		access_str = "read";
+		break;
+	case RING_FORCE_TO_NONPRIV_ACCESS_WR:
+		access_str = "write";
+		break;
 	}
 
 	drm_printf_indent(p, indent, "REG[0x%x-0x%x]: %s %s access\n",
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index 2a6fdd284395..dda963fe3300 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -51,15 +51,14 @@ struct xe_res_cursor {
 static struct drm_buddy *xe_res_get_buddy(struct ttm_resource *res)
 {
 	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
+	struct ttm_resource_manager *mgr;
 
-	if (res->mem_type != XE_PL_STOLEN) {
+	if (res->mem_type != XE_PL_STOLEN)
 		return &xe->tiles[res->mem_type - XE_PL_VRAM0].mem.vram_mgr->mm;
-	} else {
-		struct ttm_resource_manager *mgr =
-			ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
 
-		return &to_xe_ttm_vram_mgr(mgr)->mm;
-	}
+	mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
+
+	return &to_xe_ttm_vram_mgr(mgr)->mm;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index 35fde8965bca..d9acf8783b83 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -47,12 +47,10 @@
  */
 
 /* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
-#define DGFX_WOPCM_SIZE			SZ_4M	/* FIXME: Larger size require
-						   for 2 tile PVC, do a proper
-						   probe sooner or later */
-#define MTL_WOPCM_SIZE			SZ_4M	/* FIXME: Larger size require
-						   for MTL, do a proper probe
-						   sooner or later */
+/* FIXME: Larger size require for 2 tile PVC, do a proper probe sooner or later */
+#define DGFX_WOPCM_SIZE			SZ_4M
+/* FIXME: Larger size require for MTL, do a proper probe sooner or later */
+#define MTL_WOPCM_SIZE			SZ_4M
 #define GEN11_WOPCM_SIZE		SZ_2M
 
 #define GEN12_MAX_WOPCM_SIZE            SZ_8M
-- 
2.34.1

