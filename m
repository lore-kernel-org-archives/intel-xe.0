Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8097FEE7FE3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 12:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4318210E8A5;
	Fri,  8 Sep 2023 12:24:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1588910E8A4
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 12:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694175883; x=1725711883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xXAy0vAIADV9G2ARaG6ilvccT4KKY1GIq7y/SLpAIuc=;
 b=CwOOY2vPAXwzF4DXM9plm6YqQr5CBqwhciMh7KI00N89ycEJBzGFQr4O
 ZjO0bLTM+C5y243eHKqgD1D9hQdDA6R4tIC/dkA4mXYe/04ab5IfoTICv
 dXgdQ1gRWbKLxEufViR4sbWffh629Mju/1xGK3qFf516N8laXbUcjjdmC
 VhJcIounEmBGf2j2KGxVax0CXhGgAFZxt//1CWiNupAa89k8xTLiqbsAc
 HsC60+364Td8afT9HtcpR0iKbVYb0p5AdVxeiAK39qGtafYPlMdYrSUT0
 A/S7h2jmr5dUKIoGxDlTdx4XNKqiTCgtuFRp6MKTWrUvShJTQt5o0gBez g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="441650054"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="441650054"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 05:24:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="692244204"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="692244204"
Received: from akorchin-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.73])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 05:24:40 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  8 Sep 2023 15:24:10 +0300
Message-Id: <20230908122415.1886366-7-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230908122415.1886366-1-jouni.hogander@intel.com>
References: <20230908122415.1886366-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 06/11] fixup! drm/i915/display: Remaining
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

Fixups related to "drm/xe: Add struct i915_active for Xe", "drm/xe: Add
i915_active.h compatibility header" and "drm/xe/display: Include
i916_active header".

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 6 ------
 drivers/gpu/drm/i915/display/intel_frontbuffer.h | 2 --
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 0c8c30bf580d..b7b11e74d796 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -202,7 +202,6 @@ void __intel_fb_flush(struct intel_frontbuffer *front,
 		frontbuffer_flush(i915, frontbuffer_bits, origin);
 }
 
-#ifdef I915
 static int frontbuffer_active(struct i915_active *ref)
 {
 	struct intel_frontbuffer *front =
@@ -220,7 +219,6 @@ static void frontbuffer_retire(struct i915_active *ref)
 	intel_frontbuffer_flush(front, ORIGIN_CS);
 	intel_frontbuffer_put(front);
 }
-#endif
 
 static void frontbuffer_release(struct kref *ref)
 	__releases(&intel_bo_to_i915(front->obj)->display.fb_tracking.lock)
@@ -237,9 +235,7 @@ static void frontbuffer_release(struct kref *ref)
 	i915_gem_object_set_frontbuffer(obj, NULL);
 	spin_unlock(&intel_bo_to_i915(obj)->display.fb_tracking.lock);
 
-#ifdef I915
 	i915_active_fini(&front->write);
-#endif
 	kfree_rcu(front, rcu);
 }
 
@@ -260,12 +256,10 @@ intel_frontbuffer_get(struct drm_i915_gem_object *obj)
 	front->obj = obj;
 	kref_init(&front->ref);
 	atomic_set(&front->bits, 0);
-#ifdef I915
 	i915_active_init(&front->write,
 			 frontbuffer_active,
 			 frontbuffer_retire,
 			 I915_ACTIVE_RETIRE_SLEEPS);
-#endif
 	spin_lock(&i915->display.fb_tracking.lock);
 	cur = i915_gem_object_set_frontbuffer(obj, front);
 	spin_unlock(&i915->display.fb_tracking.lock);
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.h b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
index 30c4722ff7e0..fe6764eb7942 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.h
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
@@ -47,9 +47,7 @@ enum fb_op_origin {
 struct intel_frontbuffer {
 	struct kref ref;
 	atomic_t bits;
-#ifdef I915
 	struct i915_active write;
-#endif
 	struct drm_i915_gem_object *obj;
 	struct rcu_head rcu;
 };
-- 
2.34.1

