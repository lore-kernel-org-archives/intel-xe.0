Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94D4E6F070
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 08:54:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0BC10E09B;
	Tue, 23 Dec 2025 08:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nqp2inQb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8FD10E142
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Dec 2025 08:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766480055; x=1798016055;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=394W2R26f+m0nZonmPIaXmolXjVFDlD83+O4bkuSjUY=;
 b=nqp2inQb5dXzSCG6qw6flbbhh8LaQGRDzqXnV2HjqWmGWs8D/8sOBX51
 wjnt8z6ex5hW5WwY7CnEgx6Z/FRP96JiJyHXKIDhrdCGMWMGToE7viVGw
 dF1WLhhVB33Dsytrc4VdH50bA0UoI0+MUcyB4WhUM5xO1PZJf8QJuWRSH
 /g7SYTKjFzBBKXK1v78YvYKJtI/Mh1AIOVzZz9TyT9QOyHykzCWvkARx1
 vKj87KYfsq1kkmv2aF08sqCrLrjbHS6LwOTQ4oKoJt4fDWgsBU3SstRQb
 A31dHZoivAVAiYw2mW38JIUVKnm/5YVvKMMVNVSHggwUa9KdYuiBmYsj2 Q==;
X-CSE-ConnectionGUID: n970DHYVSru8KovlKhZRRg==
X-CSE-MsgGUID: DARFl+4xQX+rk6b1OggtuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68402361"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208";a="68402361"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 00:54:15 -0800
X-CSE-ConnectionGUID: kdqaHDMBTmeSWTYovDkaeg==
X-CSE-MsgGUID: jN1CakNjQESUjHSealf9Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208";a="204681182"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by fmviesa004.fm.intel.com with ESMTP; 23 Dec 2025 00:54:15 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v4 2/2] drm/xe: Add a wrapper for set/unset params
Date: Tue, 23 Dec 2025 00:51:29 -0800
Message-Id: <20251223085129.412961-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20251223085129.412961-1-vinay.belgaumkar@intel.com>
References: <20251223085129.412961-1-vinay.belgaumkar@intel.com>
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

v2: xe_guc_rc functions to use guc pointer instead of gt (Michal W)
v3: Assert if runtime pm ref is not held (Michal W)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 48 ++++++++++++++++------------------
 drivers/gpu/drm/xe/xe_guc_pc.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_rc.c | 26 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_rc.h |  3 +++
 drivers/gpu/drm/xe/xe_oa.c     |  9 +++----
 5 files changed, 58 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 3e7173130066..93f4d56c6f40 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -264,6 +264,29 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
 	return ret;
 }
 
+/**
+ * xe_guc_pc_action_set_param() - Set value of SLPC param
+ * @pc: Xe_GuC_PC instance
+ * @id: Param id
+ * @value: Value to set
+ */
+int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
+{
+	xe_device_assert_mem_access(pc_to_xe(pc));
+	return pc_action_set_param(pc, id, value);
+}
+
+/**
+ * xe_guc_pc_action_unset_param() - Revert to default value
+ * @pc: Xe_GuC_PC instance
+ * @id: Param id
+ */
+int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
+{
+	xe_device_assert_mem_access(pc_to_xe(pc));
+	return pc_action_unset_param(pc, id);
+}
+
 static u32 decode_freq(u32 raw)
 {
 	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
@@ -1045,31 +1068,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
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
index b7dab3158060..4d75babc4d28 100644
--- a/drivers/gpu/drm/xe/xe_guc_rc.c
+++ b/drivers/gpu/drm/xe/xe_guc_rc.c
@@ -14,6 +14,7 @@
 #include "xe_gt_idle.h"
 #include "xe_gt_printk.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_pc.h"
 #include "xe_guc_rc.h"
 #include "xe_pm.h"
 
@@ -137,3 +138,28 @@ int xe_guc_rc_start(struct xe_guc *guc)
 
 	return xe_guc_rc_enable(guc);
 }
+
+/**
+ * xe_guc_rc_override_mode() - override GUCRC mode
+ * @guc: Xe GuC instance
+ * @mode: new value of the mode.
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_guc_rc_override_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode)
+{
+	guard(xe_pm_runtime)(guc_to_xe(guc));
+	return xe_guc_pc_action_set_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
+}
+
+/**
+ * xe_guc_rc_unset_mode() - revert to default mode
+ * @guc: Xe GuC instance
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_guc_rc_unset_mode(struct xe_guc *guc)
+{
+	guard(xe_pm_runtime)(guc_to_xe(guc));
+	return xe_guc_pc_action_unset_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE);
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
index f2a6ae7f05d8..581c66ed7e3a 100644
--- a/drivers/gpu/drm/xe/xe_guc_rc.h
+++ b/drivers/gpu/drm/xe/xe_guc_rc.h
@@ -7,9 +7,12 @@
 #define _XE_GUC_RC_H_
 
 struct xe_guc;
+enum slpc_gucrc_mode;
 
 void xe_guc_rc_disable(struct xe_guc *guc);
 int xe_guc_rc_start(struct xe_guc *guc);
 int xe_guc_rc_init(struct xe_guc *guc);
+int xe_guc_rc_override_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode);
+int xe_guc_rc_unset_mode(struct xe_guc *guc);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index abf87fe0b345..ae811c9c5303 100644
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
+		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
 
 	xe_oa_free_configs(stream);
 	xe_file_put(stream->xef);
@@ -1765,8 +1765,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	 * state. Prevent this by overriding GUCRC mode.
 	 */
 	if (XE_GT_WA(stream->gt, 1509372804)) {
-		ret = xe_guc_pc_override_gucrc_mode(&gt->uc.guc.pc,
-						    SLPC_GUCRC_MODE_GUCRC_NO_RC6);
+		ret = xe_guc_rc_override_mode(&gt->uc.guc, SLPC_GUCRC_MODE_GUCRC_NO_RC6);
 		if (ret)
 			goto err_free_configs;
 
@@ -1824,7 +1823,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
 	xe_pm_runtime_put(stream->oa->xe);
 	if (stream->override_gucrc)
-		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
+		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
 err_free_configs:
 	xe_oa_free_configs(stream);
 exit:
-- 
2.38.1

