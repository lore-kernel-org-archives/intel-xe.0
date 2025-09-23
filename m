Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A7FCAC5A5
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 21:16:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD1010E3BC;
	Tue, 23 Sep 2025 21:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+0wTJd4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AB010E27B
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 21:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758662192; x=1790198192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ekshUWp+WjuLymUDYSFVh0BXBC5B717E7wtMWP9khEU=;
 b=U+0wTJd4E985B/0pxb7oO2D3J8wzrYpNBd1NZ8fN2Xd14hozguIVlbrk
 QJXK97K629wFDEBviNr+99f/5dyCdc3LEibIar6iof0YANoOrzs+VhmW2
 sAsEN27sr6pSop4utUHG8HmTKPrDQzBqxisjqYs5h4Qo9hYzccEgsm1X5
 vi+IQWpulSyIsMDorN+D1K2UgHRZftlvFvI3SlTdzHhqvlAT1RDEdGEcA
 NlyA2UzScF/uLighRwHsPfwMiIpC8JjjqxpLfLhSCm3T4B/KpCBJAToMf
 dc580N66RV+s6n0q4K/MizqVgXd7B7YJfFbRoz5YcX2Ke/y3s/yuKkV92 Q==;
X-CSE-ConnectionGUID: vzwgS6LSTry6SRhzd7U4sw==
X-CSE-MsgGUID: +p3NYeMYRi+BF89FzxPH8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64592582"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="64592582"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 14:16:32 -0700
X-CSE-ConnectionGUID: vObF/BkBTB6gpFSuJoLX0A==
X-CSE-MsgGUID: a/rRRsGvRvag8FqwWuU5lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="175989815"
Received: from pczakx-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.84.166])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 14:16:30 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 3/5] drm/xe/debugfs: Update xe_tuning_dump signature
Date: Tue, 23 Sep 2025 23:16:11 +0200
Message-ID: <20250923211613.193347-4-michal.wajdeczko@intel.com>
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
 drivers/gpu/drm/xe/xe_tuning.c     | 17 ++++++++++++++---
 drivers/gpu/drm/xe/xe_tuning.h     |  2 +-
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index e6a7684d571a..bcf234e74471 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -167,12 +167,6 @@ static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
-static int tunings(struct xe_gt *gt, struct drm_printer *p)
-{
-	xe_tuning_dump(gt, p);
-	return 0;
-}
-
 static int pat(struct xe_gt *gt, struct drm_printer *p)
 {
 	xe_pat_dump(gt, p);
@@ -231,7 +225,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 	{ "register-save-restore",
 		.show = xe_gt_debugfs_show_with_rpm, .data = register_save_restore },
 	{ "workarounds", .show = xe_gt_debugfs_show_with_rpm, .data = xe_wa_gt_dump },
-	{ "tunings", .show = xe_gt_debugfs_show_with_rpm, .data = tunings },
+	{ "tunings", .show = xe_gt_debugfs_show_with_rpm, .data = xe_tuning_dump },
 	{ "default_lrc_rcs", .show = xe_gt_debugfs_show_with_rpm, .data = rcs_default_lrc },
 	{ "default_lrc_ccs", .show = xe_gt_debugfs_show_with_rpm, .data = ccs_default_lrc },
 	{ "default_lrc_bcs", .show = xe_gt_debugfs_show_with_rpm, .data = bcs_default_lrc },
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index a524170a04d0..fd58ea5e78bf 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -214,7 +214,14 @@ void xe_tuning_process_lrc(struct xe_hw_engine *hwe)
 	xe_rtp_process_to_sr(&ctx, lrc_tunings, ARRAY_SIZE(lrc_tunings), &hwe->reg_lrc);
 }
 
-void xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p)
+/**
+ * xe_tuning_dump() - Dump GT tuning info into a drm printer.
+ * @gt: the &xe_gt
+ * @p: the &drm_printer
+ *
+ * Return: always 0.
+ */
+int xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	size_t idx;
 
@@ -222,11 +229,15 @@ void xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p)
 	for_each_set_bit(idx, gt->tuning_active.gt, ARRAY_SIZE(gt_tunings))
 		drm_printf_indent(p, 1, "%s\n", gt_tunings[idx].name);
 
-	drm_printf(p, "\nEngine Tunings\n");
+	drm_puts(p, "\n");
+	drm_printf(p, "Engine Tunings\n");
 	for_each_set_bit(idx, gt->tuning_active.engine, ARRAY_SIZE(engine_tunings))
 		drm_printf_indent(p, 1, "%s\n", engine_tunings[idx].name);
 
-	drm_printf(p, "\nLRC Tunings\n");
+	drm_puts(p, "\n");
+	drm_printf(p, "LRC Tunings\n");
 	for_each_set_bit(idx, gt->tuning_active.lrc, ARRAY_SIZE(lrc_tunings))
 		drm_printf_indent(p, 1, "%s\n", lrc_tunings[idx].name);
+
+	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_tuning.h b/drivers/gpu/drm/xe/xe_tuning.h
index dd0d3ccc9c65..c1cc5927fda7 100644
--- a/drivers/gpu/drm/xe/xe_tuning.h
+++ b/drivers/gpu/drm/xe/xe_tuning.h
@@ -14,6 +14,6 @@ int xe_tuning_init(struct xe_gt *gt);
 void xe_tuning_process_gt(struct xe_gt *gt);
 void xe_tuning_process_engine(struct xe_hw_engine *hwe);
 void xe_tuning_process_lrc(struct xe_hw_engine *hwe);
-void xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p);
+int xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p);
 
 #endif
-- 
2.47.1

