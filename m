Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D97CA9EC9
	for <intel-xe@archiver.kernel.org>; Sun, 11 Oct 2026 11:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AC510E13C;
	Sun, 11 Oct 2026 11:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iEUEF34D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE0D10E057
 for <intel-xe@lists.freedesktop.org>; Sun, 11 Oct 2026 11:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791718029; x=1823254029;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d7P7w+71wFgmbEs1BFU1hnPGOtyjKVUd55SXZZ0SuAg=;
 b=iEUEF34Dzcd8ifuTndyh2QaRwp0yknJmewnDArA0YtGJD/lFaUjqcEfk
 bbJmnaYFg56rK/2NUrtvXtb7cdFlH/6VVzQHRVp6X1Z4gxkzcn+yHwm77
 FOV4nwT+nRdJ3pX0w/QKpQ1Us8oBd3FQD5JgVJhow6G+DJ1eaqgODW4rU
 XYSWKKp1JqVDehAnJHtbTOgFjk4DKwPgysSjSRCaa9ZqM8R/uTrSVB0gg
 ZkNmhC1XXk3V9n5jvk8osuILZ7s7RHEtnN8JWAxBQZ4hOy+Fkfcek0ynb
 NB2R/XGK8zRm6X/UFo1sQ7xfQFRrP6UFod8HUxO6Apt2U/7ZAOdmhu2h3 Q==;
X-CSE-ConnectionGUID: 1pap+4mGRKuG226iXq1gXw==
X-CSE-MsgGUID: DhJwtsAgTZWBQMC7uWEfkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="326336"
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="326336"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 04:27:08 -0700
X-CSE-ConnectionGUID: T/XSPejySjKIPg1tkaXQZg==
X-CSE-MsgGUID: pV1ekgQQSr2vJppPV3rrIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="643590"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 04:27:07 -0700
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] [CI][DONOT-REVIEW] gpu/buddy: Prune exhausted subtrees in
 range-biased allocation
Date: Sun, 11 Oct 2026 16:51:18 +0530
Message-ID: <20261011112117.1170859-3-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
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

__alloc_range_bias() looks up a free block inside [start, end) with a
DFS over the buddy tree, descending the right (higher-address) child
first. A block is skipped only if it is too small, outside the range,
or itself ALLOCATED. A SPLIT block is always descended, even when every
block below it is allocated.

Top-down placement packs range allocations right below @end, so once N
blocks are allocated, every new allocation walks the whole allocated
region (~2N blocks) before reaching free space. The total cost of N
allocations is O(N^2), all under the driver's allocator lock.

This is easily hit on small-BAR configurations, where drivers
restrict CPU-visible BOs and page tables to the BAR-mapped prefix of
VRAM using GPU_BUDDY_RANGE_ALLOCATION. On a device with 32 GiB visible
out of 160 GiB VRAM, xe_pat@pt-caching-random-offsets performs ~130k
4K range allocations.

Track the largest free order in each block's subtree and update it during
free, split and allocation state changes. Use this metadata to skip
subtrees that cannot satisfy the requested order. Also restore ancestor
metadata after gpu_buddy_block_trim() reconnects a temporarily detached
block.

  n_alloc    avg blocks   visited          avg allocation time

             without fix   with fix         without fix  with fix
     4096          4141        46            10.7 us    0.293 us
    65536        127041        48             536 us    0.259 us
   126976        249911        47            1.46 ms    0.283 us

Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 drivers/gpu/buddy.c       | 39 +++++++++++++++++++++++++++++++++++++++
 include/linux/gpu_buddy.h |  7 +++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
index 2f2aaadafe35..6352cdd63be6 100644
--- a/drivers/gpu/buddy.c
+++ b/drivers/gpu/buddy.c
@@ -602,6 +602,8 @@ static struct gpu_buddy_block *gpu_block_alloc(struct gpu_buddy *mm,
 	block->header = offset;
 	block->header |= order;
 	block->parent = parent;
+	/* Not FREE until __mark_free(), which then propagates its order */
+	block->subtree_max_free_order = GPU_BUDDY_NO_FREE_ORDER;
 
 	RB_CLEAR_NODE(&block->rb);
 
@@ -717,6 +719,32 @@ static void rbtree_remove(struct gpu_buddy *mm,
 	RB_CLEAR_NODE(&block->rb);
 }
 
+/*
+ * Recompute subtree_max_free_order for @block and its ancestors. Callers must
+ * invoke this after every state change of @block, so that all other blocks are
+ * already consistent and the walk can stop at the first unchanged ancestor.
+ */
+static void update_subtree_max_free_order(struct gpu_buddy_block *block)
+{
+	while (block) {
+		s8 max_free;
+
+		if (gpu_buddy_block_is_free(block))
+			max_free = gpu_buddy_block_order(block);
+		else if (gpu_buddy_block_is_split(block))
+			max_free = max(block->left->subtree_max_free_order,
+				       block->right->subtree_max_free_order);
+		else
+			max_free = GPU_BUDDY_NO_FREE_ORDER;
+
+		if (block->subtree_max_free_order == max_free)
+			break;
+
+		block->subtree_max_free_order = max_free;
+		block = block->parent;
+	}
+}
+
 static void mark_allocated(struct gpu_buddy *mm,
 			   struct gpu_buddy_block *block)
 {
@@ -729,6 +757,7 @@ static void mark_allocated(struct gpu_buddy *mm,
 	mm->used_scoreboard[gpu_buddy_block_order(block)]++;
 
 	rbtree_remove(mm, block);
+	update_subtree_max_free_order(block);
 }
 
 static void __mark_free(struct gpu_buddy *mm,
@@ -750,6 +779,7 @@ static void __mark_free(struct gpu_buddy *mm,
 	mm->free_scoreboard[gpu_buddy_block_order(block)]++;
 
 	rbtree_insert(mm, block);
+	update_subtree_max_free_order(block);
 }
 
 static void mark_free(struct gpu_buddy *mm,
@@ -772,6 +802,7 @@ static void mark_split(struct gpu_buddy *mm,
 	mm->free_scoreboard[gpu_buddy_block_order(block)]--;
 
 	rbtree_remove(mm, block);
+	update_subtree_max_free_order(block);
 }
 
 static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
@@ -869,6 +900,8 @@ int gpu_buddy_init(struct gpu_buddy *mm, u64 size, u64 chunk_size)
 
 	size = round_down(size, chunk_size);
 
+	BUILD_BUG_ON(GPU_BUDDY_MAX_ORDER > S8_MAX);
+
 	mm->size = size;
 	mm->avail = size;
 	mm->chunk_size = chunk_size;
@@ -1280,6 +1313,10 @@ __alloc_range_bias(struct gpu_buddy *mm,
 		if (gpu_buddy_block_order(block) < order)
 			continue;
 
+		/* Nothing below can satisfy @order: no split or return possible */
+		if (block->subtree_max_free_order < (int)order)
+			continue;
+
 		block_start = gpu_buddy_block_offset(block);
 		block_end = block_start + gpu_buddy_block_size(mm, block) - 1;
 
@@ -1881,6 +1918,8 @@ int gpu_buddy_block_trim(struct gpu_buddy *mm,
 	}
 
 	block->parent = parent;
+	/* Changes made while detached did not reach the ancestors */
+	update_subtree_max_free_order(parent);
 	return err;
 }
 EXPORT_SYMBOL(gpu_buddy_block_trim);
diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
index ddc4eca84175..8037f5a0feb1 100644
--- a/include/linux/gpu_buddy.h
+++ b/include/linux/gpu_buddy.h
@@ -141,8 +141,15 @@ struct gpu_buddy_block {
 	unsigned int subtree_max_alignment;
 	struct list_head tmp_link;
 	bool has_clear;
+	/*
+	 * Largest order of any FREE block in this block's buddy subtree, or
+	 * GPU_BUDDY_NO_FREE_ORDER if none. Protected by the driver lock.
+	 */
+	s8 subtree_max_free_order;
 };
 
+#define GPU_BUDDY_NO_FREE_ORDER (-1)
+
 /* Order-zero must be at least SZ_4K */
 #define GPU_BUDDY_MAX_ORDER (63 - 12)
 
-- 
2.52.0

