Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A97E9E31F
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 15:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E816C10E61E;
	Wed, 11 Feb 2026 15:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8kkMhq1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5300B10E616
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 15:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770823625; x=1802359625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ih6L50NDSNPOe+ZOXINi0+GyXL5RsmD4yKclZiqQpfA=;
 b=J8kkMhq1EibZqvyQM5l2MSnEd3QJfGxeyKPGNpkhKn/PEfu7eNu/ajmy
 /yO+CzNCGlpDN4MHx2W2dO3fp1drqK4k79d/Pn5b4wCmXdXPlf141BRhc
 zhmJwOO4xlQciTWy7R8GsJVB1azx9mybYiwOnFr9hLqVqL7rP+pCwgS27
 iny+uyoKKdAWMtjtBjm+lk87jkQNbRqJoB4iH77Kmh3HweJceh+9d1HrL
 BaWo4S6kQprtPUd1R6xLcu0EmdhsQORIgecWOoWLC5qWjBcpoarlxjfY8
 D6TAbUYGCqCw2n55f76EYjOTDnbYbtRwdt73To8GWFbeular7Yijy2sIF Q==;
X-CSE-ConnectionGUID: JH8IDhzgTBy1dyeA+EO3JQ==
X-CSE-MsgGUID: ftC+FGrKS9eMbF7kI0dpWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89564281"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="89564281"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 07:27:00 -0800
X-CSE-ConnectionGUID: S72xYJbgQ4adFn09IPswPQ==
X-CSE-MsgGUID: 7abFAARZTnC5iWkyNmSUpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211388104"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 07:26:59 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [PATCH v5 1/9] drm/xe/uapi: Add UAPI support for purgeable buffer
 objects
Date: Wed, 11 Feb 2026 20:56:30 +0530
Message-ID: <20260211152644.1661165-2-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211152644.1661165-1-arvind.yadav@intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
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

The implementation includes a 'retained' output field (matching i915's
drm_i915_gem_madvise.retained) that indicates whether the BO's backing
store still exists (1) or has been purged (0).

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

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 include/uapi/drm/xe_drm.h | 44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 077e66a682e2..3e2f145e7f8f 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -2099,6 +2099,7 @@ struct drm_xe_madvise {
 #define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
 #define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
 #define DRM_XE_MEM_RANGE_ATTR_PAT		2
+#define DRM_XE_VMA_ATTR_PURGEABLE_STATE		3
 	/** @type: type of attribute */
 	__u32 type;
 
@@ -2189,6 +2190,49 @@ struct drm_xe_madvise {
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
+		 * Supported values for @purge_state_val.val:
+		 *  - DRM_XE_VMA_PURGEABLE_STATE_WILLNEED (0): Marks BO as needed.
+		 *    If BO was purged, returns retained=0 (backing store lost).
+		 *
+		 *  - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): Hints that BO is not
+		 *    currently needed. Kernel may purge it under memory pressure.
+		 *    Only applies to non-shared BOs. Returns retained=1 if not purged.
+		 */
+		struct {
+#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
+#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
+			/** @purge_state_val.val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
+			__u32 val;
+
+			/* @purge_state_val.pad */
+			__u32 pad;
+			/**
+			 * @purge_state_val.retained: Pointer to output field for backing
+			 * store status.
+			 *
+			 * Userspace must initialize this field to 0 before the
+			 * ioctl. Kernel writes to it after the operation:
+			 * - 1 if backing store exists (not purged)
+			 * - 0 if backing store was purged
+			 *
+			 * If userspace fails to initialize to 0, ioctl returns -EINVAL.
+			 * This ensures a safe default (0 = assume purged) if kernel
+			 * cannot write the result.
+			 *
+			 * Similar to i915's drm_i915_gem_madvise.retained field.
+			 */
+			__u64 retained;
+		} purge_state_val;
 	};
 
 	/** @reserved: Reserved */
-- 
2.43.0

