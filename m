Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D946C7618A
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 15:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E6D10E2D9;
	Mon, 20 Mar 2023 15:14:02 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230E810E5CB
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 15:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679325240; x=1710861240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GwKx6ZrAy4bjwYiRNl1c+TG2287Ct+FiBSn8ynRoMxM=;
 b=QNHvLwNQTbPV2Nv1ApsCqMgcaCY3V/sPF+sQza/qBPeHiEta3cgKNbZN
 F8oC/290CU8upr8WbaGoT2yo+PR1VduFbdv5VWbcFXZtPJ0dzN8mzJ1yd
 DnahwTHNWE66xkGPO6qTm/VEENI4VgBtsiBrgT5sAoHsL5jbjZagN6ytB
 gk1UlyUTXrTo43m+xuZ9GSqbu5QV2MJlr71/dhvyE0dslurJwvgrWqRRz
 E/eRXqvDRR34Qz6kt1LMqgpkfIxzX5/8wzsVlCuJwPZmialjwP7zgtGI7
 2Qb44wohxkepxsEgzA8t6EUq1aOItWdeXdyTqQfRb/MgMbbnwqGghgGpQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="327061369"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="327061369"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 08:13:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="713610198"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="713610198"
Received: from vmiceli-mobl.amr.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.135])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 08:13:58 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Mar 2023 15:13:34 +0000
Message-Id: <20230320151334.60302-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320151334.60302-1-matthew.auld@intel.com>
References: <20230320151334.60302-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 2/2] drm/xe/buddy: add compatible and
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
index 44c070bf969f..f574f3fddb5a 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -228,9 +228,71 @@ static void xe_ttm_vram_mgr_debug(struct ttm_resource_manager *man,
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

