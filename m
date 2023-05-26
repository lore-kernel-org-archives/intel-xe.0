Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01A7C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 19:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA44710E033;
	Fri, 26 May 2023 19:08:48 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6FC10E1EC
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 19:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685128124; x=1716664124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MnLnDOrF2jovaWn1zYPfXEi8P/HMpnTlYh2nSK7yM8I=;
 b=NdJTodWJ6yjLcOIRk421oMNxrconfzleCcgP9ZZtbX/Sg8oVrP0qingZ
 jOclXaX6l5XDPqx+PmwXb37lioVgvF5pa8Q5FStm6HWDSOKNpX+9n3BpM
 eLf43ZYMhgIXwDwgx1rLQ4xQG05s9iHtFzVK525ToGaWzjQqMVllFjWvq
 IAmIA4+NLq6ET2uc3wXqssZdORLgGnVppLFcnn6pW3sQygblENxNq/W+e
 dK0vJPm92gL1tsAFdamqM/b0sqAi9SkMjC6Be8qK1vcxtmZ9GPgKQhz2r
 FrsxX4xuUBYwq1O6/9B6rhmvQfs4pmsaAK3qXcLdyqR/7+GguaRhqWGQ2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="440637371"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="440637371"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 12:08:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="682817895"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="682817895"
Received: from omurra1x-mobl.ger.corp.intel.com (HELO 2082b82b753b.intel.com)
 ([10.252.55.34])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 12:08:43 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 19:08:21 +0000
Message-Id: <20230526190824.7-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526190824.7-1-francois.dugast@intel.com>
References: <20230526190824.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/5] drm/xe: Group engine related structs
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

