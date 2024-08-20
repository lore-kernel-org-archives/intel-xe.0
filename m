Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E95CC531DF
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 17:29:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D99110E7FF;
	Tue, 20 Aug 2024 17:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ems6MeD7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FE010E7F1
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 17:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724174943; x=1755710943;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=y/HhkFy0cJsJs0c3XFSvYfqIMZIHtsV7eJmLJZ5+NPM=;
 b=Ems6MeD72I5JxMtSM1MDESEXazUZOXzYreF25Aj/OnxwMwy+1nsyae9B
 LnMoSji5uAq8H8131gPkbOcyk/zFsSHYoFiw7yejKlZ0UMs0RzKW1/dJt
 SWHLKx0T88bTKDbT5Nec1hs3sTykLFRpIC/zHdF3YYYHDaA18UO1blaeE
 qSGC/shJv8zYgK0ZXPnRN1PJf0WSV7P43jAHR5KCTq9xL3h6QKT9hbkpe
 ZOuMOAi8bxaQ1+ImQ1gids1wnp1x4jDwFZKvoDHBSiKLpjuQuendPiKWh
 1uA3v+TimQkUYTI7slf/aawG8eU3SUbhnF6qd7SaMNKEQFZ7V2kLfOYTj w==;
X-CSE-ConnectionGUID: dLMrBZ7GSpOP7EKSaKRK7w==
X-CSE-MsgGUID: kB9cFYO6TGuroI8UXTZgHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26365497"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="26365497"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:29:03 -0700
X-CSE-ConnectionGUID: 96qouNtGT8GeZ62vL2xBCw==
X-CSE-MsgGUID: //oYGBCZSm623E5Qs4lydw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65651740"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:29:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 6/6] drm/xe: Update xe_sa to use
 xe_managed_bo_create_pin_map
Date: Tue, 20 Aug 2024 10:29:58 -0700
Message-Id: <20240820172958.1095143-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820172958.1095143-1-matthew.brost@intel.com>
References: <20240820172958.1095143-1-matthew.brost@intel.com>
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

Preferred way to create kernel BOs is xe_managed_bo_create_pin_map, use
it.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sa.c       | 13 ++++++-------
 drivers/gpu/drm/xe/xe_sa_types.h |  1 +
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index f3060979e63f..fe2cb2a96f78 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -25,10 +25,9 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
 
 	drm_suballoc_manager_fini(&sa_manager->base);
 
-	if (bo->vmap.is_iomem)
+	if (sa_manager->is_iomem)
 		kvfree(sa_manager->cpu_ptr);
 
-	xe_bo_unpin_map_no_vm(bo);
 	sa_manager->bo = NULL;
 }
 
@@ -47,16 +46,17 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 
 	sa_manager->bo = NULL;
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel,
-				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				  XE_BO_FLAG_GGTT |
-				  XE_BO_FLAG_GGTT_INVALIDATE);
+	bo = xe_managed_bo_create_pin_map(xe, tile, size,
+					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+					  XE_BO_FLAG_GGTT |
+					  XE_BO_FLAG_GGTT_INVALIDATE);
 	if (IS_ERR(bo)) {
 		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
 			PTR_ERR(bo));
 		return (struct xe_sa_manager *)bo;
 	}
 	sa_manager->bo = bo;
+	sa_manager->is_iomem = bo->vmap.is_iomem;
 
 	drm_suballoc_manager_init(&sa_manager->base, managed_size, align);
 	sa_manager->gpu_addr = xe_bo_ggtt_addr(bo);
@@ -64,7 +64,6 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 	if (bo->vmap.is_iomem) {
 		sa_manager->cpu_ptr = kvzalloc(managed_size, GFP_KERNEL);
 		if (!sa_manager->cpu_ptr) {
-			xe_bo_unpin_map_no_vm(sa_manager->bo);
 			sa_manager->bo = NULL;
 			return ERR_PTR(-ENOMEM);
 		}
diff --git a/drivers/gpu/drm/xe/xe_sa_types.h b/drivers/gpu/drm/xe/xe_sa_types.h
index 2ef896aeca1d..2b070ff1292e 100644
--- a/drivers/gpu/drm/xe/xe_sa_types.h
+++ b/drivers/gpu/drm/xe/xe_sa_types.h
@@ -14,6 +14,7 @@ struct xe_sa_manager {
 	struct xe_bo *bo;
 	u64 gpu_addr;
 	void *cpu_ptr;
+	bool is_iomem;
 };
 
 #endif
-- 
2.34.1

