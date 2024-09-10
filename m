Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B12EE01F1
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C4310E93F;
	Tue, 10 Sep 2024 23:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JkycN8jl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C9710E8F5
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012049; x=1757548049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G3haiXaWEmuHx37hOQhVl50eBSktpw8wMPvCbnbeNpc=;
 b=JkycN8jlQYfApZpRklapgF08NgzidKRYWarja+BCTLOKCKMjqcU2D3Ql
 zco1PgewoReXTwc86i0SZQ2hp0d+QU296vUUh8Lah3SgF06cjsI59q9fr
 t9vH19nMQehrxypa5ufNC8S5q9XOmK8liR12O2fv0X4Tu11sWw1QGd4wJ
 5780vB0dPUE+Dg3xBJ45kjS6mBH3DKpnT6UXfvcjxg5utZLg9gQz1UKP8
 IQ39vuhtcyS6qJpaV9j+N3Zfmj6xDztXd17IWML2w/AwMgKbkd3qmxgkm
 Ro6c0Ei4y+RH2rVK/X9wiQJAGoHfkDcl9gKfFrYPwJwEmkupyCFgmX2Vh g==;
X-CSE-ConnectionGUID: axQHJ5nETuGwsmlEyIb4Rg==
X-CSE-MsgGUID: UB9rnuH5QaaRmbkz4hPgZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144332"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144332"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:29 -0700
X-CSE-ConnectionGUID: UpXFSCnsQh2kJ9JrCqZgPQ==
X-CSE-MsgGUID: JT3ZzChgR++NDKAOXr6Sig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989665"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 38/43] drm/xe/tlb: Convert register access to use xe_mmio
Date: Tue, 10 Sep 2024 16:47:58 -0700
Message-ID: <20240910234719.3335472-83-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910234719.3335472-45-matthew.d.roper@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index cca9cf536f76..98616de0c5bb 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -274,17 +274,19 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 
 		xe_gt_tlb_invalidation_fence_wait(&fence);
 	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
+		struct xe_mmio *mmio = &gt->mmio;
+
 		if (IS_SRIOV_VF(xe))
 			return 0;
 
 		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
 		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
-			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
+			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
 					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
-			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC0,
+			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
 					PVC_GUC_TLB_INV_DESC0_VALID);
 		} else {
-			xe_mmio_write32(gt, GUC_TLB_INV_CR,
+			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
 					GUC_TLB_INV_CR_INVALIDATE);
 		}
 		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-- 
2.45.2

