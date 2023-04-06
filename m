Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F56C7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 20:48:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C893E10ED2E;
	Thu,  6 Apr 2023 20:48:49 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857BA10E368
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 20:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680814128; x=1712350128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KgZeM3pD1lSRHQojN8zYhcVOhXPBgLsDey59WWeFzl8=;
 b=U/tCRD+zoGgZ5nlRlpbd5muAXWUc1UtA9qMQRQiTDW4y2iS8b7hQfJt7
 12bbYu5bO7G5UO/TY6l1tIg1gV1A+pd8jy5z9ucXSjESJ/sTRkEh0R2lG
 XQbSQfuLWde5BNG0munjurXepO9ZwscN3/GaFeaxU/59LnpgWcCw5vF8L
 kpN81Q0U4zBhrFagiaxIV8BxB1SkLRy+rDCTkceewJLYcJpFZ+TPe9nNF
 GtmFcGDgp+sg8WwxEetwuM2nR8EEovPc5iMjcJliKTXoLdFKntaN57fHl
 9XhdMq0ey5DemWFZ6hj54csNgs5vJCpeOOgDQ4WS0YQfDaeVfZcBXMlO7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="407963919"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="407963919"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 13:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="811139803"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="811139803"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 13:48:47 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 13:48:41 -0700
Message-Id: <20230406204841.18774-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230406204841.18774-1-niranjana.vishwanathapura@intel.com>
References: <20230406204841.18774-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] Revert "drm/xe: Coalesce GGTT invalidations"
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

This reverts commit 9a54f70a3a33047d1c67abf790b7cfbbce2cc65b.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c       | 11 ++---------
 drivers/gpu/drm/xe/xe_ggtt_types.h |  2 --
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 2e31b1ce3e4c..0ae373b604f6 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -263,22 +263,15 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
-	struct xe_device *xe = gt_to_xe(ggtt->gt);
 	u64 start = bo->ggtt_node.start;
 	u64 offset, pte;
 
-	lockdep_assert_held(&ggtt->lock);
-
 	for (offset = 0; offset < bo->size; offset += GEN8_PAGE_SIZE) {
 		pte = xe_ggtt_pte_encode(bo, offset);
 		xe_ggtt_set_pte(ggtt, start + offset, pte);
 	}
 
-	/* XXX: Without doing this everytime on integrated driver load fails */
-	if (ggtt->invalidate || !IS_DGFX(xe)) {
-		xe_ggtt_invalidate(ggtt->gt);
-		ggtt->invalidate = false;
-	}
+	xe_ggtt_invalidate(ggtt->gt);
 }
 
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
@@ -329,7 +322,7 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 	drm_mm_remove_node(node);
 	node->size = 0;
 
-	ggtt->invalidate = true;
+	xe_ggtt_invalidate(ggtt->gt);
 
 	mutex_unlock(&ggtt->lock);
 }
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 8198aa784654..ea70aaef4b31 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -26,8 +26,6 @@ struct xe_ggtt {
 	u64 __iomem *gsm;
 
 	struct drm_mm mm;
-
-	bool invalidate;
 };
 
 #endif
-- 
2.21.0.rc0.32.g243a4c7e27

