Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA0A1075267
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 06:54:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E944310E8A8;
	Thu, 19 Mar 2026 06:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sgx3GDTG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9890B10E880
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 06:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773903239; x=1805439239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gC0cuxN5dft7ZXyFTbjAgHEZHjdGV79AsLRPvzZKcH8=;
 b=Sgx3GDTGIeeCPwqz1ZVmH6h+YQmPtEVKZlZsrrlaNa5p70woIwxu5uCH
 uLjbdujAdz7cLEqVF8yFzyS85jKPyNa6cFGX1tVCs7emlQousUewtU4BF
 G6b1INQJs02vspvyUmmH/F+MHZM9UvD5XOs0/oYwzxrTn2TSH1YpBQY9R
 0OXrCH4dhGuvBSEAgI4+eLDbYvISN2KJrC39xhf/RLD+pyuwwLvQHJM1u
 HUNuZF+byHutUeKWFuT4ad3wRhzyu4vbrTW7QIFOb/OcrzHxcn3NFRyz4
 m7nLL3DnL82nx7FH14APrMKcuP/KrN0B149Vdyt5PtYVjeaZyploAvl6d Q==;
X-CSE-ConnectionGUID: gcJh/0bpTnyT4AHvyY2MpQ==
X-CSE-MsgGUID: 588OBMtfRFeZTkoa9Zx5cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75045675"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="75045675"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 23:53:59 -0700
X-CSE-ConnectionGUID: S2MQlLeISP+MaDa4fudOzA==
X-CSE-MsgGUID: ZnL0HiZ2Sa+dFj1kSU2Q2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="227571232"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 23:53:57 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V5 2/7] drm/gpu: Add gpu_buddy_addr_to_block helper
Date: Thu, 19 Mar 2026 12:23:41 +0530
Message-ID: <20260319065340.2531231-11-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260319065340.2531231-9-tejas.upadhyay@intel.com>
References: <20260319065340.2531231-9-tejas.upadhyay@intel.com>
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/buddy.c       | 56 +++++++++++++++++++++++++++++++++++++++
 include/linux/gpu_buddy.h |  2 ++
 2 files changed, 58 insertions(+)

diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
index da5a1222f46b..249cc42b5800 100644
--- a/drivers/gpu/buddy.c
+++ b/drivers/gpu/buddy.c
@@ -554,6 +554,62 @@ void gpu_buddy_free_block(struct gpu_buddy *mm,
 }
 EXPORT_SYMBOL(gpu_buddy_free_block);
 
+/**
+ * gpu_buddy_addr_to_block - given physical address find a block
+ *
+ * @mm: GPU buddy manager
+ * @addr: Physical address
+ *
+ * Returns:
+ * gpu_buddy_block on success, NULL or error code on failure
+ */
+struct gpu_buddy_block *gpu_buddy_addr_to_block(struct gpu_buddy *mm, u64 addr)
+{
+	struct gpu_buddy_block *block;
+	LIST_HEAD(dfs);
+	u64 end;
+	int i;
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
+		if (contains(addr, end, block_start, block_end) &&
+		    !gpu_buddy_block_is_split(block)) {
+			if (gpu_buddy_block_is_free(block))
+				return NULL;
+			else if (gpu_buddy_block_is_allocated(block) && !mm->clear_avail)
+				return block;
+		}
+
+		if (gpu_buddy_block_is_split(block)) {
+			list_add(&block->right->tmp_link, &dfs);
+			list_add(&block->left->tmp_link, &dfs);
+		}
+	} while (1);
+
+	return ERR_PTR(-ENXIO);
+}
+EXPORT_SYMBOL(gpu_buddy_addr_to_block);
+
 static void __gpu_buddy_free_list(struct gpu_buddy *mm,
 				  struct list_head *objects,
 				  bool mark_clear,
diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
index f1fb6eff604a..4471f3aaf6f2 100644
--- a/include/linux/gpu_buddy.h
+++ b/include/linux/gpu_buddy.h
@@ -229,6 +229,8 @@ void gpu_buddy_reset_clear(struct gpu_buddy *mm, bool is_clear);
 
 void gpu_buddy_free_block(struct gpu_buddy *mm, struct gpu_buddy_block *block);
 
+struct gpu_buddy_block *gpu_buddy_addr_to_block(struct gpu_buddy *mm, u64 addr);
+
 void gpu_buddy_free_list(struct gpu_buddy *mm,
 			 struct list_head *objects,
 			 unsigned int flags);
-- 
2.52.0

