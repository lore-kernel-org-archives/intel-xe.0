Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929BAF43841
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 07:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5949410E845;
	Thu, 16 Apr 2026 07:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8WvWo2o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC6810E845
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 07:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776325840; x=1807861840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/IIxf4lA0CcMfMorxshPUlHd/nH2H5RGCoUsjBASkQ4=;
 b=B8WvWo2oRcycO7cOvAciKT1RrGoCQSQG+0T8FLvn6cl5pRtqEAveyoCu
 wZQ++xQ1frAueGT7iJVE9ab+KQG4x+Lp/X+C5WSORZ6MFH0Wrz59WTM1W
 LwPZJZkgAwCQp+LyZ/pOBSocHnysNQxjzEaw3rP1ovjzqSggv6Dncvkza
 62Wk6ypuGH97lZkfKpcqDnZfI2yfq7gIzvYFETxzGlflq6bRV57ehPxcO
 8vRyy/a1s928m1Zy+4DTyz8jn9OEFrWxkuVs6ViNS8g4Qp8G3i7AZ6Tbm
 6OUizm2nbYlkpngAIhAm79jK5Nd2/j2ow9lSe+oUlPDcnni2pB8Uu9Xmn w==;
X-CSE-ConnectionGUID: aozcLIt6QGyDG/DvuANbfw==
X-CSE-MsgGUID: ICc3JCJyTCirwPghn3BCZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="81188804"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="81188804"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 00:50:40 -0700
X-CSE-ConnectionGUID: w9+8c5s2SqyP/jOrJ0ViNg==
X-CSE-MsgGUID: vwlgHfh7RMmhj+0rxYM4eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235036562"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 00:50:37 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V7 03/10] drm/gpu: Add gpu_buddy_allocated_addr_to_block
 helper
Date: Thu, 16 Apr 2026 13:19:52 +0530
Message-ID: <20260416074958.3722666-15-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260416074958.3722666-12-tejas.upadhyay@intel.com>
References: <20260416074958.3722666-12-tejas.upadhyay@intel.com>
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

Add helper with primary purpose is to efficiently trace a specific
physical memory address back to its corresponding TTM buffer object.

v2:
- %s/gpu_buddy_addr_to_block/gpu_buddy_allocated_addr_to_block(MattA)
- remove clear->avail and split nodes check(MattA)
- Adapt lockdep(MattB)

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/buddy.c       | 53 +++++++++++++++++++++++++++++++++++++++
 include/linux/gpu_buddy.h |  2 ++
 2 files changed, 55 insertions(+)

diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
index 53ff85ac2105..44bf926aca56 100644
--- a/drivers/gpu/buddy.c
+++ b/drivers/gpu/buddy.c
@@ -595,6 +595,59 @@ void gpu_buddy_free_block(struct gpu_buddy *mm,
 }
 EXPORT_SYMBOL(gpu_buddy_free_block);
 
+/**
+ * gpu_buddy_allocated_addr_to_block - given relative address find the allocated block
+ *
+ * @mm: GPU buddy manager
+ * @addr: Relative address
+ *
+ * Returns:
+ * gpu_buddy_block on success, NULL or error code on failure
+ */
+struct gpu_buddy_block *gpu_buddy_allocated_addr_to_block(struct gpu_buddy *mm, u64 addr)
+{
+	struct gpu_buddy_block *block;
+	LIST_HEAD(dfs);
+	u64 end;
+	int i;
+
+	gpu_buddy_driver_lock_held(mm);
+
+	end = addr + SZ_4K - 1;
+	for (i = 0; i < mm->n_roots; ++i)
+		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
+
+	do {
+		u64 block_start;
+		u64 block_end;
+
+		block = list_first_entry_or_null(&dfs,
+						 struct gpu_buddy_block,
+						 tmp_link);
+		if (!block)
+			break;
+
+		list_del(&block->tmp_link);
+
+		block_start = gpu_buddy_block_offset(block);
+		block_end = block_start + gpu_buddy_block_size(mm, block) - 1;
+
+		if (!overlaps(addr, end, block_start, block_end))
+			continue;
+
+		if (gpu_buddy_block_is_allocated(block))
+			return block;
+		else if (gpu_buddy_block_is_free(block))
+			return NULL;
+
+		list_add(&block->right->tmp_link, &dfs);
+		list_add(&block->left->tmp_link, &dfs);
+	} while (1);
+
+	return ERR_PTR(-ENXIO);
+}
+EXPORT_SYMBOL(gpu_buddy_allocated_addr_to_block);
+
 static void __gpu_buddy_free_list(struct gpu_buddy *mm,
 				  struct list_head *objects,
 				  bool mark_clear,
diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
index c174de80ad72..e42c38a2a9f5 100644
--- a/include/linux/gpu_buddy.h
+++ b/include/linux/gpu_buddy.h
@@ -272,6 +272,8 @@ void gpu_buddy_reset_clear(struct gpu_buddy *mm, bool is_clear);
 
 void gpu_buddy_free_block(struct gpu_buddy *mm, struct gpu_buddy_block *block);
 
+struct gpu_buddy_block *gpu_buddy_allocated_addr_to_block(struct gpu_buddy *mm, u64 addr);
+
 void gpu_buddy_free_list(struct gpu_buddy *mm,
 			 struct list_head *objects,
 			 unsigned int flags);
-- 
2.52.0

