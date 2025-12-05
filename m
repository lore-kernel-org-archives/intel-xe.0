Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8787FD2E00E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 07:02:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4616510EA21;
	Fri,  5 Dec 2025 07:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLlBcYG2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FC310EA21
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 07:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764918144; x=1796454144;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JgZuBoZ/X4ub8OXg1yB0UBNhXBoKkFIryGh085+3Isw=;
 b=jLlBcYG2Fa2jJMB6+sLspABukjUQ8RMocoLLCmuoFjeoV/EXpOlG0LdD
 5ehmf7j3ysk3O5AIA4hzt8Zhzcb6KPLe3fd7ywc//+ixBizwcsWNMrmWt
 d9PhKnPUbnUXzSvd18E9hIbwO/p5HddrrVbAptFknbrpODB1doOmDsrJp
 XwR1pDrTIoX0FgPm5Ptd9I/cKarshYU5CXQrif8O0bAxPuw0saKeTQ8eW
 0Y52Z0b19+NK1+bgLwG6EoU86qydSnQNPa909ur2dGRRIaynfbbkEeZaf
 1j2smmi3RMpIrnuusxl/CzvI58QkrZNmjCnrfwIECTMn+ytNAbS7YaGx8 w==;
X-CSE-ConnectionGUID: osd8Y4mXQ3K9mEJXALyLUg==
X-CSE-MsgGUID: O9c1vE3aTX2aqL4heuQnSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66139730"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="66139730"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 23:02:23 -0800
X-CSE-ConnectionGUID: C4raAngrScGwPj7B01KDMA==
X-CSE-MsgGUID: Kr8ciRPFTryTZZhRipkqGg==
X-ExtLoop1: 1
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.69])
 by fmviesa003.fm.intel.com with ESMTP; 04 Dec 2025 23:02:23 -0800
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: shuicheng.lin@intel.com, alex.zuo@intel.com, Xin Wang <x.wang@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v6 2/2] drm/xe: expose PAT software config to debugfs
Date: Fri,  5 Dec 2025 07:02:20 +0000
Message-ID: <20251205070220.27859-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205070220.27859-1-x.wang@intel.com>
References: <20251203225355.24972-1-x.wang@intel.com>
 <20251205070220.27859-1-x.wang@intel.com>
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

The existing "pat" debugfs node dumps the live PAT registers. Under
SR-IOV the VF cannot touch those registers, so the file vanishes and
users lose all PAT visibility. Add a VF-safe "pat_sw_config" entry to
the VF-safe debugfs list. It prints the cached PAT table the driver
programmed, rather than poking HW, so PF and VF instances present the
same view.

This lets IGT and other tools query the PAT configuration without
carrying platform-specific tables or mirroring kernel logic.

v2: (Jonathan)
- Only append "(* = reserved entry)" to the PAT table header on Xe2+
  platforms where it actually applies.
- Deduplicate the PTA/ATS mode printing by introducing the small
  drm_printf_pat_mode() helper macro.

v3: (Matt)
- Print IDX[XE_CACHE_NONE_COMPRESSION] on every Xe2+ platform so the
  dump always reflects the value the driver might use (even if it defaults
  to 0) and future IP revisions don’t need extra condition tweaks.

v4:
- Drop the drm_printf_pat_mode macro and introduce a real helper
  xe2_pat_entry_dump(). (Jani)
- Reuse the helper across all PTA/ATS/PAT dumps for xe2+ entries to keep
  output format identical.

v5: (Matt)
- Split the original patch into two: one for refactoring helpers, one for
  the new debugfs entry.

CC: Jani Nikula <jani.nikula@intel.com>
Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  1 +
 drivers/gpu/drm/xe/xe_pat.c        | 62 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pat.h        |  1 +
 3 files changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 7c3de6539044..e4f38b5150fc 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -209,6 +209,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 	{ "default_lrc_vcs", .show = xe_gt_debugfs_show_with_rpm, .data = vcs_default_lrc },
 	{ "default_lrc_vecs", .show = xe_gt_debugfs_show_with_rpm, .data = vecs_default_lrc },
 	{ "hwconfig", .show = xe_gt_debugfs_show_with_rpm, .data = hwconfig },
+	{ "pat_sw_config", .show = xe_gt_debugfs_simple_show, .data = xe_pat_dump_sw_config },
 };
 
 /* everything else should be added here */
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index beff250c7fa0..6f48d34711a6 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -592,3 +592,65 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
 
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
+	char label[PAT_LABEL_LEN];
+
+	if (!xe->pat.table || !xe->pat.n_entries)
+		return -EOPNOTSUPP;
+
+	drm_printf(p, "PAT table:%s\n", GRAPHICS_VER(xe) >= 20 ? " (* = reserved entry)" : "");
+	for (u32 i = 0; i < xe->pat.n_entries; i++) {
+		u32 pat = xe->pat.table[i].value;
+
+		if (GRAPHICS_VERx100(xe) == 3511) {
+			xe_pat_index_label(label, sizeof(label), i);
+			xe3p_xpc_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
+		} else if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
+			xe_pat_index_label(label, sizeof(label), i);
+			xe2_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
+		} else if (xe->info.platform == XE_METEORLAKE) {
+			xelpg_pat_entry_dump(p, i, pat);
+		} else if (xe->info.platform == XE_PVC) {
+			xehpc_pat_entry_dump(p, i, pat);
+		} else if (xe->info.platform == XE_DG2 || GRAPHICS_VERx100(xe) <= 1210) {
+			xelp_pat_entry_dump(p, i, pat);
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
+		drm_printf(p, "PCIe ATS/PASID:\n");
+		xe2_pat_entry_dump(p, "PAT_ATS ", pat, false);
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
index b8559120989e..5749a488d9a9 100644
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

