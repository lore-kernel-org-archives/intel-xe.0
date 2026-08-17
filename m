Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95321C5DF74
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 06:51:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F73E10E65C;
	Mon, 17 Aug 2026 06:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SStb/uAm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4958710E665
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 06:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786949483; x=1818485483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fCsCBChmJwwZ3soBoV7Ufsoy1Yg17QIZrVSlUfOajKM=;
 b=SStb/uAmUazEkUWZYiibEYpCd1lRybp0Z6aRaiRvmsMZF4Rqs9Hl2LjN
 BPRMRivzHjeCtv8s4+4k9oA2DEQUgHvoHPFLG81vSsXjpRF637gZsBOeI
 SqfTNnLag1QtglgvkcmYx4c7+ctkVyw2bb2ix5dDUC6Kum0A9lfJVx4XF
 F4Np0CytUE9qsegVcUDI9mjiHiu6T9Cz7U5W1xlru8Fa3BslMdsdRwjV4
 foSJuqgmcuke+XojR/qlGr3BVxxyF4dO9HYjeKqsSSbSYWyDJh4WLdnrS
 HB69HuQViQ5X6DezExctsKz0HMKsyDAZB3yZaC27rldXiM47n3xGMZ2Tk g==;
X-CSE-ConnectionGUID: mwNMc84gSMCqKcBmCxKHhQ==
X-CSE-MsgGUID: rEvra4luT7+YgQR20DVReg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91289559"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="91289559"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 23:51:23 -0700
X-CSE-ConnectionGUID: Aq3N5JeuSXSeLQlWHlXZhg==
X-CSE-MsgGUID: lXDTqmzjTcSrSgWJiIVyUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="264383811"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 23:51:20 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V16 07/12] drm/xe/vram: Add page offline data structures and
 lifecycle
Date: Mon, 17 Aug 2026 12:21:02 +0530
Message-ID: <20260817065055.3734576-21-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260817065055.3734576-14-tejas.upadhyay@intel.com>
References: <20260817065055.3734576-14-tejas.upadhyay@intel.com>
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

v2(Himal):
- Address possible leak in xe_ttm_vram_mgr_fini()
- Remove unused dev and add comment for used_visible_size 0

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 25 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 28 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 49eeec90a470..1885f2aa64df 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -300,6 +300,25 @@ static const struct ttm_resource_manager_func xe_ttm_vram_mgr_func = {
 	.debug	= xe_ttm_vram_mgr_debug
 };
 
+static void xe_ttm_vram_free_bad_pages(struct xe_ttm_vram_mgr *mgr)
+{
+	struct xe_ttm_vram_offline_resource *pos, *n;
+
+	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
+		xe_ttm_vram_buddy_free(mgr, &pos->blocks, pos->used_visible_size);
+		list_del_rcu(&pos->offlined_link);
+		--mgr->n_offlined_pages;
+		kfree_rcu(pos, rcu);
+	}
+	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
+		/* queued entries have no buddy reservation yet */
+		xe_ttm_vram_buddy_free(mgr, &pos->blocks, 0);
+		list_del_rcu(&pos->queued_link);
+		--mgr->n_queued_pages;
+		kfree_rcu(pos, rcu);
+	}
+}
+
 static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -308,6 +327,10 @@ static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 
 	ttm_resource_manager_set_used(man, false);
 
+	mutex_lock(&mgr->lock);
+	xe_ttm_vram_free_bad_pages(mgr);
+	mutex_unlock(&mgr->lock);
+
 	if (ttm_resource_manager_evict_all(&xe->ttm, man))
 		return;
 
@@ -338,6 +361,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	err = drmm_mutex_init(&xe->drm, &mgr->lock);
 	if (err)
 		return err;
+	INIT_LIST_HEAD(&mgr->offlined_pages);
+	INIT_LIST_HEAD(&mgr->queued_pages);
 	mgr->default_page_size = default_page_size;
 	mgr->visible_size = io_size;
 	mgr->visible_avail = io_size;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 9106da056b49..9dc6fc5a3c38 100644
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
@@ -45,4 +53,24 @@ struct xe_ttm_vram_mgr_resource {
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
+	/** @rcu: RCU head for deferred freeing */
+	struct rcu_head rcu;
+};
+
 #endif
-- 
2.52.0

