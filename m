Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44402CA9EBD
	for <intel-xe@archiver.kernel.org>; Sun, 11 Oct 2026 11:27:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F410510E057;
	Sun, 11 Oct 2026 11:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnAVACcR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA36710E057
 for <intel-xe@lists.freedesktop.org>; Sun, 11 Oct 2026 11:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791718030; x=1823254030;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=m8++pQ19AmIlhpLC5WVM1aFq9HlY0fjVGsvFHxfQeZs=;
 b=BnAVACcR9GREDMV2QSY0K2uMm8c1uwZ1QmyP0hD4YHRBLaNsgvXj2dkO
 +Pm3b3E96qso2TM98lkucDv5oASrI9r0ZaBLDafC/lY+OPpIAazivFgNJ
 sD2ulvZJvPbAST1lmBO5fo/s8P8BmTcHAWS12KvIj2gnycnJHIDPTFsE0
 +pW6at1CnZs8SvhuqxOKbhn58FkLYgFjHyzNcI49O1Y5ZOdfmRJOuLA9r
 ZOHuE7BoJpUV+DbBlOtMCZHBCV7nyp9k1vj6vV6ixkxw0DINKI44pieFB
 BXsCpttwCSjcpx3WwvKJY++QbSs8BzAsewWxvYzIotIKqoMktkiU2p7W3 g==;
X-CSE-ConnectionGUID: 7Fg7Kw4CSoa6T1xk2YA1fg==
X-CSE-MsgGUID: Gco/Z5BSSKWN8luK54TtlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="326338"
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="326338"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 04:27:09 -0700
X-CSE-ConnectionGUID: AEtqlaGvQsumSsMe8oadcg==
X-CSE-MsgGUID: /He/ubydTVKdRbrXLdU8SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="643593"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 04:27:08 -0700
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] [CI][DONOT-REVIEW] gpu/tests/buddy: Add range-bias
 pruning and free-order tracking tests
Date: Sun, 11 Oct 2026 16:51:19 +0530
Message-ID: <20261011112117.1170859-4-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261011112117.1170859-3-sanjay.kumar.yadav@intel.com>
References: <20261011112117.1170859-3-sanjay.kumar.yadav@intel.com>
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

Add two KUnit cases for subtree_max_free_order and the pruning in
__alloc_range_bias().

gpu_test_buddy_range_bias_pruning reproduces the small-BAR pattern:
32768 order-0 range allocations confined to the low 128 MiB of a
512 MiB manager.

The free-order test validates metadata after root creation, split,
allocation, free, coalescing, exact-range allocation, clear allocation,
contiguous allocation and gpu_buddy_block_trim().

Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 drivers/gpu/tests/gpu_buddy_test.c | 275 +++++++++++++++++++++++++++++
 1 file changed, 275 insertions(+)

diff --git a/drivers/gpu/tests/gpu_buddy_test.c b/drivers/gpu/tests/gpu_buddy_test.c
index b75d32ca6ca0..bdf480d782be 100644
--- a/drivers/gpu/tests/gpu_buddy_test.c
+++ b/drivers/gpu/tests/gpu_buddy_test.c
@@ -1586,6 +1586,279 @@ static void gpu_test_buddy_addr_to_block(struct kunit *test)
 	gpu_buddy_fini(&mm);
 }
 
+static bool gpu_test_block_is_split(struct gpu_buddy_block *block)
+{
+	return (block->header & GPU_BUDDY_HEADER_STATE) == GPU_BUDDY_SPLIT;
+}
+
+/*
+ * Check every block's subtree_max_free_order against its own state and its
+ * children's values. Holding locally at every node implies, by induction from
+ * the leaves, that the whole tree is exact.
+ */
+static void gpu_test_check_free_order(struct kunit *test, struct gpu_buddy *mm)
+{
+	struct gpu_buddy_block *block, *bad = NULL;
+	unsigned int nr_bad = 0;
+	s8 expected, bad_expected = 0;
+	LIST_HEAD(dfs);
+	unsigned int i;
+
+	for (i = 0; i < mm->n_roots; i++)
+		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
+
+	while ((block = list_first_entry_or_null(&dfs, struct gpu_buddy_block,
+						 tmp_link))) {
+		list_del(&block->tmp_link);
+
+		if (gpu_buddy_block_is_free(block)) {
+			expected = gpu_buddy_block_order(block);
+		} else if (gpu_test_block_is_split(block)) {
+			expected = max(block->left->subtree_max_free_order,
+				       block->right->subtree_max_free_order);
+			list_add(&block->right->tmp_link, &dfs);
+			list_add(&block->left->tmp_link, &dfs);
+		} else {
+			expected = GPU_BUDDY_NO_FREE_ORDER;
+		}
+
+		if (block->subtree_max_free_order != expected && !nr_bad++) {
+			bad = block;
+			bad_expected = expected;
+		}
+	}
+
+	KUNIT_EXPECT_EQ_MSG(test, nr_bad, 0U,
+			    "first stale block: offset=%#llx order=%u stored=%d expected=%d",
+			    bad ? gpu_buddy_block_offset(bad) : 0,
+			    bad ? gpu_buddy_block_order(bad) : 0,
+			    bad ? bad->subtree_max_free_order : 0, bad_expected);
+}
+
+/* Return the block of @order covering @offset, or NULL if it does not exist */
+static struct gpu_buddy_block *
+gpu_test_find_block(struct gpu_buddy *mm, u64 offset, unsigned int order)
+{
+	struct gpu_buddy_block *block;
+	unsigned int i;
+
+	for (i = 0; i < mm->n_roots; i++) {
+		u64 start;
+
+		block = mm->roots[i];
+		start = gpu_buddy_block_offset(block);
+		if (offset < start || offset >= start + gpu_buddy_block_size(mm, block))
+			continue;
+
+		while (gpu_buddy_block_order(block) > order) {
+			if (!gpu_test_block_is_split(block))
+				return NULL;
+			block = offset < gpu_buddy_block_offset(block->right) ?
+				block->left : block->right;
+		}
+		return block;
+	}
+
+	return NULL;
+}
+
+static struct gpu_buddy_block *
+gpu_test_take_block(struct list_head *blocks, u64 offset)
+{
+	struct gpu_buddy_block *block;
+
+	list_for_each_entry(block, blocks, link) {
+		if (gpu_buddy_block_offset(block) == offset) {
+			list_del(&block->link);
+			return block;
+		}
+	}
+
+	return NULL;
+}
+
+static void gpu_test_buddy_range_bias_pruning(struct kunit *test)
+{
+	const u64 mm_size = SZ_512M, range_end = SZ_128M, chunk = SZ_4K;
+	const unsigned int nr = range_end / chunk, window = 1024;
+	const u64 holes[] = { 0, range_end / 2 + 3 * chunk };
+	struct gpu_buddy_block *block;
+	u64 first_ns = 0, last_ns = 0;
+	unsigned int i, misplaced = 0;
+	LIST_HEAD(allocated);
+	struct gpu_buddy mm;
+	LIST_HEAD(tmp);
+
+	KUNIT_ASSERT_FALSE_MSG(test, gpu_buddy_init(&mm, mm_size, chunk),
+			       "buddy_init failed\n");
+
+	/*
+	 * Small-BAR pattern: order-0 allocations confined to a low prefix of a
+	 * larger manager. Top-down placement packs them right below range_end,
+	 * so without pruning every allocation walks all previously allocated
+	 * blocks and the total cost is quadratic.
+	 */
+	for (i = 0; i < nr; i++) {
+		ktime_t start = ktime_get();
+		u64 elapsed;
+		int err;
+
+		err = gpu_buddy_alloc_blocks(&mm, 0, range_end, chunk, chunk,
+					     &allocated, GPU_BUDDY_RANGE_ALLOCATION);
+		elapsed = ktime_to_ns(ktime_sub(ktime_get(), start));
+		KUNIT_ASSERT_EQ_MSG(test, err, 0, "range alloc %u failed\n", i);
+
+		if (i < window)
+			first_ns += elapsed;
+		else if (i >= nr - window)
+			last_ns += elapsed;
+
+		block = list_last_entry(&allocated, struct gpu_buddy_block, link);
+		if (gpu_buddy_block_offset(block) != range_end - (u64)(i + 1) * chunk)
+			misplaced++;
+	}
+
+	kunit_info(test, "first %u range allocs: %llu us, last %u: %llu us\n",
+		   window, first_ns / NSEC_PER_USEC, window, last_ns / NSEC_PER_USEC);
+
+	/* Top-down placement inside the range is unchanged */
+	KUNIT_EXPECT_EQ(test, misplaced, 0U);
+
+	/* The exhausted range advertises no free space, so it is pruned */
+	block = gpu_test_find_block(&mm, 0, ilog2(range_end / chunk));
+	KUNIT_ASSERT_NOT_NULL(test, block);
+	KUNIT_EXPECT_EQ(test, block->subtree_max_free_order, GPU_BUDDY_NO_FREE_ORDER);
+	gpu_test_check_free_order(test, &mm);
+
+	/* Per-allocation cost must not grow with the number of allocated blocks */
+	KUNIT_EXPECT_LE(test, last_ns, 8 * first_ns + 50 * NSEC_PER_MSEC);
+
+	KUNIT_EXPECT_EQ(test, gpu_buddy_alloc_blocks(&mm, 0, range_end, chunk, chunk,
+						     &tmp, GPU_BUDDY_RANGE_ALLOCATION),
+			-ENOSPC);
+
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_alloc_blocks(&mm, 0, mm_size, chunk, chunk,
+							&tmp, 0));
+	block = list_first_entry(&tmp, struct gpu_buddy_block, link);
+	KUNIT_EXPECT_GE(test, gpu_buddy_block_offset(block), range_end);
+	gpu_buddy_free_list(&mm, &tmp, 0);
+
+	/* A single hole, including the very last one in walk order, is found */
+	for (i = 0; i < ARRAY_SIZE(holes); i++) {
+		block = gpu_test_take_block(&allocated, holes[i]);
+		KUNIT_ASSERT_NOT_NULL(test, block);
+		gpu_buddy_free_block(&mm, block);
+		gpu_test_check_free_order(test, &mm);
+
+		KUNIT_ASSERT_FALSE(test, gpu_buddy_alloc_blocks(&mm, 0, range_end,
+								chunk, chunk, &allocated,
+								GPU_BUDDY_RANGE_ALLOCATION));
+		block = list_last_entry(&allocated, struct gpu_buddy_block, link);
+		KUNIT_EXPECT_EQ(test, gpu_buddy_block_offset(block), holes[i]);
+	}
+
+	gpu_buddy_free_list(&mm, &allocated, 0);
+	gpu_test_check_free_order(test, &mm);
+	KUNIT_EXPECT_EQ(test, mm.roots[0]->subtree_max_free_order, (s8)mm.max_order);
+
+	gpu_buddy_fini(&mm);
+}
+
+static void gpu_test_buddy_free_order_tracking(struct kunit *test)
+{
+	const u64 chunk = SZ_4K;
+	struct gpu_buddy_block *block;
+	LIST_HEAD(allocated);
+	struct gpu_buddy mm;
+	LIST_HEAD(big);
+	unsigned int i;
+
+	/* Root creation: every root advertises its own order */
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, SZ_8M + SZ_2M + SZ_64K, chunk));
+	KUNIT_EXPECT_EQ(test, mm.n_roots, 3U);
+	for (i = 0; i < mm.n_roots; i++)
+		KUNIT_EXPECT_EQ(test, mm.roots[i]->subtree_max_free_order,
+				(s8)gpu_buddy_block_order(mm.roots[i]));
+	gpu_test_check_free_order(test, &mm);
+	gpu_buddy_fini(&mm);
+
+	/* Split and FREE -> ALLOCATED for 4K range allocations */
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, SZ_16M, chunk));
+	for (i = 0; i < SZ_4M / chunk; i++)
+		KUNIT_ASSERT_FALSE(test, gpu_buddy_alloc_blocks(&mm, 0, SZ_4M, chunk, chunk,
+								&allocated,
+								GPU_BUDDY_RANGE_ALLOCATION));
+	gpu_test_check_free_order(test, &mm);
+
+	/* Partial coalescing up to order 3 must not satisfy a 64K request */
+	for (i = 0; i < SZ_64K / chunk - 1; i++) {
+		block = gpu_test_take_block(&allocated, SZ_1M + i * chunk);
+		KUNIT_ASSERT_NOT_NULL(test, block);
+		gpu_buddy_free_block(&mm, block);
+	}
+	gpu_test_check_free_order(test, &mm);
+	KUNIT_EXPECT_EQ(test, gpu_buddy_alloc_blocks(&mm, 0, SZ_4M, SZ_64K, SZ_64K, &big,
+						     GPU_BUDDY_RANGE_ALLOCATION),
+			-ENOSPC);
+	gpu_test_check_free_order(test, &mm);
+
+	/* SPLIT -> FREE: the last buddy coalesces the window into a 64K block */
+	block = gpu_test_take_block(&allocated, SZ_1M + SZ_64K - chunk);
+	KUNIT_ASSERT_NOT_NULL(test, block);
+	gpu_buddy_free_block(&mm, block);
+	gpu_test_check_free_order(test, &mm);
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_alloc_blocks(&mm, 0, SZ_4M, SZ_64K, SZ_64K, &big,
+							GPU_BUDDY_RANGE_ALLOCATION));
+	block = list_last_entry(&big, struct gpu_buddy_block, link);
+	KUNIT_EXPECT_EQ(test, gpu_buddy_block_offset(block), (u64)SZ_1M);
+	KUNIT_EXPECT_EQ(test, gpu_buddy_block_size(&mm, block), (u64)SZ_64K);
+	gpu_test_check_free_order(test, &mm);
+
+	/* Exact-range allocation */
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_alloc_blocks(&mm, SZ_8M, SZ_8M + SZ_256K,
+							SZ_256K, chunk, &big, 0));
+	gpu_test_check_free_order(test, &mm);
+
+	/* Cleared frees, clear range allocation and top-down allocation */
+	gpu_buddy_free_list(&mm, &big, GPU_BUDDY_CLEARED);
+	gpu_test_check_free_order(test, &mm);
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_alloc_blocks(&mm, SZ_4M, SZ_16M, SZ_128K, chunk,
+							&big,
+							GPU_BUDDY_RANGE_ALLOCATION |
+							GPU_BUDDY_CLEAR_ALLOCATION));
+	gpu_test_check_free_order(test, &mm);
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_alloc_blocks(&mm, 0, SZ_16M, SZ_1M, chunk, &big,
+							GPU_BUDDY_TOPDOWN_ALLOCATION));
+	gpu_test_check_free_order(test, &mm);
+
+	gpu_buddy_free_list(&mm, &big, 0);
+	gpu_buddy_free_list(&mm, &allocated, 0);
+	gpu_test_check_free_order(test, &mm);
+	KUNIT_EXPECT_EQ(test, mm.roots[0]->subtree_max_free_order, (s8)mm.max_order);
+	gpu_buddy_fini(&mm);
+
+	/*
+	 * Contiguous non-power-of-two allocations are trimmed, which re-allocates
+	 * inside a temporarily detached block. Ancestors must still be updated.
+	 */
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, SZ_32K, chunk));
+	for (i = 0; i < 2; i++) {
+		KUNIT_ASSERT_FALSE(test, gpu_buddy_alloc_blocks(&mm, 0, SZ_32K,
+								SZ_8K + SZ_4K, chunk,
+								&allocated,
+								GPU_BUDDY_CONTIGUOUS_ALLOCATION));
+		gpu_test_check_free_order(test, &mm);
+	}
+	KUNIT_EXPECT_EQ(test, mm.roots[0]->subtree_max_free_order, (s8)0);
+	KUNIT_EXPECT_EQ(test, gpu_buddy_alloc_blocks(&mm, 0, SZ_32K, SZ_8K, SZ_8K, &big,
+						     GPU_BUDDY_RANGE_ALLOCATION),
+			-ENOSPC);
+
+	gpu_buddy_free_list(&mm, &allocated, 0);
+	gpu_test_check_free_order(test, &mm);
+	gpu_buddy_fini(&mm);
+}
+
 static int gpu_buddy_suite_init(struct kunit_suite *suite)
 {
 	while (!random_seed)
@@ -1612,6 +1885,8 @@ static struct kunit_case gpu_buddy_tests[] = {
 	KUNIT_CASE(gpu_test_buddy_offset_aligned_allocation),
 	KUNIT_CASE(gpu_test_buddy_subtree_offset_alignment_stress),
 	KUNIT_CASE(gpu_test_buddy_addr_to_block),
+	KUNIT_CASE(gpu_test_buddy_range_bias_pruning),
+	KUNIT_CASE(gpu_test_buddy_free_order_tracking),
 	{}
 };
 
-- 
2.52.0

