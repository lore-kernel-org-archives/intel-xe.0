Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82138E81E1F
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 18:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2242110E533;
	Fri,  6 Oct 2023 18:23:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DBE10E4B3
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 18:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696616588; x=1728152588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w4kTTDAWjCEpdhT4JJR2/MA69vhzJJH75jJUN6ZH+m0=;
 b=AfuuqVLhxfOgiqe1CHGIue1ywmA6IMOjUKR1+iqfhSPEhKD8Pf5+n+hK
 CcMa64vvxj2qKCUGBKjh4YQoiepOA6dwcn7jWVCjDTxMQPJlnndcGB0W7
 zj07ZiiaELzMgBiIc5Pfqy6ss/KmR2jG08oEpCqqmTFiNHZmQ5dXSeUyK
 raShMgQcX34hYiqO3HhwpgaJHToNcfi1fUn7by5W6jZ1p6tHa0f4emhPS
 //fcVfvhnIyncMuk1czYRJlu8fcKbJ/0OhXokRIeApNAJGUPxJQXi+lsX
 7a9OBlddcxOwGq2qLTm9dOtsX7gpghFWMaGMdoq6CZmEIMRTMNn87PTFq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="368884724"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="368884724"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 11:23:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="755945484"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="755945484"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 11:23:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 11:23:24 -0700
Message-Id: <20231006182325.3617685-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231006182325.3617685-1-lucas.demarchi@intel.com>
References: <20231006182325.3617685-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 3/4] drm/xe/pat: Add debugfs node to dump PAT
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is useful to debug cache issues, to double check if the PAT
indexes match what they were supposed to be set to from spec.

v2: Add separate functions for XeHP, XeHPC and XeLPG so it correctly
    reads the index based on MCR/REG registers and also decodes the
    fields (Matt Roper)
v3: Starting with XeHPC, do not translate values to human-readable
    formats as the main goal is to make it easy to compare the table
    with the spec. Also, share a single array for xelp/xehp str map
    (Matt Roper)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  12 ++
 drivers/gpu/drm/xe/xe_pat.c        | 192 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pat.h        |   8 ++
 3 files changed, 211 insertions(+), 1 deletion(-)

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
index 296763594370..31565ccbb0ec 100644
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
@@ -40,9 +43,12 @@
 #define XELP_PAT_WC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 1)
 #define XELP_PAT_UC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 0)
 
+static const char *XELP_MEM_TYPE_STR_MAP[] = { "UC", "WC", "WT", "WB" };
+
 struct xe_pat_ops {
 	void (*program_graphics)(struct xe_gt *gt, const u32 table[], int n_entries);
 	void (*program_media)(struct xe_gt *gt, const u32 table[], int n_entries);
+	void (*dump)(struct xe_gt *gt, struct drm_printer *p);
 };
 
 static const u32 xelp_pat_table[] = {
@@ -151,14 +157,132 @@ static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
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
+		u32 pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
+		u8 mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
+
+		drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
+			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
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
+		u32 pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
+		u8 mem_type;
+
+		mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
+
+		drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
+			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
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
+		u32 pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
+
+		drm_printf(p, "PAT[%2d] = [ %u, %u ] (%#8x)\n", i,
+			   REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat),
+			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
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
+		u32 pat;
+
+		if (xe_gt_is_media_type(gt))
+			pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
+		else
+			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
+
+		drm_printf(p, "PAT[%2d] = [ %u, %u ] (%#8x)\n", i,
+			   REG_FIELD_GET(XELPG_L4_POLICY_MASK, pat),
+			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
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
@@ -166,6 +290,7 @@ static const struct xe_pat_ops xehp_pat_ops = {
 static const struct xe_pat_ops xelpg_pat_ops = {
 	.program_graphics = program_pat,
 	.program_media = program_pat_mcr,
+	.dump = xelpg_dump,
 };
 
 static void xe2lpg_program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
@@ -180,9 +305,64 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const u32 table[], int n_entrie
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
@@ -202,7 +382,7 @@ void xe_pat_init_early(struct xe_device *xe)
 		xe->pat.idx[XE_CACHE_WT] = 1;
 		xe->pat.idx[XE_CACHE_WB] = 3;
 	} else if (xe->info.platform == XE_PVC) {
-		xe->pat.ops = &xehp_pat_ops;
+		xe->pat.ops = &xehpc_pat_ops;
 		xe->pat.table = xehpc_pat_table;
 		xe->pat.n_entries = ARRAY_SIZE(xehpc_pat_table);
 		xe->pat.idx[XE_CACHE_NONE] = 0;
@@ -252,3 +432,13 @@ void xe_pat_init(struct xe_gt *gt)
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

