Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE11EE9A03B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 09:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7194510E1EC;
	Thu, 19 Feb 2026 09:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PVGJhtsf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADD610E140
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 09:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771492407; x=1803028407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h2Lb5BD+bkCNcPM0+NeEGmPUBV70X1NvbFOFPlk6gRA=;
 b=PVGJhtsf+MEEqBExsqd43TP8TVKn4vmZwSsUyqJa0gKQ+UPZtIUaMl+m
 Y7TSXZZbQQjKaGKXoMI3sjHNqDWPfya+YSXpHqNGPOkHYlNG7Ii42D0jv
 +UHX4kFoUGIalOMMoEePIvBbHzlkL1JEx5BJ+Z7MdlLI9NUzhNPHfBn3v
 l0Sorg04dhal6V8Ojbew8HYJ0qPa7RBehlIsGCENq50PlyV9Jb6vsLDue
 hScX2kPfgiB4/WW8MQEOBXdwD+THeEKEjd8WPtQtRkBljey/W/bnI0OLa
 ulItgCFeXrs9lkgSfj5mmqebc/PHkornKXz/DRtFTuZr3ZMqtcz4jAKN8 w==;
X-CSE-ConnectionGUID: vlh/DtThRvSA2ylyuV5FtA==
X-CSE-MsgGUID: CjtV2s22RgGfOVDuF+fCYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72637307"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72637307"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:13:27 -0800
X-CSE-ConnectionGUID: H5UdvTJITSmqsttqxlTu2g==
X-CSE-MsgGUID: 17OkkFVTQkKBNmcLOHmFjQ==
X-ExtLoop1: 1
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:13:25 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC 1/7] drm/xe/vm: Add CPU_AUTORESET_ACTIVE VMA flag
Date: Thu, 19 Feb 2026 14:43:06 +0530
Message-ID: <20260219091312.796749-2-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219091312.796749-1-arvind.yadav@intel.com>
References: <20260219091312.796749-1-arvind.yadav@intel.com>
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

Add XE_VMA_CPU_AUTORESET_ACTIVE to track whether a
MADVISE_AUTORESET CPU address mirror VMA has been GPU-touched.

The flag is set at bind time and cleared on first GPU fault,
creating a one-way transition from CPU-only to GPU-touched state.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.h       | 5 +++++
 drivers/gpu/drm/xe/xe_vm_types.h | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 288115c7844a..7bf400f068ce 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -174,6 +174,11 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 		!xe_vma_is_cpu_addr_mirror(vma);
 }
 
+static inline bool xe_vma_has_cpu_autoreset_active(struct xe_vma *vma)
+{
+	return vma->gpuva.flags & XE_VMA_CPU_AUTORESET_ACTIVE;
+}
+
 struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
 
 int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 43203e90ee3e..29ff63503d4c 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -50,6 +50,14 @@ struct xe_vm_pgtable_update_op;
 #define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 8)
 #define XE_VMA_SYSTEM_ALLOCATOR	(DRM_GPUVA_USERBITS << 9)
 #define XE_VMA_MADV_AUTORESET	(DRM_GPUVA_USERBITS << 10)
+/*
+ * CPU-only runtime state for MADV_AUTORESET VMAs.
+ *
+ * Set at bind time and cleared before the first GPU PTEs are installed.
+ * Used to distinguish CPU-only VMAs from GPU-touched ones when handling
+ * munmap events.
+ */
+#define XE_VMA_CPU_AUTORESET_ACTIVE	(DRM_GPUVA_USERBITS << 11)
 
 /**
  * struct xe_vma_mem_attr - memory attributes associated with vma
-- 
2.43.0

