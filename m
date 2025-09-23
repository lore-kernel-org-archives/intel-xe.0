Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B0ECAC5AC
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 21:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167FE10E0FD;
	Tue, 23 Sep 2025 21:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8JJocUM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2036110E0FD
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 21:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758662190; x=1790198190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FCRQOtnyqogctLf8dJ1qhTYvqMsTLRzl+luSQoP3yiA=;
 b=Q8JJocUM7Dv4/m7peY31W+npuxF398CePGkaEVduWqkX81ZYAUDOez3e
 NDhL9wcTV6Utied5pj8xX9PCBvlYAKv8RdRTPvB+GHcN4fEB3wLkBUIbc
 puhkJHWHgDvMFweaCpBm0NjBUEPhsZO1EOoi0idte8YaA2Dtw+yS6pUx8
 FUrbvLjElQ4tLauxFqxVfj1lm1Q4Tn0rEce1qr6QyR3pPBR7QzIC+kqOj
 O1wuXcRVzb9ZMM++NJJM663V7csQSTIhihVKTFahvYj9kVmfZMVk9XcGo
 CGpk7u9PmOydeKbqVoTjwOTT7i91IOxYDgmXD9xi64KSGrGBb50b3OlCf Q==;
X-CSE-ConnectionGUID: bwaHpFbVTa+v/LAvm67OSw==
X-CSE-MsgGUID: m1fqeg/jR0aAcxjrjCMBOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64592579"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="64592579"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 14:16:30 -0700
X-CSE-ConnectionGUID: zrqPwtLgSbejExxWOYh9Jg==
X-CSE-MsgGUID: PvjzUDMjQrKOJoSNUdVryQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="175989812"
Received: from pczakx-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.84.166])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 14:16:29 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/5] drm/xe/debugfs: Update xe_wa_dump signature
Date: Tue, 23 Sep 2025 23:16:10 +0200
Message-ID: <20250923211613.193347-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923211613.193347-1-michal.wajdeczko@intel.com>
References: <20250923211613.193347-1-michal.wajdeczko@intel.com>
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

Our debugfs helper xe_gt_debugfs_show_with_rpm() expects print()
functions to return int. New signature allows us to drop wrapper.

While around, print additional separation lines using puts() to
avoid output with leading \n which might confuse some printers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  8 +-------
 drivers/gpu/drm/xe/xe_wa.c         | 19 +++++++++++++++----
 drivers/gpu/drm/xe/xe_wa.h         |  2 +-
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 6694a38203d3..e6a7684d571a 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -167,12 +167,6 @@ static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
-static int workarounds(struct xe_gt *gt, struct drm_printer *p)
-{
-	xe_wa_dump(gt, p);
-	return 0;
-}
-
 static int tunings(struct xe_gt *gt, struct drm_printer *p)
 {
 	xe_tuning_dump(gt, p);
@@ -236,7 +230,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 	{ "topology", .show = xe_gt_debugfs_show_with_rpm, .data = xe_gt_topology_dump },
 	{ "register-save-restore",
 		.show = xe_gt_debugfs_show_with_rpm, .data = register_save_restore },
-	{ "workarounds", .show = xe_gt_debugfs_show_with_rpm, .data = workarounds },
+	{ "workarounds", .show = xe_gt_debugfs_show_with_rpm, .data = xe_wa_gt_dump },
 	{ "tunings", .show = xe_gt_debugfs_show_with_rpm, .data = tunings },
 	{ "default_lrc_rcs", .show = xe_gt_debugfs_show_with_rpm, .data = rcs_default_lrc },
 	{ "default_lrc_ccs", .show = xe_gt_debugfs_show_with_rpm, .data = ccs_default_lrc },
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index cd03891654a1..c60159a13001 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -1086,7 +1086,14 @@ void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p)
 			drm_printf_indent(p, 1, "%s\n", device_oob_was[idx].name);
 }
 
-void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
+/**
+ * xe_wa_gt_dump() - Dump GT workarounds into a drm printer.
+ * @gt: the &xe_gt
+ * @p: the &drm_printer
+ *
+ * Return: always 0.
+ */
+int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	size_t idx;
 
@@ -1094,18 +1101,22 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
 	for_each_set_bit(idx, gt->wa_active.gt, ARRAY_SIZE(gt_was))
 		drm_printf_indent(p, 1, "%s\n", gt_was[idx].name);
 
-	drm_printf(p, "\nEngine Workarounds\n");
+	drm_puts(p, "\n");
+	drm_printf(p, "Engine Workarounds\n");
 	for_each_set_bit(idx, gt->wa_active.engine, ARRAY_SIZE(engine_was))
 		drm_printf_indent(p, 1, "%s\n", engine_was[idx].name);
 
-	drm_printf(p, "\nLRC Workarounds\n");
+	drm_puts(p, "\n");
+	drm_printf(p, "LRC Workarounds\n");
 	for_each_set_bit(idx, gt->wa_active.lrc, ARRAY_SIZE(lrc_was))
 		drm_printf_indent(p, 1, "%s\n", lrc_was[idx].name);
 
-	drm_printf(p, "\nOOB Workarounds\n");
+	drm_puts(p, "\n");
+	drm_printf(p, "OOB Workarounds\n");
 	for_each_set_bit(idx, gt->wa_active.oob, ARRAY_SIZE(oob_was))
 		if (oob_was[idx].name)
 			drm_printf_indent(p, 1, "%s\n", oob_was[idx].name);
+	return 0;
 }
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index 6a869b2de643..8fd6a5af0910 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -22,7 +22,7 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe);
 void xe_wa_process_lrc(struct xe_hw_engine *hwe);
 void xe_wa_apply_tile_workarounds(struct xe_tile *tile);
 void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p);
-void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
+int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
 
 /**
  * XE_GT_WA - Out-of-band GT workarounds, to be queried and called as needed.
-- 
2.47.1

