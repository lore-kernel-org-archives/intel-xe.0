Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2850CDD1B2
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 14:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EEC10EC61;
	Fri, 27 Sep 2024 14:14:04 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB7810E1B0
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 14:14:00 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 01/14] drm/xe/display: Handle stolen bar readout in the same
 way as lmem
Date: Fri, 27 Sep 2024 16:13:51 +0200
Message-ID: <20240927141404.163317-2-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927141404.163317-1-maarten.lankhorst@linux.intel.com>
References: <20240927141404.163317-1-maarten.lankhorst@linux.intel.com>
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

i915 already does this, we should do the same for Xe.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 1b10ea499d8c..cf139921e781 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -69,7 +69,7 @@ initial_plane_bo(struct xe_device *xe,
 	flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_SCANOUT | XE_BO_FLAG_GGTT;
 
 	base = round_down(plane_config->base, page_size);
-	if (IS_DGFX(xe)) {
+	if (IS_DGFX(xe) || GRAPHICS_VERx100(xe) >= 1270) {
 		u64 __iomem *gte = tile0->mem.ggtt->gsm;
 		u64 pte;
 
@@ -83,7 +83,6 @@ initial_plane_bo(struct xe_device *xe,
 		}
 
 		phys_base = pte & ~(page_size - 1);
-		flags |= XE_BO_FLAG_VRAM0;
 
 		/*
 		 * We don't currently expect this to ever be placed in the
@@ -105,7 +104,6 @@ initial_plane_bo(struct xe_device *xe,
 		if (!stolen)
 			return NULL;
 		phys_base = base;
-		flags |= XE_BO_FLAG_STOLEN;
 
 		if (XE_WA(xe_root_mmio_gt(xe), 22019338487_display))
 			return NULL;
@@ -120,6 +118,11 @@ initial_plane_bo(struct xe_device *xe,
 			return NULL;
 	}
 
+	if (IS_DGFX(xe))
+		flags |= XE_BO_FLAG_VRAM0;
+	else
+		flags |= XE_BO_FLAG_STOLEN;
+
 	size = round_up(plane_config->base + plane_config->size,
 			page_size);
 	size -= base;
-- 
2.45.2

