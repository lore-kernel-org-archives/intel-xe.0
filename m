Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5C6D4335D
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 13:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D8610E30B;
	Thu,  7 Nov 2024 13:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JdDnPY4h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AB410E850
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 13:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730987737; x=1762523737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eGA5z/oQd6YO2Q8YVP8pr8HknP3LR7cB30++MfXI2yY=;
 b=JdDnPY4hP3+RxoPmSm9dPkG1bTIdFTn6ebbox6seEMpFtMy9k2QKouFs
 pQdho2lsfInT30K9brlwSMBd4vKQSU4MhSPY9/nl2unxRZAAxTUoy9kQI
 FVIXfRtzciPR9Pryzr9unp1OARWL4+UxYbDyLlXrqml6bg/4DrayET/M7
 n/edE3iwEs9simk4Mc2mpwpuqYTenSt2SKaY4VKRIYffrgZEPfrY8G0JB
 ZFsVyvJvDcYB2B7bYWdb35u6YJp8Nu7aqK/1TJ36XKrqEmDnmHZZLVkQR
 ziWjK0lie9BGY3H+Uj5ykm/L/HyB/1GoCU8EqFO49IvUsTWcsdXcdLjAN A==;
X-CSE-ConnectionGUID: 1HjKF5wsQImXbzMHYQXAWg==
X-CSE-MsgGUID: ym+qxF19RReh8PcOL/Dirg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48289965"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="48289965"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 05:55:36 -0800
X-CSE-ConnectionGUID: SKEbNouqS6iWkaXuEINtRw==
X-CSE-MsgGUID: 6X8M4X5UQguS8ibtBtFOcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; d="scan'208";a="84708089"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 05:55:35 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.winiarski@intel.com, michal.wajdeczko@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v3 3/4] drm/xe/pf: Add functions to save and restore VF LMEM
 and CCS data
Date: Thu,  7 Nov 2024 14:55:16 +0100
Message-Id: <20241107135517.9516-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241107135517.9516-1-lukasz.laguna@intel.com>
References: <20241107135517.9516-1-lukasz.laguna@intel.com>
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
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 113 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   9 ++
 2 files changed, 122 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index c712111aa30d..1ce2c3c3db4e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -12,6 +12,7 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
+#include "xe_migrate.h"
 #include "xe_sriov.h"
 
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
@@ -382,6 +383,118 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 }
 #endif /* CONFIG_DEBUG_FS */
 
+static struct dma_fence *pf_save_restore_lmem(struct xe_gt *gt, unsigned int vfid,
+					      struct xe_bo *smem, u64 smem_offset,
+					      struct xe_bo *ccs, u64 ccs_offset,
+					      u64 lmem_offset, size_t size, bool save)
+{
+	struct xe_bo *lmem;
+	struct dma_fence *ret = NULL;
+	struct drm_exec exec;
+	int err;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+	xe_gt_assert(gt, smem || ccs);
+
+	lmem = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
+	if (!lmem)
+		return ERR_PTR(-ENXIO);
+
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
+	drm_exec_until_all_locked(&exec) {
+		err = drm_exec_lock_obj(&exec, &lmem->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (err) {
+			ret = ERR_PTR(err);
+			goto err;
+		}
+
+		if (smem) {
+			err = drm_exec_lock_obj(&exec, &smem->ttm.base);
+			drm_exec_retry_on_contention(&exec);
+			if (err) {
+				ret = ERR_PTR(err);
+				goto err;
+			}
+		}
+
+		if (ccs) {
+			err = drm_exec_lock_obj(&exec, &ccs->ttm.base);
+			drm_exec_retry_on_contention(&exec);
+			if (err) {
+				ret = ERR_PTR(err);
+				goto err;
+			}
+		}
+	}
+
+	ret = xe_migrate_raw_vram_copy(lmem, lmem_offset, smem, smem_offset, ccs, ccs_offset,
+				       size, save);
+
+err:
+	drm_exec_fini(&exec);
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

