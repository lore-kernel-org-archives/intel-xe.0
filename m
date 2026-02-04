Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389B0E95376
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 10:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6973C10E18D;
	Wed,  4 Feb 2026 10:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fa+jHULS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3342010E18D;
 Wed,  4 Feb 2026 10:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770202028; x=1801738028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=htliidP6bhCqoSPu+8Tzn/9P8Z0GVmVXcQH293ChYWk=;
 b=fa+jHULSDrv9rZZ48g8gYA7lFQN4dhWt/PYtUKKSObS1ey7h7uii8Jwt
 CBFNbow2PNtReyGewz6r6HbSgYrfcKESMo5fOszFIAr8wKlAqmHXAlpAu
 5AxIFNmrCFk1J1uDvCrQYu05xkDFt1ot/l/9Gyycx2JudQpPvzClWgk7W
 QtH2JHCE5z6ppesrUJoJeW2v4lNyUSlVgnyG3o894km6XWKlQ8n4aEufu
 LILT0Si6jjUpMM+ShZhDqboCnOJs1FnKIZV3XQrtUcn5Q7eFPROcqHK2l
 vvpMMfHtEqEkRXDpUnPxLnfMb/wljruCVEanzi+hrQMAGaOl6BQairb1r Q==;
X-CSE-ConnectionGUID: oedvm8daTtql9itgYT1sQA==
X-CSE-MsgGUID: wp9bhRtESauegQO3fhgRuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="94039259"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="94039259"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:47:08 -0800
X-CSE-ConnectionGUID: 6aeSbIXeTJm1WM2GYQCtZw==
X-CSE-MsgGUID: GnS7D/FSS9yZfikIJgos/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="209926624"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:47:06 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 1/2] drm/buddy: Move internal helpers to drm_buddy.c
Date: Wed,  4 Feb 2026 16:13:45 +0530
Message-ID: <20260204104345.1980047-5-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204104345.1980047-4-sanjay.kumar.yadav@intel.com>
References: <20260204104345.1980047-4-sanjay.kumar.yadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Move drm_buddy_block_state(), drm_buddy_block_is_allocated(),
drm_buddy_block_is_free(), and drm_buddy_block_is_split() from
drm_buddy.h to drm_buddy.c as static functions since they have
no external callers.

Remove drm_get_buddy() as it was an unused exported wrapper
around the internal __get_buddy().

No functional changes.

Cc: Christian König <christian.koenig@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 drivers/gpu/drm/drm_buddy.c | 41 ++++++++++++++++++++++---------------
 include/drm/drm_buddy.h     | 27 ------------------------
 2 files changed, 24 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index fd34d3755f7c..05fe9d12e274 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -21,6 +21,30 @@ enum drm_buddy_free_tree {
 
 static struct kmem_cache *slab_blocks;
 
+static unsigned int
+drm_buddy_block_state(struct drm_buddy_block *block)
+{
+	return block->header & DRM_BUDDY_HEADER_STATE;
+}
+
+static bool
+drm_buddy_block_is_allocated(struct drm_buddy_block *block)
+{
+	return drm_buddy_block_state(block) == DRM_BUDDY_ALLOCATED;
+}
+
+static bool
+drm_buddy_block_is_free(struct drm_buddy_block *block)
+{
+	return drm_buddy_block_state(block) == DRM_BUDDY_FREE;
+}
+
+static bool
+drm_buddy_block_is_split(struct drm_buddy_block *block)
+{
+	return drm_buddy_block_state(block) == DRM_BUDDY_SPLIT;
+}
+
 #define for_each_free_tree(tree) \
 	for ((tree) = 0; (tree) < DRM_BUDDY_MAX_FREE_TREES; (tree)++)
 
@@ -459,23 +483,6 @@ static int split_block(struct drm_buddy *mm,
 	return 0;
 }
 
-/**
- * drm_get_buddy - get buddy address
- *
- * @block: DRM buddy block
- *
- * Returns the corresponding buddy block for @block, or NULL
- * if this is a root block and can't be merged further.
- * Requires some kind of locking to protect against
- * any concurrent allocate and free operations.
- */
-struct drm_buddy_block *
-drm_get_buddy(struct drm_buddy_block *block)
-{
-	return __get_buddy(block);
-}
-EXPORT_SYMBOL(drm_get_buddy);
-
 /**
  * drm_buddy_reset_clear - reset blocks clear state
  *
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index b909fa8f810a..eb8b4f5e15b3 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -101,36 +101,12 @@ drm_buddy_block_order(struct drm_buddy_block *block)
 	return block->header & DRM_BUDDY_HEADER_ORDER;
 }
 
-static inline unsigned int
-drm_buddy_block_state(struct drm_buddy_block *block)
-{
-	return block->header & DRM_BUDDY_HEADER_STATE;
-}
-
-static inline bool
-drm_buddy_block_is_allocated(struct drm_buddy_block *block)
-{
-	return drm_buddy_block_state(block) == DRM_BUDDY_ALLOCATED;
-}
-
 static inline bool
 drm_buddy_block_is_clear(struct drm_buddy_block *block)
 {
 	return block->header & DRM_BUDDY_HEADER_CLEAR;
 }
 
-static inline bool
-drm_buddy_block_is_free(struct drm_buddy_block *block)
-{
-	return drm_buddy_block_state(block) == DRM_BUDDY_FREE;
-}
-
-static inline bool
-drm_buddy_block_is_split(struct drm_buddy_block *block)
-{
-	return drm_buddy_block_state(block) == DRM_BUDDY_SPLIT;
-}
-
 static inline u64
 drm_buddy_block_size(struct drm_buddy *mm,
 		     struct drm_buddy_block *block)
@@ -142,9 +118,6 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size);
 
 void drm_buddy_fini(struct drm_buddy *mm);
 
-struct drm_buddy_block *
-drm_get_buddy(struct drm_buddy_block *block);
-
 int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			   u64 start, u64 end, u64 size,
 			   u64 min_page_size,
-- 
2.52.0

