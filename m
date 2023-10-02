Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F60E784B0
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 10:40:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E226110E287;
	Mon,  2 Oct 2023 10:40:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BBB10E286
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 10:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696243252; x=1727779252;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rd2CUyTfQzlELhmfmLAJqea1Ip7v0cMS0JpJ4A9L6WE=;
 b=YEMNVMht9SMRwV673blgasKYDpfjGaBebPADmgW2eoYBwj6J/H9ls6BM
 I9vbG5uhKskWJfA8pck3p+jXoL7r9zztB0HUgnEsTdkjqeT4oKUmnEZQi
 r76xPe6YgKWq9RQ2yFwM8VM46QBZTi0dNu3VwS1/jtU4HNLkhNRlTO6RM
 ElGn49nZmzpj8mCaljko+62IGe2qGOGCP06XDS9Bxw4AyR65vBBSXd2eE
 M9KcLSGkGFGkiWdF2nEgokzj8QZYuzpsZqnXNVWEOMvm/KkDLJua26bzW
 peAZw2bT+2lRJIqxuS54K6g9E6n5GOrd4N+m7nc2DifZSY4HTTD0Z85C0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="4192996"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="4192996"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 03:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="840947460"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="840947460"
Received: from svandens-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.151])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 03:40:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  2 Oct 2023 13:40:37 +0300
Message-Id: <20231002104037.1923861-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] Revert "drm/i915/display: Fix a use-after-free
 when intel_edp_init_connector fails"
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 299ddb10031a33cd51e375565ea22b3e829f5949.

This is fixed by commit f917130f19fe ("drm/i915: Flush power delayed put
when connector init failed") upstream, and already part of the baseline.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
 drivers/gpu/drm/i915/display/intel_display_power.h | 1 -
 drivers/gpu/drm/i915/display/intel_dp_aux.c        | 2 --
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 08f63340ff58..e25785ae1c20 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -812,7 +812,7 @@ void intel_display_power_flush_work(struct drm_i915_private *i915)
  * Like intel_display_power_flush_work(), but also ensure that the work
  * handler function is not running any more when this function returns.
  */
-void
+static void
 intel_display_power_flush_work_sync(struct drm_i915_private *i915)
 {
 	struct i915_power_domains *power_domains = &i915->display.power.domains;
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index ec2b5560877f..d6c2a5846bdc 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -200,7 +200,6 @@ void __intel_display_power_put_async(struct drm_i915_private *i915,
 				     intel_wakeref_t wakeref,
 				     int delay_ms);
 void intel_display_power_flush_work(struct drm_i915_private *i915);
-void intel_display_power_flush_work_sync(struct drm_i915_private *i915);
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_RUNTIME_PM)
 void intel_display_power_put(struct drm_i915_private *dev_priv,
 			     enum intel_display_power_domain domain,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index 03f1e1425a0a..4431b6290c4c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -734,8 +734,6 @@ void intel_dp_aux_fini(struct intel_dp *intel_dp)
 	if (cpu_latency_qos_request_active(&intel_dp->pm_qos))
 		cpu_latency_qos_remove_request(&intel_dp->pm_qos);
 
-	/* Ensure async work from intel_dp_aux_xfer() is flushed before we clean up */
-	intel_display_power_flush_work_sync(dp_to_i915(intel_dp));
 	kfree(intel_dp->aux.name);
 }
 
-- 
2.39.2

