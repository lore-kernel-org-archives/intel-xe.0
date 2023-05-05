Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376FBC77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 08:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFE710E5A6;
	Fri,  5 May 2023 08:30:49 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F86E10E5B5
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 08:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683275447; x=1714811447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vKaWSFlb4hshDRjfyCtl9E0uW+BETlJDVx9sHFnJQTE=;
 b=H1J/y/4b7Zxl+pk5WHyYyZubIe9J2639dwpu7r5vTe+gvNQBpBSPiMLF
 aRR/P55UTxQ3d7NjvuoSLWURYrGoY8+FWoSYtLpfbLVY4EjeRLBGYk+rK
 Bc/h6ncxYX+HWMGa51k9rrWEUnQxErJCU9St1Ll8VJ06R/iyjRvb6do1Z
 Z148C3AktUaBkFApNvhtsYtjq6aZXvQqrwGACl36Wp8+kLp+yN+WyoOnG
 ctny61aQTGBkW1eIy8bDoRetWfy/bXYoJI1rw6pMfoPoh7jVARiWSqF5v
 kAMhjq1bHMQSIBs2cpmrOOq0bf9H/PaMSZhUeKdSkJxQXdQPUJoI1+oH3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328783189"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="328783189"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="943749127"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="943749127"
Received: from pklosowski.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.36.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:30:43 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 11:29:41 +0300
Message-Id: <20230505082956.2247875-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505082956.2247875-1-jouni.hogander@intel.com>
References: <20230505082956.2247875-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 05/20] drm/i915/display: Change
 __intel_frontbuffer_get parameter
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
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Change__intel_frontbuffer_get to take intel_frontbuffer pointer instead of
i915_gem_object pointer. This allows us to remove including
gem/i915_gem_object_types.h.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 2 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.h | 9 ++++-----
 drivers/gpu/drm/i915/gem/i915_gem_object.c       | 4 ++--
 drivers/gpu/drm/i915/i915_vma.c                  | 2 +-
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 17a7aa8b28c2..783ab1ab7f62 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -252,7 +252,7 @@ intel_frontbuffer_get(struct drm_i915_gem_object *obj)
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct intel_frontbuffer *front;
 
-	front = __intel_frontbuffer_get(obj);
+	front = __intel_frontbuffer_get(obj->frontbuffer);
 	if (front)
 		return front;
 
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.h b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
index 3c474ed937fb..a3d47ab619cc 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.h
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
@@ -28,7 +28,6 @@
 #include <linux/bits.h>
 #include <linux/kref.h>
 
-#include "gem/i915_gem_object_types.h"
 #include "i915_active_types.h"
 
 struct drm_i915_private;
@@ -76,23 +75,23 @@ void intel_frontbuffer_flip(struct drm_i915_private *i915,
 void intel_frontbuffer_put(struct intel_frontbuffer *front);
 
 static inline struct intel_frontbuffer *
-__intel_frontbuffer_get(const struct drm_i915_gem_object *obj)
+__intel_frontbuffer_get(struct intel_frontbuffer *frontbuffer)
 {
 	struct intel_frontbuffer *front;
 
-	if (likely(!rcu_access_pointer(obj->frontbuffer)))
+	if (likely(!rcu_access_pointer(frontbuffer)))
 		return NULL;
 
 	rcu_read_lock();
 	do {
-		front = rcu_dereference(obj->frontbuffer);
+		front = rcu_dereference(frontbuffer);
 		if (!front)
 			break;
 
 		if (unlikely(!kref_get_unless_zero(&front->ref)))
 			continue;
 
-		if (likely(front == rcu_access_pointer(obj->frontbuffer)))
+		if (likely(front == rcu_access_pointer(frontbuffer)))
 			break;
 
 		intel_frontbuffer_put(front);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 4666bb82f312..7f5842aba48a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -405,7 +405,7 @@ void __i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
 {
 	struct intel_frontbuffer *front;
 
-	front = __intel_frontbuffer_get(obj);
+	front = __intel_frontbuffer_get(obj->frontbuffer);
 	if (front) {
 		intel_frontbuffer_flush(front, origin);
 		intel_frontbuffer_put(front);
@@ -417,7 +417,7 @@ void __i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object *obj,
 {
 	struct intel_frontbuffer *front;
 
-	front = __intel_frontbuffer_get(obj);
+	front = __intel_frontbuffer_get(obj->frontbuffer);
 	if (front) {
 		intel_frontbuffer_invalidate(front, origin);
 		intel_frontbuffer_put(front);
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 20a44788999e..008d4eb42f10 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1906,7 +1906,7 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
 	if (flags & EXEC_OBJECT_WRITE) {
 		struct intel_frontbuffer *front;
 
-		front = __intel_frontbuffer_get(obj);
+		front = __intel_frontbuffer_get(obj->frontbuffer);
 		if (unlikely(front)) {
 			if (intel_frontbuffer_invalidate(front, ORIGIN_CS))
 				i915_active_add_request(&front->write, rq);
-- 
2.34.1

