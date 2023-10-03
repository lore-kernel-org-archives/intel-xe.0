Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5E2E75459
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 12:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D1010E2A9;
	Tue,  3 Oct 2023 12:52:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF6C10E04E
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 12:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696337522; x=1727873522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zrekamln12ftGAXRPkMx65ukaEl0VY14e/uG5fHeztQ=;
 b=INqHFIBGxopVQ5UEB1b9xESPlG+PnsegNF7KFr4168+fZpKqYfSDWJXG
 OzIuI6VkmMJ+xjd4kjBdiY87JEMNmiSfjQc5iQ9Xm9s4s9+0FcfbFE9NO
 WxcnVkhAnFgxgJoaE0Juj2SFFri6J2R71y67zwNSTpiUIescJCsbfPkP8
 OuXAU0dS7D/9Ds1BFEDBP8sgbvd5hhXUYCDFWgoB9mCmh0kaKOefssZT2
 R55zXb9rWy14LexWACzwv2wRgA5SYgh6XGfEL1BNEbc3kHgzpnJPN56cu
 j8k0iaETlrKPN3U/rnje8g1aWRgMWxxkW3hYPmv3H5zPxJXXjGc8n1d2N A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="447022072"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="447022072"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 05:52:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="998005499"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="998005499"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 05:51:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 05:52:12 -0700
Message-Id: <20231003125217.3350838-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003125217.3350838-1-lucas.demarchi@intel.com>
References: <20231003125217.3350838-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/7] drm/xe/xe2: Follow XeHPC for TLB
 invalidation
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Register GUC_TLB_INV_CR is gone in xe2. When GuC submission is not yet
enabled, make sure to follow the same path as XeHPC.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 99b54794917e..d7b3d008ce57 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -263,7 +263,7 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 	} else if (xe_device_uc_enabled(gt_to_xe(gt))) {
 		struct xe_device *xe = gt_to_xe(gt);
 
-		if (xe->info.platform == XE_PVC) {
+		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
 			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
 					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
 			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC0,
-- 
2.40.1

