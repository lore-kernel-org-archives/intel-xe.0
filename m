Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2980DC7EE45
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 07:40:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F326010E596;
	Thu,  8 Jun 2023 07:40:10 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11CF10E599
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 07:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686210007; x=1717746007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r2+TKw6Kj/2yGQGltqY2CPj3ihx37cVkfZ3LL5VB0qI=;
 b=S3KQ6Q7GQd7+owQ9xCJ8mgZpdnuK6P1evmtsef42mxRriUOHGxuhrRJf
 tLRa6Qzvsqi5ogqnHkPGdnJKYBYeZbPx86mlgSURqQsT+jSVz2aF3NT3m
 IytPDFpJS5EOiZO9Ntg+NrO6yZyIl9ri2PfpRfrK4V4SxKZzVfL9EUi0q
 d4aAwkiV8PnUDFGsgGiSRzQLdp89QrFsthKEJHzfE27FngNnn546YDB8G
 wYLKkjM2VC1Tn3CkRx8+5y5jkn9YhfhwG/y3DCvSYNDLgUObITZ14Qjz0
 /d1A44khwQBXFrrPfGlXzo7bDBhWiWxOOrD0W7tklDjlUyH1qRH++ZLyQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="357245688"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="357245688"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 00:40:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="660279594"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="660279594"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 08 Jun 2023 00:40:06 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  8 Jun 2023 13:15:44 +0530
Message-Id: <20230608074544.2186318-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230608074544.2186318-1-tejas.upadhyay@intel.com>
References: <20230608074544.2186318-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V3 3/3] drm/xe: Add sysfs entry to report per
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

V3:
  - Exclude DG1, replace sysfs_create_file/files - Aravind
V2:
  - Use DEVICE_ATTR_RO - Aravind
  - Dont put kobj on sysfs_file_create fail - Himal
  - Skip addr_range sysfs create for non dgfx - Himal

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
 drivers/gpu/drm/xe/xe_mmio.c         |  1 +
 drivers/gpu/drm/xe/xe_tile_sysfs.c   | 17 +++++++++++++++++
 3 files changed, 24 insertions(+)

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
index 5c9ebe40e3c3..b79b756e5e49 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -22,6 +22,18 @@ static struct kobj_type xe_tile_sysfs_kobj_type = {
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
+static const struct attribute *addr_range_attr = &dev_attr_addr_range.attr;
+
 static void tile_sysfs_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_tile *tile = arg;
@@ -52,6 +64,11 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 
 	tile->sysfs = &kt->base;
 
+	if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
+	    sysfs_create_file(tile->sysfs, addr_range_attr))
+		drm_warn(&xe->drm,
+			 "Sysfs creation to read addr_range per tile failed\n");
+
 	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
 	if (err) {
 		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
-- 
2.25.1

