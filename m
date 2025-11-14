Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC93CEACE3
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB39A10EB40;
	Fri, 14 Nov 2025 21:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S2HUYL7I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3F010EB2A
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763156630; x=1794692630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v7uqejD9t/Iv8W5pJyV5LDqwDIFWARHm4keaOQxsM68=;
 b=S2HUYL7I+ijcXRrsX08N+x2/ScaUb3PGq4+XVKTgROKwatUcKpCw+41E
 LhO4mnj1K1rHsK82ye+gh8NQaW7fnAeq/JPLAv3NfR6jv+pWlf69yWfdn
 sBlwU7X4qFv+QVlRbVVlM7Brwa1R54u1zK//5AxpgVzDUUTrihJNQqpAu
 3mxdJk67kRQmV0uDYYAZha8AmU1JTCkwqofL1GuOWNPC/Nlcdc0ZD0SLB
 zV+vdXHr7Mi+7lOUROWkjVi9M9UJ5ECNAlMVHy1FN6iaWKkw/O1nLv/SF
 qNRv+XqplzLSJ8O2aWFuIpnZi3SdVQFpNJlQxKIZFnHgSH/jVXs8r4kTr g==;
X-CSE-ConnectionGUID: e6IhAxGoRjKd26jdZTgvZA==
X-CSE-MsgGUID: /hVofpctSza0hTtI3fLcBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82648316"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82648316"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:49 -0800
X-CSE-ConnectionGUID: yrwbaRS9RDCvVTE7nMNfzA==
X-CSE-MsgGUID: Je2z8SOaQo+Mx614NyFXFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="190308311"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v3 13/27] drm/xe/display: Use scoped-cleanup
Date: Fri, 14 Nov 2025 13:43:49 -0800
Message-ID: <20251114214335.2388972-42-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114214335.2388972-29-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
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

v2:
 - Eliminate unnecessary 'ret' variable in intel_hdcp_gsc_check_status()
   (Gustavo)

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c   | 23 +++++++-----------
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 31 +++++++-----------------
 2 files changed, 18 insertions(+), 36 deletions(-)

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
index 4ae847b628e2..71d21fde1736 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -36,8 +36,6 @@ bool intel_hdcp_gsc_check_status(struct drm_device *drm)
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
 	struct xe_gt *gt = tile->media_gt;
 	struct xe_gsc *gsc = &gt->uc.gsc;
-	bool ret = true;
-	unsigned int fw_ref;
 
 	if (!gsc || !xe_uc_fw_is_enabled(&gsc->fw)) {
 		drm_dbg_kms(&xe->drm,
@@ -45,22 +43,15 @@ bool intel_hdcp_gsc_check_status(struct drm_device *drm)
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
 
-	if (!xe_gsc_proxy_init_done(gsc))
-		ret = false;
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-out:
-	xe_pm_runtime_put(xe);
-	return ret;
+	return xe_gsc_proxy_init_done(gsc);
 }
 
 /*This function helps allocate memory for the command that we will send to gsc cs */
@@ -166,17 +157,15 @@ ssize_t intel_hdcp_gsc_msg_send(struct intel_hdcp_gsc_context *gsc_context,
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
@@ -201,13 +190,11 @@ ssize_t intel_hdcp_gsc_msg_send(struct intel_hdcp_gsc_context *gsc_context,
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

