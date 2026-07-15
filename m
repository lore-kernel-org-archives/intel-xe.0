Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589EFC44514
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 11:05:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E39F10EFD1;
	Wed, 15 Jul 2026 11:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="B3g49HxL";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0631510EFC9;
 Wed, 15 Jul 2026 11:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784113510;
 bh=eowTLQqczcYI+CUVlxdNRWQEiE5if0J55Fz2gqOLbbs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B3g49HxL+Jc7zoUHa3+lYxS+JmD/337inocuYJ0iXbBced2ouxHSaZDE/zES7DN10
 R6nVvwLtrTuqOD4MX9KS751lcmy5u+GaGFgHYlrRWJfI2sGBtk7Xh5bmFdJX+yksiI
 NqHHihtCzFeezh8HmQJGdy+sN3XxQUgk5aRuZJhyifpg03CFBiZM+8eeR5i03FnM8n
 F96PgXBlGoS1pmTVhw0dzIhIlxaZQAmBu7qpA798xTTtD3Eq0qQLSXrVwazssDxhbO
 UFsqO797ULdbjNDG9Kc039FoKhA/UAG5DNnJPAY1fXzFiGJruh3wkR497kUuibe5JC
 EL+2hnvDfB/xw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 5/6] drm/xe/display: Remove duplicated code
Date: Wed, 15 Jul 2026 13:05:56 +0200
Message-ID: <20260715110557.2172095-6-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715110557.2172095-1-dev@lankhorst.se>
References: <20260715110557.2172095-1-dev@lankhorst.se>
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

The order of pte vs checks isn't important, so read the pte
outside the if block. This makes it slightly more readable.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 35 ++++++-------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 5540b0fca392a..e16a6a1e6288a 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -64,7 +64,7 @@ initial_plane_bo(struct xe_device *xe,
 	struct xe_bo *bo;
 	resource_size_t phys_base;
 	u32 base, size, flags;
-	u64 page_size = xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
+	u64 page_size = xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K, pte;
 	struct xe_ggtt_node *original_ggtt_node;
 
 	if (plane_config->size == 0)
@@ -77,16 +77,14 @@ initial_plane_bo(struct xe_device *xe,
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
@@ -104,25 +102,14 @@ initial_plane_bo(struct xe_device *xe,
 			    "Using phys_base=%pa, based on initial plane programming\n",
 			    &phys_base);
 	} else {
-		struct ttm_resource_manager *stolen;
-		u64 pte;
+		flags |= XE_BO_FLAG_STOLEN;
+		phys_base -= xe_ttm_stolen_gpu_offset(xe);
 
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
-		flags |= XE_BO_FLAG_STOLEN;
-
 		if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
 		    IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION) &&
 		    !xe_display_bo_fbdev_prefer_stolen(xe, plane_config->size)) {
-- 
2.53.0

