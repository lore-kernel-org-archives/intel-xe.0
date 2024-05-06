Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5BBC10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 13:20:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFB210F9E1;
	Mon,  6 May 2024 13:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYa9fwdC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737EF10F9E1
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715001635; x=1746537635;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yQPCaV2JoPO++1Um3/0Kgagu4R0nWMHZAo5LSsLu0HE=;
 b=PYa9fwdC1toSqtvv+8wS9XPYN0hda8b+poQGd0mjrQhzuOK6t8eWCqXy
 +82Cmqt2qsFHzg+yz7rYN0K4koxxUhYdsiLA9OihQGCJoZjOW9FDykHRQ
 +mJOfV24TxcC/63Ima5T4UWUJj3zYAHLgGUOT1OpWGalGWnAjThMn/t0C
 ovRyBoD0AAjDqAbxoGdcA1/qIelhzHv7robxjNPbI2QRt1Ivz3C5Jdr7W
 qYNpcsODa+Y6MlNFb0PayiVSBfkVtyNSJjxC7kkbUhhfAI1HgqiwbwVW7
 kcIDKZYarA+Q9980sWTigtxYzFMU4lmS3o2HYk8oxK2i/xIgoBmBoS/vY g==;
X-CSE-ConnectionGUID: 5VE3fHUsS0apu7Jl6g2ZsA==
X-CSE-MsgGUID: KruWNEXfSjq+NB84kf6wog==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="22156426"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="22156426"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:20:34 -0700
X-CSE-ConnectionGUID: ITXkiEKMRbi3uL7dbllWPA==
X-CSE-MsgGUID: q+QSBXVsTJu8e112vNwM0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="59346368"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa001.fm.intel.com with ESMTP; 06 May 2024 06:20:31 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH] drm/xe: Modify minimum of various scheduler timeout to 0
Date: Mon,  6 May 2024 19:04:47 +0530
Message-Id: <20240506133447.3143994-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

Remove the min/max configs and change minimum values of preemption and
timeslice to 0. The sysman teams must deactivate preemption and
timeslice to assess exclusivity mode. They depend on configuring
timeslice_duration_us and preempt_timeout_us to 0, ensuring these
values are set at their minimum.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.profile | 38 ------------------------------
 drivers/gpu/drm/xe/xe_hw_engine.h  | 28 ++--------------------
 2 files changed, 2 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
index ba17a25e8db3..9bf7adb45eea 100644
--- a/drivers/gpu/drm/xe/Kconfig.profile
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -1,27 +1,3 @@
-config DRM_XE_JOB_TIMEOUT_MAX
-	int "Default max job timeout (ms)"
-	default 10000 # milliseconds
-	help
-	  Configures the default max job timeout after which job will
-	  be forcefully taken away from scheduler.
-config DRM_XE_JOB_TIMEOUT_MIN
-	int "Default min job timeout (ms)"
-	default 1 # milliseconds
-	help
-	  Configures the default min job timeout after which job will
-	  be forcefully taken away from scheduler.
-config DRM_XE_TIMESLICE_MAX
-	int "Default max timeslice duration (us)"
-	default 10000000 # microseconds
-	help
-	  Configures the default max timeslice duration between multiple
-	  contexts by guc scheduling.
-config DRM_XE_TIMESLICE_MIN
-	int "Default min timeslice duration (us)"
-	default 1 # microseconds
-	help
-	  Configures the default min timeslice duration between multiple
-	  contexts by guc scheduling.
 config DRM_XE_PREEMPT_TIMEOUT
 	int "Preempt timeout (us, jiffy granularity)"
 	default 640000 # microseconds
@@ -30,20 +6,6 @@ config DRM_XE_PREEMPT_TIMEOUT
 	  when submitting a new context. If the current context does not hit
 	  an arbitration point and yield to HW before the timer expires, the
 	  HW will be reset to allow the more important context to execute.
-config DRM_XE_PREEMPT_TIMEOUT_MAX
-	int "Default max preempt timeout (us)"
-	default 10000000 # microseconds
-	help
-	  Configures the default max preempt timeout after which context
-	  will be forcefully taken away and higher priority context will
-	  run.
-config DRM_XE_PREEMPT_TIMEOUT_MIN
-	int "Default min preempt timeout (us)"
-	default 1 # microseconds
-	help
-	  Configures the default min preempt timeout after which context
-	  will be forcefully taken away and higher priority context will
-	  run.
 config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
 	bool "Default configuration of limitation on scheduler timeout"
 	default y
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 71968ee2f600..803555c601ec 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -10,41 +10,17 @@
 
 struct drm_printer;
 
-#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
-#define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
-#else
 #define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1
-#endif
-#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MAX
-#define XE_HW_ENGINE_JOB_TIMEOUT_MAX CONFIG_DRM_XE_JOB_TIMEOUT_MAX
-#else
 #define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000)
-#endif
-#ifdef CONFIG_DRM_XE_TIMESLICE_MIN
-#define XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_MIN
-#else
-#define XE_HW_ENGINE_TIMESLICE_MIN 1
-#endif
-#ifdef CONFIG_DRM_XE_TIMESLICE_MAX
-#define XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
-#else
+#define XE_HW_ENGINE_TIMESLICE_MIN 0
 #define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
-#endif
 #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT
 #define XE_HW_ENGINE_PREEMPT_TIMEOUT CONFIG_DRM_XE_PREEMPT_TIMEOUT
 #else
 #define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)
 #endif
-#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
-#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
-#else
-#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1
-#endif
-#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
-#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
-#else
+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 0
 #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
-#endif
 
 int xe_hw_engines_init_early(struct xe_gt *gt);
 int xe_hw_engines_init(struct xe_gt *gt);
-- 
2.25.1

