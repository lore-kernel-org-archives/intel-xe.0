Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5974AE7AD77
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 17:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2737B10E060;
	Tue,  3 Oct 2023 17:08:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED1C10E060
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 17:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696352898; x=1727888898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DR7VwRGPa89ndLJtzZIkEb36Gq1pLh8oGCJB2Xv80j4=;
 b=BWSvoNRD/3WR7UTwLBSLJXt+BKFBWZyuVXmIXVvD5pY0upeE4R+k5sY5
 czbVnSFJqVUgUBFLriz+lsYivOIiGTxHkLV3dOPTJJZcZjvN+suoL+ktC
 VqlU6WrvfjzHNsZvEMNFXG9wT3YCjzoiXkyxLhJfihPXnN95AhNE3yhm0
 G6Rejj+Dkt1qlirG4KDGQUjShXr5w0xHulPSrVcMixr2ejTJPoKoVAD43
 OcMaGjtOJDIGunHGntIXb1jzzc8j+8Vt1dRmptXbIYSzhfu2O2XlhSeLS
 xHiuId203su2tjcJXtvEoG3LBtiWEuW4QSUY99i/k7JdhkAiEWG/hl/Tq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="449421221"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="449421221"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 10:08:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="744586081"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="744586081"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 10:08:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 10:08:26 -0700
Message-Id: <20231003170826.3405759-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003125217.3350838-7-lucas.demarchi@intel.com>
References: <20231003125217.3350838-7-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 6/7] drm/xe/pat: Add debugfs node to dump PAT
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is useful to debug cache issues, to double check if the PAT
indexes match what they were supposed to be set to from spec.

v2: Add separate functions for xehp, xehpc and xelpg so it correctly
    reads the index based on MCR/REG registers and also decodes the
    fields (Matt Roper)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  12 ++
 drivers/gpu/drm/xe/xe_pat.c        | 204 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pat.h        |   8 ++
 3 files changed, 223 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index ec1ae00f6bfc..cd6d28c7b923 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -16,6 +16,7 @@
 #include "xe_gt_topology.h"
 #include "xe_hw_engine.h"
 #include "xe_macros.h"
+#include "xe_pat.h"
 #include "xe_reg_sr.h"
 #include "xe_reg_whitelist.h"
 #include "xe_uc_debugfs.h"
@@ -138,6 +139,16 @@ static int workarounds(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int pat(struct seq_file *m, void *data)
+{
+	struct xe_gt *gt = node_to_gt(m->private);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_pat_dump(gt, &p);
+
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"hw_engines", hw_engines, 0},
 	{"force_reset", force_reset, 0},
@@ -147,6 +158,7 @@ static const struct drm_info_list debugfs_list[] = {
 	{"ggtt", ggtt, 0},
 	{"register-save-restore", register_save_restore, 0},
 	{"workarounds", workarounds, 0},
+	{"pat", pat, 0},
 };
 
 void xe_gt_debugfs_register(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 296763594370..4ca0179d9608 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -6,6 +6,8 @@
 #include "xe_pat.h"
 
 #include "regs/xe_reg_defs.h"
+#include "xe_assert.h"
+#include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_mmio.h"
@@ -14,6 +16,7 @@
 #define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index, 8, \
 								   0x4800, 0x4804, \
 								   0x4848, 0x484c)
+#define _PAT_PTA				0x4820
 
 #define XE2_NO_PROMOTE				REG_BIT(10)
 #define XE2_COMP_EN				REG_BIT(9)
@@ -26,10 +29,12 @@
 #define XELPG_PAT_3_UC				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 3)
 #define XELPG_PAT_1_WT				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 1)
 #define XELPG_PAT_0_WB				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 0)
+#define XELPG_L4_POLICY_STR_MAP			{ "WB", "WT", "(N/A)", "UC" }
 #define XELPG_INDEX_COH_MODE_MASK		REG_GENMASK(1, 0)
 #define XELPG_3_COH_2W				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 3)
 #define XELPG_2_COH_1W				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 2)
 #define XELPG_0_COH_NON				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 0)
+#define XELPG_INDEX_COH_MODE_STR_MAP		{ "NO", "(N/A)", "1-WAY", "2-WAY" }
 
 #define XEHPC_CLOS_LEVEL_MASK			REG_GENMASK(3, 2)
 #define XEHPC_PAT_CLOS(x)			REG_FIELD_PREP(XEHPC_CLOS_LEVEL_MASK, x)
@@ -39,10 +44,12 @@
 #define XELP_PAT_WT				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 2)
 #define XELP_PAT_WC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 1)
 #define XELP_PAT_UC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 0)
+#define XELP_MEM_TYPE_STR_MAP			{ "UC", "WC", "WT", "WB" }
 
 struct xe_pat_ops {
 	void (*program_graphics)(struct xe_gt *gt, const u32 table[], int n_entries);
 	void (*program_media)(struct xe_gt *gt, const u32 table[], int n_entries);
+	void (*dump)(struct xe_gt *gt, struct drm_printer *p);
 };
 
 static const u32 xelp_pat_table[] = {
@@ -151,14 +158,143 @@ static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
 	}
 }
 
+static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int i, err;
+
+	xe_device_mem_access_get(xe);
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
+		goto err_fw;
+
+	drm_printf(p, "PAT table:\n");
+
+	for (i = 0; i < xe->pat.n_entries; i++) {
+		const char *mem_type_map[] = XELP_MEM_TYPE_STR_MAP;
+		u32 pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
+		u8 mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
+
+		drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
+			   mem_type_map[mem_type], pat);
+	}
+
+	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+err_fw:
+	xe_assert(xe, !err);
+	xe_device_mem_access_put(xe);
+}
+
 static const struct xe_pat_ops xelp_pat_ops = {
 	.program_graphics = program_pat,
+	.dump = xelp_dump,
 };
 
+static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int i, err;
+
+	xe_device_mem_access_get(xe);
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
+		goto err_fw;
+
+	drm_printf(p, "PAT table:\n");
+
+	for (i = 0; i < xe->pat.n_entries; i++) {
+		const char *mem_type_map[] = XELP_MEM_TYPE_STR_MAP;
+		u32 pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
+		u8 mem_type;
+
+		mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
+
+		drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
+			   mem_type_map[mem_type], pat);
+	}
+
+	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+err_fw:
+	xe_assert(xe, !err);
+	xe_device_mem_access_put(xe);
+}
+
 static const struct xe_pat_ops xehp_pat_ops = {
 	.program_graphics = program_pat_mcr,
+	.dump = xehp_dump,
+};
+
+static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int i, err;
+
+	xe_device_mem_access_get(xe);
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
+		goto err_fw;
+
+	drm_printf(p, "PAT table:\n");
+
+	for (i = 0; i < xe->pat.n_entries; i++) {
+		const char *mem_type_map[] = XELP_MEM_TYPE_STR_MAP;
+		u32 pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
+		u8 mem_type, clos;
+
+		mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
+		clos = REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat);
+
+		drm_printf(p, "PAT[%2d] = [ %s, clos=%u ] (%#8x)\n", i,
+			   mem_type_map[mem_type], clos, pat);
+	}
+
+	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+err_fw:
+	xe_assert(xe, !err);
+	xe_device_mem_access_put(xe);
+}
+
+static const struct xe_pat_ops xehpc_pat_ops = {
+	.program_graphics = program_pat_mcr,
+	.dump = xehpc_dump,
 };
 
+static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int i, err;
+
+	xe_device_mem_access_get(xe);
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
+		goto err_fw;
+
+	drm_printf(p, "PAT table:\n");
+
+	for (i = 0; i < xe->pat.n_entries; i++) {
+		const char *l4_policy_map[] = XELPG_L4_POLICY_STR_MAP;
+		const char *coh_map[] = XELPG_INDEX_COH_MODE_STR_MAP;
+		u8 l4_policy, coh;
+		u32 pat;
+
+		if (xe_gt_is_media_type(gt))
+			pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
+		else
+			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
+
+		l4_policy = REG_FIELD_GET(XELPG_L4_POLICY_MASK, pat);
+		coh = REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat);
+
+		drm_printf(p, "PAT[%2d] = [ l4_policy=%s, coh=%s ] (%#8x)\n", i,
+			   l4_policy_map[l4_policy], coh_map[coh], pat);
+	}
+
+	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+err_fw:
+	xe_assert(xe, !err);
+	xe_device_mem_access_put(xe);
+}
+
 /*
  * SAMedia register offsets are adjusted by the write methods and they target
  * registers that are not MCR, while for normal GT they are MCR
@@ -166,6 +302,7 @@ static const struct xe_pat_ops xehp_pat_ops = {
 static const struct xe_pat_ops xelpg_pat_ops = {
 	.program_graphics = program_pat,
 	.program_media = program_pat_mcr,
+	.dump = xelpg_dump,
 };
 
 static void xe2lpg_program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
@@ -180,9 +317,64 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const u32 table[], int n_entrie
 	xe_mmio_write32(gt, XE_REG(_PAT_ATS), XE2_PAT_ATS);
 }
 
+static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int i, err;
+	u32 pat;
+
+	xe_device_mem_access_get(xe);
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
+		goto err_fw;
+
+	drm_printf(p, "PAT table:\n");
+
+	for (i = 0; i < xe->pat.n_entries; i++) {
+		if (xe_gt_is_media_type(gt))
+			pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
+		else
+			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
+
+		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n", i,
+			   !!(pat & XE2_NO_PROMOTE),
+			   !!(pat & XE2_COMP_EN),
+			   REG_FIELD_GET(XE2_L3_CLOS, pat),
+			   REG_FIELD_GET(XE2_L3_POLICY, pat),
+			   REG_FIELD_GET(XE2_L4_POLICY, pat),
+			   REG_FIELD_GET(XE2_COH_MODE, pat),
+			   pat);
+	}
+
+	/*
+	 * Also print PTA_MODE, which describes how the hardware accesses
+	 * PPGTT entries.
+	 */
+	if (xe_gt_is_media_type(gt))
+		pat = xe_mmio_read32(gt, XE_REG(_PAT_PTA));
+	else
+		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
+
+	drm_printf(p, "Page Table Access:\n");
+	drm_printf(p, "PTA_MODE= [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n",
+		   !!(pat & XE2_NO_PROMOTE),
+		   !!(pat & XE2_COMP_EN),
+		   REG_FIELD_GET(XE2_L3_CLOS, pat),
+		   REG_FIELD_GET(XE2_L3_POLICY, pat),
+		   REG_FIELD_GET(XE2_L4_POLICY, pat),
+		   REG_FIELD_GET(XE2_COH_MODE, pat),
+		   pat);
+
+	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+err_fw:
+	xe_assert(xe, !err);
+	xe_device_mem_access_put(xe);
+}
+
 static const struct xe_pat_ops xe2_pat_ops = {
 	.program_graphics = xe2lpg_program_pat,
 	.program_media = xe2lpm_program_pat,
+	.dump = xe2_dump,
 };
 
 void xe_pat_init_early(struct xe_device *xe)
@@ -202,7 +394,7 @@ void xe_pat_init_early(struct xe_device *xe)
 		xe->pat.idx[XE_CACHE_WT] = 1;
 		xe->pat.idx[XE_CACHE_WB] = 3;
 	} else if (xe->info.platform == XE_PVC) {
-		xe->pat.ops = &xehp_pat_ops;
+		xe->pat.ops = &xehpc_pat_ops;
 		xe->pat.table = xehpc_pat_table;
 		xe->pat.n_entries = ARRAY_SIZE(xehpc_pat_table);
 		xe->pat.idx[XE_CACHE_NONE] = 0;
@@ -252,3 +444,13 @@ void xe_pat_init(struct xe_gt *gt)
 	else
 		xe->pat.ops->program_graphics(gt, xe->pat.table, xe->pat.n_entries);
 }
+
+void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (!xe->pat.ops->dump)
+		return;
+
+	xe->pat.ops->dump(gt, p);
+}
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index 168e80e63809..09c491ab9f15 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -6,6 +6,7 @@
 #ifndef _XE_PAT_H_
 #define _XE_PAT_H_
 
+struct drm_printer;
 struct xe_gt;
 struct xe_device;
 
@@ -21,4 +22,11 @@ void xe_pat_init_early(struct xe_device *xe);
  */
 void xe_pat_init(struct xe_gt *gt);
 
+/**
+ * xe_pat_dump - Dump PAT table
+ * @gt: GT structure
+ * @p: Printer to dump info to
+ */
+void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
+
 #endif
-- 
2.40.1

