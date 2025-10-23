Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5343CCCD1BC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 15:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1883910E919;
	Thu, 23 Oct 2025 15:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DhKJWUx1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A5210E918
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 15:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761232740; x=1792768740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gxigzECge5SUojd/isomC0CH/pchv5ZMhFyMEeS3Eao=;
 b=DhKJWUx1SUgdF+haCSaHzrsfw0UOQhR6unm6k4aPxLGVeffWIqtZh2E8
 08PHVjfSIbeLR1iaMCm6Ieus+SlvWKSiai9hA3ThMzKvfNRxVwQCCWvcf
 Y+V4ygSa1IvjKxz6CcK6Nm0fPrgTUQtSAcYIV4pSQt13tRcwtWolTAqhw
 4vzOnkETMkky/sN+KsOnW9+3hCeTq29Zd0IyQKRfAqKFo4fUkhVnQRVjL
 sMN8cue32WXi7TQzog4tZZxCxEncUOu+0+XzlAO7daLii7/vnvWVjvpbi
 H8Vx+6F2+3HsOqytV0UBpDA32rmlKx9fbK/TdLnbhO++ljkf1bEhWx7aM g==;
X-CSE-ConnectionGUID: Y9WQI0AATKyXyWz1v11t8w==
X-CSE-MsgGUID: 4SIMQaiSQa+Zd1Dirn30XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88871905"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="88871905"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 08:19:00 -0700
X-CSE-ConnectionGUID: cxx2LpGCQ5Ss3Ve0/caT7Q==
X-CSE-MsgGUID: RW/rjYcOTTqbY9KFG+hFSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="184077368"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa007.jf.intel.com with ESMTP; 23 Oct 2025 08:18:58 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v2 1/2] drm/xe/vf: Introduce RESFIX start marker support
Date: Thu, 23 Oct 2025 21:06:11 +0530
Message-ID: <20251023153616.3790-5-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023153616.3790-4-satyanarayana.k.v.p@intel.com>
References: <20251023153616.3790-4-satyanarayana.k.v.p@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Post migration, a marker is sent to the GUC prior to the start of resource
fixups to indicate start of resource fixups. The same marker is sent along
with RESFIX_DONE notification so that GUC can avoid submitting jobs to HW
in case of double migration.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

---
V1 -> V2:
- Squashed "Enable RESFIX start marker only on supported GUC
versions" commit into a single commit. (Matt B)
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 38 ++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 87 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  5 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c              | 42 ++++++++-
 drivers/gpu/drm/xe/xe_sriov_vf_types.h        |  5 ++
 5 files changed, 169 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index 0b28659d94e9..b9141497bfd5 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -656,4 +656,42 @@
 #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
 #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_0_USED	GUC_HXG_RESPONSE_MSG_0_DATA0
 
+/**
+ * DOC: VF2GUC_NOTIFY_RESFIX_START
+ *
+ * This action is used by VF to notify the GuC that the VF KMD will be starting
+ * post-migration recovery steps.
+ *
+ * This message must be sent as `MMIO HXG Message`_.
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | DATA0 = MBZ                                                  |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START` = 0x550F   |
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
+#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START          0x550Fu
+
+#define VF2GUC_NOTIFY_RESFIX_START_REQUEST_MSG_LEN     GUC_HXG_REQUEST_MSG_MIN_LEN
+#define VF2GUC_NOTIFY_RESFIX_START_REQUEST_MSG_0_MBZ   GUC_HXG_REQUEST_MSG_0_DATA0
+
+#define VF2GUC_NOTIFY_RESFIX_START_RESPONSE_MSG_LEN    GUC_HXG_RESPONSE_MSG_MIN_LEN
+#define VF2GUC_NOTIFY_RESFIX_START_RESPONSE_MSG_0_MBZ  GUC_HXG_RESPONSE_MSG_0_DATA0
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index d0b102ab6ce8..8c1448d6c81d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -299,12 +299,55 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
 		*found = gt->sriov.vf.guc_version;
 }
 
-static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
+static int guc_action_vf_notify_resfix_start(struct xe_guc *guc, u16 marker)
 {
 	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
 		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
 		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
-		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
+		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
+			   GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START) |
+		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_DATA0, marker),
+	};
+	int ret;
+
+	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
+
+	return ret > 0 ? -EPROTO : ret;
+}
+
+/**
+ * vf_notify_resfix_start - Notify GuC about start of resource fixups.
+ * @gt: the &xe_gt struct instance linked to target GuC
+ * @marker: marker to identify the migration.
+ *
+ * Returns: 0 if the operation completed successfully, or a negative error
+ * code otherwise.
+ */
+static int vf_notify_resfix_start(struct xe_gt *gt, u16 marker)
+{
+	struct xe_guc *guc = &gt->uc.guc;
+	int err;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	err = guc_action_vf_notify_resfix_start(guc, marker);
+	if (unlikely(err))
+		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup start (%pe)\n",
+				ERR_PTR(err));
+	else
+		xe_gt_sriov_dbg_verbose(gt, "sent GuC resource fixup start\n");
+
+	return err;
+}
+
+static int guc_action_vf_notify_resfix_done(struct xe_guc *guc, u16 marker)
+{
+	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
+		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
+		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
+		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
+			   GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE) |
+		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_DATA0, marker),
 	};
 	int ret;
 
@@ -316,18 +359,19 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
 /**
  * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
  * @gt: the &xe_gt struct instance linked to target GuC
+ * @marker: marker to identify the migration.
  *
  * Returns: 0 if the operation completed successfully, or a negative error
  * code otherwise.
  */
-static int vf_notify_resfix_done(struct xe_gt *gt)
+static int vf_notify_resfix_done(struct xe_gt *gt, u16 marker)
 {
 	struct xe_guc *guc = &gt->uc.guc;
 	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
-	err = guc_action_vf_notify_resfix_done(guc);
+	err = guc_action_vf_notify_resfix_done(guc, marker);
 	if (unlikely(err))
 		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
 				ERR_PTR(err));
@@ -1183,7 +1227,7 @@ static void vf_post_migration_abort(struct xe_gt *gt)
 	xe_guc_submit_pause_abort(&gt->uc.guc);
 }
 
-static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
+static int vf_post_migration_notify_resfix_done(struct xe_gt *gt, u16 marker)
 {
 	bool skip_resfix = false;
 
@@ -1206,12 +1250,27 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
 	 */
 	xe_irq_resume(gt_to_xe(gt));
 
-	return vf_notify_resfix_done(gt);
+	return vf_notify_resfix_done(gt, marker);
+}
+
+static bool vf_resfix_start_marker_supported(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	xe_gt_assert(gt, IS_SRIOV_VF(xe));
+	return xe->sriov.vf.migration.resfix_marker_enabled;
+}
+
+static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	return ++gt->sriov.vf.migration.resfix_marker;
 }
 
 static void vf_post_migration_recovery(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	u16 marker = 0;
 	int err;
 	bool retry;
 
@@ -1227,13 +1286,27 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 		goto fail;
 	}
 
+	/*
+	 * Increment the startup marker again if it overflows, since GUC
+	 * requires a non-zero marker to be set.
+	 */
+	if (vf_resfix_start_marker_supported(gt)) {
+		marker = vf_post_migration_resfix_start_marker(gt);
+		if (!marker)
+			marker = vf_post_migration_resfix_start_marker(gt);
+	}
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
index 420b0e6089de..ccd850313328 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -60,6 +60,11 @@ struct xe_gt_sriov_vf_migration {
 	bool recovery_inprogress;
 	/** @ggtt_need_fixes: VF GGTT needs fixes */
 	bool ggtt_need_fixes;
+	/**
+	 * @resfix_marker: Marker sent to Guc prior to starting the
+	 * post‑migration.
+	 */
+	u16 resfix_marker;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 39c829daa97c..10d6e43fffce 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -55,7 +55,21 @@
  * When the VF driver is ready to continue operation on the newly connected
  * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` which causes it to
  * enter the long awaited `VF_RUNNING` state, and therefore start handling
- * CTB messages and scheduling workloads from the VF::
+ * CTB messages and scheduling workloads from the VF.
+ *
+ * In scenarios involving double migration, the VF KMD may encounter situations
+ * where it is instructed to re-migrate before having the opportunity to send
+ * RESFIX_DONE for the initial migration. This can occur when the fix-up for the
+ * prior migration is still underway, but the VF KMD is migrated again.
+ * Consequently, this may lead to the possibility of sending two migration
+ * notifications (i.e., pending fix-up for the first migration and a second
+ * notification for the new migration). Upon receiving the first RES_FIX
+ * notification, the GuC will resume VF submission on the GPU, potentially
+ * resulting in undefined behavior, such as system hangs or crashes.
+ *
+ * To avoid these hangs, a new VF2GUC action `VF2GUC_NOTIFY_RESFIX_START` is
+ * sent along with marker and when GUC receives the same marker with
+ * `VF2GUC_NOTIFY_RESFIX_DONE`action, it starts scheduling work loads from VF::
  *
  *      PF                             GuC                              VF
  *     [ ]                              |                               |
@@ -102,6 +116,11 @@
  *      |                              [ ]        new VF provisioning  [ ]
  *      |                              [ ]---------------------------> [ ]
  *      |                               |                              [ ]
+ *      |                               |   VF2GUC_NOTIFY_RESFIX_START [ ]
+ *      |                              [ ] <---------------------------[ ]
+ *      |                              [ ]                             [ ]
+ *      |                              [ ]                     success [ ]
+ *      |                              [ ]---------------------------> [ ]
  *      |                               |       VF driver applies post [ ]
  *      |                               |      migration fixups -------[ ]
  *      |                               |                       |      [ ]
@@ -169,6 +188,26 @@ static void vf_migration_init_early(struct xe_device *xe)
 
 }
 
+static void vf_resfix_start_marker_init_early(struct xe_device *xe)
+{
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct xe_uc_fw_version guc_version;
+
+	if (xe->sriov.vf.migration.disabled)
+		return;
+
+	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
+	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 24, 10)) {
+		xe_sriov_notice(xe,
+				"Resfix start marker requires GUC ABI >= 1.24.10, but only %u.%u.%u found",
+				guc_version.major, guc_version.minor, guc_version.patch);
+		return;
+	}
+
+	xe->sriov.vf.migration.resfix_marker_enabled = true;
+	xe_sriov_dbg(xe, "migrate: Resfix start marker support is enabled\n");
+}
+
 /**
  * xe_sriov_vf_init_early - Initialize SR-IOV VF specific data.
  * @xe: the &xe_device to initialize
@@ -176,6 +215,7 @@ static void vf_migration_init_early(struct xe_device *xe)
 void xe_sriov_vf_init_early(struct xe_device *xe)
 {
 	vf_migration_init_early(xe);
+	vf_resfix_start_marker_init_early(xe);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
index d5f72d667817..626c11a6dd1b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
@@ -38,6 +38,11 @@ struct xe_device_vf {
 		 * was turned off due to missing prerequisites
 		 */
 		bool disabled;
+		/**
+		 * @migration.resfix_marker_enabled: flag indicating if resfix marker
+		 * support was enabled or not due to missing prerequisites.
+		 */
+		bool resfix_marker_enabled;
 	} migration;
 
 	/** @ccs: VF CCS state data */
-- 
2.51.0

