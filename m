Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BE5C7EE2D
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 15:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA30510E4EF;
	Wed, 31 May 2023 15:24:06 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183B710E4EF
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 15:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685546644; x=1717082644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DeE3LaokPBrRCDi03uo6mCTBfhgOTgWlPRDBJu8WQIA=;
 b=G1phj86EGr9LbnkhH2n6aQIY7qeQYdIno7nW25gZtUgmWNKVBRZqVq+p
 ATUjXw3rMqpmcMP9G3dP301j3OPFZns2tRgBXmDMouRwZ3Z7uJWO+wXci
 7DzQDi1e5nrrW1x2UqWiHRP2UvBy02lad+dcVKYXeSSycpbWXEI8P0PH8
 w5H1HP2MVaD8VHPl0t29zue26fjGSs+dHqiWj6pqXtp9trOjmYp4hZMt9
 VYoTBm1oMdwWLbRlrI9/Yl8Wmk+5vul9vekQhC8z6Tz2A4H/Ymp7XgGSy
 udoJUAgGXVuiDAglzZVaHbaZeYzkDwVbQsH+/vAoqjU1dPpCglbhpZ8Lf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="339865512"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="339865512"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 08:24:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="796747936"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="796747936"
Received: from amokrov-mobl1.ccr.corp.intel.com (HELO 9d3bf2d3f760.intel.com)
 ([10.251.208.253])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 08:24:02 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 15:23:36 +0000
Message-Id: <20230531152338.6-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230531152338.6-1-francois.dugast@intel.com>
References: <20230531152338.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/5] drm/xe: Move defines before relevant
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Align on same rule in the whole file: defines then doc then relevant
field.

Reported-by: Oded Gabbay <ogabbay@kernel.org>
Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 62 ++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 5d34b570a305..2eea80bf0e06 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -138,6 +138,7 @@ struct drm_xe_query_mem_usage {
 struct drm_xe_query_config {
 	__u32 num_params;
 	__u32 pad;
+
 #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define XE_QUERY_CONFIG_FLAGS			1
 	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
@@ -179,11 +180,11 @@ struct drm_xe_query_topology_mask {
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
@@ -196,15 +197,14 @@ struct drm_xe_device_query {
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
@@ -227,12 +227,12 @@ struct drm_xe_gem_create {
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
@@ -293,8 +293,8 @@ struct drm_xe_ext_vm_set_property {
 	/** @base: base user extension */
 	struct xe_user_extension base;
 
-	/** @property: property to set */
 #define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
+	/** @property: property to set */
 	__u32 property;
 
 	/** @value: property value */
@@ -305,17 +305,17 @@ struct drm_xe_ext_vm_set_property {
 };
 
 struct drm_xe_vm_create {
-	/** @extensions: Pointer to the first extension struct, if any */
+
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
@@ -365,12 +365,6 @@ struct drm_xe_vm_bind_op {
 	 */
 	__u64 gt_mask;
 
-	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
-	__u32 op;
-
-	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
-	__u32 region;
-
 #define XE_VM_BIND_OP_MAP		0x0
 #define XE_VM_BIND_OP_UNMAP		0x1
 #define XE_VM_BIND_OP_MAP_USERPTR	0x2
@@ -409,6 +403,11 @@ struct drm_xe_vm_bind_op {
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
@@ -475,7 +474,6 @@ struct drm_xe_engine_set_property {
 	/** @engine_id: Engine ID */
 	__u32 engine_id;
 
-	/** @property: property to set */
 #define XE_ENGINE_SET_PROPERTY_PRIORITY			0
 #define XE_ENGINE_SET_PROPERTY_TIMESLICE		1
 #define XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
@@ -491,6 +489,7 @@ struct drm_xe_engine_set_property {
 #define XE_ENGINE_SET_PROPERTY_ACC_TRIGGER		6
 #define XE_ENGINE_SET_PROPERTY_ACC_NOTIFY		7
 #define XE_ENGINE_SET_PROPERTY_ACC_GRANULARITY		8
+	/** @property: property to set */
 	__u32 property;
 
 	/** @value: property value */
@@ -501,7 +500,6 @@ struct drm_xe_engine_set_property {
 };
 
 struct drm_xe_engine_class_instance {
-	__u16 engine_class;
 
 #define DRM_XE_ENGINE_CLASS_RENDER		0
 #define DRM_XE_ENGINE_CLASS_COPY		1
@@ -513,14 +511,16 @@ struct drm_xe_engine_class_instance {
 	 * creating ordered queues of VM bind operations.
 	 */
 #define DRM_XE_ENGINE_CLASS_VM_BIND		5
+	__u16 engine_class;
 
 	__u16 engine_instance;
 	__u16 gt_id;
 };
 
 struct drm_xe_engine_create {
-	/** @extensions: Pointer to the first extension struct, if any */
+
 #define XE_ENGINE_EXTENSION_SET_PROPERTY               0
+	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
 	/** @width: submission width (number BB per exec) for this engine */
@@ -558,8 +558,8 @@ struct drm_xe_engine_get_property {
 	/** @engine_id: Engine ID */
 	__u32 engine_id;
 
-	/** @property: property to get */
 #define XE_ENGINE_GET_PROPERTY_BAN			0
+	/** @property: property to get */
 	__u32 property;
 
 	/** @value: property value */
@@ -584,13 +584,12 @@ struct drm_xe_sync {
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
 
 	union {
 		__u32 handle;
@@ -646,8 +645,6 @@ struct drm_xe_mmio {
 
 	__u32 addr;
 
-	__u32 flags;
-
 #define DRM_XE_MMIO_8BIT	0x0
 #define DRM_XE_MMIO_16BIT	0x1
 #define DRM_XE_MMIO_32BIT	0x2
@@ -655,6 +652,7 @@ struct drm_xe_mmio {
 #define DRM_XE_MMIO_BITS_MASK	0x3
 #define DRM_XE_MMIO_READ	0x4
 #define DRM_XE_MMIO_WRITE	0x8
+	__u32 flags;
 
 	__u64 value;
 
@@ -685,27 +683,32 @@ struct drm_xe_wait_user_fence {
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
 	/**
@@ -770,7 +773,6 @@ struct drm_xe_vm_madvise {
 #define		DRM_XE_VMA_PRIORITY_HIGH	2	/* Must be elevated user */
 	/* Pin the VMA in memory, must be elevated user */
 #define DRM_XE_VM_MADVISE_PIN			6
-
 	/** @property: property to set */
 	__u32 property;
 
-- 
2.34.1

