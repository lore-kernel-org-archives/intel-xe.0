Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D517E68174
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 11:51:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46DD10E24D;
	Tue, 17 Feb 2026 11:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tje44bmJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B3610E24D
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Feb 2026 11:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771329068; x=1802865068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Vm4wynHTwfb7q5WYweLECMuUHq0k0fgLDlt2vChoxc=;
 b=Tje44bmJw9tm7+yM+zV4rvwJjGH8ERo2/dY0zUPZcqGbH+TCYhgTT3pw
 7LknI5FiLT2rUXZo+fF4agPjRwadoWxLYpJxlCyZzEz+KwDjivPIKkrcv
 OAp4XnWlg/M+dB1pIl54N8gpi23wz1ZS8kCD/QOFIcWKc9Zv1ZLtQnKsC
 IijZUGr9eC+04A0ICUbDUNHOFDBhiqQGMZUAc1tzygeYfn/cL3Umg7JI/
 c8cBuK3Lzyd+xE/Z31aXtPtK9TVFTfhX27Cm1IGDPdRdfIxpHb6CLhidM
 NqDwPkwlzCs/nX50+PMj767rlm/5Ext0PxCAl5kWKUD/e12KpX/RVWrUq w==;
X-CSE-ConnectionGUID: n4Tg2uDOSEW/Jr0v/oTz6A==
X-CSE-MsgGUID: oWphMM1HQ6+F2JAKNg+wlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83495374"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="83495374"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 03:51:08 -0800
X-CSE-ConnectionGUID: Rr/rvryBRVumToxz3GM3ow==
X-CSE-MsgGUID: 1MAXa6bNQs+SFdw45EGAoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="251546422"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 17 Feb 2026 03:51:05 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 3/3] drm/xe/cri: Wedge the device on hardware error
Date: Tue, 17 Feb 2026 17:16:33 +0530
Message-ID: <20260217114656.2546878-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260217114656.2546878-1-raag.jadav@intel.com>
References: <20260217114656.2546878-1-raag.jadav@intel.com>
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

Hardware error interrupts are routed to SGUnit only for debug cases on
Crescent Island. Wedge the device and have it available to the user for
debugging.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index b704eab7d3bd..b756cbe321d6 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -55,11 +55,11 @@ static void hw_error_work(struct work_struct *work)
 {
 	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work);
 	struct xe_device *xe = tile_to_xe(tile);
-	int ret;
 
-	ret = xe_survivability_mode_runtime_enable(xe);
-	if (ret)
-		drm_err(&xe->drm, "Failed to enable runtime survivability mode\n");
+	if (xe->info.platform == XE_CRESCENTISLAND)
+		xe_device_declare_wedged(xe);
+	else if (xe->info.platform == XE_BATTLEMAGE)
+		xe_survivability_mode_runtime_enable(xe);
 }
 
 static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
@@ -104,6 +104,17 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 	unsigned long flags;
 	u32 err_src;
 
+	/*
+	 * We should never be here for CRI other than debug cases, so retain the hardware
+	 * state and bail without clearing error registers.
+	 */
+	if (xe->info.platform == XE_CRESCENTISLAND) {
+		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported %s error\n",
+				    tile->id, hw_err_str);
+		schedule_work(&tile->hw_error_work);
+		return;
+	}
+
 	if (xe->info.platform != XE_BATTLEMAGE)
 		return;
 
-- 
2.43.0

