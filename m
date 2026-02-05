Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D11EC1EA2
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 11:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E264910E86B;
	Thu,  5 Feb 2026 11:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQD3o/GF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7061210E86D
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 11:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770290565; x=1801826565;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KWBD5IHaqTke/VhrnHDaiTek/JJuVjGB9QMiopjUeZk=;
 b=ZQD3o/GFaAxdGNcHmz/8TD6fmvfO5T5R3C16juvby8Yq7c1DoTyOsHFC
 JSQXKxOEgR+aSTHgL9G6cpyLWn5+/R+FIImfhI/eQ1mqHF+it+CCBd6gd
 G9Ypl5KZoQXRVVnyYvSS9IUIilf2dFxqclR2IzOoZJV6LX9vI5gPEB63d
 376m+7jDxaGOcaXs0bfeF/l9bHDq7PCTeFC3UsfPeykuDrrv0eKtOSNKZ
 u1tD0b7QPxuKt7beI+Z4vLnMt2QOuajyt5ck2dp0Lyd7JQ1sdoH4oaNfn
 J+DgH30oODridV06uM9k44sjASFYqBh3rG3qLTaAxCJkgWkJplQAgOxjy A==;
X-CSE-ConnectionGUID: JQM4vXQ9TVO4mtLhzqGJLg==
X-CSE-MsgGUID: P1hq4z/WS8i32DCQqUxYIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75105892"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="75105892"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 03:22:45 -0800
X-CSE-ConnectionGUID: OwCmlwxBT1u5bAmgM6kpVA==
X-CSE-MsgGUID: r1vLdka9RMy8AoxClOWkRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="210572163"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 05 Feb 2026 03:22:43 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 lukasz.laguna@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe: Send unknown recovery method for
 XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
Date: Thu,  5 Feb 2026 16:48:35 +0530
Message-ID: <20260205111836.1628965-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging hangs,
so wedge the device without any recovery method (unknown) and have it
available to the user for debugging.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b1241fa4c3d6..815f0b0c9dfd 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1326,8 +1326,15 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		xe_gt_declare_wedged(gt);
 
 	if (xe_device_wedged(xe)) {
+		/*
+		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging hangs,
+		 * so wedge the device without any recovery method and have it available
+		 * to the user for debugging.
+		 */
+		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+			xe_device_set_wedged_method(xe, 0);
 		/* If no wedge recovery method is set, use default */
-		if (!xe->wedged.method)
+		else if (!xe->wedged.method)
 			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
 						    DRM_WEDGE_RECOVERY_BUS_RESET);
 
-- 
2.43.0

