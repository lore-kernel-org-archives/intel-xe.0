Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4116E77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 19:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B050810E381;
	Tue, 14 Jan 2025 19:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTTNMBI1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8668710E381
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 19:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736882514; x=1768418514;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6gh/PV5dIgPuRBWnm0RwiJdT10zpKl6tW0GwLD7IRb8=;
 b=NTTNMBI1LqWxBqkomVRuMCpv9pI695QCjcbzi2/UvkA8jvYVSQAgM7fN
 Aacylmk5ZBlFnrxopBOdYrunX48aYdEMyJ+JgKYURIrEpa1LoNHmMcuoN
 FwYlRAozG79aWfodLq8FJs3G/7toIwyflZQA0v9iphrvxyOARDFTEk6BB
 ihDfLtboKhv3IPmA5uDl90y7lFeVQvgURrO/ZJur+y3g86Z2Xp1GPMlCR
 nKTxx1VXpCJQNDebFNs+nd40oey9Pj11WE78o6LT/5b0zdnWgKTxZa4en
 UXjEyYwaBPRCSwRG8iP8ayqkEUrcVXJaC2a+9M8Ds9zhjv6Cmy+QZwjHq g==;
X-CSE-ConnectionGUID: 1XNCqjUjTdmidP7f0ETEiw==
X-CSE-MsgGUID: p5duIayuSM+Lk+wXqgfJ+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="36892607"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="36892607"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 11:21:54 -0800
X-CSE-ConnectionGUID: TmTQP2/LTAqu3BcI5ywXpQ==
X-CSE-MsgGUID: 22PnS8ORT+O12+Pjn+XSQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105760439"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 11:21:52 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 11/11] drm/xe/kunit: Add KUnit tests for GuC Buffer Cache
Date: Tue, 14 Jan 2025 20:21:40 +0100
Message-Id: <20250114192140.1039-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241220194205.995-12-michal.wajdeczko@intel.com>
References: <20241220194205.995-12-michal.wajdeczko@intel.com>
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

Add tests to make sure that recently added GuC Buffer Cache
component is working as expected.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
---
v2: rebased (Michal)
v3: drop unused DUT_DATA (MichalWi)
---
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c | 334 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_buf.c             |   4 +
 2 files changed, 338 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
new file mode 100644
index 000000000000..6faffcd74869
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -0,0 +1,334 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <kunit/static_stub.h>
+#include <kunit/test.h>
+#include <kunit/test-bug.h>
+
+#include "xe_device.h"
+#include "xe_ggtt.h"
+#include "xe_guc_ct.h"
+#include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
+
+#define DUT_GGTT_START		SZ_1M
+#define DUT_GGTT_SIZE		SZ_2M
+
+static struct xe_bo *replacement_xe_managed_bo_create_pin_map(struct xe_device *xe,
+							      struct xe_tile *tile,
+							      size_t size, u32 flags)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct xe_bo *bo;
+	void *buf;
+
+	bo = drmm_kzalloc(&xe->drm, sizeof(*bo), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bo);
+
+	buf = drmm_kzalloc(&xe->drm, size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+
+	bo->tile = tile;
+	bo->ttm.bdev = &xe->ttm;
+	bo->size = size;
+	iosys_map_set_vaddr(&bo->vmap, buf);
+
+	if (flags & XE_BO_FLAG_GGTT) {
+		struct xe_ggtt *ggtt = tile->mem.ggtt;
+
+		bo->ggtt_node[tile->id] = xe_ggtt_node_init(ggtt);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bo->ggtt_node[tile->id]);
+
+		KUNIT_ASSERT_EQ(test, 0,
+				drm_mm_insert_node_in_range(&ggtt->mm,
+							    &bo->ggtt_node[tile->id]->base,
+							    bo->size, SZ_4K,
+							    0, 0, U64_MAX, 0));
+	}
+
+	return bo;
+}
+
+static int guc_buf_test_init(struct kunit *test)
+{
+	struct xe_pci_fake_data fake = {
+		.sriov_mode = XE_SRIOV_MODE_PF,
+		.platform = XE_TIGERLAKE, /* some random platform */
+		.subplatform = XE_SUBPLATFORM_NONE,
+	};
+	struct xe_ggtt *ggtt;
+	struct xe_guc *guc;
+
+	test->priv = &fake;
+	xe_kunit_helper_xe_device_test_init(test);
+
+	ggtt = xe_device_get_root_tile(test->priv)->mem.ggtt;
+	guc = &xe_device_get_gt(test->priv, 0)->uc.guc;
+
+	drm_mm_init(&ggtt->mm, DUT_GGTT_START, DUT_GGTT_SIZE);
+	mutex_init(&ggtt->lock);
+
+	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
+				   replacement_xe_managed_bo_create_pin_map);
+
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_buf_cache_init(&guc->buf));
+
+	test->priv = &guc->buf;
+	return 0;
+}
+
+static void test_smallest(struct kunit *test)
+{
+	struct xe_guc_buf_cache *cache = test->priv;
+	struct xe_guc_buf buf;
+
+	buf = xe_guc_buf_reserve(cache, 1);
+	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
+	KUNIT_EXPECT_NOT_NULL(test, xe_guc_buf_cpu_ptr(buf));
+	KUNIT_EXPECT_NE(test, 0, xe_guc_buf_gpu_addr(buf));
+	KUNIT_EXPECT_LE(test, DUT_GGTT_START, xe_guc_buf_gpu_addr(buf));
+	KUNIT_EXPECT_GT(test, DUT_GGTT_START + DUT_GGTT_SIZE, xe_guc_buf_gpu_addr(buf));
+	xe_guc_buf_release(buf);
+}
+
+static void test_largest(struct kunit *test)
+{
+	struct xe_guc_buf_cache *cache = test->priv;
+	struct xe_guc_buf buf;
+
+	buf = xe_guc_buf_reserve(cache, xe_guc_buf_cache_dwords(cache));
+	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
+	KUNIT_EXPECT_NOT_NULL(test, xe_guc_buf_cpu_ptr(buf));
+	KUNIT_EXPECT_NE(test, 0, xe_guc_buf_gpu_addr(buf));
+	KUNIT_EXPECT_LE(test, DUT_GGTT_START, xe_guc_buf_gpu_addr(buf));
+	KUNIT_EXPECT_GT(test, DUT_GGTT_START + DUT_GGTT_SIZE, xe_guc_buf_gpu_addr(buf));
+	xe_guc_buf_release(buf);
+}
+
+static void test_granular(struct kunit *test)
+{
+	struct xe_guc_buf_cache *cache = test->priv;
+	struct xe_guc_buf *bufs;
+	int n, dwords;
+
+	dwords = xe_guc_buf_cache_dwords(cache);
+	bufs = kunit_kcalloc(test, dwords, sizeof(*bufs), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_NULL(test, bufs);
+
+	for (n = 0; n < dwords; n++)
+		bufs[n] = xe_guc_buf_reserve(cache, 1);
+
+	for (n = 0; n < dwords; n++)
+		KUNIT_EXPECT_TRUE_MSG(test, xe_guc_buf_is_valid(bufs[n]), "n=%d", n);
+
+	for (n = 0; n < dwords; n++)
+		xe_guc_buf_release(bufs[n]);
+}
+
+static void test_unique(struct kunit *test)
+{
+	struct xe_guc_buf_cache *cache = test->priv;
+	struct xe_guc_buf *bufs;
+	int n, m, dwords;
+
+	dwords = xe_guc_buf_cache_dwords(cache);
+	bufs = kunit_kcalloc(test, dwords, sizeof(*bufs), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_NULL(test, bufs);
+
+	for (n = 0; n < dwords; n++)
+		bufs[n] = xe_guc_buf_reserve(cache, 1);
+
+	for (n = 0; n < dwords; n++) {
+		for (m = n + 1; m < dwords; m++) {
+			KUNIT_EXPECT_PTR_NE_MSG(test, xe_guc_buf_cpu_ptr(bufs[n]),
+						xe_guc_buf_cpu_ptr(bufs[m]), "n=%d, m=%d", n, m);
+			KUNIT_ASSERT_NE_MSG(test, xe_guc_buf_gpu_addr(bufs[n]),
+					    xe_guc_buf_gpu_addr(bufs[m]), "n=%d, m=%d", n, m);
+		}
+	}
+
+	for (n = 0; n < dwords; n++)
+		xe_guc_buf_release(bufs[n]);
+}
+
+static void test_overlap(struct kunit *test)
+{
+	struct xe_guc_buf_cache *cache = test->priv;
+	struct xe_guc_buf b1, b2;
+	u32 dwords = xe_guc_buf_cache_dwords(cache) / 2;
+	u32 bytes = dwords * sizeof(u32);
+	void *p1, *p2;
+	u64 a1, a2;
+
+	b1 = xe_guc_buf_reserve(cache, dwords);
+	b2 = xe_guc_buf_reserve(cache, dwords);
+
+	p1 = xe_guc_buf_cpu_ptr(b1);
+	p2 = xe_guc_buf_cpu_ptr(b2);
+
+	a1 = xe_guc_buf_gpu_addr(b1);
+	a2 = xe_guc_buf_gpu_addr(b2);
+
+	KUNIT_EXPECT_PTR_NE(test, p1, p2);
+	if (p1 < p2)
+		KUNIT_EXPECT_LT(test, (uintptr_t)(p1 + bytes - 1), (uintptr_t)p2);
+	else
+		KUNIT_EXPECT_LT(test, (uintptr_t)(p2 + bytes - 1), (uintptr_t)p1);
+
+	KUNIT_EXPECT_NE(test, a1, a2);
+	if (a1 < a2)
+		KUNIT_EXPECT_LT(test, a1 + bytes - 1, a2);
+	else
+		KUNIT_EXPECT_LT(test, a2 + bytes - 1, a1);
+
+	xe_guc_buf_release(b1);
+	xe_guc_buf_release(b2);
+}
+
+static void test_reusable(struct kunit *test)
+{
+	struct xe_guc_buf_cache *cache = test->priv;
+	struct xe_guc_buf b1, b2;
+	void *p1;
+	u64 a1;
+
+	b1 = xe_guc_buf_reserve(cache, xe_guc_buf_cache_dwords(cache));
+	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(b1));
+	KUNIT_EXPECT_NOT_NULL(test, p1 = xe_guc_buf_cpu_ptr(b1));
+	KUNIT_EXPECT_NE(test, 0, a1 = xe_guc_buf_gpu_addr(b1));
+	xe_guc_buf_release(b1);
+
+	b2 = xe_guc_buf_reserve(cache, xe_guc_buf_cache_dwords(cache));
+	KUNIT_EXPECT_PTR_EQ(test, p1, xe_guc_buf_cpu_ptr(b2));
+	KUNIT_EXPECT_EQ(test, a1, xe_guc_buf_gpu_addr(b2));
+	xe_guc_buf_release(b2);
+}
+
+static void test_too_big(struct kunit *test)
+{
+	struct xe_guc_buf_cache *cache = test->priv;
+	struct xe_guc_buf buf;
+
+	buf = xe_guc_buf_reserve(cache, xe_guc_buf_cache_dwords(cache) + 1);
+	KUNIT_EXPECT_FALSE(test, xe_guc_buf_is_valid(buf));
+	xe_guc_buf_release(buf); /* shouldn't crash */
+}
+
+static void test_flush(struct kunit *test)
+{
+	struct xe_guc_buf_cache *cache = test->priv;
+	struct xe_guc_buf buf;
+	const u32 dwords = xe_guc_buf_cache_dwords(cache);
+	const u32 bytes = dwords * sizeof(u32);
+	u32 *s, *p, *d;
+	int n;
+
+	KUNIT_ASSERT_NOT_NULL(test, s = kunit_kcalloc(test, dwords, sizeof(u32), GFP_KERNEL));
+	KUNIT_ASSERT_NOT_NULL(test, d = kunit_kcalloc(test, dwords, sizeof(u32), GFP_KERNEL));
+
+	for (n = 0; n < dwords; n++)
+		s[n] = n;
+
+	buf = xe_guc_buf_reserve(cache, dwords);
+	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
+	KUNIT_ASSERT_NOT_NULL(test, p = xe_guc_buf_cpu_ptr(buf));
+	KUNIT_EXPECT_PTR_NE(test, p, s);
+	KUNIT_EXPECT_PTR_NE(test, p, d);
+
+	memcpy(p, s, bytes);
+	KUNIT_EXPECT_NE(test, 0, xe_guc_buf_flush(buf));
+
+	iosys_map_memcpy_from(d, &cache->sam->bo->vmap, 0, bytes);
+	KUNIT_EXPECT_MEMEQ(test, s, d, bytes);
+
+	xe_guc_buf_release(buf);
+}
+
+static void test_lookup(struct kunit *test)
+{
+	struct xe_guc_buf_cache *cache = test->priv;
+	struct xe_guc_buf buf;
+	u32 dwords;
+	u64 addr;
+	u32 *p;
+	int n;
+
+	dwords = xe_guc_buf_cache_dwords(cache);
+	buf = xe_guc_buf_reserve(cache, dwords);
+	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
+	KUNIT_ASSERT_NOT_NULL(test, p = xe_guc_buf_cpu_ptr(buf));
+	KUNIT_ASSERT_NE(test, 0, addr = xe_guc_buf_gpu_addr(buf));
+
+	KUNIT_EXPECT_EQ(test, 0, xe_guc_cache_gpu_addr_from_ptr(cache, p - 1, sizeof(u32)));
+	KUNIT_EXPECT_EQ(test, 0, xe_guc_cache_gpu_addr_from_ptr(cache, p + dwords, sizeof(u32)));
+
+	for (n = 0; n < dwords; n++)
+		KUNIT_EXPECT_EQ_MSG(test, xe_guc_cache_gpu_addr_from_ptr(cache, p + n, sizeof(u32)),
+				    addr + n * sizeof(u32), "n=%d", n);
+
+	xe_guc_buf_release(buf);
+}
+
+static void test_data(struct kunit *test)
+{
+	static const u32 data[] = { 1, 2, 3, 4, 5, 6 };
+	struct xe_guc_buf_cache *cache = test->priv;
+	struct xe_guc_buf buf;
+	void *p;
+
+	buf = xe_guc_buf_from_data(cache, data, sizeof(data));
+	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
+	KUNIT_ASSERT_NOT_NULL(test, p = xe_guc_buf_cpu_ptr(buf));
+	KUNIT_EXPECT_MEMEQ(test, p, data, sizeof(data));
+
+	xe_guc_buf_release(buf);
+}
+
+static void test_class(struct kunit *test)
+{
+	struct xe_guc_buf_cache *cache = test->priv;
+	u32 dwords = xe_guc_buf_cache_dwords(cache);
+
+	{
+		CLASS(xe_guc_buf, buf)(cache, dwords);
+		KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
+		KUNIT_EXPECT_NOT_NULL(test, xe_guc_buf_cpu_ptr(buf));
+		KUNIT_EXPECT_NE(test, 0, xe_guc_buf_gpu_addr(buf));
+		KUNIT_EXPECT_LE(test, DUT_GGTT_START, xe_guc_buf_gpu_addr(buf));
+		KUNIT_EXPECT_GT(test, DUT_GGTT_START + DUT_GGTT_SIZE, xe_guc_buf_gpu_addr(buf));
+	}
+
+	{
+		CLASS(xe_guc_buf, buf)(cache, dwords);
+		KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
+		KUNIT_EXPECT_NOT_NULL(test, xe_guc_buf_cpu_ptr(buf));
+		KUNIT_EXPECT_NE(test, 0, xe_guc_buf_gpu_addr(buf));
+		KUNIT_EXPECT_LE(test, DUT_GGTT_START, xe_guc_buf_gpu_addr(buf));
+		KUNIT_EXPECT_GT(test, DUT_GGTT_START + DUT_GGTT_SIZE, xe_guc_buf_gpu_addr(buf));
+	}
+}
+
+static struct kunit_case guc_buf_test_cases[] = {
+	KUNIT_CASE(test_smallest),
+	KUNIT_CASE(test_largest),
+	KUNIT_CASE(test_granular),
+	KUNIT_CASE(test_unique),
+	KUNIT_CASE(test_overlap),
+	KUNIT_CASE(test_reusable),
+	KUNIT_CASE(test_too_big),
+	KUNIT_CASE(test_flush),
+	KUNIT_CASE(test_lookup),
+	KUNIT_CASE(test_data),
+	KUNIT_CASE(test_class),
+	{}
+};
+
+static struct kunit_suite guc_buf_suite = {
+	.name = "guc_buf",
+	.test_cases = guc_buf_test_cases,
+	.init = guc_buf_test_init,
+};
+
+kunit_test_suites(&guc_buf_suite);
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
index 261c7c74417f..ce6d9830e13b 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.c
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -170,3 +170,7 @@ u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *p
 
 	return cache->sam->gpu_addr + offset;
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_guc_buf_kunit.c"
+#endif
-- 
2.47.1

