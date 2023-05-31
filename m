Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B2BC77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 15:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11AA10E4F1;
	Wed, 31 May 2023 15:24:10 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA1A10E4EE
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 15:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685546642; x=1717082642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MnLnDOrF2jovaWn1zYPfXEi8P/HMpnTlYh2nSK7yM8I=;
 b=OvnjVVk7Tp+UdT7hwmHl+GPN4me+xSQg2w7e8Zcxk6IYFv4PvFXJfxH6
 JUbv/tkGQKDfLfqjPpPyxSzjA7fEpRXKKV/u2mbRM6/Tw6kWa/pZVul26
 ASef3jMN6Qfl+4idRiyf+RqXzXcv3ebGq8gvRBxHN2sNwwmEI8TqC/Ogl
 7KoFwcsNWNBGJtCaOjvG/9xiieLJlWadwnu4ss5ZqULhQNo7Oly+bPIKX
 JutIejQqaBnqblZDH5P7HRAHw3/QrHCz6LJMwv6xpj480XSNh6Hpix4aF
 zY3CzXooQAKlqUQ/F3gv3AmXLsgUqOkK30jXxiK6XxhYyMl5nKzexxyei Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="339865506"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="339865506"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 08:24:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="796747923"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="796747923"
Received: from amokrov-mobl1.ccr.corp.intel.com (HELO 9d3bf2d3f760.intel.com)
 ([10.251.208.253])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 08:24:01 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 15:23:35 +0000
Message-Id: <20230531152338.6-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230531152338.6-1-francois.dugast@intel.com>
References: <20230531152338.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/5] drm/xe: Group engine related structs
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

Move the definition of drm_xe_engine_class_instance to group it with
other engine related structs and to follow the ioctls order.

Reported-by: Oded Gabbay <ogabbay@kernel.org>
Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ac3cfc1fb4a5..5d34b570a305 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -116,24 +116,6 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
 
-struct drm_xe_engine_class_instance {
-	__u16 engine_class;
-
-#define DRM_XE_ENGINE_CLASS_RENDER		0
-#define DRM_XE_ENGINE_CLASS_COPY		1
-#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
-#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
-#define DRM_XE_ENGINE_CLASS_COMPUTE		4
-	/*
-	 * Kernel only class (not actual hardware engine class). Used for
-	 * creating ordered queues of VM bind operations.
-	 */
-#define DRM_XE_ENGINE_CLASS_VM_BIND		5
-
-	__u16 engine_instance;
-	__u16 gt_id;
-};
-
 #define XE_MEM_REGION_CLASS_SYSMEM	0
 #define XE_MEM_REGION_CLASS_VRAM	1
 
@@ -518,6 +500,24 @@ struct drm_xe_engine_set_property {
 	__u64 reserved[2];
 };
 
+struct drm_xe_engine_class_instance {
+	__u16 engine_class;
+
+#define DRM_XE_ENGINE_CLASS_RENDER		0
+#define DRM_XE_ENGINE_CLASS_COPY		1
+#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
+#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
+#define DRM_XE_ENGINE_CLASS_COMPUTE		4
+	/*
+	 * Kernel only class (not actual hardware engine class). Used for
+	 * creating ordered queues of VM bind operations.
+	 */
+#define DRM_XE_ENGINE_CLASS_VM_BIND		5
+
+	__u16 engine_instance;
+	__u16 gt_id;
+};
+
 struct drm_xe_engine_create {
 	/** @extensions: Pointer to the first extension struct, if any */
 #define XE_ENGINE_EXTENSION_SET_PROPERTY               0
-- 
2.34.1

