Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C51D1AD3A
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 09:58:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EB310E2D8;
	Wed, 16 Oct 2024 09:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jI0NwlDi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF8510E2D8
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 09:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729072686; x=1760608686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lwd8imVCKrjTySpDkBv8fmG61Pgy0xIjIYI3q6Z8NCg=;
 b=jI0NwlDiHdbGCsx31/+TQu1pw1QDnPnKDvMKOEGG8qK9i/otC01HblhK
 szTcVql/9tUl5LiWpomlAmFRUlnHJG9Ngm3PuLToB/xc+KL/jqt4oZr/8
 asgymYY2//uAV70dXu/A5KPN9uEGKrsraMIZiM+asnox2HPlkT8k0ot1s
 tk+laLGMyaOdE3Dp9WEEbiDyIeNeoc1Q14f9HAIqJyEFL2S9DRSo7B2AG
 vvCrLkJ1GLQXH9bCz1+fCn97d9qdUREGjwcCx512WsFAfbbsiM+QLNrAE
 9VdDdHZNgDzZBb+9ArB+YrtXt8hdGF+uw2/wAbSAW6zeUpfjGTQgTPwlu Q==;
X-CSE-ConnectionGUID: gHy4snhCRmKZVQJMzH4phQ==
X-CSE-MsgGUID: 6I9LBsvERoW84OlzYDDwmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="27951160"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="27951160"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 02:58:06 -0700
X-CSE-ConnectionGUID: kb2z8RoaRC+5ubHdU9WG8Q==
X-CSE-MsgGUID: jeTGN6Y9Tq6g6jRDFdfAjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="78201597"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 02:58:05 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.winiarski@intel.com, michal.wajdeczko@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v1 3/3] drm/xe/pf: Add functions to save and restore VF LMEM
 and CCS data
Date: Wed, 16 Oct 2024 11:57:45 +0200
Message-Id: <20241016095745.7477-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241016095745.7477-1-lukasz.laguna@intel.com>
References: <20241016095745.7477-1-lukasz.laguna@intel.com>
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

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 100 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   7 ++
 2 files changed, 107 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index c712111aa30d..feb22d3e5dd5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -12,6 +12,7 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
+#include "xe_migrate.h"
 #include "xe_sriov.h"
 
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
@@ -382,6 +383,105 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 }
 #endif /* CONFIG_DEBUG_FS */
 
+static int pf_save_restore_lmem(struct xe_gt *gt, unsigned int vfid, struct xe_bo *sysmem,
+				struct xe_bo *ccs, u64 offset, size_t size, bool save)
+{
+	struct xe_bo *vram;
+	struct dma_fence *fence;
+	int ret;
+
+	if (!sysmem && !ccs)
+		return -EINVAL;
+
+	vram = gt->sriov.pf.vfs[vfid].config.lmem_obj;
+	if (!vram)
+		return -ENXIO;
+
+	if (!xe_bo_trylock(vram))
+		return -EBUSY;
+
+	if (sysmem) {
+		if (!xe_bo_trylock(sysmem)) {
+			ret = -EBUSY;
+			goto err_vram_unlock;
+		}
+	}
+	if (ccs) {
+		if (!xe_bo_trylock(ccs)) {
+			ret = -EBUSY;
+			goto err_sysmem_unlock;
+		}
+	}
+
+	fence = xe_migrate_raw_vram_copy(vram, offset, sysmem, 0, ccs, 0, size, save);
+	if (IS_ERR(fence)) {
+		ret = PTR_ERR(fence);
+		goto err_ccs_unlock;
+	}
+	ret = dma_fence_wait_timeout(fence, false, 5 * HZ);
+	if (!ret)
+		ret = -ETIME;
+
+	dma_fence_put(fence);
+
+err_ccs_unlock:
+	if (ccs)
+		xe_bo_unlock(ccs);
+err_sysmem_unlock:
+	if (sysmem)
+		xe_bo_unlock(sysmem);
+err_vram_unlock:
+	xe_bo_unlock(vram);
+
+	return ret < 0 ? ret : 0;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_lmem() - Save a VF LMEM and corresponding CCS.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @smem: the sysmem BO to save LMEM data to (NULL if not needed)
+ * @ccs: the sysmem BO to save CCS data to (NULL if not needed)
+ * @offset: the offset of VF LMEM chunk
+ * @size: the size of VF LMEM chunk
+ *
+ * This function is for PF only.
+ *
+ * This functions saves VF LMEM and corresponding CCS data into sysmem buffer
+ * objects.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_save_lmem(struct xe_gt *gt, unsigned int vfid,
+				       struct xe_bo *sysmem, struct xe_bo *ccs, u64 offset,
+				       size_t size)
+{
+	return pf_save_restore_lmem(gt, vfid, sysmem, ccs, offset, size, true);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_restore_lmem() - Restore a VF LMEM and corresponding CCS.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @smem: the sysmem BO to restore LMEM data from (NULL if not needed)
+ * @ccs: the sysmem BO to restore CCS data from (NULL if not needed)
+ * @offset: the offset of VF LMEM chunk
+ * @size: the size of VF LMEM chunk
+ *
+ * This function is for PF only.
+ *
+ * This functions restores VF LMEM and corresponding CCS data from sysmem
+ * buffer objects.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_restore_lmem(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_bo *sysmem, struct xe_bo *ccs, u64 offset,
+					  size_t size)
+{
+	return pf_save_restore_lmem(gt, vfid, sysmem, ccs, offset, size, false);
+}
+
 static bool pf_check_migration_support(struct xe_gt *gt)
 {
 	/* GuC 70.25 with save/restore v2 is required */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 09faeae00ddb..dc1e6c5b44fa 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -8,11 +8,18 @@
 
 #include <linux/types.h>
 
+struct xe_bo;
 struct xe_gt;
 
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
 int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_save_lmem(struct xe_gt *gt, unsigned int vfid,
+				       struct xe_bo *sysmem, struct xe_bo *ccs, u64 offset,
+				       size_t size);
+int xe_gt_sriov_pf_migration_restore_lmem(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_bo *sysmem, struct xe_bo *ccs, u64 offset,
+					  size_t size);
 
 #ifdef CONFIG_DEBUG_FS
 ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
-- 
2.40.0

