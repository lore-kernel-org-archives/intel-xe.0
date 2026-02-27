Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02785FEFB50
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 13:45:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB89310EB75;
	Fri, 27 Feb 2026 13:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MH5j5apU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494BA10EB6F
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 13:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772199926; x=1803735926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j5J+kUsCbhH7dDEhAZHCPHR3dHOYK4CHiQIPp5fPGQc=;
 b=MH5j5apU0pSFoVseO42nYaYvPeaFr8T3Un16LpnEhwEEGxhbSh2ACuj9
 qskIomfNQI49NPwuvY/IwNsAk+J8J8MGFzSlImHi8dcsD5ZBTVtZb+gFQ
 gJH+Nxf0DXLx1+0xOle4aMpcX9mVcT+1LAZKhRGGhAfjhZ0YSg4D4n/2l
 MZXbxDoEvRHl42bGOO0vx4+7wz2HSCdSiQfb8XT5+PlOzlMx2kgxCf3DI
 oLgkSQF/8SwuhtBiNCIZQFamQaA6faPxAqTiBSOvciXRnWmHEDGGY5Zwx
 nTYcDWpVzyMxBAvtDHt5IXo6ZBq9iD0LEOL6U/q0lRiV6Xnuw+0dwWmCp Q==;
X-CSE-ConnectionGUID: bb6+LMoJStKXOOnCjWdYqQ==
X-CSE-MsgGUID: zzIBFMLHRPmILe8OZ9vNfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="84633182"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="84633182"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:45:26 -0800
X-CSE-ConnectionGUID: WJi5gqvjSkqUO+RqAUNRtw==
X-CSE-MsgGUID: DuHLEsYATk+EJ5cJpFc4cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="216021723"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:45:25 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V4 2/7] drm/xe: Implement VRAM object tracking ability
 using physical address
Date: Fri, 27 Feb 2026 19:14:39 +0530
Message-ID: <20260227134453.1814649-11-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227134453.1814649-9-tejas.upadhyay@intel.com>
References: <20260227134453.1814649-9-tejas.upadhyay@intel.com>
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

Implement the capability to track and identify TTM buffer objects
using a specific faulty memory address in VRAM. This functionality
is critical for supporting the memory page offline feature on CRI,
where identified faulty pages must be traced back to their
originating buffer for safe removal.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 75 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  2 +-
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index d6aa61e55f4d..4e852eed5170 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -56,6 +56,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	u64 size, min_page_size;
 	unsigned long lpfn;
 	int err;
+	struct drm_buddy_block *block;
 
 	lpfn = place->lpfn;
 	if (!lpfn || lpfn > man->size >> PAGE_SHIFT)
@@ -137,6 +138,8 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	}
 
 	mgr->visible_avail -= vres->used_visible_size;
+	list_for_each_entry(block, &vres->blocks, link)
+		block->private = tbo;
 	mutex_unlock(&mgr->lock);
 
 	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
@@ -467,3 +470,75 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man)
 
 	return avail;
 }
+
+static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
+{
+	return s1 <= e2 && e1 >= s2;
+}
+
+static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
+{
+	return s1 <= s2 && e1 <= e2;
+}
+
+static struct ttm_buffer_object *xe_ttm_vram_addr_to_tbo(struct drm_buddy *mm, u64 start)
+{
+	struct drm_buddy_block *block;
+	u64 end;
+	LIST_HEAD(dfs);
+	int i;
+
+	end = start + SZ_4K - 1;
+	for (i = 0; i < mm->n_roots; ++i)
+		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
+
+	do {
+		u64 block_start;
+		u64 block_end;
+
+		block = list_first_entry_or_null(&dfs,
+						 struct drm_buddy_block,
+						 tmp_link);
+		if (!block)
+			break;
+
+		list_del(&block->tmp_link);
+
+		block_start = drm_buddy_block_offset(block);
+		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
+
+		if (!overlaps(start, end, block_start, block_end))
+			continue;
+
+		if (contains(start, end, block_start, block_end) &&
+		    !drm_buddy_block_is_split(block)) {
+			if (drm_buddy_block_is_free(block)) {
+				return NULL;
+			} else if (drm_buddy_block_is_allocated(block) && !mm->clear_avail) {
+				struct ttm_buffer_object *tbo = block->private;
+
+				WARN_ON(!tbo);
+				return tbo;
+			}
+		}
+
+		if (drm_buddy_block_is_split(block)) {
+			list_add(&block->right->tmp_link, &dfs);
+			list_add(&block->left->tmp_link, &dfs);
+		}
+	} while (1);
+
+	return NULL;
+}
+
+int xe_ttm_tbo_handle_addr_fault(struct xe_tile *tile, unsigned long addr)
+{
+	struct xe_ttm_vram_mgr *vram_mgr = &tile->mem.vram->ttm;
+	struct drm_buddy mm = vram_mgr->mm;
+	struct ttm_buffer_object *tbo;
+
+	tbo = xe_ttm_vram_addr_to_tbo(&mm, addr);
+
+	return 0;
+}
+EXPORT_SYMBOL(xe_ttm_tbo_handle_addr_fault);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index 87b7fae5edba..1d6075411ebf 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -30,7 +30,7 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man);
 u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
 void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 			  u64 *used, u64 *used_visible);
-
+int xe_ttm_tbo_handle_addr_fault(struct xe_tile *tile, unsigned long addr);
 static inline struct xe_ttm_vram_mgr_resource *
 to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
 {
-- 
2.52.0

