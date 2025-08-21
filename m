Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13177CA0EFC
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 17:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC30F10E38C;
	Thu, 21 Aug 2025 17:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MUEwDMkk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCCB10E38A
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 17:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755795833; x=1787331833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ofYHoLG0SODIkL9dID5oBl81j4mbEJu4L4nCjO9uDNw=;
 b=MUEwDMkkfpSPcpOGIC9f4t5lKXt+DrujREfjrblcwAbhgLDxAt5m7z6z
 Ad0enEGU8G86Aw5+Y0LtvRauTJKpJWYGNJkc5jnp4+hgltY5veZtkYrOS
 FQmtcWzXxz8DoqM5hC3/wENkmowyphTxaRqz8v3idZ3Jg3Mnr1vf6O/en
 boYtszASyB9iKGTfRm/xi4H+xCKLvekTWLtxW3QxQc4pOIa9uKhm8zJD9
 V7QdT3DgvPGdlNGgdYk+pVxRJ+mRpL4lgAwiDpoYWx8Ks+J7OYPsvj73A
 88TOcUPH8s8Jy2UPOyLjNoaA4RM5vtHuN7aG9ype98JUzfFhpCBeImax7 g==;
X-CSE-ConnectionGUID: HdNmsbtuSOGrpTZB0reZtg==
X-CSE-MsgGUID: F9lBormzRAKmkoWOGhIprw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57805821"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="57805821"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 10:03:47 -0700
X-CSE-ConnectionGUID: 5YVI1FmjQ++2ocaLfVJJOg==
X-CSE-MsgGUID: gdr9iZ/BQqKJlvAemGMhNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="192143662"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 21 Aug 2025 10:03:46 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v9 01/20] drm/xe/uapi: Add madvise interface
Date: Thu, 21 Aug 2025 23:00:45 +0530
Message-Id: <20250821173104.3030148-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250821173104.3030148-1-himal.prasad.ghimiray@intel.com>
References: <20250821173104.3030148-1-himal.prasad.ghimiray@intel.com>
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

v3 (Matthew/Thomas)
- Reorder attributes
- use __u16 for migration_policy
- use __u64 for reserved in unions
- Avoid usage of vma

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 130 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index c721e130c1d2..4e6e9a9164ee 100644
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
@@ -1978,6 +1981,133 @@ struct drm_xe_query_eu_stall {
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
+ * - DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC: Set preferred memory location.
+ * - DRM_XE_MEM_RANGE_ATTR_ATOMIC: Set atomic access policy.
+ * - DRM_XE_MEM_RANGE_ATTR_PAT: Set page attribute table index.
+ *
+ * Example:
+ *
+ * .. code-block:: C
+ *
+ * struct drm_xe_madvise madvise = {
+ *          .vm_id = vm_id,
+ *          .start = 0x100000,
+ *          .range = 0x2000,
+ *          .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
+ *          .atomic_val = DRM_XE_ATOMIC_DEVICE,
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
+	/** @range: size of the virtual address range */
+	__u64 range;
+
+	/** @vm_id: vm_id of the virtual range */
+	__u32 vm_id;
+
+#define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
+#define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
+#define DRM_XE_MEM_RANGE_ATTR_PAT		2
+	/** @type: type of attribute */
+	__u32 type;
+
+	union {
+		/**
+		 * @preferred_mem_loc: preferred memory location
+		 *
+		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC
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
+			__u16 migration_policy;
+
+			/** @preferred_mem_loc.pad : MBZ */
+			__u16 pad;
+
+			/** @preferred_mem_loc.reserved : Reserved */
+			__u64 reserved;
+		} preferred_mem_loc;
+
+		/**
+		 * @atomic: Atomic access policy
+		 *
+		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_ATOMIC.
+		 *
+		 * Supported values for @atomic.val:
+		 * - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour
+		 *   Support both GPU and CPU atomic operations for system allocator
+		 *   Support GPU atomic operations for normal(bo) allocator
+		 * - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations
+		 * - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic operations
+		 * - DRM_XE_ATOMIC_CPU: Support CPU atomic
+		 */
+		struct {
+#define DRM_XE_ATOMIC_UNDEFINED	0
+#define DRM_XE_ATOMIC_DEVICE	1
+#define DRM_XE_ATOMIC_GLOBAL	2
+#define DRM_XE_ATOMIC_CPU	3
+			/** @atomic.val: value of atomic operation */
+			__u32 val;
+
+			/** @atomic.pad: MBZ */
+			__u32 pad;
+
+			/** @atomic.reserved: Reserved */
+			__u64 reserved;
+		} atomic;
+
+		/**
+		 * @pat_index: Page attribute table index
+		 *
+		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_PAT.
+		 */
+		struct {
+			/** @pat_index.val: PAT index value */
+			__u32 val;
+
+			/** @pat_index.pad: MBZ */
+			__u32 pad;
+
+			/** @pat_index.reserved: Reserved */
+			__u64 reserved;
+		} pat_index;
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

