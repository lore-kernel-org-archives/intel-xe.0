Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6631FCF258C
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 09:49:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EC810E5C8;
	Wed, 19 Nov 2025 09:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YugT5pot";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF18F10E5C8
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 09:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763545748; x=1795081748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8XzrN48kpv5slHbf5Z5Khwc2/H/Mq7Z8OP1YVcjTYgQ=;
 b=YugT5potoX4ueNWyRtbS/x6pL9zBnnQM1M4E11brFegjmmgCMjcoHDlT
 dI/ZBEkkvDbpUgc0i6McrOdnlEx2E9OobgxKMTwLHhPql5Jv4eWOwq2my
 Cq6Fy3BeONU71jWgR+U4ifEVfqsqR48lm02FyvnGWQeWOLloBBfPtyQkf
 WAVlvCYAp0EvhxqgrP0wv32hrerSyvIRkZ+fNcfdDvRNiTtUf2Bz9QTZQ
 k23exdyxfZkUbYCWdM88flKT2h8aXH0089sIy7TPcNhpCY0ttP3ooyK+S
 hmdbbsotIip7b7s7PzpZ1RQ+HzA0k0VhdrqRNi+z9M2Ze/MxGwxuN4Foo g==;
X-CSE-ConnectionGUID: gmN5zDEARlemZi3LcRZgYA==
X-CSE-MsgGUID: lkzwOKRYQuietbCJsUnkoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76190436"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="76190436"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 01:49:07 -0800
X-CSE-ConnectionGUID: QNBdesRQRqORrb13Wm78Fg==
X-CSE-MsgGUID: lWkuY4FKTw+86f7C8sjolA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="195317201"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2025 01:49:05 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: matthew.brost@intel.com,
	matthew.auld@intel.com
Cc: intel-xe@lists.freedesktop.org, michal.mrozek@intel.com,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v6 1/3] drm/xe: add VM_BIND DECOMPRESS uapi flag
Date: Wed, 19 Nov 2025 15:49:06 +0530
Message-ID: <20251119101904.2456979-6-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251119101904.2456979-5-nitin.r.gote@intel.com>
References: <20251119101904.2456979-5-nitin.r.gote@intel.com>
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

Add a new VM_BIND flag, DRM_XE_VM_BIND_FLAG_DECOMPRESS, that lets userspace
express intent for the driver to perform on-device in-place decompression
for the GPU mapping created by a MAP bind operation.

This flag is used by subsequent driver changes to trigger scheduling of
GPU work that resolves compressed VRAM pages into an uncompressed PAT
VM mapping.

Behavior and semantics:
- Valid only for DRM_XE_VM_BIND_OP_MAP. IOCTLs using this flag on other ops
  are rejected (-EINVAL).
- The bind's pat_index must select the device "no-compression" PAT entry;
  otherwise the ioctl is rejected (-EINVAL).
- Only meaningful for VRAM-backed BOs on devices that support Flat CCS and
  the required hardware generation (driver will return -EOPNOTSUPP if not).
- On success the driver schedules a migrate/resolve and installs the
  returned dma_fence into the BO's kernel reservation
  (DMA_RESV_USAGE_KERNEL).

v2: Add kernel doc (Matt)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Mrozek, Michal <michal.mrozek@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 include/uapi/drm/xe_drm.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 47853659a705..e706f1512fd0 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1031,6 +1031,13 @@ struct drm_xe_vm_destroy {
  *    not invoke autoreset. Neither will stack variables going out of scope.
  *    Therefore it's recommended to always explicitly reset the madvises when
  *    freeing the memory backing a region used in a &DRM_IOCTL_XE_MADVISE call.
+ *  - DRM_XE_VM_BIND_FLAG_DECOMPRESS - Request on-device decompression for a MAP.
+ *    When set on a MAP bind operation, request the driver schedule an on-device
+ *    in-place decompression (via the migrate/resolve path) for the GPU mapping
+ *    created by this bind. Only valid for DRM_XE_VM_BIND_OP_MAP; usage on
+ *    other ops is rejected. The bind's pat_index must select the device's
+ *    "no-compression" PAT. Only meaningful for VRAM-backed BOs on devices that
+ *    support Flat CCS and the required HW generation XE2+.
  *
  * The @prefetch_mem_region_instance for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
  *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures prefetching occurs in
@@ -1138,6 +1145,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
 #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
 #define DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET	(1 << 6)
+#define DRM_XE_VM_BIND_FLAG_DECOMPRESS (1 << 7)
 	/** @flags: Bind flags */
 	__u32 flags;
 
-- 
2.50.1

