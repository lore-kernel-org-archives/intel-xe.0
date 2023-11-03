Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFF0C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:35:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808AD10EA03;
	Fri,  3 Nov 2023 14:35:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DC510EA08
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022128; x=1730558128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M+KGG1Umls+380m1myaaA0Xo0YckRJgqKE3QKdwC3h8=;
 b=I2ejqJPT0fUaL6H+mP5rdnIlSpNbykloJetavKdQVdvufOvrvwdAq+K/
 z7EVDtE/vbzJ1Er7Wb7yvnJnVYsAOmS0V9HwE31eYtHgd4nNnZK041kOj
 lqtucgNN8WTKVOpa3dUKS81uP/FP0v6xRuffFeeaWR9nMadBb6ajzTd+5
 7JqtT3w3DJf9Zuuki+xsePGiYP+TUe2M4Smm69dDWTcm+bCLVxmfQ6UyO
 lSLfFnj5K+DzpZ7xMd/ugSkySSwz3sLOPcL+XZTHCY9PtJatqvfVGgZNq
 RCl6UXxPyKZPHRFj4U/DLFymPrtgZBxm3XUBjfm9UeGi4h0ezLI5Au+Fh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843366"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843366"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832455"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832455"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:27 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:21 +0000
Message-Id: <20231103143456.7-16-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 15/50] drm/xe/uapi: Separate bo_create
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Although the flags are about the creation, the memory placement
of the BO deserves a proper dedicated field in the uapi.

Besides getting more clear, it also allows to remove the
'magic' shifts from the flags that was a concern during the
uapi reviews.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 15 +++++++--------
 include/uapi/drm/xe_drm.h  | 12 ++++++------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9e6e8f77dd51..6ca02487addc 100644
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
index dcd4cdf167f3..a688691458f9 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -619,9 +619,12 @@ struct drm_xe_gem_create {
 	 */
 	__u64 size;
 
-#define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(0x1 << 24)
-#define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(0x1 << 25)
-#define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(0x1 << 26)
+	/** @placement: A mask of memory instances of where BO can be placed. */
+	__u32 placement;
+
+#define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
+#define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(1 << 1)
+#define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
 	/**
 	 * @flags: Flags, currently a mask of memory instances of where BO can
 	 * be placed
@@ -645,9 +648,6 @@ struct drm_xe_gem_create {
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

