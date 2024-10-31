Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D310FD767DE
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 15:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9376610E8D0;
	Thu, 31 Oct 2024 15:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OC1lnpMD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9CE10E8CE
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 15:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730387870; x=1761923870;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/K1H84GzL3Nyg2IpuIneH5Xs7KR1P+6KS5lHfC9DYTc=;
 b=OC1lnpMDsSvNaqlDI/zjI2VCcbKh2WT6qpA9oAAcRnKcEn69TfHwEkk/
 VU4o3RC5UinSGAKWXjb4xfXcvBdD85L8he6i7vzlO3um0kuCbqdelOWOC
 kwwO4ZCa6jOGJHCKzaQNTFdsw2rI3eP4b2nOJaxctvbjM3byzHFA4wYAx
 YZ6/CVH6UBjhXzB8to9r9yZfDy8GH8x7w5NzynRt7zrczQcdYuE8Bo/YX
 d3suux9lzCcarWvJ3Vr3YWWzJRZHn4ay/J3hoZ+RYcoqtK51L3+FRqOmY
 s917lbscp+D5VExieJjuQCjNSVzq82OjeV2n3FnL/aXiJ1WkUP1vhrzWg Q==;
X-CSE-ConnectionGUID: hW6Zc8b6SyipXGoXWam4Ew==
X-CSE-MsgGUID: /I5L4u1VRXaKmThPuJKRHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="29568937"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="29568937"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 08:17:44 -0700
X-CSE-ConnectionGUID: O/Yh71ZvSSGKDPxPbf2xFQ==
X-CSE-MsgGUID: 5JmJBPSFTROPRfIf/AFGzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="87798919"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 08:17:43 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.winiarski@intel.com, michal.wajdeczko@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v2 3/4] drm/xe/pf: Add functions to save and restore VF LMEM
 and CCS data
Date: Thu, 31 Oct 2024 16:17:24 +0100
Message-Id: <20241031151725.28315-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241031151725.28315-1-lukasz.laguna@intel.com>
References: <20241031151725.28315-1-lukasz.laguna@intel.com>
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

State of VF LMEM and corresponding CCS metadata needs to be saved and
restored during migration of VM with attached dGPU VF. Add helpers that
allow it. We will start using them in upcoming patches.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 112 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   9 ++
 2 files changed, 121 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index c712111aa30d..eca01c96a348 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -12,6 +12,7 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
+#include "xe_migrate.h"
 #include "xe_sriov.h"
 
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
@@ -382,6 +383,117 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 }
 #endif /* CONFIG_DEBUG_FS */
 
+static struct dma_fence *pf_save_restore_lmem(struct xe_gt *gt, unsigned int vfid,
+					      struct xe_bo *smem, u64 smem_offset,
+					      struct xe_bo *ccs, u64 ccs_offset,
+					      u64 lmem_offset, size_t size, bool save)
+{
+	struct xe_bo *lmem;
+	struct dma_fence *ret = NULL;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+	xe_gt_assert(gt, smem || ccs);
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+
+	lmem = gt->sriov.pf.vfs[vfid].config.lmem_obj;
+	if (!lmem) {
+		mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+		return ERR_PTR(-ENXIO);
+	}
+
+	if (!xe_bo_trylock(lmem)) {
+		mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+		return ERR_PTR(-EBUSY);
+	}
+
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	if (smem) {
+		if (!xe_bo_trylock(smem)) {
+			ret = ERR_PTR(-EBUSY);
+			goto err_lmem_unlock;
+		}
+	}
+	if (ccs) {
+		if (!xe_bo_trylock(ccs)) {
+			ret = ERR_PTR(-EBUSY);
+			goto err_smem_unlock;
+		}
+	}
+
+	ret = xe_migrate_raw_vram_copy(lmem, lmem_offset, smem, smem_offset, ccs, ccs_offset,
+				       size, save);
+
+	if (ccs)
+		xe_bo_unlock(ccs);
+err_smem_unlock:
+	if (smem)
+		xe_bo_unlock(smem);
+err_lmem_unlock:
+	xe_bo_unlock(lmem);
+
+	return ret;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_lmem() - Save a VF LMEM and corresponding CCS.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @smem: the sysmem BO to save LMEM data to (NULL if not needed)
+ * @smem_offset: the offset of @smem BO
+ * @ccs: the sysmem BO to save CCS data to (NULL if not needed)
+ * @ccs_offset: the offset of @ccs BO
+ * @lmem_offset: the offset of VF LMEM chunk
+ * @size: the size of VF LMEM chunk
+ *
+ * This function is for PF only.
+ *
+ * This functions saves VF LMEM and corresponding CCS data into sysmem buffer
+ * objects.
+ *
+ * Return: Pointer to a dma_fence representing the last copy batch, or
+ * an error pointer on failure.
+ */
+struct dma_fence *xe_gt_sriov_pf_migration_save_lmem(struct xe_gt *gt, unsigned int vfid,
+						     struct xe_bo *smem, u64 smem_offset,
+						     struct xe_bo *ccs, u64 ccs_offset,
+						     u64 lmem_offset, size_t size)
+{
+	return pf_save_restore_lmem(gt, vfid, smem, smem_offset, ccs, ccs_offset,
+				    lmem_offset, size, true);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_restore_lmem() - Restore a VF LMEM and corresponding CCS.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @smem: the sysmem BO to restore LMEM data from (NULL if not needed)
+ * @smem_offset: the offset of @smem BO
+ * @ccs: the sysmem BO to restore CCS data from (NULL if not needed)
+ * @ccs_offset: the offset of @ccs BO
+ * @lmem_offset: the offset of VF LMEM chunk
+ * @size: the size of VF LMEM chunk
+ *
+ * This function is for PF only.
+ *
+ * This functions restores VF LMEM and corresponding CCS data from sysmem
+ * buffer objects.
+ *
+ * Return: Pointer to a dma_fence representing the last copy batch, or
+ * an error pointer on failure.
+ */
+struct dma_fence *xe_gt_sriov_pf_migration_restore_lmem(struct xe_gt *gt, unsigned int vfid,
+							struct xe_bo *smem, u64 smem_offset,
+							struct xe_bo *ccs, u64 ccs_offset,
+							u64 lmem_offset, size_t size)
+{
+	return pf_save_restore_lmem(gt, vfid, smem, smem_offset, ccs, ccs_offset,
+				    lmem_offset, size, false);
+}
+
 static bool pf_check_migration_support(struct xe_gt *gt)
 {
 	/* GuC 70.25 with save/restore v2 is required */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 09faeae00ddb..a4301574d92c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -8,11 +8,20 @@
 
 #include <linux/types.h>
 
+struct xe_bo;
 struct xe_gt;
 
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
 int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
+struct dma_fence *xe_gt_sriov_pf_migration_save_lmem(struct xe_gt *gt, unsigned int vfid,
+						     struct xe_bo *smem, u64 smem_offset,
+						     struct xe_bo *ccs, u64 ccs_offset,
+						     u64 lmem_offset, size_t size);
+struct dma_fence *xe_gt_sriov_pf_migration_restore_lmem(struct xe_gt *gt, unsigned int vfid,
+							struct xe_bo *smem, u64 smem_offset,
+							struct xe_bo *ccs, u64 ccs_offset,
+							u64 lmem_offset, size_t size);
 
 #ifdef CONFIG_DEBUG_FS
 ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
-- 
2.40.0

