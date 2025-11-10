Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91584CD13D2
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:20:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C32110E4A4;
	Mon, 10 Nov 2025 23:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WepwFUTZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A89610E480
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762816834; x=1794352834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cp3hM6U7JHATX875iMQN8GSoxpxqODElTJQ59fqb0J4=;
 b=WepwFUTZThe4M1CseyCI0Q1IgffZmPB0jK8MdNa4TN1v4kuv2NETXT7C
 cS1EnDqv+ZPgXAdGR4UqHRiLvBYck/5EiBvUQ7AilaoglsoFPcqd5c6Y4
 LV0skP4ieRNb/Blkn50AMS2THM7ffBSl0vg9vOgz/n2b8KapeOzOG8JVI
 JoHZ2MkSpK8N9qHMxFlYq2V38SPwRGOwIh5T+snCv39CrMO25Iks2R9Af
 xImy5yNmJSXu+CWoKeBPy8gMKjioKzVXwnqo0uktQnPttxcpv64o3EdZj
 Haw4+LafPU/gz2g+KkXBLIyv3Qx25REvz3swpfsbBAeW6PW1kj4U81e3c A==;
X-CSE-ConnectionGUID: +1+8bs4xS/2ElrzTcf+hOQ==
X-CSE-MsgGUID: 7tEhmpVxSgyti42q0rn1Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75486452"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75486452"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
X-CSE-ConnectionGUID: 62LLNi+yRNKf92ypbaJyQg==
X-CSE-MsgGUID: qk4CfHY7ROe2ScEh307/Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189243996"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 16/30] drm/xe/display: Use scoped-cleanup
Date: Mon, 10 Nov 2025 15:20:34 -0800
Message-ID: <20251110232017.1475869-48-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110232017.1475869-32-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/xe/display/xe_fb_pin.c   | 23 +++++++++-------------
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 25 ++++++++----------------
 2 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 1fd4a815e784..6a935a75f2a4 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -210,10 +210,11 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	/* TODO: Consider sharing framebuffer mapping?
 	 * embed i915_vma inside intel_framebuffer
 	 */
-	xe_pm_runtime_get_noresume(xe);
-	ret = mutex_lock_interruptible(&ggtt->lock);
+	guard(xe_pm_runtime_noresume)(xe);
+	ACQUIRE(mutex_intr, lock)(&ggtt->lock);
+	ret = ACQUIRE_ERR(mutex_intr, &lock);
 	if (ret)
-		goto out;
+		return ret;
 
 	align = XE_PAGE_SIZE;
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
@@ -223,15 +224,13 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
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
@@ -245,13 +244,13 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
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
@@ -265,10 +264,6 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 					   rot_info->plane[i].dst_stride);
 	}
 
-out_unlock:
-	mutex_unlock(&ggtt->lock);
-out:
-	xe_pm_runtime_put(xe);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 4ae847b628e2..084baddb160e 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -37,7 +37,6 @@ bool intel_hdcp_gsc_check_status(struct drm_device *drm)
 	struct xe_gt *gt = tile->media_gt;
 	struct xe_gsc *gsc = &gt->uc.gsc;
 	bool ret = true;
-	unsigned int fw_ref;
 
 	if (!gsc || !xe_uc_fw_is_enabled(&gsc->fw)) {
 		drm_dbg_kms(&xe->drm,
@@ -45,21 +44,17 @@ bool intel_hdcp_gsc_check_status(struct drm_device *drm)
 		return false;
 	}
 
-	xe_pm_runtime_get(xe);
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
-	if (!fw_ref) {
+	guard(xe_pm_runtime)(xe);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
+	if (!fw_ref.domains) {
 		drm_dbg_kms(&xe->drm,
 			    "failed to get forcewake to check proxy status\n");
-		ret = false;
-		goto out;
+		return false;
 	}
 
 	if (!xe_gsc_proxy_init_done(gsc))
 		ret = false;
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
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

