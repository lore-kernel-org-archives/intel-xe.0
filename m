Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF61CCFA00
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 10:22:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E15F10E5AF;
	Tue,  4 Nov 2025 10:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BXwl7sXt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC2410E5AF
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 10:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762251777; x=1793787777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=COBnyjTP8mU/Mt38U98JE1BfYNQ2va3um8TSDKkUGlk=;
 b=BXwl7sXtgmpwOClBJI3/J1N+m71wHQHhWcWOAUhaebXNzcnlBU+hvZzv
 bJdugHzbsrV+9184VBlRr+Zlk0gx0J0AZQbs6wuEcVoHB471tsxeu6t8V
 KooWBWOisJzNRB8t/aicFberKfUs48GS+wuFiYimelLPNAHLhMX0o3FHm
 5EZkUIYoLXqubkCMXuV/qmxKiRs7UfmF12JFkECvcNde7U8oWu+b46WOa
 pKMdD8oOXSJYjCDpj/DU0xyXrh7bW0fFzVKGJeQDsL7kZ+0/rW5pPbxLk
 WWIADqmFKX7RqAHKJK8VhTQDNlKH2xqucs++sJYT0rFLxcXsaXGpAsDEB Q==;
X-CSE-ConnectionGUID: Z81PlUGSRZipzeUwnSmuLg==
X-CSE-MsgGUID: 4XaV1xu0Rm2o+uE2q5jYsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75693026"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="75693026"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:22:56 -0800
X-CSE-ConnectionGUID: NvmwZPEaQPy++KpWFUa1mg==
X-CSE-MsgGUID: QaGxhhRmTfKls1dp+bbEdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="186810865"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa009.jf.intel.com with ESMTP; 04 Nov 2025 02:22:54 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: matthew.auld@intel.com, michal.mrozek@intel.com,
	Nitin Gote <nitin.r.gote@intel.com>, Mrozek@freedesktop.org
Subject: [PATCH v4 1/3] drm/xe: add VM_BIND DECOMPRESS uapi flag
Date: Tue,  4 Nov 2025 16:23:03 +0530
Message-Id: <20251104105305.2100460-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251104105305.2100460-1-nitin.r.gote@intel.com>
References: <20251104105305.2100460-1-nitin.r.gote@intel.com>
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
Hi Matt,

The UMD PR is in progress.
Requested Michal to ack the patch once we have
UMD PR.

-Nitin

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
2.25.1

