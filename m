Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F9CCCF2D4
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 02:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AE410E772;
	Mon, 19 Oct 2026 02:37:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B844D10E76F
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 02:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792377461; x=1823913461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eZwww6RixpMJKg7J7PCoslcbQd2wEKTr1aQVWb3P1Ys=;
 b=CuMYTEX87VlrZ8gTfa+rrCotQKUihoebszDXd8ur3gO3yqPU1EYwMJ0r
 iGBkdjWzfOxedtjNQHvmmVVLdwQfp3yEo6njneEReLuWrvvkEbgSA2Gwg
 6rB9S9LhxoTZeml+mdk5OYyLe4FNqBR0NfoXn7a2fCbum0kZhc6UbNJAH
 Rrk31ImAJ6ykMKe8ogft0FKUTrmgVnTdvnbokBjSijonB+ZGsZSVtI3i7
 AFgHjQFr+auPthQldKHsSPOopziyI90aEaulGHQTst80/q3s0Ye1NrCwl
 7jWEe/ux4TiXFcwtAkyRudhPuRs3eDJ7kB1SQubBgbTp1bxEHtNBme0gt g==;
X-CSE-ConnectionGUID: syKgcPPrQ0+wBhv0Nze5uA==
X-CSE-MsgGUID: q37x/nKIRkKUb0s7XR2xYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="943666"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="943666"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2026 19:37:41 -0700
X-CSE-ConnectionGUID: i4tS+v10SOKc+nOhOf01kQ==
X-CSE-MsgGUID: NjzZSiNZQNyQ8x2BY9VsYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2526470"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 18 Oct 2026 19:37:39 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v12 4/9] drm/xe: Move xe_device_wedged_fini() registration to
 xe_device_probe_early()
Date: Mon, 19 Oct 2026 08:06:35 +0530
Message-ID: <20261019023708.128835-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019023708.128835-1-raag.jadav@intel.com>
References: <20261019023708.128835-1-raag.jadav@intel.com>
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
index cf0235e57827..b185c7d33185 100644
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
@@ -1099,10 +1105,6 @@ int xe_device_probe(struct xe_device *xe)
 
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

