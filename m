Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECF4D44D75
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 14:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF0210E701;
	Wed,  6 Nov 2024 14:38:22 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185F710E6F4;
 Wed,  6 Nov 2024 14:38:21 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maarten@mblankhorst.nl, Lankhorst@mblankhorst.nl, dev@lankhorst.se
Subject: [PATCH 03/10] drm/xe: Move suballocator init to after display init
Date: Wed,  6 Nov 2024 15:38:30 +0100
Message-ID: <20241106143837.195642-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241106143837.195642-1-maarten.lankhorst@linux.intel.com>
References: <20241106143837.195642-1-maarten.lankhorst@linux.intel.com>
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

No allocations should be done before we have had a chance to preserve
the display fb.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241105121857.17389-3-maarten.lankhorst@linux.intel.com
Signed-off-by: Maarten Lankhorst,,, <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_device.c |  6 ++++++
 drivers/gpu/drm/xe/xe_tile.c   | 12 ++++++++----
 drivers/gpu/drm/xe/xe_tile.h   |  1 +
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ef3ccd2d0ba8f..dda7552ad1a55 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -739,6 +739,12 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err;
 
+	for_each_tile(tile, xe, id) {
+		err = xe_tile_init(tile);
+		if (err)
+			goto err;
+	}
+
 	for_each_gt(gt, xe, id) {
 		last_gt = id;
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 07cf7cfe4abd5..2825553b568f7 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -170,10 +170,6 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 	if (err)
 		return err;
 
-	tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);
-	if (IS_ERR(tile->mem.kernel_bb_pool))
-		return PTR_ERR(tile->mem.kernel_bb_pool);
-
 	xe_wa_apply_tile_workarounds(tile);
 
 	err = xe_tile_sysfs_init(tile);
@@ -181,6 +177,14 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 	return 0;
 }
 
+int xe_tile_init(struct xe_tile *tile)
+{
+	tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);
+	if (IS_ERR(tile->mem.kernel_bb_pool))
+		return PTR_ERR(tile->mem.kernel_bb_pool);
+
+	return 0;
+}
 void xe_tile_migrate_wait(struct xe_tile *tile)
 {
 	xe_migrate_wait(tile->migrate);
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index 1c9e42ade6b05..eb939316d55b0 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -12,6 +12,7 @@ struct xe_tile;
 
 int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
 int xe_tile_init_noalloc(struct xe_tile *tile);
+int xe_tile_init(struct xe_tile *tile);
 
 void xe_tile_migrate_wait(struct xe_tile *tile);
 
-- 
2.45.2

