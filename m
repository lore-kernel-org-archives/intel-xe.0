Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223F1CA0ECA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 06:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C333F10E369;
	Tue, 12 Sep 2023 06:47:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7AAE10E35C
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 06:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694501249; x=1726037249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MLpPzKcai8J4ldEUqgfwSXw+bc/Mdh8fEO9CJmPRwyo=;
 b=HPY/AbmmNKUVtH45CHienM8Nm9d+FXaHPnyDDcfI2BoHnFus1/hE4URS
 mRhvF8cP9z8IeOtjeZrXXyJZwunOcDQwGYdtYbNCqcybzNoN1i/joUjLA
 VV9swzUCjz2ByC6UUxmRbUMYSPdGAFQg9L08h9+c6szaSAbMW3kta1Odo
 aXMmOmVBLznIzq7tDoyuOnAb+I80mnAadgrFteik0zuFLZ+gj6H5E5Y8E
 MiFmIYUsRA7+bLTAa9PmaBnAY5avDL8Rloj6QoX37chT+P50sy3h7Ulcs
 84K3dxzClcQPhDDOQuS5hFpLPs/3j3AKDBVwfg14jWgtxlEknL5bQbTaA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444730337"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="444730337"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="813699027"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="813699027"
Received: from sptommas-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.216.207])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:28 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 09:47:02 +0300
Message-Id: <20230912064709.2802305-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912064709.2802305-1-jouni.hogander@intel.com>
References: <20230912064709.2802305-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 05/12] fixup! drm/i915/display: Remaining
 changes to make xe compile
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

Fixups related to "drm/xe: Add frontbuffer setter/getter for xe_bo"

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index ce08bc4f5219..89005a414bc8 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -233,9 +233,8 @@ static void frontbuffer_release(struct kref *ref)
 
 #ifdef I915
 	i915_ggtt_clear_scanout(obj);
-
-	(void) i915_gem_object_set_frontbuffer(obj, NULL);
 #endif
+	(void) i915_gem_object_set_frontbuffer(obj, NULL);
 	spin_unlock(&intel_bo_to_i915(obj)->display.fb_tracking.lock);
 
 #ifdef I915
@@ -247,17 +246,12 @@ static void frontbuffer_release(struct kref *ref)
 struct intel_frontbuffer *
 intel_frontbuffer_get(struct drm_i915_gem_object *obj)
 {
-#ifdef I915
 	struct drm_i915_private *i915 = intel_bo_to_i915(obj);
-	struct intel_frontbuffer *cur;
-#endif
-	struct intel_frontbuffer *front;
+	struct intel_frontbuffer *front, *cur;
 
-#ifdef I915
 	front = i915_gem_object_get_frontbuffer(obj);
 	if (front)
 		return front;
-#endif
 
 	front = kmalloc(sizeof(*front), GFP_KERNEL);
 	if (!front)
@@ -271,16 +265,14 @@ intel_frontbuffer_get(struct drm_i915_gem_object *obj)
 			 frontbuffer_active,
 			 frontbuffer_retire,
 			 I915_ACTIVE_RETIRE_SLEEPS);
-
+#endif
 	spin_lock(&i915->display.fb_tracking.lock);
 	cur = i915_gem_object_set_frontbuffer(obj, front);
 	spin_unlock(&i915->display.fb_tracking.lock);
 	if (cur != front)
 		kfree(front);
-	return cur;
-#endif
 
-	return front;
+	return cur;
 }
 
 void intel_frontbuffer_put(struct intel_frontbuffer *front)
-- 
2.34.1

