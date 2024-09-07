Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B554FE6FE4F
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7824710EB2F;
	Sat,  7 Sep 2024 00:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F0v6NyVa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746DA10EB3A
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667679; x=1757203679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GOPLPPGC0hX9OFjI2+MxxJ7kPJEO47E5u1CJCZrzhqw=;
 b=F0v6NyVaL6u48Kq772cX9TkIwOpSwDRGudQh5Gwke0JGL6WdDJRQTdxQ
 Yqk5ucvSH2vQ4NXOzSicxZn0yHsehFHppq3UiPWCWX2cZtnS4CV4L9tXk
 sBFmSKv8JEwFiziecNNKzsXX8bEQmWlvS5KzJxu/p3S8M5/G7Rq8RNZFv
 FEP/VJR+0Gag/xMAnKg0GcSUaXR+BTLmvxYPn5U9YxoSYwu7o8Us9NgW3
 uxREv802iM1gBmvX6SAOWcynk2OeVczIPO1Kl2mKlBgV9qHaXJ5r9sJit
 QlkTJc5jh4bkB/8yQVBUAhgSfi7dNGoMzW13mupR0m8BMhdGll2iySxif A==;
X-CSE-ConnectionGUID: Dc7RYSyiT4Kea2c0oJ2b5g==
X-CSE-MsgGUID: Nsx/VXJ7SrGUJMPHVBx1hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855328"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855328"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: IEDPmUreSWa2bFd8cwBUnA==
X-CSE-MsgGUID: 3+bedcD7Tjm+AjCXQ+WzpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792733"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 38/43] drm/xe/tlb: Convert register access to use xe_mmio
Date: Fri,  6 Sep 2024 17:08:27 -0700
Message-ID: <20240907000748.2614020-83-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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

