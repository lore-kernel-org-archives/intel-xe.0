Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED21C44533
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 16:14:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A667410E9DB;
	Mon, 20 Jul 2026 16:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="bp4PvRVH";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD40C10E9D8;
 Mon, 20 Jul 2026 16:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784564042;
 bh=1ilXV1ruY7BQvEGVqL1OB+0hXILiBF0dkaaGTSeb0WM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bp4PvRVHrpajqZlQzXgEVD7W+XyG6+hI1ELEGfsg1YwwbS5mwfefJfpykI3VcZZu2
 tVQHor8ePk12X+njrJ50QbM8fQDmLKou54ER+899PF6QEgYfRQExb8zQIpzqnU9R5F
 pQio/5CM1We1g+YUpyqkJbp7MJuYCow2Bn+dHLdifhiCqOfOIo3qu83dA/AAgtDHet
 1sr1ZCo93s9mQk9q5XrNDAm06ZlRV7/+cXDx4i79U4PEXe2mYG1ghcUw1HjFUY20x2
 szw6uishfP3XU9j3bU4k6eHdf9YeU7mAWfJicAdxGpRC09Dk3Ui74VdIwU0NFgcSaV
 1CARoOhLPI+8Q==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Maarten Lankhorst <dev@lankhorst.se>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [DO NOT REVIEW 05/11] drm/xe/display: Remove duplicated code
Date: Mon, 20 Jul 2026 18:14:57 +0200
Message-ID: <20260720161451.384968-18-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260720161451.384968-13-dev@lankhorst.se>
References: <20260720161451.384968-13-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The order of pte vs checks isn't important, so read the pte
outside the if block. This makes it slightly more readable.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 33 ++++++-------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 451c24a4ed8d5..1366b68f43fc2 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -45,7 +45,7 @@ initial_plane_bo(struct xe_device *xe,
 	struct xe_bo *bo;
 	resource_size_t phys_base;
 	u32 base, size, flags;
-	u64 page_size = xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
+	u64 page_size = xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K, pte;
 	struct xe_ggtt_node *original_ggtt_node;
 
 	if (plane_config->size == 0)
@@ -58,16 +58,14 @@ initial_plane_bo(struct xe_device *xe,
 			page_size);
 	size -= base;
 
-	if (IS_DGFX(xe)) {
-		u64 pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
-
-		if (is_pte_local(pte) != need_pte_local(xe)) {
-			drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
-			return NULL;
-		}
-
-		phys_base = pte & ~(page_size - 1);
+	pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
+	phys_base = pte & ~(page_size - 1);
+	if (is_pte_local(pte) != need_pte_local(xe)) {
+		drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
+		return NULL;
+	}
 
+	if (IS_DGFX(xe)) {
 		flags |= XE_BO_FLAG_VRAM0;
 
 		/*
@@ -85,24 +83,13 @@ initial_plane_bo(struct xe_device *xe,
 			    "Using phys_base=%pa, based on initial plane programming\n",
 			    &phys_base);
 	} else {
-		struct ttm_resource_manager *stolen;
-		u64 pte;
-
-		stolen = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
-		if (!stolen) {
+		if (!ttm_manager_type(&xe->ttm, XE_PL_STOLEN)) {
 			drm_dbg_kms(&xe->drm, "No stolen for initial FB\n");
 			return NULL;
 		}
 
-		pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
-
-		if (is_pte_local(pte) != need_pte_local(xe)) {
-			drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
-			return NULL;
-		}
-
-		phys_base = (pte & ~(page_size - 1)) - xe_ttm_stolen_gpu_offset(xe);
 		flags |= XE_BO_FLAG_STOLEN;
+		phys_base -= xe_ttm_stolen_gpu_offset(xe);
 
 		if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
 		    IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION) &&
-- 
2.53.0

