Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE9110AB827
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 22:18:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF43710E99A;
	Thu, 26 Mar 2026 22:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P8PX9AjC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B3710E99A
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 22:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774563513; x=1806099513;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UyXkYWcbvCqwM8X+8D3wvFwfFBhEH0CRuy30TIW8lRQ=;
 b=P8PX9AjC5zl1o+gWg1c12Z56sGAtJXz6GX6NGPopkUDgP2J/GEt3CzIo
 7hHczKwQNrnIPk27bjLOVfH2fTfO5i2h7d6f45kH7SOPDz+iQvHo9gOmU
 RDLRMjiw4C31eYEL+93aXbjvYX1bOPWgfXvAVGBoTbidpmPl0EfU1HDEb
 HmPWLoB1K5xBkztQt3rpNSV1+1MFsculzP3mgudCFvFSZNy9AF/AuU7PA
 6jjZ2ZuqM+qnSn1ZgUkEdOgzSC2TAOg9jmLjUDX3ebzeTzlgBOPjQ+4a0
 1YwwFojs2FnpxQV6t7lwF8XMVJu5+j558U3EKzVsjo7FRPJmDBOSs/KXe Q==;
X-CSE-ConnectionGUID: 7pXzTN8vSZSWtfwthcXPJw==
X-CSE-MsgGUID: JIewYhbQTh6PUuaiftx1ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="93218465"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="93218465"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 15:18:33 -0700
X-CSE-ConnectionGUID: /26Z74LBQ2aIVFem5xgj2g==
X-CSE-MsgGUID: g6qb3oNATOekPo6IR6cnMg==
X-ExtLoop1: 1
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa003.fm.intel.com with ESMTP; 26 Mar 2026 15:18:33 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v2] drm/xe: use the asid based invalidation
Date: Thu, 26 Mar 2026 15:18:30 -0700
Message-ID: <20260326221831.352798-1-x.wang@intel.com>
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
 drivers/gpu/drm/xe/xe_pci.c           |  6 ++++++
 4 files changed, 21 insertions(+), 1 deletion(-)

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
index 189e2a1c29f9..f47e96aa5967 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -955,6 +955,12 @@ static int xe_info_init(struct xe_device *xe,
 		xe->info.has_device_atomics_on_smem = 1;
 
 	xe->info.has_range_tlb_inval = graphics_desc->has_range_tlb_inval;
+	if (xe_modparam.enable_asid_tlb_inval)
+		xe->info.has_range_tlb_inval = 0;
+	xe_info(xe, "ASID-based TLB invalidation %s (modparam=%u, has_range_tlb_inval=%u)\n",
+		xe_modparam.enable_asid_tlb_inval ? "enabled" : "disabled",
+		xe_modparam.enable_asid_tlb_inval,
+		xe->info.has_range_tlb_inval);
 	xe->info.has_ctx_tlb_inval = graphics_desc->has_ctx_tlb_inval;
 	xe->info.has_usm = graphics_desc->has_usm;
 	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
-- 
2.43.0

