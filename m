Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C5AD32D80
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 14:41:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F7610EB2C;
	Fri,  5 Dec 2025 14:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EVfHwT3K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BDA10EB2C
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 14:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764945685; x=1796481685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KNRXJVaOQlSCm86Cq+hjRnnycZ5oxiVFmofkOO5qBfs=;
 b=EVfHwT3K7E7Jurdjw/RzrW6ME89B7iRqfNMhAJ2IyzbaxcJAIWX406Zk
 34Gi59PGIPwWDq51npatJuFIQqRLGM/wXoJ2T+hn+9FkhNqtVGXP9IrIJ
 lPdY49ytbM8JuAKnFe3ds8gUQXT3jVYF3riGanoqQWQSgqyzbONSGStTd
 U9Kvz26JuLKdzov973svx/SEo/UbfCqRELDdRLJo20NZV5PH87sIOtrJB
 Za5p1fP5l1Awy7Fgwa8jQoKM3G8kqKMgCpS9w+woTqIDQtJC10bJEyWxE
 pgrUfjWlC+p8A5xIOVc8DpODvrQLsdUGaiXpM3ys6jOlfbD2pYcIxcDSg A==;
X-CSE-ConnectionGUID: myiLa9SGSaewhuobW4tX4g==
X-CSE-MsgGUID: CAAcVwxwRkqq9rLQ2pH5bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84583275"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="84583275"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 06:41:25 -0800
X-CSE-ConnectionGUID: JeMnrYlXTEOLLuxXfYpAQw==
X-CSE-MsgGUID: 5i+UsQoBQRG21364LudusQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="194379295"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by orviesa006.jf.intel.com with ESMTP; 05 Dec 2025 06:41:25 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 2/2] drm/xe: Add a wrapper for set/unset params
Date: Fri,  5 Dec 2025 06:38:15 -0800
Message-Id: <20251205143815.1343989-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20251205143815.1343989-1-vinay.belgaumkar@intel.com>
References: <20251205143815.1343989-1-vinay.belgaumkar@intel.com>
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

Also, extract out the GuC RC related set/unset param functions
into xe_guc_rc file. GuC still allows us to override GuC RC mode
using an SLPC H2G interface. Continue to use that interface, but
move the related code to the newly created xe_guc_rc file.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 46 ++++++++++++++++------------------
 drivers/gpu/drm/xe/xe_guc_pc.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_rc.c | 26 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_rc.h |  2 ++
 drivers/gpu/drm/xe/xe_oa.c     |  9 +++----
 5 files changed, 55 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 5ced9ef37cf3..a25ee3f62329 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -253,6 +253,27 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
 	return ret;
 }
 
+/**
+ * xe_guc_pc_action_set_param - Set value of SLPC param
+ * @pc: Xe_GuC_PC instance
+ * @id: Param id
+ * @value: Value to set
+ */
+int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
+{
+	return pc_action_set_param(pc, id, value);
+}
+
+/**
+ * xe_guc_pc_action_unset_param - Revert to default value
+ * @pc: Xe_GuC_PC instance
+ * @id: Param id
+ */
+int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
+{
+	return pc_action_unset_param(pc, id);
+}
+
 static u32 decode_freq(u32 raw)
 {
 	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
@@ -1034,31 +1055,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
 	return ret;
 }
 
-/**
- * xe_guc_pc_override_gucrc_mode - override GUCRC mode
- * @pc: Xe_GuC_PC instance
- * @mode: new value of the mode.
- *
- * Return: 0 on success, negative error code on error
- */
-int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode)
-{
-	guard(xe_pm_runtime)(pc_to_xe(pc));
-	return pc_action_set_param(pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
-}
-
-/**
- * xe_guc_pc_unset_gucrc_mode - unset GUCRC mode override
- * @pc: Xe_GuC_PC instance
- *
- * Return: 0 on success, negative error code on error
- */
-int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc)
-{
-	guard(xe_pm_runtime)(pc_to_xe(pc));
-	return pc_action_unset_param(pc, SLPC_PARAM_PWRGATE_RC_MODE);
-}
-
 static void pc_init_pcode_freq(struct xe_guc_pc *pc)
 {
 	u32 min = DIV_ROUND_CLOSEST(pc->rpn_freq, GT_FREQUENCY_MULTIPLIER);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 1b95873b262e..00182a02a49e 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -18,6 +18,8 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc);
 int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
 int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
 void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
+int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value);
+int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id);
 
 u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
 int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
index 945433ef35f0..491144a56b70 100644
--- a/drivers/gpu/drm/xe/xe_guc_rc.c
+++ b/drivers/gpu/drm/xe/xe_guc_rc.c
@@ -15,6 +15,7 @@
 #include "xe_gt_idle.h"
 #include "xe_gt_printk.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_pc.h"
 #include "xe_pm.h"
 
 /**
@@ -126,3 +127,28 @@ int xe_guc_rc_start(struct xe_gt *gt)
 
 	return xe_guc_rc_enable(gt);
 }
+
+/**
+ * xe_guc_rc_override_mode - override GUCRC mode
+ * @gt: Xe GT instance
+ * @mode: new value of the mode.
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_guc_rc_override_mode(struct xe_gt *gt, enum slpc_gucrc_mode mode)
+{
+	guard(xe_pm_runtime)(gt_to_xe(gt));
+	return xe_guc_pc_action_set_param(&gt->uc.guc.pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
+}
+
+/**
+ * xe_guc_rc_unset_mode - revert to default mode
+ * @gt: Xe GT instance
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_guc_rc_unset_mode(struct xe_gt *gt)
+{
+	guard(xe_pm_runtime)(gt_to_xe(gt));
+	return xe_guc_pc_action_unset_param(&gt->uc.guc.pc, SLPC_PARAM_PWRGATE_RC_MODE);
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
index 3a8c8d50313f..68070d230a6a 100644
--- a/drivers/gpu/drm/xe/xe_guc_rc.h
+++ b/drivers/gpu/drm/xe/xe_guc_rc.h
@@ -14,5 +14,7 @@ enum slpc_gucrc_mode;
 int xe_guc_rc_disable(struct xe_gt *gt);
 int xe_guc_rc_start(struct xe_gt *gt);
 int xe_guc_rc_init(struct xe_gt *gt);
+int xe_guc_rc_override_mode(struct xe_gt *gt, enum slpc_gucrc_mode mode);
+int xe_guc_rc_unset_mode(struct xe_gt *gt);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 890c363282ae..907b0bfc63e9 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -29,7 +29,7 @@
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
-#include "xe_guc_pc.h"
+#include "xe_guc_rc.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_oa.h"
@@ -875,7 +875,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
 	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
 	if (stream->override_gucrc)
-		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
+		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(gt));
 
 	xe_oa_free_configs(stream);
 	xe_file_put(stream->xef);
@@ -1761,8 +1761,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	 * state. Prevent this by overriding GUCRC mode.
 	 */
 	if (XE_GT_WA(stream->gt, 1509372804)) {
-		ret = xe_guc_pc_override_gucrc_mode(&gt->uc.guc.pc,
-						    SLPC_GUCRC_MODE_GUCRC_NO_RC6);
+		ret = xe_guc_rc_override_mode(gt, SLPC_GUCRC_MODE_GUCRC_NO_RC6);
 		if (ret)
 			goto err_free_configs;
 
@@ -1820,7 +1819,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
 	xe_pm_runtime_put(stream->oa->xe);
 	if (stream->override_gucrc)
-		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
+		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(gt));
 err_free_configs:
 	xe_oa_free_configs(stream);
 exit:
-- 
2.38.1

