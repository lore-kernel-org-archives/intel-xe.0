Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9217C7EE2F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 10:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E03F10E4B9;
	Wed,  7 Jun 2023 10:05:30 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F09D10E4B8
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 10:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686132328; x=1717668328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hifZZ3yJoAv2x3Os7NufrS34Myt76B4wN3OuFyzZhV0=;
 b=fJRG8NX4Ooa42lEI7yHiwRAi9I6ZfO2WIvcVNPRlFr59zDMGQet2U/8Y
 hjWEtatsCdUYL+8A7mDqtGvh6OqNcICuT0CuK8GX466ztGsbF6HhwONbl
 L6NmchgbbIAQ7OrW+kEsBdfYE7+Kw/SBWLSWaHwHEN5+x/oIf4QESb+f7
 RyEM3ylwBYfradeyovq6Qw6fOoV3IHWgYC4DFHH8h+ASZ8wQkKisWR8cV
 MM5yqcyUVTHnkM+7hvIOxhLD5sZC6agUy5A3p37nGIuXGDYyEC/Ii+0/e
 yzFKKnUJo0ZMRzq1epjvt+WwwJLTvoNbsBvT3u0QGcrmwt6rQt6DDRmlc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="356954284"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="356954284"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 03:05:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="1039539986"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="1039539986"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2023 03:05:26 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  7 Jun 2023 15:41:03 +0530
Message-Id: <20230607101103.2127088-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230607101103.2127088-1-tejas.upadhyay@intel.com>
References: <20230607101103.2127088-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
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

Add sysfs entry to read per tile physical memory
including stolen memory.

V2:
  - Use DEVICE_ATTR_RO - Aravind
  - Dont put kobj on sysfs_file_create fail - Himal
  - Skip addr_range sysfs create for non dgfx - Himal

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
 drivers/gpu/drm/xe/xe_mmio.c         |  1 +
 drivers/gpu/drm/xe/xe_tile_sysfs.c   | 29 ++++++++++++++++++++++------
 3 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index db61da4d6212..b8a07826c65f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -107,6 +107,12 @@ struct xe_tile {
 
 	/** @mem: memory management info for tile */
 	struct {
+		/**
+		 * @actual_physical_mem: Track actual LMEM size
+		 * including stolen mem for tile
+		 */
+		resource_size_t actual_physical_mem;
+
 		/**
 		 * @vram: VRAM info for tile.
 		 *
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f7a7f996b37f..6febd11d7dd9 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -277,6 +277,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		if (err)
 			return err;
 
+		tile->mem.actual_physical_mem = tile_size;
 		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
 		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
 
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index 09a4a8342aec..b5768c735cba 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -22,6 +22,21 @@ static struct kobj_type xe_tile_sysfs_kobj_type = {
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
+static ssize_t
+addr_range_show(struct device *kdev, struct device_attribute *attr, char *buf)
+{
+	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
+
+	return sysfs_emit(buf, "%pa\n", &tile->mem.actual_physical_mem);
+}
+
+static DEVICE_ATTR_RO(addr_range);
+
+static const struct attribute *addr_range_attrs[] = {
+	&dev_attr_addr_range.attr,
+	NULL
+};
+
 static void tile_sysfs_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_tile *tile = arg;
@@ -37,10 +52,8 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
 	int err;
 
 	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
-	if (!kg) {
-		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
+	if (!kg)
 		return -ENOMEM;
-	}
 
 	kobject_init(&kg->base, &xe_tile_sysfs_kobj_type);
 	kg->tile = tile;
@@ -48,16 +61,20 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
 	err = kobject_add(&kg->base, &dev->kobj, "tile%d", tile->id);
 	if (err) {
 		kobject_put(&kg->base);
-		drm_warn(&xe->drm, "failed to register TILE sysfs directory, err: %d\n", err);
+		drm_err(&xe->drm, "failed to register TILE sysfs directory, err: %d\n", err);
 		return err;
 	}
 
 	tile->sysfs = &kg->base;
 
+	if (sysfs_create_files(tile->sysfs, addr_range_attrs) && IS_DGFX(xe))
+		drm_warn(&xe->drm,
+			 "Sysfs creation to read addr_range per tile failed\n");
+
 	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
 	if (err) {
-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
-			 __func__, err);
+		drm_err(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
+			__func__, err);
 		return err;
 	}
 
-- 
2.25.1

