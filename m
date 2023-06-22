Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73587EB64DC
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 07:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B1B10E4DB;
	Thu, 22 Jun 2023 07:22:38 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618A710E4DB
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 07:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687418555; x=1718954555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L5+SwEdzObvyhYUepmC7hGEQDdiuK+rsVKSqUmKU6KM=;
 b=n7rP4FnebEqDiEBLL775rRoWEGwifu37L116xpPcE6j4zmRDyBybt1sL
 17jd3SP/qwnZQaJhUKsp7m6nuvEyjMncmChBMxH5YC0N3zjPEvgZSLdti
 Of/46QzpUNA7Pi8/Nv+RWnYns3H4oJCWrWD3MMekDTO/avmJn3RKUDVBo
 +f+1WoYYCAtdbs3WxL8ZBlhsn5uH19P6F/MjZuAIzSzSAMpali1HNNRRi
 0psmmRbU46js5U+W6JTu1foWmRrMSZeGL9WktigF/jQEYRZGH0mbsaT41
 uu8xWf6bhgfzKbLnol9Al6ShGzDDWoA98gvwmUckm8hrKjHIqctKGRAVh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="350150280"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; d="scan'208";a="350150280"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 00:22:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="664940038"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; d="scan'208";a="664940038"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 22 Jun 2023 00:22:22 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 22 Jun 2023 12:58:18 +0530
Message-Id: <20230622072818.3182423-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230622072818.3182423-1-tejas.upadhyay@intel.com>
References: <20230622072818.3182423-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V4 3/3] drm/xe: Add sysfs entry to report per
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
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
 drivers/gpu/drm/xe/xe_mmio.c         |  1 +
 drivers/gpu/drm/xe/xe_tile_sysfs.c   | 19 +++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f2d4298fb0a1..dada97352330 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -108,6 +108,12 @@ struct xe_tile {
 
 	/** @mem: memory management info for tile */
 	struct {
+		/**
+		 * @actual_physical_mem: Track actual VRAM size
+		 * including stolen mem for tile
+		 */
+		resource_size_t actual_physical_mem;
+
 		/**
 		 * @vram: VRAM info for tile.
 		 *
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f1336803b915..4bb8e8c3080e 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -277,6 +277,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		if (err)
 			return err;
 
+		tile->mem.actual_physical_mem = tile_size;
 		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
 		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
 
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index 386c6accd4dd..6b559e2f2f7b 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -20,6 +20,20 @@ static struct kobj_type xe_tile_sysfs_kobj_type = {
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
+static ssize_t
+physical_vram_size_bytes_show(struct device *kdev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
+
+	return sysfs_emit(buf, "%llu\n", tile->mem.actual_physical_mem);
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

