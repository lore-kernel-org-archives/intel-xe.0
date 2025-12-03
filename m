Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDB7D1CDA8
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 22:54:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7E610E832;
	Wed,  3 Dec 2025 22:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8PC20BS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B2A10E81D
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 22:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764802466; x=1796338466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tWb4bz0TYmtybtjFp0Ip8RdFsXzbJJwmtWiJE3uycv0=;
 b=C8PC20BS3Ink74GRFdWXfuClOaR5Jc0gA2aBmzi4tcGCTsgZiUSNe5jV
 JC+iBfOpoDV8ZmbqYsffHQfiI3LtctdNZFDQ5+otZYosWr5YiVxvIKbKb
 jHZCNckEu81/zapqwZbK9YckJ4KRXSR4HEB37mpFAZuowGaruptQDrCv9
 qJaBBtt70DxV7feXJFjyi9Db4IBgtYH/7X0tDuCW5oioD9x5ny0SCM5RY
 Uyk97xmfRmdr2TrmQP/pLUpwE1HQcHUmRFveMxhCe2SMSTNv1gsdIs/xl
 V1DZmYIQ1VGeo6x4seqyl3Qh6NfegE1OyfjB7QDqL51qIrzFDLlx2J4sH g==;
X-CSE-ConnectionGUID: GeQJD6aqRhqVgSEdDLNCag==
X-CSE-MsgGUID: LkjVvtVVRLSpohpAs9wfLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66002889"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="66002889"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 14:54:26 -0800
X-CSE-ConnectionGUID: 1ptYl2LbTgy9sYehsiOfVg==
X-CSE-MsgGUID: M5YYooWnRwqNVZfWVZy8Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="195055437"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.69])
 by fmviesa008.fm.intel.com with ESMTP; 03 Dec 2025 14:54:26 -0800
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: shuicheng.lin@intel.com, alex.zuo@intel.com, Xin Wang <x.wang@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v5 2/2] drm/xe: expose PAT software config to debugfs
Date: Wed,  3 Dec 2025 22:53:55 +0000
Message-ID: <20251203225355.24972-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251203225355.24972-1-x.wang@intel.com>
References: <20251117230156.366860-1-x.wang@intel.com>
 <20251203225355.24972-1-x.wang@intel.com>
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
 drivers/gpu/drm/xe/xe_pat.c        | 59 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pat.h        |  1 +
 3 files changed, 61 insertions(+)

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
index b8146724a60e..21f053c41899 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -581,3 +581,62 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
 
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
+		if (GRAPHICS_VER(xe) >= 20) {
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

