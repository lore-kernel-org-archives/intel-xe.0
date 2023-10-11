Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0C5CD6E72
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 14:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AF810E851;
	Wed, 11 Oct 2023 14:00:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC6710E867
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 13:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697032790; x=1728568790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VacrCrEvySG7MIgCTcpbYPD301S0SrbUJ4F0I1n+Uxk=;
 b=Kkd5/OXPKcfuV76MwJOEhOqdEfyv9ZMTIVUrzAZsHzmNrGvkWXKSoYeM
 abTAtvxDn5d5yqKdIvQW0pyLSzXURTt3eSt8KuUds1BAP4eHqQQ1/XN/v
 NjZD3mOP4Fe6pfdcohnMynlyTG12Vuj6vB4dNJfhgpPzhSbDFj29YNztU
 5JFQfRC3DsCZg1VWtw7jZWYDy/LWOiYfjZ4sVqAG84AeD5Ck4z+nq2d0u
 g1Yyanrk5DgJRDCewmL4V1jaRBgFEhNpiGCgafeSTillMiSeqAfZ5gZvw
 crHRxXg2dWqCBac58udsSdY4SeW3IQj+jkY5dR6rCidDqOufVjxcvbuvW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451156256"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="451156256"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="753829163"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="753829163"
Received: from stahadie-mobl4.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.249.36.91])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:48 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 13:59:20 +0000
Message-Id: <20231011135926.7-12-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011135926.7-1-francois.dugast@intel.com>
References: <20231011135926.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v1 11/17] drm/xe/uapi: Make constant comments
 visible in kernel doc
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

As there is no direct way to make comments of constants directly
visible in the kernel doc, move them to the description of the
structure where they can be used. By doing so they appear in the
"Description" section of the struct documentation.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 264 ++++++++++++++++++++++----------------
 1 file changed, 150 insertions(+), 114 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index f0c32da829b9..307abad33710 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -126,23 +126,40 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
 
-/** struct drm_xe_engine_class_instance - instance of an engine class */
+/**
+ * struct drm_xe_engine_class_instance - instance of an engine class
+ *
+ * The @engine_class can be:
+ *  - %DRM_XE_ENGINE_CLASS_RENDER
+ *  - %DRM_XE_ENGINE_CLASS_COPY
+ *  - %DRM_XE_ENGINE_CLASS_VIDEO_DECODE
+ *  - %DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE
+ *  - %DRM_XE_ENGINE_CLASS_COMPUTE
+ *  - %DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC - Kernel only class (not actual
+ *    hardware engine class) used for creating ordered queues of
+ *    asynchronous VM bind operations.
+ *  - %DRM_XE_ENGINE_CLASS_VM_BIND_SYNC - Kernel only class (not actual
+ *    synchronous VM bind operations.
+ *
+ */
 struct drm_xe_engine_class_instance {
 #define DRM_XE_ENGINE_CLASS_RENDER		0
 #define DRM_XE_ENGINE_CLASS_COPY		1
 #define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
 #define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
 #define DRM_XE_ENGINE_CLASS_COMPUTE		4
-	/*
-	 * Kernel only classes (not actual hardware engine class). Used for
-	 * creating ordered queues of VM bind operations.
-	 */
 #define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
 #define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
+	/**
+	 * @engine_class: Class of this instance among possible
+	 * DRM_XE_ENGINE_CLASS_*
+	 */
 	__u16 engine_class;
-
+	/** @engine_instance: Engine instance */
 	__u16 engine_instance;
+	/** @gt_id: GT ID the instance is associated with */
 	__u16 gt_id;
+	/** @rsvd: Reserved */
 	__u16 rsvd;
 };
 
@@ -313,44 +330,36 @@ struct drm_xe_query_mem_usage {
  * If a query is made with a struct drm_xe_device_query where .query
  * is equal to DRM_XE_DEVICE_QUERY_CONFIG, then the reply uses
  * struct drm_xe_query_config in .data.
+ *
+ * The index in @info can be:
+ *  - %DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID - Device ID (lower 16 bits)
+ *    and the device revision (next 8 bits)
+ *  - %DRM_XE_QUERY_CONFIG_FLAGS - Flags describing the device
+ *    configuration, see list below
+ *
+ *    - %DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM - Flag is set if the device
+ *      has usable VRAM
+ *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
+ *    required by this device, typically SZ_4K or SZ_64K
+ *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
+ *  - %DRM_XE_QUERY_CONFIG_GT_COUNT - Total number of GTs for the entire
+ *    device
+ *  - %DRM_XE_QUERY_CONFIG_MEM_REGION_COUNT - Total number of accessible
+ *    memory regions
+ *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
+ *    available exec queue priority
  */
 struct drm_xe_query_config {
 	/** @pad: MBZ */
 	__u32 pad;
 
-	/*
-	 * Device ID (lower 16 bits) and the device revision (next
-	 * 8 bits)
-	 */
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID		0
-	/*
-	 * Flags describing the device configuration, see list below
-	 */
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
-	/*
-	 * Flag is set if the device has usable VRAM
-	 */
 	#define DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM	(0x1 << 0)
-	/*
-	 * Minimal memory alignment required by this device,
-	 * typically SZ_4K or SZ_64K
-	 */
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
-	/*
-	 * Maximum bits of a virtual address
-	 */
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
-	/*
-	 * Total number of GTs for the entire device
-	 */
 #define DRM_XE_QUERY_CONFIG_GT_COUNT			4
-	/*
-	 * Total number of accessible memory regions
-	 */
 #define DRM_XE_QUERY_CONFIG_MEM_REGION_COUNT		5
-	/*
-	 * Value of the highest available exec queue priority
-	 */
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
 	/** @info: array of elements containing the config info */
 	__u64 info[];
@@ -363,6 +372,7 @@ struct drm_xe_query_config {
  * existing GT individual descriptions.
  * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
  * implementing graphics and/or media operations.
+ *
  */
 struct drm_xe_query_gt {
 #define DRM_XE_QUERY_GT_TYPE_MAIN		0
@@ -420,34 +430,31 @@ struct drm_xe_query_gt_list {
  * If a query is made with a struct drm_xe_device_query where .query
  * is equal to DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, then the reply uses
  * struct drm_xe_query_topology_mask in .data.
+ *
+ * The @type can be:
+ *  - %DRM_XE_TOPO_DSS_GEOMETRY - To query the mask of Dual Sub Slices
+ *    (DSS) available for geometry operations. For example a query response
+ *    containing the following in mask:
+ *    ``DSS_GEOMETRY    ff ff ff ff 00 00 00 00``
+ *    means 32 DSS are available for geometry.
+ *  - %DRM_XE_TOPO_DSS_COMPUTE - To query the mask of Dual Sub Slices
+ *    (DSS) available for compute operations. For example a query response
+ *    containing the following in mask:
+ *    ``DSS_COMPUTE    ff ff ff ff 00 00 00 00``
+ *    means 32 DSS are available for compute.
+ *  - %DRM_XE_TOPO_EU_PER_DSS - To query the mask of Execution Units (EU)
+ *    available per Dual Sub Slices (DSS). For example a query response
+ *    containing the following in mask:
+ *    ``EU_PER_DSS    ff ff 00 00 00 00 00 00``
+ *    means each DSS has 16 EU.
+ *
  */
 struct drm_xe_query_topology_mask {
 	/** @gt_id: GT ID the mask is associated with */
 	__u16 gt_id;
 
-	/*
-	 * To query the mask of Dual Sub Slices (DSS) available for geometry
-	 * operations. For example a query response containing the following
-	 * in mask:
-	 *   DSS_GEOMETRY    ff ff ff ff 00 00 00 00
-	 * means 32 DSS are available for geometry.
-	 */
 #define DRM_XE_TOPO_DSS_GEOMETRY	(1 << 0)
-	/*
-	 * To query the mask of Dual Sub Slices (DSS) available for compute
-	 * operations. For example a query response containing the following
-	 * in mask:
-	 *   DSS_COMPUTE    ff ff ff ff 00 00 00 00
-	 * means 32 DSS are available for compute.
-	 */
 #define DRM_XE_TOPO_DSS_COMPUTE		(1 << 1)
-	/*
-	 * To query the mask of Execution Units (EU) available per Dual Sub
-	 * Slices (DSS). For example a query response containing the following
-	 * in mask:
-	 *   EU_PER_DSS    ff ff 00 00 00 00 00 00
-	 * means each DSS has 16 EU.
-	 */
 #define DRM_XE_TOPO_EU_PER_DSS		(1 << 2)
 	/** @type: type of mask */
 	__u16 type;
@@ -497,6 +504,19 @@ struct drm_xe_query_uc_fw_version {
  * and sets the value in the query member. This determines the type of
  * the structure provided by the driver in data, among struct drm_xe_query_*.
  *
+ * The @query can be:
+ *  - %DRM_XE_DEVICE_QUERY_ENGINES
+ *  - %DRM_XE_DEVICE_QUERY_MEM_USAGE
+ *  - %DRM_XE_DEVICE_QUERY_CONFIG
+ *  - %DRM_XE_DEVICE_QUERY_GT_LIST - Query type to retrieve the hardware
+ *    configuration of the device such as information on slices, memory,
+ *    caches, and so on. It is provided as a table of key / value
+ *    attributes.
+ *  - %DRM_XE_DEVICE_QUERY_HWCONFIG
+ *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
+ *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
+ *  - %DRM_XE_DEVICE_QUERY_UC_FW_VERSION
+ *
  * If size is set to 0, the driver fills it with the required size for
  * the requested type of data to query. If size is equal to the required
  * size, the queried information is copied into data. If size is set to
@@ -539,11 +559,6 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_MEM_USAGE		1
 #define DRM_XE_DEVICE_QUERY_CONFIG		2
 #define DRM_XE_DEVICE_QUERY_GT_LIST		3
-	/*
-	 * Query type to retrieve the hardware configuration of the device
-	 * such as information on slices, memory, caches, and so on. It is
-	 * provided as a table of attributes (key / value).
-	 */
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
@@ -561,6 +576,29 @@ struct drm_xe_device_query {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_gem_create - structure for gem creation
+ *
+ * The @flags can be:
+ *  - %DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING
+ *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT
+ *  - %DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM - When using VRAM as a
+ *    possible placement, ensure that the corresponding VRAM allocation
+ *    will always use the CPU accessible part of VRAM. This is important
+ *    for small-bar systems (on full-bar systems this gets turned into a
+ *    noop).
+ *    Note1: System memory can be used as an extra placement if the kernel
+ *    should spill the allocation to system memory, if space can't be made
+ *    available in the CPU accessible part of VRAM (giving the same
+ *    behaviour as the i915 interface, see
+ *    I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS).
+ *    Note2: For clear-color CCS surfaces the kernel needs to read the
+ *    clear-color value stored in the buffer, and on discrete platforms we
+ *    need to use VRAM for display surfaces, therefore the kernel requires
+ *    setting this flag for such objects, otherwise an error is thrown on
+ *    small-bar systems.
+ *
+ */
 struct drm_xe_gem_create {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -574,21 +612,6 @@ struct drm_xe_gem_create {
 
 #define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(0x1 << 24)
 #define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(0x1 << 25)
-/*
- * When using VRAM as a possible placement, ensure that the corresponding VRAM
- * allocation will always use the CPU accessible part of VRAM. This is important
- * for small-bar systems (on full-bar systems this gets turned into a noop).
- *
- * Note: System memory can be used as an extra placement if the kernel should
- * spill the allocation to system memory, if space can't be made available in
- * the CPU accessible part of VRAM (giving the same behaviour as the i915
- * interface, see I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS).
- *
- * Note: For clear-color CCS surfaces the kernel needs to read the clear-color
- * value stored in the buffer, and on discrete platforms we need to use VRAM for
- * display surfaces, therefore the kernel requires setting this flag for such
- * objects, otherwise an error is thrown on small-bar systems.
- */
 #define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(0x1 << 26)
 	/**
 	 * @flags: Flags, currently a mask of memory instances of where BO can
@@ -685,6 +708,30 @@ struct drm_xe_vm_destroy {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_vm_bind_op - run bind operations
+ *
+ * The @op can be:
+ *  - %DRM_XE_VM_BIND_OP_MAP
+ *  - %DRM_XE_VM_BIND_OP_UNMAP
+ *  - %DRM_XE_VM_BIND_OP_MAP_USERPTR
+ *  - %DRM_XE_VM_BIND_OP_UNMAP_ALL
+ *  - %DRM_XE_VM_BIND_OP_PREFETCH
+ *
+ * and the @flags can be:
+ *  - %DRM_XE_VM_BIND_FLAG_READONLY
+ *  - %DRM_XE_VM_BIND_FLAG_ASYNC
+ *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
+ *    MAP operation immediately rather than deferring the MAP to the page
+ *    fault handler.
+ *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
+ *    tables are setup with a special bit which indicates writes are
+ *    dropped and all reads return zero. In the future, the NULL flags
+ *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
+ *    handle MBZ, and the BO offset MBZ. This flag is intended to
+ *    implement VK sparse bindings.
+ *
+ */
 struct drm_xe_vm_bind_op {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -732,23 +779,12 @@ struct drm_xe_vm_bind_op {
 
 #define DRM_XE_VM_BIND_FLAG_READONLY	(0x1 << 0)
 #define DRM_XE_VM_BIND_FLAG_ASYNC	(0x1 << 1)
-	/*
-	 * Valid on a faulting VM only, do the MAP operation immediately rather
-	 * than deferring the MAP to the page fault handler.
-	 */
 #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 2)
-	/*
-	 * When the NULL flag is set, the page tables are setup with a special
-	 * bit which indicates writes are dropped and all reads return zero.  In
-	 * the future, the NULL flags will only be valid for DRM_XE_VM_BIND_OP_MAP
-	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
-	 * intended to implement VK sparse bindings.
-	 */
 #define DRM_XE_VM_BIND_FLAG_NULL	(0x1 << 3)
 	/** @flags: Bind flags */
 	__u32 flags;
 
-	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
+	/** @region: Memory region to prefetch VMA to, instance not a mask */
 	__u32 region;
 
 	/** @reserved: Reserved */
@@ -1034,6 +1070,35 @@ struct drm_xe_wait_user_fence {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_vm_madvise - give advice about use of memory
+ *
+ * The @property can be:
+ *  - %DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS - Setting the preferred
+ *    location will trigger a migrate of the VMA backing store to new
+ *    location if the backing store is already allocated.
+ *    For DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS usage, see enum
+ *    drm_xe_memory_class.
+ *  - %DRM_XE_VM_MADVISE_PREFERRED_GT
+ *  - %DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS_GT - In this case lower 32 bits
+ *    are mem class, upper 32 are GT. Combination provides a single IOCTL
+ *    plus migrate VMA to preferred location.
+ *  - %DRM_XE_VM_MADVISE_CPU_ATOMIC - The CPU will do atomic memory
+ *    operations to this VMA. Must be set on some devices for atomics to
+ *    behave correctly.
+ *  - %DRM_XE_VM_MADVISE_DEVICE_ATOMIC - The device will do atomic memory
+ *    operations to this VMA. Must be set on some devices for atomics to
+ *    behave correctly.
+ *  - %DRM_XE_VM_MADVISE_PRIORITY - Priority WRT to eviction (moving from
+ *    preferred memory location due to memory pressure). The lower the
+ *    priority, the more likely to be evicted.
+ *
+ *    - %DRM_XE_VMA_PRIORITY_LOW
+ *    - %DRM_XE_VMA_PRIORITY_NORMAL - Default
+ *    - %DRM_XE_VMA_PRIORITY_HIGH - Must be user with elevated privileges
+ *  - %DRM_XE_VM_MADVISE_PIN - Pin the VMA in memory, must be user with
+ *    elevated privileges
+ */
 struct drm_xe_vm_madvise {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -1050,44 +1115,15 @@ struct drm_xe_vm_madvise {
 	/** @addr: Address of the VMA to operation on */
 	__u64 addr;
 
-	/*
-	 * Setting the preferred location will trigger a migrate of the VMA
-	 * backing store to new location if the backing store is already
-	 * allocated.
-	 *
-	 * For DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS usage, see enum
-	 * drm_xe_memory_class.
-	 */
 #define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS		0
 #define DRM_XE_VM_MADVISE_PREFERRED_GT			1
-	/*
-	 * In this case lower 32 bits are mem class, upper 32 are GT.
-	 * Combination provides a single IOCTL plus migrate VMA to preferred
-	 * location.
-	 */
 #define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS_GT	2
-	/*
-	 * The CPU will do atomic memory operations to this VMA. Must be set on
-	 * some devices for atomics to behave correctly.
-	 */
 #define DRM_XE_VM_MADVISE_CPU_ATOMIC			3
-	/*
-	 * The device will do atomic memory operations to this VMA. Must be set
-	 * on some devices for atomics to behave correctly.
-	 */
 #define DRM_XE_VM_MADVISE_DEVICE_ATOMIC			4
-	/*
-	 * Priority WRT to eviction (moving from preferred memory location due
-	 * to memory pressure). The lower the priority, the more likely to be
-	 * evicted.
-	 */
 #define DRM_XE_VM_MADVISE_PRIORITY			5
 #define		DRM_XE_VMA_PRIORITY_LOW			0
-		/* Default */
 #define		DRM_XE_VMA_PRIORITY_NORMAL		1
-		/* Must be user with elevated privileges */
 #define		DRM_XE_VMA_PRIORITY_HIGH		2
-	/* Pin the VMA in memory, must be user with elevated privileges */
 #define DRM_XE_VM_MADVISE_PIN				6
 	/** @property: property to set */
 	__u32 property;
-- 
2.34.1

