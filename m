Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D13C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 10:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2229B10EFC4;
	Fri, 12 Apr 2024 10:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nA43kDaK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C210910EFC4
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 10:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712918230; x=1744454230;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aqrUhKJdkBE410Ko4a5kkcBhqeuPvKSvNNB+ri68JiM=;
 b=nA43kDaKqJM+068zie6UKJK1XJ1IslB6Q/yMOMi/INde5jzrs0yill+X
 MXM7vQGBT0TPtDFRwHGllOuoiUFNh8QnNCfR/rNQvFa/nTky69m48ha5/
 rt+bwIjXbvCFVJMWYXY6VWBZsf/5DjNMct94Ehwf7y6vrm8R027g6AvpR
 h+mS7NyXgm/GdokJCke8b4nhhWuwl4tDlxcvPdz8mhtXBcD4kCsAinIMx
 MMoXJ/pKVTdlNJl+xJzL2CyrdrzoIH9dIin2ebfB0aMakDfZMUFImopaw
 GyFNNLamBrQqL0ry8OvtO4QZDmDE1oM/FNfF5Lg3G0JfhdpcJf/wcPyUr A==;
X-CSE-ConnectionGUID: bPHl68t9Rvy1/egHQ4j+wg==
X-CSE-MsgGUID: TFSo0yNxQZ6lALSLck6ALQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8241163"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8241163"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 03:37:09 -0700
X-CSE-ConnectionGUID: Q8A1RgxWQUGrEpw7D3sUQA==
X-CSE-MsgGUID: lqponM/URVmtfSth6Bqt5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="25876357"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa003.jf.intel.com with ESMTP; 12 Apr 2024 03:37:06 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2] drm/xe: Modify minimum of various scheduler timeout to 0.
Date: Fri, 12 Apr 2024 16:20:53 +0530
Message-Id: <20240412105053.1050268-1-himal.prasad.ghimiray@intel.com>
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

The sysman teams needs to disable preemption and timeslice to
test exclusivity mode and are relying on setting 'timeslice_duration_us'
and 'preempt_timeout_us' to 0 for the same. Hence set the
min configs to 0.

-v2
Modify values in drivers/gpu/drm/xe/xe_hw_engine.h

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.profile | 4 ++--
 drivers/gpu/drm/xe/xe_hw_engine.h  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
index ba17a25e8db3..80e80b55467f 100644
--- a/drivers/gpu/drm/xe/Kconfig.profile
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -18,7 +18,7 @@ config DRM_XE_TIMESLICE_MAX
 	  contexts by guc scheduling.
 config DRM_XE_TIMESLICE_MIN
 	int "Default min timeslice duration (us)"
-	default 1 # microseconds
+	default 0 # microseconds
 	help
 	  Configures the default min timeslice duration between multiple
 	  contexts by guc scheduling.
@@ -39,7 +39,7 @@ config DRM_XE_PREEMPT_TIMEOUT_MAX
 	  run.
 config DRM_XE_PREEMPT_TIMEOUT_MIN
 	int "Default min preempt timeout (us)"
-	default 1 # microseconds
+	default 0 # microseconds
 	help
 	  Configures the default min preempt timeout after which context
 	  will be forcefully taken away and higher priority context will
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 71968ee2f600..5be0783a8865 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -23,7 +23,7 @@ struct drm_printer;
 #ifdef CONFIG_DRM_XE_TIMESLICE_MIN
 #define XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_MIN
 #else
-#define XE_HW_ENGINE_TIMESLICE_MIN 1
+#define XE_HW_ENGINE_TIMESLICE_MIN 0
 #endif
 #ifdef CONFIG_DRM_XE_TIMESLICE_MAX
 #define XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
@@ -38,7 +38,7 @@ struct drm_printer;
 #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
 #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
 #else
-#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1
+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 0
 #endif
 #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
 #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
-- 
2.25.1

