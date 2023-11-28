Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4EDC07E97
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 15:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE3E10E576;
	Tue, 28 Nov 2023 15:15:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC50510E570
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 15:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701184526; x=1732720526;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=P5TuZ22z6tpuGL5ZqXegCtUUW2bWgy/sNfT0JgwO33Q=;
 b=LRON2Mc0KuXqT1p26iL4nYe2MG3GSh5MSqT7GYhotZAE3uicqZm4j6iH
 g81Rhc3v7oLQ23Y4Mk8YuTjjxFXesbhKeTwkbIDiYyl9iAUFkQPklulCB
 UdPMD2JC1wWXj48WJYRl/+zwHPDmFAgrZkTrbutFLUBXyB7N5lrniR/CP
 ELoXKLUQK+jSN7CiNbzztySjS6XIpO66BAvCbdtqDaAIWn8Il60joZgUO
 PuoOwproGoHuasS7kScYXb2C8AlPjTQu0VUQhk17rGR6Ke0aQZKDhXp/E
 c3cYm4Lz8WxGxd/kZNv1ltxzf+VML//1aO+BWU9lVJyhqlLkGVLgx9drR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="11637957"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="11637957"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:15:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="744937049"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="744937049"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.140.124])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:15:24 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 16:15:07 +0100
Message-Id: <20231128151507.1015-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231128151507.1015-1-michal.wajdeczko@intel.com>
References: <20231128151507.1015-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/5] drm/xe/kunit: Add test for LMTT operations
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

The LMTT variants are abstracted with xe_lmtt_ops. Make sure that
both 2L and ML ops implementations are correct.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_lmtt_test.c | 73 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lmtt.c            |  4 ++
 2 files changed, 77 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_lmtt_test.c

diff --git a/drivers/gpu/drm/xe/tests/xe_lmtt_test.c b/drivers/gpu/drm/xe/tests/xe_lmtt_test.c
new file mode 100644
index 000000000000..1f1557c45ae1
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_lmtt_test.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+static const struct lmtt_ops_param {
+	const char *desc;
+	const struct xe_lmtt_ops *ops;
+} lmtt_ops_params[] = {
+	{ "2-level", &lmtt_2l_ops, },
+	{ "multi-level", &lmtt_ml_ops, },
+};
+
+static void lmtt_ops_param_get_desc(const struct lmtt_ops_param *p, char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", p->desc);
+}
+
+KUNIT_ARRAY_PARAM(lmtt_ops, lmtt_ops_params, lmtt_ops_param_get_desc);
+
+static void test_ops(struct kunit *test)
+{
+	const struct lmtt_ops_param *p = test->param_value;
+	const struct xe_lmtt_ops *ops = p->ops;
+	unsigned int n;
+
+	KUNIT_ASSERT_NOT_NULL(test, ops->lmtt_root_pd_level);
+	KUNIT_ASSERT_NOT_NULL(test, ops->lmtt_pte_num);
+	KUNIT_ASSERT_NOT_NULL(test, ops->lmtt_pte_size);
+	KUNIT_ASSERT_NOT_NULL(test, ops->lmtt_pte_shift);
+	KUNIT_ASSERT_NOT_NULL(test, ops->lmtt_pte_index);
+	KUNIT_ASSERT_NOT_NULL(test, ops->lmtt_pte_encode);
+
+	KUNIT_EXPECT_NE(test, ops->lmtt_root_pd_level(), 0);
+
+	for (n = 0; n <= ops->lmtt_root_pd_level(); n++) {
+		KUNIT_EXPECT_NE_MSG(test, ops->lmtt_pte_num(n), 0,
+				    "level=%u", n);
+		KUNIT_EXPECT_NE_MSG(test, ops->lmtt_pte_size(n), 0,
+				    "level=%u", n);
+		KUNIT_EXPECT_NE_MSG(test, ops->lmtt_pte_encode(0, n), LMTT_PTE_INVALID,
+				    "level=%u", n);
+	}
+
+	for (n = 0; n < ops->lmtt_root_pd_level(); n++) {
+		u64 addr = BIT_ULL(ops->lmtt_pte_shift(n));
+
+		KUNIT_EXPECT_NE_MSG(test, ops->lmtt_pte_shift(n), 0,
+				    "level=%u", n);
+		KUNIT_EXPECT_EQ_MSG(test, ops->lmtt_pte_index(addr - 1, n), 0,
+				    "addr=%#llx level=%u", addr, n);
+		KUNIT_EXPECT_EQ_MSG(test, ops->lmtt_pte_index(addr + 1, n), 1,
+				    "addr=%#llx level=%u", addr, n);
+		KUNIT_EXPECT_EQ_MSG(test, ops->lmtt_pte_index(addr * 2 - 1, n), 1,
+				    "addr=%#llx level=%u", addr, n);
+		KUNIT_EXPECT_EQ_MSG(test, ops->lmtt_pte_index(addr * 2, n), 2,
+				    "addr=%#llx level=%u", addr, n);
+	}
+}
+
+static struct kunit_case lmtt_test_cases[] = {
+	KUNIT_CASE_PARAM(test_ops, lmtt_ops_gen_params),
+	{}
+};
+
+static struct kunit_suite lmtt_suite = {
+	.name = "lmtt",
+	.test_cases = lmtt_test_cases,
+};
+
+kunit_test_suites(&lmtt_suite);
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index d5ada31ae633..0d7c5514e092 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -500,3 +500,7 @@ u64 xe_lmtt_estimate_pt_size(struct xe_lmtt *lmtt, u64 size)
 
 	return pt_size;
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_lmtt_test.c"
+#endif
-- 
2.25.1

