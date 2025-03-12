Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6575C28B28
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 19:44:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAA010E1AB;
	Wed, 12 Mar 2025 19:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y3blq/mT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD9510E1AB
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Mar 2025 19:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741808698; x=1773344698;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i4do6YkQuGJShUPHSKi006JdrGwHjMEAGHSdheayzp0=;
 b=Y3blq/mT65y1Z/pCMSEZ1RqQZHpz87pFAYWVZVxHfqjDJKUwxaZ+j1JN
 ZcR2VvaJW6TsEjLv999Sv8iTzMB7pwo6xLC+PMmrVoS3IEB1wdJqZUqFc
 BOFatRmCIzDHVOK5vmgje2l679B3ktAAOrvwJiuscF4Owev/MorUig2FY
 EYll417wuWGI+1SyR7hhyNQ2zz2yHnxGKgjkUpmoLZyZ6qBjEYkyEUCIt
 hR4z95bIv0Lrt9yf8X1RiGnc3DL00k+MNbfQx7cz3YBb6ylDfHK0Lfm6N
 oHmkFmgVuB/9R++zcCaq0nMi+AglsJBGPhleiz02X23Xi+bFIeRwTuOgu Q==;
X-CSE-ConnectionGUID: 3AwO8n+HSJao5QAqa5g9Lw==
X-CSE-MsgGUID: qBz2w2/iTCas7a4rPgBi5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="45680888"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="45680888"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 12:44:57 -0700
X-CSE-ConnectionGUID: 5IpOJ4UqTYCY2m/5g3geeQ==
X-CSE-MsgGUID: s5gHTkzoSN6qqtZx/hpRcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="125913601"
Received: from nirmoyda-desk.igk.intel.com ([10.211.135.230])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 12:44:56 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [RFC PATCH] drm/xe: Add initial vfunc for flexible platform based TLB
 invals
Date: Wed, 12 Mar 2025 21:05:07 +0100
Message-ID: <20250312200507.94411-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

TLB invalidation mechanism is platform dependent. Add initial vfunc
based flexible platform based TLB invalidation which will in future
replace existing usages.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
Sending this to get initial reviews if this is the rigth direction 
for TLB layering for future-proofing TLB invalidation based on platform.

 drivers/gpu/drm/xe/xe_device.c                |  3 +
 drivers/gpu/drm/xe/xe_device_types.h          |  3 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 89 ++++++++++++++++++-
 .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h | 19 ++++
 4 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b2f656b2a563..728f4c1d2545 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -37,6 +37,7 @@
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
+#include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
 #include "xe_hw_engine_group.h"
 #include "xe_hwmon.h"
@@ -778,6 +779,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe->tlb_ops = xe_tlb_invalidation_ops_get(xe);
+
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_init_early(gt);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 72ef0b6fc425..f3c0ccb94557 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -552,6 +552,9 @@ struct xe_device {
 	/** @pmu: performance monitoring unit */
 	struct xe_pmu pmu;
 
+	/** @tlb_ops: tlb operations for this device */
+	const struct xe_tlb_invalidation_ops *tlb_ops;
+
 #ifdef TEST_VM_OPS_ERROR
 	/**
 	 * @vm_inject_error_position: inject errors at different places in VM
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 03072e094991..d3e7185d416b 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -322,6 +322,24 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 	return 0;
 }
 
+#define MAX_TLB_INVALIDATION_LEN	7
+static int xe_gt_tlb_invalidation_full(struct xe_gt *gt,
+				       struct xe_gt_tlb_invalidation_fence *fence,
+				       u64 start, u64 end, u32 asid)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 action[MAX_TLB_INVALIDATION_LEN];
+	int len = 0;
+
+	xe_gt_assert(gt, fence);
+	xe_gt_assert(gt, !xe->info.has_range_tlb_invalidation);
+
+	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
+	action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
+
+	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
+}
+
 /**
  * xe_gt_tlb_invalidation_range - Issue a TLB invalidation on this GT for an
  * address range
@@ -344,7 +362,6 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 				 u64 start, u64 end, u32 asid)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-#define MAX_TLB_INVALIDATION_LEN	7
 	u32 action[MAX_TLB_INVALIDATION_LEN];
 	int len = 0;
 
@@ -568,3 +585,73 @@ void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 		dma_fence_get(&fence->base);
 	fence->gt = gt;
 }
+
+static int
+xe_gt_tlb_invalidation_guc_no_execlist(struct xe_gt *gt,
+				       struct xe_gt_tlb_invalidation_fence *fence)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	__invalidation_fence_signal(xe, fence);
+	return 0;
+}
+
+static int
+xe_gt_tlb_invalidation_no_execlist(struct xe_gt *gt,
+				   struct xe_gt_tlb_invalidation_fence *fence,
+				   u64 start, u64 end, u32 asid)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	__invalidation_fence_signal(xe, fence);
+	return 0;
+}
+
+static int
+xe_gt_tlb_invalidation_vma_no_execlist(struct xe_gt *gt,
+				       struct xe_gt_tlb_invalidation_fence *fence,
+				       struct xe_vma *vma)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	__invalidation_fence_signal(xe, fence);
+	return 0;
+}
+
+static const struct xe_tlb_invalidation_ops tlb_inval_ops_guc = {
+	.invalidation_guc = xe_gt_tlb_invalidation_guc,
+	.invalidation_ggtt = xe_gt_tlb_invalidation_ggtt,
+	.invalidation_range = xe_gt_tlb_invalidation_range,
+	.invalidation_vma = xe_gt_tlb_invalidation_vma,
+	.init_early = xe_gt_tlb_invalidation_init_early,
+	.reset = xe_gt_tlb_invalidation_reset,
+};
+
+static const struct xe_tlb_invalidation_ops tlb_inval_ops_no_range = {
+	.invalidation_guc = xe_gt_tlb_invalidation_guc,
+	.invalidation_ggtt = xe_gt_tlb_invalidation_ggtt,
+	.invalidation_range = xe_gt_tlb_invalidation_full,
+	.invalidation_vma = xe_gt_tlb_invalidation_vma,
+	.init_early = xe_gt_tlb_invalidation_init_early,
+	.reset = xe_gt_tlb_invalidation_reset,
+};
+
+static const struct xe_tlb_invalidation_ops tlb_inval_ops_no_execlist = {
+	.invalidation_guc = xe_gt_tlb_invalidation_guc_no_execlist,
+	.invalidation_ggtt = xe_gt_tlb_invalidation_ggtt,
+	.invalidation_range = xe_gt_tlb_invalidation_no_execlist,
+	.invalidation_vma = xe_gt_tlb_invalidation_vma_no_execlist,
+	.init_early = xe_gt_tlb_invalidation_init_early,
+	.reset = xe_gt_tlb_invalidation_reset,
+};
+
+const struct xe_tlb_invalidation_ops *
+xe_tlb_invalidation_ops_get(struct xe_device *xe)
+{
+	if (xe->info.force_execlist)
+		return &tlb_inval_ops_no_execlist;
+	else if (xe->info.has_range_tlb_invalidation)
+		return &tlb_inval_ops_guc;
+	else
+		return &tlb_inval_ops_no_range;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
index de6e825e0851..ed367941c42f 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
@@ -8,7 +8,9 @@
 
 #include <linux/dma-fence.h>
 
+struct xe_device;
 struct xe_gt;
+struct xe_vma;
 
 /**
  * struct xe_gt_tlb_invalidation_fence - XE GT TLB invalidation fence
@@ -29,4 +31,21 @@ struct xe_gt_tlb_invalidation_fence {
 	ktime_t invalidation_time;
 };
 
+struct xe_tlb_invalidation_ops {
+	int (*invalidation_guc)(struct xe_gt *gt,
+				struct xe_gt_tlb_invalidation_fence *fence);
+	int (*invalidation_ggtt)(struct xe_gt *gt);
+	int (*invalidation_range)(struct xe_gt *gt,
+				  struct xe_gt_tlb_invalidation_fence *fence,
+				  u64 start, u64 end, u32 asid);
+	int (*invalidation_vma)(struct xe_gt *gt,
+				struct xe_gt_tlb_invalidation_fence *fence,
+				struct xe_vma *vma);
+	int (*init_early)(struct xe_gt *gt);
+	void (*reset)(struct xe_gt *gt);
+};
+
+const struct xe_tlb_invalidation_ops *
+xe_tlb_invalidation_ops_get(struct xe_device *xe);
+
 #endif
-- 
2.46.0

