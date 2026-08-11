Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98449C5AC67
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 12:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F3B10E443;
	Tue, 11 Aug 2026 12:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FlgBtYL3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEF610E713
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 12:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786452047; x=1817988047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GmJdsRxKpaH+bAhWraJu2DfBL4SeviidKcEazOU2XA8=;
 b=FlgBtYL3okNucCnlBHD0ERRJ5GsZxzu9xeyKXYHcOs25b8CI09N8I0Zi
 2yn6u270nM6Y6iY+vmA0M2gQgeOM3aG6+3BVRWETm4W/axZWsez0XXJXw
 HcdLXSZQ1zaZ+5T3M+HWIfOVjl7loSkFZPE22n6xQr8Fgn3CK43PsV4yw
 PgwTuj0OWar31DKEpF9nC2sHzMft9Hoozpl6ci8lo2KdljENZc/uQbm/I
 Sm7rTpnwXWm25ZvGsnnaQMwgawauUlFENfU1dPVX08eZyVjLGl2fY8Hjs
 HvrkkYzPQ/WzOUgbIib5eW5CmuNQPtAjQnlspNsHyCCVJDiTVIBVcy0QX g==;
X-CSE-ConnectionGUID: I6p95KkwTaS8R2/TnBQJiQ==
X-CSE-MsgGUID: OBRJggenRi+BZRkF1atlFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86913002"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="86913002"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 05:40:46 -0700
X-CSE-ConnectionGUID: IXBqr4ryRZai4F0hyvkySg==
X-CSE-MsgGUID: 9pWBR3gdRkKnh5ei0jTecg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="265329930"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 05:40:45 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V15 08/14] drm/xe/vram: Add page offline data structures and
 lifecycle
Date: Tue, 11 Aug 2026 18:10:12 +0530
Message-ID: <20260811124016.3614699-24-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
References: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
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

Add xe_ttm_vram_offline_resource to track individual offlined VRAM
pages, and extend xe_ttm_vram_mgr with offlined_pages/queued_pages
lists and their counters.

Initialize the lists in __xe_ttm_vram_mgr_init() and add
xe_ttm_vram_free_bad_pages() to release all tracked pages during
xe_ttm_vram_mgr_fini() teardown.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 24 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 26 ++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 49eeec90a470..2813ae68325e 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -300,6 +300,24 @@ static const struct ttm_resource_manager_func xe_ttm_vram_mgr_func = {
 	.debug	= xe_ttm_vram_mgr_debug
 };
 
+static void xe_ttm_vram_free_bad_pages(struct drm_device *dev, struct xe_ttm_vram_mgr *mgr)
+{
+	struct xe_ttm_vram_offline_resource *pos, *n;
+
+	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
+		xe_ttm_vram_buddy_free(mgr, &pos->blocks, pos->used_visible_size);
+		list_del(&pos->offlined_link);
+		--mgr->n_offlined_pages;
+		kfree(pos);
+	}
+	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
+		xe_ttm_vram_buddy_free(mgr, &pos->blocks, 0);
+		list_del(&pos->queued_link);
+		--mgr->n_queued_pages;
+		kfree(pos);
+	}
+}
+
 static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -311,6 +329,10 @@ static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 	if (ttm_resource_manager_evict_all(&xe->ttm, man))
 		return;
 
+	mutex_lock(&mgr->lock);
+	xe_ttm_vram_free_bad_pages(dev, mgr);
+	mutex_unlock(&mgr->lock);
+
 	WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
 
 	gpu_buddy_fini(&mgr->mm);
@@ -338,6 +360,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	err = drmm_mutex_init(&xe->drm, &mgr->lock);
 	if (err)
 		return err;
+	INIT_LIST_HEAD(&mgr->offlined_pages);
+	INIT_LIST_HEAD(&mgr->queued_pages);
 	mgr->default_page_size = default_page_size;
 	mgr->visible_size = io_size;
 	mgr->visible_avail = io_size;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 9106da056b49..bdfdf6ec1218 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -19,6 +19,14 @@ struct xe_ttm_vram_mgr {
 	struct ttm_resource_manager manager;
 	/** @mm: DRM buddy allocator which manages the VRAM */
 	struct gpu_buddy mm;
+	/** @offlined_pages: List of offlined pages */
+	struct list_head offlined_pages;
+	/** @n_offlined_pages: Number of offlined pages */
+	u16 n_offlined_pages;
+	/** @queued_pages: List of queued pages */
+	struct list_head queued_pages;
+	/** @n_queued_pages: Number of queued pages */
+	u16 n_queued_pages;
 	/** @visible_size: Proped size of the CPU visible portion */
 	u64 visible_size;
 	/** @visible_avail: CPU visible portion still unallocated */
@@ -45,4 +53,22 @@ struct xe_ttm_vram_mgr_resource {
 	unsigned long flags;
 };
 
+/**
+ * struct xe_ttm_vram_offline_resource - Tracks a single offlined VRAM page
+ */
+struct xe_ttm_vram_offline_resource {
+	/** @offlined_link: Link into mgr->offlined_pages */
+	struct list_head offlined_link;
+	/** @queued_link: Link into mgr->queued_pages */
+	struct list_head queued_link;
+	/** @blocks: Buddy blocks reserved for this page */
+	struct list_head blocks;
+	/** @used_visible_size: CPU-visible bytes consumed */
+	u64 used_visible_size;
+	/** @addr: Faulty DPA reported by HW */
+	u64 addr;
+	/** @status: Reservation status (0=pending, 1=fail) */
+	bool status;
+};
+
 #endif
-- 
2.52.0

