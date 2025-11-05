Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C36CCF9F8
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 18:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2236110E2F5;
	Wed,  5 Nov 2025 18:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2vcLhvS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A74310E2F5
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 18:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762367592; x=1793903592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S3K9B4ixORgLa0PVxjyqx2G3KCFQSQXpQqRNx6/BcRs=;
 b=U2vcLhvS7aqAYFWH7bssCgsnfEGW6GkpvzLge1cLcGg+JdZYrBrcwHJ4
 WjJQOWWRO+FXJELIVMwQOPI/pnBxrTF/U1+fQKqUP9TZkah08AlFGsYXG
 2S5BhD15uLyFGvpaXe0xm8NIQbsdl5EfSZuEB+iGkCuQMdIegMaMs72eP
 enZxpGQKtktnkg3ibs4MwjoxI11PmJY1VECqrppfEqmmjQRIZtuEb7mDb
 kEd1tBdoV+bxXxTCrnOgjVm6LmkPFk8o4D8jkOcNf963goAUlSNZImJQR
 Bh/XgNZCSImXNJMi7+u5EONYJAUuSZRv/TYuz1PIkjo2tDk+A/O0pgDnO Q==;
X-CSE-ConnectionGUID: 4OVPeHm+RIinQp9BStcddw==
X-CSE-MsgGUID: JRdrucpMRemeL9MtY+bfcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64591480"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="64591480"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 10:33:12 -0800
X-CSE-ConnectionGUID: lkPYhL9cSCm5bItwzn8GXA==
X-CSE-MsgGUID: 8Tgo1BrrTT63yHQostAfrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="187477937"
Received: from mtripa2-mobl.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.252.236])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 10:33:11 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/3] drm/xe/tests: Add KUnit tests for PF fair provisioning
Date: Wed,  5 Nov 2025 19:32:52 +0100
Message-ID: <20251105183253.863-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105183253.863-1-michal.wajdeczko@intel.com>
References: <20251105183253.863-1-michal.wajdeczko@intel.com>
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

Add test cases to check outcome of fair GuC context or doorbells
IDs allocations for regular and admin-only PF mode.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    | 162 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   4 +
 2 files changed, 166 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
new file mode 100644
index 000000000000..162a8a1a1dc6
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <kunit/static_stub.h>
+#include <kunit/test.h>
+#include <kunit/test-bug.h>
+
+#include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
+
+#define TEST_MAX_VFS	63
+
+static void pf_set_admin_mode(struct xe_device *xe, bool enable)
+{
+	/* should match logic of xe_sriov_pf_admin_only() */
+	xe->info.probe_display = !enable;
+	KUNIT_EXPECT_EQ(kunit_get_current_test(), enable, xe_sriov_pf_admin_only(xe));
+}
+
+static const void *num_vfs_gen_param(struct kunit *test, const void *prev, char *desc)
+{
+	unsigned long next = 1 + (unsigned long)prev;
+
+	if (next > TEST_MAX_VFS)
+		return NULL;
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%lu VF%s",
+		 next, str_plural(next));
+	return (void *)next;
+}
+
+static int pf_gt_config_test_init(struct kunit *test)
+{
+	struct xe_pci_fake_data fake = {
+		.sriov_mode = XE_SRIOV_MODE_PF,
+		.platform = XE_TIGERLAKE, /* any random platform with SR-IOV */
+		.subplatform = XE_SUBPLATFORM_NONE,
+	};
+	struct xe_device *xe;
+	struct xe_gt *gt;
+
+	test->priv = &fake;
+	xe_kunit_helper_xe_device_test_init(test);
+
+	xe = test->priv;
+	KUNIT_ASSERT_TRUE(test, IS_SRIOV_PF(xe));
+
+	gt = xe_root_mmio_gt(xe);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
+	test->priv = gt;
+
+	/* pretend it can support up to 63 VFs */
+	xe->sriov.pf.device_total_vfs = TEST_MAX_VFS;
+	xe->sriov.pf.driver_max_vfs = TEST_MAX_VFS;
+	KUNIT_ASSERT_EQ(test, xe_sriov_pf_get_totalvfs(xe), 63);
+
+	pf_set_admin_mode(xe, false);
+	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
+
+	/* more sanity checks */
+	KUNIT_EXPECT_EQ(test, GUC_ID_MAX + 1, SZ_64K);
+	KUNIT_EXPECT_EQ(test, GUC_NUM_DOORBELLS, SZ_256);
+
+	return 0;
+}
+
+static void fair_contexts_1vf(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	pf_set_admin_mode(xe, false);
+	KUNIT_ASSERT_FALSE(test, xe_sriov_pf_admin_only(xe));
+	KUNIT_EXPECT_EQ(test, SZ_32K, pf_profile_fair_ctxs(gt, 1));
+
+	pf_set_admin_mode(xe, true);
+	KUNIT_ASSERT_TRUE(test, xe_sriov_pf_admin_only(xe));
+	KUNIT_EXPECT_EQ(test, SZ_64K - SZ_1K, pf_profile_fair_ctxs(gt, 1));
+}
+
+static void fair_contexts(struct kunit *test)
+{
+	unsigned int num_vfs = (unsigned long)test->param_value;
+	struct xe_gt *gt = test->priv;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	pf_set_admin_mode(xe, false);
+	KUNIT_ASSERT_FALSE(test, xe_sriov_pf_admin_only(xe));
+
+	KUNIT_EXPECT_TRUE(test, is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)));
+	KUNIT_EXPECT_GT(test, GUC_ID_MAX, num_vfs * pf_profile_fair_ctxs(gt, num_vfs));
+
+	if (num_vfs > 31)
+		KUNIT_ASSERT_EQ(test, SZ_1K, pf_profile_fair_ctxs(gt, num_vfs));
+	else if (num_vfs > 15)
+		KUNIT_ASSERT_EQ(test, SZ_2K, pf_profile_fair_ctxs(gt, num_vfs));
+	else if (num_vfs > 7)
+		KUNIT_ASSERT_EQ(test, SZ_4K, pf_profile_fair_ctxs(gt, num_vfs));
+	else if (num_vfs > 3)
+		KUNIT_ASSERT_EQ(test, SZ_8K, pf_profile_fair_ctxs(gt, num_vfs));
+	else if (num_vfs > 1)
+		KUNIT_ASSERT_EQ(test, SZ_16K, pf_profile_fair_ctxs(gt, num_vfs));
+	else
+		KUNIT_ASSERT_EQ(test, SZ_32K, pf_profile_fair_ctxs(gt, num_vfs));
+}
+
+static void fair_doorbells_1vf(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	pf_set_admin_mode(xe, false);
+	KUNIT_ASSERT_FALSE(test, xe_sriov_pf_admin_only(xe));
+	KUNIT_EXPECT_EQ(test, 128, pf_profile_fair_dbs(gt, 1));
+
+	pf_set_admin_mode(xe, true);
+	KUNIT_ASSERT_TRUE(test, xe_sriov_pf_admin_only(xe));
+	KUNIT_EXPECT_EQ(test, 240, pf_profile_fair_dbs(gt, 1));
+}
+
+static void fair_doorbells(struct kunit *test)
+{
+	unsigned int num_vfs = (unsigned long)test->param_value;
+	struct xe_gt *gt = test->priv;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	pf_set_admin_mode(xe, false);
+	KUNIT_ASSERT_FALSE(test, xe_sriov_pf_admin_only(xe));
+
+	KUNIT_EXPECT_TRUE(test, is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)));
+	KUNIT_EXPECT_GE(test, GUC_NUM_DOORBELLS, (num_vfs + 1) * pf_profile_fair_dbs(gt, num_vfs));
+
+	if (num_vfs > 31)
+		KUNIT_ASSERT_EQ(test, SZ_4, pf_profile_fair_dbs(gt, num_vfs));
+	else if (num_vfs > 15)
+		KUNIT_ASSERT_EQ(test, SZ_8, pf_profile_fair_dbs(gt, num_vfs));
+	else if (num_vfs > 7)
+		KUNIT_ASSERT_EQ(test, SZ_16, pf_profile_fair_dbs(gt, num_vfs));
+	else if (num_vfs > 3)
+		KUNIT_ASSERT_EQ(test, SZ_32, pf_profile_fair_dbs(gt, num_vfs));
+	else if (num_vfs > 1)
+		KUNIT_ASSERT_EQ(test, SZ_64, pf_profile_fair_dbs(gt, num_vfs));
+	else
+		KUNIT_ASSERT_EQ(test, SZ_128, pf_profile_fair_dbs(gt, num_vfs));
+}
+
+static struct kunit_case pf_gt_confit_test_cases[] = {
+	KUNIT_CASE(fair_contexts_1vf),
+	KUNIT_CASE(fair_doorbells_1vf),
+	KUNIT_CASE_PARAM(fair_contexts, num_vfs_gen_param),
+	KUNIT_CASE_PARAM(fair_doorbells, num_vfs_gen_param),
+	{}
+};
+
+static struct kunit_suite pf_gt_config_suite = {
+	.name = "pf_gt_config",
+	.test_cases = pf_gt_confit_test_cases,
+	.init = pf_gt_config_test_init,
+};
+
+kunit_test_suite(pf_gt_config_suite);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 701889e5dded..80cc3f2cd047 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2826,3 +2826,7 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
 
 	return 0;
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_gt_sriov_pf_config_kunit.c"
+#endif
-- 
2.47.1

