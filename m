Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821B7CC6B24
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 05:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDB510FACD;
	Wed, 14 Oct 2026 05:52:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCC110FACD
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 05:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791957168; x=1823493168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1G46yBMMF9B13ShdEDyY4ZMln56Y3To78hwjnxqYvHg=;
 b=RYxRx+Zah6lI2k3BDRF3zIb/iGLCkEialrsh05/benc7LeY4Y8X0b2BB
 ceyB0yhWaNHsBpFWt0mVGMg7jDteSZiS76FGYz8xsX647bti5k53N8Bi7
 mftOg0kswd7pIGCbVzhGxIaORUTlu0m4q9XhAwmov7Ap3pDR9d1UYlqjn
 DVmGvEyrGwCetH2lQE6pjDjc/SOv99NRwf2F6kKkmn+wT+XAh9JBhWvfV
 3WBzbgW/UUh5KvSIfhABEO9KOBwcKOhz6fEc90mSrqHPODf4PTM10TMEy
 qQJky80GkAsWvli6J+nRQlhQK3GgXTKbYPmUCNOWqfbSwvS4woQ3R27wD A==;
X-CSE-ConnectionGUID: SYD04Rb3RfWA3PQTG2n1QA==
X-CSE-MsgGUID: wLPIpMHIRVSoGYCPLI/Wfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="679839"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="679839"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 22:52:48 -0700
X-CSE-ConnectionGUID: wkJa3P1bScSHvaQPHF4ftg==
X-CSE-MsgGUID: zl7qqf2tSb+QwHwtbpJb9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1675772"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 13 Oct 2026 22:52:46 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v6 4/7] drm/xe: Make xe_device_declare_wedged() IRQ safe
Date: Wed, 14 Oct 2026 11:21:21 +0530
Message-ID: <20261014055215.330408-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014055215.330408-1-raag.jadav@intel.com>
References: <20261014055215.330408-1-raag.jadav@intel.com>
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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v2: Split fixes into separate patches (Rodrigo, Michal)
v5: Drop IRQ safe wedging for its flawed design
v6: Include IRQ safe wedging with redesign
---
 drivers/gpu/drm/xe/xe_device.c       | 33 ++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d05d2791b9a0..b7461edad5ad 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -697,8 +697,16 @@ static int xe_device_vram_alloc(struct xe_device *xe)
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
@@ -767,7 +775,7 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
+	err = xe_device_wedged_init(xe);
 	if (err)
 		return err;
 
@@ -1380,6 +1388,14 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
  *   firmware and restore device to normal operation.
  */
 
+static void wedged_work(struct work_struct *work)
+{
+	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
+
+	/* Notify userspace of wedged device */
+	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
+}
+
 #define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
 #define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
 
@@ -1412,29 +1428,28 @@ void xe_device_declare_wedged(struct xe_device *xe, unsigned long method)
 
 	if (!atomic_xchg(&xe->wedged.flag, 1)) {
 		xe->needs_flr_on_fini = true;
-		xe_pm_runtime_get_noresume(xe);
+		pm_runtime_get_noresume(xe->drm.dev);
 
 		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
 		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
 			    "For recovery procedure, refer to %s\n"
 			    "Please file a _new_ bug report at %s\n",
 			    WEDGED_URL, XE_BUG_URL);
-	}
 
-	for_each_initialized_gt(gt, xe, id)
-		xe_gt_declare_wedged(gt);
+		for_each_initialized_gt(gt, xe, id)
+			xe_gt_declare_wedged(gt);
 
-	if (xe_device_wedged(xe)) {
 		/*
 		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
 		 * hangs, so wedge the device with 'none' recovery method and have
 		 * it available to the user for debugging.
 		 */
 		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
-			method = DRM_WEDGE_RECOVERY_NONE;
+			xe->wedged.method = DRM_WEDGE_RECOVERY_NONE;
+		else
+			xe->wedged.method = method;
 
-		/* Notify userspace of wedged device */
-		drm_dev_wedged_event(&xe->drm, method, NULL);
+		schedule_work(&xe->wedged.work);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4e0e1bc040c1..ec5c1f0b8f00 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -547,6 +547,8 @@ struct xe_device {
 		unsigned long method;
 		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
 		bool inconsistent_reset;
+		/** @wedged.work: Worker for wedge handling */
+		struct work_struct work;
 	} wedged;
 
 	/** @devres_group: devres group */
-- 
2.43.0

