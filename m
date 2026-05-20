Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406B8CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 11:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14F710F001;
	Wed, 20 May 2026 11:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OyxemmTy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E97F10F001
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 11:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779277190; x=1810813190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CIwZf0MZir1vOGlMO8VBUBZY8HggOFCIfQuOIf/4pJQ=;
 b=OyxemmTyvu3L+5C+Sei0tX1XR1+4sSs4iLSTlezjH0Mt7YciBAcKbGL0
 7yTK20YFWgzlH9tIVJwrQSRho/BDvnH4tXeRn8bOAKE3uZjyFy5sVrEno
 HHrc0e/Ze0euSzOD30khmptm3Y+oYtnF7NhMdotl7pz66nkfT5XCowRYH
 P6icHz/HOvSFfgD7OC2eVTs+w0NYCq9byiWtHVip6B/Ahy+id4gS0/H46
 xsOnJ9YTInJE8iFez1weR6TdaBYa+27o+SUi9tmxTtJnnX5/wABHGsMOg
 EEWGS3a1in3aNfGP1/C5N4p69laXjJoTkn+g6l2yBM8IO9TKTeIvWBVYx Q==;
X-CSE-ConnectionGUID: DWEPx3N7Qem7qH3sOipCBQ==
X-CSE-MsgGUID: FGZxOeNWQm6HoCijBJkkiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80023174"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="80023174"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 04:39:50 -0700
X-CSE-ConnectionGUID: n1cGqCCUQJOcEzMQIzZoMw==
X-CSE-MsgGUID: 9LOd8GraREyOuiRxPgb8NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="233792305"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 20 May 2026 04:39:48 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 5/5] drm/xe/hw_error: Allow debugging hardware errors
Date: Wed, 20 May 2026 17:04:10 +0530
Message-ID: <20260520113622.171462-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520113622.171462-1-raag.jadav@intel.com>
References: <20260520113622.171462-1-raag.jadav@intel.com>
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
debug cases. Wedge the device for the platforms with System Controller
so that hardware errors are available to the user for debugging.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Explain the usecase (Matt Roper)
v3: Fix runtime survivability regression (Riana)
---
 drivers/gpu/drm/xe/xe_hw_error.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 8f548e7f4b26..bcb2f9f113f4 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -177,6 +177,11 @@ static void hw_error_work(struct work_struct *work)
 	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work);
 	struct xe_device *xe = tile_to_xe(tile);
 
+	if (xe->info.has_sysctrl) {
+		xe_device_declare_wedged(xe);
+		return;
+	}
+
 	xe_survivability_mode_runtime_enable(xe);
 }
 
@@ -437,6 +442,19 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
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

