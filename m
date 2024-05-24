Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A00DC25B79
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 19:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930AD10F648;
	Fri, 24 May 2024 19:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6M0sMuS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F283310F644
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 19:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716577315; x=1748113315;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hYp3pd3NIxQOxszr/Mt6q655ZjWIMD5a7F1rvjKzrjo=;
 b=J6M0sMuSRrPzZuELD8P182yOMFdJI6KFNdCbsJOi36XZ8mLM3N2XElM9
 VjloaRDTSapsQAT31g6oKI4olRtKcbY8xxwiFBeBlD7nyF28zpPgWvJ87
 z4kSukL0U/RwGZFJ6w5SMFHtE3PcurDcsYk0wiJC5OfdhNeT8eWKfVGSZ
 eFsEznPXezWJTWBx81WHSl0YmELNTLCdaTtandWNSRW3dcmVtD+Bv6ajr
 SsoeHSJ6D3KlcEj28mVEUAdojeWTG0KafJaRpgpO92UQL2QsdBXvmpqud
 CNvSVKdXuWmKHQAASuiTA76669HkgtPJX7frc2qsAhkes70rcmu5WxHcL A==;
X-CSE-ConnectionGUID: jm8YXC5yRNmTYRhBoEg6UQ==
X-CSE-MsgGUID: qyaP0iyWQk6pzWizW50tzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="13090723"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="13090723"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 12:01:41 -0700
X-CSE-ConnectionGUID: W//WD7BbQm2ikO+WvBsR5g==
X-CSE-MsgGUID: ssUQfNCpTKO0amFyc9T4IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="38694600"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 12:01:41 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 15/17] drm/xe/oa: Override GuC RC with OA on PVC
Date: Fri, 24 May 2024 12:01:32 -0700
Message-ID: <20240524190134.134226-16-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240524190134.134226-1-ashutosh.dixit@intel.com>
References: <20240524190134.134226-1-ashutosh.dixit@intel.com>
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

On PVC, a w/a resets RCS/CCS before it goes into RC6. This breaks OA since
OA does not expect engine resets during its use. Fix it by disabling RC6.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c   | 57 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.h   |  3 ++
 drivers/gpu/drm/xe/xe_oa.c       | 23 +++++++++++++
 drivers/gpu/drm/xe/xe_oa_types.h |  3 ++
 4 files changed, 86 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 8187dfb2ad6c..da701cf5325d 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -24,6 +24,7 @@
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_pcode.h"
+#include "xe_pm.h"
 
 #define MCHBAR_MIRROR_BASE_SNB	0x140000
 
@@ -191,6 +192,27 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 	return ret;
 }
 
+static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
+{
+	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
+	int ret;
+	u32 action[] = {
+		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
+		SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 1),
+		id,
+	};
+
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
+		return -EAGAIN;
+
+	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
+	if (ret)
+		drm_err(&pc_to_xe(pc)->drm, "GuC PC unset param failed: %pe",
+			ERR_PTR(ret));
+
+	return ret;
+}
+
 static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
 {
 	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
@@ -773,6 +795,41 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 	return 0;
 }
 
+/**
+ * xe_guc_pc_override_gucrc_mode - override GUCRC mode
+ * @pc: Xe_GuC_PC instance
+ * @mode: new value of the mode.
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode)
+{
+	int ret;
+
+	xe_pm_runtime_get(pc_to_xe(pc));
+	ret = pc_action_set_param(pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
+	xe_pm_runtime_put(pc_to_xe(pc));
+
+	return ret;
+}
+
+/**
+ * xe_guc_pc_unset_gucrc_mode - unset GUCRC mode override
+ * @pc: Xe_GuC_PC instance
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc)
+{
+	int ret;
+
+	xe_pm_runtime_get(pc_to_xe(pc));
+	ret = pc_action_unset_param(pc, SLPC_PARAM_PWRGATE_RC_MODE);
+	xe_pm_runtime_put(pc_to_xe(pc));
+
+	return ret;
+}
+
 static void pc_init_pcode_freq(struct xe_guc_pc *pc)
 {
 	u32 min = DIV_ROUND_CLOSEST(pc->rpn_freq, GT_FREQUENCY_MULTIPLIER);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 532cac985a6d..eb5bba9f0736 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -9,11 +9,14 @@
 #include <linux/types.h>
 
 struct xe_guc_pc;
+#include "abi/guc_actions_slpc_abi.h"
 
 int xe_guc_pc_init(struct xe_guc_pc *pc);
 int xe_guc_pc_start(struct xe_guc_pc *pc);
 int xe_guc_pc_stop(struct xe_guc_pc *pc);
 int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
+int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
+int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
 
 u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
 int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index c1820128523b..04783b2fcb2c 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -24,6 +24,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
+#include "xe_guc_pc.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
@@ -815,6 +816,10 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_pm_runtime_put(stream->oa->xe);
 
+	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
+	if (stream->override_gucrc)
+		XE_WARN_ON(xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
+
 	xe_oa_free_configs(stream);
 }
 
@@ -1303,6 +1308,21 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 		goto exit;
 	}
 
+	/*
+	 * Wa_1509372804:pvc
+	 *
+	 * GuC reset of engines causes OA to lose configuration
+	 * state. Prevent this by overriding GUCRC mode.
+	 */
+	if (stream->oa->xe->info.platform == XE_PVC) {
+		ret = xe_guc_pc_override_gucrc_mode(&gt->uc.guc.pc,
+						    SLPC_GUCRC_MODE_GUCRC_NO_RC6);
+		if (ret)
+			goto err_free_configs;
+
+		stream->override_gucrc = true;
+	}
+
 	/* Take runtime pm ref and forcewake to disable RC6 */
 	xe_pm_runtime_get(stream->oa->xe);
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
@@ -1349,6 +1369,9 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 err_fw_put:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_pm_runtime_put(stream->oa->xe);
+	if (stream->override_gucrc)
+		XE_WARN_ON(xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
+err_free_configs:
 	xe_oa_free_configs(stream);
 exit:
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 7f7c84e4b3a6..7775fe91616f 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -220,6 +220,9 @@ struct xe_oa_stream {
 	/** @poll_period_ns: hrtimer period for checking OA buffer for available data */
 	u64 poll_period_ns;
 
+	/** @override_gucrc: GuC RC has been overridden for the OA stream */
+	bool override_gucrc;
+
 	/** @oa_status: temporary storage for oa_status register value */
 	u32 oa_status;
 };
-- 
2.41.0

