Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550EDC54E58
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 22:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009C710F027;
	Wed, 13 Mar 2024 22:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KghFubQM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1739910F027
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 22:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710367889; x=1741903889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lVNBFprRiZWICIC68kJXNKjm043H5/naumDENrAY+Y8=;
 b=KghFubQM3DXwB57kdnOtKXk80ZfVX4iegXWPYNLsvl4B0trorwH6dbWm
 S+MU7Bsz20aeZ8y1qjzQZ+Nvk3mhf4teIqHq+bscuCc0ZXolPc9lv2NsW
 BWGE4xy17AGUaqdCWd5WaQtIC8ZUc/wh8iNxxsPChJBK8G9qaensnk5g4
 S67Qbwqhg0lUlzBjqIrYG8mJaqIyinnMWFX/MhArmx9G3ySuzeFkZtq+V
 FNzHrTqWWq9RF+Y0bItEGe5Xf38pccemdj2VAp8EyJ940jqV9IAs9wRgs
 H+5caPxnGQ1wpjtdVVmxWncWnE2khTif/Hh5UGTu2efSe10H9UoF4GxfA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5027638"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5027638"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 15:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="11964313"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.141.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 15:11:28 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 3/4] drm/xe/kunit: Add basic tests for GuC context ID
 Manager
Date: Wed, 13 Mar 2024 23:11:11 +0100
Message-Id: <20240313221112.1089-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240313221112.1089-1-michal.wajdeczko@intel.com>
References: <20240313221112.1089-1-michal.wajdeczko@intel.com>
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

Before we switch-over submission code to use new GuC context ID
Manager, lets add some kunit tests to make sure that ID manager
works as expected.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: rebased
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 136 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            |   4 +
 2 files changed, 140 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
new file mode 100644
index 000000000000..ee30a1939eb0
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_device.h"
+#include "xe_kunit_helpers.h"
+
+static int guc_id_mgr_test_init(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm;
+
+	xe_kunit_helper_xe_device_test_init(test);
+	idm = &xe_device_get_gt(test->priv, 0)->uc.guc.submission_state.idm;
+
+	mutex_init(idm_mutex(idm));
+	test->priv = idm;
+	return 0;
+}
+
+static void bad_init(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+
+	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, 0));
+	KUNIT_EXPECT_EQ(test, -ERANGE, xe_guc_id_mgr_init(idm, GUC_ID_MAX + 1));
+}
+
+static void no_init(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+
+	mutex_lock(idm_mutex(idm));
+	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_locked(idm, 0));
+	mutex_unlock(idm_mutex(idm));
+
+	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve(idm, 1, 1));
+}
+
+static void init_fini(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
+	KUNIT_EXPECT_NOT_NULL(test, idm->bitmap);
+	KUNIT_EXPECT_EQ(test, idm->total, GUC_ID_MAX);
+	__fini_idm(NULL, idm);
+	KUNIT_EXPECT_NULL(test, idm->bitmap);
+	KUNIT_EXPECT_EQ(test, idm->total, 0);
+}
+
+static void check_used(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int n;
+
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
+
+	mutex_lock(idm_mutex(idm));
+
+	for (n = 0; n < idm->total; n++) {
+		kunit_info(test, "n=%u", n);
+		KUNIT_EXPECT_EQ(test, idm->used, n);
+		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 0), 0);
+		KUNIT_EXPECT_EQ(test, idm->used, n + 1);
+	}
+	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
+	idm_release_chunk_locked(idm, 0, idm->used);
+	KUNIT_EXPECT_EQ(test, idm->used, 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_quota(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int n;
+
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
+
+	mutex_lock(idm_mutex(idm));
+
+	for (n = 0; n < idm->total - 1; n++) {
+		kunit_info(test, "n=%u", n);
+		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total), -EDQUOT);
+		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total - n), -EDQUOT);
+		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, idm->total - n, 1), -EDQUOT);
+		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 1), 0);
+	}
+	KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
+	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
+	idm_release_chunk_locked(idm, 0, idm->total);
+	KUNIT_EXPECT_EQ(test, idm->used, 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_all(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int n;
+
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
+
+	mutex_lock(idm_mutex(idm));
+
+	for (n = 0; n < idm->total; n++)
+		KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
+	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
+	for (n = 0; n < idm->total; n++)
+		idm_release_chunk_locked(idm, n, 1);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static struct kunit_case guc_id_mgr_test_cases[] = {
+	KUNIT_CASE(bad_init),
+	KUNIT_CASE(no_init),
+	KUNIT_CASE(init_fini),
+	KUNIT_CASE(check_used),
+	KUNIT_CASE(check_quota),
+	KUNIT_CASE_SLOW(check_all),
+	{}
+};
+
+static struct kunit_suite guc_id_mgr_suite = {
+	.name = "guc_idm",
+	.test_cases = guc_id_mgr_test_cases,
+
+	.init = guc_id_mgr_test_init,
+	.exit = NULL,
+};
+
+kunit_test_suites(&guc_id_mgr_suite);
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index bee49bc908bb..0fb7c6b78c31 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -273,3 +273,7 @@ void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int i
 	idm_print_locked(idm, p, indent);
 	mutex_unlock(idm_mutex(idm));
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_guc_id_mgr_test.c"
+#endif
-- 
2.43.0

