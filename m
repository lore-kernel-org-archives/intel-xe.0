Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BDDCAC5B0
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 20:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96DF10E9B2;
	Thu, 25 Sep 2025 20:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ehEu9mkD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC0A10E9B2
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 20:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758832869; x=1790368869;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f+VTQvKsZVLXPhGBml2l/uzxfsx/78MZZfJmD4mDEUQ=;
 b=ehEu9mkDER3s2TY4VHajvuxj7bVysqEUu/1zw918i4+P+rM96gcD1J2C
 AlKcX4H5yu0wYwnazs5/+zA3iyGqx5Zse4gaHd79uKgjdGRJjfrzYLZXE
 95DmPHQmR+t3svqLAZCYX1ioKAtQjgogxofQ0HiKtIeOobrNug7EYk1R5
 /L3RhB1+nJ4qYtK8jRfORMMkM4MkoNjf3Mp2o0WgLsYCrFW4WcDx1lh2F
 /Xq34OYEsS5XARvqdgQc6chzsIthKj4eIhtJUBbYeJN10xp80hOC2cgR2
 NhmYerUyVrtwKP//kunov+kRzDWH3dHpkkL71GcNcaEOcarr3FpJ/HVCt w==;
X-CSE-ConnectionGUID: pebnVjoDSfS4YXkJFA1xHw==
X-CSE-MsgGUID: 7bXFrdT/Qbu7+lyCr6SznQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="48730384"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="48730384"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 13:41:08 -0700
X-CSE-ConnectionGUID: MSi/+HliT8Suma852s8bcQ==
X-CSE-MsgGUID: FklBWK4vTjuNOUazxmovcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="177010236"
Received: from dut4086lnl.fm.intel.com ([10.105.10.69])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 13:41:07 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
	saurabhg.gupta@intel.com,
	alex.zuo@intel.com
Subject: [PATCH] drm/xe: Guard against NULL return for xe_device_get_gt
Date: Thu, 25 Sep 2025 20:41:07 +0000
Message-ID: <20250925204106.67332-2-jonathan.cavitt@intel.com>
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

Static analysis reveals the following issue:
xe_device_get_gt is theoretically able to return NULL in some cases, but
several use cases don't check the return value before performing a
dereference, resulting in a NULL pointer dereference.

Add some guards against this.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c   |  5 +++-
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c |  7 +++++-
 drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c    |  1 +
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  7 +++++-
 drivers/gpu/drm/xe/tests/xe_guc_relay_test.c  | 24 +++++++++++++++----
 drivers/gpu/drm/xe/xe_guc.c                   |  6 ++++-
 drivers/gpu/drm/xe/xe_hw_engine.c             |  3 +--
 drivers/gpu/drm/xe/xe_pmu.c                   |  6 +++++
 drivers/gpu/drm/xe/xe_sriov_vf.c              | 10 +++++++-
 9 files changed, 58 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
index d266882adc0e..6582aa4404aa 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -57,13 +57,16 @@ static int guc_buf_test_init(struct kunit *test)
 		.subplatform = XE_SUBPLATFORM_NONE,
 	};
 	struct xe_ggtt *ggtt;
+	struct xe_gt *gt;
 	struct xe_guc *guc;
 
 	test->priv = &fake;
 	xe_kunit_helper_xe_device_test_init(test);
 
 	ggtt = xe_device_get_root_tile(test->priv)->mem.ggtt;
-	guc = &xe_device_get_gt(test->priv, 0)->uc.guc;
+	gt = xe_device_get_gt(test->priv, 0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
+	guc = &gt->uc.guc;
 
 	KUNIT_ASSERT_EQ(test, 0,
 			xe_ggtt_init_kunit(ggtt, DUT_GGTT_START,
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
index a87a7b4b040a..69c1d467e2ee 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
@@ -11,9 +11,14 @@
 static int guc_dbm_test_init(struct kunit *test)
 {
 	struct xe_guc_db_mgr *dbm;
+	struct xe_gt *gt;
 
 	xe_kunit_helper_xe_device_test_init(test);
-	dbm = &xe_device_get_gt(test->priv, 0)->uc.guc.dbm;
+
+	gt = xe_device_get_gt(test->priv, 0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
+
+	dbm = &gt->uc.guc.dbm;
 
 	mutex_init(dbm_mutex(dbm));
 	test->priv = dbm;
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
index 3b213fcae916..4675d92366d7 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
@@ -356,6 +356,7 @@ static void g2g_distribute(struct kunit *test, struct xe_device *xe, struct xe_b
 	int i;
 
 	root_gt = xe_device_get_gt(xe, 0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, root_gt);
 	root_gt->uc.guc.g2g.bo = bo;
 	root_gt->uc.guc.g2g.owned = true;
 	kunit_info(test, "[%d.%d] Assigned 0x%p\n", gt_to_tile(root_gt)->id, root_gt->info.id, bo);
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index ee30a1939eb0..44b72a6aba85 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -11,9 +11,14 @@
 static int guc_id_mgr_test_init(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm;
+	struct xe_gt *gt;
 
 	xe_kunit_helper_xe_device_test_init(test);
-	idm = &xe_device_get_gt(test->priv, 0)->uc.guc.submission_state.idm;
+
+	gt = xe_device_get_gt(test->priv, 0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
+
+	idm = &gt->uc.guc.submission_state.idm;
 
 	mutex_init(idm_mutex(idm));
 	test->priv = idm;
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
index 13701451b923..82973f7a843c 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
@@ -31,6 +31,7 @@ static int relay_test_init(struct kunit *test)
 	};
 	struct xe_guc_relay *relay;
 	struct xe_device *xe;
+	struct xe_gt *gt;
 
 	test->priv = &fake;
 	xe_kunit_helper_xe_device_test_init(test);
@@ -38,7 +39,10 @@ static int relay_test_init(struct kunit *test)
 	xe = test->priv;
 	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
 
-	relay = &xe_device_get_gt(xe, 0)->uc.guc.relay;
+	gt = xe_device_get_gt(xe, 0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
+
+	relay = &gt->uc.guc.relay;
 	kunit_activate_static_stub(test, relay_get_totalvfs,
 				   replacement_relay_get_totalvfs);
 
@@ -476,30 +480,42 @@ static struct kunit_suite vf_relay_suite = {
 static void xe_drops_guc2pf_if_not_ready(struct kunit *test)
 {
 	struct xe_device *xe = test->priv;
-	struct xe_guc_relay *relay = &xe_device_get_gt(xe, 0)->uc.guc.relay;
+	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_guc_relay *relay;
 	const u32 *msg = test_guc2pf;
 	u32 len = GUC2PF_RELAY_FROM_VF_EVENT_MSG_MIN_LEN + GUC_RELAY_MSG_MIN_LEN;
 
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
+	relay = &gt->uc.guc.relay;
+
 	KUNIT_ASSERT_EQ(test, -ENODEV, xe_guc_relay_process_guc2pf(relay, msg, len));
 }
 
 static void xe_drops_guc2vf_if_not_ready(struct kunit *test)
 {
 	struct xe_device *xe = test->priv;
-	struct xe_guc_relay *relay = &xe_device_get_gt(xe, 0)->uc.guc.relay;
+	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_guc_relay *relay;
 	const u32 *msg = test_guc2vf;
 	u32 len = GUC2VF_RELAY_FROM_PF_EVENT_MSG_MIN_LEN + GUC_RELAY_MSG_MIN_LEN;
 
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
+	relay = &gt->uc.guc.relay;
+
 	KUNIT_ASSERT_EQ(test, -ENODEV, xe_guc_relay_process_guc2vf(relay, msg, len));
 }
 
 static void xe_rejects_send_if_not_ready(struct kunit *test)
 {
 	struct xe_device *xe = test->priv;
-	struct xe_guc_relay *relay = &xe_device_get_gt(xe, 0)->uc.guc.relay;
+	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_guc_relay *relay;
 	u32 msg[GUC_RELAY_MSG_MIN_LEN];
 	u32 len = ARRAY_SIZE(msg);
 
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
+	relay = &gt->uc.guc.relay;
+
 	KUNIT_ASSERT_EQ(test, -ENODEV, xe_guc_relay_send_to_pf(relay, msg, len, NULL, 0));
 	KUNIT_ASSERT_EQ(test, -ENODEV, relay_send_to(relay, TEST_VFID, msg, len, NULL, 0));
 }
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d5adbbb013ec..1a3c2187af20 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -467,9 +467,13 @@ static int guc_g2g_alloc(struct xe_guc *guc)
 
 	if (gt->info.id != 0) {
 		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
-		struct xe_guc *root_guc = &root_gt->uc.guc;
+		struct xe_guc *root_guc;
 		struct xe_bo *bo;
 
+		if (!root_gt)
+			return -ENODEV;
+
+		root_guc = &root_gt->uc.guc;
 		bo = xe_bo_get(root_guc->g2g.bo);
 		if (!bo)
 			return -ENODEV;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 1cf623b4a5bc..f4b9857d6195 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1071,7 +1071,6 @@ xe_hw_engine_lookup(struct xe_device *xe,
 	idx = array_index_nospec(eci.engine_class,
 				 ARRAY_SIZE(user_to_xe_engine_class));
 
-	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
-			       user_to_xe_engine_class[idx],
+	return xe_gt_hw_engine(gt, user_to_xe_engine_class[idx],
 			       eci.engine_instance, true);
 }
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index cab51d826345..0fd12decfd89 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -142,6 +142,9 @@ static bool event_gt_forcewake(struct perf_event *event)
 
 	gt = xe_device_get_gt(xe, config_to_gt_id(config));
 
+	if (!gt)
+		return false;
+
 	fw_ref = kzalloc(sizeof(*fw_ref), GFP_KERNEL);
 	if (!fw_ref)
 		return false;
@@ -219,6 +222,7 @@ static void xe_pmu_event_destroy(struct perf_event *event)
 
 	if (fw_ref) {
 		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
+		xe_assert(xe, gt);
 		xe_force_wake_put(gt_to_fw(gt), *fw_ref);
 		kfree(fw_ref);
 		event->pmu_private = NULL;
@@ -499,6 +503,8 @@ static void set_supported_events(struct xe_pmu *pmu)
 	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
 	struct xe_gt *gt = xe_device_get_gt(xe, 0);
 
+	xe_assert(xe, gt);
+
 	if (!xe->info.skip_guc_pc) {
 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index cdd9f8e78b2a..0879fd687169 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -177,8 +177,11 @@ static void vf_migration_init_early(struct xe_device *xe)
 
 	if (!IS_DGFX(xe)) {
 		struct xe_uc_fw_version guc_version;
+		struct xe_gt *gt = xe_device_get_gt(xe, 0);
 
-		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
+		xe_assert(xe, gt);
+
+		xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
 		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
 			return vf_disable_migration(xe,
 						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
@@ -361,6 +364,11 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	while (id = vf_get_next_migrated_gt_id(xe), id >= 0) {
 		struct xe_gt *gt = xe_device_get_gt(xe, id);
 
+		if (!gt) {
+			err = -ENODEV;
+			goto fail;
+		}
+
 		err = gt_vf_post_migration_fixups(gt);
 		if (err)
 			goto fail;
-- 
2.43.0

