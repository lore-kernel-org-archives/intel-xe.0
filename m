Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D283C10F07
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 10:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0AA10E43B;
	Mon, 11 Dec 2023 10:17:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F15D10E445
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 10:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702289867; x=1733825867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jHvYvEph6UBS3z6Hf4ILomgceVhni2ASwzJurCspKXQ=;
 b=dd9cN1WfZvUnAMZgKWeStP/SIYOvFkRPj2CT7CKLzbcJ3+HhGuEQAf3s
 0ZgHXlw4b+SVJDyYFd0isUG9XSSf5fdyPggRkOXa4YhSPLQ/dnMMR+CZv
 m5zTBrT+KMCBba1OFE20lh9cmMO689KkvjbxIIumJ3IPhJ9El6lZmswCO
 dVsOGFj/PBcgoGm/00ZvytNwex4rVGgdgGKq4JBdvlsjebClSOG/xNYVc
 mObA7r5c+piiaZJp2uwGwiNfEUS3qPkrbIi3wro+Bnec/z5tksO/5NMdq
 tNN1p5nU8a68+hSKOo4BPdmi5LTulWRfcFa3Boyx+VasaHYKdCDn1Qwuz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="480816342"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="480816342"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 02:17:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="766321927"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="766321927"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.159.144])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 02:17:45 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 9/9] drm/xe/kunit: Add GuC Doorbells Manager tests
Date: Mon, 11 Dec 2023 11:17:19 +0100
Message-Id: <20231211101719.1659-10-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231211101719.1659-1-michal.wajdeczko@intel.com>
References: <20231211101719.1659-1-michal.wajdeczko@intel.com>
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
Cc: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add few tests to make sure that basic usage scenarios of the GuC
Doorbells Manager are implemented correctly.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c | 199 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_db_mgr.c            |   4 +
 2 files changed, 203 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
new file mode 100644
index 000000000000..fc468912db37
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_device.h"
+#include "xe_kunit_helpers.h"
+
+static int guc_dbm_test_init(struct kunit *test)
+{
+	struct xe_device *xe = xe_kunit_helper_alloc_xe_device(test);
+	struct xe_guc_db_mgr *dbm = &xe_device_get_gt(xe, 0)->uc.guc.dbm;
+
+	mutex_init(dbm_mutex(dbm));
+	test->priv = dbm;
+	return 0;
+}
+
+static void test_empty(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, 0), 0);
+	KUNIT_ASSERT_EQ(test, dbm->count, 0);
+
+	mutex_lock(dbm_mutex(dbm));
+	KUNIT_EXPECT_LT(test, xe_guc_db_mgr_reserve_id_locked(dbm), 0);
+	mutex_unlock(dbm_mutex(dbm));
+
+	KUNIT_EXPECT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
+}
+
+static void test_default(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
+	KUNIT_ASSERT_EQ(test, dbm->count, GUC_NUM_DOORBELLS);
+}
+
+static const unsigned int guc_dbm_params[] = {
+	GUC_NUM_DOORBELLS / 64,
+	GUC_NUM_DOORBELLS / 32,
+	GUC_NUM_DOORBELLS / 8,
+	GUC_NUM_DOORBELLS,
+};
+
+static void uint_param_get_desc(const unsigned int *p, char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%u", *p);
+}
+
+KUNIT_ARRAY_PARAM(guc_dbm, guc_dbm_params, uint_param_get_desc);
+
+static void test_size(struct kunit *test)
+{
+	const unsigned int *p = test->param_value;
+	struct xe_guc_db_mgr *dbm = test->priv;
+	unsigned int n;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, *p), 0);
+	KUNIT_ASSERT_EQ(test, dbm->count, *p);
+
+	mutex_lock(dbm_mutex(dbm));
+	for (n = 0; n < *p; n++) {
+		KUNIT_EXPECT_GE(test, id = xe_guc_db_mgr_reserve_id_locked(dbm), 0);
+		KUNIT_EXPECT_LT(test, id, dbm->count);
+	}
+	KUNIT_EXPECT_LT(test, xe_guc_db_mgr_reserve_id_locked(dbm), 0);
+	mutex_unlock(dbm_mutex(dbm));
+
+	mutex_lock(dbm_mutex(dbm));
+	for (n = 0; n < *p; n++)
+		xe_guc_db_mgr_release_id_locked(dbm, n);
+	mutex_unlock(dbm_mutex(dbm));
+}
+
+static void test_reuse(struct kunit *test)
+{
+	const unsigned int *p = test->param_value;
+	struct xe_guc_db_mgr *dbm = test->priv;
+	unsigned int n;
+
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, *p), 0);
+
+	mutex_lock(dbm_mutex(dbm));
+	for (n = 0; n < *p; n++)
+		KUNIT_EXPECT_GE(test, xe_guc_db_mgr_reserve_id_locked(dbm), 0);
+	KUNIT_EXPECT_LT(test, xe_guc_db_mgr_reserve_id_locked(dbm), 0);
+	mutex_unlock(dbm_mutex(dbm));
+
+	mutex_lock(dbm_mutex(dbm));
+	for (n = 0; n < *p; n++) {
+		xe_guc_db_mgr_release_id_locked(dbm, n);
+		KUNIT_EXPECT_EQ(test, xe_guc_db_mgr_reserve_id_locked(dbm), n);
+	}
+	KUNIT_EXPECT_LT(test, xe_guc_db_mgr_reserve_id_locked(dbm), 0);
+	mutex_unlock(dbm_mutex(dbm));
+
+	mutex_lock(dbm_mutex(dbm));
+	for (n = 0; n < *p; n++)
+		xe_guc_db_mgr_release_id_locked(dbm, n);
+	mutex_unlock(dbm_mutex(dbm));
+}
+
+static void test_range_overlap(struct kunit *test)
+{
+	const unsigned int *p = test->param_value;
+	struct xe_guc_db_mgr *dbm = test->priv;
+	int id1, id2, id3;
+	unsigned int n;
+
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
+	KUNIT_ASSERT_LE(test, *p, dbm->count);
+
+	KUNIT_ASSERT_GE(test, id1 = xe_guc_db_mgr_reserve_range(dbm, *p, 0), 0);
+	for (n = 0; n < dbm->count - *p; n++) {
+		KUNIT_ASSERT_GE(test, id2 = xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
+		KUNIT_ASSERT_NE(test, id2, id1);
+		KUNIT_ASSERT_NE_MSG(test, id2 < id1, id2 > id1 + *p - 1,
+				    "id1=%d id2=%d", id1, id2);
+	}
+	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
+	xe_guc_db_mgr_release_range(dbm, 0, dbm->count);
+
+	if (*p >= 1) {
+		KUNIT_ASSERT_GE(test, id1 = xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
+		KUNIT_ASSERT_GE(test, id2 = xe_guc_db_mgr_reserve_range(dbm, *p - 1, 0), 0);
+		KUNIT_ASSERT_NE(test, id2, id1);
+		KUNIT_ASSERT_NE_MSG(test, id1 < id2, id1 > id2 + *p - 2,
+				    "id1=%d id2=%d", id1, id2);
+		for (n = 0; n < dbm->count - *p; n++) {
+			KUNIT_ASSERT_GE(test, id3 = xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
+			KUNIT_ASSERT_NE(test, id3, id1);
+			KUNIT_ASSERT_NE(test, id3, id2);
+			KUNIT_ASSERT_NE_MSG(test, id3 < id2, id3 > id2 + *p - 2,
+					    "id3=%d id2=%d", id3, id2);
+		}
+		KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
+		xe_guc_db_mgr_release_range(dbm, 0, dbm->count);
+	}
+}
+
+static void test_range_compact(struct kunit *test)
+{
+	const unsigned int *p = test->param_value;
+	struct xe_guc_db_mgr *dbm = test->priv;
+	unsigned int n;
+
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
+	KUNIT_ASSERT_NE(test, *p, 0);
+	KUNIT_ASSERT_LE(test, *p, dbm->count);
+	if (dbm->count % *p)
+		kunit_skip(test, "must be divisible");
+
+	KUNIT_ASSERT_GE(test, xe_guc_db_mgr_reserve_range(dbm, *p, 0), 0);
+	for (n = 1; n < dbm->count / *p; n++)
+		KUNIT_ASSERT_GE(test, xe_guc_db_mgr_reserve_range(dbm, *p, 0), 0);
+	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
+	xe_guc_db_mgr_release_range(dbm, 0, dbm->count);
+}
+
+static void test_range_spare(struct kunit *test)
+{
+	const unsigned int *p = test->param_value;
+	struct xe_guc_db_mgr *dbm = test->priv;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
+	KUNIT_ASSERT_LE(test, *p, dbm->count);
+
+	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, *p, dbm->count), 0);
+	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, *p, dbm->count - *p + 1), 0);
+	KUNIT_ASSERT_EQ(test, id = xe_guc_db_mgr_reserve_range(dbm, *p, dbm->count - *p), 0);
+	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, dbm->count - *p), 0);
+	xe_guc_db_mgr_release_range(dbm, id, *p);
+}
+
+static struct kunit_case guc_dbm_test_cases[] = {
+	KUNIT_CASE(test_empty),
+	KUNIT_CASE(test_default),
+	KUNIT_CASE_PARAM(test_size, guc_dbm_gen_params),
+	KUNIT_CASE_PARAM(test_reuse, guc_dbm_gen_params),
+	KUNIT_CASE_PARAM(test_range_overlap, guc_dbm_gen_params),
+	KUNIT_CASE_PARAM(test_range_compact, guc_dbm_gen_params),
+	KUNIT_CASE_PARAM(test_range_spare, guc_dbm_gen_params),
+	{}
+};
+
+static struct kunit_suite guc_dbm_suite = {
+	.name = "guc_dbm",
+	.test_cases = guc_dbm_test_cases,
+	.init = guc_dbm_test_init,
+};
+
+kunit_test_suites(&guc_dbm_suite);
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.c b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
index 15816f90e960..c1c04575d82d 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
@@ -255,3 +255,7 @@ void xe_guc_db_mgr_print(struct xe_guc_db_mgr *dbm,
 
 	mutex_unlock(dbm_mutex(dbm));
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_guc_db_mgr_test.c"
+#endif
-- 
2.25.1

