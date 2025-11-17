Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D1BCE8D6B
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 23:02:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A86310E1CE;
	Mon, 17 Nov 2025 23:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VgkNJsNq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354EA10E1CE
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 23:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763420534; x=1794956534;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zsJQHAFvni9D/gi2DwizKmb1rRhdDvF25Qvseo53r9g=;
 b=VgkNJsNqP0ONUfVHMR1DyZWBZneXNUyThkrlA/HLzAqwuUkFFotGIVWi
 MlkaCVpQo096aRYR9MOlG/QS3ZfWxjWnFXYb87a5XtG6GVZahe8HH6Q4H
 0WeHdQUufipSA0e2ccwFv53Ch8GmlVvYji0mtGz4VRrOzzIMqJgr/qGm+
 6nD70GCdYS4fl1WdmVLJHzR5DSItUjQRYT7L3K6YKM/N592Hs4xCf2724
 cZLXLiIz0ytG6q+T4n+IZcnPQ8LLYt8VCtvwRw3FKpVxFAKorZy1yVtsf
 /ghO8OKFT7XvnO3KFsojjKbiLvg6qor1VSgwqSstn81kO3FXV4+mNkjH3 Q==;
X-CSE-ConnectionGUID: Ju/aOgUzSOePUNLoyvltOg==
X-CSE-MsgGUID: r7V2MF/MTuq8bDU2XgHRMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65333995"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="65333995"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 15:02:13 -0800
X-CSE-ConnectionGUID: nnzQdhTiRjCIn1oAf6C+mw==
X-CSE-MsgGUID: 4EqEhJmaSaa/6N2JMkr5Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="194903308"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.69])
 by fmviesa005.fm.intel.com with ESMTP; 17 Nov 2025 15:02:13 -0800
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: shuicheng.lin@intel.com, alex.zuo@intel.com, Xin Wang <x.wang@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v4] drm/xe: expose PAT software table via debugfs
Date: Mon, 17 Nov 2025 23:01:56 +0000
Message-ID: <20251117230156.366860-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The existing "pat" debugfs node dumps the live PAT registers. Under SR-IOV
the VF cannot touch those registers, so the file vanishes and users lose
all PAT visibility. Add a VF-safe "pat_sw_config" entry to the VF-safe
debugfs list. It prints the cached PAT table the driver programmed, rather
than poking HW, so PF and VF instances present the same view.

This lets IGT and other tools query the PAT configuration without carrying
platform-specific tables or mirroring kernel logic.

v2: (Jonathan)
- Only append "(* = reserved entry)" to the PAT table header on Xe2+
platforms where it actually applies.
- Deduplicate the PTA/ATS mode printing by introducing the small
drm_printf_pat_mode() helper macro.

v3: (Matt)
- Print IDX[XE_CACHE_NONE_COMPRESSION] on every Xe2+ platform so the dump
always reflects the value the driver might use (even if it defaults to 0)
and future IP revisions don’t need extra condition tweaks.

v4:
- Drop the drm_printf_pat_mode macro and introduce a real helper
xe2_pat_entry_dump(). (Jani)
- Reuse the helper across all PTA/ATS/PAT dumps for xe2+ entries to keep
output format idential.

CC: Jani Nikula <jani.nikula@intel.com>
Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c |   1 +
 drivers/gpu/drm/xe/xe_pat.c        | 122 ++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_pat.h        |   1 +
 3 files changed, 94 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index e4fd632f43cf..ec279f005b10 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -220,6 +220,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 	{ "default_lrc_vcs", .show = xe_gt_debugfs_show_with_rpm, .data = vcs_default_lrc },
 	{ "default_lrc_vecs", .show = xe_gt_debugfs_show_with_rpm, .data = vecs_default_lrc },
 	{ "hwconfig", .show = xe_gt_debugfs_show_with_rpm, .data = hwconfig },
+	{ "pat_sw_config", .show = xe_gt_debugfs_simple_show, .data = xe_pat_dump_sw_config },
 };
 
 /* everything else should be added here */
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 68171cceea18..77e11fe17d4e 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -358,12 +358,26 @@ static const struct xe_pat_ops xelpg_pat_ops = {
 	.dump = xelpg_dump,
 };
 
+#define PAT_LABEL_LEN 20
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
 	unsigned int fw_ref;
 	u32 pat;
 	int i;
+	char label[PAT_LABEL_LEN];
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref)
@@ -377,14 +391,8 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
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
+		snprintf(label, sizeof(label), "PAT[%2d] ", i);
+		xe2_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
 	}
 
 	/*
@@ -397,14 +405,7 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
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
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return 0;
@@ -422,6 +423,7 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
 	unsigned int fw_ref;
 	u32 pat;
 	int i;
+	char label[PAT_LABEL_LEN];
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref)
@@ -432,13 +434,8 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
 	for (i = 0; i < xe->pat.n_entries; i++) {
 		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
 
-		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]  (%#8x)%s\n", i,
-			   !!(pat & XE2_NO_PROMOTE),
-			   REG_FIELD_GET(XE2_L3_CLOS, pat),
-			   REG_FIELD_GET(XE2_L3_POLICY, pat),
-			   REG_FIELD_GET(XE2_L4_POLICY, pat),
-			   REG_FIELD_GET(XE2_COH_MODE, pat),
-			   pat, xe->pat.table[i].valid ? "" : " *");
+		snprintf(label, sizeof(label), "PAT[%2d] ", i);
+		xe2_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
 	}
 
 	/*
@@ -448,13 +445,7 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
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
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return 0;
@@ -578,3 +569,74 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
 
 	return xe->pat.ops->dump(gt, p);
 }
+
+/**
+ * xe_pat_dump_sw_config() - Dump the software-configured GT PAT table into a drm printer.
+ * @gt: the &xe_gt
+ * @p: the &drm_printer
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	char label[20];
+
+	if (!xe->pat.table || !xe->pat.n_entries)
+		return -EOPNOTSUPP;
+
+	drm_printf(p, "PAT table:%s\n", GRAPHICS_VER(xe) >= 20 ? " (* = reserved entry)" : "");
+	for (u32 i = 0; i < xe->pat.n_entries; i++) {
+		u32 pat = xe->pat.table[i].value;
+
+		if (GRAPHICS_VER(xe) >= 20) {
+			snprintf(label, sizeof(label), "PAT[%2d] ", i);
+			xe2_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
+		} else if (xe->info.platform == XE_METEORLAKE) {
+			drm_printf(p, "PAT[%2d] = [ %u, %u ] (%#8x)\n", i,
+				   REG_FIELD_GET(XELPG_L4_POLICY_MASK, pat),
+				   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
+		} else if (xe->info.platform == XE_PVC) {
+			drm_printf(p, "PAT[%2d] = [ %u, %u ] (%#8x)\n", i,
+				   REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat),
+				   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
+		} else if (xe->info.platform == XE_DG2) {
+			u8 mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
+
+			drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
+				   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
+		} else if (GRAPHICS_VERx100(xe) <= 1210) {
+			u8 mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
+
+			drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
+				   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
+		} else {
+			return -EOPNOTSUPP;
+		}
+	}
+
+	if (xe->pat.pat_pta) {
+		u32 pat = xe->pat.pat_pta->value;
+
+		drm_printf(p, "Page Table Access:\n");
+		xe2_pat_entry_dump(p, "PTA_MODE", pat, false);
+	}
+
+	if (xe->pat.pat_ats) {
+		u32 pat = xe->pat.pat_ats->value;
+
+		drm_printf(p, "PCIe ATS response:\n");
+		xe2_pat_entry_dump(p, "ATS_MODE", pat, false);
+	}
+
+	drm_printf(p, "Cache Level:\n");
+	drm_printf(p, "IDX[XE_CACHE_NONE] = %d\n", xe->pat.idx[XE_CACHE_NONE]);
+	drm_printf(p, "IDX[XE_CACHE_WT] = %d\n", xe->pat.idx[XE_CACHE_WT]);
+	drm_printf(p, "IDX[XE_CACHE_WB] = %d\n", xe->pat.idx[XE_CACHE_WB]);
+	if (GRAPHICS_VER(xe) >= 20) {
+		drm_printf(p, "IDX[XE_CACHE_NONE_COMPRESSION] = %d\n",
+			   xe->pat.idx[XE_CACHE_NONE_COMPRESSION]);
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index 05dae03a5f54..4a3045f74bfe 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -49,6 +49,7 @@ void xe_pat_init_early(struct xe_device *xe);
 void xe_pat_init(struct xe_gt *gt);
 
 int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
+int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p);
 
 /**
  * xe_pat_index_get_coh_mode - Extract the coherency mode for the given
-- 
2.43.0

