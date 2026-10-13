Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6559CC6B0F
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 11:05:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF6910E7AB;
	Tue, 13 Oct 2026 11:05:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A84910E78B
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 11:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791889525; x=1823425525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aOu92lv1tdLKTGrz7sx8vAurh54WzkTvDn55M9BE8Ak=;
 b=lulMFrTg8nnyX1oYbbxw4UxV8W+kUlPTBW/U4u+eOlvN6gKk3667PZAd
 pnNbWxs3kwaZsb3d7J0lwhvTFNThM8iuXHX8ubOOi7wdj4ILhmCz1SnR5
 65HFcRey7PZfBdqxaUdJIJ7IjubXcVFkSv9MJhnBSTIcJtr5kLrHi1qv6
 Bko11j1PXVMG4oObC4JBLwF8Yvf9JzYP+R+8OclDvVgSGGV2tQ4215LCd
 nx/vXudP0lwvlWh4Xq6NIum21bLh2C9YKRaKO9cIoS6kP5YaUxcBThtAv
 E1uorWMpCo5goWFXDnkFgVuBNhMI+/gMO8Nu3FXDp4cCacHT8DudqJda6 g==;
X-CSE-ConnectionGUID: UgtjMhqjSMS/x3uLgD3T7g==
X-CSE-MsgGUID: 8rYDTBewQsOtEy5jV3rIYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="641593"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="641593"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 04:05:24 -0700
X-CSE-ConnectionGUID: ewunCpApRpq52BOWb5tjFg==
X-CSE-MsgGUID: L6RFFGklSuKYKeXcNPtBKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="2901418"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa013.fm.intel.com with ESMTP; 13 Oct 2026 04:05:22 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 3/5] drm/xe: Move xe_device_wedged_fini() registration to
 xe_device_probe_early()
Date: Tue, 13 Oct 2026 16:33:55 +0530
Message-ID: <20261013110439.181447-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013110439.181447-1-raag.jadav@intel.com>
References: <20261013110439.181447-1-raag.jadav@intel.com>
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

The device can be declared wedged while processing boot-time hardware
errors, which can result in PM reference leak if driver probe fails
before xe_device_wedged_fini() is registered.

Early register the required cleanup action and fix this.

Fixes: a7df563b45b0 ("drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v2: Split fixes into separate patches (Rodrigo, Michal)
---
 drivers/gpu/drm/xe/xe_device.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0d9ef4f1ab9a..f4bcc27f4b71 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -697,6 +697,8 @@ static int xe_device_vram_alloc(struct xe_device *xe)
 	return 0;
 }
 
+static void xe_device_wedged_fini(struct drm_device *drm, void *arg);
+
 /**
  * xe_device_probe_early: Device early probe
  * @xe: xe device instance
@@ -765,6 +767,10 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
@@ -1095,10 +1101,6 @@ int xe_device_probe(struct xe_device *xe)
 
 	detect_preproduction_hw(xe);
 
-	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
-	if (err)
-		goto err_unregister_display;
-
 	/*
 	 * Process and log any errors detected by hardware. Possible results can
 	 * include declaring the device as wedged, which must be done only after
-- 
2.43.0

