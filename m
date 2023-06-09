Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61C7C7EE2E
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 07:37:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9863A10E645;
	Fri,  9 Jun 2023 07:37:28 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4F110E645
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 07:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686296246; x=1717832246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V2xXP0THpuuVeNhmdUditvn0T4wh4f0KWbhWvlicFH4=;
 b=N0ljo03SKW3lj/CRFKMCqr4jK6Itbnmh4rCFzRDzzjydZg8bS6CfPJ+w
 KFu6EcFbUmX9m112f2atYNajSCSMYe8UsJr2Wg4GYmctXXdNr5veWrOOm
 abe123b1zv4UZ5eRvMO0R1puGhr1i0hJ8UoH3hBuIVvPY7xprywapxQVp
 959jtOsdBkQJwyPywzOnCz5o1qqw2hCop/5aYEfqre1aFOncAjUhT/fiM
 FJt6MjXjS5IUbTf5AK67D5EhB1DK2MDOFbs5YQbv54N4SQTLxG6He1IV8
 ZVN2fVi4/xo1qWXDgkjye+VbOyWEfVs8GCYwfbiUA65Cvgf5tYzXRcTrc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="337175013"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; d="scan'208";a="337175013"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 00:37:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="822962325"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; d="scan'208";a="822962325"
Received: from rotariux-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.211.8])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 00:37:24 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  9 Jun 2023 07:37:13 +0000
Message-Id: <20230609073713.7-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609073713.7-1-francois.dugast@intel.com>
References: <20230609073713.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 2/2] drm/xe: Move defines before relevant
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
Cc: lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Align on same rule in the whole file: defines then doc then relevant
field, with an empty line to separate fields.

v2:
  - Rebase on drm-xe-next
  - Fix ordering of defines and fields in uAPI (Lucas De Marchi)
v3: Remove useless empty lines (Lucas De Marchi)
v4: Move changelog to commit

Reported-by: Oded Gabbay <ogabbay@kernel.org>
Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 73 ++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 31 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 1c7c4b5b920a..08f98def6005 100644
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
@@ -492,6 +490,11 @@ struct drm_xe_vm_bind_op {
 	 * than differing the MAP to the page fault handler.
 	 */
 #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
+	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
+	__u32 op;
+
+	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
+	__u32 region;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
@@ -520,6 +523,7 @@ struct drm_xe_vm_bind {
 	union {
 		/** @bind: used if num_binds == 1 */
 		struct drm_xe_vm_bind_op bind;
+
 		/**
 		 * @vector_of_binds: userptr to array of struct
 		 * drm_xe_vm_bind_op if num_binds > 1
@@ -567,7 +571,6 @@ struct drm_xe_engine_set_property {
 	/** @engine_id: Engine ID */
 	__u32 engine_id;
 
-	/** @property: property to set */
 #define XE_ENGINE_SET_PROPERTY_PRIORITY			0
 #define XE_ENGINE_SET_PROPERTY_TIMESLICE		1
 #define XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
@@ -583,6 +586,7 @@ struct drm_xe_engine_set_property {
 #define XE_ENGINE_SET_PROPERTY_ACC_TRIGGER		6
 #define XE_ENGINE_SET_PROPERTY_ACC_NOTIFY		7
 #define XE_ENGINE_SET_PROPERTY_ACC_GRANULARITY		8
+	/** @property: property to set */
 	__u32 property;
 
 	/** @value: property value */
@@ -594,8 +598,6 @@ struct drm_xe_engine_set_property {
 
 /** struct drm_xe_engine_class_instance - instance of an engine class */
 struct drm_xe_engine_class_instance {
-	__u16 engine_class;
-
 #define DRM_XE_ENGINE_CLASS_RENDER		0
 #define DRM_XE_ENGINE_CLASS_COPY		1
 #define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
@@ -606,14 +608,15 @@ struct drm_xe_engine_class_instance {
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
@@ -651,8 +654,8 @@ struct drm_xe_engine_get_property {
 	/** @engine_id: Engine ID */
 	__u32 engine_id;
 
-	/** @property: property to get */
 #define XE_ENGINE_GET_PROPERTY_BAN			0
+	/** @property: property to get */
 	__u32 property;
 
 	/** @value: property value */
@@ -677,19 +680,19 @@ struct drm_xe_sync {
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
@@ -745,8 +748,6 @@ struct drm_xe_mmio {
 
 	__u32 addr;
 
-	__u32 flags;
-
 #define DRM_XE_MMIO_8BIT	0x0
 #define DRM_XE_MMIO_16BIT	0x1
 #define DRM_XE_MMIO_32BIT	0x2
@@ -754,6 +755,7 @@ struct drm_xe_mmio {
 #define DRM_XE_MMIO_BITS_MASK	0x3
 #define DRM_XE_MMIO_READ	0x4
 #define DRM_XE_MMIO_WRITE	0x8
+	__u32 flags;
 
 	__u64 value;
 
@@ -773,47 +775,57 @@ struct drm_xe_mmio {
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
@@ -874,7 +886,6 @@ struct drm_xe_vm_madvise {
 #define		DRM_XE_VMA_PRIORITY_HIGH	2	/* Must be elevated user */
 	/* Pin the VMA in memory, must be elevated user */
 #define DRM_XE_VM_MADVISE_PIN			6
-
 	/** @property: property to set */
 	__u32 property;
 
-- 
2.34.1

