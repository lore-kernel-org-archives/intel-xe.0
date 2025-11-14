Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B75CDE014
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 06:54:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1170E10E229;
	Fri, 14 Nov 2025 06:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MowXNkB8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FA410E229
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 06:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763103253; x=1794639253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mpiafKR1/sK60mqGNTTgNBvmT57kZgHr0Plbx+mtNf4=;
 b=MowXNkB8so+KCiWI2ayfBMyhNXiGst6T2GT6kcPST8c1F3DVQ3WyLLcl
 Xwsn7shJc/sojeNcRfC3a1umRYwUgwMs1ln2GcPgCbBXj/gNcacO0vPHB
 gu0CCMXQlp0vO4yLnjq+cF3ZykFNuLtOcmcp/iupLPTOADxTkoM8AZ5jX
 WOY9ow/5dDwGaKoEm1t1FHaDgMPupFACAXg6J+tEYPXEfje6wqEOiAmCG
 wMWNZVk9+Bhm0HUafXRYFd+txJPySBt/9bKmHIoWYag8P/3IwdUHeNFzb
 W8/F89RKTFldrFBFZ5BIDS0rgQ/Utp6+dMqASTDGxzrRluP6+Vdc1bL+c Q==;
X-CSE-ConnectionGUID: aDqJ+N08QICtFDeGjbXGIw==
X-CSE-MsgGUID: WL/rhl3CQquR0eo22p2KyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65126615"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65126615"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 22:54:12 -0800
X-CSE-ConnectionGUID: qoQQm9OKTEaQei4K+UGGXA==
X-CSE-MsgGUID: n/nUevNoTBaVJWVeP8HKYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="188965049"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.69])
 by orviesa006.jf.intel.com with ESMTP; 13 Nov 2025 22:54:13 -0800
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: shuicheng.lin@intel.com, alex.zuo@intel.com, Xin Wang <x.wang@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe: expose PAT software table via debugfs
Date: Fri, 14 Nov 2025 06:54:09 +0000
Message-ID: <20251114065409.132230-1-x.wang@intel.com>
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

The existing "pat" debugfs node dumps the live PAT registers. Under SR-IOV
the VF cannot touch those registers, so the file vanishes and users lose
all PAT visibility. Add a VF-safe "pat_sw_config" entry to the VF-safe
debugfs list. It prints the cached PAT table the driver programmed, rather
than poking HW, so PF and VF instances present the same view.

This lets IGT and other tools query the PAT configuration without carrying
platform-specific tables or mirroring kernel logic.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  1 +
 drivers/gpu/drm/xe/xe_pat.c        | 90 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pat.h        |  1 +
 3 files changed, 92 insertions(+)

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
index 68171cceea18..599fd8e0feea 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -578,3 +578,93 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
 
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
+
+	if (!xe->pat.table || !xe->pat.n_entries)
+		return -EOPNOTSUPP;
+
+	drm_printf(p, "PAT table: (* = reserved entry)\n");
+	for (u32 i = 0; i < xe->pat.n_entries; i++) {
+		u32 pat = xe->pat.table[i].value;
+
+		if (GRAPHICS_VER(xe) >= 20) {
+			drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]  (%#8x)%s\n", i,
+				   !!(pat & XE2_NO_PROMOTE),
+				   !!(pat & XE2_COMP_EN),
+				   REG_FIELD_GET(XE2_L3_CLOS, pat),
+				   REG_FIELD_GET(XE2_L3_POLICY, pat),
+				   REG_FIELD_GET(XE2_L4_POLICY, pat),
+				   REG_FIELD_GET(XE2_COH_MODE, pat),
+				   pat, xe->pat.table[i].valid ? "" : " *");
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
+		drm_printf(p, "PTA_MODE= [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n",
+			   !!(pat & XE2_NO_PROMOTE),
+			   !!(pat & XE2_COMP_EN),
+			   REG_FIELD_GET(XE2_L3_CLOS, pat),
+			   REG_FIELD_GET(XE2_L3_POLICY, pat),
+			   REG_FIELD_GET(XE2_L4_POLICY, pat),
+			   REG_FIELD_GET(XE2_COH_MODE, pat),
+			   pat);
+	}
+
+	if (xe->pat.pat_ats) {
+		u32 pat = xe->pat.pat_ats->value;
+
+		drm_printf(p, "PCIe ATS response:\n");
+		drm_printf(p, "ATS_MODE= [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n",
+			   !!(pat & XE2_NO_PROMOTE),
+			   !!(pat & XE2_COMP_EN),
+			   REG_FIELD_GET(XE2_L3_CLOS, pat),
+			   REG_FIELD_GET(XE2_L3_POLICY, pat),
+			   REG_FIELD_GET(XE2_L4_POLICY, pat),
+			   REG_FIELD_GET(XE2_COH_MODE, pat),
+			   pat);
+	}
+
+	drm_printf(p, "Cache Level:\n");
+	drm_printf(p, "IDX[XE_CACHE_NONE] = %d\n", xe->pat.idx[XE_CACHE_NONE]);
+	drm_printf(p, "IDX[XE_CACHE_WT] = %d\n", xe->pat.idx[XE_CACHE_WT]);
+	drm_printf(p, "IDX[XE_CACHE_WB] = %d\n", xe->pat.idx[XE_CACHE_WB]);
+	if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
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

