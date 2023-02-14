Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9439C64ED8
	for <intel-xe@archiver.kernel.org>; Tue, 14 Feb 2023 11:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD53B10E88E;
	Tue, 14 Feb 2023 11:24:00 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB54E10E0D7
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Feb 2023 11:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676373837; x=1707909837;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=OP6zlhI92CzCq3Dx43fM9gdS6ShclUFKFyd/xrqwpmo=;
 b=bhxSCXzq01tLGZ2tMOfFlh2bGnE2/fdlQftlJooSfQfThQ74uMEdivMQ
 3mxtNtrm179nER50kxIFp/z2ARlmCZX0KsOuEz/SNqJQyOkc78C5yZ8V5
 WBPxWbY+ZcHiZkmU1mQYJyeAF34R5sbo81sQyDsKUpRjCEvfKMepg9KmH
 wc/cYuCYXXrSZ5hik5lY3uv9l48AQaeZzx2d6DxyjjtkPi9NEdcV8bnLc
 wNsVlnUTtEk9pa+hHYJsaCNbMklFaglU0cXv0SAXgUOx+sfyvZ3m1qTZp
 tKqVWsCMeEeqUXNO09EzVCB/Obzyr5mpUVyHg/5gzOvx9Uab1teT4wTNQ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="332450071"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="332450071"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:23:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="732863233"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="732863233"
Received: from achurkin-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.18.173])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:23:55 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Feb 2023 11:21:31 +0000
Message-Id: <20230214112136.162380-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214112136.162380-1-matthew.auld@intel.com>
References: <20230214112136.162380-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 10/15] drm/xe/buddy: add compatible and
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Copy this from i915. We need .compatible for lmem -> lmem transfers, so
they don't just get nooped by ttm, if need to move something from
mappable to non-mappble or vice versa. The .intersects is needed for
eviction, to determine if a victim resource is worth eviction. e.g if we
need mappable space there is no point in evicting a resource that has
zero mappable pages.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 62 ++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index acde9e7564e1..7e4daab2ac7f 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -230,9 +230,71 @@ static void xe_ttm_vram_mgr_debug(struct ttm_resource_manager *man,
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
2.39.1

