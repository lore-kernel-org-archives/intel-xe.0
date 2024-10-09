Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8CECEE330
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 17:21:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9F410E797;
	Wed,  9 Oct 2024 17:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lGnYtzJN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E9810E797
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 17:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728494505; x=1760030505;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZmUlhZWFNZvkzzxDhTOatFTY+3Mu17RfWldzUmznXTU=;
 b=lGnYtzJNeOZUvYYnLmC1kZYPmuH1k+s386s70duFCb4bqcfcRc+eo4es
 4nMPp4w0prYgX+M08UFycHass2pShOTZN8CU/fIoVFEtNtf9d7OGCbqSu
 YNsK/hKQ3LdKKSPs/Udjfa72EW7rN3WhFx191Raes+XFe3Yye5tHNTGzQ
 3fuHdaaQcXuOCVk1rRpHr7XTN1+bKpuPbHJW0T/Wo0ORDIAD3ogvGjEhO
 qO534GkJQv2MICTsMjhpNKcaomwSBspUaPIFJcNiWp1SLLfSvHOcfxsQO
 rGQqQsuoGbEJqauJYhj35ymyHJS7P5fcadjU2wEbZlaekmG2lcj2GhjIZ A==;
X-CSE-ConnectionGUID: asC9GVDxRVGzEd/KecmehQ==
X-CSE-MsgGUID: PJg6wqQ/RtmcZAg51hjWPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27292663"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="27292663"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 10:21:45 -0700
X-CSE-ConnectionGUID: IaLRbFInSdGlexNZ1xsz7g==
X-CSE-MsgGUID: lKQYs9znR+6w6si0Yx9B5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="76265764"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 10:21:44 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/5] drm/xe/kunit: Add KUnit tests for GuC Buffer Cache
Date: Wed,  9 Oct 2024 19:21:23 +0200
Message-Id: <20241009172125.1539-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241009172125.1539-1-michal.wajdeczko@intel.com>
References: <20241009172125.1539-1-michal.wajdeczko@intel.com>
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
---
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c | 450 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_buf.c             |   4 +
 2 files changed, 454 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
new file mode 100644
index 000000000000..016bd49e62ff
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -0,0 +1,450 @@
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
+
+static const unsigned int DUT_CACHE_SIZE = SZ_4K; /* matches minimum buffer size */
+static const unsigned int DUT_SMALLEST_BUF = sizeof(u32);
+static const unsigned int DUT_GGTT_START = SZ_1M;
+static const unsigned int DUT_GGTT_SIZE = SZ_2M;
+static const int some_valid_data = 1;
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
+	bo->size = size;
+	iosys_map_set_vaddr(&bo->vmap, buf);
+
+	if (flags & XE_BO_FLAG_GGTT) {
+		struct xe_ggtt *ggtt = tile->mem.ggtt;
+
+		bo->ggtt_node = xe_ggtt_node_init(ggtt);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bo->ggtt_node);
+
+		KUNIT_ASSERT_EQ(test, 0,
+				drm_mm_insert_node_in_range(&ggtt->mm,
+							    &bo->ggtt_node->base,
+							    bo->size, SZ_4K,
+							    0, 0, U64_MAX, 0));
+	}
+
+	return bo;
+}
+
+static int guc_buf_test_init(struct kunit *test)
+{
+	struct xe_ggtt *ggtt;
+	struct xe_guc *guc;
+
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
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_ct_init(&guc->ct));
+
+	test->priv = guc;
+	return 0;
+}
+
+static void test_basic(struct kunit *test)
+{
+	struct xe_guc *guc = test->priv;
+	struct xe_guc_buf_cache *cache;
+	struct xe_guc_buf buf;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cache = xe_guc_buf_cache_init(guc, 1));
+	KUNIT_EXPECT_EQ(test, cache->used, 0);
+	KUNIT_EXPECT_NE(test, cache->chunk, 0);
+
+	buf = xe_guc_buf_reserve(cache, 1);
+	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
+	KUNIT_EXPECT_NOT_NULL(test, xe_guc_buf_cpu_ptr(buf));
+	KUNIT_EXPECT_NE(test, 0, xe_guc_buf_gpu_addr(buf));
+	KUNIT_EXPECT_LE(test, DUT_GGTT_START, xe_guc_buf_gpu_addr(buf));
+	KUNIT_EXPECT_GT(test, DUT_GGTT_START + DUT_GGTT_SIZE, xe_guc_buf_gpu_addr(buf));
+
+	KUNIT_EXPECT_NE(test, cache->used, 0);
+	xe_guc_buf_release(buf);
+	KUNIT_EXPECT_EQ(test, cache->used, 0);
+}
+
+static void test_full(struct kunit *test)
+{
+	struct xe_guc *guc = test->priv;
+	struct xe_guc_buf_cache *cache;
+	struct xe_guc_buf buf;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cache = xe_guc_buf_cache_init(guc, DUT_CACHE_SIZE));
+
+	buf = xe_guc_buf_reserve(cache, DUT_CACHE_SIZE);
+	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
+	KUNIT_EXPECT_FALSE(test, xe_guc_buf_is_valid(xe_guc_buf_reserve(cache, 1)));
+	xe_guc_buf_release(buf);
+}
+
+static void test_reuse(struct kunit *test)
+{
+	struct xe_guc *guc = test->priv;
+	struct xe_guc_buf_cache *cache;
+	struct xe_guc_buf buf;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cache = xe_guc_buf_cache_init(guc, DUT_CACHE_SIZE));
+
+	buf = xe_guc_buf_reserve(cache, DUT_CACHE_SIZE);
+	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
+	KUNIT_EXPECT_FALSE(test, xe_guc_buf_is_valid(xe_guc_buf_reserve(cache, 1)));
+	xe_guc_buf_release(buf);
+
+	buf = xe_guc_buf_reserve(cache, 1);
+	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
+	xe_guc_buf_release(buf);
+}
+
+static void test_flush(struct kunit *test)
+{
+	struct xe_guc *guc = test->priv;
+	struct xe_guc_buf_cache *cache;
+	struct xe_guc_buf buf;
+	void *p, *t;
+
+	KUNIT_ASSERT_NOT_NULL(test, t = kunit_kzalloc(test, DUT_CACHE_SIZE, GFP_KERNEL));
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cache = xe_guc_buf_cache_init(guc, DUT_CACHE_SIZE));
+	iosys_map_memset(&cache->bo->vmap, 0, POISON_INUSE, DUT_CACHE_SIZE);
+
+	buf = xe_guc_buf_reserve(cache, DUT_SMALLEST_BUF);
+	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
+	KUNIT_ASSERT_NOT_NULL(test, p = xe_guc_buf_cpu_ptr(buf));
+
+	memset(p, some_valid_data, DUT_SMALLEST_BUF);
+
+	iosys_map_memcpy_from(t, &cache->bo->vmap, 0, DUT_CACHE_SIZE);
+	KUNIT_EXPECT_MEMNEQ_MSG(test, p, t, DUT_SMALLEST_BUF,
+				"local updates shall not be visible until explicit flush");
+
+	KUNIT_EXPECT_NE(test, 0, xe_guc_buf_flush(buf));
+
+	iosys_map_memcpy_from(t, &cache->bo->vmap, 0, DUT_CACHE_SIZE);
+	KUNIT_EXPECT_MEMEQ_MSG(test, p, t, DUT_SMALLEST_BUF,
+			       "local updates not visible after flush!");
+
+	xe_guc_buf_release(buf);
+}
+
+static void test_sync(struct kunit *test)
+{
+	struct xe_guc *guc = test->priv;
+	struct xe_guc_buf_cache *cache;
+	struct xe_guc_buf buf;
+	void *p, *t;
+
+	KUNIT_ASSERT_NOT_NULL(test, t = kunit_kzalloc(test, DUT_CACHE_SIZE, GFP_KERNEL));
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cache = xe_guc_buf_cache_init(guc, DUT_CACHE_SIZE));
+	iosys_map_memset(&cache->bo->vmap, 0, some_valid_data, DUT_CACHE_SIZE);
+
+	buf = xe_guc_buf_reserve(cache, DUT_SMALLEST_BUF);
+	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
+	KUNIT_ASSERT_NOT_NULL(test, p = xe_guc_buf_cpu_ptr(buf));
+
+	iosys_map_memcpy_from(t, &cache->bo->vmap, 0, DUT_CACHE_SIZE);
+	KUNIT_EXPECT_MEMNEQ_MSG(test, p, t, DUT_SMALLEST_BUF,
+				"target data should not be visible until explicit sync");
+
+	KUNIT_EXPECT_NOT_NULL(test, xe_guc_buf_sync(buf));
+
+	iosys_map_memcpy_from(t, &cache->bo->vmap, 0, DUT_CACHE_SIZE);
+	KUNIT_EXPECT_MEMEQ_MSG(test, p, t, DUT_SMALLEST_BUF,
+			       "target data not visible after sync!");
+
+	xe_guc_buf_release(buf);
+}
+
+static void test_chunks(struct kunit *test)
+{
+	struct xe_guc *guc = test->priv;
+	struct xe_guc_buf_cache *cache;
+	struct xe_guc_buf buf[BITS_PER_LONG];
+	u64 addr, start = 0, end = 0;
+	int n, m;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cache = xe_guc_buf_cache_init(guc, DUT_CACHE_SIZE));
+
+	KUNIT_EXPECT_NE(test, cache->chunk, 0);
+	KUNIT_EXPECT_EQ(test, cache->chunk * BITS_PER_LONG, DUT_CACHE_SIZE);
+
+	for (n = 0; n < BITS_PER_LONG; n++) {
+		buf[n] = xe_guc_buf_reserve(cache, cache->chunk);
+		KUNIT_EXPECT_TRUE_MSG(test, xe_guc_buf_is_valid(buf[n]), "n=%d", n);
+		KUNIT_EXPECT_NE_MSG(test, 0, addr = xe_guc_buf_gpu_addr(buf[n]), "n=%d", n);
+		KUNIT_EXPECT_LE_MSG(test, DUT_GGTT_START, addr, "n=%d", n);
+		KUNIT_EXPECT_GT_MSG(test, DUT_GGTT_START + DUT_GGTT_SIZE, addr, "n=%d", n);
+
+		start = n ? min(start, addr) : addr;
+		end = n ? max(end, addr + cache->chunk) : addr + cache->chunk;
+	}
+
+	KUNIT_EXPECT_FALSE(test, xe_guc_buf_is_valid(xe_guc_buf_reserve(cache, 1)));
+
+	KUNIT_EXPECT_EQ(test, end - start, DUT_CACHE_SIZE);
+
+	for (n = 0; n < BITS_PER_LONG; n++) {
+		for (m = 0; m < BITS_PER_LONG; m++) {
+			if (n == m)
+				continue;
+			KUNIT_EXPECT_PTR_NE_MSG(test,
+						xe_guc_buf_cpu_ptr(buf[n]),
+						xe_guc_buf_cpu_ptr(buf[m]),
+						"n=%d m=%d", n, m);
+			KUNIT_EXPECT_NE_MSG(test,
+					    xe_guc_buf_gpu_addr(buf[n]),
+					    xe_guc_buf_gpu_addr(buf[m]),
+					    "n=%d m=%d", n, m);
+			KUNIT_EXPECT_NE_MSG(test,
+					    xe_guc_buf_gpu_addr(buf[n]) + cache->chunk - 1,
+					    xe_guc_buf_gpu_addr(buf[m]),
+					    "n=%d m=%d", n, m);
+			KUNIT_EXPECT_NE_MSG(test,
+					    xe_guc_buf_gpu_addr(buf[n]),
+					    xe_guc_buf_gpu_addr(buf[m]) + cache->chunk - 1,
+					    "n=%d m=%d", n, m);
+		}
+	}
+
+	for (n = 0; n < BITS_PER_LONG; n++)
+		xe_guc_buf_release(buf[n]);
+}
+
+static void test_isolated(struct kunit *test)
+{
+	struct xe_guc *guc = test->priv;
+	struct xe_guc_buf_cache *cache;
+	struct xe_guc_buf b[BITS_PER_LONG];
+	void *t, **p, **r;
+	int n, m;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cache = xe_guc_buf_cache_init(guc, DUT_CACHE_SIZE));
+	iosys_map_memset(&cache->bo->vmap, 0, -1, DUT_CACHE_SIZE);
+
+	KUNIT_ASSERT_NOT_NULL(test, t = kunit_kzalloc(test, DUT_CACHE_SIZE, GFP_KERNEL));
+	KUNIT_ASSERT_NOT_NULL(test, p = kunit_kcalloc(test, BITS_PER_LONG, sizeof(*p), GFP_KERNEL));
+	KUNIT_ASSERT_NOT_NULL(test, r = kunit_kcalloc(test, BITS_PER_LONG, sizeof(*r), GFP_KERNEL));
+
+	for (n = 0; n < BITS_PER_LONG; n++) {
+		b[n] = xe_guc_buf_reserve(cache, DUT_SMALLEST_BUF);
+		KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(b[n]));
+		KUNIT_ASSERT_NOT_NULL(test, p[n] = xe_guc_buf_cpu_ptr(b[n]));
+		KUNIT_ASSERT_NOT_NULL(test, r[n] = t + (p[n] - cache->mirror));
+		memset(p[n], n + 1, DUT_SMALLEST_BUF);
+	}
+
+	iosys_map_memcpy_from(t, &cache->bo->vmap, 0, DUT_CACHE_SIZE);
+
+	for (n = 0; n < BITS_PER_LONG; n++) {
+		KUNIT_ASSERT_EQ(test, (char)-1, *(char *)r[n]);
+		KUNIT_ASSERT_EQ(test, n + 1, *(char *)p[n]);
+	}
+
+	iosys_map_memset(&cache->bo->vmap, 0, 0, DUT_CACHE_SIZE);
+	iosys_map_memcpy_from(t, &cache->bo->vmap, 0, DUT_CACHE_SIZE);
+
+	for (n = 0; n < BITS_PER_LONG; n++) {
+		KUNIT_ASSERT_EQ(test, 0, *(char *)r[n]);
+		KUNIT_ASSERT_EQ(test, n + 1, *(char *)p[n]);
+
+		KUNIT_ASSERT_NE(test, 0, xe_guc_buf_flush(b[n]));
+		iosys_map_memcpy_from(t, &cache->bo->vmap, 0, DUT_CACHE_SIZE);
+
+		KUNIT_ASSERT_EQ(test, n + 1, *(char *)r[n]);
+		KUNIT_ASSERT_EQ(test, n + 1, *(char *)p[n]);
+		KUNIT_ASSERT_MEMEQ(test, p[n], r[n], DUT_SMALLEST_BUF);
+
+		for (m = 0; m < n; m++) {
+			KUNIT_ASSERT_EQ(test, m + 1, *(char *)r[m]);
+			KUNIT_ASSERT_EQ(test, m + 1, *(char *)p[m]);
+		}
+		for (m = n + 1; m < BITS_PER_LONG; m++) {
+			KUNIT_ASSERT_EQ(test, 0, *(char *)r[m]);
+			KUNIT_ASSERT_EQ(test, m + 1, *(char *)p[m]);
+		}
+	}
+
+	for (n = 0; n < BITS_PER_LONG; n++)
+		iosys_map_memset(&cache->bo->vmap, p[n] - cache->mirror,
+				 n + BITS_PER_LONG, DUT_SMALLEST_BUF);
+
+	for (n = 0; n < BITS_PER_LONG; n++) {
+		iosys_map_memcpy_from(t, &cache->bo->vmap, 0, DUT_CACHE_SIZE);
+
+		KUNIT_ASSERT_EQ(test, n + 1, *(char *)p[n]);
+		KUNIT_ASSERT_EQ(test, n + BITS_PER_LONG, *(char *)r[n]);
+		KUNIT_ASSERT_MEMNEQ(test, p[n], r[n], DUT_SMALLEST_BUF);
+
+		KUNIT_ASSERT_PTR_EQ(test, p[n], xe_guc_buf_sync(b[n]));
+		iosys_map_memcpy_from(t, &cache->bo->vmap, 0, DUT_CACHE_SIZE);
+
+		KUNIT_ASSERT_EQ(test, n + BITS_PER_LONG, *(char *)p[n]);
+		KUNIT_ASSERT_EQ(test, n + BITS_PER_LONG, *(char *)r[n]);
+		KUNIT_ASSERT_MEMEQ(test, p[n], r[n], DUT_SMALLEST_BUF);
+
+		for (m = 0; m < n; m++) {
+			KUNIT_ASSERT_EQ(test, m + BITS_PER_LONG, *(char *)r[m]);
+			KUNIT_ASSERT_EQ(test, m + BITS_PER_LONG, *(char *)p[m]);
+			KUNIT_ASSERT_MEMNEQ(test, p[n], r[m], DUT_SMALLEST_BUF);
+		}
+		for (m = n + 1; m < BITS_PER_LONG; m++) {
+			KUNIT_ASSERT_EQ(test, m + BITS_PER_LONG, *(char *)r[m]);
+			KUNIT_ASSERT_EQ(test, m + 1, *(char *)p[m]);
+			KUNIT_ASSERT_MEMNEQ(test, p[n], r[m], DUT_SMALLEST_BUF);
+		}
+	}
+
+	for (n = 0; n < BITS_PER_LONG; n++)
+		xe_guc_buf_release(b[n]);
+}
+
+static void test_lookup(struct kunit *test)
+{
+	struct xe_guc *guc = test->priv;
+	struct xe_guc_buf_cache *cache;
+	struct xe_guc_buf buf;
+	u64 addr;
+	void *p;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cache = xe_guc_buf_cache_init(guc, DUT_CACHE_SIZE));
+
+	buf = xe_guc_buf_reserve(cache, 1);
+	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
+	KUNIT_ASSERT_NOT_NULL(test, p = xe_guc_buf_cpu_ptr(buf));
+	KUNIT_ASSERT_NE(test, 0, addr = xe_guc_buf_gpu_addr(buf));
+
+	KUNIT_ASSERT_EQ(test, addr, xe_guc_cache_gpu_addr_from_ptr(cache, p, 1));
+
+	KUNIT_EXPECT_EQ(test, addr, xe_guc_cache_gpu_addr_from_ptr(cache, p, cache->chunk));
+	KUNIT_EXPECT_EQ(test, addr + cache->chunk - 1,
+			xe_guc_cache_gpu_addr_from_ptr(cache, p + cache->chunk - 1, 1));
+
+	KUNIT_EXPECT_EQ(test, 0, xe_guc_cache_gpu_addr_from_ptr(cache, p - 1, 1));
+	KUNIT_EXPECT_EQ(test, 0, xe_guc_cache_gpu_addr_from_ptr(cache, p, DUT_CACHE_SIZE + 1));
+	KUNIT_EXPECT_EQ(test, 0, xe_guc_cache_gpu_addr_from_ptr(cache, p + DUT_CACHE_SIZE, 1));
+
+	xe_guc_buf_release(buf);
+}
+
+static void test_data(struct kunit *test)
+{
+	static const u32 data[] = { 1, 2, 3, 4 };
+	struct xe_guc *guc = test->priv;
+	struct xe_guc_buf_cache *cache;
+	struct xe_guc_buf buf;
+	void *p, *t;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cache = xe_guc_buf_cache_init(guc, DUT_CACHE_SIZE));
+	KUNIT_ASSERT_NOT_NULL(test, t = kunit_kzalloc(test, DUT_CACHE_SIZE, GFP_KERNEL));
+
+	buf = xe_guc_buf_from_data(cache, data, sizeof(data));
+	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
+	KUNIT_ASSERT_NOT_NULL(test, p = xe_guc_buf_cpu_ptr(buf));
+
+	KUNIT_EXPECT_MEMNEQ(test, p, data, sizeof(data));
+	iosys_map_memcpy_from(t, &cache->bo->vmap, 0, DUT_CACHE_SIZE);
+	KUNIT_EXPECT_MEMEQ(test, t + (p - cache->mirror), data, sizeof(data));
+
+	xe_guc_buf_release(buf);
+}
+
+static void test_class(struct kunit *test)
+{
+	struct xe_guc *guc = test->priv;
+	struct xe_guc_buf_cache *cache;
+	struct xe_guc_buf buf;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cache = xe_guc_buf_cache_init(guc, DUT_CACHE_SIZE));
+
+	{
+		CLASS(xe_guc_buf, buf1)(cache, DUT_CACHE_SIZE);
+
+		KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf1));
+		KUNIT_EXPECT_FALSE(test, xe_guc_buf_is_valid(xe_guc_buf_reserve(cache, 1)));
+	}
+
+	buf = xe_guc_buf_reserve(cache, 1);
+	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
+	xe_guc_buf_release(buf);
+}
+
+static void test_class_from_data(struct kunit *test)
+{
+	static const u32 data[] = { 1, 2, 3, 4 };
+	struct xe_guc *guc = test->priv;
+	struct xe_guc_buf_cache *cache;
+	struct xe_guc_buf buf;
+	void *t, *p;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cache = xe_guc_buf_cache_init(guc, DUT_CACHE_SIZE));
+	KUNIT_ASSERT_NOT_NULL(test, t = kunit_kzalloc(test, DUT_CACHE_SIZE, GFP_KERNEL));
+
+	{
+		CLASS(xe_guc_buf_from_data, buf1)(cache, data, sizeof(data));
+
+		KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf1));
+		KUNIT_ASSERT_NOT_NULL(test, p = xe_guc_buf_cpu_ptr(buf1));
+		KUNIT_EXPECT_MEMNEQ(test, p, data, sizeof(data));
+		iosys_map_memcpy_from(t, &cache->bo->vmap, 0, DUT_CACHE_SIZE);
+		KUNIT_EXPECT_MEMEQ(test, t + (p - cache->mirror), data, sizeof(data));
+	}
+
+	buf = xe_guc_buf_reserve(cache, DUT_CACHE_SIZE);
+	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
+	xe_guc_buf_release(buf);
+}
+
+static struct kunit_case guc_buf_test_cases[] = {
+	KUNIT_CASE(test_basic),
+	KUNIT_CASE(test_full),
+	KUNIT_CASE(test_reuse),
+	KUNIT_CASE(test_flush),
+	KUNIT_CASE(test_sync),
+	KUNIT_CASE(test_chunks),
+	KUNIT_CASE(test_isolated),
+	KUNIT_CASE(test_lookup),
+	KUNIT_CASE(test_data),
+	KUNIT_CASE(test_class),
+	KUNIT_CASE(test_class_from_data),
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
index a49be711ea86..6c21d216cec2 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.c
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -385,3 +385,7 @@ u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *p
 
 	return xe_bo_ggtt_addr(cache->bo) + offset;
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_guc_buf_kunit.c"
+#endif
-- 
2.43.0

