Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89134C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FC010E82A;
	Wed, 12 Apr 2023 14:26:13 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D306210E835
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309570; x=1712845570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zJRBAkBCPx9qwpqMWTA2DRMQNHdhH6ZKoXVN9U7lkNo=;
 b=PONnxylZxqxaOo1Fh/i/g4MRR4TnqhPOHhmspnJ8g1BfLfs01g+SNVzO
 3zwfXH/mLp7GpqhzZk8BuRZDGU3AVifIZPsROL01iMeubYBsNMbwIS2dy
 0h+DNiTo12ljOjAKmY0HodfyiAAyCGfgojgyTiM1vO/EzRXypzmYcur/K
 9cGkIXrIEiQgTlr8hPBrT4IkKGtdF9w5yv16a+YdG+NRAjc4kwtgWL9F9
 q4At/aIBvJUD/3Qz4CoUcyNjisyLqvep3VLXPmlAjOTMvLi57cTUe7KPi
 oZFyN8RnV6aeRqTkDo3Sf3n2e6XMSkWdNtVqhY3Jh7sJ+5dLPJYhEBL49 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="343916379"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="343916379"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:26:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="688956441"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="688956441"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:26:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:53 +0300
Message-Id: <20230412142006.877109-29-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 28/41] fixup! drm/i915/display: Remaining changes
 to make xe compile
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It's okay to have the free list around as long as we don't put anything
to it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 69c2a381c527..6d9abc95dbcd 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7249,7 +7249,6 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 	drm_WARN_ON(&dev_priv->drm, update_pipes);
 }
 
-#ifdef I915
 static void intel_atomic_helper_free_state(struct drm_i915_private *dev_priv)
 {
 	struct intel_atomic_state *state, *next;
@@ -7267,7 +7266,6 @@ static void intel_atomic_helper_free_state_worker(struct work_struct *work)
 
 	intel_atomic_helper_free_state(dev_priv);
 }
-#endif
 
 static void intel_atomic_commit_fence_wait(struct intel_atomic_state *intel_state)
 {
@@ -7331,9 +7329,7 @@ static void intel_atomic_cleanup_work(struct work_struct *work)
 	drm_atomic_helper_commit_cleanup_done(&state->base);
 	drm_atomic_state_put(&state->base);
 
-#ifdef I915
 	intel_atomic_helper_free_state(i915);
-#endif
 }
 
 #ifndef I915
@@ -8543,11 +8539,9 @@ int intel_modeset_init_noirq(struct drm_i915_private *i915)
 	if (ret)
 		goto cleanup_vga_client_pw_domain_dmc;
 
-#ifdef I915
 	init_llist_head(&i915->display.atomic_helper.free_list);
 	INIT_WORK(&i915->display.atomic_helper.free_work,
 		  intel_atomic_helper_free_state_worker);
-#endif
 
 	intel_init_quirks(i915);
 
@@ -8847,10 +8841,8 @@ void intel_modeset_driver_remove(struct drm_i915_private *i915)
 	flush_workqueue(i915->display.wq.flip);
 	flush_workqueue(i915->display.wq.modeset);
 
-#ifdef I915
 	flush_work(&i915->display.atomic_helper.free_work);
 	drm_WARN_ON(&i915->drm, !llist_empty(&i915->display.atomic_helper.free_list));
-#endif
 
 	/*
 	 * MST topology needs to be suspended so we don't have any calls to
-- 
2.39.2

