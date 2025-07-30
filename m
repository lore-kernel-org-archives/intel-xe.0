Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B0DC87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 12:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907BF10E6A2;
	Wed, 30 Jul 2025 12:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmAHrSOV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F8210E6A2
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 12:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753878878; x=1785414878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aU/DGV8HtpU/eyOx9rhHXKxOGTkEii9HhvE7eu4Fem0=;
 b=hmAHrSOV5ckFTWHd2AhBiDNdIPg2HSPb/GJhTD0wzFWpcUT/tG1LTuoK
 xfyW0bfkgmOP3VW16/yjbBiLZQm6uka0HQ/DjVDoNYyWlpYYisfG/lUWE
 CgUhD9mm0aak22P4pRNIiCrxxyluaR4nha+lNcFq8qZ2zmVtU4huzoJdA
 5UhglOI7gIC4W6npzMHOTkxPnUCYk77ir9kK+gl+1fiebcgTEln7Co/Si
 0VvmljKk9gUUYWUlqYcLQ9t6lDTK+yER+R69xLKa3KZmbQhBVSG77a51S
 8q54LQ38cm/1eiz1YbFFIRS2CNtW+dfO/RXUOis9Kh7itUvGPwoFuavm2 Q==;
X-CSE-ConnectionGUID: QeyCa4hbT9GzIX++ogU2kA==
X-CSE-MsgGUID: gLW6aMj8TvGnjhewzWPqNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66450193"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66450193"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:34:38 -0700
X-CSE-ConnectionGUID: OdpMOOHtS7yDJg0D8mBGzA==
X-CSE-MsgGUID: bhdx9uu+S0K6/LYlIgKA4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="186649515"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 30 Jul 2025 05:34:37 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 22/25] drm/xe/vm: Add helper to check for default VMA
 memory attributes
Date: Wed, 30 Jul 2025 18:30:47 +0530
Message-Id: <20250730130050.1001648-23-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
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

Introduce a new helper function `xe_vma_has_default_mem_attrs()` to
determine whether a VMA's memory attributes are set to their default
values. This includes checks for atomic access, PAT index, and preferred
location.

Also, add a new field `default_pat_index` to `struct xe_vma_mem_attr`
to track the initial PAT index set during the first bind. This helps
distinguish between default and user-modified pat index, such as those
changed via madvise.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h       |  2 ++
 drivers/gpu/drm/xe/xe_vm_types.h |  6 ++++++
 3 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0774b40bc37b..5ee38e9cf6c6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2598,6 +2598,29 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 	return err;
 }
 
+/**
+ * xe_vma_has_default_mem_attrs - Check if a VMA has default memory attributes
+ * @vma: Pointer to the xe_vma structure to check
+ *
+ * This function determines whether the given VMA (Virtual Memory Area)
+ * has its memory attributes set to their default values. Specifically,
+ * it checks the following conditions:
+ *
+ * - `atomic_access` is `DRM_XE_VMA_ATOMIC_UNDEFINED`
+ * - `pat_index` is equal to `default_pat_index`
+ * - `preferred_loc.devmem_fd` is `DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE`
+ * - `preferred_loc.migration_policy` is `DRM_XE_MIGRATE_ALL_PAGES`
+ *
+ * Return: true if all attributes are at their default values, false otherwise.
+ */
+bool xe_vma_has_default_mem_attrs(struct xe_vma *vma)
+{
+	return (vma->attr.atomic_access == DRM_XE_ATOMIC_UNDEFINED &&
+		vma->attr.pat_index ==  vma->attr.default_pat_index &&
+		vma->attr.preferred_loc.devmem_fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE &&
+		vma->attr.preferred_loc.migration_policy == DRM_XE_MIGRATE_ALL_PAGES);
+}
+
 static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				   struct xe_vma_ops *vops)
 {
@@ -2630,6 +2653,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 					.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
 				},
 				.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
+				.default_pat_index = op->map.pat_index,
 				.pat_index = op->map.pat_index,
 			};
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 05ac3118d9f4..f735d994806d 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -66,6 +66,8 @@ static inline bool xe_vm_is_closed_or_banned(struct xe_vm *vm)
 struct xe_vma *
 xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
 
+bool xe_vma_has_default_mem_attrs(struct xe_vma *vma);
+
 /**
  * xe_vm_has_scratch() - Whether the vm is configured for scratch PTEs
  * @vm: The vm
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 81d92d886578..351242c92c12 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -103,8 +103,14 @@ struct xe_vma_mem_attr {
 	 */
 	u32 atomic_access;
 
+	/**
+	 * @default_pat_index: The pat index for VMA set during first bind by user.
+	 */
+	u16 default_pat_index;
+
 	/**
 	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
+	 * same as default_pat_index unless overwritten by madvise.
 	 */
 	u16 pat_index;
 };
-- 
2.34.1

