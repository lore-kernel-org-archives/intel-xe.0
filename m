Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F8AC2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 19:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68E510ED3C;
	Fri, 28 Jun 2024 19:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kE5G65td";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5341510ED3C
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 19:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719604429; x=1751140429;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=owTf2uqKB44bbkyACR1/QoMUzTViAjbEEM4uGcCzlfQ=;
 b=kE5G65td02Oocc9WN1B2s5T0AIzqJqvYI0TyPWPB7TeOsIM6lnzk1NhM
 ejoCZB+4emKNpbKdfJVU/z4kJNgr6D7ai2zvDSprbyedTXk31vPOY6gG4
 Oglf3VZb/z7OqPkXXVNK4Hg5gfMj48Cv/3lFNOkb8GDL3itxTsGfEfmK6
 aEbISuvkUwtVZKQ/+lv62NzVsf6ih8CAqTCBo1GG0jZnToCKrj3RDAgc6
 KahPvHKBzVll+aE/shuv6dpaktjXbMZfrMSQmr+HHKvfvO397vHhUIpCh
 6o74ZtItG2LVbLWlssZr3ptY/oTCT4LMKuG8vPtXBVH+AJmy8EXTBXTwk w==;
X-CSE-ConnectionGUID: Xym2DE9xQQ+gdGDturlqzg==
X-CSE-MsgGUID: OhWY5fiYQ2m83u2gEKlJ7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16927324"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="16927324"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 12:53:49 -0700
X-CSE-ConnectionGUID: 3/JMcMx6TkuFZjDZsVZ4eg==
X-CSE-MsgGUID: egwVSX27TnqYuQYn3/PScQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="44917104"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 12:53:48 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 4/4] drm/xe/lnl: Offload system clear page activity to GPU
Date: Fri, 28 Jun 2024 21:38:46 +0200
Message-ID: <20240628193846.26326-4-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240628193846.26326-1-nirmoy.das@intel.com>
References: <20240628193846.26326-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

On LNL because of flat CCS, driver creates a migrate job to clear
CCS meta data. Extend that to also clear system pages using GPU.
Inform TTM to allocate pages without __GFP_ZERO to avoid double page
clearing by clearing out TTM_TT_FLAG_ZERO_ALLOC flag and set
TTM_TT_FLAG_CLEARED_ON_FREE while freeing to skip ttm pool's
clearn-on-free as XE now takes care of clearing pages.

To test the patch, I created a small test that tries to submit a job
after binding various sizes of buffer which shows good gains for larger
buffer. For lower buffer sizes, the result is not very reliable as the
results vary a lot.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 27 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_device.c       |  7 +++++++
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4d6315d2ae9a..5f19d37cdeb4 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -387,6 +387,10 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 		caching = ttm_uncached;
 	}
 
+	/* If the device can support gpu clear pages then set proper ttm flag */
+	if (xe->mem.gpu_page_clear)
+		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
+
 	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
 	if (err) {
 		kfree(tt);
@@ -399,6 +403,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 			      struct ttm_operation_ctx *ctx)
 {
+	uint32_t old_page_flags;
 	int err;
 
 	/*
@@ -408,15 +413,25 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
 		return 0;
 
+	old_page_flags = tt->page_flags;
+
+	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear pages */
+	if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
+		tt->page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
+
 	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
 	if (err)
 		return err;
 
+	tt->page_flags = old_page_flags;
+
 	return err;
 }
 
 static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
 {
+	//struct xe_device *xe = ttm_to_xe_device(ttm_dev);
+
 	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
 		return;
 
@@ -650,9 +665,16 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	bool needs_clear;
 	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
 				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
-
 	int ret = 0;
 
+	/*
+	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path when
+	 * moving to system as the bo doesn't dma_mapping.
+	 */
+	if (!old_mem && ttm && !ttm_tt_is_populated(ttm)) {
+		ttm->page_flags &= ~TTM_TT_FLAG_CLEARED_ON_FREE;
+	}
+
 	/* Bo creation path, moving to system or TT. */
 	if ((!old_mem && ttm) && !handle_system_ccs) {
 		if (new_mem->mem_type == XE_PL_TT)
@@ -790,6 +812,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 					 handle_system_ccs;
 			bool clear_bo_data = mem_type_is_vram(new_mem->mem_type);
 
+			if (ttm && (ttm->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE))
+				clear_bo_data |= true;
+
 			fence = xe_migrate_clear(migrate, bo, new_mem,
 						 clear_bo_data, clear_ccs);
 		}
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cfda7cb5df2c..293579e35c2e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -636,6 +636,13 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err;
 
+	/**
+	 * On iGFX device with flat CCS, we clear CCS metadata, let's extend that
+	 * and use GPU to clear pages as well.
+	 */
+	if (xe_device_has_flat_ccs(xe) && !IS_DGFX(xe))
+		xe->mem.gpu_page_clear = true;
+
 	err = xe_vram_probe(xe);
 	if (err)
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c37be471d11c..ece68c6f3668 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -325,6 +325,8 @@ struct xe_device {
 		struct xe_mem_region vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
+		/** @gpu_page_clear: clear pages offloaded to GPU */
+		bool gpu_page_clear;
 	} mem;
 
 	/** @sriov: device level virtualization data */
-- 
2.42.0

