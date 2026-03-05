Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F1CF30956
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 13:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42AA10E2A0;
	Thu,  5 Mar 2026 13:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/7VDc87";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A3710E2A0;
 Thu,  5 Mar 2026 13:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772716251; x=1804252251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xyp0I5nM/V9aCGR3q/nWuUF0LomxAfVvnwwPsOhYuEs=;
 b=R/7VDc87NCIipXTXpuyg1kf57/cDj0TEOjw01jXLDGDjbtW/8hCsoZLh
 EgHP8KyrACLqoGMAJeh2EgpXJ5WEdnfytQAVy5SVjgKCpp/QIVxH27vxs
 3Asj5fHVk4xB1DnCACUGWEQawi/CRF4iRvTgdhZcZNzbAJpI2R6CIipSk
 H7nA7I4qUYLfxv5S3ToU8BHREBORdHsJHdyTkUgXrbhksEuw9NGQGLYT2
 AYtb8tBSbt98Znep+Iz6qE7Dl1VjBgWlomaer8huvJLWT0b3V7jYa0roK
 U7EKBKLf/nV5sfeky1Z+UI4/LBwSq4I9hTg7r50teDsXY1kj52DKVL6fg g==;
X-CSE-ConnectionGUID: 4vTjCb4+Q4WSprWISByfHQ==
X-CSE-MsgGUID: 9SzVka7vQz+G2f2HdVMsQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="96418676"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="96418676"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:10:50 -0800
X-CSE-ConnectionGUID: ib6KrQVFT3ayhVBtC+H0cg==
X-CSE-MsgGUID: uOoAkSw4RX+y7kUC1UcHWQ==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 05 Mar 2026 05:10:47 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 christian.koenig@amd.com, andrealmeid@igalia.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 3/3] drm/xe: Send 'none' recovery method for
 XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
Date: Thu,  5 Mar 2026 18:36:49 +0530
Message-ID: <20260305130720.3685754-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305130720.3685754-1-raag.jadav@intel.com>
References: <20260305130720.3685754-1-raag.jadav@intel.com>
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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c137dc0a1840..eeb626737760 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1329,8 +1329,15 @@ void xe_device_declare_wedged(struct xe_device *xe)
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

