Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE69C3DA66
	for <intel-xe@archiver.kernel.org>; Fri, 25 Aug 2023 09:39:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8021910E64E;
	Fri, 25 Aug 2023 09:39:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452B710E64D
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Aug 2023 09:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692956369; x=1724492369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7KdkfvYN0Zvy1G89giLqnoPGEecBFAzZo0X7Ax2l1lg=;
 b=LBcSQIEK0PCBmP/n9LZAdwm32V9++Jvs1gPgHq+Ae6xPhtM6JOcP7ZlF
 X2vHM95f3MhcS3p31CSd5GSAz5JLcDm1jo+yUCWlC6scgPS8vT0kR/rOb
 scu6h3ZberNjyAbAniYkU0VDM7BG4r7zPefsPQpIY9AnRZ1V96pPPFuOG
 /IKfcTFeZnRMWbwZRI9FHK68iSpa7R/QDrUOmgLV0RUTci18d44vd7mD+
 076EmQ+kSkyb9nBTWsSBeZK0BDpJrYwwtoiEZv6UNWdep3tKISMf8V9ik
 sKWj2mxstbA9t+y8Rc2sLK9OoGp4UNxNKbeULXv1iF58wVIWePfCuEurM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="461037116"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="461037116"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="687246824"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="687246824"
Received: from janlundk-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.56.87])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:27 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 25 Aug 2023 12:38:57 +0300
Message-Id: <20230825093904.1230143-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825093904.1230143-1-jouni.hogander@intel.com>
References: <20230825093904.1230143-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 05/12] fixup! drm/i915/display: Remaining changes
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

Fixups related to "drm/xe: Add struct i915_active for Xe", "drm/xe: Add
i915_active.h compatibility header" and "drm/xe/display: Include
i916_active header".

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 6 +-----
 drivers/gpu/drm/i915/display/intel_frontbuffer.h | 2 --
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 4f651cbec1c5..452d77594783 100644
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
@@ -237,9 +235,9 @@ static void frontbuffer_release(struct kref *ref)
 	i915_gem_object_set_frontbuffer(obj, NULL);
 	spin_unlock(&intel_bo_to_i915(obj)->display.fb_tracking.lock);
 
-#ifdef I915
 	i915_active_fini(&front->write);
 
+#ifdef I915
 	i915_gem_object_put(obj);
 #endif
 	kfree_rcu(front, rcu);
@@ -262,12 +260,10 @@ intel_frontbuffer_get(struct drm_i915_gem_object *obj)
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

