Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04607D3C526
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 04:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD5710E659;
	Wed, 10 Dec 2025 04:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MakabxXv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0657610E659
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 04:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765341136; x=1796877136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QP8RSsq0dVcxFxoU9UFkDYo3/pnoVDfEzq+w87zBYQI=;
 b=MakabxXvMlNdUpIvMKmIcsB+pwF8QMCX8spEInB4TgKmNGv6crqeRIlb
 uyAOwvg4MUqGGPDpHOIH4t90mSwrK9y6wAsH7Dc5VEhPG551rkW4KrAnm
 6S5+zW1ckXHSDFipq9Yydj3FHm/+q0SnPm9LIO19PhvJm9GvDdTMCO3a/
 2VODk8HqdOv9UtSQqBxZWuFJt1Qy5oKBMacpFus4vcLt0B2GrSrRU/cIj
 Xm1X75sypAlON7tdSkarg5XnJu682QrWSGyP7ULMjHg6WMd43BI9JCYez
 /xfRNpDoirV1BGHWp8bVA8JqvcKuBn4+XP2hc1UEgLWhwy4Qq5K1jFOw3 Q==;
X-CSE-ConnectionGUID: Vf+G8ESgTHuoR1CTFjAnWw==
X-CSE-MsgGUID: NVpZnLKvR2yTFrPy3OWQEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78000055"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="78000055"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 20:32:16 -0800
X-CSE-ConnectionGUID: IFfwiTBtRwej8JIIMrshgQ==
X-CSE-MsgGUID: 88EXBEZ9SQWjups4AAxBAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196466557"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 20:32:14 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [RFC v3 1/8] drm/xe/uapi: Add UAPI support for purgeable buffer
 objects
Date: Wed, 10 Dec 2025 10:00:45 +0530
Message-ID: <20251210043112.3267620-2-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210043112.3267620-1-arvind.yadav@intel.com>
References: <20251210043112.3267620-1-arvind.yadav@intel.com>
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

v2:
  - Add PURGED state for read-only status, change ioctl to DRM_IOWR,
    add retained field for i915 compatibility

v3:
  - UAPI rule should not be changed (Matthew Brost)
  - Make 'retained' a userptr (Matthew Brost)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 include/uapi/drm/xe_drm.h | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 876a076fa6c0..fc0dada62dd0 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -2079,6 +2079,7 @@ struct drm_xe_madvise {
 #define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
 #define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
 #define DRM_XE_MEM_RANGE_ATTR_PAT		2
+#define DRM_XE_VMA_ATTR_PURGEABLE_STATE		3
 	/** @type: type of attribute */
 	__u32 type;
 
@@ -2157,6 +2158,44 @@ struct drm_xe_madvise {
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
+			 * Userspace provides a pointer to u32. Kernel writes to it:
+			 * 1 if backing store exists, 0 if purged.
+			 * Similar to i915's drm_i915_gem_madvise.retained field.
+			 */
+			__u64 retained;
+			/** @purge_state_val.reserved: Reserved */
+			__u64 reserved;
+		} purge_state_val;
 	};
 
 	/** @reserved: Reserved */
-- 
2.43.0

