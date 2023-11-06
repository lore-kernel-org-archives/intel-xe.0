Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C25C4708E
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF4C10E2D2;
	Mon,  6 Nov 2023 11:22:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF0010E2D2
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269756; x=1730805756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8khYende629I9a3yySpc8xGVRqFtucyxR4jaGbNqeRA=;
 b=Qh0o+pFlX9QcSV673FGamLA0pJTitPEHyRIG1IKCat0dqiqn6MHlIFjZ
 QRUp3PaD0eYAZ/++jHQvMk7smlFbYoKYmC1ymTWavbiPVWgzCiJqlwizR
 XP69WFX27FS14yZaXUjb6lMz+Poy4uGOGOk2Ad4aShMb/2Dwcaw1tbckM
 S6rGOS58nK81rq42jrS/I3o/+p454/TigcAcc3dIBq3hwgot8vTnPSeHM
 wimPlbYqX+iBY2nEcTj771SSjgrVdVqvbyfOIt2wNmSxsXbubL5kJdTvB
 QUYqLSyZVyKZdVKzsb8VGWpA0fLPtVBh/j47UyScS/IPS05ZDPirekgtN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646817"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646817"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411643"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411643"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:29 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:33 +0200
Message-Id: <20231106111845.2333093-14-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 13/25] drm/xe/eudebug: uapi for client to debugger
 metadata (work in progress)
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

Metadata structures to pass client (l0) information to debugger
instance. ELF positions, module specific data and thread save area,
sba area (XXX)

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 include/uapi/drm/xe_drm.h | 103 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ed2d79acd190..8c9bda45ef12 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -110,6 +110,8 @@ struct xe_user_extension {
 #define DRM_XE_WAIT_USER_FENCE		0x0a
 #define DRM_XE_VM_MADVISE		0x0b
 #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0c
+#define DRM_XE_DEBUG_METADATA_CREATE	0x0d
+#define DRM_XE_DEBUG_METADATA_DESTROY	0x0e
 
 /* Must be kept compact -- no holes */
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -125,6 +127,8 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
+#define DRM_IOCTL_XE_DEBUG_METADATA_CREATE	 DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_CREATE, struct drm_xe_debug_metadata_create)
+#define DRM_IOCTL_XE_DEBUG_METADATA_DESTROY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_DESTROY, struct drm_xe_debug_metadata_destroy)
 
 /** struct drm_xe_engine_class_instance - instance of an engine class */
 struct drm_xe_engine_class_instance {
@@ -592,6 +596,7 @@ struct drm_xe_ext_set_property {
 
 struct drm_xe_vm_create {
 #define XE_VM_EXTENSION_SET_PROPERTY	0
+#define XE_VM_EXTENSION_SET_DEBUG_METADATA 1
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -620,7 +625,25 @@ struct drm_xe_vm_destroy {
 	__u64 reserved[2];
 };
 
+struct drm_xe_vm_bind_op_ext_attach_debug {
+	/** @base: base user extension */
+	struct xe_user_extension base;
+
+	/** @id: Debug object id from create metadata */
+	__u64 id;
+
+	/** @flags: Flags */
+	__u64 flags;
+
+	/** @cookie: Cookie */
+	__u64 cookie;
+
+	/** @reserved: Reserved */
+	__u64 reserved;
+};
+
 struct drm_xe_vm_bind_op {
+#define XE_VM_BIND_OP_EXTENSIONS_ATTACH_DEBUG 0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -679,7 +702,13 @@ struct drm_xe_vm_bind_op {
 	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
 	 * intended to implement VK sparse bindings.
 	 */
+
 #define XE_VM_BIND_FLAG_NULL		(0x1 << 3)
+	/*
+	 * If capture flag is set, on gpu error the contents of this bind
+	 * will be included in the device (XXX: per process) error state dump.
+	 */
+#define XE_VM_BIND_FLAG_CAPTURE		(0x1 << 20)
 	/** @flags: Bind flags */
 	__u32 flags;
 
@@ -1092,6 +1121,80 @@ struct drm_xe_vm_madvise {
 #define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
 #define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
 
+/*
+ * struct drm_xe_debug_metadata_create - Create debug metadata
+ *
+ * Add a region of user memory to be marked as debug metadata.
+ * When the debugger attaches, the metadata regions will be delivered
+ * for debugger. Debugger can then map these regions to help decode
+ * the program state.
+ *
+ * Returns handle to created metadata entry.
+ */
+struct drm_xe_debug_metadata_create {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+#define DRM_XE_DEBUG_METADATA_ELF_BINARY     0
+#define DRM_XE_DEBUG_METADATA_PROGRAM_MODULE 1
+	/** @type: Type of metadata */
+	__u64 type;
+
+	/** @user_addr: pointer to start of the metadata */
+	__u64 user_addr;
+
+	/** @len: length, in bytes of the medata */
+	__u64 len;
+
+	/** @id: created metadata handle (out) */
+	__u64 id;
+};
+
+/**
+ * struct drm_xe_debug_metadata_destroy - Destroy debug metadata
+ *
+ * Destroy debug metadata.
+ */
+struct drm_xe_debug_metadata_destroy {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @id: metadata handle to destroy */
+	__u64 id;
+};
+
+/**
+ * struct drm_xe_ext_vm_set_debug_metadata - Annotate metadata in vm
+ *
+ * Annotate static regions of vm to be noted as debug metadata.
+ * These will be communicated to a debugger and (XXX: selectively?)
+ * included in gpu error state.
+ *
+ */
+struct drm_xe_ext_vm_set_debug_metadata {
+	/** @base: base user extension */
+	struct xe_user_extension base;
+
+#define DRM_XE_VM_DEBUG_METADATA_COOKIE		0
+#define DRM_XE_VM_DEBUG_METADATA_MODULE_AREA	1
+#define DRM_XE_VM_DEBUG_METADATA_SBA_AREA	2
+#define DRM_XE_VM_DEBUG_METADATA_SIP_AREA	3
+#define DRM_XE_VM_DEBUG_METADATA_NUM		(1 + DRM_XE_VM_DEBUG_METADATA_SIP_AREA)
+	/** @type: Type of metadata at offset if not cookie */
+	__u64 type;
+
+	union {
+		/**@cookie: Cookie value to attach if type is METADATA_COOKIE */
+		__u64 cookie;
+
+		/**@offset: Offset into vm where metadata starts */
+		__u64 offset;
+	};
+
+	/** @len: Length of metadata in bytes or zero for cookie */
+	__u64 len;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

