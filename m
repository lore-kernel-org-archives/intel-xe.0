Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB9F606A323
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 10:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OgT07rm8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAE810E3A5;
	Thu, 26 Nov 2026 10:47:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD4B112273
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 10:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795689969; x=1827225969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v2bWEXKPxuQjTxdZtIciNNW/4UfXZojiuHi227DrIYM=;
 b=OgT07rm8e5uG2/VeDCZb6SNawPIbeTF4azmdgDDjWpxq1L3xjLFCnny0
 hZzESqEPxdy8wIwIGPJUiehy8nhwh0CgscyA5w7JQwaHgPKEga2FLaZT9
 ngh+FuKZeRwEZSEZR6Aaee8zAeJMTtn/TKUYDDqfGwnz0X7YuGwv9m5BZ
 3E+VKpYFFNf41fWuaIrV7BoTl50q163hOzzXH71fGWxVxDgwu/5lWG0nZ
 sqhwxOqMZwr86s/tcHAqyQBcIEV0Zb06VsmBPXlZV6zzykEQMIazCiTUr
 IV0lhZfj/O035G62rXFZ+wP9HVgDzNrsSQ4wwnD6KwTYxJ7oRIucAlqZy g==;
X-CSE-ConnectionGUID: Ri7TsfD5QNqW+j9MtOTNsg==
X-CSE-MsgGUID: kc4an1FvQq+bYVOUqoF80w==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4605051"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4605051"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:46:09 -0800
X-CSE-ConnectionGUID: KD5pwy19SnOoUT+hx/GkaA==
X-CSE-MsgGUID: VVJMRFdlR0aFi5djiBJfRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12744906"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:46:07 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 arvind.yadav@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V3 2/3] drm/xe/vram: don't let firmware-confirmed permanent
 bad pages decay back in
Date: Thu, 26 Nov 2026 16:15:55 +0530
Message-ID: <20261126104552.3890797-7-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261126104552.3890797-5-tejas.upadhyay@intel.com>
References: <20261126104552.3890797-5-tejas.upadhyay@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

get_offline_list() reloads pages from firmware's non-volatile permanent
storage at probe time -- these are pages already confirmed bad across a
prior boot, not a fresh first-time report. The reservation path always
marked new entries XE_PAGE_OFFLINE_SOFT regardless of origin, making
these permanently-bad pages eligible for the SOFT-offline decay timer
and silently reinstating known-bad memory back into the allocator once
the decay window elapsed.

Thread a 'permanent' flag from handle_page_offline() (derived from the
existing notify_fw distinction: get_offline_list() calls with
notify_fw=false, live/queued HW reports call with notify_fw=true) down
through xe_ttm_vram_handle_addr_fault() to the reservation path, so
these entries are created directly as XE_PAGE_OFFLINE_HARD and are
never eligible for decay.

The two debug/test fault-injection call sites (xe_ttm_vram_inject_fault(),
xe_debugfs.c's inject_mempage_offline_trigger()) pass permanent=false,
preserving existing first-time-report test behavior.

v3:
- Add missing @permanent kernel-doc parameter description on
  xe_ttm_vram_handle_addr_fault() (review comment).

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      |  2 +-
 drivers/gpu/drm/xe/xe_ras.c          |  7 ++++++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 20 ++++++++++++++------
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  2 +-
 4 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index bc62d1054d29..d4e7fd0b1101 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -121,7 +121,7 @@ static ssize_t inject_mempage_offline_trigger(struct file *f,
 		return xe_ttm_vram_inject_fault(xe) ?: size;
 
 	/* User provided PFN - convert to DPA and inject */
-	return xe_ttm_vram_handle_addr_fault(xe, pfn << PAGE_SHIFT) ?: size;
+		return xe_ttm_vram_handle_addr_fault(xe, pfn << PAGE_SHIFT, false) ?: size;
 }
 
 static const struct file_operations inject_mempage_offline_fops = {
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 9b04be3405ca..09e8e1d3a26a 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -330,7 +330,12 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
 
 	addr = ALIGN_DOWN(page_address, PAGE_SIZE);
 
-	ret = xe_ttm_vram_handle_addr_fault(xe, addr);
+	/*
+	 * Pages sourced from firmware's permanent (non-volatile) list are
+	 * already confirmed bad from a prior boot (notify_fw == false); mark
+	 * them HARD so they're never eligible for decay-based reinstatement.
+	 */
+	ret = xe_ttm_vram_handle_addr_fault(xe, addr, !notify_fw);
 
 	/*
 	 * Handle return code from address fault handling function:
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 30c3fe00c0f3..5aee3e135143 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -851,7 +851,8 @@ static struct xe_bo *xe_ttm_vram_block_owner_get(struct xe_device *xe,
 }
 
 static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
-					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm)
+					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm,
+					    bool permanent)
 {
 	struct xe_ttm_vram_offline_resource *nentry;
 	struct xe_bo *pbo_to_put = NULL;
@@ -873,7 +874,11 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
 		INIT_LIST_HEAD(&nentry->blocks);
 		nentry->status = XE_PAGE_RESERVE_PENDING;
 		nentry->addr = addr;
-		nentry->mode = XE_PAGE_OFFLINE_SOFT;
+		/*
+		 * Pages reloaded from firmware's non-volatile permanent list are
+		 * already confirmed bad by a prior boot; never let them decay back in.
+		 */
+		nentry->mode = permanent ? XE_PAGE_OFFLINE_HARD : XE_PAGE_OFFLINE_SOFT;
 		nentry->last_seen = jiffies;
 
 		if (block) {
@@ -914,7 +919,7 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
 			}
 			++vram_mgr->n_offlined_pages;
 			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
-			if (vram_mgr->decay_interval_jiffies &&
+			if (!permanent && vram_mgr->decay_interval_jiffies &&
 			    !delayed_work_pending(&vram_mgr->decay_gc_work)) {
 				schedule_delayed_work(&vram_mgr->decay_gc_work,
 						      xe_ttm_vram_decay_gc_period(vram_mgr));
@@ -986,6 +991,9 @@ static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_device *xe, u
  * xe_ttm_vram_handle_addr_fault - Handle vram physical address error flagged
  * @xe: pointer to parent device
  * @addr: physical faulty address
+ * @permanent: true if the address is already confirmed bad from a prior boot
+ * (e.g. sourced from firmware's non-volatile list) and must never be eligible
+ * for decay-based reinstatement
  *
  * Handle the physical faulty address error on specific tile.
  *
@@ -1000,7 +1008,7 @@ static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_device *xe, u
  * pending if the blocks backing it could not be freed immediately; the
  * reservation is then completed from xe_ttm_vram_mgr_del().
  */
-int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
+int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr, bool permanent)
 {
 	struct xe_ttm_vram_mgr *vram_mgr;
 	struct xe_vram_region *vr;
@@ -1037,7 +1045,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
 	}
 
 	/* Reserve page at address */
-	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
+	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm, permanent);
 }
 EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
 
@@ -1088,7 +1096,7 @@ int xe_ttm_vram_inject_fault(struct xe_device *xe)
 		 * test-only path.
 		 */
 		if (found)
-			return xe_ttm_vram_handle_addr_fault(xe, addr + vr->dpa_base);
+			return xe_ttm_vram_handle_addr_fault(xe, addr + vr->dpa_base, false);
 
 		cond_resched();
 		if (addr == 0)
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index d77f067d197b..3c1f1f8b8061 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -31,7 +31,7 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man);
 u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
 void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 			  u64 *used, u64 *used_visible);
-int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
+int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr, bool permanent);
 int xe_ttm_vram_inject_fault(struct xe_device *xe);
 
 static inline struct xe_ttm_vram_mgr_resource *
-- 
2.52.0

