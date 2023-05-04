Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B60EC7EE22
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 20:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262DF10E002;
	Thu,  4 May 2023 20:53:44 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BBE10E002
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 20:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683233623; x=1714769623;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BSJUni2tNX0MamyNxcejnGjFOVsG6DMtOoc1TO9YKUs=;
 b=OiHY8cJctzZOU5S8cUA5BWQUN0WJDOT5t2MluqkVBXl8faWpD9koi45O
 zTMhF/z8+hz4fUNZg7tjcq3b2JnjDHQPCKmjmtWefCkDYoLzlEaxutk9j
 mkc8yyaFHDksBb/agsSzHey1BnmNhOEObk3/6g9UL+DbUqPGLNi6I3B++
 3X2BzygyI0uozscV6TrcUpm3fBzi/rt/qUzu/+r9diBeghulmwZVZNYqL
 cy3d4VP2L2vkZl1vY7yv+Hnsy31jZzpO8lt81L8t6gOP2j0de1kOEpg3K
 +pnPePHDyCtdpHkH95S4OKV3JAx8LPoX9ucRk+ylCHrpdWNGmMQfkt6xP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="347874008"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="347874008"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 13:53:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="727733474"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="727733474"
Received: from kav-xto-001.ka.intel.com ([10.62.231.160])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 13:53:40 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  4 May 2023 22:53:20 +0200
Message-Id: <20230504205320.3869491-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix splat during error dump
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

Allow xe_bo_addr without lock to print debug information, such
as from xe_analyze_vm.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 19 +++++++++++++++----
 drivers/gpu/drm/xe/xe_bo.h |  2 ++
 drivers/gpu/drm/xe/xe_vm.c |  2 +-
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3ab404e33fae..c82e995df779 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1545,15 +1545,18 @@ bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo)
 	return false;
 }
 
-dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
+/*
+ * Resolve a BO address. There is no assert to check if the proper lock is held
+ * so it should only be used in cases where it is not fatal to get the wrong
+ * address, such as printing debug information, but not in cases where memory is
+ * written based on this result.
+ */
+dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset,
 		      size_t page_size, bool *is_vram)
 {
 	struct xe_res_cursor cur;
 	u64 page;
 
-	if (!READ_ONCE(bo->ttm.pin_count))
-		xe_bo_assert_held(bo);
-
 	XE_BUG_ON(page_size > PAGE_SIZE);
 	page = offset >> PAGE_SHIFT;
 	offset &= (PAGE_SIZE - 1);
@@ -1575,6 +1578,14 @@ dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
 	}
 }
 
+dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
+		      size_t page_size, bool *is_vram)
+{
+	if (!READ_ONCE(bo->ttm.pin_count))
+		xe_bo_assert_held(bo);
+	return __xe_bo_addr(bo, offset, page_size, is_vram);
+}
+
 int xe_bo_vmap(struct xe_bo *bo)
 {
 	void *virtual;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 8354d05ccdf3..7e111332c35a 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -199,6 +199,8 @@ static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
 }
 
 bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo);
+dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset,
+		      size_t page_size, bool *is_vram);
 dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
 		      size_t page_size, bool *is_vram);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 272f0f7f24fe..91576cec000d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3397,7 +3397,7 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 					&cur);
 			addr = xe_res_dma(&cur);
 		} else {
-			addr = xe_bo_addr(vma->bo, 0, XE_PAGE_SIZE, &is_vram);
+			addr = __xe_bo_addr(vma->bo, 0, XE_PAGE_SIZE, &is_vram);
 		}
 		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
 			   vma->start, vma->end, vma->end - vma->start + 1ull,
-- 
2.25.1

