Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB0A606A31D
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 05:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A1HxIu1h
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D245112322;
	Thu, 22 Oct 2026 05:13:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE1C112315
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 05:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792646017; x=1824182017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RTqrRHdHTd+zc3awJ34Z2B9aBqjtYKHOWOVGgWJKdfA=;
 b=A1HxIu1hNpyGkO78WjX0HjKl0EPlULkcIwP24wbYTi6vvsz45lH5TgX3
 9pS9WbWu8yH9cHGAJuhD6ywJPGkZGKhTXsfllciXTZlxyTOZSnD0x0AQb
 DIIRUX0/3qyEd2gbfy3ptGKgWOGJ+SEC6eliQWjqQoYTAFRzgZRuSO7WG
 tH8bloy75hJswKRRTuPvazY+fgCLV9KwfF/kV0yXzwX9sjy3sEgviJfRW
 v0PsWRYFrz3VdV1hRG0uDwLfygvO1SnbnecSDXN21D8tjawBUGehPNLE/
 ZBOOzUxebksBxwuT13fdLQ4bub2NkMT/oNoKZ3hzsgECcYEWAhYAyRupw Q==;
X-CSE-ConnectionGUID: va6Z1G+aT4i2XYk65WOwvw==
X-CSE-MsgGUID: PYpwn6LaSfeklPZj89IvMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1393946"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1393946"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:13:37 -0700
X-CSE-ConnectionGUID: V5LwTbvTShGtovLj9HET0Q==
X-CSE-MsgGUID: NmgFUW6sR5+NYSw6CstJWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3268747"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 21 Oct 2026 22:13:35 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v14 5/9] drm/xe: Make xe_device_declare_wedged() IRQ safe
Date: Thu, 22 Oct 2026 10:42:29 +0530
Message-ID: <20261022051303.282805-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022051303.282805-1-raag.jadav@intel.com>
References: <20261022051303.282805-1-raag.jadav@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently, xe_device_declare_wedged() implementation wedges the GTs and
sends wedged uevent to userspace. This is problematic for usecases which
require declaring the device as wedged in IRQ context, as it allocates
memory for event buffer and acquires mutexes deep into its call path.

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

