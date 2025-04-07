Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03870C3601E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66CA10E3F9;
	Mon,  7 Apr 2025 09:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lhg/u7U/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE84B10E402
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019595; x=1775555595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mSBRk+KyDoJCPZi8hniL/8mb7yvJFUvor8pn9FobXYg=;
 b=Lhg/u7U/rdEQLO0nuNt4k7SVJrH+ANVHGfrT7o1573U4pzBCW9zXUT/V
 7jKZpITq17JgopFh+tStJCzPKaBCoQxGfQM2v584f5nx0lGZtTeA8nomG
 T9Zx6l0siAdg/ZhqwKpcZhQx+YOXHwpVKyqPuWEKG96L1FHzYwsHS/RNW
 UabsHafDgoKepDjoeI8ggZPts8osaB93gGWoaBSX71nWUmemBFAKA2yXj
 tmV9PLwOh3FsKnJSyLvJeBKhErOlhBnKIi8p+Y2eoq6uCtNur5L1E1V3O
 Ulj0gAeucHIN2r6GZCSqRHX0bDzQYre0V2jxArwh8shqK5jwRKTa9i8EE w==;
X-CSE-ConnectionGUID: 96x8cgNSTV2+HFwGb7I/gg==
X-CSE-MsgGUID: eg8HH9pKRZOxYeFMMYdX/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029428"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029428"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:53:14 -0700
X-CSE-ConnectionGUID: MDhY8aLsT0y9LCqxAm65qA==
X-CSE-MsgGUID: +gFrv+NbSW6/m9DcY8u+BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778785"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:53:13 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 17/32] drm/xe/uapi: Add madvise interface
Date: Mon,  7 Apr 2025 15:47:04 +0530
Message-Id: <20250407101719.3350996-18-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This commit introduces a new madvise interface to support
driver-specific ioctl operations. The madvise interface allows for more
efficient memory management by providing hints to the driver about the
expected memory usage and pte update policy for gpuvma.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 include/uapi/drm/xe_drm.h | 97 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 9c08738c3b91..aaf515df3a83 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -81,6 +81,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_EXEC
  *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
  *  - &DRM_IOCTL_XE_OBSERVATION
+ *  - &DRM_IOCTL_XE_MADVISE
  */
 
 /*
@@ -102,6 +103,7 @@ extern "C" {
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
 #define DRM_XE_OBSERVATION		0x0b
+#define DRM_XE_MADVISE			0x0c
 
 /* Must be kept compact -- no holes */
 
@@ -117,6 +119,7 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
+#define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1965,6 +1968,100 @@ struct drm_xe_query_eu_stall {
 	__u64 sampling_rates[];
 };
 
+struct drm_xe_madvise_ops {
+	/** @start: start of the virtual address range */
+	__u64 start;
+
+	/** @size: size of the virtual address range */
+	__u64 range;
+
+#define DRM_XE_VMA_ATTR_PREFERRED_LOC	0
+#define DRM_XE_VMA_ATTR_ATOMIC		1
+#define DRM_XE_VMA_ATTR_PAT		2
+#define DRM_XE_VMA_ATTR_PURGEABLE_STATE	3
+	/** @type: type of attribute */
+	__u32 type;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	union {
+		struct {
+#define DRM_XE_VMA_ATOMIC_UNDEFINED	0
+#define DRM_XE_VMA_ATOMIC_DEVICE	1
+#define DRM_XE_VMA_ATOMIC_GLOBAL	2
+#define DRM_XE_VMA_ATOMIC_CPU		3
+		/** @val: value of atomic operation*/
+			__u32 val;
+
+		/** @reserved: Reserved */
+			__u32 reserved;
+		} atomic;
+
+		struct {
+#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
+#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
+#define DRM_XE_VMA_PURGEABLE_STATE_PURGED	2
+		/** @val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
+			__u32 val;
+
+		/** @reserved: Reserved */
+			__u32 reserved;
+		} purge_state_val;
+
+		struct {
+			/** @pat_index */
+			__u32 val;
+
+			/** @reserved: Reserved */
+			__u32 reserved;
+		} pat_index;
+
+		/** @preferred_mem_loc: preferred memory location */
+		struct {
+			__u32 devmem_fd;
+
+#define MIGRATE_ALL_PAGES 0
+#define MIGRATE_ONLY_SYSTEM_PAGES 1
+			__u32 migration_policy;
+		} preferred_mem_loc;
+	};
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+/**
+ * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
+ *
+ * Set memory attributes to a virtual address range
+ */
+struct drm_xe_madvise {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: vm_id of the virtual range */
+	__u32 vm_id;
+
+	/** @num_ops: number of madvises in ioctl */
+	__u32 num_ops;
+
+	union {
+		/** @ops: used if num_ops == 1 */
+		struct drm_xe_madvise_ops ops;
+
+		/**
+		 * @vector_of_ops: userptr to array of struct
+		 * drm_xe_vm_madvise_op if num_ops > 1
+		 */
+		__u64 vector_of_ops;
+	};
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

