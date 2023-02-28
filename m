Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A908C7EE2E
	for <intel-xe@archiver.kernel.org>; Tue, 28 Feb 2023 10:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF34B10E687;
	Tue, 28 Feb 2023 10:42:07 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB6C10E03C
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Feb 2023 10:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677580925; x=1709116925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VLcaxIGCUVc4grbx5ljjzc/s+XhNZwz3Dt09Ori7yo0=;
 b=YFl0h6EOOuShzOF6gH6evFF21X/1L+uG2zfSPHUg6ezjgPkbE1kgH/1y
 H4lbMNTuN5prk+ptgqGGxq6JapSr03TuT0PAyZeQ36QBPh1UEOwT0ZZYh
 Kzvgz5JzV4NJiHMWqQZx6wAuFa4vEXK/4SJXn9QV1U1LIRZ3twW0ONggT
 B9jaEcWFK0egmgdxgwItJGPZ9wLGTt/KGMYh1BLFucHluf4GDQqjPpDj7
 3SW8g8OxgpS19aMfUAf+MJ01563G6qt1kSqICEimiPUcTPjtFY7QTcpTe
 8FzPNd0Fo7Cgq6DOPtyDXSfstWdsP2F93DAmb+rOWwhsTQTBxqVUo6BIh w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="398884700"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="398884700"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 02:42:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="738108966"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="738108966"
Received: from mistoan-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.9.93])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 02:42:04 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Feb 2023 10:41:30 +0000
Message-Id: <20230228104137.80965-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104137.80965-1-matthew.auld@intel.com>
References: <20230228104137.80965-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 07/14] drm/xe/buddy: remove the virtualized
 start
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
---
 drivers/gpu/drm/xe/xe_bo.c           |  6 ++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 29 ++++++++++++++--------------
 2 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 2bfd3f6f2e9a..7b331314064c 100644
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
index 643365b18bc7..e3ac8c6d3978 100644
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

