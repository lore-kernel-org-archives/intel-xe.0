Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75893EB64D8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 12:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3937C10E55A;
	Thu, 22 Jun 2023 12:40:06 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450FD10E55A
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 12:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687437601; x=1718973601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l7GgWS3LvjBDw7XnFWQYqWijIaJqpJJFrd9+MCLNw/k=;
 b=LoXULdB2TF386KvNkBlXw+M8+tDW4ksmOSXu13UPVrqqxn/UfWTPohw+
 VPWPRGMpHBwRQ1t1TYebyg20PtVO1kjcO7QwujZQdmUFfReTg5FBSfFBR
 VodNGYpgZ/VT7FcL+JXqqm7d/3iDm/EUH4dLQm7u3sCeq9YqxKjJD+JtZ
 FEO1n8AbUY053jQM/7VKdYjqLKvEvbak9vcBBHGI+p0tlqgIQY8fQ3iT+
 I/ypLTCRsGfQHxMqSISI0GRH9Jf38drXWbndcDPhhG3M82t02PGvE/8so
 dA/cAB+dQeay1esEPeeb6lV25GjZS8QWmBHSim6qvsOl7NXwkcmrnio/I g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="360492994"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="360492994"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 05:40:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="1045149774"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="1045149774"
Received: from aadriaen-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.46.83])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 05:39:59 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 22 Jun 2023 12:39:45 +0000
Message-Id: <20230622123946.7-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622123946.7-1-francois.dugast@intel.com>
References: <20230622123946.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 2/3] drm/xe: Move defines before relevant
 fields
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
Cc: Francois Dugast <francois.dugast@intel.com>, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Align on same rule in the whole file: defines then doc then relevant
field, with an empty line to separate fields.

v2:
  - Rebase on drm-xe-next
  - Fix ordering of defines and fields in uAPI (Lucas De Marchi)
v3: Remove useless empty lines (Lucas De Marchi)
v4: Move changelog to commit
v5: Rebase

Reported-by: Oded Gabbay <ogabbay@kernel.org>
Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 73 ++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 31 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 9421e144005d..f412150fa636 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -60,6 +60,7 @@ struct xe_user_extension {
 	 * Pointer to the next struct xe_user_extension, or zero if the end.
 	 */
 	__u64 next_extension;
+
 	/**
 	 * @name: Name of the extension.
 	 *
@@ -70,6 +71,7 @@ struct xe_user_extension {
 	 * of uAPI which has embedded the struct xe_user_extension.
 	 */
 	__u32 name;
+
 	/**
 	 * @pad: MBZ
 	 *
@@ -218,11 +220,11 @@ struct drm_xe_query_topology_mask {
 	/** @gt_id: GT ID the mask is associated with */
 	__u16 gt_id;
 
-	/** @type: type of mask */
-	__u16 type;
 #define XE_TOPO_DSS_GEOMETRY	(1 << 0)
 #define XE_TOPO_DSS_COMPUTE	(1 << 1)
 #define XE_TOPO_EU_PER_DSS	(1 << 2)
+	/** @type: type of mask */
+	__u16 type;
 
 	/** @num_bytes: number of bytes in requested mask */
 	__u32 num_bytes;
@@ -270,15 +272,14 @@ struct drm_xe_device_query {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @query: The type of data to query */
-	__u32 query;
-
 #define DRM_XE_DEVICE_QUERY_ENGINES	0
 #define DRM_XE_DEVICE_QUERY_MEM_USAGE	1
 #define DRM_XE_DEVICE_QUERY_CONFIG	2
 #define DRM_XE_DEVICE_QUERY_GTS		3
 #define DRM_XE_DEVICE_QUERY_HWCONFIG	4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
+	/** @query: The type of data to query */
+	__u32 query;
 
 	/** @size: Size of the queried data */
 	__u32 size;
@@ -301,12 +302,12 @@ struct drm_xe_gem_create {
 	 */
 	__u64 size;
 
+#define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
+#define XE_GEM_CREATE_FLAG_SCANOUT		(0x1 << 25)
 	/**
 	 * @flags: Flags, currently a mask of memory instances of where BO can
 	 * be placed
 	 */
-#define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
-#define XE_GEM_CREATE_FLAG_SCANOUT		(0x1 << 25)
 	__u32 flags;
 
 	/**
@@ -357,10 +358,13 @@ struct drm_xe_gem_mmap_offset {
 struct drm_xe_vm_bind_op_error_capture {
 	/** @error: errno that occured */
 	__s32 error;
+
 	/** @op: operation that encounter an error */
 	__u32 op;
+
 	/** @addr: address of bind op */
 	__u64 addr;
+
 	/** @size: size of bind */
 	__u64 size;
 };
@@ -370,8 +374,8 @@ struct drm_xe_ext_vm_set_property {
 	/** @base: base user extension */
 	struct xe_user_extension base;
 
-	/** @property: property to set */
 #define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
+	/** @property: property to set */
 	__u32 property;
 
 	/** @pad: MBZ */
@@ -385,17 +389,16 @@ struct drm_xe_ext_vm_set_property {
 };
 
 struct drm_xe_vm_create {
-	/** @extensions: Pointer to the first extension struct, if any */
 #define XE_VM_EXTENSION_SET_PROPERTY	0
+	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @flags: Flags */
-	__u32 flags;
-
 #define DRM_XE_VM_CREATE_SCRATCH_PAGE	(0x1 << 0)
 #define DRM_XE_VM_CREATE_COMPUTE_MODE	(0x1 << 1)
 #define DRM_XE_VM_CREATE_ASYNC_BIND_OPS	(0x1 << 2)
 #define DRM_XE_VM_CREATE_FAULT_MODE	(0x1 << 3)
+	/** @flags: Flags */
+	__u32 flags;
 
 	/** @vm_id: Returned VM ID */
 	__u32 vm_id;
@@ -430,6 +433,7 @@ struct drm_xe_vm_bind_op {
 		 * ignored for unbind
 		 */
 		__u64 obj_offset;
+
 		/** @userptr: user pointer to bind on */
 		__u64 userptr;
 	};
@@ -448,12 +452,6 @@ struct drm_xe_vm_bind_op {
 	 */
 	__u64 tile_mask;
 
-	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
-	__u32 op;
-
-	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
-	__u32 region;
-
 #define XE_VM_BIND_OP_MAP		0x0
 #define XE_VM_BIND_OP_UNMAP		0x1
 #define XE_VM_BIND_OP_MAP_USERPTR	0x2
@@ -500,6 +498,11 @@ struct drm_xe_vm_bind_op {
 	 * intended to implement VK sparse bindings.
 	 */
 #define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
+	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
+	__u32 op;
+
+	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
+	__u32 region;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
@@ -528,6 +531,7 @@ struct drm_xe_vm_bind {
 	union {
 		/** @bind: used if num_binds == 1 */
 		struct drm_xe_vm_bind_op bind;
+
 		/**
 		 * @vector_of_binds: userptr to array of struct
 		 * drm_xe_vm_bind_op if num_binds > 1
@@ -575,7 +579,6 @@ struct drm_xe_engine_set_property {
 	/** @engine_id: Engine ID */
 	__u32 engine_id;
 
-	/** @property: property to set */
 #define XE_ENGINE_SET_PROPERTY_PRIORITY			0
 #define XE_ENGINE_SET_PROPERTY_TIMESLICE		1
 #define XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
@@ -591,6 +594,7 @@ struct drm_xe_engine_set_property {
 #define XE_ENGINE_SET_PROPERTY_ACC_TRIGGER		6
 #define XE_ENGINE_SET_PROPERTY_ACC_NOTIFY		7
 #define XE_ENGINE_SET_PROPERTY_ACC_GRANULARITY		8
+	/** @property: property to set */
 	__u32 property;
 
 	/** @value: property value */
@@ -602,8 +606,6 @@ struct drm_xe_engine_set_property {
 
 /** struct drm_xe_engine_class_instance - instance of an engine class */
 struct drm_xe_engine_class_instance {
-	__u16 engine_class;
-
 #define DRM_XE_ENGINE_CLASS_RENDER		0
 #define DRM_XE_ENGINE_CLASS_COPY		1
 #define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
@@ -614,14 +616,15 @@ struct drm_xe_engine_class_instance {
 	 * creating ordered queues of VM bind operations.
 	 */
 #define DRM_XE_ENGINE_CLASS_VM_BIND		5
+	__u16 engine_class;
 
 	__u16 engine_instance;
 	__u16 gt_id;
 };
 
 struct drm_xe_engine_create {
-	/** @extensions: Pointer to the first extension struct, if any */
 #define XE_ENGINE_EXTENSION_SET_PROPERTY               0
+	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
 	/** @width: submission width (number BB per exec) for this engine */
@@ -659,8 +662,8 @@ struct drm_xe_engine_get_property {
 	/** @engine_id: Engine ID */
 	__u32 engine_id;
 
-	/** @property: property to get */
 #define XE_ENGINE_GET_PROPERTY_BAN			0
+	/** @property: property to get */
 	__u32 property;
 
 	/** @value: property value */
@@ -685,19 +688,19 @@ struct drm_xe_sync {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	__u32 flags;
-
 #define DRM_XE_SYNC_SYNCOBJ		0x0
 #define DRM_XE_SYNC_TIMELINE_SYNCOBJ	0x1
 #define DRM_XE_SYNC_DMA_BUF		0x2
 #define DRM_XE_SYNC_USER_FENCE		0x3
 #define DRM_XE_SYNC_SIGNAL		0x10
+	__u32 flags;
 
 	/** @pad: MBZ */
 	__u32 pad;
 
 	union {
 		__u32 handle;
+
 		/**
 		 * @addr: Address of user fence. When sync passed in via exec
 		 * IOCTL this a GPU address in the VM. When sync passed in via
@@ -753,8 +756,6 @@ struct drm_xe_mmio {
 
 	__u32 addr;
 
-	__u32 flags;
-
 #define DRM_XE_MMIO_8BIT	0x0
 #define DRM_XE_MMIO_16BIT	0x1
 #define DRM_XE_MMIO_32BIT	0x2
@@ -762,6 +763,7 @@ struct drm_xe_mmio {
 #define DRM_XE_MMIO_BITS_MASK	0x3
 #define DRM_XE_MMIO_READ	0x4
 #define DRM_XE_MMIO_WRITE	0x8
+	__u32 flags;
 
 	__u64 value;
 
@@ -781,47 +783,57 @@ struct drm_xe_mmio {
 struct drm_xe_wait_user_fence {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
+
 	union {
 		/**
 		 * @addr: user pointer address to wait on, must qword aligned
 		 */
 		__u64 addr;
+
 		/**
 		 * @vm_id: The ID of the VM which encounter an error used with
 		 * DRM_XE_UFENCE_WAIT_VM_ERROR. Upper 32 bits must be clear.
 		 */
 		__u64 vm_id;
 	};
-	/** @op: wait operation (type of comparison) */
+
 #define DRM_XE_UFENCE_WAIT_EQ	0
 #define DRM_XE_UFENCE_WAIT_NEQ	1
 #define DRM_XE_UFENCE_WAIT_GT	2
 #define DRM_XE_UFENCE_WAIT_GTE	3
 #define DRM_XE_UFENCE_WAIT_LT	4
 #define DRM_XE_UFENCE_WAIT_LTE	5
+	/** @op: wait operation (type of comparison) */
 	__u16 op;
-	/** @flags: wait flags */
+
 #define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
 #define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
 #define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
+	/** @flags: wait flags */
 	__u16 flags;
+
 	/** @pad: MBZ */
 	__u32 pad;
+
 	/** @value: compare value */
 	__u64 value;
-	/** @mask: comparison mask */
+
 #define DRM_XE_UFENCE_WAIT_U8		0xffu
 #define DRM_XE_UFENCE_WAIT_U16		0xffffu
 #define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
 #define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
+	/** @mask: comparison mask */
 	__u64 mask;
+
 	/** @timeout: how long to wait before bailing, value in jiffies */
 	__s64 timeout;
+
 	/**
 	 * @num_engines: number of engine instances to wait on, must be zero
 	 * when DRM_XE_UFENCE_WAIT_SOFT_OP set
 	 */
 	__u64 num_engines;
+
 	/**
 	 * @instances: user pointer to array of drm_xe_engine_class_instance to
 	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_SOFT_OP set
@@ -882,7 +894,6 @@ struct drm_xe_vm_madvise {
 #define		DRM_XE_VMA_PRIORITY_HIGH	2	/* Must be elevated user */
 	/* Pin the VMA in memory, must be elevated user */
 #define DRM_XE_VM_MADVISE_PIN			6
-
 	/** @property: property to set */
 	__u32 property;
 
-- 
2.34.1

