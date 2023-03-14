Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0A3C7618A
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 08:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418F910E16B;
	Tue, 14 Mar 2023 08:59:14 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8216910E744
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 08:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678784351; x=1710320351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+sJ6ydPzkqtvzegX9FBSN30LHD/2WYhkeQcyugcEv94=;
 b=JdrsPr7ZXXf4Ry41HlLwuZXgaKFXylPoSmhje7GXbRH9vBf6McT2M236
 IAJgOE+7AqHYOFfDkCpGJ9HZQhhZUgHg41oJL06ZOaqmRh1NDN7j7Xd8y
 DmwL253gnq4Eh3as0UhDXGerr+3TRxWYAJceU25Ea0M/s7bkOesKKYZWE
 PFU1y2fhc8wOXnyZ31HC0qcGYOdHEqdWOeMpnBQ0xgJTqSjAlQUHvOwjW
 TYVOAWs0A8HqqWNgIzC9M/1orrOX9nb5DOVTZtVerSWnktvrStOqWVgTw
 HEBq5con9eda7hIg40iw6KbJJ7pMi5DHSA5LJrRPh4tlqVMaNtmSdEjk2 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="317756241"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="317756241"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 01:59:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="747922698"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="747922698"
Received: from tlambe-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.14.230])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 01:59:10 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Mar 2023 08:58:40 +0000
Message-Id: <20230314085842.134239-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314085842.134239-1-matthew.auld@intel.com>
References: <20230314085842.134239-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 4/6] drm/xe/buddy: remove the virtualized start
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hopefully not needed anymore. We can add a .compatible() hook once we
need to differentiate between mappable and non-mappable vram. If the
allocation is not contiguous then the start value is kind of
meaningless, so rather just mark as invalid.

In upstream, TTM wants to eventually remove the ttm_resource.start
usage.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           |  6 ++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 29 ++++++++++++++--------------
 2 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 73a7f2cd4ad8..346573f406c2 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -662,6 +662,12 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 				void *new_addr = gt->mem.vram.mapping +
 					(new_mem->start << PAGE_SHIFT);
 
+				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
+					ret = -EINVAL;
+					xe_device_mem_access_put(xe);
+					goto out;
+				}
+
 				XE_BUG_ON(new_mem->start !=
 					  bo->placements->fpfn);
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 159ca7105df1..bafcadaed6b0 100644
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
2.39.2

