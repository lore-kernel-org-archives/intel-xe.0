Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457D7CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 11:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080C310EA94;
	Fri,  7 Nov 2025 11:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDJHVnie";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C95C10EA94
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 11:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762514295; x=1794050295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2w0dxgHkJN7l2drjB1UooXhwJNHXvGX+rnTrP/niARE=;
 b=KDJHVnieSEA9IPFBLuD+khdMHg9EQeAlLzfv561idDQc6ltpv8bu9Lza
 A6pfG5GQ5uWpinx+eKUaB0RNpcm730Qot3acQdRm4nWspjHWb7w6/m9cF
 P/JKjsM+V6U53QcP7FMrhVxp4Ln2F5+Xp0pCl7LvkbvT7Cla3S7IPrgc5
 zwn5VaF0W0qAaDspkfSAp1GfMZv1KkN7T/P9Ja65nzlVr1SwXbwdJVH+Z
 o4UMWnoWrA9PDTs92MRlwBMHNvyy0axFR4HSFCMtNeKqGB7r0F40Mxrkx
 zs96jdqJrFGiySYJ10YfaVFVV11bM5GAQFYlBT7C/Q8GCaknO6cLslFt+ g==;
X-CSE-ConnectionGUID: bb6y/lfrSbGeH8XfuP/i5Q==
X-CSE-MsgGUID: /bgg3637RkeoDzJiEXYhQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="68523716"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="68523716"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:18:15 -0800
X-CSE-ConnectionGUID: 9uMj21A5TbanWH1KZ6sfUg==
X-CSE-MsgGUID: IAdXkiOSSTWjsahqdhJvUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="192107895"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa003.jf.intel.com with ESMTP; 07 Nov 2025 03:18:13 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: matthew.brost@intel.com
Cc: intel-xe@lists.freedesktop.org, matthew.auld@intel.com,
 michal.mrozek@intel.com, Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v5 1/3] drm/xe: add VM_BIND DECOMPRESS uapi flag
Date: Fri,  7 Nov 2025 17:17:59 +0530
Message-ID: <20251107114757.561671-6-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251107114757.561671-5-nitin.r.gote@intel.com>
References: <20251107114757.561671-5-nitin.r.gote@intel.com>
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
Cc: Michal Mrozek <michal.mrozek@intel.com>
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

