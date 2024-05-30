Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342C7C27C44
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 13:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBED11B820;
	Thu, 30 May 2024 13:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXGknDrC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846BF113C14
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 13:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717076145; x=1748612145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o8h4DtRaONyn1cn6YaX39mDoSmeDbf4mAu/NkN6d6C8=;
 b=DXGknDrCT8XFSUPUWyM7kvC/AB6mWY90AuTwTVW1NYLUGOQ37iX0p8Wq
 n6gcnlPRjhyVLo0VpUXAwFPAJLKBmKYZts6yjcC7uGZce+91xXjm0WhyY
 QK7oQZaCca+SjjhbTYLM1Uxn25zXpvCpwiPuto34TAJaAfSj13OYPq9eG
 gqvvv5pKTsuXDodnLqgPBnthnj7nmwfgS8I8HNyXvXeI8dI31XtqlCBR1
 N9maPm08MbxEB25jHfbMHKnl4fSZQhh8fgBPhJhLFpT7PDiRsUlmxo16Z
 nHju5fozO+PtNWeNjCizSBIXfsRBZFvVeOEKgCa8mdhUxxdJgbAYb7zme A==;
X-CSE-ConnectionGUID: rd2/LCKfRLaCKG6iP9nM/w==
X-CSE-MsgGUID: 8zrdXtewTQyVBkzFdQI2Gg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24681365"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24681365"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:35:45 -0700
X-CSE-ConnectionGUID: 4zv3TQygSSOVXVUPZZydYA==
X-CSE-MsgGUID: lbnF7aUWTXWvvzE3cykT7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="40733769"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:35:44 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 5/5] drm/xe/vf: Setup VRAM based on received config data
Date: Thu, 30 May 2024 15:35:27 +0200
Message-Id: <20240530133527.1328-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240530133527.1328-1-michal.wajdeczko@intel.com>
References: <20240530133527.1328-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
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
index 6fa150643242..5bcd59190353 100644
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

