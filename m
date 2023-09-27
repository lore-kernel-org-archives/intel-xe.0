Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8FFE80A9A
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 07:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3CE10E3B1;
	Wed, 27 Sep 2023 07:31:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A086C10E3B1
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 07:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695799903; x=1727335903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jGRZgobSy+lINrMPg3MtSCIQllHsyaMqBOHZ/QmbH2M=;
 b=XqqKNgeLcNtftGcTL0CnXPpV87oG41I29r0uauumSOHPMDjzxVyOqXN2
 iFCB+tcIF0mVwls/aKhceUeDDFQ5UJAHRJxlUWX+JjYQujUybRysk8INQ
 DiFoiakDl3uA6S1tvg9kCrdEzhyRhZPzhwZdqRiZFZekHtfs7K0xxWdmJ
 +LXe9uA32JrEk8a9Ibvg8ihXrwUiQvjG1ayxcdsXITlofBdqvma0+HJNG
 pnyhZsrQkIHmHZzl1mv1iYWIW60typJaj1uSBIlLgigJRJZ/eaPFEZexg
 Y1ZnbgpYN66In/kgrnGBVA7HeaIGqq4psbyPBVtl9txh2/vXo96TbSk22 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="372091622"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="372091622"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 00:31:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="922684499"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="922684499"
Received: from petrovam-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.220.182])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 00:31:41 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 10:31:23 +0300
Message-Id: <20230927073125.3825836-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927073125.3825836-1-jouni.hogander@intel.com>
References: <20230927073125.3825836-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 1/3] Revert "FIXME: drm/i915: fence stuff"
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

This reverts commit 3e04b3baaaeb2ef9f7d9e5f26239b5c41061faf2.

We are about to add xe_sw_fence implementation and we need to remove
this temporary solution.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic.c   |  2 --
 drivers/gpu/drm/i915/display/intel_display.c  | 23 -------------------
 .../drm/i915/display/intel_display_types.h    |  2 --
 3 files changed, 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 3a53b3384685..7cf51dd8c056 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -330,9 +330,7 @@ void intel_atomic_state_free(struct drm_atomic_state *_state)
 	drm_atomic_state_default_release(&state->base);
 	kfree(state->global_objs);
 
-#ifdef I915
 	i915_sw_fence_fini(&state->commit_ready);
-#endif
 
 	kfree(state);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index b2e16cb8d026..505ca587b504 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6867,7 +6867,6 @@ void intel_atomic_helper_free_state_worker(struct work_struct *work)
 
 static void intel_atomic_commit_fence_wait(struct intel_atomic_state *intel_state)
 {
-#ifdef I915
 	struct wait_queue_entry wait_fence, wait_reset;
 	struct drm_i915_private *dev_priv = to_i915(intel_state->base.dev);
 
@@ -6891,24 +6890,6 @@ static void intel_atomic_commit_fence_wait(struct intel_atomic_state *intel_stat
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
@@ -7232,7 +7213,6 @@ static void intel_atomic_commit_work(struct work_struct *work)
 	intel_atomic_commit_tail(state);
 }
 
-#ifdef I915
 static int
 intel_atomic_commit_ready(struct i915_sw_fence *fence,
 			  enum i915_sw_fence_notify notify)
@@ -7258,7 +7238,6 @@ intel_atomic_commit_ready(struct i915_sw_fence *fence,
 
 	return NOTIFY_DONE;
 }
-#endif
 
 static void intel_atomic_track_fbs(struct intel_atomic_state *state)
 {
@@ -7282,11 +7261,9 @@ int intel_atomic_commit(struct drm_device *dev, struct drm_atomic_state *_state,
 
 	state->wakeref = intel_runtime_pm_get(&dev_priv->runtime_pm);
 
-#ifdef I915
 	drm_atomic_state_get(&state->base);
 	i915_sw_fence_init(&state->commit_ready,
 			   intel_atomic_commit_ready);
-#endif
 
 	/*
 	 * The intel_legacy_cursor_update() fast path takes care
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index c0931d89d0dd..b1141fb125c8 100644
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

