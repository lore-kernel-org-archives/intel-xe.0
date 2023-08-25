Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEC5C7EE2C
	for <intel-xe@archiver.kernel.org>; Fri, 25 Aug 2023 09:39:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830CE10E64F;
	Fri, 25 Aug 2023 09:39:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A210C10E64C
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Aug 2023 09:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692956366; x=1724492366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QqgdvrUWFobGwYEvSz1kbMj/cGFFkghXpg9ys8R3rmA=;
 b=igh3SJvzMIYAjdLb8mzUhGqCHwfvf56u+/D/or3S03CU54Fi97DbzpWm
 5BCB3rXdL+UKGH1WuKNc1WCx1oHWDO7KQmKXK7CtISQm7M8b1CqYf7niw
 xzCk6VQJNZ7z4IIeeYK+LWIyKdSsuK0VUBchqVQE5+U/rCq76LCuL1Nxk
 xHBNjQIbqnDWoRKY+wHL6XnYaG/3H8iQ3RYht5Oz0BaamVZP8QWPfGvUg
 gnvPb2oV+MZWmoutvPJwQ27KNs/by5apw/WpTKg7q+ZqeN81k3uv7Vhpl
 5R4acJT1QPshoRdh2aiKzlENH8WGOO6qpLweP9qe1/ZpJlKSq7JKYr0o+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="461037109"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="461037109"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="687246779"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="687246779"
Received: from janlundk-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.56.87])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:25 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 25 Aug 2023 12:38:55 +0300
Message-Id: <20230825093904.1230143-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825093904.1230143-1-jouni.hogander@intel.com>
References: <20230825093904.1230143-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 03/12] fixup! drm/i915/display: Remaining changes
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fixups related to "drm/xe: Add frontbuffer setter/getter for xe_bo"

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index bfd348e72d09..4f651cbec1c5 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -233,9 +233,8 @@ static void frontbuffer_release(struct kref *ref)
 
 #ifdef I915
 	i915_ggtt_clear_scanout(obj);
-
-	i915_gem_object_set_frontbuffer(obj, NULL);
 #endif
+	i915_gem_object_set_frontbuffer(obj, NULL);
 	spin_unlock(&intel_bo_to_i915(obj)->display.fb_tracking.lock);
 
 #ifdef I915
@@ -249,17 +248,12 @@ static void frontbuffer_release(struct kref *ref)
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
@@ -273,16 +267,14 @@ intel_frontbuffer_get(struct drm_i915_gem_object *obj)
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

