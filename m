Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4351C624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 14:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF0010E197;
	Wed,  2 Sep 2026 14:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BL0NMh8j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A71210E35F
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 14:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788360903; x=1819896903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g42zb4u5TOkkv/0L4gQoG9WC6XnEHoOYaappE82ZB/Y=;
 b=BL0NMh8joornXTspviOsnI4fZLCuxDK6hpqr36KjtsKLlhlMYoENI6jn
 jrYu7fXKltemQodr4sSeTeuqCoO/zMewwEtcQJGEC4UYnC2pZYB3gB6Kl
 MtuTHo+qEXmYsVuyzLrK3FkFH9bK9GK/4IuNiEDQGIpb0vI5CqP85rR74
 +8ZmAw3dps1Iqk5rTYF6isQU3OyZ9PMGFrqsVsiDiCrhb/2kjeUzjQKjs
 cnD/wQG9Br+CkbW93DVXX+Nc8E96otlSl+Cn1bEB8jXNV0p2qi9dDqQEF
 nVI5pBDIn/AFLe9pFygEKQ6EJ++CKvPlY/uO0rmCzDeXKrIl0ROI2JQ1N g==;
X-CSE-ConnectionGUID: 2bbw0LGfT2+2XP661qHvQg==
X-CSE-MsgGUID: Dzv4e/OqQWeBQpBtyCfk5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92526017"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="92526017"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:55:03 -0700
X-CSE-ConnectionGUID: cfs1sv8TRZO9/IUMapZ0QQ==
X-CSE-MsgGUID: JhXBixOzS8S+mxLuHrQzxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="263260047"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:55:00 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH V20 08/15] drm/xe/vram: Add page offline data structures and
 lifecycle
Date: Wed,  2 Sep 2026 20:23:51 +0530
Message-ID: <20260902145343.465686-25-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260902145343.465686-17-tejas.upadhyay@intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
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

v3(Sashiko):
- Reorder xe_ttm_vram_buddy_free and list_del_rcu
- Introduce reservation status
v2(Himal):
- Address possible leak in xe_ttm_vram_mgr_fini()
- Remove unused dev and add comment for used_visible_size 0

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 25 ++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 38 ++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index a5116dc05166..d97739a84a2d 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -346,12 +346,35 @@ static void xe_ttm_vram_mgr_set_unused(struct drm_device *dev, void *arg)
 	ttm_resource_manager_set_used(man, false);
 }
 
+static void xe_ttm_vram_free_bad_pages(struct xe_ttm_vram_mgr *mgr)
+{
+	struct xe_ttm_vram_offline_resource *pos, *n;
+
+	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
+		list_del_rcu(&pos->offlined_link);
+		xe_ttm_vram_buddy_free(mgr, &pos->blocks, pos->used_visible_size);
+		--mgr->n_offlined_pages;
+		kfree_rcu(pos, rcu);
+	}
+	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
+		list_del_rcu(&pos->queued_link);
+		/* queued entries have no buddy reservation yet */
+		xe_ttm_vram_buddy_free(mgr, &pos->blocks, 0);
+		--mgr->n_queued_pages;
+		kfree_rcu(pos, rcu);
+	}
+}
+
 static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 {
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_ttm_vram_mgr *mgr = arg;
 	struct ttm_resource_manager *man = &mgr->manager;
 
+	mutex_lock(&mgr->lock);
+	xe_ttm_vram_free_bad_pages(mgr);
+	mutex_unlock(&mgr->lock);
+
 	if (ttm_resource_manager_evict_all(&xe->ttm, man))
 		return;
 
@@ -378,6 +401,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	err = drmm_mutex_init(&xe->drm, &mgr->lock);
 	if (err)
 		return err;
+	INIT_LIST_HEAD(&mgr->offlined_pages);
+	INIT_LIST_HEAD(&mgr->queued_pages);
 	mgr->default_page_size = default_page_size;
 	mgr->visible_size = io_size;
 	mgr->visible_avail = io_size;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 9106da056b49..dc97b0ad0e51 100644
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
@@ -45,4 +53,34 @@ struct xe_ttm_vram_mgr_resource {
 	unsigned long flags;
 };
 
+/**
+ * enum xe_page_reserve_status - Buddy reservation status
+ * @XE_PAGE_RESERVE_PENDING: reservation in progress
+ * @XE_PAGE_RESERVE_FAIL: reservation failed
+ */
+enum xe_page_reserve_status {
+	XE_PAGE_RESERVE_PENDING = 0,
+	XE_PAGE_RESERVE_FAIL,
+};
+
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
+	/** @status: buddy reservation status */
+	enum xe_page_reserve_status status;
+	/** @rcu: RCU head for deferred freeing */
+	struct rcu_head rcu;
+};
+
 #endif
-- 
2.52.0

