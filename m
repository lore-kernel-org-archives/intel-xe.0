Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AEBC10F05
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFA010E1D6;
	Thu,  7 Dec 2023 13:50:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C23A10E1C4
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701957022; x=1733493022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5l5VZgtucyZtZaWtTavvK/3+q28+XvJiAnoz9SBjVdw=;
 b=U+5BRzvtKa/JCO5gXfl7ow1yf7ovopIk4g+BWqxmQXRCTXevFw/5tS21
 F6dPRNtapyhsGLlFY61a0oFnfoBOebrnZ7jYr8LpdioOKWd7bxLy5Or75
 gE9jOYoBKaC6Qh4uLV6pA07JE6q9de/rllX3kKtPLl9EUiv0aBz/noUHc
 ETQVjLubB/fBOJWSs1FbhPSFvW3zme1QHnW4fAZHMMBr1iBGCdpkEoXwo
 r/PKvsnS35OzSPNrTMvIs4lqfGTuEMvpuyCASH4iolSq5iNXtE9KjCbC3
 E6zd3w5oKL4IEXdRbAQKjJY8Da26ammaqfGbTJJq97tTgW5UtWB/Cfij0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373722236"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="373722236"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765115429"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="765115429"
Received: from elenagol-mobl.ccr.corp.intel.com (HELO fde8da82816e.intel.com)
 ([10.252.46.155])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:20 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 01/14] drm/xe/uapi: Add a comment to each struct
Date: Thu,  7 Dec 2023 13:49:56 +0000
Message-Id: <20231207135009.7-2-francois.dugast@intel.com>
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

Add a comment to each struct to complete documentation, ensure all
struct appear in the kernel doc, and bind structs to IOCTLs.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 43 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 0895e4d2a981..be58cd641324 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -466,7 +466,8 @@ struct drm_xe_query_topology_mask {
 };
 
 /**
- * struct drm_xe_device_query - main structure to query device information
+ * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
+ * structure to query device information
  *
  * If size is set to 0, the driver fills it with the required size for the
  * requested type of data to query. If size is equal to the required size,
@@ -528,6 +529,10 @@ struct drm_xe_device_query {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_gem_create - Input of &DRM_IOCTL_XE_GEM_CREATE - A structure for
+ * gem creation
+ */
 struct drm_xe_gem_create {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -606,6 +611,9 @@ struct drm_xe_gem_create {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_gem_mmap_offset - Input of &DRM_IOCTL_XE_GEM_MMAP_OFFSET
+ */
 struct drm_xe_gem_mmap_offset {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -623,7 +631,9 @@ struct drm_xe_gem_mmap_offset {
 	__u64 reserved[2];
 };
 
-/** struct drm_xe_ext_set_property - XE set property extension */
+/**
+ * struct drm_xe_ext_set_property - XE set property extension
+ */
 struct drm_xe_ext_set_property {
 	/** @base: base user extension */
 	struct xe_user_extension base;
@@ -641,6 +651,9 @@ struct drm_xe_ext_set_property {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_vm_create - Input of &DRM_IOCTL_XE_VM_CREATE
+ */
 struct drm_xe_vm_create {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -680,6 +693,9 @@ struct drm_xe_vm_create {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_vm_destroy - Input of &DRM_IOCTL_XE_VM_DESTROY
+ */
 struct drm_xe_vm_destroy {
 	/** @vm_id: VM ID */
 	__u32 vm_id;
@@ -691,6 +707,9 @@ struct drm_xe_vm_destroy {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_vm_bind_op
+ */
 struct drm_xe_vm_bind_op {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -808,6 +827,9 @@ struct drm_xe_vm_bind_op {
 	__u64 reserved[3];
 };
 
+/**
+ * struct drm_xe_vm_bind - Input of &DRM_IOCTL_XE_VM_BIND
+ */
 struct drm_xe_vm_bind {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -866,6 +888,9 @@ struct drm_xe_vm_bind {
 /* Monitor 64MB contiguous region with 2M sub-granularity */
 #define DRM_XE_ACC_GRANULARITY_64M 3
 
+/**
+ * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
+ */
 struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
@@ -908,6 +933,9 @@ struct drm_xe_exec_queue_create {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_exec_queue_get_property - Input of &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
+ */
 struct drm_xe_exec_queue_get_property {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -926,6 +954,9 @@ struct drm_xe_exec_queue_get_property {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_exec_queue_destroy - Input of &DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
+ */
 struct drm_xe_exec_queue_destroy {
 	/** @exec_queue_id: Exec queue ID */
 	__u32 exec_queue_id;
@@ -937,6 +968,9 @@ struct drm_xe_exec_queue_destroy {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_sync
+ */
 struct drm_xe_sync {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -971,6 +1005,9 @@ struct drm_xe_sync {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_exec - Input of &DRM_IOCTL_XE_EXEC
+ */
 struct drm_xe_exec {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -1004,7 +1041,7 @@ struct drm_xe_exec {
 };
 
 /**
- * struct drm_xe_wait_user_fence - wait user fence
+ * struct drm_xe_wait_user_fence - Input of &DRM_IOCTL_XE_WAIT_USER_FENCE
  *
  * Wait on user fence, XE will wake-up on every HW engine interrupt in the
  * instances list and check if user fence is complete::
-- 
2.34.1

