Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE533CD98E4
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 12:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747E110E455;
	Wed, 17 Jun 2026 12:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LiDpDK9t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF2610E455
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 12:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781698163; x=1813234163;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rrhfSNhktCP11SaemT0MPc3w1NjwegeOI+3bKPFDnm8=;
 b=LiDpDK9tYoYf8Oa4eskOtPNwjobk9hFpCIM2uwuWj+W8791NGhHgIQSw
 ERGH+UEplX8mzwhGvSmcgqLBUr+IBliOsABcvoCPlnwz4EkTRW+00y0TD
 TndOBOKTD9BhpNYRj6HvNcBhUlQvaqSR2t059rn9l8ciFHo1tqDqiddM6
 N1d8+FQpCgik2kMOheJ6kI6boYrcQTiiazIpCUjcZInLr4CihOJuTCdLL
 CwneTX8k7C0Z+PNDVjkprn53Qwv1y7E6kfeujcYKH/E+u0b6aU+8Zgzgk
 /theNElHywXBC6yrntKX1sA3c5hCm/LKsOZTQK130cSYuHufzLtb02Hp1 Q==;
X-CSE-ConnectionGUID: s8cQUR9TThy1ZkI0s2PRPw==
X-CSE-MsgGUID: /YqD7Gp+Tqi7rqyyk+DnpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="86328130"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="86328130"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 05:09:23 -0700
X-CSE-ConnectionGUID: zvJMC7d+QIqFyrYpuUFPig==
X-CSE-MsgGUID: uvrv1f3rQkyDj2LPzqXKLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="253008801"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 17 Jun 2026 05:09:20 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 mallesh.koujalagi@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe: Improve wedged state management
Date: Wed, 17 Jun 2026 17:33:45 +0530
Message-ID: <20260617120542.96444-1-raag.jadav@intel.com>
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

Currently, wedged state is serving a single usecase where the device is
permanently declared wedged, but this doesn't allow any wedged state
management for runtime usecases. In preparation of usecases which require
to facilitate temporary device wedging, convert wedged.flag to wedged.ref
which serves as a driver internal refcount for wedged state and blocks
critical path execution during device lifetime. While at it, introduce
wedged.perm which signifies permanent device wedging and operates
independent of the refcount allowing relevant cleanup action on unwind
path.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
Split from FLR series[1].

[1] https://lore.kernel.org/intel-xe/20260603101814.916948-9-raag.jadav@intel.com/
---
 drivers/gpu/drm/xe/xe_device.c       |  5 +++--
 drivers/gpu/drm/xe/xe_device.h       | 18 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++--
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ef730f2bdf32..00ade433a23b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -916,7 +916,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = arg;
 
-	if (atomic_read(&xe->wedged.flag))
+	if (atomic_read(&xe->wedged.perm))
 		xe_pm_runtime_put(xe);
 }
 
@@ -1421,7 +1421,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		return;
 	}
 
-	if (!atomic_xchg(&xe->wedged.flag, 1)) {
+	if (!atomic_xchg(&xe->wedged.perm, 1)) {
+		xe_device_wedged_get(xe);
 		xe->needs_flr_on_fini = true;
 		xe_pm_runtime_get_noresume(xe);
 		drm_err(&xe->drm,
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 975768a6a9c8..1aea83e3517c 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -192,9 +192,25 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
 void xe_device_td_flush(struct xe_device *xe);
 void xe_device_l2_flush(struct xe_device *xe);
 
+static inline void xe_device_wedged_get(struct xe_device *xe)
+{
+	int ref;
+
+	ref = atomic_inc_return(&xe->wedged.ref);
+	xe_assert(xe, ref > 0);
+}
+
+static inline void xe_device_wedged_put(struct xe_device *xe)
+{
+	int ref;
+
+	ref = atomic_dec_return(&xe->wedged.ref);
+	xe_assert(xe, ref >= 0);
+}
+
 static inline bool xe_device_wedged(struct xe_device *xe)
 {
-	return atomic_read(&xe->wedged.flag);
+	return atomic_read(&xe->wedged.ref);
 }
 
 void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 32dd2ffbc796..f13e0fb2f18e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -485,8 +485,10 @@ struct xe_device {
 
 	/** @wedged: Struct to control Wedged States and mode */
 	struct {
-		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
-		atomic_t flag;
+		/** @wedged.perm: Permanently wedged, needs cleanup on fini */
+		atomic_t perm;
+		/** @wedged.ref: Refcount for wedged device, blocks critical path execution */
+		atomic_t ref;
 		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
 		enum xe_wedged_mode mode;
 		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
-- 
2.43.0

