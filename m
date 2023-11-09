Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C9DC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6F510E8EA;
	Thu,  9 Nov 2023 15:46:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47C010E8E5
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544768; x=1731080768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iyA3hDw1z9s8qA4Vmv2VjeweDX1RD1u/B0XwBkQHA90=;
 b=NBs4nZRU9q1z+5PBjHgb59xYP+yS1gk1yKAzIvMTUmyGSrzbnbHCenTq
 TtwiPzE4z1+PtYfmBnR1/GNEFwEY7n0h451mAzzGo55MzeXyYqBXn7qIy
 cKa/cGihbkRa2qvCgN9c0h5D5A114ohHVvb4F43wEzzOV7IZLPM7JpIna
 IUco4qk3E1Ko9llBszSffIteqd6YsrhgJoMTQFM8BjcSM7NEMSyQ2OaU9
 prCELS4R1dYK3Gp5JUc2TJZYcA9SQc81Th4wNvUhtYwo3F3NFbxifebZW
 97t7lZW0gi1Q7YRt/ZKmiOGEcg7FDPaoUf4Kw7ztL37I8NIPXbf0plqiA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556700"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556700"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936886004"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936886004"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:28 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:27 +0000
Message-Id: <20231109154457.7-14-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 13/43] drm/xe/uapi: Separate bo_create
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
index b955c89da42c..87971f4faa58 100644
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
index 2ed69b02a2e8..3685eeff4b8d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -622,9 +622,12 @@ struct drm_xe_gem_create {
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
@@ -648,9 +651,6 @@ struct drm_xe_gem_create {
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

