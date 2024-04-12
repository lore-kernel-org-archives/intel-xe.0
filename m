Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DF4C00A94
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 07:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F0310F365;
	Fri, 12 Apr 2024 07:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XztFC273";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68A610F4A6
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 07:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712908151; x=1744444151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uu+NbHkyo/UKoPbPIsVqyIe5kWWJ96Bvv1AG/3KbO24=;
 b=XztFC273s0OD5GPhbH5jVLgN83eH/3qRrAX2zpr6W268npQ1+ELFrtzN
 7ZUoqisbOSbBDQLCaE32aYnm3ywv2y5dblsxIVNaCEMAiDCOyO4bwXZvV
 GJy2hCsvDB6eM427j9ZFlPDCNB83jZl67YfaAVDsGwzNn30jphsBpdUVN
 kQFZYY3MYdNjucYHxJoWi2yjg3A+E8JSKnPHfkr0tMA/fAbOzZsUNQotT
 dRj2wY9szUbeI+eWOvqX134343jTMPmdlaX2Ytp64iV4MqRY58C//aubG
 YWwtLYxYaI9UQZMjokyBI702OazOHCR+dfg7CrxiMLB4nYiG23Uk/FgiT g==;
X-CSE-ConnectionGUID: GtJKDIU+RLqL5Kicskc4dQ==
X-CSE-MsgGUID: E6TdObX9SNqgPoTd+96ljQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="11317213"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="11317213"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 00:49:11 -0700
X-CSE-ConnectionGUID: ajHJgOm/ScK0ctrgabuQEQ==
X-CSE-MsgGUID: 4ncMozLdT2q3+wt1v8ciLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21220736"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa009.fm.intel.com with ESMTP; 12 Apr 2024 00:49:10 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 6/7] drm/xe/tile: Abort driver load for sysfs creation
 failure
Date: Fri, 12 Apr 2024 13:32:44 +0530
Message-Id: <20240412080245.1044902-7-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
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

Ensure that the status of all tile associated sysfs entries creation is
relayed to xe_tile_init_noalloc, leading to a driver load abort if any
sysfs creation failures occur.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_tile.c       |  2 +-
 drivers/gpu/drm/xe/xe_tile_sysfs.c | 17 ++++++++---------
 drivers/gpu/drm/xe/xe_tile_sysfs.h |  2 +-
 drivers/gpu/drm/xe/xe_vram_freq.c  | 21 +++++++++------------
 drivers/gpu/drm/xe/xe_vram_freq.h  |  2 +-
 5 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 0650b2fa75ef..409cf55aa8a1 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -173,7 +173,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 	}
 	xe_wa_apply_tile_workarounds(tile);
 
-	xe_tile_sysfs_init(tile);
+	err = xe_tile_sysfs_init(tile);
 
 err_mem_access:
 	xe_device_mem_access_put(tile_to_xe(tile));
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index 237a0761d3ad..3cd340984c34 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -29,7 +29,7 @@ static void tile_sysfs_fini(struct drm_device *drm, void *arg)
 	kobject_put(tile->sysfs);
 }
 
-void xe_tile_sysfs_init(struct xe_tile *tile)
+int  xe_tile_sysfs_init(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct device *dev = xe->drm.dev;
@@ -38,7 +38,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 
 	kt = kzalloc(sizeof(*kt), GFP_KERNEL);
 	if (!kt)
-		return;
+		return -ENOMEM;
 
 	kobject_init(&kt->base, &xe_tile_sysfs_kobj_type);
 	kt->tile = tile;
@@ -46,16 +46,15 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 	err = kobject_add(&kt->base, &dev->kobj, "tile%d", tile->id);
 	if (err) {
 		kobject_put(&kt->base);
-		drm_warn(&xe->drm, "failed to register TILE sysfs directory, err: %d\n", err);
-		return;
+		drm_err(&xe->drm, "failed to register TILE sysfs directory, err: %d\n", err);
+		return err;
 	}
 
 	tile->sysfs = &kt->base;
 
-	xe_vram_freq_sysfs_init(tile);
+	err = xe_vram_freq_sysfs_init(tile);
+	if (err)
+		return err;
 
-	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
-	if (err)
-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
-			 __func__, err);
+	return drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
 }
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.h b/drivers/gpu/drm/xe/xe_tile_sysfs.h
index e4f065039eba..54a2ba8ba533 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.h
@@ -8,7 +8,7 @@
 
 #include "xe_tile_sysfs_types.h"
 
-void xe_tile_sysfs_init(struct xe_tile *tile);
+int xe_tile_sysfs_init(struct xe_tile *tile);
 
 static inline struct xe_tile *
 kobj_to_tile(struct kobject *kobj)
diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
index c5f6b5a5d117..6208a5289a90 100644
--- a/drivers/gpu/drm/xe/xe_vram_freq.c
+++ b/drivers/gpu/drm/xe/xe_vram_freq.c
@@ -100,31 +100,28 @@ static void vram_freq_sysfs_fini(struct drm_device *drm, void *arg)
  * @tile: Xe Tile object
  *
  * It needs to be initialized after the main tile component is ready
+ *
+ * Returns: 0 on success, negative error code on error.
  */
-void xe_vram_freq_sysfs_init(struct xe_tile *tile)
+int xe_vram_freq_sysfs_init(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct kobject *kobj;
 	int err;
 
 	if (xe->info.platform != XE_PVC)
-		return;
+		return 0;
 
 	kobj = kobject_create_and_add("memory", tile->sysfs);
-	if (!kobj) {
-		drm_warn(&xe->drm, "failed to add memory directory, err: %d\n", -ENOMEM);
-		return;
-	}
+	if (!kobj)
+		return -ENOMEM;
 
 	err = sysfs_create_group(kobj, &freq_group_attrs);
 	if (err) {
 		kobject_put(kobj);
-		drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
-		return;
+		drm_err(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
+		return err;
 	}
 
-	err = drmm_add_action_or_reset(&xe->drm, vram_freq_sysfs_fini, kobj);
-	if (err)
-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
-			 __func__, err);
+	return drmm_add_action_or_reset(&xe->drm, vram_freq_sysfs_fini, kobj);
 }
diff --git a/drivers/gpu/drm/xe/xe_vram_freq.h b/drivers/gpu/drm/xe/xe_vram_freq.h
index cbe8c12fbd64..bf726bc5881f 100644
--- a/drivers/gpu/drm/xe/xe_vram_freq.h
+++ b/drivers/gpu/drm/xe/xe_vram_freq.h
@@ -8,6 +8,6 @@
 
 struct xe_tile;
 
-void xe_vram_freq_sysfs_init(struct xe_tile *tile);
+int xe_vram_freq_sysfs_init(struct xe_tile *tile);
 
 #endif /* _XE_VRAM_FREQ_H_ */
-- 
2.25.1

