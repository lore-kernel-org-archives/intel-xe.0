Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2449C77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 19:08:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6F610E069;
	Fri, 26 May 2023 19:08:47 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541D910E069
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 19:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685128126; x=1716664126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bCkcicoQEoWBlU5qJ7RIqwBXhAWioG0XOZexYh6GXaQ=;
 b=m4L1YIxXhSSFWi2AM2bzMISMF4PBeiQXieFkxD8r8gg+9DGp/odZVW5B
 Bn8qYp+CIltun1qVDoVaEg6gfnrzDfzlHFE4x/0/OrSv4zkP12LcgIVJx
 iBQY059g5H8gT+v6R2vhr0aiIb4q00Rp/e4eVkdVQv7pIK7bWPhwC6dLZ
 ntWBXZbvOky4bt8BIotQ/Hv7XSrLRmRyvge7MzvBS5vVVgjj0XTfCYSKD
 I/0gPSWAAvb6Sn0PX7lTF+QGtW5dcIpX6B7aHQ0n2hrRJ/4WvNQ+aZQh3
 s0PYYV+fcp72isp5KY0l6/Kb8+H2f11cWB+qIDVRhW4LC8uhBQzeXIoht A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="440637384"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="440637384"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 12:08:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="682817902"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="682817902"
Received: from omurra1x-mobl.ger.corp.intel.com (HELO 2082b82b753b.intel.com)
 ([10.252.55.34])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 12:08:44 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 19:08:22 +0000
Message-Id: <20230526190824.7-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526190824.7-1-francois.dugast@intel.com>
References: <20230526190824.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/5] drm/xe: Move defines after relevant fields
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

Align on same rule in the whoe file: defines come after the
relevant fields.

Reported-by: Oded Gabbay <ogabbay@kernel.org>
Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 40 +++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 5d34b570a305..160b0aad4a96 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -116,9 +116,6 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
 
-#define XE_MEM_REGION_CLASS_SYSMEM	0
-#define XE_MEM_REGION_CLASS_VRAM	1
-
 struct drm_xe_query_mem_usage {
 	__u32 num_regions;
 	__u32 pad;
@@ -135,9 +132,13 @@ struct drm_xe_query_mem_usage {
 	} regions[];
 };
 
+#define XE_MEM_REGION_CLASS_SYSMEM	0
+#define XE_MEM_REGION_CLASS_VRAM	1
+
 struct drm_xe_query_config {
 	__u32 num_params;
 	__u32 pad;
+	__u64 info[];
 #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define XE_QUERY_CONFIG_FLAGS			1
 	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
@@ -148,7 +149,6 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
 #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
 #define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1
-	__u64 info[];
 };
 
 struct drm_xe_query_gts {
@@ -161,10 +161,10 @@ struct drm_xe_query_gts {
 	 */
 
 	struct drm_xe_query_gt {
+		__u16 type;
 #define XE_QUERY_GT_TYPE_MAIN		0
 #define XE_QUERY_GT_TYPE_REMOTE		1
 #define XE_QUERY_GT_TYPE_MEDIA		2
-		__u16 type;
 		__u16 instance;
 		__u32 clock_freq;
 		__u64 features;
@@ -231,9 +231,9 @@ struct drm_xe_gem_create {
 	 * @flags: Flags, currently a mask of memory instances of where BO can
 	 * be placed
 	 */
+	__u32 flags;
 #define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
 #define XE_GEM_CREATE_FLAG_SCANOUT		(0x1 << 25)
-	__u32 flags;
 
 	/**
 	 * @vm_id: Attached VM, if any
@@ -294,8 +294,8 @@ struct drm_xe_ext_vm_set_property {
 	struct xe_user_extension base;
 
 	/** @property: property to set */
-#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
 	__u32 property;
+#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
 
 	/** @value: property value */
 	__u64 value;
@@ -306,8 +306,8 @@ struct drm_xe_ext_vm_set_property {
 
 struct drm_xe_vm_create {
 	/** @extensions: Pointer to the first extension struct, if any */
-#define XE_VM_EXTENSION_SET_PROPERTY	0
 	__u64 extensions;
+#define XE_VM_EXTENSION_SET_PROPERTY	0
 
 	/** @flags: Flags */
 	__u32 flags;
@@ -368,9 +368,6 @@ struct drm_xe_vm_bind_op {
 	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
 	__u32 op;
 
-	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
-	__u32 region;
-
 #define XE_VM_BIND_OP_MAP		0x0
 #define XE_VM_BIND_OP_UNMAP		0x1
 #define XE_VM_BIND_OP_MAP_USERPTR	0x2
@@ -410,6 +407,9 @@ struct drm_xe_vm_bind_op {
 	 */
 #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
 
+	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
+	__u32 region;
+
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
@@ -476,6 +476,7 @@ struct drm_xe_engine_set_property {
 	__u32 engine_id;
 
 	/** @property: property to set */
+	__u32 property;
 #define XE_ENGINE_SET_PROPERTY_PRIORITY			0
 #define XE_ENGINE_SET_PROPERTY_TIMESLICE		1
 #define XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
@@ -491,7 +492,6 @@ struct drm_xe_engine_set_property {
 #define XE_ENGINE_SET_PROPERTY_ACC_TRIGGER		6
 #define XE_ENGINE_SET_PROPERTY_ACC_NOTIFY		7
 #define XE_ENGINE_SET_PROPERTY_ACC_GRANULARITY		8
-	__u32 property;
 
 	/** @value: property value */
 	__u64 value;
@@ -520,8 +520,8 @@ struct drm_xe_engine_class_instance {
 
 struct drm_xe_engine_create {
 	/** @extensions: Pointer to the first extension struct, if any */
-#define XE_ENGINE_EXTENSION_SET_PROPERTY               0
 	__u64 extensions;
+#define XE_ENGINE_EXTENSION_SET_PROPERTY               0
 
 	/** @width: submission width (number BB per exec) for this engine */
 	__u16 width;
@@ -559,8 +559,8 @@ struct drm_xe_engine_get_property {
 	__u32 engine_id;
 
 	/** @property: property to get */
-#define XE_ENGINE_GET_PROPERTY_BAN			0
 	__u32 property;
+#define XE_ENGINE_GET_PROPERTY_BAN			0
 
 	/** @value: property value */
 	__u64 value;
@@ -686,26 +686,26 @@ struct drm_xe_wait_user_fence {
 		__u64 vm_id;
 	};
 	/** @op: wait operation (type of comparison) */
+	__u16 op;
 #define DRM_XE_UFENCE_WAIT_EQ	0
 #define DRM_XE_UFENCE_WAIT_NEQ	1
 #define DRM_XE_UFENCE_WAIT_GT	2
 #define DRM_XE_UFENCE_WAIT_GTE	3
 #define DRM_XE_UFENCE_WAIT_LT	4
 #define DRM_XE_UFENCE_WAIT_LTE	5
-	__u16 op;
 	/** @flags: wait flags */
+	__u16 flags;
 #define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
 #define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
 #define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
-	__u16 flags;
 	/** @value: compare value */
 	__u64 value;
 	/** @mask: comparison mask */
+	__u64 mask;
 #define DRM_XE_UFENCE_WAIT_U8		0xffu
 #define DRM_XE_UFENCE_WAIT_U16		0xffffu
 #define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
 #define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
-	__u64 mask;
 	/** @timeout: how long to wait before bailing, value in jiffies */
 	__s64 timeout;
 	/**
@@ -736,6 +736,9 @@ struct drm_xe_vm_madvise {
 	/** @addr: Address of the VMA to operation on */
 	__u64 addr;
 
+	/** @property: property to set */
+	__u32 property;
+
 	/*
 	 * Setting the preferred location will trigger a migrate of the VMA
 	 * backing store to new location if the backing store is already
@@ -771,9 +774,6 @@ struct drm_xe_vm_madvise {
 	/* Pin the VMA in memory, must be elevated user */
 #define DRM_XE_VM_MADVISE_PIN			6
 
-	/** @property: property to set */
-	__u32 property;
-
 	/** @value: property value */
 	__u64 value;
 
-- 
2.34.1

