Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2C4CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 16:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B95710E675;
	Tue, 14 Oct 2025 16:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nHbnAupm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E2110E668
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 16:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760460482; x=1791996482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Su/uFafzl046Sw/1ApAgLiEIvsvXR2R84f24JmM9Iiw=;
 b=nHbnAupmn8s+agRTRIyMahYy4inN3JUzRLqAdGKY63NnTlYE/LNMnt+B
 nmGStUKUr/EzF2XuvRLSWV8gDNUvQJX2Zv4UDcIZKet5ZKrrC+X/U4Iid
 gFU8alWrhZuAj1eql28rI2FydygNhqN3whyuwIMK0qv+uPpUyr1MzGI5c
 fxhp29ki8T/o1cmhJ3aGH9r4MVtI9J2gbh545jw/3kr/i31Sij46P0pMC
 YkxBGzqEBZ+MyJrVWbHJmoqG2vXcEBcX1uM5jsgLOzClKqkWZWdiI5VnH
 Jo2nzb3sTLEItrE0AqGG3u0yM13ESsaHEvTCR8Vu/bHyDuVXKcJzkoeL/ w==;
X-CSE-ConnectionGUID: RBfzmzJEScazx9pGQf+XMQ==
X-CSE-MsgGUID: cCA4k4VhSzSpGhLEws6RhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="80063049"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="80063049"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:48:02 -0700
X-CSE-ConnectionGUID: uX/UAiOsTeihhuSsBRs7lw==
X-CSE-MsgGUID: UExB+1NATk+3BXCEpCR4PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="186184701"
Received: from dut4443lnl.fm.intel.com ([10.105.8.76])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:48:02 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 rodrigo.vivi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v3 7/7] drm/xe/tests: Use any available GT for testing
Date: Tue, 14 Oct 2025 16:48:06 +0000
Message-ID: <20251014164758.125598-16-jonathan.cavitt@intel.com>
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

The xe kunit test code expects GT0 to always be available as a part of
the test setup.  However, these tests are generally able to run the tests
using whatever GT is available, even if GT0 itself is unavailable.  Of
course, if GT0 is unavailable, then the system itself is likely in a
non-functional state, but this might change in the future.

Add a helper function that returns the first available GT, asserting that
at least one exists.  Then, use that helper to return the GT for use in
the kunit tests.

Note that since the helper function is only used for the kunit tests,
it's existence in xe_device.h is also predicated on the kunit tests
being enabled.  Additionally, the helper function is logically identical
to xe_device_lookup_gt(xe, 0) when that gt is available.

v2: Reword commit message (Michal)

v3: Add xe_device_get_any_gt helper function and use that instead
(jcavitt)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c   |  2 +-
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c |  2 +-
 drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c    |  2 +-
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  2 +-
 drivers/gpu/drm/xe/tests/xe_guc_relay_test.c  |  8 +++----
 drivers/gpu/drm/xe/xe_device.h                | 22 +++++++++++++++++++
 6 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
index 592dfce21add..656574e6cfb0 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -63,7 +63,7 @@ static int guc_buf_test_init(struct kunit *test)
 	xe_kunit_helper_xe_device_test_init(test);
 
 	ggtt = xe_device_get_root_tile(test->priv)->mem.ggtt;
-	guc = &xe_device_lookup_gt(test->priv, 0)->uc.guc;
+	guc = &xe_device_get_any_gt(test->priv)->uc.guc;
 
 	KUNIT_ASSERT_EQ(test, 0,
 			xe_ggtt_init_kunit(ggtt, DUT_GGTT_START,
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
index 5afdf7887098..e3330099e970 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
@@ -13,7 +13,7 @@ static int guc_dbm_test_init(struct kunit *test)
 	struct xe_guc_db_mgr *dbm;
 
 	xe_kunit_helper_xe_device_test_init(test);
-	dbm = &xe_device_lookup_gt(test->priv, 0)->uc.guc.dbm;
+	dbm = &xe_device_get_any_gt(test->priv)->uc.guc.dbm;
 
 	mutex_init(dbm_mutex(dbm));
 	test->priv = dbm;
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
index 3e77f501e27f..2a4429101c6d 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
@@ -355,7 +355,7 @@ static void g2g_distribute(struct kunit *test, struct xe_device *xe, struct xe_b
 	struct xe_gt *root_gt, *gt;
 	int i;
 
-	root_gt = xe_device_lookup_gt(xe, 0);
+	root_gt = xe_device_get_any_gt(xe);
 	root_gt->uc.guc.g2g.bo = bo;
 	root_gt->uc.guc.g2g.owned = true;
 	kunit_info(test, "[%d.%d] Assigned 0x%p\n", gt_to_tile(root_gt)->id, root_gt->info.id, bo);
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index 8b29db38d394..ee30a1939eb0 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -13,7 +13,7 @@ static int guc_id_mgr_test_init(struct kunit *test)
 	struct xe_guc_id_mgr *idm;
 
 	xe_kunit_helper_xe_device_test_init(test);
-	idm = &xe_device_lookup_gt(test->priv, 0)->uc.guc.submission_state.idm;
+	idm = &xe_device_get_any_gt(test->priv)->uc.guc.submission_state.idm;
 
 	mutex_init(idm_mutex(idm));
 	test->priv = idm;
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
index a891b1e0644e..8577a721cf42 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
@@ -38,7 +38,7 @@ static int relay_test_init(struct kunit *test)
 	xe = test->priv;
 	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
 
-	relay = &xe_device_lookup_gt(xe, 0)->uc.guc.relay;
+	relay = &xe_device_get_any_gt(xe)->uc.guc.relay;
 	kunit_activate_static_stub(test, relay_get_totalvfs,
 				   replacement_relay_get_totalvfs);
 
@@ -476,7 +476,7 @@ static struct kunit_suite vf_relay_suite = {
 static void xe_drops_guc2pf_if_not_ready(struct kunit *test)
 {
 	struct xe_device *xe = test->priv;
-	struct xe_guc_relay *relay = &xe_device_lookup_gt(xe, 0)->uc.guc.relay;
+	struct xe_guc_relay *relay = &xe_device_get_any_gt(xe)->uc.guc.relay;
 	const u32 *msg = test_guc2pf;
 	u32 len = GUC2PF_RELAY_FROM_VF_EVENT_MSG_MIN_LEN + GUC_RELAY_MSG_MIN_LEN;
 
@@ -486,7 +486,7 @@ static void xe_drops_guc2pf_if_not_ready(struct kunit *test)
 static void xe_drops_guc2vf_if_not_ready(struct kunit *test)
 {
 	struct xe_device *xe = test->priv;
-	struct xe_guc_relay *relay = &xe_device_lookup_gt(xe, 0)->uc.guc.relay;
+	struct xe_guc_relay *relay = &xe_device_get_any_gt(xe)->uc.guc.relay;
 	const u32 *msg = test_guc2vf;
 	u32 len = GUC2VF_RELAY_FROM_PF_EVENT_MSG_MIN_LEN + GUC_RELAY_MSG_MIN_LEN;
 
@@ -496,7 +496,7 @@ static void xe_drops_guc2vf_if_not_ready(struct kunit *test)
 static void xe_rejects_send_if_not_ready(struct kunit *test)
 {
 	struct xe_device *xe = test->priv;
-	struct xe_guc_relay *relay = &xe_device_lookup_gt(xe, 0)->uc.guc.relay;
+	struct xe_guc_relay *relay = &xe_device_get_any_gt(xe)->uc.guc.relay;
 	u32 msg[GUC_RELAY_MSG_MIN_LEN];
 	u32 len = ARRAY_SIZE(msg);
 
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index af9476879454..56fe0be86b37 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -150,6 +150,28 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
 	for_each_gt((gt__), (tile__)->xe, (id__)) \
 		for_each_if((gt__)->tile == (tile__))
 
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+/**
+ * xe_device_get_any_gt() - Returns any valid GT, asserting one exists
+ * @xe: The XE device to search
+ *
+ * Returns a pointer to the first available xe_gt struct.  If no such gt exists,
+ * then the system should not be functional at all, but just in case that changes,
+ * assert the returned GT is not NULL.
+ */
+static inline struct xe_gt *xe_device_get_any_gt(struct xe_device *xe)
+{
+	struct xe_gt *gt = NULL;
+	int i;
+
+	for_each_gt(gt, xe, i)
+		break;
+
+	xe_assert(xe, gt);
+	return gt;
+}
+#endif
+
 static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 {
 	return &gt->pm.fw;
-- 
2.43.0

