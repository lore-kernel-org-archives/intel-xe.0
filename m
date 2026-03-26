Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AB710A62CB
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 13:09:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2561C10E1DE;
	Thu, 26 Mar 2026 13:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gmDpKZS2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E186C10E1DE
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 13:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774530539; x=1806066539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vCoBPbhjDTUFq+i1wj1B+MLUlqJ4300HxXrF5dzlG9Y=;
 b=gmDpKZS2otzxMjJeKFDZw1qBuoy2d1adZmhfDuvLDzb/r1Z4eIjTY7OL
 e8K6SSaifhpEczH2BwQNazM5O22NrsueaJgptQAn3cPKSRA6bPkvYaWMm
 XjjTWkoAB0ncKex+Zcm5tAvDnnxwDA6LOMA8tAp+eoeIQkK8w7LgoL6Sv
 eHS7Hocnbk53DcYKy2Yy4Fg8wwCeRawe6h36S13prNZzCpyr5Twqv1i+t
 NGqzXBtn4jzQEoX8yixUJG+q63mIOhgg8jHAuLt7hamDuh5Zkp2HFglQI
 CwTWsoiKskj2iljTBWFQFDvi/8zkoywX2Z6VKPDTp2/yZiv2pI77NlE/y g==;
X-CSE-ConnectionGUID: F/n3DJspTh67NFoKMb2SyA==
X-CSE-MsgGUID: RrHkwNE3T5q0Q7QhG2Knzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75784764"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75784764"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 06:08:59 -0700
X-CSE-ConnectionGUID: 0VHAuCjKScyNZk3HGBjqnA==
X-CSE-MsgGUID: Iif4L+D3TLaX8iqxikvytA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="224070485"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 06:08:57 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v9 01/12] drm/xe/uapi: Add UAPI support for purgeable buffer
 objects
Date: Thu, 26 Mar 2026 18:38:27 +0530
Message-ID: <20260326130843.3545241-2-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326130843.3545241-1-arvind.yadav@intel.com>
References: <20260326130843.3545241-1-arvind.yadav@intel.com>
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

From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Extend the DRM_XE_MADVISE ioctl to support purgeable buffer object
management by adding DRM_XE_VMA_ATTR_PURGEABLE_STATE attribute type.

This allows userspace applications to provide memory usage hints to
the kernel for better memory management under pressure:

- WILLNEED: Buffer is needed and should not be purged. If the BO was
  previously purged, retained field returns 0 indicating backing store
  was lost (once purged, always purged semantics matching i915).

- DONTNEED: Buffer is not currently needed and may be purged by the
  kernel under memory pressure to free resources. Only applies to
  non-shared BOs.

  To prevent undefined behavior, the following operations are blocked
  while a BO is in DONTNEED state:
  - New mmap() operations return -EBUSY
  - VM_BIND operations return -EBUSY
  - New dma-buf exports return -EBUSY
  - CPU page faults return SIGBUS
  - GPU page faults fail with -EACCES

  This ensures applications cannot use a BO while marked as DONTNEED,
  preventing erratic behavior when the kernel purges the backing store.

The implementation includes a 'retained' output field (matching i915's
drm_i915_gem_madvise.retained) that indicates whether the BO's backing
store still exists (1) or has been purged (0).

Added DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT flag to allow
userspace to detect kernel support for purgeable buffer objects
before attempting to use the feature.

v2:
  - Add PURGED state for read-only status, change ioctl to DRM_IOWR,
    add retained field for i915 compatibility

v3:
  - UAPI rule should not be changed (Matthew Brost)
  - Make 'retained' a userptr (Matthew Brost)

v4:
  - You cannot make this part of the union (purge_state_val) larger
    than the existing union (16 bytes). So just drop the '__u64 reserved'
    field. (Matt)

v5:
  - Update UAPI documentation to clarify retained must be initialized
    to 0(Thomas)

v6:
  - Document DONTNEED BO access blocking behavior to prevent undefined
    behavior and clarify uAPI contract (Thomas, Matt)
  - Add query flag DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT for
    feature detection. (Jose)
  - Rename retained to retained_ptr. (Jose)

v7:
  - Updated UAPI documentation as suggested to reflect 'updated' value
    instead of 'return'. (Jose)

Cc: Matthew Brost <matthew.brost@intel.com>
Acked-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 include/uapi/drm/xe_drm.h | 69 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 6c99514a85e1..ae2fda23ce7c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -432,6 +432,7 @@ struct drm_xe_query_config {
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX	(1 << 4)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT    (1 << 5)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
@@ -2171,6 +2172,7 @@ struct drm_xe_query_eu_stall {
  *  - DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC: Set preferred memory location.
  *  - DRM_XE_MEM_RANGE_ATTR_ATOMIC: Set atomic access policy.
  *  - DRM_XE_MEM_RANGE_ATTR_PAT: Set page attribute table index.
+ *  - DRM_XE_VMA_ATTR_PURGEABLE_STATE: Set purgeable state for BOs.
  *
  * Example:
  *
@@ -2203,6 +2205,7 @@ struct drm_xe_madvise {
 #define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
 #define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
 #define DRM_XE_MEM_RANGE_ATTR_PAT		2
+#define DRM_XE_VMA_ATTR_PURGEABLE_STATE		3
 	/** @type: type of attribute */
 	__u32 type;
 
@@ -2293,6 +2296,72 @@ struct drm_xe_madvise {
 			/** @pat_index.reserved: Reserved */
 			__u64 reserved;
 		} pat_index;
+
+		/**
+		 * @purge_state_val: Purgeable state configuration
+		 *
+		 * Used when @type == DRM_XE_VMA_ATTR_PURGEABLE_STATE.
+		 *
+		 * Configures the purgeable state of buffer objects in the specified
+		 * virtual address range. This allows applications to hint to the kernel
+		 * about bo's usage patterns for better memory management.
+		 *
+		 * By default all VMAs are in WILLNEED state.
+		 *
+		 * Supported values for @purge_state_val.val:
+		 *  - DRM_XE_VMA_PURGEABLE_STATE_WILLNEED (0): Marks BO as needed.
+		 *    If the BO was previously purged, the kernel sets the __u32 at
+		 *    @retained_ptr to 0 (backing store lost) so the application knows
+		 *    it must recreate the BO.
+		 *
+		 *  - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): Marks BO as not currently
+		 *    needed. Kernel may purge it under memory pressure to reclaim memory.
+		 *    Only applies to non-shared BOs. The kernel sets the __u32 at
+		 *    @retained_ptr to 1 if the backing store still exists (not yet purged),
+		 *    or 0 if it was already purged.
+		 *
+		 *    Important: Once marked as DONTNEED, touching the BO's memory
+		 *    is undefined behavior. It may succeed temporarily (before the
+		 *    kernel purges the backing store) but will suddenly fail once
+		 *    the BO transitions to PURGED state.
+		 *
+		 *    To transition back: use WILLNEED and check @retained_ptr —
+		 *    if 0, backing store was lost and the BO must be recreated.
+		 *
+		 *    The following operations are blocked in DONTNEED state to
+		 *    prevent the BO from being re-mapped after madvise:
+		 *    - New mmap() calls: Fail with -EBUSY
+		 *    - VM_BIND operations: Fail with -EBUSY
+		 *    - New dma-buf exports: Fail with -EBUSY
+		 *    - CPU page faults (existing mmap): Fail with SIGBUS
+		 *    - GPU page faults (fault-mode VMs): Fail with -EACCES
+		 */
+		struct {
+#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
+#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
+			/** @purge_state_val.val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
+			__u32 val;
+
+			/** @purge_state_val.pad: MBZ */
+			__u32 pad;
+			/**
+			 * @purge_state_val.retained_ptr: Pointer to a __u32 output
+			 * field for backing store status.
+			 *
+			 * Userspace must initialize the __u32 value at this address
+			 * to 0 before the ioctl. Kernel writes a __u32 after the
+			 * operation:
+			 * - 1 if backing store exists (not purged)
+			 * - 0 if backing store was purged
+			 *
+			 * If userspace fails to initialize to 0, ioctl returns -EINVAL.
+			 * This ensures a safe default (0 = assume purged) if kernel
+			 * cannot write the result.
+			 *
+			 * Similar to i915's drm_i915_gem_madvise.retained field.
+			 */
+			__u64 retained_ptr;
+		} purge_state_val;
 	};
 
 	/** @reserved: Reserved */
-- 
2.43.0

