Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DF0C35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 15:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9686610EA45;
	Fri, 15 Dec 2023 15:46:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AE510EA45
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 15:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702655177; x=1734191177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZLral9v1qUndO3emCQuoKKBCQraktZsZs8ztyYzlF6Q=;
 b=aXOFRUFCvWhNKkEHDLPmPuJz9lOAZQVv/n7otfyPjgDWhYDZ/gROORQ0
 WJiLIRuCZfzh4TEVXjT1uZIaRLzpJw9t2N8XJLcxBN+0/OcQRr0A0gsdz
 v01NkS/v0FoemjzvoG3O7PExF6b5ETfsUYKJOCvDkSwLNBeyOl57eh8nD
 qEAOOHNKKyGCS7yI1uVIjztIqgz8+UCfbtKr/gG6nYGoeKggoYskcgRTz
 QQcLwFeEsJA+hfZ6evNJ7ofIQBTmL35ijpT+73Wcl4quBkzB5aUDrhIWN
 ppjEtFZe0n0XS+6+v42SaRXYrcQr0B6sMl3qBOo56vVHb35/tRtG6HlHt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2141858"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2141858"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="16324463"
Received: from sdiolatz-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.48.85])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:16 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 08/21] drm/xe/uapi: Add a comment to each struct
Date: Fri, 15 Dec 2023 15:45:40 +0000
Message-Id: <20231215154553.7-9-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215154553.7-1-francois.dugast@intel.com>
References: <20231215154553.7-1-francois.dugast@intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add a comment to each struct to complete documentation, ensure all
struct appear in the kernel doc, and bind structs to IOCTLs.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/uapi/drm/xe_drm.h | 43 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 2338d87dcb7d..43cacb168091 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -464,7 +464,8 @@ struct drm_xe_query_topology_mask {
 };
 
 /**
- * struct drm_xe_device_query - main structure to query device information
+ * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
+ * structure to query device information
  *
  * If size is set to 0, the driver fills it with the required size for the
  * requested type of data to query. If size is equal to the required size,
@@ -526,6 +527,10 @@ struct drm_xe_device_query {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_gem_create - Input of &DRM_IOCTL_XE_GEM_CREATE - A structure for
+ * gem creation
+ */
 struct drm_xe_gem_create {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -604,6 +609,9 @@ struct drm_xe_gem_create {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_gem_mmap_offset - Input of &DRM_IOCTL_XE_GEM_MMAP_OFFSET
+ */
 struct drm_xe_gem_mmap_offset {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -621,7 +629,9 @@ struct drm_xe_gem_mmap_offset {
 	__u64 reserved[2];
 };
 
-/** struct drm_xe_ext_set_property - XE set property extension */
+/**
+ * struct drm_xe_ext_set_property - XE set property extension
+ */
 struct drm_xe_ext_set_property {
 	/** @base: base user extension */
 	struct drm_xe_user_extension base;
@@ -639,6 +649,9 @@ struct drm_xe_ext_set_property {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_vm_create - Input of &DRM_IOCTL_XE_VM_CREATE
+ */
 struct drm_xe_vm_create {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -677,6 +690,9 @@ struct drm_xe_vm_create {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_vm_destroy - Input of &DRM_IOCTL_XE_VM_DESTROY
+ */
 struct drm_xe_vm_destroy {
 	/** @vm_id: VM ID */
 	__u32 vm_id;
@@ -688,6 +704,9 @@ struct drm_xe_vm_destroy {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_vm_bind_op
+ */
 struct drm_xe_vm_bind_op {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -804,6 +823,9 @@ struct drm_xe_vm_bind_op {
 	__u64 reserved[3];
 };
 
+/**
+ * struct drm_xe_vm_bind - Input of &DRM_IOCTL_XE_VM_BIND
+ */
 struct drm_xe_vm_bind {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -862,6 +884,9 @@ struct drm_xe_vm_bind {
 /* Monitor 64MB contiguous region with 2M sub-granularity */
 #define DRM_XE_ACC_GRANULARITY_64M 3
 
+/**
+ * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
+ */
 struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
@@ -904,6 +929,9 @@ struct drm_xe_exec_queue_create {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_exec_queue_get_property - Input of &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
+ */
 struct drm_xe_exec_queue_get_property {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -922,6 +950,9 @@ struct drm_xe_exec_queue_get_property {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_exec_queue_destroy - Input of &DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
+ */
 struct drm_xe_exec_queue_destroy {
 	/** @exec_queue_id: Exec queue ID */
 	__u32 exec_queue_id;
@@ -933,6 +964,9 @@ struct drm_xe_exec_queue_destroy {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_sync
+ */
 struct drm_xe_sync {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -967,6 +1001,9 @@ struct drm_xe_sync {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_exec - Input of &DRM_IOCTL_XE_EXEC
+ */
 struct drm_xe_exec {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -1000,7 +1037,7 @@ struct drm_xe_exec {
 };
 
 /**
- * struct drm_xe_wait_user_fence - wait user fence
+ * struct drm_xe_wait_user_fence - Input of &DRM_IOCTL_XE_WAIT_USER_FENCE
  *
  * Wait on user fence, XE will wake-up on every HW engine interrupt in the
  * instances list and check if user fence is complete::
-- 
2.34.1

