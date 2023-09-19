Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98672CE79B3
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 16:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691EC10E3D4;
	Tue, 19 Sep 2023 16:16:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B776B10E288
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695140180; x=1726676180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fqC+gzBpA39EA/fDj8Tyefk2IiKGzRQERRjz8E9qiL8=;
 b=Jku4jZELmUVoVCKgHPaO3ahnJixYLZkGWYq40D1k+gfMslNE0da8XYPX
 1t3sP4ry5ifUFhijJka2+5XX5GfVUAaojYc2mX6jlAJzivEfQM5vSM1mv
 QoJQYMOz18/JDy6DmxZElq4O5UDWaJGIDtko/fsl88dKKEiID+SMbWyJG
 1TyiBJ4LKPvI8bsuViQjoBXt/IckqmTRd28/Ut435iMeFqgIyp5jWPLdm
 GCKKCMGjbct5akGLTSC7ZeMj9yk7qnKoJtDhO4W4qSjIr6E2DoTnSAZ+H
 PvNCvbMbPLU2ZDI2p+ZBMFkWFKYRtc97TmCqymkg8c5nIPI73vHSs2CaL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410913561"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="410913561"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870016533"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="870016533"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:54 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 09:10:39 -0700
Message-ID: <20230919161049.2307855-12-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 11/21] drm/xe/oa: Override GuC RC with OA on PVC
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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c   | 60 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.h   |  3 ++
 drivers/gpu/drm/xe/xe_oa.c       | 26 +++++++++++++-
 drivers/gpu/drm/xe/xe_oa_types.h |  6 ++++
 4 files changed, 94 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 8a4d299d6cb02..a91de057f6246 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -225,6 +225,27 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
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
@@ -768,6 +789,45 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 	return ret;
 }
 
+/**
+ * xe_guc_pc_override_gucrc_mode() - override GUCRC mode
+ * @pc: Xe_GuC_PC instance
+ * @mode: new value of the mode.
+ *
+ * Override the GUCRC mode.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode)
+{
+	int ret;
+
+	xe_device_mem_access_get(pc_to_xe(pc));
+	ret = pc_action_set_param(pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
+	xe_device_mem_access_put(pc_to_xe(pc));
+
+	return ret;
+}
+
+/**
+ * xe_guc_pc_override_gucrc_mode() - override GUCRC mode
+ * @pc: Xe_GuC_PC instance
+ *
+ * Unset the GUCRC mode override
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc)
+{
+	int ret;
+
+	xe_device_mem_access_get(pc_to_xe(pc));
+	ret = pc_action_unset_param(pc, SLPC_PARAM_PWRGATE_RC_MODE);
+	xe_device_mem_access_put(pc_to_xe(pc));
+
+	return ret;
+}
+
 static void pc_init_pcode_freq(struct xe_guc_pc *pc)
 {
 	u32 min = DIV_ROUND_CLOSEST(pc->rpn_freq, GT_FREQUENCY_MULTIPLIER);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 43ea582545b57..0a2c7b9a4dc97 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -7,12 +7,15 @@
 #define _XE_GUC_PC_H_
 
 #include "xe_guc_pc_types.h"
+#include "abi/guc_actions_slpc_abi.h"
 
 int xe_guc_pc_init(struct xe_guc_pc *pc);
 void xe_guc_pc_fini(struct xe_guc_pc *pc);
 int xe_guc_pc_start(struct xe_guc_pc *pc);
 int xe_guc_pc_stop(struct xe_guc_pc *pc);
 int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
+int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
+int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
 
 enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
 u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index fc0159543dc74..506dd056805b2 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -23,6 +23,7 @@
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
+#include "xe_guc_pc.h"
 #include "xe_lrc.h"
 #include "xe_migrate.h"
 #include "xe_mmio.h"
@@ -909,6 +910,10 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 	xe_device_mem_access_put(stream->oa->xe);
 
 	xe_oa_free_oa_buffer(stream);
+	/* Wa_1509372804:pvc: * Unset the override of GUCRC mode to enable rc6 */
+	if (stream->override_gucrc)
+		XE_WARN_ON(xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
+
 	xe_oa_free_configs(stream);
 }
 
@@ -1344,9 +1349,25 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 		goto exit;
 	}
 
+	/*
+	 * Wa_1509372804:pvc
+	 *
+	 * GuC reset of engines causes OA to lose configuration
+	 * state. Prevent this by overriding GUCRC mode.
+	 *
+	 */
+	if (gt->tile->xe->info.platform == XE_PVC) {
+		ret = xe_guc_pc_override_gucrc_mode(&gt->uc.guc.pc,
+						    SLPC_GUCRC_MODE_GUCRC_NO_RC6);
+		if (ret)
+			goto err_free_configs;
+
+		stream->override_gucrc = true;
+	}
+
 	ret = xe_oa_alloc_oa_buffer(stream);
 	if (ret)
-		goto err_free_configs;
+		goto err_unset_gucrc;
 
 	/* Take runtime pm ref and forcewake to disable RC6 */
 	xe_device_mem_access_get(stream->oa->xe);
@@ -1377,6 +1398,9 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_device_mem_access_put(stream->oa->xe);
 	xe_oa_free_oa_buffer(stream);
+err_unset_gucrc:
+	if (stream->override_gucrc)
+		XE_WARN_ON(xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
 err_free_configs:
 	xe_oa_free_configs(stream);
 exit:
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 4063c81e353ff..126692718c888 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -291,5 +291,11 @@ struct xe_oa_stream {
 	 * buffer should be checked for available data.
 	 */
 	u64 poll_oa_period;
+
+	/**
+	 * @override_gucrc: GuC RC has been overridden for the perf stream,
+	 * and we need to restore the default configuration on release.
+	 */
+	bool override_gucrc;
 };
 #endif
-- 
2.41.0

