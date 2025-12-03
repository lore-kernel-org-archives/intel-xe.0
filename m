Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4320D15DB6
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 22:54:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997DC10E81D;
	Wed,  3 Dec 2025 22:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HhpmoRUl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B4010E82B
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 22:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764802466; x=1796338466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mMtSIVO/RMSJPRD+6fSf0QV6QkdexmMPMEKIzlVwNcY=;
 b=HhpmoRUlXReUkYMWcE+CTu3OzT53AskQQsTOlM2HR2poSmuZMIa93oWE
 TR12EgmgVOFjktBAQcFbfcx9GXWHYN8nD8A8+SjzkMJ8WNbraqjavYhKm
 4Y5kym2MQg0pF6hlJmCY/Vvx7f4AmPkDBCez8L2JdxySaWeBGHRByAYy3
 hbTWu5NPd2ijoFbRi9aYNKU1C9rLG8vOZjH4u6vwP0YODSh2oBg8W5XI9
 mXmtHsXPMO1CtSInrb/dDQp9PXbEL4DpXfETJy5CgJ398aWuBFzTwPqSd
 a7wIs3DX540TMj8GHjML0k08GqtcvOfwCXSEMWmk9tQYc8eoVvWk9vv8r A==;
X-CSE-ConnectionGUID: GbTK/WgmSdi6PrY8EjAxNA==
X-CSE-MsgGUID: 0pBsFUuWQdCrqCiNIHJOAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66002888"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="66002888"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 14:54:26 -0800
X-CSE-ConnectionGUID: 5bMeV0nWSIGPOiMpbRkbrQ==
X-CSE-MsgGUID: 6dmwVyO9Q4OUqYenKapVpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="195055433"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.69])
 by fmviesa008.fm.intel.com with ESMTP; 03 Dec 2025 14:54:26 -0800
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: shuicheng.lin@intel.com, alex.zuo@intel.com, Xin Wang <x.wang@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v5 1/2] drm/xe: Refactor PAT dump to use shared helpers
Date: Wed,  3 Dec 2025 22:53:54 +0000
Message-ID: <20251203225355.24972-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117230156.366860-1-x.wang@intel.com>
References: <20251117230156.366860-1-x.wang@intel.com>
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

Move the PAT entry formatting into shared helper functions to ensure
consistency and enable code reuse.

This preparation is necessary for a follow-up patch that introduces a
software-based PAT dump, which is required for debugging on VFs where
hardware access is limited.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 97 ++++++++++++++++++++-----------------
 1 file changed, 53 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 717425dd0475..b8146724a60e 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -50,8 +50,37 @@
 #define XELP_PAT_WC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 1)
 #define XELP_PAT_UC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 0)
 
+#define PAT_LABEL_LEN 20
+
 static const char *XELP_MEM_TYPE_STR_MAP[] = { "UC", "WC", "WT", "WB" };
 
+static void xe_pat_index_label(char *label, size_t len, int index)
+{
+	snprintf(label, len, "PAT[%2d] ", index);
+}
+
+static void xelp_pat_entry_dump(struct drm_printer *p, int index, u32 pat)
+{
+	u8 mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
+
+	drm_printf(p, "PAT[%2d] = %s (%#8x)\n", index,
+		   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
+}
+
+static void xehpc_pat_entry_dump(struct drm_printer *p, int index, u32 pat)
+{
+	drm_printf(p, "PAT[%2d] = [ %u, %u ] (%#8x)\n", index,
+		   REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat),
+		   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
+}
+
+static void xelpg_pat_entry_dump(struct drm_printer *p, int index, u32 pat)
+{
+	drm_printf(p, "PAT[%2d] = [ %u, %u ] (%#8x)\n", index,
+		   REG_FIELD_GET(XELPG_L4_POLICY_MASK, pat),
+		   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
+}
+
 struct xe_pat_ops {
 	void (*program_graphics)(struct xe_gt *gt, const struct xe_pat_table_entry table[],
 				 int n_entries);
@@ -249,10 +278,8 @@ static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 
 	for (i = 0; i < xe->pat.n_entries; i++) {
 		u32 pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDEX(i)));
-		u8 mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
 
-		drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
-			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
+		xelp_pat_entry_dump(p, i, pat);
 	}
 
 	return 0;
@@ -276,12 +303,8 @@ static int xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 
 	for (i = 0; i < xe->pat.n_entries; i++) {
 		u32 pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
-		u8 mem_type;
 
-		mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
-
-		drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
-			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
+		xelp_pat_entry_dump(p, i, pat);
 	}
 
 	return 0;
@@ -306,9 +329,7 @@ static int xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 	for (i = 0; i < xe->pat.n_entries; i++) {
 		u32 pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
 
-		drm_printf(p, "PAT[%2d] = [ %u, %u ] (%#8x)\n", i,
-			   REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat),
-			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
+		xehpc_pat_entry_dump(p, i, pat);
 	}
 
 	return 0;
@@ -338,9 +359,7 @@ static int xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 		else
 			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
 
-		drm_printf(p, "PAT[%2d] = [ %u, %u ] (%#8x)\n", i,
-			   REG_FIELD_GET(XELPG_L4_POLICY_MASK, pat),
-			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
+		xelpg_pat_entry_dump(p, i, pat);
 	}
 
 	return 0;
@@ -356,11 +375,24 @@ static const struct xe_pat_ops xelpg_pat_ops = {
 	.dump = xelpg_dump,
 };
 
+static void xe2_pat_entry_dump(struct drm_printer *p, const char *label, u32 pat, bool rsvd)
+{
+	drm_printf(p, "%s= [ %u, %u, %u, %u, %u, %u ]  (%#8x)%s\n", label,
+		   !!(pat & XE2_NO_PROMOTE),
+		   !!(pat & XE2_COMP_EN),
+		   REG_FIELD_GET(XE2_L3_CLOS, pat),
+		   REG_FIELD_GET(XE2_L3_POLICY, pat),
+		   REG_FIELD_GET(XE2_L4_POLICY, pat),
+		   REG_FIELD_GET(XE2_COH_MODE, pat),
+		   pat, rsvd ? " *" : "");
+}
+
 static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 pat;
 	int i;
+	char label[PAT_LABEL_LEN];
 
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref.domains)
@@ -374,14 +406,8 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 		else
 			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
 
-		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]  (%#8x)%s\n", i,
-			   !!(pat & XE2_NO_PROMOTE),
-			   !!(pat & XE2_COMP_EN),
-			   REG_FIELD_GET(XE2_L3_CLOS, pat),
-			   REG_FIELD_GET(XE2_L3_POLICY, pat),
-			   REG_FIELD_GET(XE2_L4_POLICY, pat),
-			   REG_FIELD_GET(XE2_COH_MODE, pat),
-			   pat, xe->pat.table[i].valid ? "" : " *");
+		xe_pat_index_label(label, sizeof(label), i);
+		xe2_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
 	}
 
 	/*
@@ -394,14 +420,7 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
 
 	drm_printf(p, "Page Table Access:\n");
-	drm_printf(p, "PTA_MODE= [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n",
-		   !!(pat & XE2_NO_PROMOTE),
-		   !!(pat & XE2_COMP_EN),
-		   REG_FIELD_GET(XE2_L3_CLOS, pat),
-		   REG_FIELD_GET(XE2_L3_POLICY, pat),
-		   REG_FIELD_GET(XE2_L4_POLICY, pat),
-		   REG_FIELD_GET(XE2_COH_MODE, pat),
-		   pat);
+	xe2_pat_entry_dump(p, "PTA_MODE", pat, false);
 
 	return 0;
 }
@@ -417,6 +436,7 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 pat;
 	int i;
+	char label[PAT_LABEL_LEN];
 
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref.domains)
@@ -427,13 +447,8 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
 	for (i = 0; i < xe->pat.n_entries; i++) {
 		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
 
-		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]  (%#8x)%s\n", i,
-			   !!(pat & XE2_NO_PROMOTE),
-			   REG_FIELD_GET(XE2_L3_CLOS, pat),
-			   REG_FIELD_GET(XE2_L3_POLICY, pat),
-			   REG_FIELD_GET(XE2_L4_POLICY, pat),
-			   REG_FIELD_GET(XE2_COH_MODE, pat),
-			   pat, xe->pat.table[i].valid ? "" : " *");
+		xe_pat_index_label(label, sizeof(label), i);
+		xe2_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
 	}
 
 	/*
@@ -443,13 +458,7 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
 	pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
 
 	drm_printf(p, "Page Table Access:\n");
-	drm_printf(p, "PTA_MODE= [ %u, %u, %u, %u, %u ]  (%#8x)\n",
-		   !!(pat & XE2_NO_PROMOTE),
-		   REG_FIELD_GET(XE2_L3_CLOS, pat),
-		   REG_FIELD_GET(XE2_L3_POLICY, pat),
-		   REG_FIELD_GET(XE2_L4_POLICY, pat),
-		   REG_FIELD_GET(XE2_COH_MODE, pat),
-		   pat);
+	xe2_pat_entry_dump(p, "PTA_MODE", pat, false);
 
 	return 0;
 }
-- 
2.43.0

