Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E0EC4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 15:44:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9BD10E7CB;
	Tue, 13 Feb 2024 15:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i79XxRPy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0DF10E7EE
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 15:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707839058; x=1739375058;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1oKDq4dG90BYa9oOi4vilFF1Q7jxICQMf5KqO36D4kU=;
 b=i79XxRPyFzmxD5GNnkOKl2hknteZ75NhkCnbGMv4T+AF3Hb3y6vMBgAs
 8Ef0DRSNQlskL4ZcuOPhXN3Q5/JCXDkrBAsCOODG2jnfUQ9+bCetK98mI
 598Pi9mcEJo0yAwEKcOprFoncg0OZkBsOAF8/7xFv/Bs//9R4I9lrKv3h
 8fmfq1gt4ne/dlnIfGonqXtm2BELI6fLCsEv0nWkNaVyZ2o5wineMAe9j
 9wjHPDAfuOCFuOlV8Hvg31q+3pAL8P2DaPm1Z9pDrXXzKpLRdcayO9Qs+
 x6tN10u7qmewA/ABvw9KJMLWqNliN4Hw2jhtopYlFIWhIu+Fxz6H9LJA3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19262926"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="19262926"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:44:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7564509"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.153.144])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:44:18 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 7/8] drm/xe/vf: Don't program PAT if VF
Date: Tue, 13 Feb 2024 16:43:54 +0100
Message-Id: <20240213154355.1221-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240213154355.1221-1-michal.wajdeczko@intel.com>
References: <20240213154355.1221-1-michal.wajdeczko@intel.com>
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

PAT programming can only be done by the PF driver.
Besides VF drivers don't have access to control registers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 1ff6bc79e7d4..e148934d554b 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -13,6 +13,7 @@
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_mmio.h"
+#include "xe_sriov.h"
 
 #define _PAT_ATS				0x47fc
 #define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index, 8, \
@@ -433,6 +434,10 @@ void xe_pat_init_early(struct xe_device *xe)
 		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
 			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
 	}
+
+	/* VFs can't program nor dump PAT settings */
+	if (IS_SRIOV_VF(xe))
+		xe->pat.ops = NULL;
 }
 
 void xe_pat_init(struct xe_gt *gt)
-- 
2.43.0

