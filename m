Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3859AD116F8
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 09:32:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE4910E358;
	Mon,  1 Dec 2025 09:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TnXHPKxq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94B510E358
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 09:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764581566; x=1796117566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NCeYo4vQRFn+glZOCZWbNPmWyONYt08W9/VxHfCEGZg=;
 b=TnXHPKxqz8yywA5m8BoJ+hGD46fpgWvhh1cvxYxkULrn4YZM/g5qtCaX
 7lvGULG7XOzLla940XRKIV1J23wDR9FzYW+Tiw1i8g3q0N0hIpgV65oa0
 HtufPjO6Sj3/WAL7Hf+/BgGjJRO2TX6kpiCj/qYXoErF6BIFa6Y0MsQw4
 MvqunXVW02LDGwWtFhgmRZdW9ETHReHmstEpek2kOtUypAsFLTERfarX8
 Z+VrlQQziy7yd9Ls94gLMmSpS6LulH4RE5Ueu+RQFjHMxXluhO/A/8qVT
 3N87zouCe14x6UX5bTEvWRy0Rf4CzF+RUruks1rCnc3JlwDUvyF8/iL9f A==;
X-CSE-ConnectionGUID: E7VPUfE5Q2+2fAkHdYOL1Q==
X-CSE-MsgGUID: nzarP5GjQWqmeh5ZlUieag==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="89164393"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="89164393"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:32:46 -0800
X-CSE-ConnectionGUID: baAK507RSXCjgz5J2gytxg==
X-CSE-MsgGUID: ZhiF+bxhQ8aSQmSxXGl1Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="198379559"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa005.fm.intel.com with ESMTP; 01 Dec 2025 01:32:44 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v8 2/4] drm/xe/vf: Introduce RESFIX start marker support
Date: Mon,  1 Dec 2025 15:20:14 +0530
Message-ID: <20251201095011.21453-8-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251201095011.21453-6-satyanarayana.k.v.p@intel.com>
References: <20251201095011.21453-6-satyanarayana.k.v.p@intel.com>
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
V7 -> V8:
- Fixed review comments (Michal W).
- xe_irq_resume() is moved to vf_post_migration_rearm().
- Renamed vf_post_migration_resfix_start_marker() to
vf_post_migration_next_resfix_marker().
- Created new wrapper vf_post_migration_resfix_start() for vf_resfix_start()
- Updated flow diagram as per review comments.

V6 -> V7:
- Fixed review comments (Michal W).
- Made resfix_start marker width to u8.
- Removed XE_GUC_RESPONSE_VF_MIGRATED handling in xe_guc_mmio_send_recv()
function and moved to seperate patch.

V5 -> V6:
- Fixed review comments (Michal W).
- Updated resfix_done and res_fix_start function names.
- Handled XE_GUC_RESPONSE_VF_MIGRATED error case received from GuC.
- Remove skip_resfix error when another migration is in queue.

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
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    |  67 +++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 112 ++++++++++++------
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |   5 +
 drivers/gpu/drm/xe/xe_sriov_vf.c              |  64 +++++++++-
 4 files changed, 197 insertions(+), 51 deletions(-)

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
index 97c29c55f885..5bf13e41de80 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -299,12 +299,13 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
 		*found = gt->sriov.vf.guc_version;
 }
 
-static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
+static int guc_action_vf_resfix_start(struct xe_guc *guc, u16 marker)
 {
 	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
 		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
 		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
-		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
+		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_START) |
+		FIELD_PREP(VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER, marker),
 	};
 	int ret;
 
@@ -313,28 +314,41 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
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
+static int vf_resfix_start(struct xe_gt *gt, u16 marker)
 {
 	struct xe_guc *guc = &gt->uc.guc;
-	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
-	err = guc_action_vf_notify_resfix_done(guc);
-	if (unlikely(err))
-		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
-				ERR_PTR(err));
-	else
-		xe_gt_sriov_dbg_verbose(gt, "sent GuC resource fixup done\n");
+	xe_gt_sriov_dbg_verbose(gt, "Sending resfix start marker %u\n", marker);
 
-	return err;
+	return guc_action_vf_resfix_start(guc, marker);
+}
+
+static int guc_action_vf_resfix_done(struct xe_guc *guc, u16 marker)
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
+static int vf_resfix_done(struct xe_gt *gt, u16 marker)
+{
+	struct xe_guc *guc = &gt->uc.guc;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	xe_gt_sriov_dbg_verbose(gt, "Sending resfix done marker %u\n", marker);
+
+	return guc_action_vf_resfix_done(guc, marker);
 }
 
 static int guc_action_query_single_klv(struct xe_guc *guc, u32 key,
@@ -1162,6 +1176,13 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 
 static void vf_post_migration_rearm(struct xe_gt *gt)
 {
+	/*
+	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
+	 * must be working at this point, since the recovery did started,
+	 * but the rest was not enabled using the procedure from spec.
+	 */
+	xe_irq_resume(gt_to_xe(gt));
+
 	xe_guc_ct_restart(&gt->uc.guc.ct);
 	xe_guc_submit_unpause_prepare_vf(&gt->uc.guc);
 }
@@ -1183,37 +1204,40 @@ static void vf_post_migration_abort(struct xe_gt *gt)
 	xe_guc_submit_pause_abort(&gt->uc.guc);
 }
 
-static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
+static int vf_post_migration_resfix_done(struct xe_gt *gt, u16 marker)
 {
-	bool skip_resfix = false;
-
 	spin_lock_irq(&gt->sriov.vf.migration.lock);
-	if (gt->sriov.vf.migration.recovery_queued) {
-		skip_resfix = true;
-		xe_gt_sriov_dbg(gt, "another recovery imminent, resfix skipped\n");
-	} else {
+	if (gt->sriov.vf.migration.recovery_queued)
+		xe_gt_sriov_dbg(gt, "another recovery imminent\n");
+	else
 		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
-	}
 	spin_unlock_irq(&gt->sriov.vf.migration.lock);
 
-	if (skip_resfix)
-		return -EAGAIN;
+	return vf_resfix_done(gt, marker);
+}
 
-	/*
-	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
-	 * must be working at this point, since the recovery did started,
-	 * but the rest was not enabled using the procedure from spec.
-	 */
-	xe_irq_resume(gt_to_xe(gt));
+static int vf_post_migration_resfix_start(struct xe_gt *gt, u16 marker)
+{
+	return vf_resfix_start(gt, marker);
+}
+
+static u16 vf_post_migration_next_resfix_marker(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
-	return vf_notify_resfix_done(gt);
+	BUILD_BUG_ON(1 + ((typeof(gt->sriov.vf.migration.resfix_marker))~0) >
+		     FIELD_MAX(VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER));
+
+	/* add 1 to avoid zero-marker */
+	return 1 + gt->sriov.vf.migration.resfix_marker++;
 }
 
 static void vf_post_migration_recovery(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int err;
+	u16 marker;
 	bool retry;
+	int err;
 
 	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
 
@@ -1227,15 +1251,27 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 		goto fail;
 	}
 
+	marker = vf_post_migration_next_resfix_marker(gt);
+
+	err = vf_post_migration_resfix_start(gt, marker);
+	if (unlikely(err)) {
+		xe_gt_sriov_err(gt, "Recovery failed at GuC RESFIX_START step (%pe)\n",
+				ERR_PTR(err));
+		goto fail;
+	}
+
 	err = vf_post_migration_fixups(gt);
 	if (err)
 		goto fail;
 
 	vf_post_migration_rearm(gt);
 
-	err = vf_post_migration_notify_resfix_done(gt);
-	if (err && err != -EAGAIN)
+	err = vf_post_migration_resfix_done(gt, marker);
+	if (err) {
+		xe_gt_sriov_err(gt, "Recovery failed at GuC RESFIX_DONE step (%pe)\n",
+				ERR_PTR(err));
 		goto fail;
+	}
 
 	vf_post_migration_kickstart(gt);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 420b0e6089de..db2f8b3ed3e9 100644
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
+	u8 resfix_marker;
 	/** @recovery_teardown: VF post migration recovery is being torn down */
 	bool recovery_teardown;
 	/** @recovery_queued: VF post migration recovery in queued */
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index d56b8cfea50b..db1a48e707b8 100644
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
@@ -102,12 +104,17 @@
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
@@ -118,6 +125,57 @@
  *      |                              [ ]---------------------------> [ ]
  *      |                               |                               |
  *      |                               |                               |
+ *
+ * Handling of VF double migration flow is shown below::
+ *
+ *     GuC1                                             VF
+ *      |                                               |
+ *      |                                              [ ]<--- start fixups
+ *      |                  VF2GUC_RESFIX_START(marker) [ ]
+ *     [ ] <-------------------------------------------[ ]
+ *     [ ]                                             [ ]
+ *     [ ]---\                                         [ ]
+ *     [ ]   store marker                              [ ]
+ *     [ ]<--/                                         [ ]
+ *     [ ]                                             [ ]
+ *     [ ] success                                     [ ]
+ *     [ ] ------------------------------------------> [ ]
+ *      |                                              [ ]
+ *      |                                              [ ]---\
+ *      |                                              [ ]   do fixups
+ *      |                                              [ ]<--/
+ *      |                                              [ ]
+ *      :                                               :
+ *      -------------- VF paused / saved ----------------
+ *      |
+ *
+ *     GuC2
+ *      |
+ *      :                                               :
+ *      ----------------- VF restored  ------------------
+ *      |
+ *     [ ]
+ *     [ ]---\
+ *     [ ]   reset marker
+ *     [ ]<--/
+ *     [ ]
+ *      ----------------- VF resumed  ------------------
+ *      |                                              [ ]
+ *      |                                              [ ]
+ *      |                   VF2GUC_RESFIX_DONE(marker) [ ]
+ *     [ ] <-------------------------------------------[ ]
+ *     [ ]                                             [ ]
+ *     [ ]---\                                         [ ]
+ *     [ ]   check marker                              [ ]
+ *     [ ]   (mismatch)                                [ ]
+ *     [ ]<--/                                         [ ]
+ *     [ ]                                             [ ]
+ *     [ ] RESPONSE_VF_MIGRATED                        [ ]
+ *     [ ] ------------------------------------------> [ ]
+ *      |                                              [ ]---\
+ *      |                                              [ ]  reschedule fixups
+ *      |                                              [ ]<--/
+ *      |                                               |
  */
 
 /**
-- 
2.51.0

