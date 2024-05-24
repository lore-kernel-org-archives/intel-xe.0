Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C80C25B7A
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 11:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3AF10F1A5;
	Fri, 24 May 2024 11:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AOGIIg9A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D2D10F1A5
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 11:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716550645; x=1748086645;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=YuLc4mARpzlYBPnORL4YKMq8r8+hCIf1F8h7lOVdlKk=;
 b=AOGIIg9A9Y1vAZ0+sDwMrrFJF3tmkQZYtLAAnOvwaEL7MuKeaPSAw5PY
 CVwUlO1NdNgtHaEkmhJZVc19Tmz8FZEPYpn4kezzWQdojwNKlqkymc+70
 bJ5jBLVJZJaYRWWV0V0I6ssfysJvlSrIlfg9R0dDaM7wK3+vQhs5wxVar
 B53qgeji0Sf3NRIDIczf32qwjrxAxP3auy+oM7spdHQbnEp3VHAZr2aHV
 qknNQGlKJZIk2F2Vs7EbckyppyCnq+ToU2t8Fx/YsxqyU9eGSqSb+oN7B
 zKGlWAss0cYJo7DsCZdz5NWZaCUdn7/rRymM85yjwgm5yMDqDz17MrtOR A==;
X-CSE-ConnectionGUID: wqEEiPQbQcKlbAP8AL5CiQ==
X-CSE-MsgGUID: mVZuEwCiThyzpJN3MOaVnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12772696"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="12772696"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 04:37:25 -0700
X-CSE-ConnectionGUID: /E8AaxsTTPO2+7xUsG7gzQ==
X-CSE-MsgGUID: ej3IVyaYTyuN5zLgo9C3sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="38986484"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.49.231])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 04:37:24 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe/vf: Use only assigned GGTT region
Date: Fri, 24 May 2024 13:37:14 +0200
Message-Id: <20240524113714.932-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240524113714.932-1-michal.wajdeczko@intel.com>
References: <20240524113714.932-1-michal.wajdeczko@intel.com>
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

Each VF is assigned a limited range of the GGTT address space.
To ensure that the VF driver does not use GGTT allocations outside
of the assigned region, explicitly reserve GGTT space below and
above this region when initializing GGTT.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 +
 drivers/gpu/drm/xe/xe_ggtt.c         | 14 ++++-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c  | 93 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h  |  1 +
 4 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8e7048ff3ee5..dad7e9554c2c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -196,6 +196,9 @@ struct xe_tile {
 		struct {
 			/** @sriov.vf.memirq: Memory Based Interrupts. */
 			struct xe_memirq memirq;
+
+			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
+			struct drm_mm_node ggtt_balloon[2];
 		} vf;
 	} sriov;
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 17e5066763db..b01a670fecb8 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -20,6 +20,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_sriov_vf.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_map.h"
 #include "xe_pm.h"
@@ -141,6 +142,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	unsigned int gsm_size;
+	int err;
 
 	if (IS_SRIOV_VF(xe))
 		gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
@@ -194,7 +196,17 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	mutex_init(&ggtt->lock);
 	primelockdep(ggtt);
 
-	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
+	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
+	if (err)
+		return err;
+
+	if (IS_SRIOV_VF(xe)) {
+		err = xe_gt_sriov_vf_prepare_ggtt(xe_tile_get_gt(ggtt->tile, 0));
+		if (err)
+			return err;
+	}
+
+	return 0;
 }
 
 static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 66069eb8c5be..5ef0c3d78e7c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -14,9 +14,12 @@
 #include "abi/guc_klvs_abi.h"
 #include "abi/guc_relay_actions_abi.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_gtt_defs.h"
+#include "regs/xe_guc_regs.h"
 
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_ggtt.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_gt_sriov_vf_types.h"
@@ -25,6 +28,8 @@
 #include "xe_guc_relay.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
+#include "xe_uc_fw.h"
+#include "xe_wopcm.h"
 
 #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
 
@@ -474,6 +479,94 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
 	return gt->sriov.vf.self_config.num_ctxs;
 }
 
+static int vf_balloon_ggtt(struct xe_gt *gt)
+{
+	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_ggtt *ggtt = tile->mem.ggtt;
+	struct xe_device *xe = gt_to_xe(gt);
+	u64 start, end;
+	int err;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(xe));
+	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
+
+	if (!config->ggtt_size)
+		return -ENODATA;
+
+	/*
+	 * VF can only use part of the GGTT as allocated by the PF:
+	 *
+	 *      WOPCM                                  GUC_GGTT_TOP
+	 *      |<------------ Total GGTT size ------------------>|
+	 *
+	 *           VF GGTT base -->|<- size ->|
+	 *
+	 *      +--------------------+----------+-----------------+
+	 *      |////////////////////|   block  |\\\\\\\\\\\\\\\\\|
+	 *      +--------------------+----------+-----------------+
+	 *
+	 *      |<--- balloon[0] --->|<-- VF -->|<-- balloon[1] ->|
+	 */
+
+	start = xe_wopcm_size(xe);
+	end = config->ggtt_base;
+	if (end != start) {
+		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[0]);
+		if (err)
+			goto failed;
+	}
+
+	start = config->ggtt_base + config->ggtt_size;
+	end = GUC_GGTT_TOP;
+	if (end != start) {
+		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[1]);
+		if (err)
+			goto deballoon;
+	}
+
+	return 0;
+
+deballoon:
+	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
+failed:
+	return err;
+}
+
+static void deballoon_ggtt(struct drm_device *drm, void *arg)
+{
+	struct xe_tile *tile = arg;
+	struct xe_ggtt *ggtt = tile->mem.ggtt;
+
+	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
+	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
+	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
+}
+
+/**
+ * xe_gt_sriov_vf_prepare_ggtt - Prepare a VF's GGTT configuration.
+ * @gt: the &xe_gt
+ *
+ * This function is for VF use only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = tile_to_xe(tile);
+	int err;
+
+	if (xe_gt_is_media_type(gt))
+		return 0;
+
+	err = vf_balloon_ggtt(gt);
+	if (err)
+		return err;
+
+	return drmm_add_action_or_reset(&xe->drm, deballoon_ggtt, tile);
+}
+
 static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
 {
 	u32 request[VF2PF_HANDSHAKE_REQUEST_MSG_LEN] = {
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 0391ed72a570..7a04bcaffe9f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -16,6 +16,7 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
 int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
 int xe_gt_sriov_vf_connect(struct xe_gt *gt);
 int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
+int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
 
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
-- 
2.43.0

