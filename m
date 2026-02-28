Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302CDFEE4CD
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 07:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8CB10E1DD;
	Sat, 28 Feb 2026 07:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BbZSiqbX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6E310E1DD
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Feb 2026 07:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772265445; x=1803801445;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xcvftwb5KNTfOQg9hEyVkNv+CgwG8cJ2OkMWIxm6pOg=;
 b=BbZSiqbX8+tN/kVNIpT5Llbqo7RXk8XPfS6R7ry12XGUoBdhWJxvdCeW
 dG6RyRhHZUfrnNlqoJ1jPVYcPG0tm5TT/kHHPnSpLFva5WQ/wPiFp8Ngm
 sodE29FV26Vs0ccyLLpRsyh+x25bf0sIVIjayWSgp3J3bmz8VfbPzWQ3v
 0eKz/wBsuhU1ELzFgrYNOAeWb47QyD/wOmTNO/lxXwgqcB5Ru4oC7JTUC
 kg4p/NFuYAvukI83TIjdn0B06ZinY7Xy0cr//BblGXOGMBfN2I0Go0apC
 UE1Q3ZTc3NLjM5g3tUUCr+X6fNzVnl1HkBittLOCVSvTmZNih3ySppyQo A==;
X-CSE-ConnectionGUID: npto6bdwR8W2jdGktmNP6Q==
X-CSE-MsgGUID: fU40IKTLQyShjb2WrwD42A==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73410013"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="73410013"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 23:57:24 -0800
X-CSE-ConnectionGUID: NVQUgB34Rr2dl9Tp9z8m5g==
X-CSE-MsgGUID: xjyTTLE9TXqmnkuOQnfE0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="222099238"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 27 Feb 2026 23:57:21 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 lukasz.laguna@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe: Send 'none' recovery method for
 XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
Date: Sat, 28 Feb 2026 13:21:17 +0530
Message-ID: <20260228075454.3434460-1-raag.jadav@intel.com>
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
so wedge the device with 'none' recovery method and have it available
to the user for debugging.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Use 'none' instead of 'unknown' recovery method (Rodrigo)
---
 drivers/gpu/drm/xe/xe_device.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4b68a2d55651..7f74bbbc7d2c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1318,8 +1318,15 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		xe_gt_declare_wedged(gt);
 
 	if (xe_device_wedged(xe)) {
+		/*
+		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
+		 * hangs, so wedge the device with 'none' recovery method and have
+		 * it available to the user for debugging.
+		 */
+		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
 		/* If no wedge recovery method is set, use default */
-		if (!xe->wedged.method)
+		else if (!xe->wedged.method)
 			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
 						    DRM_WEDGE_RECOVERY_BUS_RESET);
 
-- 
2.43.0

