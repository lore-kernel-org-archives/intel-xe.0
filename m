Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC704CDD1B2
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 14:14:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A0110EC5F;
	Fri, 27 Sep 2024 14:14:21 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7927410EC67
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 14:14:04 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 07/14] drm/xe: Add xe_ggtt_alloc
Date: Fri, 27 Sep 2024 16:13:57 +0200
Message-ID: <20240927141404.163317-8-maarten.lankhorst@linux.intel.com>
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

Instead of allocating inside xe_tile, create a new function that returns
an allocated struct xe_ggtt from xe_ggtt.c

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 8 ++++++++
 drivers/gpu/drm/xe/xe_ggtt.h | 2 ++
 drivers/gpu/drm/xe/xe_tile.c | 4 +---
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 7e5a79365158..4866e9b252ad 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -159,6 +159,14 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 	}
 }
 
+struct xe_ggtt *xe_ggtt_alloc(struct xe_tile *tile)
+{
+	struct xe_ggtt *ggtt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*ggtt), GFP_KERNEL);
+	if (ggtt)
+		ggtt->tile = tile;
+	return ggtt;
+}
+
 static void ggtt_fini_early(struct drm_device *drm, void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 62c8ce636939..0bab1fd7cc81 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -9,7 +9,9 @@
 #include "xe_ggtt_types.h"
 
 struct drm_printer;
+struct xe_tile;
 
+struct xe_ggtt *xe_ggtt_alloc(struct xe_tile *tile);
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 164751bd9af2..1cd4450305a6 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -86,11 +86,9 @@ static int xe_tile_alloc(struct xe_tile *tile)
 {
 	struct drm_device *drm = &tile_to_xe(tile)->drm;
 
-	tile->mem.ggtt = drmm_kzalloc(drm, sizeof(*tile->mem.ggtt),
-				      GFP_KERNEL);
+	tile->mem.ggtt = xe_ggtt_alloc(tile);
 	if (!tile->mem.ggtt)
 		return -ENOMEM;
-	tile->mem.ggtt->tile = tile;
 
 	tile->mem.vram_mgr = drmm_kzalloc(drm, sizeof(*tile->mem.vram_mgr), GFP_KERNEL);
 	if (!tile->mem.vram_mgr)
-- 
2.45.2

