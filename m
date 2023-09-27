Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A6AE80A9A
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 07:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60C810E416;
	Wed, 27 Sep 2023 07:31:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F86210E3B1
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 07:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695799905; x=1727335905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A7vJbc1XIdcLoIBJ3wMd1DAbYs4wLUNlb/j4AICfPHg=;
 b=de7sKONEreFwPNAH3NekPHudWqB3wCABCL8blk9cK7TjIk4psM0v54dc
 fjQn/0A5h6tZqANgavCFvp5FXW8AKJBfLcZnJl6TPt7W9qZoE+hnTcwuG
 Tg+oN8dfI8wc+NALRdZ/i8z8vLd7jvW3my+QjA3Y3V73Ll6N/yGXy4cyV
 SiKGli1ggzYpdfRqlx4KGTbRirKnMnCH3xr45177zdXIA5xandtLPX68k
 mfBiyuS29v/Rdd9owCSHSIwbX0w6gMs2PGQ2ikjTg6HxOchIJ+4PQNYnS
 91aM9EUwX1jae8gM/AeZY0vhLcR7gyeH19ZPPzz9sKZbxh3HV3PZ+moDI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="372091624"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="372091624"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 00:31:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="922684502"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="922684502"
Received: from petrovam-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.220.182])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 00:31:43 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 10:31:24 +0300
Message-Id: <20230927073125.3825836-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927073125.3825836-1-jouni.hogander@intel.com>
References: <20230927073125.3825836-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 2/3] drm/i915/display: Move fence completion
 wait away from display code
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

We are preparing for Xe which will have differing implementation
for sw fence and GPU reset. Due to thise move waiting fence completion
and GPU reset wait awary from the display code.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 27 +------------------
 drivers/gpu/drm/i915/i915_sw_fence.c         | 28 ++++++++++++++++++++
 drivers/gpu/drm/i915/i915_sw_fence.h         |  4 +++
 3 files changed, 33 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 505ca587b504..c92f5f3629be 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6865,33 +6865,8 @@ void intel_atomic_helper_free_state_worker(struct work_struct *work)
 	intel_atomic_helper_free_state(dev_priv);
 }
 
-static void intel_atomic_commit_fence_wait(struct intel_atomic_state *intel_state)
-{
-	struct wait_queue_entry wait_fence, wait_reset;
-	struct drm_i915_private *dev_priv = to_i915(intel_state->base.dev);
-
-	init_wait_entry(&wait_fence, 0);
-	init_wait_entry(&wait_reset, 0);
-	for (;;) {
-		prepare_to_wait(&intel_state->commit_ready.wait,
-				&wait_fence, TASK_UNINTERRUPTIBLE);
-		prepare_to_wait(bit_waitqueue(&to_gt(dev_priv)->reset.flags,
-					      I915_RESET_MODESET),
-				&wait_reset, TASK_UNINTERRUPTIBLE);
 
 
-		if (i915_sw_fence_done(&intel_state->commit_ready) ||
-		    test_bit(I915_RESET_MODESET, &to_gt(dev_priv)->reset.flags))
-			break;
-
-		schedule();
-	}
-	finish_wait(&intel_state->commit_ready.wait, &wait_fence);
-	finish_wait(bit_waitqueue(&to_gt(dev_priv)->reset.flags,
-				  I915_RESET_MODESET),
-		    &wait_reset);
-}
-
 static void intel_atomic_cleanup_work(struct work_struct *work)
 {
 	struct intel_atomic_state *state =
@@ -6997,7 +6972,7 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	intel_wakeref_t wakeref = 0;
 	int i;
 
-	intel_atomic_commit_fence_wait(state);
+	i915_sw_fence_wait_completion(dev_priv, &state->commit_ready);
 
 	drm_atomic_helper_wait_for_dependencies(&state->base);
 	drm_dp_mst_atomic_wait_for_dependencies(&state->base);
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index 8a9aad523eec..f2e0c5138cb2 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -9,6 +9,7 @@
 #include <linux/irq_work.h>
 #include <linux/dma-resv.h>
 
+#include "i915_drv.h"
 #include "i915_sw_fence.h"
 #include "i915_selftest.h"
 
@@ -597,6 +598,33 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
 	return ret;
 }
 
+void i915_sw_fence_wait_completion(struct drm_i915_private *i915,
+				   struct i915_sw_fence *fence)
+{
+	struct wait_queue_entry wait_fence, wait_reset;
+
+	init_wait_entry(&wait_fence, 0);
+	init_wait_entry(&wait_reset, 0);
+	for (;;) {
+		prepare_to_wait(&fence->wait,
+				&wait_fence, TASK_UNINTERRUPTIBLE);
+		prepare_to_wait(bit_waitqueue(&to_gt(i915)->reset.flags,
+					      I915_RESET_MODESET),
+				&wait_reset, TASK_UNINTERRUPTIBLE);
+
+
+		if (i915_sw_fence_done(fence) ||
+		    test_bit(I915_RESET_MODESET, &to_gt(i915)->reset.flags))
+			break;
+
+		schedule();
+	}
+	finish_wait(&fence->wait, &wait_fence);
+	finish_wait(bit_waitqueue(&to_gt(i915)->reset.flags,
+				  I915_RESET_MODESET),
+		    &wait_reset);
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/lib_sw_fence.c"
 #include "selftests/i915_sw_fence.c"
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.h b/drivers/gpu/drm/i915/i915_sw_fence.h
index f752bfc7c6e1..a48d017de59d 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.h
+++ b/drivers/gpu/drm/i915/i915_sw_fence.h
@@ -15,6 +15,7 @@
 #include <linux/notifier.h> /* for NOTIFY_DONE */
 #include <linux/wait.h>
 
+struct drm_i915_private;
 struct completion;
 struct dma_resv;
 struct i915_sw_fence;
@@ -98,6 +99,9 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
 bool i915_sw_fence_await(struct i915_sw_fence *fence);
 void i915_sw_fence_complete(struct i915_sw_fence *fence);
 
+void i915_sw_fence_wait_completion(struct drm_i915_private *i915,
+				   struct i915_sw_fence *fence);
+
 static inline bool i915_sw_fence_signaled(const struct i915_sw_fence *fence)
 {
 	return atomic_read(&fence->pending) <= 0;
-- 
2.34.1

