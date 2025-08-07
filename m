Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3B7C87FDA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 16:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0691010E891;
	Thu,  7 Aug 2025 16:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nOpKE9m4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C112410E891
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 16:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754583440; x=1786119440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4h7cweoTo1YZy4sbwkKCzhXyhHrpiYUaPqhLKdNyOuM=;
 b=nOpKE9m472nEK+b61qDQ2aHJKPrBDTQ70Fl340omFVkLRT6MHtBkrH6K
 YLYvFJAVYSex5oVn3o7GaIROt7KDwUwhulGgp8lRwY1ks+vIWa1MIB8sp
 dKekQ2HEaOG1GdkIuHhRKFnfwNuVr2OfV80QQpmJoDA3Va4oK28ZvR7i7
 cU5CyoqUescdl+iqfNT/h8f4pSARmdpcosCKrKYNdScqlhKBGnMAIvjkg
 cOUSZT3BOCDgJv5KoSja/dirS6AYnO9sceCZx1kj8RcJqoUgcotd7og2j
 TrPODQb4k3P/k1/jHfl+NZ25AIWSKOT3PvErAB+nOAI/L8hSOxzUblXEl A==;
X-CSE-ConnectionGUID: X7C3o8J5RdSeORq26sRFMg==
X-CSE-MsgGUID: Ih8acCOuRFK69zwXP6f15g==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56845633"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56845633"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 09:17:20 -0700
X-CSE-ConnectionGUID: EEBGfB1jSp+08XjCJVnknw==
X-CSE-MsgGUID: 1Hn33Z0qS5K/SR73RX/Bfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="195937945"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2025 09:17:18 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 23/26] drm/xe/vm: Add helper to check for default VMA
 memory attributes
Date: Thu,  7 Aug 2025 22:13:35 +0530
Message-Id: <20250807164338.1832254-24-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
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
index 8eac7a4ab22f..c4d1c3e1c974 100644
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

