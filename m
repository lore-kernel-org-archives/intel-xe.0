Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E9FC4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 06:48:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2C710E270;
	Mon,  6 Nov 2023 06:48:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EE210E26E
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 06:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699253334; x=1730789334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GxJ4TG+lF5+oEtkK6Pb1POsFU28/8k4Pw5mcbZBqlOc=;
 b=kC454/ozXbBVfRB+NIUUQImHCOr8BhnI+lesADxoVsPaBykpToKh8dll
 1VceRAG/vGIESFabRAm0+q3xC3OkQvju8l9PxAuIC9IjlWlV/KaijOAYE
 f85HXEx/6vvu2/il2igL6Nwn+WLkYMSA8IePRV8vxgXOBqaTbA6hJA5tG
 xZrZpJIUWxjl0cYE+wqrQQsJ40cyyqiP0EJlRcF9JQft3RMyluhT1U6Y7
 JSqrvUOKWXVuh9Q4NPcXHwSxqki9tHlfg98ywVc1iel5W7Nxj5uhuWuEM
 DfpfteU0+ATC1NfgTAUnXdAW93ZJxctimPL+67pbOur/yNe3IHORrJlzO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369424625"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; d="scan'208";a="369424625"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:48:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="3534598"
Received: from rdegreef-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.42.181])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:48:52 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 08:48:28 +0200
Message-Id: <20231106064834.161647-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106064834.161647-1-jouni.hogander@intel.com>
References: <20231106064834.161647-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/8] Revert "FIXME: drm/i915: fence stuff"
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

This reverts commit 71d917d54a6083bea663977b4ff0b40b3a1faa94.

Next patch will backport common dma fence handling for Xe and i915 ->
revert temporary hack.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic.c   |  2 --
 drivers/gpu/drm/i915/display/intel_display.c  | 23 -------------------
 .../drm/i915/display/intel_display_types.h    |  2 --
 3 files changed, 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index f0f38a86b8ad..5d18145da279 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -332,9 +332,7 @@ void intel_atomic_state_free(struct drm_atomic_state *_state)
 	drm_atomic_state_default_release(&state->base);
 	kfree(state->global_objs);
 
-#ifdef I915
 	i915_sw_fence_fini(&state->commit_ready);
-#endif
 
 	kfree(state);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9874025cb77e..d4b4334d0f6f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7056,7 +7056,6 @@ void intel_atomic_helper_free_state_worker(struct work_struct *work)
 
 static void intel_atomic_commit_fence_wait(struct intel_atomic_state *intel_state)
 {
-#ifdef I915
 	struct wait_queue_entry wait_fence, wait_reset;
 	struct drm_i915_private *dev_priv = to_i915(intel_state->base.dev);
 
@@ -7080,24 +7079,6 @@ static void intel_atomic_commit_fence_wait(struct intel_atomic_state *intel_stat
 	finish_wait(bit_waitqueue(&to_gt(dev_priv)->reset.flags,
 				  I915_RESET_MODESET),
 		    &wait_reset);
-#else
-	struct intel_plane_state *plane_state;
-	struct intel_plane *plane;
-	int i;
-
-	for_each_new_intel_plane_in_state(intel_state, plane, plane_state, i) {
-		struct xe_bo *bo;
-
-		if (plane_state->uapi.fence)
-			dma_fence_wait(plane_state->uapi.fence, false);
-		bo = intel_fb_obj(plane_state->hw.fb);
-		if (!bo)
-			continue;
-
-		/* TODO: May deadlock, need to grab all fences in prepare_plane_fb */
-		dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL, false, MAX_SCHEDULE_TIMEOUT);
-	}
-#endif
 }
 
 static void intel_atomic_cleanup_work(struct work_struct *work)
@@ -7423,7 +7404,6 @@ static void intel_atomic_commit_work(struct work_struct *work)
 	intel_atomic_commit_tail(state);
 }
 
-#ifdef I915
 static int
 intel_atomic_commit_ready(struct i915_sw_fence *fence,
 			  enum i915_sw_fence_notify notify)
@@ -7449,7 +7429,6 @@ intel_atomic_commit_ready(struct i915_sw_fence *fence,
 
 	return NOTIFY_DONE;
 }
-#endif
 
 static void intel_atomic_track_fbs(struct intel_atomic_state *state)
 {
@@ -7473,11 +7452,9 @@ int intel_atomic_commit(struct drm_device *dev, struct drm_atomic_state *_state,
 
 	state->wakeref = intel_runtime_pm_get(&dev_priv->runtime_pm);
 
-#ifdef I915
 	drm_atomic_state_get(&state->base);
 	i915_sw_fence_init(&state->commit_ready,
 			   intel_atomic_commit_ready);
-#endif
 
 	/*
 	 * The intel_legacy_cursor_update() fast path takes care
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 1861372077f0..df2681258ef1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -672,9 +672,7 @@ struct intel_atomic_state {
 
 	bool rps_interactive;
 
-#ifdef I915
 	struct i915_sw_fence commit_ready;
-#endif
 
 	struct llist_node freed;
 };
-- 
2.34.1

