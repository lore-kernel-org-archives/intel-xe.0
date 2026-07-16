Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C7BC44501
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 10:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF58910F285;
	Thu, 16 Jul 2026 10:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WO1fMybl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B2410F284
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 10:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784197301; x=1815733301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gakMZDurgFSn/bvlgHjSoDnrF0jGEPzvGIgDOmHcoKc=;
 b=WO1fMyblim3T4ZHqrauETkyvLUiTa+YZgtuo8+48grppCuuaCyg1iCd7
 iM2oVGXu/Ws/jrlX1empYkBZFDcnCGXJCqeR5cuzGbymHlK7mGHFVE++U
 Y0BPn2fcj5hs+P2LEtxY3xb0+WuWMNKwdvSJUrwKtpy1K19fjOyyl65Ri
 eD6iKU2/12cxlPSAwniiQpcC4XUb8mMpToKk3Qfb12yRU0BNY1S2hqNLI
 NePRFzZu7RuBKq7Ak72J4r1svyRNBudDe1aT8Sj4CBc/ip4iYi4o3uE1u
 IYD+nWAUQfPmcenKFvNGiazzPxAG7cbFH6CC4wsPktPq+sy4zQqWy3tjO Q==;
X-CSE-ConnectionGUID: 04oOOs7LRueyTVKBww32+Q==
X-CSE-MsgGUID: Mxz25LXjT+a/xd5vQbTg5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96367781"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="96367781"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:21:40 -0700
X-CSE-ConnectionGUID: BLnb0GAYRtmUbPi53xz+aQ==
X-CSE-MsgGUID: URXjVCYqTa+i7UUXd7IK3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="253833847"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:21:39 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V13 06/11] gpu/buddy: Add routine to dump allocated buddy
 blocks
Date: Thu, 16 Jul 2026 15:51:12 +0530
Message-ID: <20260716102110.1549938-19-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260716102110.1549938-13-tejas.upadhyay@intel.com>
References: <20260716102110.1549938-13-tejas.upadhyay@intel.com>
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

To implement the ability to see allocated blocks under a specific VRAM
instance in the drm driver, new api is introduced. While existing structs
often show the free block list, this addition provides a comprehensive view
of all currently resident VRAM allocations.

Dump will look like,

[  +0.000003] 0x00000002f8000000-0x00000002f8800000: 8388608
[  +0.000005] 0x00000002f8800000-0x00000002f8840000: 262144
[  +0.000004] 0x00000002f8840000-0x00000002f8860000: 131072
[  +0.000004] 0x00000002f8860000-0x00000002f8870000: 65536
[  +0.000005] 0x00000002f9000000-0x00000002f9800000: 8388608
[  +0.000004] 0x00000002f9800000-0x00000002f9880000: 524288
[  +0.000005] 0x00000002f9880000-0x00000002f9884000: 16384
[  +0.000004] 0x00000002f9900000-0x00000002f9980000: 524288
[  +0.000005] 0x00000002f9980000-0x00000002f9988000: 32768
[  +0.000004] 0x00000002f9988000-0x00000002f998c000: 16384

v3(Sashiko):
- Add cond_resched() every 1024 blocks to yield CPU on large VRAM dumps
v2(MattB):
- Add lockdep assert

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/buddy.c       | 46 +++++++++++++++++++++++++++++++++++++++
 include/linux/gpu_buddy.h |  1 +
 2 files changed, 47 insertions(+)

diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
index 315f860f4346..ffacd2069758 100644
--- a/drivers/gpu/buddy.c
+++ b/drivers/gpu/buddy.c
@@ -10,6 +10,7 @@
 #include <linux/sizes.h>
 
 #include <linux/gpu_buddy.h>
+#include <drm/drm_print.h>
 
 /**
  * gpu_buddy_assert - assert a condition in the buddy allocator
@@ -1294,6 +1295,51 @@ int gpu_buddy_block_trim(struct gpu_buddy *mm,
 }
 EXPORT_SYMBOL(gpu_buddy_block_trim);
 
+/**
+ * gpu_buddy_dump_allocated_blocks - print all allocated blocks in drm buddy
+ *
+ * @mm: DRM buddy manager to look into
+ *
+ * Looks into buddy manager for each block and their status and if allocated
+ * print allocated block range and size
+ *
+ * Returns:
+ * void
+ */
+void gpu_buddy_dump_allocated_blocks(struct gpu_buddy *mm)
+{
+	struct gpu_buddy_block *block;
+	LIST_HEAD(dfs);
+	int i, count = 0;
+
+	gpu_buddy_driver_lock_held(mm);
+
+	for (i = 0; i < mm->n_roots; ++i)
+		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
+
+	do {
+		block = list_first_entry_or_null(&dfs,
+						 struct gpu_buddy_block,
+						 tmp_link);
+		if (!block)
+			break;
+
+		list_del(&block->tmp_link);
+
+		if (gpu_buddy_block_is_allocated(block)) {
+			gpu_buddy_block_print(mm, block);
+			if (!(++count % 1024))
+				cond_resched(); /* yield periodically */
+		}
+
+		if (gpu_buddy_block_is_split(block)) {
+			list_add(&block->right->tmp_link, &dfs);
+			list_add(&block->left->tmp_link, &dfs);
+		}
+	} while (1);
+}
+EXPORT_SYMBOL(gpu_buddy_dump_allocated_blocks);
+
 static struct gpu_buddy_block *
 __gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
 			 u64 start, u64 end,
diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
index e7e22fa05ee2..aaebdceb1c44 100644
--- a/include/linux/gpu_buddy.h
+++ b/include/linux/gpu_buddy.h
@@ -267,6 +267,7 @@ int gpu_buddy_block_trim(struct gpu_buddy *mm,
 			 u64 *start,
 			 u64 new_size,
 			 struct list_head *blocks);
+void gpu_buddy_dump_allocated_blocks(struct gpu_buddy *mm);
 
 void gpu_buddy_reset_clear(struct gpu_buddy *mm, bool is_clear);
 
-- 
2.52.0

