Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52671C677F1
	for <intel-xe@archiver.kernel.org>; Tue, 14 Feb 2023 11:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3654310E892;
	Tue, 14 Feb 2023 11:24:01 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604E910E892
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Feb 2023 11:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676373837; x=1707909837;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tU8pfr+Za2FYWi5s8/YzqHmzLev0zMJ5D5LLgDfK1KA=;
 b=Wr1xq6+Y+WjbOQiuxOSc/VFzSxhYFQr1EFQUYvlDiqeYOiLNnVt3gEry
 HG99FjtBWWKqPTeJrpAV1zidjI1ayHcmKS7ctKg/5TQkj00C6WJ14qq6a
 i1xbJQ8BJ711ZyL8xkqP2VC+J/vkuww7qZxbvkrdh9uTnsTMNG57D4d7e
 G5Z1NGZRYwObULeRJkF4BYX3X8RqYWWyeMQYCIzfAF1Mq9hreNiwjw9bG
 z3pybHpycjiBy493AZdlJmoIixrJplYxFdq2crRFxPCHxwb+3k7IFjAg5
 gNUPyPDNS1iKpYI06T2PRxBG2INBikbXJ8KWv/agdVS+1PItAP6rs+2l5 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="332450065"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="332450065"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:23:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="732863227"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="732863227"
Received: from achurkin-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.18.173])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:23:53 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Feb 2023 11:21:29 +0000
Message-Id: <20230214112136.162380-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214112136.162380-1-matthew.auld@intel.com>
References: <20230214112136.162380-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 08/15] drm/xe/buddy: remove the virtualized start
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

Hopefully not needed anymore. We can add a .compatible() hook once we
need to differentiate between mappable and non-mappable vram. If the
allocation is not contiguous then the start value is kind of
meaningless, so rather just mark as invalid.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           |  5 +++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 29 ++++++++++++++--------------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 98716b56498f..ef8c65df7659 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -663,6 +663,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 				void *new_addr = gt->mem.vram.mapping +
 					(new_mem->start << PAGE_SHIFT);
 
+				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
+					ret = -EINVAL;
+					goto out;
+				}
+
 				XE_BUG_ON(new_mem->start !=
 					  bo->placements->fpfn);
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index c7e21673b8fd..b70ce3a48905 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -54,7 +54,6 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	struct xe_ttm_vram_mgr_resource *vres;
 	u64 size, remaining_size, lpfn, fpfn;
 	struct drm_buddy *mm = &mgr->mm;
-	struct drm_buddy_block *block;
 	unsigned long pages_per_block;
 	int r;
 
@@ -186,24 +185,24 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 			list_splice_tail(trim_list, &vres->blocks);
 	}
 
-	vres->base.start = 0;
-	list_for_each_entry(block, &vres->blocks, link) {
-		unsigned long start;
+	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
+	    xe_is_vram_mgr_blocks_contiguous(mm, &vres->blocks))
+		vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
 
-		start = drm_buddy_block_offset(block) +
-			drm_buddy_block_size(mm, block);
-		start >>= PAGE_SHIFT;
+	/*
+	 * For some kernel objects we still rely on the start when io mapping
+	 * the object.
+	 */
+	if (vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) {
+		struct drm_buddy_block *block = list_first_entry(&vres->blocks,
+								 typeof(*block),
+								 link);
 
-		if (start > PFN_UP(vres->base.size))
-			start -= PFN_UP(vres->base.size);
-		else
-			start = 0;
-		vres->base.start = max(vres->base.start, start);
+		vres->base.start = drm_buddy_block_offset(block) >> PAGE_SHIFT;
+	} else {
+		vres->base.start = XE_BO_INVALID_OFFSET;
 	}
 
-	if (xe_is_vram_mgr_blocks_contiguous(mm, &vres->blocks))
-		vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
-
 	*res = &vres->base;
 	return 0;
 
-- 
2.39.1

