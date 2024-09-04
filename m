Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E55FCD484E
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F5D10E661;
	Wed,  4 Sep 2024 00:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KRt1N/Pw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FD510E64A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409278; x=1756945278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CY8i3lweHyMqLJoO+s7EbCg/kKtD781aCkveGXHs618=;
 b=KRt1N/PwhgZfPBC78Qwy18iu0Pv5uMqsV9zK1uskQM+hH8wm22dCjhu9
 FW70RrMYsbKwXOJsZJxGW7tqEUOAo6ZAr5bqlZtvXLiqbpy+PAqrtFdZZ
 q93pRtZjPaXYZA9MYTWmUryw3BaFqzK6o9b2rmw1rm89l+WbQwXt+GMWh
 d8FVJU6Wy7SbUaHn+uTjWMgRynxjeeaYPv9jywJTKWw00+C9Yc/7co5Gs
 N+M52oSfqo3vxminPL7BNqU9rOWgMzf2rdm47EAEZvOH8GCEl+KCJoy1v
 CKnHMex4faKFV+eEHgfdAoZzrG1Cb9zl41yLcAeimZLws865dMh2ZMVLS A==;
X-CSE-ConnectionGUID: DrxVMiR6SYu2qyNFJGeVLw==
X-CSE-MsgGUID: snAbwrXvRwmZ8vsX0xKhyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904830"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904830"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:18 -0700
X-CSE-ConnectionGUID: KCHs4YQfTemmi37YtkxQAQ==
X-CSE-MsgGUID: dZIyy0mYT5eWERkom9ZXWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944336"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 39/43] drm/xe/gt_idle: Convert register access to use xe_mmio
Date: Tue,  3 Sep 2024 17:21:40 -0700
Message-ID: <20240904002100.2023834-84-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/xe/xe_gt_idle.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 67aba4140510..2d3e72118368 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -98,6 +98,7 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
 void xe_gt_idle_enable_pg(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_mmio *mmio = &gt->mmio;
 	u32 pg_enable;
 	int i, j;
 
@@ -124,11 +125,11 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 		 * GuC sets the hysteresis value when GuC PC is enabled
 		 * else set it to 25 (25 * 1.28us)
 		 */
-		xe_mmio_write32(gt, MEDIA_POWERGATE_IDLE_HYSTERESIS, 25);
-		xe_mmio_write32(gt, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
+		xe_mmio_write32(mmio, MEDIA_POWERGATE_IDLE_HYSTERESIS, 25);
+		xe_mmio_write32(mmio, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
 	}
 
-	xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
+	xe_mmio_write32(mmio, POWERGATE_ENABLE, pg_enable);
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
 
@@ -140,7 +141,7 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
 	xe_device_assert_mem_access(gt_to_xe(gt));
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
 
-	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
+	xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, 0);
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
@@ -260,9 +261,9 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
 		return;
 
 	/* Units of 1280 ns for a total of 5s */
-	xe_mmio_write32(gt, RC_IDLE_HYSTERSIS, 0x3B9ACA);
+	xe_mmio_write32(&gt->mmio, RC_IDLE_HYSTERSIS, 0x3B9ACA);
 	/* Enable RC6 */
-	xe_mmio_write32(gt, RC_CONTROL,
+	xe_mmio_write32(&gt->mmio, RC_CONTROL,
 			RC_CTL_HW_ENABLE | RC_CTL_TO_MODE | RC_CTL_RC6_ENABLE);
 }
 
@@ -274,6 +275,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt)
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return;
 
-	xe_mmio_write32(gt, RC_CONTROL, 0);
-	xe_mmio_write32(gt, RC_STATE, 0);
+	xe_mmio_write32(&gt->mmio, RC_CONTROL, 0);
+	xe_mmio_write32(&gt->mmio, RC_STATE, 0);
 }
-- 
2.45.2

