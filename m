Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1023DCCFA1E
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A911210EB83;
	Fri,  7 Nov 2025 18:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RabG9YhE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D8210EB7B
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539211; x=1794075211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9mUBj2WXPqjDfsIuYVocl2aOEq3k8oW2vNln0rn6P1Q=;
 b=RabG9YhEX7e96fxnAagXuDpqqkHjNuKnTf2ReE3+c2MoLBeiGtngg6bN
 eBdHKUjT3ORlw6v1Igj6IRpPpxVvxuowRVGHVtJoLkjgaDuFHVnX/XB5L
 O4KPUhnpA2y04TEWqGBSyElCv/wF03f9DAaRYY0uZvWf7i6oVeke/Uo5U
 zp3Uke+hq50aLN9w5H3ThTLZ0IArT24Hho8uzAIYjlSaKAagJuWVBCKGf
 ntSprswXWeba5ErZwQR4elhaweennQfCo6PrI1ozEtv+cJAiyulkUo+1T
 l7ZzVI5hzlf7ZtXl6e1cuc/3+lkMm5bWJrHaA/kK7MdgB+Anzgny7bb8n g==;
X-CSE-ConnectionGUID: x50ZQsNTQYCtDN37rsdrXw==
X-CSE-MsgGUID: 1dW5Sb/vRzW0em24EpVh0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64733152"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64733152"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:30 -0800
X-CSE-ConnectionGUID: LCHUG3NQStG1L8om3u/aqQ==
X-CSE-MsgGUID: nmvT180tQ+2sZnOtHX7ixA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271207"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:30 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 19/33] drm/xe/display: Use scoped-cleanup
Date: Fri,  7 Nov 2025 10:13:35 -0800
Message-ID: <20251107181315.631642-54-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Eliminate some goto-based cleanup by utilizing scoped cleanup helpers.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c   | 24 +++++++++---------------
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 23 +++++++----------------
 2 files changed, 16 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 1fd4a815e784..33f5b031a21c 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -210,10 +210,10 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	/* TODO: Consider sharing framebuffer mapping?
 	 * embed i915_vma inside intel_framebuffer
 	 */
-	xe_pm_runtime_get_noresume(xe);
-	ret = mutex_lock_interruptible(&ggtt->lock);
-	if (ret)
-		goto out;
+	guard(xe_pm_runtime_noresume)(xe);
+	ACQUIRE(mutex_intr, lock)(&ggtt->lock);
+	if ((ret = ACQUIRE_ERR(mutex_intr, &lock)))
+		return ret;
 
 	align = XE_PAGE_SIZE;
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
@@ -223,15 +223,13 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 		vma->node = bo->ggtt_node[tile0->id];
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		vma->node = xe_ggtt_node_init(ggtt);
-		if (IS_ERR(vma->node)) {
-			ret = PTR_ERR(vma->node);
-			goto out_unlock;
-		}
+		if (IS_ERR(vma->node))
+			return PTR_ERR(vma->node);
 
 		ret = xe_ggtt_node_insert_locked(vma->node, xe_bo_size(bo), align, 0);
 		if (ret) {
 			xe_ggtt_node_fini(vma->node);
-			goto out_unlock;
+			return ret;
 		}
 
 		xe_ggtt_map_bo(ggtt, vma->node, bo, xe->pat.idx[XE_CACHE_NONE]);
@@ -245,13 +243,13 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 		vma->node = xe_ggtt_node_init(ggtt);
 		if (IS_ERR(vma->node)) {
 			ret = PTR_ERR(vma->node);
-			goto out_unlock;
+			return ret;
 		}
 
 		ret = xe_ggtt_node_insert_locked(vma->node, size, align, 0);
 		if (ret) {
 			xe_ggtt_node_fini(vma->node);
-			goto out_unlock;
+			return ret;
 		}
 
 		ggtt_ofs = vma->node->base.start;
@@ -265,10 +263,6 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 					   rot_info->plane[i].dst_stride);
 	}
 
-out_unlock:
-	mutex_unlock(&ggtt->lock);
-out:
-	xe_pm_runtime_put(xe);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 80fd3844c41c..084baddb160e 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -37,7 +37,6 @@ bool intel_hdcp_gsc_check_status(struct drm_device *drm)
 	struct xe_gt *gt = tile->media_gt;
 	struct xe_gsc *gsc = &gt->uc.gsc;
 	bool ret = true;
-	struct xe_force_wake_ref fw_ref;
 
 	if (!gsc || !xe_uc_fw_is_enabled(&gsc->fw)) {
 		drm_dbg_kms(&xe->drm,
@@ -45,21 +44,17 @@ bool intel_hdcp_gsc_check_status(struct drm_device *drm)
 		return false;
 	}
 
-	xe_pm_runtime_get(xe);
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
+	guard(xe_pm_runtime)(xe);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
 	if (!fw_ref.domains) {
 		drm_dbg_kms(&xe->drm,
 			    "failed to get forcewake to check proxy status\n");
-		ret = false;
-		goto out;
+		return false;
 	}
 
 	if (!xe_gsc_proxy_init_done(gsc))
 		ret = false;
 
-	xe_force_wake_put(fw_ref);
-out:
-	xe_pm_runtime_put(xe);
 	return ret;
 }
 
@@ -166,17 +161,15 @@ ssize_t intel_hdcp_gsc_msg_send(struct intel_hdcp_gsc_context *gsc_context,
 	u32 addr_out_off, addr_in_wr_off = 0;
 	int ret, tries = 0;
 
-	if (msg_in_len > max_msg_size || msg_out_len > max_msg_size) {
-		ret = -ENOSPC;
-		goto out;
-	}
+	if (msg_in_len > max_msg_size || msg_out_len > max_msg_size)
+		return -ENOSPC;
 
 	msg_size_in = msg_in_len + HDCP_GSC_HEADER_SIZE;
 	msg_size_out = msg_out_len + HDCP_GSC_HEADER_SIZE;
 	addr_out_off = PAGE_SIZE;
 
 	host_session_id = xe_gsc_create_host_session_id();
-	xe_pm_runtime_get_noresume(xe);
+	guard(xe_pm_runtime_noresume)(xe);
 	addr_in_wr_off = xe_gsc_emit_header(xe, &gsc_context->hdcp_bo->vmap,
 					    addr_in_wr_off, HECI_MEADDRESS_HDCP,
 					    host_session_id, msg_in_len);
@@ -201,13 +194,11 @@ ssize_t intel_hdcp_gsc_msg_send(struct intel_hdcp_gsc_context *gsc_context,
 	} while (++tries < 20);
 
 	if (ret)
-		goto out;
+		return ret;
 
 	xe_map_memcpy_from(xe, msg_out, &gsc_context->hdcp_bo->vmap,
 			   addr_out_off + HDCP_GSC_HEADER_SIZE,
 			   msg_out_len);
 
-out:
-	xe_pm_runtime_put(xe);
 	return ret;
 }
-- 
2.51.1

