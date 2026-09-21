Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234DFC982F6
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 09:21:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B5610E609;
	Mon, 21 Sep 2026 09:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W5xngQ8I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923F710E59E
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 09:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789982487; x=1821518487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4KVDC7uLM9bX6Z+PzsFPy8RRSC8XCKw5BIvZllu6kLo=;
 b=W5xngQ8ILaO/6Vg5vin1ZRHwcgwmjFPywqC+WmJYczGqPwPYfWk/F/LS
 HVCH0XGYV1Wv/o9tjQGQ93Fbx9upmc3+ihPPLQD9cABBxUHfdC2W8tDnk
 vXH5fCWfn5L0EDUA3RnW4xs4eAbvaM3j7uIm/n05u6xzlIjpYXn7dh/15
 l6m2Jj9VZA/ycRIBZSUGNH6ds/fvgnq9FwHxt1XHu2zuD7xYN4UmyVFVm
 lBgD1O5vNAldxriQLVNcCb6Eupaf3L79hTDfGrznSwBUFQOqSHE/iHjXu
 MczWcFJJ24Xm1EE+szAIO/1scr/qIEQE+SRd1NHCIBAfw7+zqPR5Lsug2 g==;
X-CSE-ConnectionGUID: ulnkyn87QNWJRQdrjyjKOg==
X-CSE-MsgGUID: zJYeuZEKRV6Lh+5nUbL5GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="90606628"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="90606628"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 02:21:27 -0700
X-CSE-ConnectionGUID: 39SpN+jSSUaZ62N3SsngPQ==
X-CSE-MsgGUID: LQz8huvTQVel2MPNmS/Ylw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3578456"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa012.fm.intel.com with ESMTP; 21 Sep 2026 02:21:25 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v10 10/10] drm/xe/tests: Add KUnit tests for VF provisioning
 error handling
Date: Mon, 21 Sep 2026 14:51:09 +0530
Message-ID: <20260921092101.1243989-22-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921092101.1243989-12-satyanarayana.k.v.p@intel.com>
References: <20260921092101.1243989-12-satyanarayana.k.v.p@intel.com>
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
KLV responses. In the unlikely event of PF malfunction or
misconfiguration, a VF may receive incomplete, zero, or out-of-range
values for its submission contexts, doorbells, VRAM or GGTT assignment.

Add KUnit test cases that use the xe_guc_mmio_send_recv() stub to inject
bad KLV responses and verify that VF can survive without crashing for
the invalid configuration data received.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V9 -> V10:
- Fixed review comments (Sashiko).
- Use (hxg_sizeof(u64)) + 1 to keep checkpatch.pl happy.

V8 -> V9:
- Fixed review comments (Michal W).
- Updated test_guc_mmio (Michal W).

V7 -> V8:
- Updated kunit test as per changed from other patches.

V6 -> V7:
- Fixed review comments (Sashiko, Michal W).

V5 -> V6:
- Fixed review comments (Michal W).

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
 .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 676 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |   4 +
 2 files changed, 680 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
new file mode 100644
index 000000000000..4830369dd47e
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
@@ -0,0 +1,676 @@
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
+#include "xe_ggtt.h"
+#include "xe_guc.h"
+#include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
+
+#define TEST_VRAM			SZ_8G
+#define TEST_GGTT_SIZE			SZ_2G
+#define TEST_GGTT_SIZE_OUT_OF_BOUNDS	0xfffffffffffff000ull
+#define TEST_CTXS			1024
+#define TEST_DBS			128
+#define TEST_GGTT_START			0xa0a000ull
+
+static inline void assert_valid_query_klv_msg(struct kunit *test, u32 len,
+					      const u32 *request, u32 key)
+{
+	KUNIT_ASSERT_EQ(test, len, VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_LEN);
+	KUNIT_ASSERT_EQ(test,
+			FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]),
+			GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV);
+	KUNIT_ASSERT_EQ(test,
+			FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY, request[1]),
+			key);
+}
+
+static inline void fill_resp_buff(u32 *response, u64 query, size_t type)
+{
+	if (type == sizeof(u32)) {
+		response[0] = FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_LENGTH,
+					 sizeof(u32) / sizeof(u32));
+		response[1] = FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_1_VALUE32,
+					 query);
+	} else if (type == sizeof(u64)) {
+		response[0] = FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_LENGTH,
+					 sizeof(u64) / sizeof(u32));
+		response[1] = FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_1_VALUE32,
+					 lower_32_bits(query));
+		response[2] = FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_2_VALUE64,
+					 upper_32_bits(query));
+	}
+}
+
+struct config {
+	u32 orig;
+	u32 query;
+	int expected_ret;
+	int ret;
+	const char *name;
+};
+
+static const struct config vf_ctx_testcase[] = {
+	{
+		.orig = TEST_CTXS,
+		.query = TEST_CTXS,
+		.expected_ret = 0,
+		.name = "same",
+	},
+	{
+		.orig = 0,
+		.query = 0,
+		.expected_ret = -ENODATA,
+		.name = "none",
+	},
+	{
+		.orig = 0,
+		.query = GUC_ID_MAX + 1,
+		.expected_ret = -ERANGE,
+		.name = "overflow",
+	},
+	{
+		.orig = TEST_CTXS,
+		.query = 0,
+		.expected_ret = -EREMCHG,
+		.name =	"lost",
+	},
+	{
+		.orig = TEST_CTXS,
+		.query = TEST_CTXS / 2,
+		.expected_ret = -EREMCHG,
+		.name = "reduced",
+	},
+	{
+		.orig = TEST_CTXS,
+		.query = TEST_CTXS * 2,
+		.expected_ret = -EREMCHG,
+		.name = "increased",
+	},
+	{
+		.orig = 0,
+		.query = 0,
+		.expected_ret = -EPROTO,
+		.ret = -EPROTO,
+		.name = "proto_error",
+	},
+	{
+		.orig = 0,
+		.query = 0,
+		.expected_ret = -EIO,
+		.ret = -EIO,
+		.name =	"IO_error",
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(ctx_testcase, vf_ctx_testcase, name);
+
+static const struct config vf_db_testcase[] = {
+	{
+		.orig = TEST_DBS,
+		.query = TEST_DBS,
+		.expected_ret = 0,
+		.name = "same",
+	},
+	{
+		.orig = 0,
+		.query = 0,
+		.expected_ret = 0,
+		.name = "none",
+	},
+	{
+		.orig = TEST_DBS,
+		.query = GUC_NUM_DOORBELLS + 1,
+		.expected_ret = -ERANGE,
+		.name = "overflow",
+	},
+	{
+		.orig = TEST_DBS,
+		.query = 0,
+		.expected_ret = -EREMCHG,
+		.name = "lost",
+	},
+	{
+		.orig = TEST_DBS,
+		.query = TEST_DBS / 2,
+		.expected_ret = -EREMCHG,
+		.name = "reduced",
+	},
+	{
+		.orig = TEST_DBS,
+		.query = GUC_NUM_DOORBELLS - 1,
+		.expected_ret = -EREMCHG,
+		.name = "increased",
+	},
+	{
+		.orig = 0,
+		.query = 0,
+		.expected_ret = -EPROTO,
+		.ret = -EPROTO,
+		.name = "proto_error",
+	},
+	{
+		.orig = 0,
+		.query = 0,
+		.expected_ret = -EIO,
+		.ret = -EIO,
+		.name =	"IO_error",
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(db_testcase, vf_db_testcase, name);
+
+static int xe_guc_mmio_send_recv_stub_ctx(struct xe_guc *guc, const u32 *request,
+					  u32 len, u32 *response_buf)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct config *c = test->param_value;
+
+	if (c->ret)
+		return c->ret;
+
+	assert_valid_query_klv_msg(test, len, request,
+				   GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY);
+	fill_resp_buff(response_buf, c->query, sizeof(u32));
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
+static int xe_guc_mmio_send_recv_stub_db(struct xe_guc *guc, const u32 *request,
+					 u32 len, u32 *response_buf)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct config *c = test->param_value;
+
+	if (c->ret)
+		return c->ret;
+
+	assert_valid_query_klv_msg(test, len, request,
+				   GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY);
+	fill_resp_buff(response_buf, c->query, sizeof(u32));
+
+	return 0;
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
+struct config_vram {
+	u64 orig;
+	u64 query;
+	int expected_ret;
+	int ret;
+	const char *name;
+};
+
+static const struct config_vram vf_vram_testcase[] = {
+	{
+		.orig = TEST_VRAM,
+		.query = TEST_VRAM,
+		.expected_ret = 0,
+		.name = "same",
+	},
+	{
+		.orig = 0,
+		.query = 0,
+		.expected_ret = -ENODATA,
+		.name = "none",
+	},
+	{
+		.orig = TEST_VRAM / 2,
+		.query = TEST_VRAM + SZ_1G,
+		.expected_ret = -EREMCHG,
+		.name = "increased",
+	},
+	{
+		.orig = TEST_VRAM / 2,
+		.query = 0,
+		.expected_ret = -EREMCHG,
+		.name = "lost",
+	},
+	{
+		.orig = TEST_VRAM / 2,
+		.query = TEST_VRAM / 4,
+		.expected_ret = -EREMCHG,
+		.name = "reduced",
+	},
+	{
+		.orig = 0,
+		.query = 0,
+		.expected_ret = -EPROTO,
+		.ret = -EPROTO,
+		.name = "proto_error",
+	},
+	{
+		.orig = 0,
+		.query = 0,
+		.expected_ret = -EIO,
+		.ret = -EIO,
+		.name =	"IO_error",
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(vram_testcase, vf_vram_testcase, name);
+
+static int xe_guc_mmio_send_recv_stub_vram(struct xe_guc *guc, const u32 *request,
+					   u32 len, u32 *response_buf)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct config_vram *c = test->param_value;
+
+	if (c->ret)
+		return c->ret;
+
+	assert_valid_query_klv_msg(test, len, request,
+				   GUC_KLV_VF_CFG_LMEM_SIZE_KEY);
+	fill_resp_buff(response_buf, c->query, sizeof(u64));
+
+	return 0;
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
+struct config_ggtt {
+	struct {
+		u64 start;
+		u64 size;
+	} orig, query;
+	int expected_ret;
+	int ret;
+	const char *name;
+};
+
+static const struct config_ggtt vf_ggtt_testcase[] = {
+	{
+		.orig =  { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE },
+		.query = { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE },
+		.name = "same",
+		.expected_ret = 0,
+	},
+	{
+		.orig =  { .start = 0, .size = 0 },
+		.query = { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE },
+		.expected_ret = 0,
+		.name = "query_on_init",
+	},
+	{
+		.orig =  { .start = 0, .size = 0 },
+		.query = { .start = 0, .size = 0 },
+		.expected_ret = -ENODATA,
+		.name = "none",
+	},
+	{
+		.orig =  { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE },
+		.query = { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE + SZ_4G },
+		.expected_ret = -ERANGE,
+		.name = "overflow",
+	},
+	{
+		.orig =  { .start = 0, .size = 0 },
+		.query = { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE + SZ_4G },
+		.expected_ret = -ERANGE,
+		.name =	"overflow_query_on_init",
+	},
+	{
+		.orig =  { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE },
+		.query = { .start = TEST_GGTT_START, .size = 0 },
+		.expected_ret = -ENODATA,
+		.name = "lost",
+	},
+	{
+		.orig =  { .start = 0, .size = 0 },
+		.query = { .start = TEST_GGTT_START, .size = 0 },
+		.expected_ret = -ENODATA,
+		.name = "lost_on_init",
+	},
+	{
+		.orig =  { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE },
+		.query = { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE - SZ_1M },
+		.expected_ret = -EREMCHG,
+		.name = "reduced",
+	},
+	{
+		.orig =  { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE },
+		.query = { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE + SZ_1M },
+		.expected_ret = -EREMCHG,
+		.name = "increased",
+	},
+	{
+		.orig =  { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE - SZ_4K },
+		.query = { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE - SZ_2K },
+		.expected_ret = 0,
+		.name = "unaligned_size_4K",
+	},
+	{
+		.orig =  { .start = 0, .size = 0 },
+		.query = { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE - SZ_2K },
+		.expected_ret = 0,
+		.name =	"unaligned_size_4K_on_init",
+	},
+	{
+		.orig =  { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE },
+		.query = { .start = TEST_GGTT_START - SZ_2K, .size = TEST_GGTT_SIZE },
+		.expected_ret = -EREMCHG,
+		.name = "unaligned_base_4K",
+	},
+	{
+		.orig =  { .start = 0, .size = 0 },
+		.query = { .start = TEST_GGTT_START - SZ_2K, .size = TEST_GGTT_SIZE },
+		.expected_ret = 0,
+		.name = "unaligned_base_4K_on_init",
+	},
+	{
+		.orig =  { .start = 0, .size = 0 },
+		.query = { .start = 0, .size = 0 },
+		.expected_ret = -EPROTO,
+		.ret = -EPROTO,
+		.name = "proto_error",
+	},
+	{
+		.orig =  { .start = 0, .size = 0 },
+		.query = { .start = 0, .size = 0 },
+		.expected_ret = -EIO,
+		.ret = -EIO,
+		.name = "IO_error",
+	},
+	{
+		.orig =  { .start = 0, .size = 0 },
+		.query = { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE_OUT_OF_BOUNDS },
+		.expected_ret = -ERANGE,
+		.name = "out_of_bounds_size_on_init",
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(ggtt_testcase, vf_ggtt_testcase, name);
+
+static int xe_guc_mmio_send_recv_stub_ggtt(struct xe_guc *guc, const u32 *request,
+					   u32 len, u32 *response_buf)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct config_ggtt *c = test->param_value;
+	u32 key;
+
+	if (c->ret)
+		return c->ret;
+
+	KUNIT_ASSERT_EQ(test, FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]),
+			GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV);
+	KUNIT_ASSERT_EQ(test, len, VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_LEN);
+	key = FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY, request[1]);
+	KUNIT_ASSERT_TRUE(test,
+			  key == GUC_KLV_VF_CFG_GGTT_START_KEY ||
+			  key == GUC_KLV_VF_CFG_GGTT_SIZE_KEY);
+
+	response_buf[0] = FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_LENGTH,
+				     sizeof(u64) / sizeof(u32));
+	if (key == GUC_KLV_VF_CFG_GGTT_START_KEY) {
+		response_buf[1] = FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_1_VALUE32,
+					     lower_32_bits(c->query.start));
+		response_buf[2] = FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_2_VALUE64,
+					     upper_32_bits(c->query.start));
+	} else if (key == GUC_KLV_VF_CFG_GGTT_SIZE_KEY) {
+		response_buf[1] = FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_1_VALUE32,
+					     lower_32_bits(c->query.size));
+		response_buf[2] = FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_2_VALUE64,
+					     upper_32_bits(c->query.size));
+	}
+
+	return 0;
+}
+
+static void xe_ggtt_shift_nodes_stub(struct xe_ggtt *ggtt, u64 new_start)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct config_ggtt *c = test->param_value;
+	struct xe_gt *gt = test->priv;
+	u64 expected_start = ALIGN(c->query.start, vf_get_ggtt_alignment(gt));
+
+	KUNIT_EXPECT_EQ(test, new_start, expected_start);
+}
+
+static void test_ggtt(struct kunit *test)
+{
+	const struct config_ggtt *c = test->param_value;
+	struct xe_gt *gt = test->priv;
+
+	gt->tile->sriov.vf.self_config.ggtt_base = c->orig.start;
+	gt->tile->sriov.vf.self_config.ggtt_size = c->orig.size;
+
+	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
+				   xe_guc_mmio_send_recv_stub_ggtt);
+	kunit_activate_static_stub(test, xe_ggtt_shift_nodes,
+				   xe_ggtt_shift_nodes_stub);
+	KUNIT_EXPECT_EQ(test, vf_get_ggtt_info(gt), c->expected_ret);
+}
+
+struct config_mmio {
+	struct {
+		u32 length;
+		u32 mbz;
+		u32 data0;
+		u32 data1;
+	} response;
+	u64 value;
+	u64 value_len;
+	u32 key;
+	int expected_ret;
+	int ret;
+	const char *name;
+};
+
+static const struct config_mmio guc_mmio_resp_testcase[] = {
+	{
+		.key = GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY,
+		.value = TEST_CTXS,
+		.value_len = hxg_sizeof(u32),
+		.response = {
+			.length = hxg_sizeof(u32),
+			.mbz = 0,
+			.data0 = TEST_CTXS,
+			.data1 = 0,
+		},
+		.expected_ret = 0,
+		.name = "klv32_successful"
+	},
+	{
+		.key = GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY,
+		.value = TEST_CTXS,
+		.value_len = hxg_sizeof(u32),
+		.response = {
+			.length = hxg_sizeof(u32),
+			.mbz = hxg_sizeof(u32),
+			.data0 = TEST_CTXS,
+			.data1 = 0,
+		},
+		.expected_ret = -EPROTO,
+		.name = "klv32_proto_error"
+	},
+	{
+		.key = GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY,
+		.value = TEST_CTXS,
+		.value_len = hxg_sizeof(u32),
+		.response = {
+			.length = hxg_sizeof(u64),
+			.mbz = 0,
+			.data0 = TEST_CTXS,
+			.data1 = 0,
+		},
+		.expected_ret = -EOVERFLOW,
+		.name = "klv32_overflow"
+	},
+	{
+		.key = GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY,
+		.value = TEST_CTXS,
+		.value_len = hxg_sizeof(u32),
+		.response = {
+			.length = 0,
+			.mbz = 0,
+			.data0 = TEST_CTXS,
+			.data1 = 0,
+		},
+		.expected_ret = -ENODATA,
+		.name = "klv32_underflow"
+	},
+	{
+		.key = GUC_KLV_VF_CFG_LMEM_SIZE_KEY,
+		.value = TEST_VRAM,
+		.value_len = hxg_sizeof(u64),
+		.response = {
+			.length = hxg_sizeof(u64),
+			.mbz = 0,
+			.data0 = lower_32_bits(TEST_VRAM),
+			.data1 = upper_32_bits(TEST_VRAM),
+		},
+		.expected_ret = 0,
+		.name = "klv64_successful"
+	},
+	{
+		.key = GUC_KLV_VF_CFG_LMEM_SIZE_KEY,
+		.value = TEST_VRAM,
+		.value_len = hxg_sizeof(u64),
+		.response = {
+			.length = hxg_sizeof(u64),
+			.mbz = hxg_sizeof(u32),
+			.data0 = lower_32_bits(TEST_VRAM),
+			.data1 = upper_32_bits(TEST_VRAM),
+		},
+		.expected_ret = -EPROTO,
+		.name = "klv64_proto_error"
+	},
+	{
+		.key = GUC_KLV_VF_CFG_LMEM_SIZE_KEY,
+		.value = TEST_VRAM,
+		.value_len = hxg_sizeof(u64),
+		.response = {
+			.length = (hxg_sizeof(u64)) + 1,
+			.mbz = 0,
+			.data0 = lower_32_bits(TEST_VRAM),
+			.data1 = upper_32_bits(TEST_VRAM),
+		},
+		.expected_ret = -EOVERFLOW,
+		.name = "klv64_overflow"
+	},
+	{
+		.key = GUC_KLV_VF_CFG_LMEM_SIZE_KEY,
+		.value = TEST_VRAM,
+		.value_len = hxg_sizeof(u64),
+		.response = {
+			.length = 1,
+			.mbz = 0,
+			.data0 = lower_32_bits(TEST_VRAM),
+			.data1 = upper_32_bits(TEST_VRAM),
+		},
+		.expected_ret = -ENODATA,
+		.name = "klv64_underflow"
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(guc_mmio_resp, guc_mmio_resp_testcase, name);
+
+static int xe_guc_mmio_send_recv_stub(struct xe_guc *guc, const u32 *request,
+				      u32 len, u32 *response_buf)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct config_mmio *c = test->param_value;
+
+	response_buf[0] =
+		FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_LENGTH, c->response.length) |
+		FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_MBZ, c->response.mbz);
+	response_buf[1] =
+		FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_1_VALUE32, c->response.data0);
+	response_buf[2] =
+		FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_2_VALUE64, c->response.data1);
+
+	return 0;
+}
+
+static void test_guc_mmio(struct kunit *test)
+{
+	const struct config_mmio *c = test->param_value;
+	struct xe_gt *gt = test->priv;
+	struct xe_guc *guc = &gt->uc.guc;
+	u32 value[2];
+
+	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
+				   xe_guc_mmio_send_recv_stub);
+	KUNIT_EXPECT_EQ(test,
+			guc_action_query_single_klv(guc, c->key, value, c->value_len),
+			c->expected_ret);
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
+	KUNIT_CASE_PARAM(test_ggtt, ggtt_testcase_gen_params),
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
index 37baeb1058b2..e80e3cdb5afe 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1708,3 +1708,7 @@ int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
 
 	return atomic_read(&gt->sriov.vf.migration.fixups_complete_count);
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_gt_sriov_vf_kunit.c"
+#endif
-- 
2.53.0

