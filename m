Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C24C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 04:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5C010E012;
	Wed,  6 Dec 2023 04:33:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC71E10E012
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 04:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701837199; x=1733373199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z+1OxKDEjWWu8C4AeYz3unwK6MX+D1cE7m/FLn/Hg0w=;
 b=Evk8gCW8M/DuGWdn54iX+/wbTeMANSFl2VnBFJFed0aO3eDwoFtneP93
 sCP2tVbtSH9aZ6sGNZQi6YYL8ztn4dYptXPokmXC79MDq/gN8kys4PcLV
 b0c5oU6FFN2bCFLbrNxqJExoQ0Fh0ICRqCsam/XJVy5TpzBEWZbAwr1Px
 MqxnXuFORd1HhWMvraP5QGC9iWuI9QBHnwXO8DAfnbnRebabIfx+/n57L
 rVM3Bt8j6zCMbVqOWsnlSiuu8MSOeJxKmmrICQ8fzB/gEvgqpHaWdp8z6
 yGVGXeM9zBUo5rx2IhN+UZTyZ4Ph6OCdllQpjwv0xOuHFlGm5aBTtFj1p w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="379023491"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="379023491"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 20:33:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="800216716"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="800216716"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga008.jf.intel.com with ESMTP; 05 Dec 2023 20:33:18 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 10:17:34 +0530
Message-Id: <20231206044735.966213-2-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206044735.966213-1-sujaritha.sundaresan@intel.com>
References: <20231206044735.966213-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory under tile
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add a new memory directory under /device/tile<n> and move
physical_vram_size attribute to the new directory.

New hierarchy:

/device/tile<n>/memory/physical_vram_size_bytes

v2: Fix heading typo (Riana)
    Fix cleanup error on unload/reload cycle

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_tile_sysfs.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index 16376607c68f..e8ce4d9270e6 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -24,7 +24,8 @@ static ssize_t
 physical_vram_size_bytes_show(struct device *kdev, struct device_attribute *attr,
 			      char *buf)
 {
-	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
+	struct kobject *kobj = &kdev->kobj;
+	struct xe_tile *tile = kobj_to_tile(kobj->parent);
 
 	return sysfs_emit(buf, "%llu\n", tile->mem.vram.actual_physical_size);
 }
@@ -38,7 +39,7 @@ static void tile_sysfs_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_tile *tile = arg;
 
-	kobject_put(tile->sysfs);
+	kobject_del(tile->sysfs);
 }
 
 void xe_tile_sysfs_init(struct xe_tile *tile)
@@ -46,6 +47,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 	struct xe_device *xe = tile_to_xe(tile);
 	struct device *dev = xe->drm.dev;
 	struct kobj_tile *kt;
+	struct kobject *kobj;
 	int err;
 
 	kt = kzalloc(sizeof(*kt), GFP_KERNEL);
@@ -64,8 +66,15 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 
 	tile->sysfs = &kt->base;
 
+	kobj = kobject_create_and_add("memory", tile->sysfs);
+	if (!kobj) {
+		kobject_put(kobj);
+		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
+		return;
+	}
+
 	if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
-	    sysfs_create_file(tile->sysfs, physical_memsize_attr))
+	    sysfs_create_file(kobj, physical_memsize_attr))
 		drm_warn(&xe->drm,
 			 "Sysfs creation to read addr_range per tile failed\n");
 
-- 
2.25.1

