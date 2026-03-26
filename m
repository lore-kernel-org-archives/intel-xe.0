Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A069010AB822
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 21:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEA610EBD5;
	Thu, 26 Mar 2026 21:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ux/MeXYA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FA910E31A
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 21:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774560573; x=1806096573;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q3SwfW58V9e/Xc4aDsNZRJVwvZTRrFcG7/0c1VXwGpc=;
 b=Ux/MeXYAcZwC61NkicgMafPMXuAFgzhRSb3HXgds9GMjO1nCf6MvzeVF
 AUIOOQYb/Vc3rTBz3jjpEDsx/YRKB8ee67ysXh+sRu7nMK9VcEh9BRI/V
 9siZRBXMZduKGuDoRTb7kRbOKj8+kB9dGkw2vOGs1K1AS55C7oywpYP0C
 E9O1kbAtO2rw5If5EtlxWkSZO+sIhU7uCFnV/+BVDjdFu+y+iZ2BhvyZf
 e3lY+5ekUzxO+tEHHGc2ffP6deBf4dITagh3vP+LEnzappHNwWCVS3FHw
 mUD/mo4M3cToi1xAtXMp9igcuqS3UpX4xvujeT56SOuk0kHbZGNp3u7aI g==;
X-CSE-ConnectionGUID: COumGE7NSAOtUK/JEdGlmg==
X-CSE-MsgGUID: XFG3S3D2RC2Juv5zCfAX1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75654323"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75654323"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 14:29:33 -0700
X-CSE-ConnectionGUID: cCxM+0rPQHqwHh0Rw3hsfg==
X-CSE-MsgGUID: L+ySYQktQkmcSUPTiOuBoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="220723691"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa010.fm.intel.com with ESMTP; 26 Mar 2026 14:29:33 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH] drm/xe: use the asid based invalidation
Date: Thu, 26 Mar 2026 14:29:31 -0700
Message-ID: <20260326212931.303796-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
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

Experiment only not for review

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 11 ++++++++++-
 drivers/gpu/drm/xe/xe_module.c        |  4 ++++
 drivers/gpu/drm/xe/xe_module.h        |  1 +
 drivers/gpu/drm/xe/xe_pci.c           |  2 ++
 4 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index ced58f46f846..bccb105af9a7 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -16,6 +16,7 @@
 #include "xe_guc_tlb_inval.h"
 #include "xe_force_wake.h"
 #include "xe_mmio.h"
+#include "xe_module.h"
 #include "xe_sa.h"
 #include "xe_tlb_inval.h"
 #include "xe_vm.h"
@@ -174,7 +175,15 @@ static int send_tlb_inval_ppgtt(struct xe_guc *guc, u32 seqno, u64 start,
 	action[len++] = !prl_sa ? seqno : TLB_INVALIDATION_SEQNO_INVALID;
 	if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
 	    length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
-		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
+		if (xe_modparam.enable_asid_tlb_inval) {
+			action[len++] = MAKE_INVAL_OP_FLUSH(XE_GUC_TLB_INVAL_PAGE_SELECTIVE, true);
+			action[len++] = id;
+			action[len++] = 1;
+			action[len++] = 0;
+			action[len++] = 0;
+		} else {
+			action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
+		}
 	} else {
 		u64 normalize_len = normalize_invalidation_range(gt, &start,
 								 &end);
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 4cb578182912..fdfae7fbb231 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -83,6 +83,10 @@ MODULE_PARM_DESC(wedged_mode,
 		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-error, 2=upon-any-hang-no-reset "
 		 "[default=" XE_DEFAULT_WEDGED_MODE_STR "])");
 
+module_param_named_unsafe(enable_asid_tlb_inval, xe_modparam.enable_asid_tlb_inval, bool, 0600);
+MODULE_PARM_DESC(enable_asid_tlb_inval,
+		 "Use ASID-based page-selective TLB invalidation instead of full invalidation (experimental)");
+
 static int xe_check_nomodeset(void)
 {
 	if (drm_firmware_drivers_only())
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 79cb9639c0f3..648ac49fef76 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -23,6 +23,7 @@ struct xe_modparam {
 #endif
 	unsigned int wedged_mode;
 	u32 svm_notifier_size;
+	bool enable_asid_tlb_inval;
 };
 
 extern struct xe_modparam xe_modparam;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 189e2a1c29f9..0566a915abe5 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -955,6 +955,8 @@ static int xe_info_init(struct xe_device *xe,
 		xe->info.has_device_atomics_on_smem = 1;
 
 	xe->info.has_range_tlb_inval = graphics_desc->has_range_tlb_inval;
+	if (xe_modparam.enable_asid_tlb_inval)
+		xe->info.has_range_tlb_inval = 0;
 	xe->info.has_ctx_tlb_inval = graphics_desc->has_ctx_tlb_inval;
 	xe->info.has_usm = graphics_desc->has_usm;
 	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
-- 
2.43.0

