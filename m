Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5A7C25B74
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 17:36:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1017610FBCE;
	Mon, 27 May 2024 17:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lEKakE9e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B522C10E3EF
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 17:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716831399; x=1748367399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5r+oCR/kGOBSoEsXfOKSWtxjaPiF9XrqND3B13bDnkI=;
 b=lEKakE9eEnm6CxcQpvJ8XrHjgkbeQBhsEtpa6d7h3iMOpWm4qqGI4zJp
 Ao5RwrOtNk+1M0AxS6YRLVmb6Mo/EN00Rv76lruj4putOzNAt+GZGRS46
 fDB7GRBiOlLmS/wkRCvy1eMoX4ME3w2G/A6kOvXev/4k9IDjzJkPKCkLL
 FWc8rB1z9nH9fXa5JgMrQraUwv7tUbJRB2i5VMwh0t7apNe81223ZxRkr
 YIsOcvMQn5PKPLhEs0YLFv1a1536gpUW88C2Rhd+bW46brjrZYLn/zmZm
 TS40CIn9J1IL+RUfZLDFwYaNEQwCtpWVJAnP5xvv0piHQnKtlMCE7Rb5r g==;
X-CSE-ConnectionGUID: vHeh9QG2Svu81yqbngO9xg==
X-CSE-MsgGUID: 6flc8eR9S+SrNXkvldpYUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23722647"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="23722647"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 10:36:39 -0700
X-CSE-ConnectionGUID: upiaTk00RF6YZuZbY21UQA==
X-CSE-MsgGUID: sUFJfd2XStSn+VY/txSnGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="34901677"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.33.240])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 10:36:39 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 5/5] drm/xe/vf: Setup VRAM based on received config data
Date: Mon, 27 May 2024 19:35:54 +0200
Message-Id: <20240527173554.1108-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240527173554.1108-1-michal.wajdeczko@intel.com>
References: <20240527173554.1108-1-michal.wajdeczko@intel.com>
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

VF drivers will obtain VRAM configuration from the GuC as part of
the VF self config. Use that configuration instead of trying to
read inaccessible registers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
 drivers/gpu/drm/xe/xe_vram.c        | 18 ++++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index da7c64f6285b..41e46a00c01e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -478,6 +478,23 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
 	return gt->sriov.vf.self_config.num_ctxs;
 }
 
+/**
+ * xe_gt_sriov_vf_lmem - VF LMEM configuration.
+ * @gt: the &xe_gt
+ *
+ * This function is for VF use only.
+ *
+ * Return: size of the LMEM assigned to VF.
+ */
+u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
+	xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
+
+	return gt->sriov.vf.self_config.lmem_size;
+}
+
 static int vf_balloon_ggtt(struct xe_gt *gt)
 {
 	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 7a04bcaffe9f..0de7f8cbcfa6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -20,6 +20,7 @@ int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
 
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
+u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
 u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
 
 void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 411e8d23fd4d..ccc4791c0e34 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -15,8 +15,10 @@
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt_mcr.h"
+#include "xe_gt_sriov_vf.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
+#include "xe_sriov.h"
 #include "xe_vram.h"
 
 #define BAR_SIZE_SHIFT 20
@@ -220,6 +222,22 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 	int err;
 	u32 reg;
 
+	if (IS_SRIOV_VF(xe)) {
+		struct xe_tile *t;
+		int id;
+
+		offset = 0;
+		for_each_tile(t, xe, id)
+			for_each_if(t->id < tile->id)
+				offset += xe_gt_sriov_vf_lmem(t->primary_gt);
+
+		*tile_size = xe_gt_sriov_vf_lmem(gt);
+		*vram_size = *tile_size;
+		*tile_offset = offset;
+
+		return 0;
+	}
+
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		return err;
-- 
2.43.0

