Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A47C04E83
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:36:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1AD10EA0D;
	Fri,  3 Nov 2023 14:36:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D8010EA05
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022159; x=1730558159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vHGsoACerRiyYN03l3k5vdOGCg6UhbKq/tsspvSsEgg=;
 b=n+kslLa0d5Kt5EkpEybnWypLFCPVWLOfBw8cmQSXBmoJgRSRU7Glef/h
 lplJDEdCepIbFu8o+WZUMAVrCqmH185DEezcSdUbsI2PbeHW0YJaO8oOc
 tDwclgSIQEir3PWhdy0pap3XSzkOpvZviIOTWtNixkhzC6KNFEMdfVEpG
 p3gq6dRBWms8sZ5F4A8weeSwHWtBUJarC0/1ObxWAwjFJxAR75Z0MiPIs
 W7wWB7ay3Nwvcx0xgW1WXV293vK8BdbvLQ9dX8sAunG57Z7rUCZqI1yEP
 0CqKv2quwDmkWHfCweTS66pD8ZUmi2DsKLGslOJ1Kba5+RS8m9e+k7Vkh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843474"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843474"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832515"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832515"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:48 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:38 +0000
Message-Id: <20231103143456.7-33-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 32/50] drm/xe/uapi: Move xe_exec after
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
---
 include/uapi/drm/xe_drm.h | 82 +++++++++++++++++++--------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 659cc0a71f8c..eab8c8e3b6a3 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -62,11 +62,11 @@ extern "C" {
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
 
@@ -76,11 +76,11 @@ extern "C" {
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
@@ -977,41 +977,6 @@ struct drm_xe_sync {
 	__u64 reserved[2];
 };
 
-/**
- * struct drm_xe_exec - Input of &DRM_IOCTL_XE_EXEC
- */
-struct drm_xe_exec {
-	/** @extensions: Pointer to the first extension struct, if any */
-	__u64 extensions;
-
-	/** @exec_queue_id: Exec queue ID for the batch buffer */
-	__u32 exec_queue_id;
-
-	/** @num_syncs: Amount of struct drm_xe_sync in array. */
-	__u32 num_syncs;
-
-	/** @syncs: Pointer to struct drm_xe_sync array. */
-	__u64 syncs;
-
-	/**
-	 * @address: address of batch buffer if num_batch_buffer == 1 or an
-	 * array of batch buffer addresses
-	 */
-	__u64 address;
-
-	/**
-	 * @num_batch_buffer: number of batch buffer in this exec, must match
-	 * the width of the engine
-	 */
-	__u16 num_batch_buffer;
-
-	/** @pad: MBZ */
-	__u16 pad[3];
-
-	/** @reserved: Reserved */
-	__u64 reserved[2];
-};
-
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
  */
@@ -1126,6 +1091,41 @@ struct drm_xe_exec_queue_get_property {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_exec - Input of &DRM_IOCTL_XE_EXEC
+ */
+struct drm_xe_exec {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @exec_queue_id: Exec queue ID for the batch buffer */
+	__u32 exec_queue_id;
+
+	/** @num_syncs: Amount of struct drm_xe_sync in array. */
+	__u32 num_syncs;
+
+	/** @syncs: Pointer to struct drm_xe_sync array. */
+	__u64 syncs;
+
+	/**
+	 * @address: address of batch buffer if num_batch_buffer == 1 or an
+	 * array of batch buffer addresses
+	 */
+	__u64 address;
+
+	/**
+	 * @num_batch_buffer: number of batch buffer in this exec, must match
+	 * the width of the engine
+	 */
+	__u16 num_batch_buffer;
+
+	/** @pad: MBZ */
+	__u16 pad[3];
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
 /**
  * struct drm_xe_wait_user_fence - Input of &DRM_IOCTL_XE_WAIT_USER_FENCE
  *
-- 
2.34.1

