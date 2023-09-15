Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FF6EE6431
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 07:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54EC010E5CF;
	Fri, 15 Sep 2023 07:49:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550D910E5C9
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 07:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694764148; x=1726300148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4z/brZm+SiGkqxHnCbu1RHRr3+olPnMo02hdqGn6WS4=;
 b=P0vA7qvS5NHTWnSf18Pkm/3GKe6M9asaguF9BLsDKSsKgV/e1ZooXL+5
 nvx51Do1kyrDkjKFsMHzfIFGePHvSS7OAoE7CfHB42Fa0YUdITF/HSlvL
 iL7jLnhCZ55KE2tyv6fAeSvCNH+oua3md4xKIqQg+N7Qc98uw4d+MMW37
 C/1qkheEZWcMvtXSZGDvWWzMSyVSOgj39Off0gvRbBDSrKEHVCNBJ/wkF
 8xZHFz/ioqdddQH3XCTrWz7lcXf9q6TsLCAlEHHyU7O3+s5TuWdJiBhXO
 6YGiSUOkAru034ENDJhqgiPDVNKPlcI+DueVbRRjr+qzYAXOuSEvgxR4x Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="369507591"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="369507591"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:48:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="1075711647"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="1075711647"
Received: from cohrs-mobl1.ger.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.48.100])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:48:44 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 10:48:16 +0300
Message-Id: <20230915074818.903353-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915074818.903353-1-jouni.hogander@intel.com>
References: <20230915074818.903353-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/7] drm/i915: Add new frontbuffer tracking
 interface to queue flush
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

We want to wait dma fences in dirtyfb ioctl. As we don't want to make
dirtyfb ioctl as blocking call we need to use
dma_fence_add_callback. Callback used for dma_fence_add_callback is
called from atomic context. Due to this we need to add a new
frontbuffer tracking interface to queue flush.

v3:
 - Check schedule work success rather than work being pending
 - Init flush work when frontbuffer struct is initialized
v2: Check if flush work is already pending

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230901093500.3463046-4-jouni.hogander@intel.com
(cherry picked from commit 40320844ca8bda4def0f04d2bd8c2022c867ed86)
---
 .../gpu/drm/i915/display/intel_frontbuffer.c  | 29 +++++++++++++++++++
 .../gpu/drm/i915/display/intel_frontbuffer.h  |  4 +++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 15302ea9cc4e..b90f616e9033 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -203,6 +203,33 @@ void __intel_fb_flush(struct intel_frontbuffer *front,
 		frontbuffer_flush(i915, frontbuffer_bits, origin);
 }
 
+static void intel_frontbuffer_flush_work(struct work_struct *work)
+{
+	struct intel_frontbuffer *front =
+		container_of(work, struct intel_frontbuffer, flush_work);
+
+	i915_gem_object_flush_if_display(front->obj);
+	intel_frontbuffer_flush(front, ORIGIN_DIRTYFB);
+	intel_frontbuffer_put(front);
+}
+
+/**
+ * intel_frontbuffer_queue_flush - queue flushing frontbuffer object
+ * @front: GEM object to flush
+ *
+ * This function is targeted for our dirty callback for queueing flush when
+ * dma fence is signales
+ */
+void intel_frontbuffer_queue_flush(struct intel_frontbuffer *front)
+{
+	if (!front)
+		return;
+
+	kref_get(&front->ref);
+	if (!schedule_work(&front->flush_work))
+		intel_frontbuffer_put(front);
+}
+
 static int frontbuffer_active(struct i915_active *ref)
 {
 	struct intel_frontbuffer *front =
@@ -259,6 +286,8 @@ intel_frontbuffer_get(struct drm_i915_gem_object *obj)
 			 frontbuffer_active,
 			 frontbuffer_retire,
 			 I915_ACTIVE_RETIRE_SLEEPS);
+	INIT_WORK(&front->flush_work, intel_frontbuffer_flush_work);
+
 	spin_lock(&i915->display.fb_tracking.lock);
 	cur = i915_gem_object_set_frontbuffer(obj, front);
 	spin_unlock(&i915->display.fb_tracking.lock);
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.h b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
index fe6764eb7942..00467d513e74 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.h
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
@@ -50,6 +50,8 @@ struct intel_frontbuffer {
 	struct i915_active write;
 	struct drm_i915_gem_object *obj;
 	struct rcu_head rcu;
+
+	struct work_struct flush_work;
 };
 
 /*
@@ -139,6 +141,8 @@ static inline void intel_frontbuffer_flush(struct intel_frontbuffer *front,
 	__intel_fb_flush(front, origin, frontbuffer_bits);
 }
 
+void intel_frontbuffer_queue_flush(struct intel_frontbuffer *front);
+
 void intel_frontbuffer_track(struct intel_frontbuffer *old,
 			     struct intel_frontbuffer *new,
 			     unsigned int frontbuffer_bits);
-- 
2.34.1

