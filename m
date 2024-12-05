Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BC0E7716C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 10:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6ED10E3AA;
	Thu,  5 Dec 2024 10:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ROZX2YgF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662D710E3AA
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 10:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733394320; x=1764930320;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/oSt9/hF/5UCl3ns8iGnKQwHEPozwetnm2kiNoSK4XU=;
 b=ROZX2YgFkwYq9T1a7BhMbVUl+HVm4w5AKfURzlVtsKG+taRNCLff1ysI
 E5545RcGVS2qMzusH7LRFczBblQwibCqz8ichnu2OK93OdWVIkir5+hhs
 yvWdnbC29Yd8JfPc6kyGeoIbEE9rCmUbsmPSQdOnOwAjfwPQm87sXRWwq
 nvSX0AVgnHD4KHdQ6XcpNy2Jg5W0bkUUyuknkno/KQLp3H/3ZagKTERGk
 tX0BDbkfdn29kKB6C6oCSKEGjH4Y2LDAkiRAP8x+i4adYDWnTv7rp36rm
 30atOiM2aAeXx41BnwF2l4fVdwI5Eb5Ir6/+Lw2MVnE6c/tn1WEEWZ+qU g==;
X-CSE-ConnectionGUID: ZYQhTnsUS2idBOsqsdwOaA==
X-CSE-MsgGUID: UZNVAWEjQu6D1WUuwi6asA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="45078810"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="45078810"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 02:25:19 -0800
X-CSE-ConnectionGUID: i8IYCyWNR+uQ2r6cuHFUcA==
X-CSE-MsgGUID: Iv5G21OcRNGnJfoHL5Nkpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="131486518"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 05 Dec 2024 02:25:17 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [RFC 1/2] drm/xe: Add madvise interface
Date: Thu,  5 Dec 2024 16:16:19 +0530
Message-Id: <20241205104620.456353-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
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
efficient memory management by providing hints to the kernel about the
expected memory usage policy for gpuvma.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 include/uapi/drm/xe_drm.h | 63 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 4a8a4a63e99c..ec51619f76f0 100644
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
@@ -1713,6 +1716,66 @@ struct drm_xe_oa_stream_info {
 	__u64 reserved[3];
 };
 
+struct drm_xe_madvise_ops {
+	/** @start: start of the virtual address range */
+	__u64 start;
+	/** @size: size of the virtual address range */
+	__u64 size;
+#define DRM_XE_VMA_ATTR_PREFERRED_LOC	0
+#define DRM_XE_VMA_ATTR_ATOMIC		1
+#define DRM_XE_VMA_ATTR_PAT		2
+#define DRM_XE_VMA_ATTR_PURGEABLE_STATE	3
+	/** @type: type of attribute */
+	__u32 type;
+	union {
+#define DRM_XE_VMA_ATOMIC_UNDEFINED	0
+#define DRM_XE_VMA_ATOMIC_DEVICE	1
+#define DRM_XE_VMA_ATOMIC_GLOBAL	2
+		/** @atomic_val: atomic operation */
+		__u32 atomic_val;
+#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
+#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
+#define DRM_XE_VMA_PURGEABLE_STATE_PURGED	2
+		/** @purge_state_val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
+		__u32 purge_state_val;
+		/** @pat_index */
+		__u32 pat_index;
+		struct {
+			__u32 devmem_fd;
+			__u32 mem_region;
+		} preferred_mem_loc;
+	};
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+/**
+ * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
+ *
+ * Set or get memory attributes to a virtual address range
+ */
+struct drm_xe_madvise {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+	/** @vm_id: vm_id of the virtual range */
+	__u32 vm_id;
+	/** @reserved: Reserved */
+	__u64 reserved[2];
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
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

