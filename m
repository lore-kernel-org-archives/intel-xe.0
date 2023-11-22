Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38FBC61D97
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 14:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35D410E654;
	Wed, 22 Nov 2023 14:39:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC0410E653
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 14:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700663941; x=1732199941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iq9NxL2xLpx5ZzKDIgcoTAU5/fQ7DZ82gQ5htpeREfQ=;
 b=GImX+y90S80159AtNzST8SGB86s8Ad9xqTuG8co+dPXJdr13KGYSq8TW
 14TrrQSvYiSojrHPZ+mvTAXIziRD+cMX+U+bSl3qELupvdoI6x3liqy2o
 FhwbkArinywY7nnOLjaY/dNs3HlFgqr9KJljqnlFBhUJlbdShMI2JYxXv
 /4srcd51Z6Sgbwi1aSP1XqhdTfqAM693WWqyQTRYPkkNEnlAWLETzyyXg
 GMQ+z1HalhUNGIFMXftAO6Dj/RQDcCb6UfwLgW+BDF8zYUiEtlU4gXsCV
 xAbnxUyvL4ZJ+ALGHNNsS0B/4PfhbDGwLBxnvGkUf0S37pPam6D+dLKC1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395985082"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="395985082"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:38:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1098430321"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="1098430321"
Received: from arechber-mobl.ger.corp.intel.com (HELO 039181c9d572.intel.com)
 ([10.249.44.143])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:38:44 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Nov 2023 14:38:21 +0000
Message-Id: <20231122143833.7-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122143833.7-1-francois.dugast@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 02/14] drm/xe/uapi: Separate bo_create
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
 drivers/gpu/drm/xe/xe_bo.c | 15 +++++++--------
 include/uapi/drm/xe_drm.h  | 12 ++++++------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4305f5cbc2ab..bbce4cd80f7e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1799,19 +1799,18 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	u32 handle;
 	int err;
 
-	if (XE_IOCTL_DBG(xe, args->extensions) || XE_IOCTL_DBG(xe, args->pad) ||
+	if (XE_IOCTL_DBG(xe, args->extensions) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
+	/* at least one valid memory placement must be specified */
+	if (XE_IOCTL_DBG(xe, !(args->placement & xe->info.mem_region_mask)))
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
@@ -1832,7 +1831,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
 		bo_flags |= XE_BO_SCANOUT_BIT;
 
-	bo_flags |= args->flags << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
+	bo_flags |= args->placement << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
 
 	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
 		if (XE_IOCTL_DBG(xe, !(bo_flags & XE_BO_CREATE_VRAM_MASK)))
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b0d13bc6d9cf..1bdd20d3c4a8 100644
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
@@ -541,9 +544,6 @@ struct drm_xe_gem_create {
 	 */
 	__u32 handle;
 
-	/** @pad: MBZ */
-	__u32 pad;
-
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
-- 
2.34.1

