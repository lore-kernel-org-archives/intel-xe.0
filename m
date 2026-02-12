Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DACEE369E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 16:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8105A10E788;
	Thu, 12 Feb 2026 16:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZiFUk4OV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BEE10E771
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 16:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770914111; x=1802450111;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KqHx4DCBrwKNvFYcP1EXutjAojMCrcKwPWZkyxBOlzI=;
 b=ZiFUk4OVdvRjpblui2dHxCpCDGaWi6LVj4mLPDMxnsskvkOt6volx1xf
 ANqnpdY0kUpFMtptlfIKk/FNlLzn3avD38+i8vcFM+0Rk70zG7DlADq42
 ArDP3wRAbCfAFZFjZ7D72cT9VmFO+bAa1f4ZGAXr6IahDOWk3qRgxw87y
 IBURJVQ/HWZrmZusTt4bWjg3iPJjMomcIYLN/Ui9u/HNZBpUTD/cZsPY1
 gaOGUYjlxGfeforb4P7DbkMG84sZuwbOic8qMH63+0hO6fPZ5aO8E1sqC
 uh3Jh2TbkawjY/F+oxZ1/Ue2N/eAkESRuVI840kH7wEIyTDJlNvSpF/En Q==;
X-CSE-ConnectionGUID: g0RIg+iiQ4OTEz696dxlBQ==
X-CSE-MsgGUID: V/EdOkKpRyi6CCv1+WkYaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89498581"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="89498581"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 08:35:09 -0800
X-CSE-ConnectionGUID: wrk3CZr9SG61fzQidy00hQ==
X-CSE-MsgGUID: 5R1dzeb3TZejZDaUkyAHlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="235634041"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 08:35:07 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH 6/7] drm/xe: Add routine to dump allocated VRAM blocks
Date: Thu, 12 Feb 2026 22:04:46 +0530
Message-ID: <20260212163439.1514363-15-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212163439.1514363-9-tejas.upadhyay@intel.com>
References: <20260212163439.1514363-9-tejas.upadhyay@intel.com>
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
instance in the drm/xe driver, new api is introduced. While existing structs
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

V2: remove unused code

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 30 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  3 +++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 82d11348e5ce..cb3394000e83 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -505,6 +505,36 @@ static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
 	return s1 <= s2 && e1 <= e2;
 }
 
+void xe_ttm_vram_dump_allocated_blocks(struct drm_device *dev, struct drm_buddy *mm,
+				       struct drm_printer *p)
+{
+	struct drm_buddy_block *block;
+	LIST_HEAD(dfs);
+	int i;
+
+	for (i = 0; i < mm->n_roots; ++i)
+		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
+
+	do {
+		block = list_first_entry_or_null(&dfs,
+						 struct drm_buddy_block,
+						 tmp_link);
+		if (!block)
+			break;
+
+		list_del(&block->tmp_link);
+
+		if (drm_buddy_block_is_allocated(block))
+			drm_buddy_block_print(mm, block, p);
+
+		if (drm_buddy_block_is_split(block)) {
+			list_add(&block->right->tmp_link, &dfs);
+			list_add(&block->left->tmp_link, &dfs);
+		}
+	} while (1);
+}
+EXPORT_SYMBOL(xe_ttm_vram_dump_allocated_blocks);
+
 static struct ttm_buffer_object *xe_ttm_vram_addr_to_tbo(struct drm_buddy *mm, u64 start)
 {
 	struct drm_buddy_block *block;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index 1d6075411ebf..5872e8b48779 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -12,6 +12,7 @@ enum dma_data_direction;
 struct xe_device;
 struct xe_tile;
 struct xe_vram_region;
+struct drm_device;
 
 int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 			   u32 mem_type, u64 size, u64 io_size,
@@ -31,6 +32,8 @@ u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
 void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 			  u64 *used, u64 *used_visible);
 int xe_ttm_tbo_handle_addr_fault(struct xe_tile *tile, unsigned long addr);
+void xe_ttm_vram_dump_allocated_blocks(struct drm_device *dev, struct drm_buddy *mm,
+				       struct drm_printer *p);
 static inline struct xe_ttm_vram_mgr_resource *
 to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
 {
-- 
2.52.0

