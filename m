Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A38DD111A8
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 05:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D89A10E2A3;
	Mon,  1 Dec 2025 05:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M1M/Ts7o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBB610E116
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 05:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764568427; x=1796104427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TZ2CPBYfmQti/SmOFLeDEUZJpJ3gnaETLlX/6lz+2Is=;
 b=M1M/Ts7ourWqZfCEbB8HCMJO6eP+g7wNwKDMgtCEspKsnAXfXbQEoVwH
 tUvpUTxvuM/jI3jXwmdOC412J0iVJBHLU1iwQ+zvqbqECft4NDxCiJCuy
 BcI+7r1WN9mcfY0ZysdD2gjKK9Vq5KmmdqneFt1cHyreWrzxablBKDNpa
 asdSgm2IYTywNnJUuU/NJA381MhkOUA+6g2WetjwajI6cz+w9MLw9Rnms
 qBZcuTaTH+eKA6srg93Fs77LS3t0TkB0zvs4QCkSdmS+dQLBnp7y2DTPf
 Hfmxzcen8RR3sp7wzQkrNrWd/RTgVr+C4b716YP1X4qiLRUtcAczC812G g==;
X-CSE-ConnectionGUID: cu2Dvk8ZQOilc4NHNcBxew==
X-CSE-MsgGUID: 0eyFsXocSK+vT1T3wYbyvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66457379"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66457379"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 21:53:47 -0800
X-CSE-ConnectionGUID: +lBd7nF4SZ6zDDrGky6oZw==
X-CSE-MsgGUID: vMVDI1VmR0OKtE8qVCvCDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="224950817"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 21:53:45 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [RFC v2 1/9] drm/xe/uapi: Add UAPI support for purgeable buffer
 objects
Date: Mon,  1 Dec 2025 11:20:11 +0530
Message-ID: <20251201055309.854074-2-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201055309.854074-1-arvind.yadav@intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
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

v2: Add PURGED state for read-only status, change ioctl to DRM_IOWR,
    add retained field for i915 compatibility

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 include/uapi/drm/xe_drm.h | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 47853659a705..02d63938d16f 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -121,7 +121,7 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
-#define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
+#define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
 #define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
 
 /**
@@ -2051,6 +2051,7 @@ struct drm_xe_madvise {
 #define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
 #define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
 #define DRM_XE_MEM_RANGE_ATTR_PAT		2
+#define DRM_XE_VMA_ATTR_PURGEABLE_STATE		3
 	/** @type: type of attribute */
 	__u32 type;
 
@@ -2129,6 +2130,40 @@ struct drm_xe_madvise {
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
+			/**
+			 * @purge_state_val.retained: Whether the backing store still exists.
+			 *
+			 * Output field indicating if the BO's backing store is retained.
+			 * Set to 1 if backing store exists, 0 if it has been purged.
+			 * Similar to i915's drm_i915_gem_madvise.retained field.
+			 */
+			__u32 retained;
+			/** @purge_state_val.reserved: Reserved */
+			__u64 reserved;
+		} purge_state_val;
 	};
 
 	/** @reserved: Reserved */
-- 
2.43.0

