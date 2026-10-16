Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BBCCCA462
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:27:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E450B112613;
	Fri, 16 Oct 2026 07:27:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126BC112613
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135636; x=1823671636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hNVkAnNjcItkqPVfoS8ZKQrKnYxHYuQrJrbNNOGaJZ0=;
 b=Vgrn24MQqjduZAo97zZuwjcKykKYLVDvFoeQcTcvS7BdbvB576Rejb86
 SLtxT3LnEp102UJeZqrj/cqSMuxZuLyyhV8el7B/F9TGben3UErRP97Si
 uK+SwLrSNAqRgORrdPI1D4cneqLiDCqIE9Q4Fjwn/lfTabZTi/Wk0zceP
 xd6dKwdx/Hu74CnlbOE+6B99+7cxfpg+lq8SOX7WYlI3Pv38jPc4HsWZQ
 rvv/4oU7rRiEmZsAd2MqWHV04dfkcfwoBGorN0uWqJPpL5LF8BxbjRE9U
 yOz7d6bpyWweR5oBJsVx2xtBhfZJ5ylfnvRr0B5JhVdcFvigqhNMVU3iq w==;
X-CSE-ConnectionGUID: N6hMkDuMSs+zq1q/RIo+Jw==
X-CSE-MsgGUID: 4EncyR/bT4yD+oAwrywSlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="806147"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="806147"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:27:16 -0700
X-CSE-ConnectionGUID: 5hrEMCYeRZusAZBnAJQ7lA==
X-CSE-MsgGUID: ++AGsGMCTsmeB1HJ7WDXhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="3673951"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa013.fm.intel.com with ESMTP; 16 Oct 2026 00:27:12 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v10 5/9] drm/xe: Make xe_device_declare_wedged() IRQ safe
Date: Fri, 16 Oct 2026 12:55:59 +0530
Message-ID: <20261016072623.457392-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016072623.457392-1-raag.jadav@intel.com>
References: <20261016072623.457392-1-raag.jadav@intel.com>
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
v7: Retain xe_pm_runtime_get_noresume() in IRQ context (Rodrigo)
---
 drivers/gpu/drm/xe/xe_device.c       | 31 +++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b185c7d33185..0cab9044691e 100644
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
 
@@ -1384,6 +1392,14 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
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
 
@@ -1423,22 +1439,21 @@ void xe_device_declare_wedged(struct xe_device *xe, unsigned long method)
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
index 5553415afeaf..039bf13a2581 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -552,6 +552,8 @@ struct xe_device {
 		unsigned long method;
 		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
 		bool inconsistent_reset;
+		/** @wedged.work: Worker to defer non-atomic calls */
+		struct work_struct work;
 	} wedged;
 
 	/** @devres_group: devres group */
-- 
2.43.0

