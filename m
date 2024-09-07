Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597ACEB64CB
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F45010EB47;
	Sat,  7 Sep 2024 00:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+wb/SDh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9574E10EB2C
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667679; x=1757203679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AZ6iGNDzqgjybKxjvfeW3ZzOQLaIJX+37Boe+I4YMbc=;
 b=O+wb/SDhkUVN9mQnyWRSE+CxkOTX9dJAQP0HFNf0FPGtwdR+tFryMHUj
 qmbDtgwu9oWPNkR2FlN9ua4IKLJNIgqLAVCb+XDQDccvlExu4ZTYyzPam
 a812JMzt+Zjm9vhAhGfvtClKEeLeKvueavbMlwvNCeV6Q4/0gkGB41Qn9
 7tuSlVYSXmgmWdBfBMvUzE0A7XeSNxqGzejws7XyTmOdYAErIa36b8/g4
 hCmheQEjTgt4VVDme/7fSdi2Zl2y/lCaBRMSnaKM0bhXMVC67U04jQcgb
 7UlD8rrSQ/E9r/faOgdhbShIs1+GelHSOASrBNuyH5evtc4ulQPAeIj6M w==;
X-CSE-ConnectionGUID: /4VKl3r2QTuGpqWjt7N/ag==
X-CSE-MsgGUID: wz0lLK7fRFmWk6rNlEKDfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855329"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855329"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: pLQy4QbMTb2xLUhukl1QuA==
X-CSE-MsgGUID: ppekRCFVRJu47Bu4KLeYbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792736"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 39/43] drm/xe/gt_idle: Convert register access to use
 xe_mmio
Date: Fri,  6 Sep 2024 17:08:28 -0700
Message-ID: <20240907000748.2614020-84-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/xe/xe_gt_idle.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 85a35ed153a3..531924b6c0a1 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -104,6 +104,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_gt_idle *gtidle = &gt->gtidle;
+	struct xe_mmio *mmio = &gt->mmio;
 	u32 vcs_mask, vecs_mask;
 	int i, j;
 
@@ -137,11 +138,11 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 		 * GuC sets the hysteresis value when GuC PC is enabled
 		 * else set it to 25 (25 * 1.28us)
 		 */
-		xe_mmio_write32(gt, MEDIA_POWERGATE_IDLE_HYSTERESIS, 25);
-		xe_mmio_write32(gt, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
+		xe_mmio_write32(mmio, MEDIA_POWERGATE_IDLE_HYSTERESIS, 25);
+		xe_mmio_write32(mmio, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
 	}
 
-	xe_mmio_write32(gt, POWERGATE_ENABLE, gtidle->powergate_enable);
+	xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
 
@@ -156,7 +157,7 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
 	gtidle->powergate_enable = 0;
 
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
-	xe_mmio_write32(gt, POWERGATE_ENABLE, gtidle->powergate_enable);
+	xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
 
@@ -216,8 +217,8 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 		if (err)
 			return err;
 
-		pg_enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
-		pg_status = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
+		pg_enabled = xe_mmio_read32(&gt->mmio, POWERGATE_ENABLE);
+		pg_status = xe_mmio_read32(&gt->mmio, POWERGATE_DOMAIN_STATUS);
 
 		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 	}
@@ -361,9 +362,9 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
 		return;
 
 	/* Units of 1280 ns for a total of 5s */
-	xe_mmio_write32(gt, RC_IDLE_HYSTERSIS, 0x3B9ACA);
+	xe_mmio_write32(&gt->mmio, RC_IDLE_HYSTERSIS, 0x3B9ACA);
 	/* Enable RC6 */
-	xe_mmio_write32(gt, RC_CONTROL,
+	xe_mmio_write32(&gt->mmio, RC_CONTROL,
 			RC_CTL_HW_ENABLE | RC_CTL_TO_MODE | RC_CTL_RC6_ENABLE);
 }
 
@@ -375,6 +376,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt)
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return;
 
-	xe_mmio_write32(gt, RC_CONTROL, 0);
-	xe_mmio_write32(gt, RC_STATE, 0);
+	xe_mmio_write32(&gt->mmio, RC_CONTROL, 0);
+	xe_mmio_write32(&gt->mmio, RC_STATE, 0);
 }
-- 
2.45.2

