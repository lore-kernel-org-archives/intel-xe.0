Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFA7CD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 07:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1692C10E1AC;
	Mon, 18 Sep 2023 07:01:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE5F10E1A5
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 07:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695020507; x=1726556507;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uRykajVQAXJRvSWIyO/RouA8F74asMYr5JbmfWkZysE=;
 b=EFwrOtEHoAIL1rC59m4sNxcoMAY9W1x9xgsWsZMGNT/6vYrjh6ZVW+2j
 t4oAlfkQmgp4MmXSCyJ4drzUpzNQypcaOhhZwBG7R+59FZOfzitf3iudf
 I9WZzN/fmYVj0m66jgvAHa/hmBWuLzmahb/xU+VBccoiy1/kDZkXY65Kv
 AHZ/6JbUjiY6ynT4sKH0zCqxLdeUd1sEwrGNjvpkqKL4t+HDyYuQJXlG1
 A4S+b4bhwd9N0Y+4UhEcIUsuMiP8w5CgiTyeKcjWvjHNUKBn6j0efLs3F
 fLM3T+5sy5NQ1+5bGQYn8I74Z+deP/qlFX4voomNV/Bbf3LrtjwFVlw9z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="382325212"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="382325212"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 00:01:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="695420436"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="695420436"
Received: from pjfarr-mobl2.ger.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.251.218.135])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 00:01:38 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 10:00:57 +0300
Message-Id: <20230918070100.1387082-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918070100.1387082-1-jouni.hogander@intel.com>
References: <20230918070100.1387082-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] Revert "FIXME: drm/i915: runtime pm changes"
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 742e449ddca435897eec6d9c21d4d2573b77242d.

This change is not needed anymore as next patch is changing this to
use pm_runtime_suspended() instead of custom suspended boolean.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../drm/i915/display/intel_display_power.c    | 23 ++++++++++---------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index c257542d269d..068dc223653d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -216,10 +216,8 @@ bool __intel_display_power_is_enabled(struct drm_i915_private *dev_priv,
 	struct i915_power_well *power_well;
 	bool is_enabled;
 
-#ifdef I915
 	if (dev_priv->runtime_pm.suspended)
 		return false;
-#endif
 
 	is_enabled = true;
 
@@ -638,6 +636,7 @@ release_async_put_domains(struct i915_power_domains *power_domains,
 	struct drm_i915_private *dev_priv =
 		container_of(power_domains, struct drm_i915_private,
 			     display.power.domains);
+	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
 	enum intel_display_power_domain domain;
 	intel_wakeref_t wakeref;
 
@@ -646,8 +645,8 @@ release_async_put_domains(struct i915_power_domains *power_domains,
 	 * wakeref to make the state checker happy about the HW access during
 	 * power well disabling.
 	 */
-	assert_rpm_raw_wakeref_held(&dev_priv->runtime_pm);
-	wakeref = intel_runtime_pm_get(&dev_priv->runtime_pm);
+	assert_rpm_raw_wakeref_held(rpm);
+	wakeref = intel_runtime_pm_get(rpm);
 
 	for_each_power_domain(domain, mask) {
 		/* Clear before put, so put's sanity check is happy. */
@@ -655,7 +654,7 @@ release_async_put_domains(struct i915_power_domains *power_domains,
 		__intel_display_power_put_domain(dev_priv, domain);
 	}
 
-	intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
+	intel_runtime_pm_put(rpm, wakeref);
 }
 
 static void
@@ -665,7 +664,8 @@ intel_display_power_put_async_work(struct work_struct *work)
 		container_of(work, struct drm_i915_private,
 			     display.power.domains.async_put_work.work);
 	struct i915_power_domains *power_domains = &dev_priv->display.power.domains;
-	intel_wakeref_t new_work_wakeref = intel_runtime_pm_get_raw(&dev_priv->runtime_pm);
+	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
+	intel_wakeref_t new_work_wakeref = intel_runtime_pm_get_raw(rpm);
 	intel_wakeref_t old_work_wakeref = 0;
 
 	mutex_lock(&power_domains->lock);
@@ -706,9 +706,9 @@ intel_display_power_put_async_work(struct work_struct *work)
 	mutex_unlock(&power_domains->lock);
 
 	if (old_work_wakeref)
-		intel_runtime_pm_put_raw(&dev_priv->runtime_pm, old_work_wakeref);
+		intel_runtime_pm_put_raw(rpm, old_work_wakeref);
 	if (new_work_wakeref)
-		intel_runtime_pm_put_raw(&dev_priv->runtime_pm, new_work_wakeref);
+		intel_runtime_pm_put_raw(rpm, new_work_wakeref);
 }
 
 /**
@@ -730,7 +730,8 @@ void __intel_display_power_put_async(struct drm_i915_private *i915,
 				     int delay_ms)
 {
 	struct i915_power_domains *power_domains = &i915->display.power.domains;
-	intel_wakeref_t work_wakeref = intel_runtime_pm_get_raw(&i915->runtime_pm);
+	struct intel_runtime_pm *rpm = &i915->runtime_pm;
+	intel_wakeref_t work_wakeref = intel_runtime_pm_get_raw(rpm);
 
 	delay_ms = delay_ms >= 0 ? delay_ms : 100;
 
@@ -762,9 +763,9 @@ void __intel_display_power_put_async(struct drm_i915_private *i915,
 	mutex_unlock(&power_domains->lock);
 
 	if (work_wakeref)
-		intel_runtime_pm_put_raw(&i915->runtime_pm, work_wakeref);
+		intel_runtime_pm_put_raw(rpm, work_wakeref);
 
-	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
+	intel_runtime_pm_put(rpm, wakeref);
 }
 
 /**
-- 
2.34.1

