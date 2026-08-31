Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389D7C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 04:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18B810E5CC;
	Mon, 31 Aug 2026 04:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJXqAwoO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8717C10E5CC
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 04:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788150417; x=1819686417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o3HXXpYgea2sNrPdecxgh2btxWwm2jOhPvBQm+yMclg=;
 b=fJXqAwoO/i/Gf+nXPu7Tt+WtHn6b1omCEswGBCdWEslQgz+HsrxdQwyR
 RhT+Ia7qOhen02oZGSUcNB9zhYwG5DU/MLpsPHprLnvdV7e3jpmIQbbhI
 f896m5uty1Ja8Oru544mG5uerAXpX/JmOHRNIkuV4WEDpmPIxEnNW9VV2
 XfqITPhEoM0b/D+1iIaU4pjT5KMBqaYxtIPnnm18FokiMoNBhWLODQfQy
 ZNw7xphu/0eL/fbHxtDvI2liUo1pgn187G5obuJL1MnJ6PgGSRzlvv0Ib
 qB9yo0YADxNXkzRLb2lfwc3f6hAX4zyJpzS3iVabpxyLgx7KST02g9Ssj A==;
X-CSE-ConnectionGUID: rzgJMrcgQT21O3t3lHCzYQ==
X-CSE-MsgGUID: f4pJPDQOSj2vXIYkWTv1qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106072228"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="106072228"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 21:26:57 -0700
X-CSE-ConnectionGUID: MkJwxa8lRnuTlpABHR65aQ==
X-CSE-MsgGUID: qpUJJ3c/SNyw3Ukr7FsBXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="272878101"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 30 Aug 2026 21:26:54 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 2/5] drm/xe: Make xe_device_declare_wedged() IRQ safe
Date: Mon, 31 Aug 2026 09:55:50 +0530
Message-ID: <20260831042633.1760474-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831042633.1760474-1-raag.jadav@intel.com>
References: <20260831042633.1760474-1-raag.jadav@intel.com>
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

Currently, xe_device_declare_wedged() implementation wedges the GTs and
sends wedged uevent to userspace. This is problematic for usecases which
require declaring the device as wedged in IRQ context, as it allocates
memory for event buffer and acquires mutexes deep into it's call path.

Fix this by deferring wedge handling into its dedicated worker, so that
xe_device_declare_wedged() can be called in IRQ context.

First user of this requirement is introduced in commit def675cf3f10
("drm/xe/mert: Improve handling of MERT CAT errors"), which declares the
device as wedged on catastrophic errors received in form of an IRQ.

Fixes: def675cf3f10 ("drm/xe/mert: Improve handling of MERT CAT errors")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 54 ++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 2 files changed, 37 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 74d566693dfd..49e3f6f66588 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -924,14 +924,25 @@ static void detect_preproduction_hw(struct xe_device *xe)
 	}
 }
 
+static void wedged_work(struct work_struct *work);
+
 static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = arg;
 
+	disable_work_sync(&xe->wedged.work);
+
 	if (atomic_read(&xe->wedged.flag))
 		xe_pm_runtime_put(xe);
 }
 
+static int xe_device_wedged_init(struct xe_device *xe)
+{
+	INIT_WORK(&xe->wedged.work, wedged_work);
+
+	return drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
+}
+
 #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
 static int xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
 {
@@ -1148,7 +1159,7 @@ int xe_device_probe(struct xe_device *xe)
 
 	detect_preproduction_hw(xe);
 
-	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
+	err = xe_device_wedged_init(xe);
 	if (err)
 		goto err_unregister_display;
 
@@ -1443,6 +1454,26 @@ void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
 	xe->wedged.method = method;
 }
 
+static void wedged_work(struct work_struct *work)
+{
+	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
+
+	/*
+	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
+	 * hangs, so wedge the device with 'none' recovery method and have
+	 * it available to the user for debugging.
+	 */
+	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
+	/* If no wedge recovery method is set, use default */
+	else if (!xe->wedged.method)
+		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
+					    DRM_WEDGE_RECOVERY_BUS_RESET);
+
+	/* Notify userspace of wedged device */
+	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
+}
+
 #define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
 #define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
 
@@ -1483,26 +1514,11 @@ void xe_device_declare_wedged(struct xe_device *xe)
 			    "For recovery procedure, refer to %s\n"
 			    "Please file a _new_ bug report at %s\n",
 			    WEDGED_URL, XE_BUG_URL);
-	}
 
-	for_each_gt(gt, xe, id)
-		xe_gt_declare_wedged(gt);
+		for_each_gt(gt, xe, id)
+			xe_gt_declare_wedged(gt);
 
-	if (xe_device_wedged(xe)) {
-		/*
-		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
-		 * hangs, so wedge the device with 'none' recovery method and have
-		 * it available to the user for debugging.
-		 */
-		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
-			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
-		/* If no wedge recovery method is set, use default */
-		else if (!xe->wedged.method)
-			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
-						    DRM_WEDGE_RECOVERY_BUS_RESET);
-
-		/* Notify userspace of wedged device */
-		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
+		schedule_work(&xe->wedged.work);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 180d450a6deb..7d83f79f27f4 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -534,6 +534,8 @@ struct xe_device {
 		unsigned long method;
 		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
 		bool inconsistent_reset;
+		/** @wedged.work: Worker for wedge handling */
+		struct work_struct work;
 	} wedged;
 
 	/** @devres_group: devres group */
-- 
2.43.0

