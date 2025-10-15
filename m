Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D94CCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 10:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F400910E772;
	Wed, 15 Oct 2025 10:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uf9bDRDd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F6210E288
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 10:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760523446; x=1792059446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pjhbHtiruAHsUOp2QihIvCxyY8mT3Kxa3J9/cAfTDi8=;
 b=Uf9bDRDd/kd6jA8K7pLbhbmYMMh4Qc+HO1nTXZ5WQTja22MSVZDgo6Xn
 gAoWklhBWQSeaVJPM8xzJjlhvU6gtqxx83KbrkRhTZDJ9Dnla+o6neYty
 uH7psQ0W+nVrPwSukOwN4rkkauY9/30GUh6Zei4iRH/IUo3IOz/A4sewU
 yuk9EwUvMuBlXA1qKc/eZX4pgrK2to5tIc1c1L3xw5qM3fCPNoSEnTAlo
 trUrFT8zEAQcIvb76/aQRzkZ/4dOkZeUAwc/HgElwr5L2cGC36FIVfJ95
 WRxH80dFkvNPT47u7sIOkTe8M7z+oJTGSy9W34kgjwaRi/jTPupvSzo4l A==;
X-CSE-ConnectionGUID: F5HQLFPcRJ6/VFAMUSF7ng==
X-CSE-MsgGUID: u5WhtqmdTXmQxgWqHDqQEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62733047"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="62733047"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 03:17:26 -0700
X-CSE-ConnectionGUID: BAtWOMGKS7q+bQM5biz1dQ==
X-CSE-MsgGUID: a4AImgaqSaSu1NHcLDoQTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="187437742"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa004.fm.intel.com with ESMTP; 15 Oct 2025 03:17:24 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.auld@intel.com,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v3 1/3] drm/xe: add VM_BIND DECOMPRESS uapi flag
Date: Wed, 15 Oct 2025 16:17:07 +0530
Message-Id: <20251015104709.44476-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251015104709.44476-1-nitin.r.gote@intel.com>
References: <20251015104709.44476-1-nitin.r.gote@intel.com>
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
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 include/uapi/drm/xe_drm.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 40ff19f52a8d..07bd63651a7e 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1013,6 +1013,13 @@ struct drm_xe_vm_destroy {
  *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
  *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
  *    handle MBZ, and the BO offset MBZ.
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
@@ -1119,6 +1126,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
 #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
 #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
+#define DRM_XE_VM_BIND_FLAG_DECOMPRESS	(1 << 6)
 	/** @flags: Bind flags */
 	__u32 flags;
 
-- 
2.25.1

