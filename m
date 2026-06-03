Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9FCCD6E64
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 10:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FDC10FB75;
	Wed,  3 Jun 2026 10:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eq8TyhcO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BAA10FB75
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 10:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780482153; x=1812018153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B8PA2xZ2KnpNuv4x84l9CR6UobkSp/71c77J6D7Jky4=;
 b=eq8TyhcOv58U8S0+ZjoetYbX0jSr4MF+7tzlzLpjF6BQBX/DXhGbrR5Z
 XFOadS7wyCLcGkNzBIgkmUkdYxsIqhRI6GEGkzegC4GB4KjHsLWBtKlmD
 QD94Vz9wFKMPpEKomHgyTi9VF3knkmzFgXWHGYPbk932m3vvEIsRC4ugD
 TSoNn6jhsYrSyS6lf6umo/k2Zc4blFgnNeFSWTNKvfSidavAKFACQqBHR
 D7OsDQ6xIVc7TKfj1EO/RTZTfsdMHWExqCrZmaOH8E24wICePf1H+TJ9r
 +sdV7jQF0ZRwAO9Tz2QaEZR6Y6e3thTgCFyzPqJ1prsB5ZPpouw5AF2wa Q==;
X-CSE-ConnectionGUID: CYRNrPnXTKWE1RHGfy8dLA==
X-CSE-MsgGUID: 3PFBTpMARgWukK9Gdc00/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81143303"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81143303"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 03:22:33 -0700
X-CSE-ConnectionGUID: YICCces7QgOmr9L7PHd34Q==
X-CSE-MsgGUID: z5blj7wUQb20UtB/SDGjuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="248495698"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 03 Jun 2026 03:22:29 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v8 08/10] drm/xe: Improve wedged state management
Date: Wed,  3 Jun 2026 15:47:08 +0530
Message-ID: <20260603101814.916948-9-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603101814.916948-1-raag.jadav@intel.com>
References: <20260603101814.916948-1-raag.jadav@intel.com>
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

Currently, wedged state is serving a single usecase where the device is
declared wedged, but this doesn't allow any wedged state management for
runtime usecases. In preparation of usecases which requires to facilitate
temporary device wedging, convert wedged.flag to wedged.ref which serves
as a driver internal refcount and blocks critical path execution during
device lifetime and while at it, introduce wedged.fini and use it as a
cleanup indicator during driver unwind which operates independent of the
refcount.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  5 +++--
 drivers/gpu/drm/xe/xe_device.h       | 12 +++++++++++-
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++--
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9e0cbad8adb0..d77f8f054a1a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -917,7 +917,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = arg;
 
-	if (atomic_read(&xe->wedged.flag))
+	if (atomic_read(&xe->wedged.fini))
 		xe_pm_runtime_put(xe);
 }
 
@@ -1413,7 +1413,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		return;
 	}
 
-	if (!atomic_xchg(&xe->wedged.flag, 1)) {
+	if (!atomic_xchg(&xe->wedged.fini, 1)) {
+		xe_device_wedged_get(xe);
 		xe->needs_flr_on_fini = true;
 		xe_pm_runtime_get_noresume(xe);
 		drm_err(&xe->drm,
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index d61fdb362f91..14677729aa24 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -194,9 +194,19 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
 void xe_device_td_flush(struct xe_device *xe);
 void xe_device_l2_flush(struct xe_device *xe);
 
+static inline void xe_device_wedged_get(struct xe_device *xe)
+{
+	atomic_inc(&xe->wedged.ref);
+}
+
+static inline void xe_device_wedged_put(struct xe_device *xe)
+{
+	atomic_dec(&xe->wedged.ref);
+}
+
 static inline bool xe_device_wedged(struct xe_device *xe)
 {
-	return atomic_read(&xe->wedged.flag);
+	return atomic_read(&xe->wedged.ref);
 }
 
 void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 32dd2ffbc796..66e673e4e3e7 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -485,8 +485,10 @@ struct xe_device {
 
 	/** @wedged: Struct to control Wedged States and mode */
 	struct {
-		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
-		atomic_t flag;
+		/** @wedged.fini: Needs cleanup on fini */
+		atomic_t fini;
+		/** @wedged.ref: Refcount for wedged device, blocks critical path execution */
+		atomic_t ref;
 		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
 		enum xe_wedged_mode mode;
 		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
-- 
2.43.0

