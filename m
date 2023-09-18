Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812F8CD13D1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 07:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396BC10E1AD;
	Mon, 18 Sep 2023 07:01:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF27B10E1AC
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 07:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695020508; x=1726556508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q8FiW5NGFHJ0tETiLaijRXWeVBZx8pxJW4COM5vDieA=;
 b=MuCV/5o54MZSPi4N/3soZ/sYwh7gOUeCY38pWOO7jbMCnQcMIZp1fVFG
 yBbdSBRboerrYjMRi8OCObloibb2yoohy3RgQXUSR3Dxhsvyv+h6vAPfA
 DYxiFY1NfRISajKV8KNorGzCw3Fzw3CL07hneJaael+wtuQ/7vA1sGKMR
 WbptTCrAorFszgUWuIjcBXqzJ7D3WweyvtXH/UG09zTtPxOy2boPUcsOo
 kAjgQ5f983NZLIHkdjHSs3r0wjshROgAzYzXbhnkmE/yqUReBgvV4+ipX
 JN4x/4zZTfe6BODYsrdjn2WA8tVkKkAPAbcwO/tMZ5uyD/EcBwhcwOKcE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="382325235"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="382325235"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 00:01:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="695420459"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="695420459"
Received: from pjfarr-mobl2.ger.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.251.218.135])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 00:01:40 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 10:00:58 +0300
Message-Id: <20230918070100.1387082-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918070100.1387082-1-jouni.hogander@intel.com>
References: <20230918070100.1387082-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/i915: Remove runtime suspended boolean
 from intel_runtime_pm struct
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Imre Deak <imre.deak@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It's not necessary to carry separate suspended status information in
intel_runtime_pm struct as this information is already in underlying device
structure. Remove it and use pm_runtime_suspended() to obtain suspended
status information when needed.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230913100430.3433969-1-jouni.hogander@intel.com
(cherry picked from commit 8874288c803fba7fff4d441464cac3a513364fd1)
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
 drivers/gpu/drm/i915/i915_driver.c                 | 3 ---
 drivers/gpu/drm/i915/i915_gpu_error.c              | 2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c            | 1 -
 drivers/gpu/drm/i915/intel_runtime_pm.h            | 4 ++--
 5 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 068dc223653d..cda086d5c4c7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -216,7 +216,7 @@ bool __intel_display_power_is_enabled(struct drm_i915_private *dev_priv,
 	struct i915_power_well *power_well;
 	bool is_enabled;
 
-	if (dev_priv->runtime_pm.suspended)
+	if (pm_runtime_suspended(dev_priv->drm.dev))
 		return false;
 
 	is_enabled = true;
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index f8dbee7a5af7..cd98ee740976 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1569,8 +1569,6 @@ static int intel_runtime_suspend(struct device *kdev)
 	if (root_pdev)
 		pci_d3cold_disable(root_pdev);
 
-	rpm->suspended = true;
-
 	/*
 	 * FIXME: We really should find a document that references the arguments
 	 * used below!
@@ -1621,7 +1619,6 @@ static int intel_runtime_resume(struct device *kdev)
 	disable_rpm_wakeref_asserts(rpm);
 
 	intel_opregion_notify_adapter(dev_priv, PCI_D0);
-	rpm->suspended = false;
 
 	root_pdev = pcie_find_root_port(pdev);
 	if (root_pdev)
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 4008bb09fdb5..a60bab177c55 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1972,7 +1972,7 @@ static void capture_gen(struct i915_gpu_coredump *error)
 	struct drm_i915_private *i915 = error->i915;
 
 	error->wakelock = atomic_read(&i915->runtime_pm.wakeref_count);
-	error->suspended = i915->runtime_pm.suspended;
+	error->suspended = pm_runtime_suspended(i915->drm.dev);
 
 	error->iommu = i915_vtd_active(i915);
 	error->reset_count = i915_reset_count(&i915->gpu_error);
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index 6d8e5e5c0cba..8743153fad87 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -652,7 +652,6 @@ void intel_runtime_pm_init_early(struct intel_runtime_pm *rpm)
 
 	rpm->kdev = kdev;
 	rpm->available = HAS_RUNTIME_PM(i915);
-	rpm->suspended = false;
 	atomic_set(&rpm->wakeref_count, 0);
 
 	init_intel_runtime_pm_wakeref(rpm);
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.h b/drivers/gpu/drm/i915/intel_runtime_pm.h
index 764b183ae452..f79cda7a2503 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.h
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.h
@@ -6,6 +6,7 @@
 #ifndef __INTEL_RUNTIME_PM_H__
 #define __INTEL_RUNTIME_PM_H__
 
+#include <linux/pm_runtime.h>
 #include <linux/types.h>
 
 #include "intel_wakeref.h"
@@ -43,7 +44,6 @@ struct intel_runtime_pm {
 	atomic_t wakeref_count;
 	struct device *kdev; /* points to i915->drm.dev */
 	bool available;
-	bool suspended;
 	bool irqs_enabled;
 	bool no_wakeref_tracking;
 
@@ -110,7 +110,7 @@ intel_rpm_wakelock_count(int wakeref_count)
 static inline void
 assert_rpm_device_not_suspended(struct intel_runtime_pm *rpm)
 {
-	WARN_ONCE(rpm->suspended,
+	WARN_ONCE(pm_runtime_suspended(rpm->kdev),
 		  "Device suspended during HW access\n");
 }
 
-- 
2.34.1

