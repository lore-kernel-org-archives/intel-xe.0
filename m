Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BC3C88E7F
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 07:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BB810E8A7;
	Tue, 15 Sep 2026 07:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I46symR2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B8F10E23E
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 07:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789456344; x=1820992344;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K2cGnW1Pr5p4s7p3EpniNgzSkNmbD9awDgg06DEQJPI=;
 b=I46symR2C0jVhJm3tykdAqBEdJLIetbAjHiCNP4iFPLpFA8/rKdZQEDm
 CP+Y1nV1ovDwjlUnGXH0nVb2xEIHLSTjY937+Qjk9jZWA4CgbkkzWhLG1
 PSf4z8DT6mCXntflUCrGIG3/p9MVSGNpBoslWmgHX8bj8MLS5yXiQGpEo
 0k0G9zWttKR234hFubTykS+R/bcEqA+8V8Cg36WLwC7ZwkCr5OF6OYVtk
 bAUR2YL3FBspf3UNVM3qcXu9ITlvNZ7NqlxrKNC1XThx4t8/lcsM4L9Pn
 lS0AKo3fzEXoTN99YvKaLoRgs7TbeUkqZ+4gABRJI15kv2p7QyIY6J4Mx g==;
X-CSE-ConnectionGUID: t8olVd49S4yPUR05nyljMg==
X-CSE-MsgGUID: ndo2TXkrTomJMHL/R7BcwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93511768"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93511768"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 00:12:23 -0700
X-CSE-ConnectionGUID: ERWnbBwSRrmaRzq07qv6Yg==
X-CSE-MsgGUID: KCL0jPCITt+4XmQk9CMP7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1081620"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa012.fm.intel.com with ESMTP; 15 Sep 2026 00:12:22 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v8 10/10] drm/xe/tests: Add KUnit tests for VF provisioning
 error handling
Date: Tue, 15 Sep 2026 12:42:07 +0530
Message-ID: <20260915071159.51402-22-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915071159.51402-12-satyanarayana.k.v.p@intel.com>
References: <20260915071159.51402-12-satyanarayana.k.v.p@intel.com>
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
 .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 393 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |   4 +
 2 files changed, 397 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
new file mode 100644
index 000000000000..e1a1bc5f1223
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
@@ -0,0 +1,393 @@
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
+#define TEST_VALIDATE_IN_PARAMS(test, len, request, key)	\
+	do {	\
+		KUNIT_ASSERT_EQ(test, len, VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_LEN);	\
+		KUNIT_ASSERT_EQ(test,	\
+				FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]),	\
+				GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV);	\
+		KUNIT_ASSERT_EQ(test,	\
+				FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY, request[1]), \
+				key);	\
+	} while (0)
+
+#define TEST_FILL_RESP_BUFF(resp, c, type)	\
+	do {	\
+		if (type == sizeof(u32)) {	\
+			resp[0] = sizeof(u32) / sizeof(u32);	\
+			resp[1] = (c)->query;	\
+		} else if (type == sizeof(u64)) {	\
+			resp[0] = sizeof(u64) / sizeof(u32);	\
+			resp[1] = lower_32_bits((c)->query);	\
+			resp[2] = upper_32_bits((c)->query);	\
+		}	\
+	} while (0)
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
+	{ .orig = TEST_CTXS,		.query = TEST_CTXS,		.name = "same",		},
+	{ .expected_ret = -ENODATA,	.name = "none",						},
+	{ .query = GUC_ID_MAX + 1,	.expected_ret = -EPROTO,	.name = "overflow",	},
+	{ .orig = TEST_CTXS,		.expected_ret = -EREMCHG,	.name =	"lost",		},
+	{ .orig = TEST_CTXS,		.query = TEST_CTXS / 2,		.expected_ret = -EREMCHG,
+		.name = "reduced",	},
+	{ .orig = TEST_CTXS,		.query = TEST_CTXS * 2,		.expected_ret = -EREMCHG,
+		.name = "increased",	},
+	{ .expected_ret = -EPROTO,	.ret = -EPROTO,			.name = "proto_error",	},
+	{ .expected_ret = -EIO,		.ret = -EIO,			.name =	"IO_error",	},
+};
+
+static const struct config vf_db_testcase[] = {
+	{ .orig = TEST_DBS,		.query = TEST_DBS,		.name = "same",		},
+	{ .name = "none",									},
+	{ .orig = TEST_DBS,		.query = GUC_NUM_DOORBELLS + 1,	.expected_ret = -EPROTO,
+		.name = "overflow",	},
+	{ .orig = TEST_DBS,		.expected_ret = -EREMCHG,	.name = "lost",		},
+	{ .orig = TEST_DBS,		.query = TEST_DBS / 2,		.expected_ret = -EREMCHG,
+		.name = "reduced",	},
+	{ .orig = TEST_DBS,		.query = GUC_NUM_DOORBELLS - 1,	.expected_ret = -EREMCHG,
+		.name = "increased",	},
+	{ .expected_ret = -EPROTO,	.ret = -EPROTO,			.name = "proto_error"	},
+	{ .expected_ret = -EIO,		.ret = -EIO,			.name =	"IO_error",	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(ctx_testcase, vf_ctx_testcase, name);
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
+	TEST_VALIDATE_IN_PARAMS(test, len, request, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY);
+	TEST_FILL_RESP_BUFF(response_buf, c, sizeof(u32));
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
+	TEST_VALIDATE_IN_PARAMS(test, len, request, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY);
+	TEST_FILL_RESP_BUFF(response_buf, c, sizeof(u32));
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
+	{ .orig = TEST_VRAM,		.query = TEST_VRAM,		.name = "same",		},
+	{ .expected_ret = -ENODATA,	.name = "none",						},
+	{ .orig = TEST_VRAM / 2,	.query = TEST_VRAM + SZ_1G,
+		.expected_ret = -EREMCHG,				.name = "increased",	},
+	{ .orig = TEST_VRAM / 2,	.expected_ret = -EREMCHG,	.name = "lost",		},
+	{ .orig = TEST_VRAM / 2,	.query = TEST_VRAM / 4,
+		.expected_ret = -EREMCHG,				.name = "reduced",	},
+	{ .orig = TEST_VRAM - SZ_1M,	.query = TEST_VRAM - SZ_1M,
+		.expected_ret = -EINVAL,				.name = "unaligned",	},
+	{ .expected_ret = -EPROTO,	.ret = -EPROTO,			.name = "proto_error"	},
+	{ .expected_ret = -EIO,		.ret = -EIO,			.name =	"IO_error",	},
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
+	TEST_VALIDATE_IN_PARAMS(test, len, request, GUC_KLV_VF_CFG_LMEM_SIZE_KEY);
+	TEST_FILL_RESP_BUFF(response_buf, c, sizeof(u64));
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
+	u64 start_orig;
+	u64 start_query;
+	u64 size_orig;
+	u64 size_query;
+	int expected_ret;
+	int ret;
+	const char *name;
+};
+
+static const struct config_ggtt vf_ggtt_testcase[] = {
+	{ .start_orig = TEST_GGTT_START,		.start_query = TEST_GGTT_START,
+		.size_orig = TEST_GGTT_SIZE,		.size_query = TEST_GGTT_SIZE,
+		.name = "same",									},
+	{ .start_query = TEST_GGTT_START,		.size_query = TEST_GGTT_SIZE,
+		.name = "query_on_init",							},
+	{ .expected_ret = -ENODATA,			.name = "none",				},
+	{ .start_orig = TEST_GGTT_START,		.start_query = TEST_GGTT_START,
+		.size_orig = TEST_GGTT_SIZE,		.size_query = TEST_GGTT_SIZE + SZ_4G,
+		.expected_ret = -ERANGE,		.name = "overflow",			},
+	{ .start_query = TEST_GGTT_START,		.size_query = TEST_GGTT_SIZE + SZ_4G,
+		.expected_ret = -ERANGE,		.name =	"overflow_query_on_init",	},
+	{ .start_orig = TEST_GGTT_START,		.start_query = TEST_GGTT_START,
+		.size_orig = TEST_GGTT_SIZE,		.expected_ret = -ENODATA,
+		.name = "lost",									},
+	{ .start_query = TEST_GGTT_START,		.expected_ret = -ENODATA,
+		.name = "lost_on_init",								},
+	{ .start_orig = TEST_GGTT_START,		.start_query = TEST_GGTT_START,
+		.size_orig = TEST_GGTT_SIZE,		.size_query = TEST_GGTT_SIZE - SZ_1M,
+		.expected_ret = -EREMCHG,		.name = "reduced",			},
+	{ .start_orig = TEST_GGTT_START,		.start_query = TEST_GGTT_START,
+		.size_orig = TEST_GGTT_SIZE,		.size_query = TEST_GGTT_SIZE + SZ_1M,
+		.expected_ret = -EREMCHG,		.name = "increased",			},
+	{ .start_orig = TEST_GGTT_START,		.start_query = TEST_GGTT_START,
+		.size_orig = TEST_GGTT_SIZE - SZ_4K,	.size_query = TEST_GGTT_SIZE - SZ_2K,
+		.name = "unaligned_size_4K",							},
+	{ .start_query = TEST_GGTT_START,		.size_query = TEST_GGTT_SIZE - SZ_2K,
+		.name =	"unaligned_size_4K_on_init",						},
+	{ .start_orig = TEST_GGTT_START,		.start_query = TEST_GGTT_START - SZ_2K,
+		.size_orig = TEST_GGTT_SIZE,		.size_query = TEST_GGTT_SIZE,
+		.expected_ret = -EREMCHG,		.name = "unaligned_base_4K",		},
+	{ .start_query = TEST_GGTT_START - SZ_2K,	.size_query = TEST_GGTT_SIZE,
+		.name = "unaligned_base_4K_on_init",						},
+	{ .expected_ret = -EPROTO,			.ret = -EPROTO,
+		.name = "proto_error"								},
+	{ .expected_ret = -EIO,				.ret = -EIO,
+		.name = "IO_error",								},
+	{ .start_query = TEST_GGTT_START,
+		.size_query = TEST_GGTT_SIZE_OUT_OF_BOUNDS,
+		.expected_ret = -ERANGE,		.name = "out_of_bounds_size_on_init",},
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
+	KUNIT_EXPECT_EQ(test, len, VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_LEN);
+	key = FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY, request[1]);
+	KUNIT_ASSERT_TRUE(test,
+			  key == GUC_KLV_VF_CFG_GGTT_START_KEY ||
+			  key == GUC_KLV_VF_CFG_GGTT_SIZE_KEY);
+
+	response_buf[0] = sizeof(u64) / sizeof(u32);
+	if (key == GUC_KLV_VF_CFG_GGTT_START_KEY) {
+		response_buf[1] = lower_32_bits(c->start_query);
+		response_buf[2] = upper_32_bits(c->start_query);
+	} else if (key == GUC_KLV_VF_CFG_GGTT_SIZE_KEY) {
+		response_buf[1] = lower_32_bits(c->size_query);
+		response_buf[2] = upper_32_bits(c->size_query);
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
+	u64 expected_start = ALIGN(c->start_query, vf_get_ggtt_alignment(gt));
+
+	KUNIT_EXPECT_EQ(test, new_start, expected_start);
+}
+
+static void test_ggtt(struct kunit *test)
+{
+	const struct config_ggtt *c = test->param_value;
+	struct xe_gt *gt = test->priv;
+
+	gt->tile->sriov.vf.self_config.ggtt_base = c->start_orig;
+	gt->tile->sriov.vf.self_config.ggtt_size = c->size_orig;
+
+	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
+				   xe_guc_mmio_send_recv_stub_ggtt);
+	kunit_activate_static_stub(test, xe_ggtt_shift_nodes,
+				   xe_ggtt_shift_nodes_stub);
+	KUNIT_EXPECT_EQ(test, vf_get_ggtt_info(gt), c->expected_ret);
+}
+
+struct config_mmio {
+	u32 response_length;
+	u32 response_value;
+	int expected_ret;
+	int ret;
+	const char *name;
+};
+
+static const struct config_mmio guc_mmio_resp_testcase[] = {
+	{ .response_length = sizeof(u32) / sizeof(u32),
+		.response_value = TEST_CTXS,			.name = "same",			},
+	{ .expected_ret = -ENODATA,				.name = "none",			},
+	{ .response_length = sizeof(u64) / sizeof(u32),		.response_value = TEST_CTXS,
+		.expected_ret = -EOVERFLOW,			.name = "overflow",		},
+	{ .response_length = sizeof(u32) / sizeof(u32),		.response_value = 0,
+		.expected_ret = -EREMCHG,			.name = "lost",			},
+	{ .response_length = 0xffff,				.response_value = 0xffff,
+		.expected_ret = -EOVERFLOW,			.name =	"invalid",		},
+	{ .expected_ret = -EPROTO,				.ret = -EPROTO,
+		.name = "proto_error",								},
+	{ .expected_ret = -EIO,					.ret = -EIO,
+		.name = "IO_error",								},
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
+	if (c->ret)
+		return c->ret;
+
+	KUNIT_ASSERT_EQ(test, FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]),
+			GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV);
+	KUNIT_ASSERT_EQ(test,
+			FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY, request[1]),
+			GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY);
+
+	response_buf[0] = c->response_length;
+	response_buf[1] = c->response_value;
+
+	return 0;
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
index ec79793bd547..2bafe34f1821 100644
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

