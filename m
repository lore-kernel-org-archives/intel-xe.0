Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2370CD8C8E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 08:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13DB10EF79;
	Mon,  8 Jun 2026 08:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RCOVJC/U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD0010EF81
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 08:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780908445; x=1812444445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eZJG9y551mOP1y6gt4x/ZICA6tHJhAwEq54bn3lLQzA=;
 b=RCOVJC/USGuhGb1r3PeaU6AHCQhWqVjNEEM8NZ7cnuYzmXclM2ik2NzI
 GLWpEXS3SmitbvwXCoGwYglHQBwVlUV84m8czmGpvqKzI3uPHBGBnjWFm
 a+6RQjB1kjUJonxMnJf6AmrydSMMyds9GbP9rlmkkzLyPq9w/GungiDFD
 j8KVV4rNNfBssKErYizH3+w4ydV6jrs+Yu+u54tpwBjl4ex2VWYreo+eL
 KffFuXhs7+38HJvvfauVwN9oZPGKkm/EtYJUo2xE1ch2eh6xgaRpNB6LG
 +Ux3bs+4DE6xwI87XU/p6Cm2Ee3KymegemL0fSnIUMBj2kOjfkp8anPXL g==;
X-CSE-ConnectionGUID: cfoI6I9lSyyTLeGLjVygNw==
X-CSE-MsgGUID: fGJcfeMzRCKzg91lOrmNww==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="93029062"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="93029062"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:47:25 -0700
X-CSE-ConnectionGUID: M6hpQtBgRBqwTF9Pg3HKMw==
X-CSE-MsgGUID: VZ7z/hKqTHi8EOp0ueyl5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="269466032"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:47:21 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v8 03/15] drm/xe: Improve wedged state management
Date: Mon,  8 Jun 2026 14:17:04 +0530
Message-ID: <20260608084700.640376-20-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260608084700.640376-17-riana.tauro@intel.com>
References: <20260608084700.640376-17-riana.tauro@intel.com>
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

From: Raag Jadav <raag.jadav@intel.com>

Currently, wedged state is serving a single usecase where the device is
declared wedged, but this doesn't allow any wedged state management for
runtime usecases. In preparation of usecases which requires to facilitate
temporary device wedging, convert wedged.flag to wedged.ref which serves
as a driver internal refcount and blocks critical path execution during
device lifetime and while at it, introduce wedged.fini and use it as a
cleanup indicator during driver unwind which operates independent of the
refcount.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  5 +++--
 drivers/gpu/drm/xe/xe_device.h       | 12 +++++++++++-
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++--
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 51e3a2dd7b22..7154f356d631 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -915,7 +915,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = arg;
 
-	if (atomic_read(&xe->wedged.flag))
+	if (atomic_read(&xe->wedged.fini))
 		xe_pm_runtime_put(xe);
 }
 
@@ -1411,7 +1411,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		return;
 	}
 
-	if (!atomic_xchg(&xe->wedged.flag, 1)) {
+	if (!atomic_xchg(&xe->wedged.fini, 1)) {
+		xe_device_wedged_get(xe);
 		xe->needs_flr_on_fini = true;
 		xe_pm_runtime_get_noresume(xe);
 		drm_err(&xe->drm,
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 975768a6a9c8..3e536a49388a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -192,9 +192,19 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
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
2.47.1

