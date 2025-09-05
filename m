Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C43CA1013
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 23:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD4210E196;
	Fri,  5 Sep 2025 23:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aPiBP96D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B9410E196
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 23:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757116605; x=1788652605;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ADzFWwPyENHABNG0uFEs9r1suv20jn+TL3LYfthmYWQ=;
 b=aPiBP96DKWkU1aVUMSVvrIBUrL6rogJY+XAF4PnyPNIyj+DWvEZfUcnu
 cqrAtnAyI5aGrRRzgKCqL+d7HH/4b6kfPiNxtwfPNae18TrK6oWi2cXoI
 f7PzZ3HlAxAslfZ/Ska88iQYeQ/GhBoBrR3xgOihINiX08F2s8XNZo9e4
 qnl+UDU0kuoyHPgnWx/lFXg8hkkLnooGvc1vu97HiZFMPoYsBJXbeZPiN
 iCbxNOci69yhGkSAObrwWkArR5IMnDfrkeX7puOWZB5+fD1JdxjnFpLLm
 Iy2/ZG4tiS61WVGdMNZqOn15zmrbxCfXVSD7PIkYSUuSs7DPbKMQeHzMr Q==;
X-CSE-ConnectionGUID: V0cZfGx6STGyjg47gvb90A==
X-CSE-MsgGUID: NYFaNMQ9S/27g3kX5VAVNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70899760"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="70899760"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 16:56:45 -0700
X-CSE-ConnectionGUID: 7Mt0ow9fTFO2+fCHxoMa8A==
X-CSE-MsgGUID: IoT4EHeLQrmWmyUKOkZd3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="171849786"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 16:56:45 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v2] drm/xe/guc: Set RCS/CCS yield policy
Date: Fri,  5 Sep 2025 16:56:33 -0700
Message-ID: <20250905235632.3333247-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

All recent platforms (including all the ones officially supported by the
Xe driver) do not allow concurrent execution of RCS and CCS workloads
from different address spaces, with the HW blocking the context switch
when it detects such a scenario.
The DUAL_QUEUE flag helps with this, by causing the GuC to not submit a
context it knows will not be able to execute. This, however, causes a new
problem: if RCS and CCS queues have pending workloads from different
address spaces, the GuC needs to choose from which of the 2 queues to
pick the next workload to execute. By default, the GuC prioritizes RCS
submissions over CCS ones, which can lead to CCS workloads being
significantly (or completely) starved of execution time.
The driver can tune this by setting a dedicated scheduling policy KLV;
this KLV allows the driver to specify a quantum (in ms) and a ratio
(percentage value between 0 and 100), and the GuC will prioritize the CCS
for that percentage of each quantum.
Given that we want to guarantee enough RCS throughput to avoid missing
frames, we set the yield policy to 20% of each 80ms interval.

v2: updated quantum and ratio, improved comment, use xe_guc_submit_disable
in gt_sanitize

Fixes: d9a1ae0d17bd ("drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h    | 25 +++++++++
 drivers/gpu/drm/xe/xe_gt.c               |  2 +-
 drivers/gpu/drm/xe/xe_guc.c              |  6 +--
 drivers/gpu/drm/xe/xe_guc_submit.c       | 66 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h       |  2 +
 6 files changed, 97 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index d8cf68a0516d..1baa969aaa7c 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -117,6 +117,7 @@ enum xe_guc_action {
 	XE_GUC_ACTION_ENTER_S_STATE = 0x501,
 	XE_GUC_ACTION_EXIT_S_STATE = 0x502,
 	XE_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE = 0x506,
+	XE_GUC_ACTION_UPDATE_SCHEDULING_POLICIES_KLV = 0x509,
 	XE_GUC_ACTION_SCHED_CONTEXT = 0x1000,
 	XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET = 0x1001,
 	XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE = 0x1002,
diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 0e78351c6ef5..265a135e7061 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -17,6 +17,7 @@
  *  | 0 | 31:16 | **KEY** - KLV key identifier                                 |
  *  |   |       |   - `GuC Self Config KLVs`_                                  |
  *  |   |       |   - `GuC Opt In Feature KLVs`_                               |
+ *  |   |       |   - `GuC Scheduling Policies KLVs`_                          |
  *  |   |       |   - `GuC VGT Policy KLVs`_                                   |
  *  |   |       |   - `GuC VF Configuration KLVs`_                             |
  *  |   |       |                                                              |
@@ -152,6 +153,30 @@ enum  {
 #define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_KEY 0x4003
 #define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_LEN 0u
 
+/**
+ * DOC: GuC Scheduling Policies KLVs
+ *
+ * `GuC KLV`_ keys available for use with UPDATE_SCHEDULING_POLICIES_KLV.
+ *
+ * _`GUC_KLV_SCHEDULING_POLICIES_RENDER_COMPUTE_YIELD` : 0x1001
+ *      Some platforms do not allow concurrent execution of RCS and CCS
+ *      workloads from different address spaces. By default, the GuC prioritizes
+ *      RCS submissions over CCS ones, which can lead to CCS workloads being
+ *      significantly (or completely) starved of execution time. This KLV allows
+ *      the driver to specify a quantum (in ms) and a ratio (percentage value
+ *      between 0 and 100), and the GuC will prioritize the CCS for that
+ *      percentage of each quantum. For example, specifying 100ms and 30% will
+ *      make the GuC prioritize the CCS for 30ms of every 100ms.
+ *      Note that this does not necessarly mean that RCS and CCS engines will
+ *      only be active for their percentage of the quantum, as the restriction
+ *      only kicks in if both classes are fully busy with non-compatible address
+ *      spaces; i.e., if one engine is idle or running the same address space,
+ *      a pending job on the other engine will still be submitted to the HW no
+ *      matter what the ratio is
+ */
+#define GUC_KLV_SCHEDULING_POLICIES_RENDER_COMPUTE_YIELD_KEY	0x1001
+#define GUC_KLV_SCHEDULING_POLICIES_RENDER_COMPUTE_YIELD_LEN	2u
+
 /**
  * DOC: GuC VGT Policy KLVs
  *
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 34505a6d93ed..3e0ad7e5b5df 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -98,7 +98,7 @@ void xe_gt_sanitize(struct xe_gt *gt)
 	 * FIXME: if xe_uc_sanitize is called here, on TGL driver will not
 	 * reload
 	 */
-	gt->uc.guc.submission_state.enabled = false;
+	xe_guc_submit_disable(&gt->uc.guc);
 }
 
 static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index b3a6408a5760..ab1cc11a208c 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -888,9 +888,7 @@ int xe_guc_post_load_init(struct xe_guc *guc)
 			return ret;
 	}
 
-	guc->submission_state.enabled = true;
-
-	return 0;
+	return xe_guc_submit_enable(guc);
 }
 
 int xe_guc_reset(struct xe_guc *guc)
@@ -1602,7 +1600,7 @@ void xe_guc_sanitize(struct xe_guc *guc)
 {
 	xe_uc_fw_sanitize(&guc->fw);
 	xe_guc_ct_disable(&guc->ct);
-	guc->submission_state.enabled = false;
+	xe_guc_submit_disable(guc);
 }
 
 int xe_guc_reset_prepare(struct xe_guc *guc)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index bfc061da8f93..e377ba3a39b3 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -32,6 +32,7 @@
 #include "xe_guc_ct.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_guc_id_mgr.h"
+#include "xe_guc_klv_helpers.h"
 #include "xe_guc_submit_types.h"
 #include "xe_hw_engine.h"
 #include "xe_hw_fence.h"
@@ -316,6 +317,71 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 	return drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
 }
 
+/*
+ * Given that we want to guarantee enough RCS throughput to avoid missing
+ * frames, we set the yield policy to 20% of each 80ms interval.
+ */
+#define RC_YIELD_DURATION	80	/* in ms */
+#define RC_YIELD_RATIO		20	/* in percent */
+static u32 *emit_render_compute_yield_klv(u32 *emit)
+{
+	*emit++ = PREP_GUC_KLV_TAG(SCHEDULING_POLICIES_RENDER_COMPUTE_YIELD);
+	*emit++ = RC_YIELD_DURATION;
+	*emit++ = RC_YIELD_RATIO;
+
+	return emit;
+}
+
+#define SCHEDULING_POLICY_MAX_DWORDS 16
+static int guc_init_global_schedule_policy(struct xe_guc *guc)
+{
+	u32 data[SCHEDULING_POLICY_MAX_DWORDS];
+	u32 *emit = data;
+	u32 count = 0;
+	int ret;
+
+	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 1, 0))
+		return 0;
+
+	*emit++ = XE_GUC_ACTION_UPDATE_SCHEDULING_POLICIES_KLV;
+
+	if (CCS_MASK(guc_to_gt(guc)))
+		emit = emit_render_compute_yield_klv(emit);
+
+	count = emit - data;
+	if (count > 1) {
+		xe_assert(guc_to_xe(guc), count <= SCHEDULING_POLICY_MAX_DWORDS);
+
+		ret = xe_guc_ct_send_block(&guc->ct, data, count);
+		if (ret < 0) {
+			xe_gt_err(guc_to_gt(guc),
+				  "failed to enable GuC sheduling policies: %pe\n",
+				  ERR_PTR(ret));
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+int xe_guc_submit_enable(struct xe_guc *guc)
+{
+	int ret;
+
+	ret = guc_init_global_schedule_policy(guc);
+	if (ret)
+		return ret;
+
+	guc->submission_state.enabled = true;
+
+	return 0;
+}
+
+void xe_guc_submit_disable(struct xe_guc *guc)
+{
+	guc->submission_state.enabled = false;
+}
+
 static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa_count)
 {
 	int i;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 6b5df5d0956b..e20ccafdfab5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -13,6 +13,8 @@ struct xe_exec_queue;
 struct xe_guc;
 
 int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
+int xe_guc_submit_enable(struct xe_guc *guc);
+void xe_guc_submit_disable(struct xe_guc *guc);
 
 int xe_guc_submit_reset_prepare(struct xe_guc *guc);
 void xe_guc_submit_reset_wait(struct xe_guc *guc);
-- 
2.43.0

