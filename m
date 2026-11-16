Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFCF606A337
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 12:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=YGxzn9ik
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917A510EFD9;
	Mon, 16 Nov 2026 12:27:41 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC3610F013
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 12:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1794832044;
 bh=Oj3tSnYk8b8rk6gsF0DUVMVUMKWdo20Lf+PJTLiv3k0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YGxzn9iks8W3z2WodJAUKt3NdeTOOUFNec1ns/Hj6K8FhYjenYHtDEEd0wXym8oma
 hGJbhGKth8xxPBV+nhiuG6uDQAKUsvFebZJAC32l1Bmhgc6GgSnWnzSW2SC/PoVsib
 qPdgICH6wFrzdHwARmx6V+iIXCvVIeIrDFIWBEDWUBV3GNsl0QSU48+LXygOmjkziI
 lpuFUMLqnRsXZEEpATvs4b9XMU0iTFYWmdvn+AVuw0qlPB5ckE/k4Yq6XXcNpcIok2
 +Ml1HnDvrtOQtU4nNxmSPywikUEz5sYAdNdDOYbBns0FV5BWC12FM5qhsPPauBq/Qh
 7zl/K4LG2ebaA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v4 5/6] drm/xe/display: Remove duplicated code
Date: Mon, 16 Nov 2026 13:28:34 +0100
Message-ID: <20261116122828.266113-13-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116122828.266113-8-dev@lankhorst.se>
References: <20261116122828.266113-8-dev@lankhorst.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
2.55.0

