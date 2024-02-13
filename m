Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9DEC48BEC
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 06:45:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8110F10EB68;
	Tue, 13 Feb 2024 06:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XP1ULhpz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD85010EB8B
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 06:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806672; x=1739342672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j18xlWUwXOfiEJnGTxv7lPs1BqgXzTHeE6npC0hw89U=;
 b=XP1ULhpz0rmrXGeDQb5PWtzhl8R9IGRAv62Wsn2B00zpsai6Ypt42msa
 ZMFhCyj2e5+PFLfx+bvniSjPoaDgu7iOekkfNkS6DyFtK2/Jccxh6GupM
 l8SAtQDUGU4YoZgKJMKiSYAoj+3zkREAeDqXulU47KeM7iHUF0g3lKmAb
 ZyDP/6zof+3B3IbMGX45Udf0Cwqv1RxIY5wtnCQzO/NQ1g2izBeswwHeV
 WDXOZo/+swFu+hzvjk28TPBMfK44aRLSyj6Q3fM5p2cUBwjplUUPSStGA
 2r97PQ6yJk4QIc70NecjZJ8PGcZaog7+ua1KrKn5EbqdNuObglKCCoqdx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5621246"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="5621246"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:44:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="33599825"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:44:31 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 16/16] drm/xe/oa: Override GuC RC with OA on PVC
Date: Mon, 12 Feb 2024 22:44:23 -0800
Message-ID: <20240213064423.131601-17-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213064423.131601-1-ashutosh.dixit@intel.com>
References: <20240213064423.131601-1-ashutosh.dixit@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_pc.c   | 56 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.h   |  3 ++
 drivers/gpu/drm/xe/xe_oa.c       | 25 +++++++++++++-
 drivers/gpu/drm/xe/xe_oa_types.h |  3 ++
 4 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index d91702592520a..4e9ec5ad09ec1 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -209,6 +209,27 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
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
@@ -820,6 +841,41 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 	return ret;
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
+	xe_device_mem_access_get(pc_to_xe(pc));
+	ret = pc_action_set_param(pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
+	xe_device_mem_access_put(pc_to_xe(pc));
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
index cecad8e9300b4..60ce33fdeb153 100644
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
 
 u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
 int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 630aeddc4a533..c26bbed1940ec 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -21,6 +21,7 @@
 #include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
+#include "xe_guc_pc.h"
 #include "xe_lrc.h"
 #include "xe_mmio.h"
 #include "xe_oa.h"
@@ -801,6 +802,10 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 	xe_device_mem_access_put(stream->oa->xe);
 
 	xe_oa_free_oa_buffer(stream);
+	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
+	if (stream->override_gucrc)
+		XE_WARN_ON(xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
+
 	xe_oa_free_configs(stream);
 }
 
@@ -1273,9 +1278,24 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
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
 	ret = xe_oa_alloc_oa_buffer(stream);
 	if (ret)
-		goto err_free_configs;
+		goto err_unset_gucrc;
 
 	/* Take runtime pm ref and forcewake to disable RC6 */
 	xe_device_mem_access_get(stream->oa->xe);
@@ -1318,6 +1338,9 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
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
index 0e7852309de70..ce20c03bbc285 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -219,5 +219,8 @@ struct xe_oa_stream {
 
 	/** @poll_period_ns: hrtimer period for checking OA buffer for available data */
 	u64 poll_period_ns;
+
+	/** @override_gucrc: GuC RC has been overridden for the OA stream */
+	bool override_gucrc;
 };
 #endif
-- 
2.41.0

