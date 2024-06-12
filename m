Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C72C2BA12
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 02:05:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE67E10E1DA;
	Wed, 12 Jun 2024 02:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YCcP4J98";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05EC10E755
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 02:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718157939; x=1749693939;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9ymygULM4qH0WZGJImFmlhBtHyYdkSMg0MUpze7AF7I=;
 b=YCcP4J98BHoMRrW1qWw9GEWy542mgtrXcv9bB6tYwGoli1SEr5KPNCF5
 FpUGN/R7ZvJC2Qegv+USwsjNCDVFXYJr750WX+btZ6/sEiPpzGcE7UnpU
 uhBr6TnjOQfCHswBvf0kyH4spLjmxt9EvOAM46FGC1U0cJTPvbwwzN+RP
 Mb8kPZsTi8lHdyrNGD45hEoc2C3hkMc4krVoup+y9jeczdcO7XYzEyEvl
 neYEojJLPYg6JdQXKNaGFkIowEfBIfmLGYhbXEz58PGN+bvJQheTDtU11
 PynQcYJEwSe8xIj9EhNpyTH8T//FEfKq5iPmBBJ77JuwPIZaT3U4TEUge Q==;
X-CSE-ConnectionGUID: WrLguDwHRMSWUwja2d9KEw==
X-CSE-MsgGUID: c/VvGpsnSEWkkE1KACvRMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15028666"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="15028666"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:05:38 -0700
X-CSE-ConnectionGUID: Ff/fdn7tSYq6D167Q0TelA==
X-CSE-MsgGUID: d3/VbRVjTx6EQhQf49COLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="39738474"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:05:38 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 15/17] drm/xe/oa: Override GuC RC with OA on PVC
Date: Tue, 11 Jun 2024 19:05:29 -0700
Message-ID: <20240612020531.2680081-16-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240612020531.2680081-1-ashutosh.dixit@intel.com>
References: <20240612020531.2680081-1-ashutosh.dixit@intel.com>
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

v2: Convert to gt oriented error/warn messages (Michal)

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c   | 57 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.h   |  3 ++
 drivers/gpu/drm/xe/xe_oa.c       | 24 ++++++++++++++
 drivers/gpu/drm/xe/xe_oa_types.h |  3 ++
 4 files changed, 87 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 666a37106bc5..2b45a9cd3ec0 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -24,6 +24,7 @@
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_pcode.h"
+#include "xe_pm.h"
 
 #define MCHBAR_MIRROR_BASE_SNB	0x140000
 
@@ -190,6 +191,27 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 	return ret;
 }
 
+static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
+{
+	u32 action[] = {
+		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
+		SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 1),
+		id,
+	};
+	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
+	int ret;
+
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
+		return -EAGAIN;
+
+	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
+	if (ret)
+		xe_gt_err(pc_to_gt(pc), "GuC PC unset param failed: %pe",
+			  ERR_PTR(ret));
+
+	return ret;
+}
+
 static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
 {
 	struct xe_guc_ct *ct = pc_to_ct(pc);
@@ -772,6 +794,41 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
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
index 532cac985a6d..8a7b91ce1b3e 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -9,11 +9,14 @@
 #include <linux/types.h>
 
 struct xe_guc_pc;
+enum slpc_gucrc_mode;
 
 int xe_guc_pc_init(struct xe_guc_pc *pc);
 int xe_guc_pc_start(struct xe_guc_pc *pc);
 int xe_guc_pc_stop(struct xe_guc_pc *pc);
 int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
+int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
+int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
 
 u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
 int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 1fccfe6aef98..4e3eabc09bd1 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -12,6 +12,7 @@
 #include <drm/drm_managed.h>
 #include <drm/xe_drm.h>
 
+#include "abi/guc_actions_slpc_abi.h"
 #include "instructions/xe_mi_commands.h"
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
@@ -26,6 +27,7 @@
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
+#include "xe_guc_pc.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
@@ -817,6 +819,10 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_pm_runtime_put(stream->oa->xe);
 
+	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
+	if (stream->override_gucrc)
+		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
+
 	xe_oa_free_configs(stream);
 }
 
@@ -1308,6 +1314,21 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
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
@@ -1354,6 +1375,9 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 err_fw_put:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_pm_runtime_put(stream->oa->xe);
+	if (stream->override_gucrc)
+		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
+err_free_configs:
 	xe_oa_free_configs(stream);
 exit:
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index d28ee566c51c..0981f0e57676 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -227,6 +227,9 @@ struct xe_oa_stream {
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

