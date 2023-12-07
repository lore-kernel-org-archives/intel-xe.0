Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE31DC10F05
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 15:03:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDAC10E8CB;
	Thu,  7 Dec 2023 15:03:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0DC10E8CB
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 15:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701961412; x=1733497412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h+on2YL+VX9d3LQVQ+qWrBlED/Ny1N81UxMxKwq5MD0=;
 b=Nid5QVe8NErzUlL7ryXcGLP1jrePBGA3PoPR+DwnfM7Aro7CMmLO1Tk2
 Kh8u8JV7bxulfa1J/V33J2Hu5lvCZj2161lzhrh1/2WnUNLRXluIsrlPF
 QW/zgyz43VC216dUAK/G+KoSzGRFyAPjC37sN4vW4/6piaYqKYmZtFglZ
 quuFKrEtlbzoQgrhdGzoUB2fjuIIsZ4+oE3inqO+h+ljWZETfMVBRIYZy
 dP7FmitcNrBPos4mavlY4hvNRKVkUCcr/tmm7WbhegO27j97o2ooLhZ3V
 DDpxvKIctiF/gGHbO+fasCh4Td/9aFM6zopgH1BJbs9Z0bz2Ex99IcE4P A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1348966"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1348966"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 07:03:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721491071"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="721491071"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga003.jf.intel.com with ESMTP; 07 Dec 2023 07:03:25 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [v3 1/2] drm/xe: Add a new memory directory under tile
Date: Thu,  7 Dec 2023 20:47:38 +0530
Message-Id: <20231207151739.1241374-2-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
References: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add a new memory directory under /device/tile<n> and move
physical_vram_size attribute to the new directory.

New hierarchy:

/device/tile<n>/memory/physical_vram_size_bytes

v2: Fix heading typo (Riana)
    Fix cleanup error on unload/reload cycle

v3: Fix reload error with kobject_put in place
    of kobject_del (Tejas)

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_tile_sysfs.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index 16376607c68f..64be1f3a38a9 100644
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
@@ -36,8 +37,10 @@ static const struct attribute *physical_memsize_attr =
 
 static void tile_sysfs_fini(struct drm_device *drm, void *arg)
 {
-	struct xe_tile *tile = arg;
+	struct kobject *kobj = arg;
+	struct xe_tile *tile = kobj_to_tile(kobj->parent);
 
+	kobject_put(kobj);
 	kobject_put(tile->sysfs);
 }
 
@@ -46,6 +49,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 	struct xe_device *xe = tile_to_xe(tile);
 	struct device *dev = xe->drm.dev;
 	struct kobj_tile *kt;
+	struct kobject *kobj;
 	int err;
 
 	kt = kzalloc(sizeof(*kt), GFP_KERNEL);
@@ -64,12 +68,17 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 
 	tile->sysfs = &kt->base;
 
-	if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
-	    sysfs_create_file(tile->sysfs, physical_memsize_attr))
+	kobj = kobject_create_and_add("memory", tile->sysfs);
+	if (!kobj) {
+		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
+	}
+
+	if (kobj && IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
+	    sysfs_create_file(kobj, physical_memsize_attr))
 		drm_warn(&xe->drm,
 			 "Sysfs creation to read addr_range per tile failed\n");
 
-	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
+	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, kobj);
 	if (err) {
 		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
 			 __func__, err);
-- 
2.25.1

