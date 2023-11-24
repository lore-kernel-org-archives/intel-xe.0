Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854F4C61D97
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 15:34:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5546510E80A;
	Fri, 24 Nov 2023 15:34:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32DD10E80B
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 15:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700840052; x=1732376052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j3Mzd7AYPO1H7YTMPmAiX2JR57G5RVNPDTQZXM4pKxE=;
 b=XXDC8wGjrCFh12lTjTS25QkyX/AneYxcPtetdLHeGsId0yvbcKYfEFgX
 42c1op9c4Nk9r8niXaTA/ab7zoSKeMAP6oacUEgmfU9Q2JPLAd5qGXPci
 chiPO4OVV1IxMdj8YVUDassgwht78wh/7fvkVASCKOsqfsOVWnS3Qed86
 VBEi3bD4zDqnA0VSjaYwqj5Q2xGICp/7qpb5qv7CawDYm47NIEVaDtw8i
 0eZcB3i/eJAaQCi6c5JejcnOTSuvTUNZgwpWBhm1Iczi2Z236vzZ2Ira9
 izrFv4htgYPOvKAebNTIr7MaIbZ8zBsU/c1ieQc/Y0sF1PTprfAbYNZNb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="391315672"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="391315672"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:34:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="796615252"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="796615252"
Received: from cschimpe-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.175])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:34:10 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 16:33:43 +0100
Message-ID: <20231124153345.97385-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124153345.97385-1-thomas.hellstrom@linux.intel.com>
References: <20231124153345.97385-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 2/4] drm/xe/bo: Rename xe_bo_get_sg() to
 xe_bo_sg()
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Using "get" typically refers to obtaining a refcount, which we don't do
here so rename to xe_bo_sg().

Suggested-by: Ohad Sharabi <osharabi@habana.ai>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/946
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Ohad Sharabi<osharabi@habana.ai>
Link: https://patchwork.freedesktop.org/patch/msgid/20231122110359.4087-3-thomas.hellstrom@linux.intel.com
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 2 +-
 drivers/gpu/drm/xe/xe_bo.c            | 4 ++--
 drivers/gpu/drm/xe/xe_bo.h            | 2 +-
 drivers/gpu/drm/xe/xe_migrate.c       | 8 ++++----
 drivers/gpu/drm/xe/xe_pt.c            | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 7aad09140d7e..83d6a66ed369 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -328,7 +328,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	if (xe_bo_is_vram(pt))
 		xe_res_first(pt->ttm.resource, 0, pt->size, &src_it);
 	else
-		xe_res_first_sg(xe_bo_get_sg(pt), 0, pt->size, &src_it);
+		xe_res_first_sg(xe_bo_sg(pt), 0, pt->size, &src_it);
 
 	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt),
 		 &src_it, XE_PAGE_SIZE, pt);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9bbb3d70ca21..58213835803d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -317,7 +317,7 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
 	return 0;
 }
 
-struct sg_table *xe_bo_get_sg(struct xe_bo *bo)
+struct sg_table *xe_bo_sg(struct xe_bo *bo)
 {
 	struct ttm_tt *tt = bo->ttm.ttm;
 	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
@@ -1725,7 +1725,7 @@ dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
 	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
 		xe_assert(xe, bo->ttm.ttm);
 
-		xe_res_first_sg(xe_bo_get_sg(bo), page << PAGE_SHIFT,
+		xe_res_first_sg(xe_bo_sg(bo), page << PAGE_SHIFT,
 				page_size, &cur);
 		return xe_res_dma(&cur) + offset;
 	} else {
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 98ed35cf39a3..9f373f6d25f2 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -290,7 +290,7 @@ xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
 
 void xe_bo_put_commit(struct llist_head *deferred);
 
-struct sg_table *xe_bo_get_sg(struct xe_bo *bo);
+struct sg_table *xe_bo_sg(struct xe_bo *bo);
 
 /*
  * xe_sg_segment_size() - Provides upper limit for sg segment size.
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ed2f3f5109f3..80a130beca61 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -682,16 +682,16 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		return ERR_PTR(-EINVAL);
 
 	if (!src_is_vram)
-		xe_res_first_sg(xe_bo_get_sg(src_bo), 0, size, &src_it);
+		xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
 	else
 		xe_res_first(src, 0, size, &src_it);
 	if (!dst_is_vram)
-		xe_res_first_sg(xe_bo_get_sg(dst_bo), 0, size, &dst_it);
+		xe_res_first_sg(xe_bo_sg(dst_bo), 0, size, &dst_it);
 	else
 		xe_res_first(dst, 0, size, &dst_it);
 
 	if (copy_system_ccs)
-		xe_res_first_sg(xe_bo_get_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
+		xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
 				PAGE_ALIGN(xe_device_ccs_bytes(xe, size)),
 				&ccs_it);
 
@@ -941,7 +941,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 	int pass = 0;
 
 	if (!clear_vram)
-		xe_res_first_sg(xe_bo_get_sg(bo), 0, bo->size, &src_it);
+		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
 	else
 		xe_res_first(src, 0, bo->size, &src_it);
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 338bffe4885f..433f9eca61d0 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -677,7 +677,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
 				     xe_vma_size(vma), &curs);
 		else
-			xe_res_first_sg(xe_bo_get_sg(bo), xe_vma_bo_offset(vma),
+			xe_res_first_sg(xe_bo_sg(bo), xe_vma_bo_offset(vma),
 					xe_vma_size(vma), &curs);
 	} else {
 		curs.size = xe_vma_size(vma);
-- 
2.41.0

