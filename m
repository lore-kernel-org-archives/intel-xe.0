Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC75EB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 07:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542FE10E366;
	Wed, 28 Jun 2023 07:09:29 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D6610E366
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 07:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687936166; x=1719472166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1pHJ45QFvB1Iebp9vFz9Pw1ERSi6heOHT9n08eeNXRM=;
 b=Q574zH0p15Pgbu1i4iHB1mP5B3lYJdIGjVEmkWvJgiBWx8TjDVJigtdn
 4uO2HYoA27DI/fuvl1MHE8Cl8ggq6yrOCmQSmvOY9azMqzIscEkjZeXmj
 TafJ0CZ8VNqeDjjgLY6mOSb0g6lFyZWdzRsrXPqg8D5j82dLs8Nmx/fcW
 W2RX1pfwkR5RV56UBdFjAQcwbC84zf/KfYFUJ82dZhOwbD6YNOvggtjNg
 9j9/19550hGhbg3gGYY+TXcf478GVB3Vc2u/xKj0BJNunI6mcDaQAwZrU
 RxlIs+CMfVH9JqG56O9FGCSG/qGlnEuKPS8lzdTOfOqUQDmpcgokpN4S/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="427777690"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="427777690"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 00:09:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="666984144"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="666984144"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 28 Jun 2023 00:09:23 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 28 Jun 2023 12:45:26 +0530
Message-Id: <20230628071527.3579428-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230628071527.3579428-1-tejas.upadhyay@intel.com>
References: <20230628071527.3579428-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V5 3/4] drm/xe: Add sysfs entry to report per
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

V5:
  - rename var name and make it part of vram struct - Lucas
V4:
  - %s/addr_range/physical_vram_size_byes, make it
    user readable name - Joonas/Aravind
  - Display in bytes - Joonas/Aravind
V3:
  - Exclude DG1, replace sysfs_create_file/files - Aravind
V2:
  - Use DEVICE_ATTR_RO - Aravind
  - Dont put kobj on sysfs_file_create fail - Himal
  - Skip addr_range sysfs create for non dgfx - Himal

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  5 +++++
 drivers/gpu/drm/xe/xe_mmio.c         |  1 +
 drivers/gpu/drm/xe/xe_tile_sysfs.c   | 19 +++++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f2d4298fb0a1..bd3e20ce3a4b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -131,6 +131,11 @@ struct xe_tile {
 			resource_size_t base;
 			/** @size: size of VRAM. */
 			resource_size_t size;
+			/**
+			 * @actual_physical_size: Actual VRAM size
+			 * including stolen mem for tile
+			 */
+			resource_size_t actual_physical_size;
 			/** @mapping: pointer to VRAM mappable space */
 			void *__iomem mapping;
 		} vram;
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f1336803b915..7d92258cd35d 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -277,6 +277,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		if (err)
 			return err;
 
+		tile->mem.vram.actual_physical_size = tile_size;
 		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
 		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
 
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index 2d64fa54b5a8..16376607c68f 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -20,6 +20,20 @@ static const struct kobj_type xe_tile_sysfs_kobj_type = {
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
+static ssize_t
+physical_vram_size_bytes_show(struct device *kdev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
+
+	return sysfs_emit(buf, "%llu\n", tile->mem.vram.actual_physical_size);
+}
+
+static DEVICE_ATTR_RO(physical_vram_size_bytes);
+
+static const struct attribute *physical_memsize_attr =
+	&dev_attr_physical_vram_size_bytes.attr;
+
 static void tile_sysfs_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_tile *tile = arg;
@@ -50,6 +64,11 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 
 	tile->sysfs = &kt->base;
 
+	if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
+	    sysfs_create_file(tile->sysfs, physical_memsize_attr))
+		drm_warn(&xe->drm,
+			 "Sysfs creation to read addr_range per tile failed\n");
+
 	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
 	if (err) {
 		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
-- 
2.25.1

