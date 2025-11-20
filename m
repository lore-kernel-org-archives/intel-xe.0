Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCFFCF8864
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 14:34:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537AD10E2A9;
	Thu, 20 Nov 2025 14:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fcAMmM5/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0B710E2A7
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 14:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763649276; x=1795185276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Et3xrWcnZ/kO7IS5ZsU7UKGKnRao8+OqVAigtzruZE=;
 b=fcAMmM5/6wsReHLA3FN8/MDV5X2Vlq0i5tSvnyfHYYiG3AdgUghVo14B
 mJD4ozesPCPncXUnI4VOTuPOLyIKF+B9QK+RpXNMTDSY75WJN/053+YnT
 DC73L7d3aZVoh3SSriOVR1BDqGMRaPciOAAjy2hC9yHm03qNU4hnFu3S/
 vCM8piNB2XM9VRh/+NLdjMpU6h9BHnWsi6MyLKLbd/j/mMS6i4d/T6jGl
 KxYKukEev4l41TtR3q8cB/BHy44TbjnsLF02xXYTmXQQ6x33lUnC+WAvQ
 0liTnKDs/yGQkKNTKi/0CYq6zrUZ5Zold3rxHPmGGiys+Y83jflBQ+5IY g==;
X-CSE-ConnectionGUID: 8PBOzLINT82XBxhqI68NRA==
X-CSE-MsgGUID: m74q5C1URBSP8+wp2Ri9KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65418627"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65418627"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:34:36 -0800
X-CSE-ConnectionGUID: I//3YJvgTBKZAnD8BGzdVA==
X-CSE-MsgGUID: B/51ePRxR/GG8SQkjVjHiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="228689545"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa001.jf.intel.com with ESMTP; 20 Nov 2025 06:34:35 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v5 2/3] drm/xe/vf: Introduce RESFIX start marker support
Date: Thu, 20 Nov 2025 20:22:00 +0530
Message-ID: <20251120145157.6995-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120145157.6995-5-satyanarayana.k.v.p@intel.com>
References: <20251120145157.6995-5-satyanarayana.k.v.p@intel.com>
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

In scenarios involving double migration, the VF KMD may encounter
situations where it is instructed to re-migrate before having the
opportunity to send RESFIX_DONE for the initial migration. This can occur
when the fix-up for the prior migration is still underway, but the VF KMD
is migrated again.

Consequently, this may lead to the possibility of sending two migration
notifications (i.e., pending fix-up for the first migration and a second
notification for the new migration). Upon receiving the first RES_FIX
notification, the GuC will resume VF submission on the GPU, potentially
resulting in undefined behavior, such as system hangs or crashes.

To avoid this, post migration, a marker is sent to the GUC prior to the
start of resource fixups to indicate start of resource fixups. The same
marker is sent along with RESFIX_DONE notification so that GUC can avoid
submitting jobs to HW in case of double migration.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

---
V4 -> V5:
- Fixed review comments (Michal W).
- Fixed minor debug log levels and documentation part.
- Moved complete marker logic to vf_post_migration_resfix_start_marker()

V3 -> V4:
- Updated RESFIX_DONE action name and documenation part. (Michal W)
- Enable resfxi_start marked by default as sav/restore is gated on
Guc version 70.54.0

V2 -> V3:
- Fixed review comments (Michal W).
- Updated commit message.
- Fixed CI.BAT issues.
- Added helper function to assert on unsupported GUC versions.
- Updated RESFIX_DONE action name and documenation part.

V1 -> V2:
- Squashed "Enable RESFIX start marker only on supported GUC
versions" commit into a single commit. (Matt B)
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 67 ++++++++++++---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 85 +++++++++++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  5 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c              | 21 +++--
 4 files changed, 144 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index 0b28659d94e9..d9f21202e1a9 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -502,13 +502,17 @@
 #define VF2GUC_VF_RESET_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
 
 /**
- * DOC: VF2GUC_NOTIFY_RESFIX_DONE
+ * DOC: VF2GUC_RESFIX_DONE
  *
- * This action is used by VF to notify the GuC that the VF KMD has completed
- * post-migration recovery steps.
+ * This action is used by VF to inform the GuC that the VF KMD has completed
+ * post-migration recovery steps. From GuC VF compatibility 1.27.0 onwards, it
+ * shall only be sent after posting RESFIX_START and that both @MARKER fields
+ * must match.
  *
  * This message must be sent as `MMIO HXG Message`_.
  *
+ * Updated since GuC VF compatibility 1.27.0.
+ *
  *  +---+-------+--------------------------------------------------------------+
  *  |   | Bits  | Description                                                  |
  *  +===+=======+==============================================================+
@@ -516,9 +520,11 @@
  *  |   +-------+--------------------------------------------------------------+
  *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
  *  |   +-------+--------------------------------------------------------------+
- *  |   | 27:16 | DATA0 = MBZ                                                  |
+ *  |   | 27:16 | DATA0 = MARKER = MBZ (only prior 1.27.0)                     |
  *  |   +-------+--------------------------------------------------------------+
- *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE` = 0x5508    |
+ *  |   | 27:16 | DATA0 = MARKER - can't be zero (1.27.0+)                     |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_DONE` = 0x5508           |
  *  +---+-------+--------------------------------------------------------------+
  *
  *  +---+-------+--------------------------------------------------------------+
@@ -531,13 +537,13 @@
  *  |   |  27:0 | DATA0 = MBZ                                                  |
  *  +---+-------+--------------------------------------------------------------+
  */
-#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE		0x5508u
+#define GUC_ACTION_VF2GUC_RESFIX_DONE			0x5508u
 
-#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_LEN	GUC_HXG_REQUEST_MSG_MIN_LEN
-#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
+#define VF2GUC_RESFIX_DONE_REQUEST_MSG_LEN		GUC_HXG_REQUEST_MSG_MIN_LEN
+#define VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER		GUC_HXG_REQUEST_MSG_0_DATA0
 
-#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
-#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
+#define VF2GUC_RESFIX_DONE_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
+#define VF2GUC_RESFIX_DONE_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
 
 /**
  * DOC: VF2GUC_QUERY_SINGLE_KLV
@@ -656,4 +662,45 @@
 #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
 #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_0_USED	GUC_HXG_RESPONSE_MSG_0_DATA0
 
+/**
+ * DOC: VF2GUC_RESFIX_START
+ *
+ * This action is used by VF to inform the GuC that the VF KMD will be starting
+ * post-migration recovery fixups. The @MARKER sent with this action must match
+ * with the MARKER posted in the VF2GUC_RESFIX_DONE message.
+ *
+ * This message must be sent as `MMIO HXG Message`_.
+ *
+ * Available since GuC VF compatibility 1.27.0.
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | DATA0 = MARKER - can't be zero                               |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_START` = 0x550F          |
+ *  +---+-------+--------------------------------------------------------------+
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  27:0 | DATA0 = MBZ                                                  |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+#define GUC_ACTION_VF2GUC_RESFIX_START			0x550Fu
+
+#define VF2GUC_RESFIX_START_REQUEST_MSG_LEN		GUC_HXG_REQUEST_MSG_MIN_LEN
+#define VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER	GUC_HXG_REQUEST_MSG_0_DATA0
+
+#define VF2GUC_RESFIX_START_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
+#define VF2GUC_RESFIX_START_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 4c73a077d314..1cd3d8204c15 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -299,12 +299,13 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
 		*found = gt->sriov.vf.guc_version;
 }
 
-static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
+static int guc_action_vf_notify_resfix_start(struct xe_guc *guc, u16 marker)
 {
 	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
 		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
 		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
-		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
+		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_START) |
+		FIELD_PREP(VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER, marker),
 	};
 	int ret;
 
@@ -313,30 +314,54 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
 	return ret > 0 ? -EPROTO : ret;
 }
 
-/**
- * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
- * @gt: the &xe_gt struct instance linked to target GuC
- *
- * Returns: 0 if the operation completed successfully, or a negative error
- * code otherwise.
- */
-static int vf_notify_resfix_done(struct xe_gt *gt)
+static int vf_notify_resfix_start(struct xe_gt *gt, u16 marker)
 {
 	struct xe_guc *guc = &gt->uc.guc;
 	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
-	err = guc_action_vf_notify_resfix_done(guc);
+	xe_gt_sriov_dbg_verbose(gt, "Sending resfix start marker %u\n", marker);
+
+	err = guc_action_vf_notify_resfix_start(guc, marker);
 	if (unlikely(err))
-		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
+		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup start (%pe)\n",
 				ERR_PTR(err));
-	else
-		xe_gt_sriov_dbg_verbose(gt, "sent GuC resource fixup done\n");
 
 	return err;
 }
 
+static int guc_action_vf_notify_resfix_done(struct xe_guc *guc, u16 marker)
+{
+	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
+		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
+		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
+		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_DONE) |
+		FIELD_PREP(VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER, marker),
+	};
+	int ret;
+
+	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
+
+	return ret > 0 ? -EPROTO : ret;
+}
+
+static int vf_notify_resfix_done(struct xe_gt *gt, u16 marker)
+{
+	struct xe_guc *guc = &gt->uc.guc;
+	int err;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	xe_gt_sriov_dbg_verbose(gt, "Sending resfix done marker %u\n", marker);
+
+	err = guc_action_vf_notify_resfix_done(guc, marker);
+	if (unlikely(err))
+		xe_gt_sriov_err(gt, "Recovery failed at GuC RESFIX_DONE step (%pe)\n",
+				ERR_PTR(err));
+	return err;
+}
+
 static int guc_action_query_single_klv(struct xe_guc *guc, u32 key,
 				       u32 *value, u32 value_len)
 {
@@ -1183,7 +1208,7 @@ static void vf_post_migration_abort(struct xe_gt *gt)
 	xe_guc_submit_pause_abort(&gt->uc.guc);
 }
 
-static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
+static int vf_post_migration_notify_resfix_done(struct xe_gt *gt, u16 marker)
 {
 	bool skip_resfix = false;
 
@@ -1206,14 +1231,32 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
 	 */
 	xe_irq_resume(gt_to_xe(gt));
 
-	return vf_notify_resfix_done(gt);
+	return vf_notify_resfix_done(gt, marker);
+}
+
+/*
+ * Increment the startup marker again if it overflows, since GUC
+ * requires a non-zero marker to be set.
+ */
+static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
+{
+	u16 marker;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	marker = ++gt->sriov.vf.migration.resfix_marker;
+	if (unlikely(!marker))
+		marker = ++gt->sriov.vf.migration.resfix_marker;
+
+	return marker;
 }
 
 static void vf_post_migration_recovery(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int err;
+	u16 marker;
 	bool retry;
+	int err;
 
 	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
 
@@ -1227,13 +1270,19 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 		goto fail;
 	}
 
+	marker = vf_post_migration_resfix_start_marker(gt);
+
+	err = vf_notify_resfix_start(gt, marker);
+	if (err)
+		goto fail;
+
 	err = vf_post_migration_fixups(gt);
 	if (err)
 		goto fail;
 
 	vf_post_migration_rearm(gt);
 
-	err = vf_post_migration_notify_resfix_done(gt);
+	err = vf_post_migration_notify_resfix_done(gt, marker);
 	if (err && err != -EAGAIN)
 		goto fail;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 420b0e6089de..66c0062a42c6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -52,6 +52,11 @@ struct xe_gt_sriov_vf_migration {
 	wait_queue_head_t wq;
 	/** @scratch: Scratch memory for VF recovery */
 	void *scratch;
+	/**
+	 * @resfix_marker: Marker sent on start and on end of post-migration
+	 * steps.
+	 */
+	u16 resfix_marker;
 	/** @recovery_teardown: VF post migration recovery is being torn down */
 	bool recovery_teardown;
 	/** @recovery_queued: VF post migration recovery in queued */
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 13cacdbbf2d2..2994b233e0cf 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -49,11 +49,13 @@
  *
  * As soon as Virtual GPU of the VM starts, the VF driver within receives
  * the MIGRATED interrupt and schedules post-migration recovery worker.
- * That worker queries GuC for new provisioning (using MMIO communication),
+ * That worker sends `VF2GUC_RESFIX_START` action along with non-zero
+ * marker, queries GuC for new provisioning (using MMIO communication),
  * and applies fixups to any non-virtualized resources used by the VF.
  *
  * When the VF driver is ready to continue operation on the newly connected
- * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` which causes it to
+ * hardware, it sends `VF2GUC_RESFIX_DONE` action along with the same
+ * marker which was sent with `VF2GUC_RESFIX_START` which causes it to
  * enter the long awaited `VF_RUNNING` state, and therefore start handling
  * CTB messages and scheduling workloads from the VF::
  *
@@ -102,19 +104,26 @@
  *      |                              [ ]        new VF provisioning  [ ]
  *      |                              [ ]---------------------------> [ ]
  *      |                               |                              [ ]
+ *      |                               |   VF2GUC_RESFIX_START        [ ]
+ *      |                              [ ] <---------------------------[ ]
+ *      |                              [ ]                             [ ]
+ *      |                              [ ]                     success [ ]
+ *      |                              [ ]---------------------------> [ ]
  *      |                               |       VF driver applies post [ ]
  *      |                               |      migration fixups -------[ ]
  *      |                               |                       |      [ ]
  *      |                               |                       -----> [ ]
  *      |                               |                              [ ]
- *      |                               |    VF2GUC_NOTIFY_RESFIX_DONE [ ]
+ *      |                               |    VF2GUC_RESFIX_DONE        [ ]
  *      |                              [ ] <---------------------------[ ]
  *      |                              [ ]                             [ ]
  *      |                              [ ]  GuC sets new VF state to   [ ]
- *      |                              [ ]------- VF_RUNNING           [ ]
- *      |                              [ ]      |                      [ ]
+ *      |                              [ ]------- VF_RUNNING on marker [ ]
+ *      |                              [ ]      |  match               [ ]
  *      |                              [ ] <-----                      [ ]
- *      |                              [ ]                     success [ ]
+ *      |                              [ ]   success (on marker match) [ ]
+ *      |                              [ ]---------------------------> [ ]
+ *      |                              [ ]  error (on marker mismatch) [ ]
  *      |                              [ ]---------------------------> [ ]
  *      |                               |                               |
  *      |                               |                               |
-- 
2.51.0

