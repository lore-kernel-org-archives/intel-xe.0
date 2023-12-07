Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0103FC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC77C10E8AA;
	Thu,  7 Dec 2023 13:50:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C4A10E8A6
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701957032; x=1733493032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IRsmcthlyCVIrJ5fAaWBOZPr8t5TFBPAs0HHpuHoSPU=;
 b=NnTT9MNXd71+CywKx62g+lU2U8HjefFZnVMfKSh3QyjzxR99GKkC5ue+
 818CQJgif39hvvrYingVSlE1Rlk89SiDzqVgOFO/2vKYpeYaEK9Q4HELj
 jUG4Dqo8L0sG6Qo+m6VxiPk+R+jegOpf9cligwA7lcINpxeQOAMqYlQpe
 hnhxqjw5JcR6drYIQopgeKfLcRo3GYqWSZYjev70i8ndqq1MToLwfoDBf
 d1FT3t8aCNpaYawg2wOe8pw/kbs/yCCIW+IyVfnhYFuMvxXk1ySYK7gOa
 abI+0LrbEdV7npiiKytk7TWC3xyrNCRzIidyWIf7Vakc7PKa8QVzY07UO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373722256"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="373722256"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765115480"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="765115480"
Received: from elenagol-mobl.ccr.corp.intel.com (HELO fde8da82816e.intel.com)
 ([10.252.46.155])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:28 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 06/14] drm/xe/uapi: Make constant comments visible in
 kernel doc
Date: Thu,  7 Dec 2023 13:50:01 +0000
Message-Id: <20231207135009.7-7-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207135009.7-1-francois.dugast@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

As there is no direct way to make comments of constants directly
visible in the kernel doc, move them to the description of the
structure where they can be used. By doing so they appear in the
"Description" section of the struct documentation.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 267 ++++++++++++++++++++++----------------
 1 file changed, 158 insertions(+), 109 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 492f3c240e87..e608a8e7dd76 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -129,6 +129,19 @@ struct xe_user_extension {
  * It is returned as part of the @drm_xe_engine, but it also is used as
  * the input of engine selection for both @drm_xe_exec_queue_create and
  * @drm_xe_query_engine_cycles
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
+ *    hardware engine class) used for creating ordered queues of
+ *    synchronous VM bind operations.
  */
 struct drm_xe_engine_class_instance {
 #define DRM_XE_ENGINE_CLASS_RENDER		0
@@ -136,10 +149,6 @@ struct drm_xe_engine_class_instance {
 #define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
 #define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
 #define DRM_XE_ENGINE_CLASS_COMPUTE		4
-	/*
-	 * Kernel only classes (not actual hardware engine class). Used for
-	 * creating ordered queues of VM bind operations.
-	 */
 #define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
 #define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
 	/** @engine_class: engine class id */
@@ -344,6 +353,19 @@ struct drm_xe_query_mem_regions {
  * is equal to DRM_XE_DEVICE_QUERY_CONFIG, then the reply uses
  * struct drm_xe_query_config in .data.
  *
+ * The index in @info can be:
+ *  - %DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID - Device ID (lower 16 bits)
+ *    and the device revision (next 8 bits)
+ *  - %DRM_XE_QUERY_CONFIG_FLAGS - Flags describing the device
+ *    configuration, see list below
+ *
+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
+ *      has usable VRAM
+ *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
+ *    required by this device, typically SZ_4K or SZ_64K
+ *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
+ *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
+ *    available exec queue priority
  */
 struct drm_xe_query_config {
 	/** @num_params: number of parameters returned in info */
@@ -352,31 +374,11 @@ struct drm_xe_query_config {
 	/** @pad: MBZ */
 	__u32 pad;
 
-	/*
-	 * Device ID (lower 16 bits) and the device revision (next
-	 * 8 bits)
-	 */
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
-	/*
-	 * Flags describing the device configuration, see list below
-	 */
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
-	/*
-	 * Flag is set if the device has usable VRAM
-	 */
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
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
-	 * Value of the highest available exec queue priority
-	 */
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
 	/** @info: array of elements containing the config info */
 	__u64 info[];
@@ -389,6 +391,10 @@ struct drm_xe_query_config {
  * existing GT individual descriptions.
  * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
  * implementing graphics and/or media operations.
+ *
+ * The index in @type can be:
+ *  - %DRM_XE_QUERY_GT_TYPE_MAIN
+ *  - %DRM_XE_QUERY_GT_TYPE_MEDIA
  */
 struct drm_xe_gt {
 #define DRM_XE_QUERY_GT_TYPE_MAIN		0
@@ -446,34 +452,30 @@ struct drm_xe_query_gt_list {
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
@@ -493,6 +495,18 @@ struct drm_xe_query_topology_mask {
  * and sets the value in the query member. This determines the type of
  * the structure provided by the driver in data, among struct drm_xe_query_*.
  *
+ * The @query can be:
+ *  - %DRM_XE_DEVICE_QUERY_ENGINES
+ *  - %DRM_XE_DEVICE_QUERY_MEM_REGIONS
+ *  - %DRM_XE_DEVICE_QUERY_CONFIG
+ *  - %DRM_XE_DEVICE_QUERY_GT_LIST
+ *  - %DRM_XE_DEVICE_QUERY_HWCONFIG - Query type to retrieve the hardware
+ *    configuration of the device such as information on slices, memory,
+ *    caches, and so on. It is provided as a table of key / value
+ *    attributes.
+ *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
+ *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
+ *
  * If size is set to 0, the driver fills it with the required size for
  * the requested type of data to query. If size is equal to the required
  * size, the queried information is copied into data. If size is set to
@@ -539,11 +553,6 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_MEM_REGIONS		1
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
@@ -563,6 +572,33 @@ struct drm_xe_device_query {
 /**
  * struct drm_xe_gem_create - Input of &DRM_IOCTL_XE_GEM_CREATE - A structure for
  * gem creation
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
+ * @cpu_caching supports the following values:
+ *  - %DRM_XE_GEM_CPU_CACHING_WB - Allocate the pages with write-back
+ *    caching. On iGPU this can't be used for scanout surfaces. Currently
+ *    not allowed for objects placed in VRAM.
+ *  - %DRM_XE_GEM_CPU_CACHING_WC - Allocate the pages as write-combined. This
+ *    is uncached. Scanout surfaces should likely use this. All objects
+ *    that can be placed in VRAM must use this.
  */
 struct drm_xe_gem_create {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -579,21 +615,6 @@ struct drm_xe_gem_create {
 
 #define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
 #define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(1 << 1)
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
 #define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
 	/**
 	 * @flags: Flags, currently a mask of memory instances of where BO can
@@ -621,16 +642,6 @@ struct drm_xe_gem_create {
 	/**
 	 * @cpu_caching: The CPU caching mode to select for this object. If
 	 * mmaping the object the mode selected here will also be used.
-	 *
-	 * Supported values:
-	 *
-	 * DRM_XE_GEM_CPU_CACHING_WB: Allocate the pages with write-back
-	 * caching.  On iGPU this can't be used for scanout surfaces. Currently
-	 * not allowed for objects placed in VRAM.
-	 *
-	 * DRM_XE_GEM_CPU_CACHING_WC: Allocate the pages as write-combined. This
-	 * is uncached. Scanout surfaces should likely use this. All objects
-	 * that can be placed in VRAM must use this.
 	 */
 #define DRM_XE_GEM_CPU_CACHING_WB                      1
 #define DRM_XE_GEM_CPU_CACHING_WC                      2
@@ -684,35 +695,35 @@ struct drm_xe_ext_set_property {
 
 /**
  * struct drm_xe_vm_create - Input of &DRM_IOCTL_XE_VM_CREATE
+ *
+ * The @flags can be:
+ *  - %DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
+ *  - %DRM_XE_VM_CREATE_FLAG_LR_MODE - An LR, or Long Running VM accepts
+ *    exec submissions to its exec_queues that don't have an upper time
+ *    limit on the job execution time. But exec submissions to these
+ *    don't allow any of the flags DRM_XE_SYNC_FLAG_SYNCOBJ,
+ *    DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ, DRM_XE_SYNC_FLAG_DMA_BUF,
+ *    used as out-syncobjs, that is, together with DRM_XE_SYNC_FLAG_SIGNAL.
+ *    LR VMs can be created in recoverable page-fault mode using
+ *    DRM_XE_VM_CREATE_FLAG_FAULT_MODE, if the device supports it.
+ *    If that flag is omitted, the UMD can not rely on the slightly
+ *    different per-VM overcommit semantics that are enabled by
+ *    DRM_XE_VM_CREATE_FLAG_FAULT_MODE (see below), but KMD may
+ *    still enable recoverable pagefaults if supported by the device.
+ *  - %DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT
+ *  - %DRM_XE_VM_CREATE_FLAG_FAULT_MODE - Requires also
+ *    DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to be allocated on
+ *    demand when accessed, and also allows per-VM overcommit of memory.
+ *    The xe driver internally uses recoverable pagefaults to implement
+ *    this.
  */
 struct drm_xe_vm_create {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
 #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
-	/*
-	 * An LR, or Long Running VM accepts exec submissions
-	 * to its exec_queues that don't have an upper time limit on
-	 * the job execution time. But exec submissions to these
-	 * don't allow any of the flags DRM_XE_SYNC_FLAG_SYNCOBJ,
-	 * DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ, DRM_XE_SYNC_FLAG_DMA_BUF,
-	 * used as out-syncobjs, that is, together with DRM_XE_SYNC_FLAG_SIGNAL.
-	 * LR VMs can be created in recoverable page-fault mode using
-	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE, if the device supports it.
-	 * If that flag is omitted, the UMD can not rely on the slightly
-	 * different per-VM overcommit semantics that are enabled by
-	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE (see below), but KMD may
-	 * still enable recoverable pagefaults if supported by the device.
-	 */
 #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
 #define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
-	/*
-	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE requires also
-	 * DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to be allocated
-	 * on demand when accessed, and also allows per-VM overcommit of memory.
-	 * The xe driver internally uses recoverable pagefaults to implement
-	 * this.
-	 */
 #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
 	/** @flags: Flags */
 	__u32 flags;
@@ -739,7 +750,27 @@ struct drm_xe_vm_destroy {
 };
 
 /**
- * struct drm_xe_vm_bind_op
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
  */
 struct drm_xe_vm_bind_op {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -828,18 +859,7 @@ struct drm_xe_vm_bind_op {
 
 #define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
 #define DRM_XE_VM_BIND_FLAG_ASYNC	(1 << 1)
-	/*
-	 * Valid on a faulting VM only, do the MAP operation immediately rather
-	 * than deferring the MAP to the page fault handler.
-	 */
 #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 2)
-	/*
-	 * When the NULL flag is set, the page tables are setup with a special
-	 * bit which indicates writes are dropped and all reads return zero.  In
-	 * the future, the NULL flags will only be valid for DRM_XE_VM_BIND_OP_MAP
-	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
-	 * intended to implement VK sparse bindings.
-	 */
 #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 3)
 	/** @flags: Bind flags */
 	__u32 flags;
@@ -966,6 +986,9 @@ struct drm_xe_exec_queue_create {
 
 /**
  * struct drm_xe_exec_queue_get_property - Input of &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
+ *
+ * The @property can be:
+ *  - %DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN
  */
 struct drm_xe_exec_queue_get_property {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -1000,7 +1023,15 @@ struct drm_xe_exec_queue_destroy {
 };
 
 /**
- * struct drm_xe_sync
+ * struct drm_xe_sync - sync object
+ *
+ * The @type can be:
+ *  - %DRM_XE_SYNC_TYPE_SYNCOBJ
+ *  - %DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ
+ *  - %DRM_XE_SYNC_TYPE_USER_FENCE
+ *
+ * and the @flags can be:
+ *  - %DRM_XE_SYNC_FLAG_SIGNAL
  */
 struct drm_xe_sync {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -1082,6 +1113,24 @@ struct drm_xe_exec {
  *	(*addr & MASK) OP (VALUE & MASK)
  *
  * Returns to user on user fence completion or timeout.
+ *
+ * The @op can be:
+ *  - %DRM_XE_UFENCE_WAIT_OP_EQ
+ *  - %DRM_XE_UFENCE_WAIT_OP_NEQ
+ *  - %DRM_XE_UFENCE_WAIT_OP_GT
+ *  - %DRM_XE_UFENCE_WAIT_OP_GTE
+ *  - %DRM_XE_UFENCE_WAIT_OP_LT
+ *  - %DRM_XE_UFENCE_WAIT_OP_LTE
+ *
+ * and the @flags can be:
+ *  - %DRM_XE_UFENCE_WAIT_FLAG_ABSTIME
+ *  - %DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP
+ *
+ * The @mask values below can be used:
+ *  - %DRM_XE_UFENCE_WAIT_MASK_U8
+ *  - %DRM_XE_UFENCE_WAIT_MASK_U16
+ *  - %DRM_XE_UFENCE_WAIT_MASK_U32
+ *  - %DRM_XE_UFENCE_WAIT_MASK_U64
  */
 struct drm_xe_wait_user_fence {
 	/** @extensions: Pointer to the first extension struct, if any */
-- 
2.34.1

