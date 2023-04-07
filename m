Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA25FC77B6C
	for <intel-xe@archiver.kernel.org>; Fri,  7 Apr 2023 03:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69D310E362;
	Fri,  7 Apr 2023 03:28:00 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B912C10E36C
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Apr 2023 03:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680838077; x=1712374077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zLEY/CAJMjEX4tP2MWIlwq+FLE3WVN5mNo9iFzD63J8=;
 b=S7DhK/OgMm0RhjN3jKp35v/2qlwebaKpxNoElJ8Fqx9L+vrRxF5EsIuc
 PKcd0r9OFuQ/wdoQ/5YVEQvKBt1tGvE8srQ+kibWh9W+7wu9LSK3a+T8q
 8MnQARfC26gEbYeN9CPCcIxJRSxG9KO7IODF5VlVDgxswgDUb7d7gWWeH
 ZFv8KgwIpSxgB0b71Xnc3rDFzSrtQeZvggF+8+DnsMVK8ibsnoOlUv97f
 D6UbIUSBNO+E7CzyDuGAZMa2PUlQOcrLyJ5C8CD3CBeOZBv0CXDae3vDO
 FKNOoYwwABz9DtGu6gASH3ckBxJeT7IjA79fSy6ycDd80aYmUxvDKIkoa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="323289239"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="323289239"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 20:27:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664752547"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="664752547"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 20:27:56 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 20:27:51 -0700
Message-Id: <20230407032751.31632-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230407032751.31632-1-niranjana.vishwanathapura@intel.com>
References: <20230407032751.31632-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] Revert "drm/xe: Coalesce GGTT
 invalidations"
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
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 9a54f70a3a33047d1c67abf790b7cfbbce2cc65b.

Coalescing GGTT invalidations is causing a bunch of hangs during
driver load and in user space. Benefit is rather small too, so
revert it to stabilize the stack.

Tested-by: Matt Roper <matthew.d.roper@intel.com>  # ADL-P
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

