Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15EAC83F0C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 23:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBB710E7B8;
	Wed,  2 Jul 2025 23:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C3wDRHTX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE0010E0D1
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 23:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751499643; x=1783035643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aRRSL/imw7Rqt/ig4YNA+hzWEjR1KBMhSSU7JEU1Ae8=;
 b=C3wDRHTXGWc+kX74x8N6UPqnOwvm9NNdfFduk8YBjkDqMW8wWBP/ZRo5
 LzBUgHNv9LOb+vpg9GKQojY4dJiZDKxaRxOnCNKKJVrgBY3OgtTaTJSM/
 W165xxCm1o6en2NKxIE51hrgyqoaMsI1NhOi5GMPKBhKofFhN2chZrumr
 ihA+ts3n5WEEVfyAxEIHWBFF8/OoefDKxWQXTJ61nU6zbDwZOGaZsIKfw
 s8bY9EtCnXjnlTUyRtAybfTE7z4f2ThBARLXC7wB9cKAbRbEV7AoJRixw
 2rfQkeznBBL+j5kHSAoYOzZfLsfyQxABUIVPEvEM/E5GQG4/K3IGawUTI w==;
X-CSE-ConnectionGUID: xUTI+7SUSeKmRxuXdYhBfQ==
X-CSE-MsgGUID: kjAqfb/zT6mV6KiQFOPrdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57489472"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="57489472"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:40:42 -0700
X-CSE-ConnectionGUID: j/LHbipXSgShND4CZw/VTA==
X-CSE-MsgGUID: 2oV8GZMXT6mIEqCYMYh0sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153624529"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:40:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 3/9] drm: Simplify drmm_alloc_ordered_workqueue return
Date: Wed,  2 Jul 2025 16:42:16 -0700
Message-Id: <20250702234222.3278264-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702234222.3278264-1-matthew.brost@intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Rather than returning ERR_PTR or NULL on failure, replace the NULL
return with ERR_PTR(-ENOMEM). This simplifies error handling at the
caller. While here, add kernel documentation for
drmm_alloc_ordered_workqueue.

Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c |  2 --
 include/drm/drm_managed.h        | 15 +++++++++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 8c9898b9055d..e60573e0f3e9 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -302,8 +302,6 @@ struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *pri
 	vkms_out->composer_workq = drmm_alloc_ordered_workqueue(dev, "vkms_composer", 0);
 	if (IS_ERR(vkms_out->composer_workq))
 		return ERR_CAST(vkms_out->composer_workq);
-	if (!vkms_out->composer_workq)
-		return ERR_PTR(-ENOMEM);
 
 	return vkms_out;
 }
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index 53017cc609ac..72bfac002c06 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -129,14 +129,25 @@ void __drmm_mutex_release(struct drm_device *dev, void *res);
 
 void __drmm_workqueue_release(struct drm_device *device, void *wq);
 
+/**
+ * drmm_alloc_ordered_workqueue - &drm_device managed alloc_ordered_workqueue()
+ * @dev: DRM device
+ * @fmt: printf format for the name of the workqueue
+ * @flags: WQ_* flags (only WQ_FREEZABLE and WQ_MEM_RECLAIM are meaningful)
+ * @args: args for @fmt
+ *
+ * This is a &drm_device-managed version of alloc_ordered_workqueue(). The
+ * allocated workqueue is automatically destroyed on the final drm_dev_put().
+ *
+ * Returns: workqueue on success, negative ERR_PTR otherwise.
+ */
 #define drmm_alloc_ordered_workqueue(dev, fmt, flags, args...)					\
 	({											\
 		struct workqueue_struct *wq = alloc_ordered_workqueue(fmt, flags, ##args);	\
 		wq ? ({										\
 			int ret = drmm_add_action_or_reset(dev, __drmm_workqueue_release, wq);	\
 			ret ? ERR_PTR(ret) : wq;						\
-		}) :										\
-			wq;									\
+		}) : ERR_PTR(-ENOMEM);								\
 	})
 
 #endif
-- 
2.34.1

