Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDF3C5AC82
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 10:12:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BF210E7AA;
	Mon, 10 Aug 2026 10:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VhU1KzxS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417DA10E7A5
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 10:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786356766; x=1817892766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p5ASqIngc2FoJgkFCOYScgprcP4BZqduCfLh5n/7vFI=;
 b=VhU1KzxSsO+Il93zinvh1bM8G7z7Qt+pIr2B0DpkgzCx9imTwWzj4ees
 p32Tkx46VwZWmnQJ/cbug9EYM9XPKX5PP1kF4H6RHZTDRNzOHWOMR0uGQ
 xRqeyfVN/ZPFFwvyRG80oRur6MqZUtgBjVW75fHExbDfVwoxghMNpGe4C
 wYQ4LIwch5UJvCagXgTbEfgTXaBx3wdDpjF+jhwGJ2rDTANO6aWY1VvTr
 qU99vjAmlD/HDX2A5vWTtXg+4VkZzrXUjfRbTNb/wmdIo+ugIVaoVzHLa
 ZDMx15RxCNAR9Ph4N2pKigts//dTv1cjKefnKDehd+ddfuA9PJr3cbkrB w==;
X-CSE-ConnectionGUID: 1ArruwHoSseaRU4u7OdRfA==
X-CSE-MsgGUID: A+m0QbiwTmqBNgJptPEQwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="86893664"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="86893664"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 03:12:46 -0700
X-CSE-ConnectionGUID: UqrZv0kdSVO9WL/0cLfF1g==
X-CSE-MsgGUID: uu0IQHC8RUqfH/iZQBmTNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="301227601"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by orviesa001.jf.intel.com with ESMTP; 10 Aug 2026 03:12:45 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v5 6/6] drm/xe/tests: Add KUnit tests for VF provisioning
 error handling
Date: Mon, 10 Aug 2026 15:44:33 +0530
Message-ID: <20260810101428.1009573-14-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
References: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
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

VF relies on the PF to provide a valid hardware configuration via GuC
KLV responses. In unlikely event of PF malfunction or misconfiguration,
a VF may receive incomplete, zero, or out-of-range values for its
submission contexts, doorbells, VRAM or GGTT assignment.

Add KUnit test cases that use the xe_guc_mmio_send_recv() stub to inject
bad KLV responses and verify that VF can survive without crashing for
the invalid configuration data received.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V4 -> V5:
- Added alignment tests for vram, GGTT base and size (Michal W).
- Separated stubs for ctx, db, vram and GGTT (Michal W).
- Added new test cases for xe_guc_mmio_send_recv() (Michal W).

V3 -> V4:
- Changed stub function from guc_action_query_single_klv32() and
guc_action_query_single_klv64() to xe_guc_mmio_send_recv() (Michal W).
- Fixed review comments (Michal W).

V2 -> V3:
- Renamed the test names. (Michal W).
- Fixed review comments (Michal W).

V1 -> V2:
- Renamed the test file (Michal W).
- Fixed review comments (Michal W).
---
 .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 322 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |   4 +
 2 files changed, 326 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
new file mode 100644
index 000000000000..9756c069fbc6
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/static_stub.h>
+#include <kunit/test.h>
+
+#include "regs/xe_guc_regs.h"
+#include "xe_device.h"
+#include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
+#include "xe_guc.h"
+
+#define TEST_VRAM		SZ_8G
+#define TEST_GGTT_SIZE		SZ_2G
+#define TEST_CTXS		1024
+#define TEST_DBS		128
+#define TEST_GGTT_START	0xa0a0a000ull
+
+struct config {
+	u32 orig;
+	u32 query;
+	int expected_ret;
+	const char *name;
+} vf_ctx_testcase[] = {
+	{TEST_CTXS,	TEST_CTXS,		0,		"same",		},
+	{0,		0,			-ENODATA,	"none",		},
+	{0,		GUC_ID_MAX + 1,		-EPROTO,	"overflow",	},
+	{TEST_CTXS,	0,			-EREMCHG,	"lost",		},
+	{TEST_CTXS,	TEST_CTXS / 2,		-EREMCHG,	"reduced",	},
+	{TEST_CTXS,	TEST_CTXS * 2,		-EREMCHG,	"increased",	},
+}, vf_db_testcase[] = {
+	{TEST_DBS,	TEST_DBS,		0,		"same",		},
+	{0,		0,			0,		"none",		},
+	{0,		GUC_NUM_DOORBELLS + 1,	-EPROTO,	"overflow",	},
+	{TEST_DBS,	0,			-EREMCHG,	"lost",		},
+	{TEST_DBS,	TEST_DBS / 2,		-EREMCHG,	"reduced",	},
+	{TEST_DBS,	GUC_NUM_DOORBELLS - 1,	-EREMCHG,	"increased",	},
+};
+
+struct config_vram {
+	u64 orig;
+	u64 query;
+	int expected_ret;
+	const char *name;
+} vf_vram_testcase[] = {
+	{TEST_VRAM,		TEST_VRAM,		0,		"same",		},
+	{0,			0,			-ENODATA,	"none",		},
+	{TEST_VRAM / 2,		TEST_VRAM + SZ_1G,	-EREMCHG,	"overflow",	},
+	{TEST_VRAM / 2,		0,			-EREMCHG,	"lost",		},
+	{TEST_VRAM / 2,		TEST_VRAM / 4,		-EREMCHG,	"reduced",	},
+	{TEST_VRAM / 2,		TEST_VRAM,		-EREMCHG,	"increased",	},
+	{TEST_VRAM - SZ_1M,	TEST_VRAM - SZ_1M,	-EREMCHG,	"unaligned",	},
+};
+
+struct config_ggtt {
+	u64 start_orig;
+	u64 start_query;
+	u64 size_orig;
+	u64 size_query;
+	int expected_ret;
+	const char *name;
+} vf_ggtt_testcase[] = {
+	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
+		TEST_GGTT_SIZE,		0,		"same",		},
+	{0,			0,			0,
+		0,			-ENODATA,	"none",		},
+	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
+		TEST_GGTT_SIZE + SZ_1G, -EREMCHG,	"overflow",	},
+	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
+		0,			-ENODATA,	"lost",		},
+	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
+		TEST_GGTT_SIZE - SZ_1M,	-EREMCHG,	"reduced",	},
+	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
+		TEST_GGTT_SIZE + SZ_1M,	-EREMCHG,	"increased",	},
+	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE - SZ_2K,
+		TEST_GGTT_SIZE - SZ_2K,	-EREMCHG,	"unaligned_size_4K",	},
+	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE - SZ_8K,
+		TEST_GGTT_SIZE - SZ_8K,	-EREMCHG,	"unaligned_size_64K",},
+	{TEST_GGTT_START - SZ_2K,	TEST_GGTT_START - SZ_2K,	TEST_GGTT_SIZE,
+		TEST_GGTT_SIZE,		-EREMCHG,	"unaligned_base_4k",	},
+	{TEST_GGTT_START - SZ_8K,	TEST_GGTT_START - SZ_8K,	TEST_GGTT_SIZE,
+		TEST_GGTT_SIZE,		-EREMCHG,	"unaligned_base_64k",	},
+};
+
+struct config_mmio {
+	int expected_ret;
+	const char *name;
+} guc_mmio_resp_testcase[] = {
+	{0,		"same",		},
+	{-ENODATA,	"none",		},
+	{-EOVERFLOW,	"overflow",	},
+	{-EREMCHG,	"lost",		},
+	{-EOVERFLOW,	"invalid",	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(ctx_testcase, vf_ctx_testcase, name);
+KUNIT_ARRAY_PARAM_DESC(db_testcase, vf_db_testcase, name);
+KUNIT_ARRAY_PARAM_DESC(vram_testcase, vf_vram_testcase, name);
+KUNIT_ARRAY_PARAM_DESC(ggtt_testcase, vf_ggtt_testcase, name);
+KUNIT_ARRAY_PARAM_DESC(guc_mmio_resp, guc_mmio_resp_testcase, name);
+
+static int xe_guc_mmio_send_recv_stub_ctx(struct xe_guc *guc, const u32 *request,
+					  u32 len, u32  *response_buf)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct config *c = test->param_value;
+
+	if ((request[0] & 0xffff) != GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV)
+		return -EINVAL;
+
+	if (request[1] != GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY)
+		return -EINVAL;
+
+	response_buf[0] = sizeof(u32) / sizeof(u32);
+	response_buf[1] = c->query;
+
+	return 0;
+}
+
+static int xe_guc_mmio_send_recv_stub_db(struct xe_guc *guc, const u32 *request,
+					 u32 len, u32  *response_buf)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct config *c = test->param_value;
+
+	if ((request[0] & 0xffff) != GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV)
+		return -EINVAL;
+
+	if (request[1] != GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY)
+		return -EINVAL;
+
+	response_buf[0] = sizeof(u32) / sizeof(u32);
+	response_buf[1] = c->query;
+
+	return 0;
+}
+
+static int xe_guc_mmio_send_recv_stub_vram(struct xe_guc *guc, const u32 *request,
+					   u32 len, u32  *response_buf)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct config_vram *c = test->param_value;
+
+	if ((request[0] & 0xffff) != GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV)
+		return -EINVAL;
+
+	if (request[1] != GUC_KLV_VF_CFG_LMEM_SIZE_KEY)
+		return -EINVAL;
+
+	response_buf[0] = sizeof(u64) / sizeof(u32);
+	response_buf[1] = c->query & 0xffffffff;
+	response_buf[2] = (c->query >> 32) & 0xffffffff;
+
+	return 0;
+}
+
+static int xe_guc_mmio_send_recv_stub_ggtt(struct xe_guc *guc, const u32 *request,
+					   u32 len, u32  *response_buf)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct config_ggtt *c = test->param_value;
+
+	if ((request[0] & 0xffff) != GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV)
+		return -EINVAL;
+
+	if (request[1] != GUC_KLV_VF_CFG_GGTT_START_KEY &&
+	    request[1] != GUC_KLV_VF_CFG_GGTT_SIZE_KEY)
+		return -EINVAL;
+
+	if (request[1] == GUC_KLV_VF_CFG_GGTT_START_KEY) {
+		response_buf[0] = sizeof(u64) / sizeof(u32);
+		response_buf[1] = c->start_query & 0xffffffff;
+		response_buf[2] = (c->start_query >> 32) & 0xffffffff;
+	} else {
+		response_buf[0] = sizeof(u64) / sizeof(u32);
+		response_buf[1] = c->size_query & 0xffffffff;
+		response_buf[2] = (c->size_query >> 32) & 0xffffffff;
+	}
+
+	return 0;
+}
+
+static int xe_guc_mmio_send_recv_stub(struct xe_guc *guc, const u32 *request,
+				      u32 len, u32  *response_buf)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct config_mmio *c = test->param_value;
+
+	if ((request[0] & 0xffff) != GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV)
+		return -EINVAL;
+	/**
+	 *  Let us take help of vf_get_ctxs_cfg() function to test responses
+	 *  from Guc.
+	 */
+	if (request[1] != GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY)
+		return -EINVAL;
+
+	if (!strcmp(c->name, "same")) {
+		response_buf[0] = sizeof(u32) / sizeof(u32);
+		response_buf[1] = TEST_CTXS;
+	} else if (!strcmp(c->name, "none")) {
+		response_buf[0] = 0;
+		response_buf[1] = 0;
+	} else if (!strcmp(c->name, "overflow")) {
+		response_buf[0] = sizeof(u64) / sizeof(u32);
+		response_buf[1] = TEST_CTXS;
+	} else if (!strcmp(c->name, "lost")) {
+		response_buf[0] = sizeof(u32) / sizeof(u32);
+		response_buf[1] = 0;
+	} else if (!strcmp(c->name, "invalid")) {
+		response_buf[0] = 0xffff;
+		response_buf[1] = 0xffff;
+	}
+
+	return 0;
+}
+
+static void test_ctxs(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	const struct config *c = test->param_value;
+
+	gt->sriov.vf.self_config.num_ctxs = c->orig;
+	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
+				   xe_guc_mmio_send_recv_stub_ctx);
+	KUNIT_EXPECT_EQ(test, vf_get_ctxs_cfg(gt), c->expected_ret);
+}
+
+static void test_dbs(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	const struct config *c = test->param_value;
+
+	gt->sriov.vf.self_config.num_dbs = c->orig;
+	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
+				   xe_guc_mmio_send_recv_stub_db);
+	KUNIT_EXPECT_EQ(test, vf_get_dbs_cfg(gt), c->expected_ret);
+}
+
+static void test_vram(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	const struct config_vram *c = test->param_value;
+
+	gt->tile->sriov.vf.self_config.lmem_size = c->orig;
+	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
+				   xe_guc_mmio_send_recv_stub_vram);
+	KUNIT_EXPECT_EQ(test, vf_get_lmem_info(gt), c->expected_ret);
+}
+
+static void test_ggtt_size(struct kunit *test)
+{
+	const struct config_ggtt *c = test->param_value;
+	struct xe_gt *gt = test->priv;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	gt->tile->sriov.vf.self_config.ggtt_base = c->start_orig;
+	gt->tile->sriov.vf.self_config.ggtt_size = c->size_orig;
+
+	if (!strcmp(c->name, "unaligned_size_64K") ||
+	    !strcmp(c->name, "unaligned_base_64k"))
+		xe->info.vram_flags = XE_VRAM_FLAGS_NEED64K;
+
+	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
+				   xe_guc_mmio_send_recv_stub_ggtt);
+	KUNIT_EXPECT_EQ(test, vf_get_ggtt_info(gt), c->expected_ret);
+}
+
+static void test_guc_mmio(struct kunit *test)
+{
+	const struct config_mmio *c = test->param_value;
+	struct xe_gt *gt = test->priv;
+
+	gt->sriov.vf.self_config.num_ctxs = TEST_CTXS;
+	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
+				   xe_guc_mmio_send_recv_stub);
+	KUNIT_EXPECT_EQ(test, vf_get_ctxs_cfg(gt), c->expected_ret);
+}
+
+static int vf_gt_config_test_init(struct kunit *test)
+{
+	struct xe_pci_fake_data fake = {
+		.sriov_mode = XE_SRIOV_MODE_VF,
+		.platform = XE_BATTLEMAGE, /* any random DGFX platform with SR-IOV */
+		.subplatform = XE_SUBPLATFORM_NONE,
+		.graphics_verx100 = 2001,
+	};
+	struct xe_device *xe;
+	struct xe_gt *gt;
+
+	test->priv = &fake;
+	xe_kunit_helper_xe_device_test_init(test);
+
+	xe = test->priv;
+	KUNIT_ASSERT_TRUE(test, IS_SRIOV_VF(xe));
+	KUNIT_ASSERT_TRUE(test, IS_DGFX(xe));
+
+	gt = xe_root_mmio_gt(xe);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
+	test->priv = gt;
+
+	return 0;
+}
+
+static struct kunit_case vf_gt_config_test_cases[] = {
+	KUNIT_CASE_PARAM(test_ctxs, ctx_testcase_gen_params),
+	KUNIT_CASE_PARAM(test_dbs, db_testcase_gen_params),
+	KUNIT_CASE_PARAM(test_vram, vram_testcase_gen_params),
+	KUNIT_CASE_PARAM(test_ggtt_size, ggtt_testcase_gen_params),
+	KUNIT_CASE_PARAM(test_guc_mmio, guc_mmio_resp_gen_params),
+	{}
+};
+
+static struct kunit_suite vf_gt_config_suite = {
+	.name = "vf_gt_config",
+	.test_cases = vf_gt_config_test_cases,
+	.init = vf_gt_config_test_init,
+};
+
+kunit_test_suite(vf_gt_config_suite);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 6c1878e4b1b2..05a6ad3348be 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1685,3 +1685,7 @@ int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
 
 	return atomic_read(&gt->sriov.vf.migration.fixups_complete_count);
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_gt_sriov_vf_kunit.c"
+#endif
-- 
2.53.0

