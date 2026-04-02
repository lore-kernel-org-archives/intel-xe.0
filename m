Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4818D6AAF4
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 17:46:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6992510F071;
	Thu,  2 Apr 2026 17:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLCGVCsE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932E510F071
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 17:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775152007; x=1806688007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=36PqOZQfN1DKwP5aLDSTAM8yIq8ucYZgkTiw5k2m9X4=;
 b=bLCGVCsENRH7uNRsH5Z0ux4072Rh1gZ5z1vu0y0G/RNGqLwPbiNB2QdD
 COdkLExZ144yWBEE54a5bCL2NNzM6m5VOtQKOKSv1Cbfiv0OSc+iTFqn8
 ptlTwe+o7W4PGXBdUafKCDgyi6jdQzxZN65HM9Lp5OwXlJjA+9NNDqk7q
 fVJhHTh1dC9LgJ5NhWkMAmE+Yn+tRusVA7pFAoDY3R3XNXAnGeqSrjBNG
 GcebQXOH0gYvk4rOrjmmD7qIrPKzarZ/GJVF7Fclc4BNTZoS1tqrWGPIU
 uQ4zUEXqt1I7OJKYBuPQdBOWHUbAmvSbbSjCLY42HJZGwE2NtzwE7KF/9 w==;
X-CSE-ConnectionGUID: /s+d2X3KToa7xIdwTfSEmg==
X-CSE-MsgGUID: gsnZ80IcRjyVo81KKXyZcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93612127"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="93612127"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 10:46:36 -0700
X-CSE-ConnectionGUID: rNcmjd0ETPid/cFMEsOyUw==
X-CSE-MsgGUID: 4a2uhdVPTjm5wt11871blQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="226209503"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa010.jf.intel.com with ESMTP; 02 Apr 2026 10:46:33 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 3/4] drm/xe/hw_error: Allow debugging hardware errors
Date: Thu,  2 Apr 2026 23:12:28 +0530
Message-ID: <20260402174229.1062874-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402174229.1062874-1-raag.jadav@intel.com>
References: <20260402174229.1062874-1-raag.jadav@intel.com>
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

Hardware errors are reported through System Controller on the platforms
that support it, and never routed as direct IRQ to SGUnit other than
debug cases. Wedge the device on XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
so that the hardware errors are available to the user for debugging.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Explain the usecase (Matt Roper)
---
 drivers/gpu/drm/xe/xe_hw_error.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index c7b720ba5a4f..79a85925a02f 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -169,11 +169,14 @@ static void hw_error_work(struct work_struct *work)
 {
 	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work);
 	struct xe_device *xe = tile_to_xe(tile);
-	int ret;
+	bool wedge = xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET;
 
-	ret = xe_survivability_mode_runtime_enable(xe);
-	if (ret)
-		drm_err(&xe->drm, "Failed to enable runtime survivability mode\n");
+	if (wedge) {
+		xe_device_declare_wedged(xe);
+		return;
+	}
+
+	xe_survivability_mode_runtime_enable(xe);
 }
 
 static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
@@ -433,6 +436,19 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 	if (!IS_DGFX(xe))
 		return;
 
+	if (xe->info.has_sysctrl) {
+		/*
+		 * Hardware errors are reported through System Controller on the platforms that
+		 * support it, so we should never be here other than debug cases. Retain the
+		 * hardware state and bail without clearing error registers, so that they are
+		 * available to the user for debugging.
+		 */
+		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported %s error\n",
+				    tile->id, severity_str);
+		schedule_work(&tile->hw_error_work);
+		return;
+	}
+
 	spin_lock_irqsave(&xe->irq.lock, flags);
 	err_src = xe_mmio_read32(&tile->mmio, DEV_ERR_STAT_REG(hw_err));
 	if (!err_src) {
-- 
2.43.0

