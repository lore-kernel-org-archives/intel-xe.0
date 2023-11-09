Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA05C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:47:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177C910E8DC;
	Thu,  9 Nov 2023 15:47:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B8C10E8EB
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544769; x=1731080769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v/GyfgHwWwUFaI3wIE+k1pG3WDBVWRtHOaFT9DDgA0Q=;
 b=iRCeJNKzNzhj3v2G7FMdO8t4d5FqQzzSt1Ug9wOKUP0j8SqmcIJrtfHd
 fyWxz5r8HrXYQ18HHSwP4L0Ror7hlaRKN/3inFYsFV6nIbDA+6Ez0iIbz
 jwEvJ4yVf54YHK7vMbdxwrzMag+eDjcaMLwL1ffg27ftW8V7FNAcg2Vx8
 oY3LzTDUmMGpEbTa42iJEDq0aWZGOJiTedCtfSrIcBoholjf35iWURcyg
 DSsg+kLvOU3YsfWlebjAKCMy7FGj8gkvX6jdg4JmokyZBktE5xjs0PCfy
 U9Y53TDzAGV5ESsOWbPlNM85at0TKaBqOe7RbMrlihWARXCEf3C7HOO1d A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556770"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556770"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936886041"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936886041"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:44 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:39 +0000
Message-Id: <20231109154457.7-26-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 25/43] drm/xe/uapi: More uAPI documentation
 additions and cosmetic updates
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

No functional change in this patch.

Let's ensure all of our structs are documented and with a certain
standard. Also, let's have an overview and list of IOCTLs as the
very beginning of the generated HTML doc.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/uapi/drm/xe_drm.h | 134 ++++++++++++++++++++++++++++++++++----
 1 file changed, 122 insertions(+), 12 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 50dd9e0aad76..65cbeaeacedb 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -26,6 +26,29 @@ extern "C" {
  *
  */
 
+/**
+ * DOC: Xe uAPI Overview
+ *
+ * This section aims to describe the Xe's IOCTL entries, its structs, and other
+ * Xe related uAPI such as uevents and PMU (Platform Monitoring Unit) related
+ * entries and usage.
+ *
+ * List of supported IOCTLs:
+ *  - &DRM_IOCTL_XE_DEVICE_QUERY
+ *  - &DRM_IOCTL_XE_GEM_CREATE
+ *  - &DRM_IOCTL_XE_GEM_MMAP_OFFSET
+ *  - &DRM_IOCTL_XE_VM_CREATE
+ *  - &DRM_IOCTL_XE_VM_DESTROY
+ *  - &DRM_IOCTL_XE_VM_BIND
+ *  - &DRM_IOCTL_XE_EXEC
+ *  - &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
+ *  - &DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
+ *  - &DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
+ *  - &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
+ *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
+ *
+ */
+
 /*
  * xe specific ioctls.
  *
@@ -61,7 +84,10 @@ extern "C" {
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 
 /**
- * struct xe_user_extension - Base class for defining a chain of extensions
+ * DOC: Xe IOCT Extensions
+ *
+ * Before detailing the IOCTLs and its structs, it is important to highlight
+ * that every IOCTL in Xe is extensible.
  *
  * Many interfaces need to grow over time. In most cases we can simply
  * extend the struct and have userspace pass in more data. Another option,
@@ -95,7 +121,10 @@ extern "C" {
  * Typically the struct xe_user_extension would be embedded in some uAPI
  * struct, and in this case we would feed it the head of the chain(i.e ext1),
  * which would then apply all of the above extensions.
- *
+*/
+
+/**
+ * struct xe_user_extension - Base class for defining a chain of extensions
  */
 struct xe_user_extension {
 	/**
@@ -124,7 +153,12 @@ struct xe_user_extension {
 	__u32 pad;
 };
 
-/** struct drm_xe_ext_set_property - XE set property extension */
+/**
+ * struct drm_xe_ext_set_property - Generic set property extension
+ *
+ * A generic struct that could allow any of the Xe's IOCLT to be extended
+ * with a set_property operation.
+ */
 struct drm_xe_ext_set_property {
 	/** @base: base user extension */
 	struct xe_user_extension base;
@@ -287,7 +321,7 @@ struct drm_xe_query_mem_region {
 	 * here will always be zero).
 	 */
 	__u64 cpu_visible_used;
-	/** @reserved: MBZ */
+	/** @reserved: Reserved */
 	__u64 reserved[6];
 };
 
@@ -360,7 +394,6 @@ struct drm_xe_query_config {
  * existing GT individual descriptions.
  * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
  * implementing graphics and/or media operations.
- *
  */
 struct drm_xe_query_gt {
 #define DRM_XE_QUERY_GT_TYPE_MAIN		0
@@ -548,7 +581,8 @@ struct drm_xe_query_uc_fw_version {
 };
 
 /**
- * struct drm_xe_device_query - main structure to query device information
+ * struct drm_xe_device_query - Input of &DRM_IOCLT_XE_DEVICE_QUERY - The
+ * main structure to query device information
  *
  * The user selects the type of data to query among DRM_XE_DEVICE_QUERY_*
  * and sets the value in the query member. This determines the type of
@@ -627,7 +661,8 @@ struct drm_xe_device_query {
 };
 
 /**
- * struct drm_xe_gem_create - structure for gem creation
+ * struct drm_xe_gem_create - Input of &DRM_IOCLT_XE_GEM_CREATE - A structure for
+ * gem creation
  *
  * The @flags can be:
  *  - %DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING
@@ -692,6 +727,9 @@ struct drm_xe_gem_create {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_gem_mmap_offset - Input of &DRM_IOCTL_XE_GEM_MMAP_OFFSET
+ */
 struct drm_xe_gem_mmap_offset {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -709,6 +747,9 @@ struct drm_xe_gem_mmap_offset {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_vm_create - Input of &DRM_IOCTL_XE_VM_CREATE
+ */
 struct drm_xe_vm_create {
 #define DRM_XE_VM_EXTENSION_SET_PROPERTY	0
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -728,6 +769,9 @@ struct drm_xe_vm_create {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_vm_destroy - Input of &DRM_IOCTL_XE_VM_DESTROY
+ */
 struct drm_xe_vm_destroy {
 	/** @vm_id: VM ID */
 	__u32 vm_id;
@@ -822,6 +866,9 @@ struct drm_xe_vm_bind_op {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_vm_bind - Input of &DRM_IOCTL_XE_VM_BIND
+ */
 struct drm_xe_vm_bind {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -880,6 +927,19 @@ struct drm_xe_vm_bind {
 /* Monitor 64MB contiguous region with 2M sub-granularity */
 #define XE_ACC_GRANULARITY_64M 3
 
+/**
+ * struct drm_xe_sync - Main structure for sync objects and user fences
+ *
+ * This can be used with both @drm_xe_exec or with @drm_xe_vm_bind
+ *
+ * The @flags can be:
+ *  - %DRM_XE_SYNC_FLAG_SYNCOBJ
+ *  - %DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ
+ *  - %DRM_XE_SYNC_FLAG_DMA_BUF
+ *  - %DRM_XE_SYNC_FLAG_USER_FENCE
+ *  - %DRM_XE_SYNC_FLAG_SIGNAL
+ *
+ */
 struct drm_xe_sync {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -889,17 +949,19 @@ struct drm_xe_sync {
 #define DRM_XE_SYNC_FLAG_DMA_BUF		0x2
 #define DRM_XE_SYNC_FLAG_USER_FENCE		0x3
 #define DRM_XE_SYNC_FLAG_SIGNAL		0x10
+	/** @flags: Sync Flags */
 	__u32 flags;
 
 	/** @pad: MBZ */
 	__u32 pad;
 
 	union {
+		/** @handle: Handle to the sync object */
 		__u32 handle;
 
 		/**
-		 * @addr: Address of user fence. When sync passed in via exec
-		 * IOCTL this a GPU address in the VM. When sync passed in via
+		 * @addr: Address of user fence. When sync is passed in via exec
+		 * IOCTL this is a GPU address in the VM. When sync passed in via
 		 * VM bind IOCTL this is a user pointer. In either case, it is
 		 * the users responsibility that this address is present and
 		 * mapped when the user fence is signalled. Must be qword
@@ -908,12 +970,19 @@ struct drm_xe_sync {
 		__u64 addr;
 	};
 
+	/**
+	 * @timeline_value: Input for the timeline sync object. Needs to be
+	 * different than 0 when used with %DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ.
+	 */
 	__u64 timeline_value;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_exec - Input of &DRM_IOCTL_XE_EXEC
+ */
 struct drm_xe_exec {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -946,6 +1015,9 @@ struct drm_xe_exec {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
+ */
 struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -979,6 +1051,9 @@ struct drm_xe_exec_queue_create {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_exec_queue_destroy - Input of &DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
+ */
 struct drm_xe_exec_queue_destroy {
 	/** @exec_queue_id: Exec queue ID */
 	__u32 exec_queue_id;
@@ -991,9 +1066,18 @@ struct drm_xe_exec_queue_destroy {
 };
 
 /**
- * struct drm_xe_exec_queue_set_property - exec queue set property
+ * struct drm_xe_exec_queue_set_property - Input of &DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
+ *
+ * The @property can be:
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY
  *
- * Same namespace for extensions as drm_xe_exec_queue_create
  */
 struct drm_xe_exec_queue_set_property {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -1020,6 +1104,13 @@ struct drm_xe_exec_queue_set_property {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_exec_queue_get_property - Input of &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
+ *
+ * The @property can be:
+ *  - %DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN
+ *
+ */
 struct drm_xe_exec_queue_get_property {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -1039,7 +1130,7 @@ struct drm_xe_exec_queue_get_property {
 };
 
 /**
- * struct drm_xe_wait_user_fence - wait user fence
+ * struct drm_xe_wait_user_fence - Input of &DRM_IOCTL_XE_WAIT_USER_FENCE
  *
  * Wait on user fence, XE will wake-up on every HW engine interrupt in the
  * instances list and check if user fence is complete::
@@ -1047,6 +1138,25 @@ struct drm_xe_exec_queue_get_property {
  *	(*addr & MASK) OP (VALUE & MASK)
  *
  * Returns to user on user fence completion or timeout.
+ *
+ * The wait @op can be:
+ *  - %DRM_XE_UFENCE_WAIT_EQ
+ *  - %DRM_XE_UFENCE_WAIT_NEQ
+ *  - %DRM_XE_UFENCE_WAIT_GT
+ *  - %DRM_XE_UFENCE_WAIT_GTE
+ *  - %DRM_XE_UFENCE_WAIT_LT
+ *  - %DRM_XE_UFENCE_WAIT_LTE
+ *
+ * The wait @flags can be:
+ *  - %DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP
+ *  - %DRM_XE_UFENCE_WAIT_FLAG_ABSTIME
+ *
+ * The wait @mask can be:
+ *  - %DRM_XE_UFENCE_WAIT_U8
+ *  - %DRM_XE_UFENCE_WAIT_U16
+ *  - %DRM_XE_UFENCE_WAIT_U32
+ *  - %DRM_XE_UFENCE_WAIT_U64
+ *
  */
 struct drm_xe_wait_user_fence {
 	/** @extensions: Pointer to the first extension struct, if any */
-- 
2.34.1

