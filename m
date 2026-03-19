Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309B61075265
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 06:54:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E340410E8BE;
	Thu, 19 Mar 2026 06:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUfYO7F6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB0910E8AA
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 06:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773903246; x=1805439246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aZ1eel8LdO0OiVoXomauYQn+DIya2Hw7VBSXApld578=;
 b=VUfYO7F649vgbGeT89N9ucw9rBMcOV3Pspb8jiefE6rr31IywJyrLsjd
 BdJMZj0Xsau/zc23M2c5AbgBoOy2PLpKNOedcIXXVbYeBPk2OgsuArwve
 x5PWWhpfISP8vng0sjvGHEb6ckkjOVV2lqFFbQdJdxNtJWzzkdYcOf+r3
 /luJY9UhxxLAcBAnJYJXBj6gQJhErZ8WgBRIksReN3Mo/A6EZ8Zb0kzcY
 ls2Jy6iXGxPPC1ZVOVLAKHv6JZdGuqSMth5Yq2tuBzIvGT+PK0eQvcr01
 FRLqNKZQ4kAdWYm0F7KePZMPwKPJAL8jee7L88DOXjubFG2mXHf4YzxDK g==;
X-CSE-ConnectionGUID: 2r+TQmk2S1SOGfFri0GScg==
X-CSE-MsgGUID: +pByoMhQQPiiYE0nuQx7zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75045679"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="75045679"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 23:54:06 -0700
X-CSE-ConnectionGUID: taeDav29Sfa8YEwBUp43Cw==
X-CSE-MsgGUID: YxT28nAKTZK0RKNwI+hTww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="227571245"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 23:54:04 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V5 5/7] gpu/buddy: Add routine to dump allocated buddy
 blocks
Date: Thu, 19 Mar 2026 12:23:44 +0530
Message-ID: <20260319065340.2531231-14-tejas.upadhyay@intel.com>
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/buddy.c       | 43 +++++++++++++++++++++++++++++++++++++++
 include/linux/gpu_buddy.h |  1 +
 2 files changed, 44 insertions(+)

diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
index 249cc42b5800..6541f5af9626 100644
--- a/drivers/gpu/buddy.c
+++ b/drivers/gpu/buddy.c
@@ -10,6 +10,7 @@
 #include <linux/sizes.h>
 
 #include <linux/gpu_buddy.h>
+#include <drm/drm_print.h>
 
 /**
  * gpu_buddy_assert - assert a condition in the buddy allocator
@@ -1133,6 +1134,48 @@ int gpu_buddy_block_trim(struct gpu_buddy *mm,
 }
 EXPORT_SYMBOL(gpu_buddy_block_trim);
 
+/**
+ * gpu_buddy_dump_allocated_blocks - print all allocated blocks in drm buddy
+ *
+ * @dev: drm device
+ * @mm: DRM buddy manager to look into
+ * @p: drm printer to print info
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
index 4471f3aaf6f2..1e92f2151da6 100644
--- a/include/linux/gpu_buddy.h
+++ b/include/linux/gpu_buddy.h
@@ -224,6 +224,7 @@ int gpu_buddy_block_trim(struct gpu_buddy *mm,
 			 u64 *start,
 			 u64 new_size,
 			 struct list_head *blocks);
+void gpu_buddy_dump_allocated_blocks(struct gpu_buddy *mm);
 
 void gpu_buddy_reset_clear(struct gpu_buddy *mm, bool is_clear);
 
-- 
2.52.0

