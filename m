Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C94C61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 12:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEDE10E1CA;
	Fri, 24 Nov 2023 12:14:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60E710E1C8
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 12:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700828037; x=1732364037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vJJLCGz105j21QMjtC8kCSncASnGBRkU5Ow/L2T2xnU=;
 b=OUit3LBGPpuh8G7Ym92Gx3UMc3U2o7pbWyJs6doPTvxwV8tjAkKg+G/y
 M45pQ5PDdWPwYryC3ItU56eLJ2j+X/vVz3WoG/gVJ1S0pil1PetJTWoj6
 UbDNq1vbp8Nrp/Ayc5bDhXFgy1VT7jduV1POXln6LT/Ott/FuZCVepujh
 lm13iN5R0SL5rn1hwT6pOTE7NN2CqnQTcuPJYuSv5MQYuVnjfVjETancS
 lsgZwE3p14YZCSlsKwKx4k2X82UUUTKq2w2usngYHPAd5iqK03tElYCJv
 aSws4vgsH0IrOWESq759F7KLI8/T9L/ejcmeMMiWizYvW5jwAfCnHyE6f Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="396319884"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="396319884"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:13:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="833679746"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="833679746"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by fmsmga008.fm.intel.com with ESMTP; 24 Nov 2023 04:13:55 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 17:57:54 +0530
Message-Id: <20231124122755.91279-2-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231124122755.91279-1-sujaritha.sundaresan@intel.com>
References: <20231124122755.91279-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Add a new memory direcory under tile
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

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_tile_sysfs.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index 16376607c68f..f354c8b2bfc6 100644
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
@@ -46,6 +47,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 	struct xe_device *xe = tile_to_xe(tile);
 	struct device *dev = xe->drm.dev;
 	struct kobj_tile *kt;
+	struct kobject *kobj;
 	int err;
 
 	kt = kzalloc(sizeof(*kt), GFP_KERNEL);
@@ -64,8 +66,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 
 	tile->sysfs = &kt->base;
 
+	kobj = kobject_create_and_add("memory", tile->sysfs);
+	if (!kobj) {
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

