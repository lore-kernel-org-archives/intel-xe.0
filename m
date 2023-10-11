Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB054CD6E71
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 14:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A9B10E83F;
	Wed, 11 Oct 2023 14:00:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFDD110E858
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 14:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697032806; x=1728568806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xerf5BWz69ovJ2vnYl3r7NuGth6qfEyYrxaTUWQwhSY=;
 b=lFwOWpVFlMlnTMghEWuc4cPc8vrVqVBqp8mx0DVdGtYihxAljbovHWxN
 80bSCajXFICVhsEuSEyuANwq1jSRYZA3aAMss3/qE2FXxxgRW/GGObR+8
 pkc7qAzQ7YvYD8eUDz42AHTlJDbpvmxj3lJZyxpULJWDCGX7Tm8OXcmRz
 4PizIRv4VCSWNA4ugC6ozNlwLCLN+sZyH2fbxGHwT1gV5Cyd2USwXTT7c
 h/fMh9Z1//Jm//iWNIw4QJ1zOvBDe7jV145W2ka6ct8QWPngNbo36G6ri
 9NryIzSQZeJdKJDxG9B0boRCQdIA0YiQSCbm3QnBIYt+AwN1dF72TtgAT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451156313"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="451156313"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 07:00:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="753829243"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="753829243"
Received: from stahadie-mobl4.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.249.36.91])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:57 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 13:59:24 +0000
Message-Id: <20231011135926.7-16-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011135926.7-1-francois.dugast@intel.com>
References: <20231011135926.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v1 15/17] drm/xe/uapi: Separate bo_create placement
 from flags
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
index 4f0cd65c8522..c2cc859b0921 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1768,19 +1768,18 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
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
@@ -1801,7 +1800,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
 		bo_flags |= XE_BO_SCANOUT_BIT;
 
-	bo_flags |= args->flags << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
+	bo_flags |= args->placement << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
 
 	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
 		if (XE_IOCTL_DBG(xe, !(bo_flags & XE_BO_CREATE_VRAM_MASK)))
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index df0561fc6c37..97e5f8f4aca3 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -607,9 +607,12 @@ struct drm_xe_gem_create {
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
@@ -633,9 +636,6 @@ struct drm_xe_gem_create {
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

