Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A24CD3442
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 14:12:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2E210EDCC;
	Wed,  6 May 2026 14:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DupauNQt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCF710EDC4
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 14:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778076736; x=1809612736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PNrurzVC6IAIr+GrFI0K2DR7iqWbSkFORn+VdDWm2Vs=;
 b=DupauNQtmNRkcLLkhUfvIQYJx4xRJmBJ28U32xHiWEaf16D2yJ5kAx/0
 w4akv4kPrFWEpMfWs0SlwDa1vUWyfS6lWTX3zgsm3PfYbelYrYf9mGRrr
 fRTzrYoGd4cfH4ZB7tBjSbpgJ0qWOzgN6GbuGn0enuojRD/TH3SBWrVlJ
 ZXc8HzpMl1rzYazavAJS2Bord7woW9pwoIQKaUZuf8tixKH1x0Cljrgv1
 MM9wciLWhau4aaNvmQ7OPpmepEwQOszgxx03ZahtmAGlZ3fVjl23w9Ir0
 EP6BF+TUcXmsAdlnY+KjzlVgJ7OtI7rzOAEwwWQ4nrE5AQUoLUa2/XJco A==;
X-CSE-ConnectionGUID: 7Kab+VB9QqqxhDmikKKKzA==
X-CSE-MsgGUID: as4a2CZFSEGo0oAfphIjaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="96577108"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="96577108"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 07:12:16 -0700
X-CSE-ConnectionGUID: BHhI/dm0TQGhpZsgffHf7A==
X-CSE-MsgGUID: gWbJ8eLpTzSSrfmQer8wCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="233057134"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 07:12:14 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V9 08/10] gpu/buddy: Add routine to dump allocated buddy
 blocks
Date: Wed,  6 May 2026 19:41:49 +0530
Message-ID: <20260506141143.4033299-20-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260506141143.4033299-12-tejas.upadhyay@intel.com>
References: <20260506141143.4033299-12-tejas.upadhyay@intel.com>
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

[  +0.000003] xe 0000:03:00.0: [drm] 0x00000002f8000000-0x00000002f8800000: 8388608
[  +0.000005] xe 0000:03:00.0: [drm] 0x00000002f8800000-0x00000002f8840000: 262144
[  +0.000004] xe 0000:03:00.0: [drm] 0x00000002f8840000-0x00000002f8860000: 131072
[  +0.000004] xe 0000:03:00.0: [drm] 0x00000002f8860000-0x00000002f8870000: 65536
[  +0.000005] xe 0000:03:00.0: [drm] 0x00000002f9000000-0x00000002f9800000: 8388608
[  +0.000004] xe 0000:03:00.0: [drm] 0x00000002f9800000-0x00000002f9880000: 524288
[  +0.000005] xe 0000:03:00.0: [drm] 0x00000002f9880000-0x00000002f9884000: 16384
[  +0.000004] xe 0000:03:00.0: [drm] 0x00000002f9900000-0x00000002f9980000: 524288
[  +0.000005] xe 0000:03:00.0: [drm] 0x00000002f9980000-0x00000002f9988000: 32768
[  +0.000004] xe 0000:03:00.0: [drm] 0x00000002f9988000-0x00000002f998c000: 16384

v2(MattB):
- Add lockdep assert

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/buddy.c       | 43 +++++++++++++++++++++++++++++++++++++++
 include/linux/gpu_buddy.h |  1 +
 2 files changed, 44 insertions(+)

diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
index 44bf926aca56..09aa4a33f928 100644
--- a/drivers/gpu/buddy.c
+++ b/drivers/gpu/buddy.c
@@ -10,6 +10,7 @@
 #include <linux/sizes.h>
 
 #include <linux/gpu_buddy.h>
+#include <drm/drm_print.h>
 
 /**
  * gpu_buddy_assert - assert a condition in the buddy allocator
@@ -1295,6 +1296,48 @@ int gpu_buddy_block_trim(struct gpu_buddy *mm,
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
+	int i;
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
+		if (gpu_buddy_block_is_allocated(block))
+			gpu_buddy_block_print(mm, block);
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
index e42c38a2a9f5..2834ea06da56 100644
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

