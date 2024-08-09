Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A583C52D7C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 16:52:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CBE10E994;
	Fri,  9 Aug 2024 16:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bk6574cn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660F910E992
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 16:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723222337; x=1754758337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I184G75ijVxenPqDYX86MHOa+zDQa8W2FqaZNb6yiak=;
 b=bk6574cn2Nts2SsW6GSSkwpXVDR23eVVkXaAZNudMZyYW1OVUiZXrOky
 z470vopVpQ5mMGOaT2fUyvp2u/mBgEyiKq1gEYpEDtkJMh0ifZ/i+J4tw
 LbktHY4+3VvC9BUgYQnd5aW6pj8jFd0npO7FGhL6hdnvpSr0FhAhTDXmi
 q5XgU5t3CvpBsnIcywxEyDWUYIga6w6pLVdqo2MNHP1DvsYBONt7XXTal
 /yoSjN2LYv3Qg8LgCSOr1BJA+1WoEYv2uYnVGmsvHSboNv1ztSwXGTMCr
 6qGnV+iWlj4JN43TQKWLQjvcmHd6q3fvkHaMn+rulzCvxTSPWBqwCdTW1 A==;
X-CSE-ConnectionGUID: JSrg/g18RJqp/c3LJI0EhQ==
X-CSE-MsgGUID: /o7zL1cFRuGXwUTyTtIxHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21379394"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21379394"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:17 -0700
X-CSE-ConnectionGUID: 3IbgXZYMT7avHXzHIzS7rA==
X-CSE-MsgGUID: mCNy0JGTSeye/SrcMey1yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57569272"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:16 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 01/12] drm/xe/pf: Add function to sanitize VF resources
Date: Fri,  9 Aug 2024 18:51:48 +0200
Message-Id: <20240809165159.662-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240809165159.662-1-michal.wajdeczko@intel.com>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
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

On current platforms it is a PF driver responsibility to clear
some of the VF's resources during a VF FLR. Add simple function
that will clear configured VF resources (GGTT, LMEM). We will
start using this function soon.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 84 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
 2 files changed, 85 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 227527785afd..eba6793294f3 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -29,6 +29,7 @@
 #include "xe_guc_submit.h"
 #include "xe_lmtt.h"
 #include "xe_map.h"
+#include "xe_migrate.h"
 #include "xe_sriov.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wopcm.h"
@@ -1893,6 +1894,89 @@ int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool forc
 	return force ? 0 : err;
 }
 
+static void pf_sanitize_ggtt(struct xe_tile *tile, struct drm_mm_node *node, unsigned int vfid)
+{
+	struct xe_ggtt *ggtt = tile->mem.ggtt;
+
+	if (drm_mm_node_allocated(node))
+		xe_ggtt_assign(ggtt, node, vfid);
+}
+
+static int pf_sanitize_lmem(struct xe_tile *tile, struct xe_bo *bo, long timeout)
+{
+	struct xe_migrate *m = tile->migrate;
+	struct dma_fence *fence;
+	int err;
+
+	if (!bo)
+		return 0;
+
+	xe_bo_lock(bo, false);
+	fence = xe_migrate_clear(m, bo, bo->ttm.resource);
+	if (IS_ERR(fence)) {
+		err = PTR_ERR(fence);
+	} else if (!fence) {
+		err = -ENOMEM;
+	} else {
+		long ret = dma_fence_wait_timeout(fence, false, timeout);
+
+		err = ret > 0 ? 0 : ret < 0 ? ret : -ETIMEDOUT;
+		dma_fence_put(fence);
+		if (!err)
+			xe_gt_sriov_dbg_verbose(tile->primary_gt, "LMEM cleared in %dms\n",
+						jiffies_to_msecs(timeout - ret));
+	}
+	xe_bo_unlock(bo);
+
+	return err;
+}
+
+static int pf_sanitize_vf_resources(struct xe_gt *gt, u32 vfid, long timeout)
+{
+	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = gt_to_xe(gt);
+	int err = 0;
+
+	/*
+	 * Only GGTT and LMEM requires to be cleared by the PF.
+	 * GuC doorbell IDs and context IDs do not need any clearing.
+	 */
+	if (!xe_gt_is_media_type(gt)) {
+		pf_sanitize_ggtt(tile, &config->ggtt_region, vfid);
+		if (IS_DGFX(xe))
+			err = pf_sanitize_lmem(tile, config->lmem_obj, timeout);
+	}
+
+	return err;
+}
+
+/**
+ * xe_gt_sriov_pf_config_sanitize() - Sanitize VF's resources.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be PF)
+ * @timeout: maximum timeout to wait for completion in jiffies
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_sanitize(struct xe_gt *gt, unsigned int vfid, long timeout)
+{
+	int err;
+
+	xe_gt_assert(gt, vfid != PFID);
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	err = pf_sanitize_vf_resources(gt, vfid, timeout);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	if (unlikely(err))
+		xe_gt_sriov_notice(gt, "VF%u resource sanitizing failed (%pe)\n",
+				   vfid, ERR_PTR(err));
+	return err;
+}
+
 /**
  * xe_gt_sriov_pf_config_push - Reprovision VF's configuration.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index c0e6e4743dc2..42e64769f666 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -50,6 +50,7 @@ int xe_gt_sriov_pf_config_set_threshold(struct xe_gt *gt, unsigned int vfid,
 					enum xe_guc_klv_threshold_index index, u32 value);
 
 int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
+int xe_gt_sriov_pf_config_sanitize(struct xe_gt *gt, unsigned int vfid, long timeout);
 int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force);
 int xe_gt_sriov_pf_config_push(struct xe_gt *gt, unsigned int vfid, bool refresh);
 
-- 
2.43.0

