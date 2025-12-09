Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF2BD3B98A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 17:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C46A10E60D;
	Tue,  9 Dec 2025 17:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HgEvUbFF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96F210E60D
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 17:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765301545; x=1796837545;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TZ75vwsi3Mc7oODk940Y7CmTZH75R5XmXVADbdjcwvk=;
 b=HgEvUbFFHvYGfBjNEJrZeOmDMsKR5eQKOph4WckWRRngdgL+WiujFMgX
 JckHpAw5bqmPe+rvX1MwCIHAWcp+7eIiajKmdJGN58Kb5zGqZi0k/MA6G
 lAZhHTArwjnX6krXUAX4XLNKjHKtJ2KvF/lB3uXwJ3WpgrSfGKNs8GT10
 PNn6qfxqPKHZ7cdyJkwAfDD24Pya5VGfyFAgXKqvQEYMbrEgfv7VzFecp
 4qMGTQuBlXuF0+fEyPEkP7MCy5SMrHClaWGzZ/mrtTP4My13Fv8OYFSNb
 JSiKsOvBEJKeMN8UIwVy4dPw6iAuHVB3SjGA25mgGqnhp7vrQvNn2YE2Y Q==;
X-CSE-ConnectionGUID: qMCj2oRxSNCEGm5Cm1Xgyg==
X-CSE-MsgGUID: yBXFM2WARhqkJh2trl5UXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71125206"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="71125206"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 09:32:13 -0800
X-CSE-ConnectionGUID: PPOH9fOpQMy3hLRVLM2CCg==
X-CSE-MsgGUID: svqXs7LqRJuehRvO+vY0IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="197054631"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 09:32:11 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	matthew.brost@intel.com
Subject: [PATCH v2] drm/xe: Use DRM_BUDDY_CONTIGUOUS_ALLOCATION for contiguous
 allocations
Date: Tue,  9 Dec 2025 22:59:20 +0530
Message-ID: <20251209172919.2304341-2-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
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

The VRAM/stolen memory managers do not currently set
DRM_BUDDY_CONTIGUOUS_ALLOCATION for contiguous allocations. Enabling
this flag activates the buddy allocator's try_harder path, which helps
handle fragmented memory scenarios.

This enables the __alloc_contig_try_harder fallback in the buddy
allocator, allowing contiguous allocation requests to succeed even when
memory is fragmented by combining allocations from both(RHS and LHS)
sides of a large free block.

v2: (Matt B)
- Remove redundant logic for rounding allocation size and trimming when
  TTM_PL_FLAG_CONTIGUOUS is set, since drm_buddy now handles this when
  DRM_BUDDY_CONTIGUOUS_ALLOCATION is enabled

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6713
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 9f70802fce92..1a819b627afe 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -82,6 +82,9 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
 		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
 
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
+		vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
+
 	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
 		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
@@ -111,25 +114,12 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 		goto error_unlock;
 	}
 
-	if (place->fpfn + (size >> PAGE_SHIFT) != lpfn &&
-	    place->flags & TTM_PL_FLAG_CONTIGUOUS) {
-		size = roundup_pow_of_two(size);
-		min_page_size = size;
-
-		lpfn = max_t(unsigned long, place->fpfn + (size >> PAGE_SHIFT), lpfn);
-	}
-
 	err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
 				     (u64)lpfn << PAGE_SHIFT, size,
 				     min_page_size, &vres->blocks, vres->flags);
 	if (err)
 		goto error_unlock;
 
-	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
-		if (!drm_buddy_block_trim(mm, NULL, vres->base.size, &vres->blocks))
-			size = vres->base.size;
-	}
-
 	if (lpfn <= mgr->visible_size >> PAGE_SHIFT) {
 		vres->used_visible_size = size;
 	} else {
-- 
2.52.0

