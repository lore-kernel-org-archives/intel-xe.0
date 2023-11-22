Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E7FC61D9D
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 14:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4B410E659;
	Wed, 22 Nov 2023 14:39:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CC410E00E
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 14:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700663948; x=1732199948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=707EL3YcIsSDKsEmNooWnRk0PbaZrVc3OgEbqeXrM2A=;
 b=TJTwNDhBaVxgz6AzojwomCn/ke3T2qmKh79LR9iyVfx3fW9AkQnhKyfR
 RIVX8J7vR4K1IJy6ETtIZwPNkookOQKvt//QeaqT094n82zkRkdkmtifr
 zC2olP2jyzrtmL1f1v4Zi+0RzHRf45Yb/2pDORJ2ffLrFfKVN0B9Qy1zN
 9ElzhHgA/eJQ/otslUCa61XCBFCbc1Uam3+mGCMdizcHUSK0deZUGs/hz
 qvrkbBppQkC4ABNy8rMDl/VT/bD7mN2V+RWmDuwiz+kAOkCq8tQpx/RNi
 HsZM5c3W3ac8qjYnzbNoyodsNW/y61rSdgv/9j6TUjqf25PRFCPskDixN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395985209"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="395985209"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:39:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1098430444"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="1098430444"
Received: from arechber-mobl.ger.corp.intel.com (HELO 039181c9d572.intel.com)
 ([10.249.44.143])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:39:01 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Nov 2023 14:38:33 +0000
Message-Id: <20231122143833.7-15-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122143833.7-1-francois.dugast@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 14/14] drm/xe/uapi: Move xe_exec after
 xe_exec_queue
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

Although the exec ioctl is a very important one, it makes no sense
to explain xe_exec before explaining the exec_queue. So, let's
move this down to help bring a better flow on the documentation
and code readability.

It is important to highlight that this patch is changing all
the ioctl numbers in a non-backward compatible way. However, we
are doing this final uapi clean-up before we submit our first
pull-request to be part of the upstream Kernel. Once we get
there, no other change like this will ever happen and all the
backward compatibility will be respected.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 4c175946547c..17e86c8310fa 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -103,11 +103,11 @@ struct xe_user_extension {
 #define DRM_XE_VM_CREATE		0x03
 #define DRM_XE_VM_DESTROY		0x04
 #define DRM_XE_VM_BIND			0x05
-#define DRM_XE_EXEC			0x06
-#define DRM_XE_EXEC_QUEUE_CREATE	0x07
-#define DRM_XE_EXEC_QUEUE_DESTROY	0x08
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x09
-#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0a
+#define DRM_XE_EXEC_QUEUE_CREATE	0x06
+#define DRM_XE_EXEC_QUEUE_DESTROY	0x07
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x08
+#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x09
+#define DRM_XE_EXEC			0x0a
 #define DRM_XE_WAIT_USER_FENCE		0x0b
 /* Must be kept compact -- no holes */
 
@@ -117,11 +117,11 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_VM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_CREATE, struct drm_xe_vm_create)
 #define DRM_IOCTL_XE_VM_DESTROY			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
 #define DRM_IOCTL_XE_VM_BIND			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
-#define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_EXEC_QUEUE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_CREATE, struct drm_xe_exec_queue_create)
 #define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
 #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
 #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
+#define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 
 /**
-- 
2.34.1

