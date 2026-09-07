Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C97C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 08:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C39A10E6E5;
	Mon,  7 Sep 2026 08:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJsIKyBo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508E810E6D6
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 08:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788770175; x=1820306175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qJ3l49fkzTytkIifAoWUY1EAprjJGcWc88p6CEO6KxQ=;
 b=WJsIKyBo39qnKYtCeGWp8Qre3tOlwtTxKNc99UievrnUwq9ARTRwrdJE
 mqWy7UMvTw2iLAjdsoHMEfrYOwh2fP2GO3RmAf/nCXjIgaJC3i4Lh085n
 nFvb9RW6bSgCHAjDH/9mwLJkj1hwsWagviboFON575dbIHjstsOJRqAGY
 UwJzPD/jqiL0XsmK2RFHgDDAp8mZ2suyWFb7VpGUq64pOhAJIjX54kj2j
 4t8b4ELqmdQp05HfBrnGDv5U+XBU+r0h6jeFteTP9cTVv/dFwjpWCvz0o
 setEciKeqRia/BpitfLEEn+j3Uf/IvTgV7w0Lp5pjtF3qxodSvuAe3qk8 Q==;
X-CSE-ConnectionGUID: B7fTDZKTTCixzHZN5w+mJw==
X-CSE-MsgGUID: HDKyE9QbQD+AsIBMiIchzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="76725977"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="76725977"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:36:15 -0700
X-CSE-ConnectionGUID: okzpCimpSvWfP72e1j3GOw==
X-CSE-MsgGUID: WHdqNsXzShSYlr19M8DtLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274451033"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 07 Sep 2026 01:36:13 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 3/5] drm/xe: Make xe_device_declare_wedged() IRQ safe
Date: Mon,  7 Sep 2026 14:04:38 +0530
Message-ID: <20260907083541.2194747-4-raag.jadav@intel.com>
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
v2: Split fixes into separate patches (Rodrigo, Michal)
---
 drivers/gpu/drm/xe/xe_device.c       | 51 +++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 2 files changed, 34 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c4194507118b..1daa02d39f3a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -770,8 +770,16 @@ static int xe_device_vram_alloc(struct xe_device *xe)
 	return 0;
 }
 
+static void wedged_work(struct work_struct *work);
 static void xe_device_wedged_fini(struct drm_device *drm, void *arg);
 
+static int xe_device_wedged_init(struct xe_device *xe)
+{
+	INIT_WORK(&xe->wedged.work, wedged_work);
+
+	return drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
+}
+
 /**
  * xe_device_probe_early: Device early probe
  * @xe: xe device instance
@@ -840,7 +848,7 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
+	err = xe_device_wedged_init(xe);
 	if (err)
 		return err;
 
@@ -1453,6 +1461,26 @@ void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
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
 
@@ -1493,26 +1521,11 @@ void xe_device_declare_wedged(struct xe_device *xe)
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

