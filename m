Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B10C71135
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 12:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A9710E210;
	Fri, 13 Jun 2025 12:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHY9On/z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A8710E210
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 12:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749817802; x=1781353802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K2VEdKtYJuyvlIYTqXKL8zmzsXa0cz0JXIeVM5nlLcE=;
 b=dHY9On/z9c22OshMGC5wdPl6su+/dkdOHgs+VSnw0HzHTdwfN6iRkZTQ
 HNPWfwaS8R1BfTmvW7fwFO+jG8Fz6GiWQ2PGeF8vT7WS/FQcKRdfKsjwu
 rYCLzEpzNs4TS45tIJSA8YEYVwU6sozF7vLK5hCfdPIhBBIQ2e2rb5pe7
 5404xPvEa5a89xaFeNpAcLkrk0lPSdhQPGkKXfTJyk2XJb3OYhenfECP0
 jNUDHpvgUc1AuFWBV+PDxDGTtFPAxmQAKJzCrZ0Tw2eb59kFAwynUv6GK
 7pnLs8RECbvLZtPkST9PimYOUfaWbaTRsrVMStuU4Pc3nFQ8FsQZYG51i A==;
X-CSE-ConnectionGUID: UNUplby5TjqU5RLvZ1yvwQ==
X-CSE-MsgGUID: Cf/HWW9zRGumH1DY+ThrDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69610144"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69610144"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 05:30:02 -0700
X-CSE-ConnectionGUID: ucxRKbc8SOuXagj9ZlcfSA==
X-CSE-MsgGUID: y3XsZaIpSOGPa1P1ropxhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="148290263"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jun 2025 05:30:00 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v4 02/20] drm/xe/uapi: Add madvise interface
Date: Fri, 13 Jun 2025 18:25:40 +0530
Message-Id: <20250613125558.2607665-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v2 (Matthew/Thomas)
- Drop num_ops support
- Drop purgeable support
- Add kernel-docs
- IOWR/IOW

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Acked-by: José Roberto de Souza <jose.souza@intel.com>
---
 include/uapi/drm/xe_drm.h | 118 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 6a702ba7817c..b5f8d11faaa8 100644
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
+#define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1970,6 +1973,121 @@ struct drm_xe_query_eu_stall {
 	__u64 sampling_rates[];
 };
 
+/**
+ * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
+ *
+ * This structure is used to set memory attributes for a virtual address range
+ * in a VM. The type of attribute is specified by @type, and the corresponding
+ * union member is used to provide additional parameters for @type.
+ *
+ * Supported attribute types:
+ * - DRM_XE_VMA_ATTR_PREFERRED_LOC: Set preferred memory location.
+ * - DRM_XE_VMA_ATTR_ATOMIC: Set atomic access policy.
+ * - DRM_XE_VMA_ATTR_PAT: Set page attribute table index.
+ *
+ * Example:
+ *
+ * .. code-block:: C
+ *
+ * struct drm_xe_madvise madvise = {
+ *          .vm_id = vm_id,
+ *          .start = 0x100000,
+ *          .range = 0x2000,
+ *          .type = DRM_XE_VMA_ATTR_ATOMIC,
+ *          .atomic_val = DRM_XE_VMA_ATOMIC_DEVICE,
+ *         };
+ *
+ * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
+ *
+ */
+struct drm_xe_madvise {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @start: start of the virtual address range */
+	__u64 start;
+
+	/** @size: size of the virtual address range */
+	__u64 range;
+
+	/** @vm_id: vm_id of the virtual range */
+	__u32 vm_id;
+
+#define DRM_XE_VMA_ATTR_PREFERRED_LOC	0
+#define DRM_XE_VMA_ATTR_ATOMIC		1
+#define DRM_XE_VMA_ATTR_PAT		2
+	/** @type: type of attribute */
+	__u32 type;
+
+	union {
+		/**
+		 * @atomic: Atomic access policy
+		 *
+		 * Used when @type == DRM_XE_VMA_ATTR_ATOMIC.
+		 *
+		 * Supported values for @atomic.val:
+		 * - DRM_XE_VMA_ATOMIC_UNDEFINED: Undefined or default behaviour
+		 *   Support both GPU and CPU atomic operations for system allocator
+		 *   Support GPU atomic operations for normal(bo) allocator
+		 * - DRM_XE_VMA_ATOMIC_DEVICE: Support GPU atomic operations
+		 * - DRM_XE_VMA_ATOMIC_GLOBAL: Support both GPU and CPU atomic operations
+		 * - DRM_XE_VMA_ATOMIC_CPU: Support CPU atomic
+		 */
+		struct {
+#define DRM_XE_VMA_ATOMIC_UNDEFINED	0
+#define DRM_XE_VMA_ATOMIC_DEVICE	1
+#define DRM_XE_VMA_ATOMIC_GLOBAL	2
+#define DRM_XE_VMA_ATOMIC_CPU		3
+			/** @atomic.val: value of atomic operation */
+			__u32 val;
+
+			/** @atomic.reserved: Reserved */
+			__u32 reserved;
+		} atomic;
+
+		/**
+		 * @pat_index: Page attribute table index
+		 *
+		 * Used when @type == DRM_XE_VMA_ATTR_PAT.
+		 */
+		struct {
+			/** @pat_index.val: PAT index value */
+			__u32 val;
+
+			/** @pat_index.reserved: Reserved */
+			__u32 reserved;
+		} pat_index;
+
+		/**
+		 * @preferred_mem_loc: preferred memory location
+		 *
+		 * Used when @type == DRM_XE_VMA_ATTR_PREFERRED_LOC
+		 *
+		 * Supported values for @preferred_mem_loc.devmem_fd:
+		 * - DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE: set vram of faulting tile as preferred loc
+		 * - DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM: set smem as preferred loc
+		 *
+		 * Supported values for @preferred_mem_loc.migration_policy:
+		 * - DRM_XE_MIGRATE_ALL_PAGES
+		 * - DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES
+		 */
+		struct {
+#define DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE	0
+#define DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM	-1
+			/** @preferred_mem_loc.devmem_fd: fd for preferred loc */
+			__u32 devmem_fd;
+
+#define DRM_XE_MIGRATE_ALL_PAGES		0
+#define DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES	1
+			/** @preferred_mem_loc.migration_policy: Page migration policy */
+			__u32 migration_policy;
+		} preferred_mem_loc;
+	};
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

