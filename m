Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893AECEACCC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 22:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3615010E269;
	Fri, 14 Nov 2025 22:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1kZop9s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B141010E27B
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 22:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763160060; x=1794696060;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Lz3qDqFMgM5n0poRaURPnNpxxYY80HopgacVmGelp/w=;
 b=U1kZop9spBw1vTC267OUDsf+r5qYnKSIRjwPDanwjQmiAMkk/ADUb/ac
 GJWSoJrJGdMI/fYcvQddWRjVGbja0qqr2WtqdpLnc3K8vux3GjZSQrpVe
 pYpp0nWwomY9OMz/RFGFXje+My4aqC04vJyQTUoG32ZPk0JakP5qp2dIj
 y1C8CWDfjwrlREy9k8dSNpbPta/l1f1ZTOtRygzjdI2/pQOb6L7gwXya0
 SMMBCijwMyVhaNqwIKmX7EKBOKS01cNaJZGTOYGVBEItlheLK+xwegJwm
 5WTRVXw31He8P76/aQgGNycYPaJq0kzPzPRUU+Wu/TRGGzcVZUYEYKnCi A==;
X-CSE-ConnectionGUID: N6eqv1MrS5iNUL6WO4DWsA==
X-CSE-MsgGUID: mR+ja+zlTWyRMh1ws31exA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65416580"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="65416580"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 14:41:00 -0800
X-CSE-ConnectionGUID: v8sI5YVqQe6TktxhCfUZYw==
X-CSE-MsgGUID: 15348OgiSQmUtYlLXQfU/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="220525620"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.69])
 by orviesa002.jf.intel.com with ESMTP; 14 Nov 2025 14:41:00 -0800
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: shuicheng.lin@intel.com, alex.zuo@intel.com, Xin Wang <x.wang@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v3] drm/xe: expose PAT software table via debugfs
Date: Fri, 14 Nov 2025 22:40:55 +0000
Message-ID: <20251114224055.242690-1-x.wang@intel.com>
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

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  1 +
 drivers/gpu/drm/xe/xe_pat.c        | 87 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pat.h        |  1 +
 3 files changed, 89 insertions(+)

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
index 68171cceea18..e16ee7132dfc 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -578,3 +578,90 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
 
 	return xe->pat.ops->dump(gt, p);
 }
+
+#define drm_printf_pat_mode(p, name, pat) \
+	{ \
+		drm_printf(p, name "= [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n", \
+		   !!(pat & XE2_NO_PROMOTE), \
+		   !!(pat & XE2_COMP_EN), \
+		   REG_FIELD_GET(XE2_L3_CLOS, pat), \
+		   REG_FIELD_GET(XE2_L3_POLICY, pat), \
+		   REG_FIELD_GET(XE2_L4_POLICY, pat), \
+		   REG_FIELD_GET(XE2_COH_MODE, pat), \
+		   pat); \
+	}
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
+	drm_printf(p, "PAT table:%s\n", GRAPHICS_VER(xe) >= 20 ? " (* = reserved entry)" : "");
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
+		drm_printf_pat_mode(p, "PTA_MODE", pat);
+	}
+
+	if (xe->pat.pat_ats) {
+		u32 pat = xe->pat.pat_ats->value;
+
+		drm_printf(p, "PCIe ATS response:\n");
+		drm_printf_pat_mode(p, "ATS_MODE", pat);
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

