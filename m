Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873CFC3ABAC
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 10:36:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4907810E8F5;
	Fri,  2 May 2025 10:36:51 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180CD10E8F4
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 10:36:50 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [CI 09/10] drm/xe: Implement a helper for reading out a GGTT PTE at a
 specified offset
Date: Fri,  2 May 2025 12:36:36 +0200
Message-ID: <20250502103638.521845-10-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250502103638.521845-1-dev@lankhorst.se>
References: <20250502103638.521845-1-dev@lankhorst.se>
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
 drivers/gpu/drm/xe/xe_ggtt.h                  |  1 +
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 6502b82741732..59b2ff2026d47 100644
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
index ee9475d3bb4fb..6cf7af8e71e33 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -919,3 +919,15 @@ u64 xe_ggtt_encode_pte_flags(struct xe_ggtt *ggtt,
 {
 	return ggtt->pt_ops->pte_encode_flags(bo, pat_index);
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
index 437ba65f33860..600a76526cf34 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -50,5 +50,6 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt);
 #endif
 
 u64 xe_ggtt_encode_pte_flags(struct xe_ggtt *ggtt, struct xe_bo *bo, u16 pat_index);
+u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset);
 
 #endif
-- 
2.45.2

