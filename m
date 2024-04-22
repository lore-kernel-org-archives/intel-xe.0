Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012FAC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 10:05:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744F2112960;
	Mon, 22 Apr 2024 10:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P/aHanWb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8ECE112953
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 10:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713780320; x=1745316320;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=afTfC7z4+cv+1kW1L7BoyLZCS+B/MGbX5lNA9pZ/1Yk=;
 b=P/aHanWbbcze2loMa3Vc4gUT15bpEqgmvc615eLai0JMfTPiNre75gT9
 g3IPIlhpH7Fkgme3RqhRECpHr5xbykC9NYA55sJywDXbS9TVOpi6LwYaL
 Awk3olKEeRl0rzo8wiqImS0ox9UuJ4HmFh5aBKmYUtFPi8WABE+q0a0XT
 jPQDDUfzHpy5g+IEvpp/P+H7rWzXL37p+rq7KEPgaRBoFRpAmvXyRyXrg
 FS+/qTl/n/Gh25dlopNWIPBxwuuQGMpdmXj+4/CdquO/PcmbEUYOcXpI0
 XSHmQQ8UekhxI9oJKBPkxIAT0fIbiwvCcq/97qgrYOfc5MkTHiMYDid9/ Q==;
X-CSE-ConnectionGUID: Sq/o2q5MSs2Apb3743AbhA==
X-CSE-MsgGUID: n5hWZwZ2Q+KROHQ6TL10ZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9166743"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="9166743"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 03:05:20 -0700
X-CSE-ConnectionGUID: go3CnYQOQt+qwlFYK4zBkg==
X-CSE-MsgGUID: SutpdzUWTiWAH8Ez4ojA/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="23997038"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by fmviesa009.fm.intel.com with ESMTP; 22 Apr 2024 03:05:16 -0700
From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
To: intel-xe@lists.freedesktop.org, janga.rahul.kumar@intel.com,
 ramadevi.gandi@intel.com
Cc: matthew.d.roper@intel.com,
	lucas.demarchi@intel.com
Subject: [PATCH v2] drm/xe/mocs: Add debugfs node to dump mocs
Date: Mon, 22 Apr 2024 15:35:50 +0530
Message-Id: <20240422100550.1088856-1-janga.rahul.kumar@intel.com>
X-Mailer: git-send-email 2.25.1
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

This is useful to check mocs configuration. Tests/Tools can use
this debugfs entry to get mocs info.

v2: Address review comments. Change debugfs output style similar
to pat debugfs. (Lucas De Marchi)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  11 ++
 drivers/gpu/drm/xe/xe_mocs.c       | 274 +++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_mocs.h       |   8 +
 3 files changed, 283 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index ff7f4cf52fa9..041eef92b705 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -17,6 +17,7 @@
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
+#include "xe_mocs.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
 #include "xe_reg_sr.h"
@@ -198,6 +199,15 @@ static int pat(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
+static int mocs(struct xe_gt *gt, struct drm_printer *p)
+{
+	xe_pm_runtime_get(gt_to_xe(gt));
+	xe_mocs_dump(gt, p);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
+	return 0;
+}
+
 static int rcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
 	xe_pm_runtime_get(gt_to_xe(gt));
@@ -253,6 +263,7 @@ static const struct drm_info_list debugfs_list[] = {
 	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
 	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
 	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
+	{"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
 	{"default_lrc_rcs", .show = xe_gt_debugfs_simple_show, .data = rcs_default_lrc},
 	{"default_lrc_ccs", .show = xe_gt_debugfs_simple_show, .data = ccs_default_lrc},
 	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 1e92f8ee07ba..e45d2b2caadf 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -43,6 +43,8 @@ struct xe_mocs_info {
 	u8 uc_index;
 	u8 wb_index;
 	u8 unused_entries_index;
+	void (*dump)(struct xe_mocs_info *mocs, unsigned int flags,
+		     struct xe_gt *gt, struct drm_printer *p);
 };
 
 /* Defines for the tables (XXX_MOCS_0 - XXX_MOCS_63) */
@@ -57,6 +59,17 @@ struct xe_mocs_info {
 #define LE_COS(value)		((value) << 15)
 #define LE_SSE(value)		((value) << 17)
 
+#define LE_CACHEABILITY_MASK	REG_GENMASK(1, 0)
+#define LE_TGT_CACHE_MASK	REG_GENMASK(3, 2)
+#define LE_LRUM_MASK		REG_GENMASK(5, 4)
+#define LE_AOM_MASK		REG_BIT(6)
+#define LE_RSC_MASK		REG_BIT(7)
+#define LE_SCC_MASK		REG_GENMASK(10, 8)
+#define LE_PFM_MASK		REG_GENMASK(13, 11)
+#define LE_SCF_MASK		REG_BIT(14)
+#define LE_COS_MASK		REG_GENMASK(16, 15)
+#define LE_SSE_MASK		REG_GENMASK(18, 17)
+
 /* Defines for the tables (LNCFMOCS0 - LNCFMOCS31) - two entries per word */
 #define L3_ESC(value)		((value) << 0)
 #define L3_SCC(value)		((value) << 1)
@@ -64,6 +77,17 @@ struct xe_mocs_info {
 #define L3_GLBGO(value)		((value) << 6)
 #define L3_LKUP(value)		((value) << 7)
 
+#define L3_ESC_MASK			REG_BIT(0)
+#define L3_SCC_MASK			REG_GENMASK(3, 1)
+#define L3_CACHEABILITY_MASK		REG_GENMASK(5, 4)
+#define L3_GLBGO_MASK			REG_BIT(6)
+#define L3_LKUP_MASK			REG_BIT(7)
+#define L3_UPPER_IDX_ESC_MASK		REG_BIT(16)
+#define L3_UPPER_IDX_SCC_MASK		REG_GENMASK(19, 17)
+#define L3_UPPER_IDX_CACHEABILITY_MASK	REG_GENMASK(21, 20)
+#define L3_UPPER_GLBGO_MASK		REG_BIT(22)
+#define L3_UPPER_LKUP_MASK		REG_BIT(23)
+
 /* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
 #define IG_PAT				REG_BIT(8)
 #define L3_CACHE_POLICY_MASK		REG_GENMASK(5, 4)
@@ -107,6 +131,8 @@ struct xe_mocs_info {
 #define XE2_L3_1_XD		REG_FIELD_PREP(L3_CACHE_POLICY_MASK, 1)
 #define XE2_L3_3_UC		REG_FIELD_PREP(L3_CACHE_POLICY_MASK, 3)
 
+#define XE2_L3_CLOS_MASK	REG_GENMASK(7, 6)
+
 #define MOCS_ENTRY(__idx, __control_value, __l3cc_value) \
 	[__idx] = { \
 		.control_value = __control_value, \
@@ -255,6 +281,82 @@ static const struct xe_mocs_entry gen12_mocs_desc[] = {
 		   L3_1_UC)
 };
 
+static bool regs_are_mcr(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (xe_gt_is_media_type(gt))
+		return MEDIA_VER(xe) >= 20;
+	else
+		return GRAPHICS_VERx100(xe) >= 1250;
+}
+
+static void xelp_lncf_dump(struct xe_mocs_info *info, struct xe_gt *gt, struct drm_printer *p)
+{
+	unsigned int i, j;
+	u32 reg_val;
+
+	drm_printf(p, "LNCFCMOCS[idx] = [ESC, SCC, L3CC] (value)\n\n");
+
+	for (i = 0, j = 0; i < (info->n_entries + 1) / 2; i++, j++) {
+		if (regs_are_mcr(gt))
+			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
+		else
+			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
+
+		drm_printf(p, "LNCFCMOCS[%2d] = [%u, %u, %u] (%#8x)\n",
+			   j++,
+			   !!(reg_val & L3_ESC_MASK),
+			   REG_FIELD_GET(L3_SCC_MASK, reg_val),
+			   REG_FIELD_GET(L3_CACHEABILITY_MASK, reg_val),
+			   reg_val);
+
+		drm_printf(p, "LNCFCMOCS[%2d] = [%u, %u, %u] (%#8x)\n",
+			   j,
+			   !!(reg_val & L3_UPPER_IDX_ESC_MASK),
+			   REG_FIELD_GET(L3_UPPER_IDX_SCC_MASK, reg_val),
+			   REG_FIELD_GET(L3_UPPER_IDX_CACHEABILITY_MASK, reg_val),
+			   reg_val);
+	}
+}
+
+static void gen12_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
+			    struct xe_gt *gt, struct drm_printer *p)
+{
+	unsigned int i;
+	u32 reg_val;
+
+	if (flags & HAS_GLOBAL_MOCS) {
+		drm_printf(p, "Global mocs table configuration:\n");
+		drm_printf(p, "GLOB_MOCS[idx] = [LeCC, TC, LRUM, AOM, RSC, SCC, PFM, SCF, CoS, SSE] (value)\n\n");
+
+		for (i = 0; i < info->n_entries; i++) {
+			if (regs_are_mcr(gt))
+				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
+			else
+				reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
+
+		drm_printf(p, "GLOB_MOCS[%2d] = [%u, %u, %u, %u, %u, %u, %u, %u, %u, %u ] (%#8x)\n",
+			   i,
+			   REG_FIELD_GET(LE_CACHEABILITY_MASK, reg_val),
+			   REG_FIELD_GET(LE_TGT_CACHE_MASK, reg_val),
+			   REG_FIELD_GET(LE_LRUM_MASK, reg_val),
+			   !!(reg_val & LE_AOM_MASK),
+			   !!(reg_val & LE_RSC_MASK),
+			   REG_FIELD_GET(LE_SCC_MASK, reg_val),
+			   REG_FIELD_GET(LE_PFM_MASK, reg_val),
+			   !!(reg_val & LE_SCF_MASK),
+			   REG_FIELD_GET(LE_COS_MASK, reg_val),
+			   REG_FIELD_GET(LE_SSE_MASK, reg_val),
+			   reg_val);
+		}
+	}
+
+	if (flags & HAS_LNCF_MOCS) {
+		xelp_lncf_dump(info, gt, p);
+	}
+}
+
 static const struct xe_mocs_entry dg1_mocs_desc[] = {
 	/* UC */
 	MOCS_ENTRY(1, 0, L3_1_UC),
@@ -279,6 +381,14 @@ static const struct xe_mocs_entry dg1_mocs_desc[] = {
 	MOCS_ENTRY(63, 0, L3_1_UC),
 };
 
+static void dg1_mocs_dump(struct xe_mocs_info *info, unsigned int flags, struct xe_gt *gt,
+			  struct drm_printer *p)
+{
+	if (flags & HAS_LNCF_MOCS) {
+		xelp_lncf_dump(info, gt, p);
+	}
+}
+
 static const struct xe_mocs_entry dg2_mocs_desc[] = {
 	/* UC - Coherent; GO:L3 */
 	MOCS_ENTRY(0, 0, L3_1_UC | L3_LKUP(1)),
@@ -291,6 +401,43 @@ static const struct xe_mocs_entry dg2_mocs_desc[] = {
 	MOCS_ENTRY(3, 0, L3_3_WB | L3_LKUP(1)),
 };
 
+static void xehp_lncf_dump(struct xe_mocs_info *info, struct xe_gt *gt, struct drm_printer *p)
+{
+	unsigned int i, j;
+	u32 reg_val;
+
+	drm_printf(p, "LNCFCMOCS[idx] = [UCL3LOOKUP, GLBGO, L3CC] (value)\n\n");
+
+	for (i = 0, j = 0; i < (info->n_entries + 1) / 2; i++, j++) {
+		if (regs_are_mcr(gt))
+			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
+		else
+			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
+
+		drm_printf(p, "LNCFCMOCS[%2d] = [%u, %u, %u] (%#8x)\n",
+			   j++,
+			   !!(reg_val & L3_LKUP_MASK),
+			   !!(reg_val & L3_GLBGO_MASK),
+			   REG_FIELD_GET(L3_CACHEABILITY_MASK, reg_val),
+			   reg_val);
+
+		drm_printf(p, "LNCFCMOCS[%2d] = [%u, %u, %u] (%#8x)\n",
+			   j,
+			   !!(reg_val & L3_UPPER_LKUP_MASK),
+			   !!(reg_val & L3_UPPER_GLBGO_MASK),
+			   REG_FIELD_GET(L3_UPPER_IDX_CACHEABILITY_MASK, reg_val),
+			   reg_val);
+	}
+}
+
+static void dg2_mocs_dump(struct xe_mocs_info *info, unsigned int flags, struct xe_gt *gt,
+			  struct drm_printer *p)
+{
+	if (flags & HAS_LNCF_MOCS) {
+		xehp_lncf_dump(info, gt, p);
+	}
+}
+
 static const struct xe_mocs_entry pvc_mocs_desc[] = {
 	/* Error */
 	MOCS_ENTRY(0, 0, L3_3_WB),
@@ -302,6 +449,34 @@ static const struct xe_mocs_entry pvc_mocs_desc[] = {
 	MOCS_ENTRY(2, 0, L3_3_WB),
 };
 
+static void pvc_mocs_dump(struct xe_mocs_info *info, unsigned int flags, struct xe_gt *gt,
+			  struct drm_printer *p)
+{
+	unsigned int i, j;
+	u32 reg_val;
+
+	if (flags & HAS_LNCF_MOCS) {
+		drm_printf(p, "LNCFCMOCS[idx] = [ L3CC ] (value)\n\n");
+
+		for (i = 0, j = 0; i < (info->n_entries + 1) / 2; i++, j++) {
+			if (regs_are_mcr(gt))
+				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
+			else
+				reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
+
+			drm_printf(p, "LNCFCMOCS[%2d] = [ %u ] (%#8x)\n",
+				   j++,
+				   REG_FIELD_GET(L3_CACHEABILITY_MASK, reg_val),
+				   reg_val);
+
+			drm_printf(p, "LNCFCMOCS[%2d] = [ %u ] (%#8x)\n",
+				   j,
+				   REG_FIELD_GET(L3_UPPER_IDX_CACHEABILITY_MASK, reg_val),
+				   reg_val);
+		}
+	}
+}
+
 static const struct xe_mocs_entry mtl_mocs_desc[] = {
 	/* Error - Reserved for Non-Use */
 	MOCS_ENTRY(0,
@@ -353,6 +528,36 @@ static const struct xe_mocs_entry mtl_mocs_desc[] = {
 		   L3_GLBGO(1) | L3_1_UC),
 };
 
+static void mtl_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
+			  struct xe_gt *gt, struct drm_printer *p)
+{
+	unsigned int i;
+	u32 reg_val;
+
+	if (flags & HAS_GLOBAL_MOCS) {
+		drm_printf(p, "Global mocs table configuration:\n");
+		drm_printf(p, "GLOB_MOCS[idx] = [IG_PAT, L4_CACHE_POLICY] (value)\n\n");
+
+		for (i = 0; i < info->n_entries; i++) {
+			if (regs_are_mcr(gt))
+				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
+			else
+				reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
+
+			drm_printf(p, "GLOB_MOCS[%2d] = [%u, %u]  (%#8x)\n",
+				   i,
+				   !!(reg_val & IG_PAT),
+				   REG_FIELD_GET(L4_CACHE_POLICY_MASK, reg_val),
+				   reg_val);
+		}
+	}
+
+	if (flags & HAS_LNCF_MOCS) {
+		/* MTL lncf mocs table pattern is similar to that of xehp */
+		xehp_lncf_dump(info, gt, p);
+	}
+}
+
 static const struct xe_mocs_entry xe2_mocs_table[] = {
 	/* Defer to PAT */
 	MOCS_ENTRY(0, XE2_L3_0_WB | L4_3_UC, 0),
@@ -366,6 +571,32 @@ static const struct xe_mocs_entry xe2_mocs_table[] = {
 	MOCS_ENTRY(4, IG_PAT | XE2_L3_0_WB | L4_0_WB, 0),
 };
 
+static void xe2_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
+			  struct xe_gt *gt, struct drm_printer *p)
+{
+	unsigned int i;
+	u32 reg_val;
+
+	if (flags & HAS_GLOBAL_MOCS) {
+		drm_printf(p, "Global mocs table configuration:\n");
+		drm_printf(p, "GLOB_MOCS[idx] = [IG_PAT, L3_CLOS, L3_CACHE_POLICY, L4_CACHE_POLICY] (value)\n\n");
+
+		for (i = 0; i < info->n_entries; i++) {
+			if (regs_are_mcr(gt))
+				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
+			else
+				reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
+
+			drm_printf(p, "GLOB_MOCS[%2d] = [%u, %u, %u]  (%#8x)\n",
+				   i,
+				   !!(reg_val & IG_PAT),
+				   REG_FIELD_GET(XE2_L3_CLOS_MASK, reg_val),
+				   REG_FIELD_GET(L4_CACHE_POLICY_MASK, reg_val),
+				   reg_val);
+		}
+	}
+}
+
 static unsigned int get_mocs_settings(struct xe_device *xe,
 				      struct xe_mocs_info *info)
 {
@@ -382,6 +613,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 		info->uc_index = 3;
 		info->wb_index = 4;
 		info->unused_entries_index = 4;
+		info->dump = xe2_mocs_dump;
 		break;
 	case XE_PVC:
 		info->size = ARRAY_SIZE(pvc_mocs_desc);
@@ -390,6 +622,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 		info->uc_index = 1;
 		info->wb_index = 2;
 		info->unused_entries_index = 2;
+		info->dump = pvc_mocs_dump;
 		break;
 	case XE_METEORLAKE:
 		info->size = ARRAY_SIZE(mtl_mocs_desc);
@@ -397,6 +630,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 		info->n_entries = MTL_NUM_MOCS_ENTRIES;
 		info->uc_index = 9;
 		info->unused_entries_index = 1;
+		info->dump = mtl_mocs_dump;
 		break;
 	case XE_DG2:
 		info->size = ARRAY_SIZE(dg2_mocs_desc);
@@ -408,6 +642,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 		 */
 		info->n_entries = XELP_NUM_MOCS_ENTRIES - 1;
 		info->unused_entries_index = 3;
+		info->dump = dg2_mocs_dump;
 		break;
 	case XE_DG1:
 		info->size = ARRAY_SIZE(dg1_mocs_desc);
@@ -415,6 +650,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 		info->uc_index = 1;
 		info->n_entries = XELP_NUM_MOCS_ENTRIES;
 		info->unused_entries_index = 5;
+		info->dump = dg1_mocs_dump;
 		break;
 	case XE_TIGERLAKE:
 	case XE_ROCKETLAKE:
@@ -426,6 +662,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 		info->n_entries = XELP_NUM_MOCS_ENTRIES;
 		info->uc_index = 3;
 		info->unused_entries_index = 2;
+		info->dump = gen12_mocs_dump;
 		break;
 	default:
 		drm_err(&xe->drm, "Platform that should have a MOCS table does not.\n");
@@ -467,16 +704,6 @@ static u32 get_entry_control(const struct xe_mocs_info *info,
 	return info->table[info->unused_entries_index].control_value;
 }
 
-static bool regs_are_mcr(struct xe_gt *gt)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-
-	if (xe_gt_is_media_type(gt))
-		return MEDIA_VER(xe) >= 20;
-	else
-		return GRAPHICS_VERx100(xe) >= 1250;
-}
-
 static void __init_mocs_table(struct xe_gt *gt,
 			      const struct xe_mocs_info *info)
 {
@@ -578,6 +805,33 @@ void xe_mocs_init(struct xe_gt *gt)
 		init_l3cc_table(gt, &table);
 }
 
+void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
+{
+	struct xe_mocs_info table;
+	unsigned int flags;
+	u32 ret;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	flags = get_mocs_settings(xe, &table);
+
+	if (!table.dump)
+		return;
+
+	xe_device_mem_access_get(xe);
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+
+	if (ret)
+		goto err_fw;
+
+	table.dump(&table, flags, gt, p);
+
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+
+err_fw:
+	xe_assert(xe, !ret);
+	xe_device_mem_access_put(xe);
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_mocs.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_mocs.h b/drivers/gpu/drm/xe/xe_mocs.h
index 053754c5a94e..d6fa4485a6e9 100644
--- a/drivers/gpu/drm/xe/xe_mocs.h
+++ b/drivers/gpu/drm/xe/xe_mocs.h
@@ -10,8 +10,16 @@
 
 struct xe_exec_queue;
 struct xe_gt;
+struct drm_printer;
 
 void xe_mocs_init_early(struct xe_gt *gt);
 void xe_mocs_init(struct xe_gt *gt);
 
+/**
+ * xe_mocs_dump - Dump mocs table
+ * @gt: GT structure
+ * @p: Printer to dump info to
+ */
+void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p);
+
 #endif
-- 
2.25.1

