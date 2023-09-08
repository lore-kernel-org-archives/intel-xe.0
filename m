Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5287EE7FE1
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 12:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AE210E8A2;
	Fri,  8 Sep 2023 12:24:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CEE10E8A2
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 12:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694175879; x=1725711879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nuzHn5uTRX2zP94RM/C95P7O56pumr8LJNaO/YshBsM=;
 b=eHT6a2VTPc1iFTJcWJDKQla+Erm5kuSphjv80oTkQO4c/SobFBIN74QU
 TraexDdNDQyLDqxygdLg7TScPgUWZwg81ayec8l8uCX9ySOu+plskkF/e
 f72SMuMv+4fjfLDNUl/dbEMhUoBUCnur35k7bHN+oSxJJZ09e4CPYJVqB
 bU88Y5m1GX9PsBdkC49/xLkkS3urKrfwXVEAL9XtF9vJnHy0+VyW190Hf
 zJygvc6/fN+i2d/snrJ9wcvQh6kDTZe1qXIY7LzhMr8d7yK6Sl7cA8QLw
 HIfIV+3WP3bvDtSHc6q7WdOhpRX2J/xrXN/FaJgMxs/h7indSikeY6U3x w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="441650052"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="441650052"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 05:24:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="692244184"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="692244184"
Received: from akorchin-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.73])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 05:24:37 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  8 Sep 2023 15:24:08 +0300
Message-Id: <20230908122415.1886366-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230908122415.1886366-1-jouni.hogander@intel.com>
References: <20230908122415.1886366-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 04/11] fixup! drm/i915/display: Remaining
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
index ed62a1c48cce..0c8c30bf580d 100644
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

