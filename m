Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D79C54FD2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 06:54:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C934B10EDCC;
	Thu, 30 Jul 2026 06:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GigbtHY+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9C910EDCD
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 06:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785394490; x=1816930490;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D+y8eZ71L5J/3AcmAAGwDX3NGXgoy9JroBpu+8/UvyA=;
 b=GigbtHY+OW55jCTT4cdHVYgP0qR+OIrFiOqpkEFAMqfTB4LJnPVmaruR
 lsesmwFRyqAe3/+Z/SSOq+TN94nCdBia1nk/5aZighAYWaGZVHCDwvjOO
 7yHzjdFWNyaIVCWyfBnvXTP5Xp049ucKCLPWuyQXJlwT4NfLzdAKD2GWL
 fSnXnkdROmK7V3MWNTzyTWEw2Y/9Iy3Z92BzRByZIYxd9OxPoYnz9j86i
 lRTDBUaFT5QVH5FG3QH65spZH+WJruQaJZG20xu/wM54aoMlSSmvmV55n
 Ndbr7Hq/vfU2sqZVP2sh5UnJW0fq4EiIXVhYRGtcsS9DowkjRF57bLbqV g==;
X-CSE-ConnectionGUID: hQ0UHyzSQMqepvdrYA0JoA==
X-CSE-MsgGUID: ciLxSQQMRFOU5bpJ5/2bNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86126682"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="86126682"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 23:54:49 -0700
X-CSE-ConnectionGUID: 03CgAEJFSX+o7Wx44hU71A==
X-CSE-MsgGUID: f/8EO9g/RfOZvgiorX1Wnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="263708510"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 29 Jul 2026 23:54:46 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH] drm/xe/ras: Split RAS init into xe_ras_init_early and
 xe_ras_init
Date: Thu, 30 Jul 2026 12:24:31 +0530
Message-ID: <20260730065430.902562-2-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
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

xe_ras_init() was doing two unrelated things: setting up internal
bookkeeping needed before interrupts start, and querying firmware
errors that can only be done safely after the device is registered.

Split it into two functions with clear responsibilities:

- xe_ras_init_early(): runs early, before interrupts are enabled.

- xe_ras_init(): runs after the device is registered.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  4 +++-
 drivers/gpu/drm/xe/xe_ras.c    | 38 ++++++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_ras.h    |  1 +
 3 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4eed9a251e65..a264f2dd662e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1007,7 +1007,7 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe_ras_init(xe);
+	xe_ras_init_early(xe);
 
 	/*
 	 * Now that GT is initialized (TTM in particular),
@@ -1093,6 +1093,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_debugfs_register(xe);
 
+	xe_ras_init(xe);
+
 	err = xe_hwmon_register(xe);
 	if (err)
 		goto err_unregister_display;
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index a31e06b8aa67..acf713aaf79f 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -672,15 +672,17 @@ static const struct attribute_group gpu_health_group = {
 };
 
 /**
- * xe_ras_init - Initialize Xe RAS
+ * xe_ras_init_early - Early RAS initialization, before interrupts are enabled
  * @xe: xe device instance
  *
- * Initialize Xe RAS
+ * Sets up the RAS error-counter bookkeeping and PCIe error reporting
+ * before interrupts are enabled. This must happen early because the
+ * interrupt handler reads the error counters set up here; skipping it
+ * would cause boot-time hardware errors to be cleared silently with no
+ * log or count.
  */
-void xe_ras_init(struct xe_device *xe)
+void xe_ras_init_early(struct xe_device *xe)
 {
-	int ret;
-
 	if (!xe->info.has_drm_ras)
 		return;
 
@@ -692,11 +694,29 @@ void xe_ras_init(struct xe_device *xe)
 	if (IS_ENABLED(CONFIG_PCIEAER))
 		ras_usp_aer_init(xe);
 
-	/*
-	 * During probe, process and log any errors detected by firmware while the driver was not
-	 * loaded. Critical errors such as Punit and CSC are reported through Pcode init failure,
-	 * causing the driver to enter survivability mode.
+	/* TODO: Build the page offline list/queue from early boot errors so
+	 * faulty pages are excluded before kernel objects are allocated.
 	 */
+}
+
+/**
+ * xe_ras_init - RAS initialization, after device registration
+ * @xe: xe device instance
+ *
+ * Queries firmware for any hardware errors that occurred before the driver
+ * loaded and creates the gpu_health sysfs entry. Must run after the device
+ * is registered so that kernel events and sysfs paths work correctly.
+ *
+ * By the time this runs, critical boot failures (Punit, CSC) have already
+ * been caught and handled via the survivability mode path.
+ */
+void xe_ras_init(struct xe_device *xe)
+{
+	int ret;
+
+	if (!xe->info.has_drm_ras || !xe->info.has_sysctrl)
+		return;
+
 	xe_ras_process_errors(xe);
 	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
 	if (ret)
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 618364734043..c28711470861 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -16,6 +16,7 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response);
 int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value);
 int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component);
+void xe_ras_init_early(struct xe_device *xe);
 void xe_ras_init(struct xe_device *xe);
 enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
 
-- 
2.48.1

