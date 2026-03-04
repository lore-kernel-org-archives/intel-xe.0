Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71180EB7EDB
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 12:09:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3732110E9ED;
	Wed,  4 Mar 2026 12:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VatEY7PP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1F810E9F3
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 12:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772626139; x=1804162139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+xMETlVqg6o3+1xi1U6idv5sVy5qFMBEWCwtU10IEGQ=;
 b=VatEY7PPfhg2zuX1sEjZElp0mtDjhs+Y2SrMVSPsma0QKpjQF4nPAcDi
 sz/OoPjXErlGkq1P79aLSuwgr2bH1OXgLxRgMincpqfgt9qdEOzQoPgjy
 ASPo0ZfjMs2br5916Ltp3HzJuDzlOAXQKF5osl35VLgxrHQgSp6te9MQ+
 FXJpEAQfuvJf7APnvw9Je2T0cnETVZ7vTjyYrSZiZtYmmoI9UTdBC7p4D
 //j2DPruPGsvYxEywKfP4quIz97/pNUU/NzT2tlXshH2n9V4P7TnKbYJp
 C7U1duhdj+y+yd5RnI3qIfQD3qVS3822g04udCiqmAECiGXLqJu5t9Spa Q==;
X-CSE-ConnectionGUID: RS54TZ+1SDG4KGQKKrvsEw==
X-CSE-MsgGUID: Uy4Pne5kTN+PlGQbURE3VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="96300612"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="96300612"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:04:52 -0800
X-CSE-ConnectionGUID: TCsv1RF3TJqzSIeC0DAKHw==
X-CSE-MsgGUID: Dlg13BH9RS6wrreppIMaxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="244992774"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa001.fm.intel.com with ESMTP; 04 Mar 2026 04:04:42 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.auld@intel.com, michal.mrozek@intel.com,
 thomas.hellstrom@linux.intel.com, Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v7 1/3] drm/xe: add VM_BIND DECOMPRESS uapi flag
Date: Wed,  4 Mar 2026 18:08:00 +0530
Message-ID: <20260304123758.3050386-6-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304123758.3050386-5-nitin.r.gote@intel.com>
References: <20260304123758.3050386-5-nitin.r.gote@intel.com>
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

Compute PR: https://github.com/intel/compute-runtime/pull/898

v3: Rebase on latest drm-tip and add compute pr info

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
index ef2565048bdf..18156a1d4f1e 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1053,6 +1053,13 @@ struct drm_xe_vm_destroy {
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
@@ -1160,6 +1167,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
 #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
 #define DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET	(1 << 6)
+#define DRM_XE_VM_BIND_FLAG_DECOMPRESS (1 << 7)
 	/** @flags: Bind flags */
 	__u32 flags;
 
-- 
2.50.1

