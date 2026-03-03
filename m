Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68393EC1430
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 11:08:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2792710E79B;
	Tue,  3 Mar 2026 11:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJ9CCTpr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D8D10E79B;
 Tue,  3 Mar 2026 11:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772536125; x=1804072125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZDHVkna6gAiaGZuv6R5i1Hi9y2BToHfaq6PzsBzIMgs=;
 b=LJ9CCTprNp0wi7gFxX033Rwu0QN/MUHC/x/G+Mu6dH7gXb2TOiHu923T
 LrbTUffZGJwBhzbJmv3hKJU/HxcSbZOIDvzBZK0j799mIWFcYviwEj8EQ
 wevrOS7R850C6VqN8hlcX8Z4SSfJ+qqA/qQMmkEfje7v7ckpl6Jh8O+wG
 nHdj20lEpXAjIoPcJxCxfc0+QP8MjliGqVenrqIlFH3RgKMXAr2XttRuR
 fgj0Efx1xCp2I7GZYtCt1oVTMG4bpSI5RZZp5OuHyGwZm/mYWUCsGSca6
 WD7QhdpPytRbZbrraN8p8FBqoQpLcUWys6HrVy1eGrTbCU5qGigdPh5lc Q==;
X-CSE-ConnectionGUID: AmaY1lVVRuu3pHXwKYA+dQ==
X-CSE-MsgGUID: m0JXUE37SjuNwbFdi853qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77410125"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="77410125"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 03:08:45 -0800
X-CSE-ConnectionGUID: 6OK3oXk6TW24sD1QMwtA7g==
X-CSE-MsgGUID: qwglBkurRLOU2nztCz8adQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="248460038"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa002.jf.intel.com with ESMTP; 03 Mar 2026 03:08:42 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 christian.koenig@amd.com, andrealmeid@igalia.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 3/3] drm/xe: Send 'none' recovery method for
 XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
Date: Tue,  3 Mar 2026 16:35:19 +0530
Message-ID: <20260303110556.3577612-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303110556.3577612-1-raag.jadav@intel.com>
References: <20260303110556.3577612-1-raag.jadav@intel.com>
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

