Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD77C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 12:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CEA10E9AC;
	Thu,  3 Apr 2025 12:45:35 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B30510E238
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 12:45:32 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 6/6] drm/xe: Implement a helper for reading out a GGTT PTE at
 a specified offset
Date: Thu,  3 Apr 2025 14:45:20 +0200
Message-ID: <20250403124520.470916-7-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250403124520.470916-1-dev@lankhorst.se>
References: <20250403124520.470916-1-dev@lankhorst.se>
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

Split the GGTT PTE readout to a separate function, this is useful for
adding testcases in the next commit, and also cleaner than manually
reading out GGTT.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  6 +-----
 drivers/gpu/drm/xe/xe_ggtt.c                  | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h                  |  2 ++
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 4ca0cb5711941..67f712472ca26 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -87,12 +87,8 @@ initial_plane_bo(struct xe_device *xe,
 
 	base = round_down(plane_config->base, page_size);
 	if (IS_DGFX(xe)) {
-		u64 __iomem *gte = tile0->mem.ggtt->gsm;
-		u64 pte;
+		u64 pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
 
-		gte += base / XE_PAGE_SIZE;
-
-		pte = ioread64(gte);
 		if (!(pte & XE_GGTT_PTE_DM)) {
 			drm_err(&xe->drm,
 				"Initial plane programming missing DM bit\n");
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index e37dc2149f9a3..8d2f4ab6ee131 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -904,3 +904,15 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
 
 	return total;
 }
+
+/**
+ * xe_ggtt_read_pte - Read a PTE from the GGTT
+ * @ggtt: &xe_ggtt
+ * @offset: the offset for which the mapping should be read.
+ *
+ * Used by testcases, and by display reading out an inherited bios FB.
+ */
+u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
+{
+	return ioread64(ggtt->gsm + (offset / XE_PAGE_SIZE));
+}
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index c48da99908848..ca606d610ea4f 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -49,4 +49,6 @@ static inline void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
 void xe_ggtt_might_lock(struct xe_ggtt *ggtt);
 #endif
 
+u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset);
+
 #endif
-- 
2.45.2

