Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B74C74A5B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 10:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674A310E194;
	Tue, 21 Mar 2023 10:45:54 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890A710E753
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 10:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679395549; x=1710931549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kR5EhiSrORJTcbE3FgbT5INLDOg/IyCXbT4qF5UOaJg=;
 b=PBPSHKmP0nV6q877F3Tb1CmJaPCF+KDZGhTcpix6d5prNeDoTKlIPmOa
 FGQfP30iKvyH4zrAiFgDfmv6UAqdo+cUVGzAqvyI3kNSLhQFHos8i+o9f
 VAqwaNUUDSQiKgPNDO+3hM64J60eYtyav9l9fSUuldWMy9mtAIwvdbE2g
 wcoIerOUs4FOQrmLE+/SQseNBnHeYV9nZUE01c0fkOvAXDfRGSKUxNTly
 1oYM5hUB4ElovErXxruoDlHO8zMVVoVVW3qCVHPrkB46IwE/qM4yyNYvY
 E5DlAuNLrNlM2th8/CStmXViYsxW0oKmJ2kcnvAQoJpVCLw/epBw65Rle g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="341267441"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="341267441"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 03:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="658719568"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="658719568"
Received: from bbrady-mobl4.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.25.208])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 03:45:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Mar 2023 10:45:29 +0000
Message-Id: <20230321104529.157616-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230321104529.157616-1-matthew.auld@intel.com>
References: <20230321104529.157616-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v7 2/2] drm/xe/buddy: add compatible and
 intersects hooks
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

Copy this from i915. We need .compatible for vram -> vram transfers, so
they don't just get nooped by ttm, if need to move something from
mappable to non-mappble or vice versa. The .intersects is needed for
eviction, to determine if a victim resource is worth eviction. e.g if we
need mappable space there is no point in evicting a resource that has
zero mappable pages.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 62 ++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index c68ae8f44ce6..d48e0962facb 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -224,9 +224,71 @@ static void xe_ttm_vram_mgr_debug(struct ttm_resource_manager *man,
 	drm_printf(printer, "man size:%llu\n", man->size);
 }
 
+static bool xe_ttm_vram_mgr_intersects(struct ttm_resource_manager *man,
+				       struct ttm_resource *res,
+				       const struct ttm_place *place,
+				       size_t size)
+{
+	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
+	struct xe_ttm_vram_mgr_resource *vres =
+		to_xe_ttm_vram_mgr_resource(res);
+	struct drm_buddy *mm = &mgr->mm;
+	struct drm_buddy_block *block;
+
+	if (!place->fpfn && !place->lpfn)
+		return true;
+
+	if (!place->fpfn && place->lpfn == mgr->visible_size >> PAGE_SHIFT)
+		return vres->used_visible_size > 0;
+
+	list_for_each_entry(block, &vres->blocks, link) {
+		unsigned long fpfn =
+			drm_buddy_block_offset(block) >> PAGE_SHIFT;
+		unsigned long lpfn = fpfn +
+			(drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
+
+		if (place->fpfn < lpfn && place->lpfn > fpfn)
+			return true;
+	}
+
+	return false;
+}
+
+static bool xe_ttm_vram_mgr_compatible(struct ttm_resource_manager *man,
+				       struct ttm_resource *res,
+				       const struct ttm_place *place,
+				       size_t size)
+{
+	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
+	struct xe_ttm_vram_mgr_resource *vres =
+		to_xe_ttm_vram_mgr_resource(res);
+	struct drm_buddy *mm = &mgr->mm;
+	struct drm_buddy_block *block;
+
+	if (!place->fpfn && !place->lpfn)
+		return true;
+
+	if (!place->fpfn && place->lpfn == mgr->visible_size >> PAGE_SHIFT)
+		return vres->used_visible_size == size;
+
+	list_for_each_entry(block, &vres->blocks, link) {
+		unsigned long fpfn =
+			drm_buddy_block_offset(block) >> PAGE_SHIFT;
+		unsigned long lpfn = fpfn +
+			(drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
+
+		if (fpfn < place->fpfn || lpfn > place->lpfn)
+			return false;
+	}
+
+	return true;
+}
+
 static const struct ttm_resource_manager_func xe_ttm_vram_mgr_func = {
 	.alloc	= xe_ttm_vram_mgr_new,
 	.free	= xe_ttm_vram_mgr_del,
+	.intersects = xe_ttm_vram_mgr_intersects,
+	.compatible = xe_ttm_vram_mgr_compatible,
 	.debug	= xe_ttm_vram_mgr_debug
 };
 
-- 
2.39.2

