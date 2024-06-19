Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62839C2BBCA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 21:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEEF10E295;
	Wed, 19 Jun 2024 21:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dFznjIHz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD6510E366
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 21:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718833595; x=1750369595;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=obpwETFd2/Pkdwk91Zzna7Se03+QancZL/i5q/UApSk=;
 b=dFznjIHzhPsPLla9CXSxTNa8cvyEvG6rE4IIUcUqNvu7Y1j4gjqHOCBn
 Uof4ImbYWyffMaNDkXA9tIZKKJSLRyyeNY4bkTCE1qDQRcWCM1bfBfZ18
 m+6Y83+CgXNXYiEobKkPxtD74kO3+tfUevsLnFWnECubPuTwyg/GWNe1f
 TQGj5P1XYsLQmzF5voEheFSuDZCqAe4HrESa12ZMP4T+BJtFIVI+7smcy
 +tSC4Vmh9nz7uZEANXOP5tRWCsx6gWLSsdjnAAiPvy77KOG7tMixm/25R
 QMf523t1KvgbOC//Rf3g+IJP3Ese7cNO6UxGc7gomO9FP2KD8FjVS1wvX w==;
X-CSE-ConnectionGUID: R9Yl2M7DQCSHgaUuf7YCAw==
X-CSE-MsgGUID: Ffg4VwHyTlCdtaLmDVvpzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15662984"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15662984"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:46:35 -0700
X-CSE-ConnectionGUID: ktzZ869sRqW0ET62wQ0NaQ==
X-CSE-MsgGUID: PdHCs9BaTlCI2H/zAlOi/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42157815"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:46:34 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 7/9] drm/xe/vf: Don't use register based TLB invalidation if VF
Date: Wed, 19 Jun 2024 23:45:55 +0200
Message-Id: <20240619214557.905-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240619214557.905-1-michal.wajdeczko@intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
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

VF drivers can only use GuC-based TLB invalidation, as they don't
have access to the related registers. However, VFs shouldn't need
any explicit TLB invalidation before enabling CTB communication,
as there will be an implicit GGTT TLB invalidation issued by the
GuC itself as part of MMIO-based action handling.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 23d397a246a8..e1f1ccb01143 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -13,6 +13,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_mmio.h"
+#include "xe_sriov.h"
 #include "xe_trace.h"
 #include "regs/xe_guc_regs.h"
 
@@ -249,6 +250,9 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 
 		xe_gt_tlb_invalidation_wait(gt, seqno);
 	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
+		if (IS_SRIOV_VF(xe))
+			return 0;
+
 		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
 		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
 			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
-- 
2.43.0

