Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AA9C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 12:05:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DEB89823;
	Mon,  8 Jul 2024 12:05:41 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F1389823
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 12:05:39 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH] drm/xe: Simplify selecting caching mode
Date: Mon,  8 Jul 2024 14:05:50 +0200
Message-ID: <20240708120550.131683-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

The switch is slightly overkill, with the default already set to cached
since previous commit.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 31192d983d9e..d3511dd4a488 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -364,15 +364,6 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 	 * CPU.
 	 */
 	if (!IS_DGFX(xe)) {
-		switch (bo->cpu_caching) {
-		case DRM_XE_GEM_CPU_CACHING_WC:
-			caching = ttm_write_combined;
-			break;
-		default:
-			caching = ttm_cached;
-			break;
-		}
-
 		WARN_ON((bo->flags & XE_BO_FLAG_USER) && !bo->cpu_caching);
 
 		/*
@@ -381,7 +372,8 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 		 * For Xe_LPG and beyond, PPGTT PTE lookups are also
 		 * non-coherent and require a CPU:WC mapping.
 		 */
-		if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
+		if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WC ||
+		    (!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
 		    (xe->info.graphics_verx100 >= 1270 &&
 		     bo->flags & XE_BO_FLAG_PAGETABLE))
 			caching = ttm_write_combined;
-- 
2.45.2

