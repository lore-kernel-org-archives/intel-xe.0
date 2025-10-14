Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DBDCCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 16:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEF210E669;
	Tue, 14 Oct 2025 16:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rnfwney3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A73210E668
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 16:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760460482; x=1791996482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CstrvePtTrWqYwFy5XcjYcv8RObFqpPIAXU2F3um9Go=;
 b=Rnfwney3OpPZpyMpNvC7qDVTk4EkwewK003qo838mmiFTtygqDMrgRx6
 Fo5K5dDjnzTzNTmi3cYRZH5sCyweBCGK/himLyEY9udtX49RJhNkX48wC
 pEVR0M74UHvU4DGSThJYjMjbwicfxydAJCg4TnzhPwsDniWK3N1Q695RE
 E5Pe3y0stxtpsGW7nu2OQoVMFhpO3ziWythTbjDc+98rC3l+Qa0HkoCzr
 TUL2E1mgizIs9fuJ7INX9ZorBy7gLbf2OARZfuXds8g1R0rBhV9J1ObRF
 H7Xf7lMsYFaLQxVad6vlobAbpTwsJgZp1QRmu06zpJnzRx9R/SCxg+o28 A==;
X-CSE-ConnectionGUID: nLwCv3rmQv+3boWZZONyGw==
X-CSE-MsgGUID: 9WmalprUSJyJ9qrkfMT13Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="80063043"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="80063043"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:48:01 -0700
X-CSE-ConnectionGUID: nHmR62kRQregnhhEqfvF/w==
X-CSE-MsgGUID: GVdBam6ST/C1oAcF9geJ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="186184681"
Received: from dut4443lnl.fm.intel.com ([10.105.8.76])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:48:01 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 rodrigo.vivi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v3 1/7] drm/xe: s/xe_device_get_gt/xe_device_lookup_gt
Date: Tue, 14 Oct 2025 16:48:00 +0000
Message-ID: <20251014164758.125598-10-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014164758.125598-9-jonathan.cavitt@intel.com>
References: <20251014164758.125598-9-jonathan.cavitt@intel.com>
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

Replace the function name xe_device_get_gt with xe_device_lookup_gt to
better illustrate it's capacity to return NULL in some cases.

Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c   |  2 +-
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c |  2 +-
 drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c    |  2 +-
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  2 +-
 drivers/gpu/drm/xe/tests/xe_guc_relay_test.c  |  8 ++++----
 drivers/gpu/drm/xe/xe_device.h                |  4 ++--
 drivers/gpu/drm/xe/xe_eu_stall.c              |  2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            |  2 +-
 drivers/gpu/drm/xe/xe_guc.c                   |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |  4 ++--
 drivers/gpu/drm/xe/xe_pmu.c                   | 10 +++++-----
 drivers/gpu/drm/xe/xe_query.c                 |  2 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c              |  2 +-
 13 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
index d266882adc0e..592dfce21add 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -63,7 +63,7 @@ static int guc_buf_test_init(struct kunit *test)
 	xe_kunit_helper_xe_device_test_init(test);
 
 	ggtt = xe_device_get_root_tile(test->priv)->mem.ggtt;
-	guc = &xe_device_get_gt(test->priv, 0)->uc.guc;
+	guc = &xe_device_lookup_gt(test->priv, 0)->uc.guc;
 
 	KUNIT_ASSERT_EQ(test, 0,
 			xe_ggtt_init_kunit(ggtt, DUT_GGTT_START,
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
index a87a7b4b040a..5afdf7887098 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
@@ -13,7 +13,7 @@ static int guc_dbm_test_init(struct kunit *test)
 	struct xe_guc_db_mgr *dbm;
 
 	xe_kunit_helper_xe_device_test_init(test);
-	dbm = &xe_device_get_gt(test->priv, 0)->uc.guc.dbm;
+	dbm = &xe_device_lookup_gt(test->priv, 0)->uc.guc.dbm;
 
 	mutex_init(dbm_mutex(dbm));
 	test->priv = dbm;
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
index 3b213fcae916..3e77f501e27f 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
@@ -355,7 +355,7 @@ static void g2g_distribute(struct kunit *test, struct xe_device *xe, struct xe_b
 	struct xe_gt *root_gt, *gt;
 	int i;
 
-	root_gt = xe_device_get_gt(xe, 0);
+	root_gt = xe_device_lookup_gt(xe, 0);
 	root_gt->uc.guc.g2g.bo = bo;
 	root_gt->uc.guc.g2g.owned = true;
 	kunit_info(test, "[%d.%d] Assigned 0x%p\n", gt_to_tile(root_gt)->id, root_gt->info.id, bo);
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index ee30a1939eb0..8b29db38d394 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -13,7 +13,7 @@ static int guc_id_mgr_test_init(struct kunit *test)
 	struct xe_guc_id_mgr *idm;
 
 	xe_kunit_helper_xe_device_test_init(test);
-	idm = &xe_device_get_gt(test->priv, 0)->uc.guc.submission_state.idm;
+	idm = &xe_device_lookup_gt(test->priv, 0)->uc.guc.submission_state.idm;
 
 	mutex_init(idm_mutex(idm));
 	test->priv = idm;
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
index 13701451b923..a891b1e0644e 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
@@ -38,7 +38,7 @@ static int relay_test_init(struct kunit *test)
 	xe = test->priv;
 	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
 
-	relay = &xe_device_get_gt(xe, 0)->uc.guc.relay;
+	relay = &xe_device_lookup_gt(xe, 0)->uc.guc.relay;
 	kunit_activate_static_stub(test, relay_get_totalvfs,
 				   replacement_relay_get_totalvfs);
 
@@ -476,7 +476,7 @@ static struct kunit_suite vf_relay_suite = {
 static void xe_drops_guc2pf_if_not_ready(struct kunit *test)
 {
 	struct xe_device *xe = test->priv;
-	struct xe_guc_relay *relay = &xe_device_get_gt(xe, 0)->uc.guc.relay;
+	struct xe_guc_relay *relay = &xe_device_lookup_gt(xe, 0)->uc.guc.relay;
 	const u32 *msg = test_guc2pf;
 	u32 len = GUC2PF_RELAY_FROM_VF_EVENT_MSG_MIN_LEN + GUC_RELAY_MSG_MIN_LEN;
 
@@ -486,7 +486,7 @@ static void xe_drops_guc2pf_if_not_ready(struct kunit *test)
 static void xe_drops_guc2vf_if_not_ready(struct kunit *test)
 {
 	struct xe_device *xe = test->priv;
-	struct xe_guc_relay *relay = &xe_device_get_gt(xe, 0)->uc.guc.relay;
+	struct xe_guc_relay *relay = &xe_device_lookup_gt(xe, 0)->uc.guc.relay;
 	const u32 *msg = test_guc2vf;
 	u32 len = GUC2VF_RELAY_FROM_PF_EVENT_MSG_MIN_LEN + GUC_RELAY_MSG_MIN_LEN;
 
@@ -496,7 +496,7 @@ static void xe_drops_guc2vf_if_not_ready(struct kunit *test)
 static void xe_rejects_send_if_not_ready(struct kunit *test)
 {
 	struct xe_device *xe = test->priv;
-	struct xe_guc_relay *relay = &xe_device_get_gt(xe, 0)->uc.guc.relay;
+	struct xe_guc_relay *relay = &xe_device_lookup_gt(xe, 0)->uc.guc.relay;
 	u32 msg[GUC_RELAY_MSG_MIN_LEN];
 	u32 len = ARRAY_SIZE(msg);
 
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 32cc6323b7f6..807db49a5306 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -67,7 +67,7 @@ static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
  */
 #define XE_MAX_GT_PER_TILE 2
 
-static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
+static inline struct xe_gt *xe_device_lookup_gt(struct xe_device *xe, u8 gt_id)
 {
 	struct xe_tile *tile;
 	struct xe_gt *gt;
@@ -129,7 +129,7 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
 
 #define for_each_gt(gt__, xe__, id__) \
 	for ((id__) = 0; (id__) < (xe__)->info.tile_count * (xe__)->info.max_gt_per_tile; (id__)++) \
-		for_each_if((gt__) = xe_device_get_gt((xe__), (id__)))
+		for_each_if((gt__) = xe_device_lookup_gt((xe__), (id__)))
 
 #define for_each_gt_on_tile(gt__, tile__, id__) \
 	for_each_gt((gt__), (tile__)->xe, (id__)) \
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index f5cfdf29fde3..912fea8d75c4 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -258,7 +258,7 @@ static int set_prop_eu_stall_wait_num_reports(struct xe_device *xe, u64 value,
 static int set_prop_eu_stall_gt_id(struct xe_device *xe, u64 value,
 				   struct eu_stall_open_properties *props)
 {
-	struct xe_gt *gt = xe_device_get_gt(xe, value);
+	struct xe_gt *gt = xe_device_lookup_gt(xe, value);
 
 	if (!gt) {
 		drm_dbg(&xe->drm, "Invalid GT ID %llu for EU stall sampling\n", value);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 90cbc95f8e2e..2fe23587e94c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -710,7 +710,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, err))
 		return -EFAULT;
 
-	if (XE_IOCTL_DBG(xe, !xe_device_get_gt(xe, eci[0].gt_id)))
+	if (XE_IOCTL_DBG(xe, !xe_device_lookup_gt(xe, eci[0].gt_id)))
 		return -EINVAL;
 
 	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d94490979adc..f0535fd82062 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -466,7 +466,7 @@ static int guc_g2g_alloc(struct xe_guc *guc)
 		return 0;
 
 	if (gt->info.id != 0) {
-		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
+		struct xe_gt *root_gt = xe_device_lookup_gt(xe, 0);
 		struct xe_guc *root_guc = &root_gt->uc.guc;
 		struct xe_bo *bo;
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index cba4375525c7..d00cd37c0c5c 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1061,7 +1061,7 @@ struct xe_hw_engine *
 xe_hw_engine_lookup(struct xe_device *xe,
 		    struct drm_xe_engine_class_instance eci)
 {
-	struct xe_gt *gt = xe_device_get_gt(xe, eci.gt_id);
+	struct xe_gt *gt = xe_device_lookup_gt(xe, eci.gt_id);
 	unsigned int idx;
 
 	if (eci.engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
@@ -1073,7 +1073,7 @@ xe_hw_engine_lookup(struct xe_device *xe,
 	idx = array_index_nospec(eci.engine_class,
 				 ARRAY_SIZE(user_to_xe_engine_class));
 
-	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
+	return xe_gt_hw_engine(xe_device_lookup_gt(xe, eci.gt_id),
 			       user_to_xe_engine_class[idx],
 			       eci.engine_instance, true);
 }
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index c63335eb69e5..6c428f1e9e23 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -93,7 +93,7 @@ static struct xe_gt *event_to_gt(struct perf_event *event)
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
 	u64 gt = config_to_gt_id(event->attr.config);
 
-	return xe_device_get_gt(xe, gt);
+	return xe_device_lookup_gt(xe, gt);
 }
 
 static struct xe_hw_engine *event_to_hwe(struct perf_event *event)
@@ -140,7 +140,7 @@ static bool event_gt_forcewake(struct perf_event *event)
 	if (!is_engine_event(config) && !is_gt_frequency_event(event))
 		return true;
 
-	gt = xe_device_get_gt(xe, config_to_gt_id(config));
+	gt = xe_device_lookup_gt(xe, config_to_gt_id(config));
 
 	fw_ref = kzalloc(sizeof(*fw_ref), GFP_KERNEL);
 	if (!fw_ref)
@@ -161,7 +161,7 @@ static bool event_supported(struct xe_pmu *pmu, unsigned int gt_id,
 			    unsigned int id)
 {
 	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
-	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
+	struct xe_gt *gt = xe_device_lookup_gt(xe, gt_id);
 
 	if (!gt)
 		return false;
@@ -177,7 +177,7 @@ static bool event_param_valid(struct perf_event *event)
 	u64 config = event->attr.config;
 	struct xe_gt *gt;
 
-	gt = xe_device_get_gt(xe, config_to_gt_id(config));
+	gt = xe_device_lookup_gt(xe, config_to_gt_id(config));
 	if (!gt)
 		return false;
 
@@ -218,7 +218,7 @@ static void xe_pmu_event_destroy(struct perf_event *event)
 	unsigned int *fw_ref = event->pmu_private;
 
 	if (fw_ref) {
-		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
+		gt = xe_device_lookup_gt(xe, config_to_gt_id(event->attr.config));
 		xe_force_wake_put(gt_to_fw(gt), *fw_ref);
 		kfree(fw_ref);
 		event->pmu_private = NULL;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 1c0915e2cc16..7e1d6bd869b0 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -146,7 +146,7 @@ query_engine_cycles(struct xe_device *xe,
 	if (eci->gt_id >= xe->info.max_gt_per_tile)
 		return -EINVAL;
 
-	gt = xe_device_get_gt(xe, eci->gt_id);
+	gt = xe_device_lookup_gt(xe, eci->gt_id);
 	if (!gt)
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 911d5720917b..189b307901a3 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -166,7 +166,7 @@ static void vf_migration_init_early(struct xe_device *xe)
 	if (!IS_DGFX(xe)) {
 		struct xe_uc_fw_version guc_version;
 
-		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
+		xe_gt_sriov_vf_guc_versions(xe_device_lookup_gt(xe, 0), NULL, &guc_version);
 		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
 			return vf_disable_migration(xe,
 						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
-- 
2.43.0

