Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EFCC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 18:40:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A24610E07C;
	Thu, 30 Nov 2023 18:40:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C49910E07C
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 18:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701369613; x=1732905613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OJK4sjHroyeCtgqg+curPKrRgxtnkKuIYxhoJcYiWU0=;
 b=B6jeLl67UHq6qHzoDqL66Y3cyMTtsMAPgsFnFCZkA4kLzHXdtdeLWyB/
 0fmws18ZQ/EI+UNsfVKa6RbpG2vGh5I77v32nZhnRyl1RoEQIUfbx7MW/
 Un6FZPQstj6QUjILh2ENbdOxvL3KRKEi2KNDsKQfQrCYJ3s4zp5vJalbS
 Uskf4YzBqXynkj3vy66xnDrYO07GtUa7jwEoJRM9Ewet+RfthciVDdATF
 qKz87V5GnU4+1MHWpMHYrY84/JRGWdcJRsglsGdwfCHc/Y/+JrRHzhGu5
 qbv3TfkDwK4/7KC24qnFB4nmkq/nEG3cmwZa3OA9ImIwfJY1Cenp1XYyl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393111717"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="393111717"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="913294914"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="913294914"
Received: from stefanwe-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.60.146])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:12 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:39:41 +0000
Message-Id: <20231130183955.7-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130183955.7-1-francois.dugast@intel.com>
References: <20231130183955.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 02/16] drm/xe/uapi: Separate bo_create
 placement from flags
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Although the flags are about the creation, the memory placement
of the BO deserves a proper dedicated field in the uapi.

Besides getting more clear, it also allows to remove the
'magic' shifts from the flags that was a concern during the
uapi reviews.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 14 +++++++-------
 include/uapi/drm/xe_drm.h  |  9 ++++++---
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d59501ffc22a..2715afe123d0 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1844,15 +1844,15 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
+	/* at least one valid memory placement must be specified */
+	if (XE_IOCTL_DBG(xe, (args->placement & ~xe->info.mem_region_mask) ||
+			 !args->placement))
+		return -EINVAL;
+
 	if (XE_IOCTL_DBG(xe, args->flags &
 			 ~(DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
 			   DRM_XE_GEM_CREATE_FLAG_SCANOUT |
-			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
-			   xe->info.mem_region_mask)))
-		return -EINVAL;
-
-	/* at least one memory type must be specified */
-	if (XE_IOCTL_DBG(xe, !(args->flags & xe->info.mem_region_mask)))
+			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, args->handle))
@@ -1874,7 +1874,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
 		bo_flags |= XE_BO_SCANOUT_BIT;
 
-	bo_flags |= args->flags << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
+	bo_flags |= args->placement << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
 
 	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
 		if (XE_IOCTL_DBG(xe, !(bo_flags & XE_BO_CREATE_VRAM_MASK)))
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 916aaa686689..20bf2aa89e2c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -500,8 +500,11 @@ struct drm_xe_gem_create {
 	 */
 	__u64 size;
 
-#define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(0x1 << 24)
-#define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(0x1 << 25)
+	/** @placement: A mask of memory instances of where BO can be placed. */
+	__u32 placement;
+
+#define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
+#define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(1 << 1)
 /*
  * When using VRAM as a possible placement, ensure that the corresponding VRAM
  * allocation will always use the CPU accessible part of VRAM. This is important
@@ -517,7 +520,7 @@ struct drm_xe_gem_create {
  * display surfaces, therefore the kernel requires setting this flag for such
  * objects, otherwise an error is thrown on small-bar systems.
  */
-#define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(0x1 << 26)
+#define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
 	/**
 	 * @flags: Flags, currently a mask of memory instances of where BO can
 	 * be placed
-- 
2.34.1

