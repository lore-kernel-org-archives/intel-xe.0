Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCB5C79FA0
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 08:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52C58928D;
	Mon,  7 Sep 2026 08:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XeX7CdRO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BFC8928D
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 08:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788770173; x=1820306173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FlM2crE4mhq4NGV6X5i+JtKM7wQLMnUugDJVQCZJ6lI=;
 b=XeX7CdRO88m7q3SNLbpQHfcbce6h7VnAL2hOoncTmaN4wXIJdtlYck6/
 5gz4mktROeEeBwlEsB3gOPhaAY73Q/cyKfn3MYJpQeYbN46YwqMRYEkvx
 tZavIsJ1TKaw48jvXdyK2RQnB+VQDuOHCzLq9XNC5pzpVV0TkVzzL4oEV
 J3lb00BnLZ+DwekgbmZPF3v52eJ7DdawTNutrtUeTgafe9L3fmaxKJsBN
 jTUePXs0aWf90g8r/jztc6KcGoG+KbvNuRsY/zuqAmaTvkr8EfK4vlH/X
 kjQngKpGCwvwONzHPKwtTKE6ehswEAFNlLENatO9bN/BQiCbCGnnDPNwY A==;
X-CSE-ConnectionGUID: 5VtGBtLNT3OKy2UfnFAk6g==
X-CSE-MsgGUID: 3eL7L0xtR4+f6hAjyG8o3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="76725975"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="76725975"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:36:12 -0700
X-CSE-ConnectionGUID: P5nE2zQjRSy09kYr5DOYVA==
X-CSE-MsgGUID: FHuttJw7Qq6ShmZ2JMGbEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274451020"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 07 Sep 2026 01:36:11 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 2/5] drm/xe: Move xe_device_wedged_fini() registration to
 xe_device_probe_early()
Date: Mon,  7 Sep 2026 14:04:37 +0530
Message-ID: <20260907083541.2194747-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907083541.2194747-1-raag.jadav@intel.com>
References: <20260907083541.2194747-1-raag.jadav@intel.com>
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
---
v2: Split fixes into separate patches (Rodrigo, Michal)
---
 drivers/gpu/drm/xe/xe_device.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8583b2e9ecf4..c4194507118b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -770,6 +770,8 @@ static int xe_device_vram_alloc(struct xe_device *xe)
 	return 0;
 }
 
+static void xe_device_wedged_fini(struct drm_device *drm, void *arg);
+
 /**
  * xe_device_probe_early: Device early probe
  * @xe: xe device instance
@@ -838,6 +840,10 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
@@ -1156,10 +1162,6 @@ int xe_device_probe(struct xe_device *xe)
 
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

