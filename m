Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635C9C87FCE
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 12:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DA310E949;
	Thu, 24 Jul 2025 12:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="H0KOvA2Q";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD68A10E28F
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 12:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4bSuKZhvtcDNMzyrEB8ann9g2krJhAyRWBsBDB9NmBw=; b=H0KOvA2QPcRzxMwS1ljLumU4H2
 gcu85YCT6x+m7tX6DO8j5CG/FZ6dGLd4xHAgV3eVFV2VnJ3txCqgaLYfpwClmmp2p8nfAbTvAMZQ2
 WzWm46PZOpCGdg33XSOJMXl714b7rR8n/Wd89kzABlXlKLh6z9XRre0WYzLTmEHOXO6czplv+nz1v
 cy46E9/Mb/blKU2ZWTKQzy6WSiqcpaN2TYINU7Iu8b9yxzTQvURoB2S3+MyeNKb3xL62tyo6fTqhn
 LCggXRkmgQEj2Pd3RWj+YJbNPVRIA9XbRX/8CCfSyEzUiJGUv76zPyvFvFv6F3XUXV3OdwcB6P88c
 aYbf5MVQ==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ueugH-003Ag5-0J
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 14:04:13 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 08/13] drm/xe/xelp: Add AuxCCS invalidation to the indirect
 context workarounds
Date: Thu, 24 Jul 2025 13:03:56 +0100
Message-ID: <20250724120405.72946-9-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250724120405.72946-1-tvrtko.ursulin@igalia.com>
References: <20250724120405.72946-1-tvrtko.ursulin@igalia.com>
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

Following from the i915 reference implementation, we add the AuxCCS
invalidation to the indirect context workarounds page.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 47 +++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 6d38411bdeba..0f32b096a292 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -25,6 +25,7 @@
 #include "xe_map.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
+#include "xe_ring_ops.h"
 #include "xe_sriov.h"
 #include "xe_trace_lrc.h"
 #include "xe_vm.h"
@@ -76,6 +77,18 @@ lrc_to_xe(struct xe_lrc *lrc)
 static bool
 gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+
+	/* AuxCCS invalidation */
+	if (GRAPHICS_VERx100(xe) >= 1200 &&
+	    GRAPHICS_VERx100(xe) <= 1210 &&
+	    (class == XE_ENGINE_CLASS_RENDER ||
+	     class == XE_ENGINE_CLASS_COMPUTE ||
+	     class == XE_ENGINE_CLASS_COPY ||
+	     class == XE_ENGINE_CLASS_VIDEO_DECODE ||
+	     class == XE_ENGINE_CLASS_VIDEO_ENHANCE))
+		return true;
+
 	return false;
 }
 
@@ -1014,6 +1027,31 @@ static ssize_t setup_utilization_wa(struct xe_lrc *lrc,
 	return cmd - batch;
 }
 
+static ssize_t setup_invalidate_auxccs_wa(struct xe_lrc *lrc,
+					  struct xe_hw_engine *hwe,
+					  u32 *batch, size_t max_len)
+{
+	struct xe_gt *gt = lrc->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	const unsigned int class = hwe->class;
+	u32 *cmd;
+
+	if (GRAPHICS_VERx100(xe) < 1200 || GRAPHICS_VERx100(xe) > 1210 ||
+	    !(class == XE_ENGINE_CLASS_RENDER ||
+	      class == XE_ENGINE_CLASS_COMPUTE ||
+	      class == XE_ENGINE_CLASS_COPY ||
+	      class == XE_ENGINE_CLASS_VIDEO_DECODE ||
+	      class == XE_ENGINE_CLASS_VIDEO_ENHANCE))
+		return 0;
+
+	if (xe_gt_WARN_ON(gt, max_len < 8))
+		return -ENOSPC;
+
+	cmd = xe_emit_aux_table_inv(hwe, batch);
+
+	return cmd - batch;
+}
+
 struct bo_setup {
 	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 			 u32 *batch, size_t max_size);
@@ -1121,6 +1159,10 @@ static int
 setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 {
 	static struct bo_setup rcs_funcs[] = {
+		{ .setup = setup_invalidate_auxccs_wa },
+	};
+	static struct bo_setup xcs_funcs[] = {
+		{ .setup = setup_invalidate_auxccs_wa },
 	};
 	struct bo_setup_state state = {
 		.lrc = lrc,
@@ -1137,6 +1179,11 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	    hwe->class == XE_ENGINE_CLASS_COMPUTE) {
 		state.funcs = rcs_funcs;
 		state.num_funcs = ARRAY_SIZE(rcs_funcs);
+	} else if (hwe->class == XE_ENGINE_CLASS_COPY ||
+		   hwe->class == XE_ENGINE_CLASS_VIDEO_DECODE ||
+		   hwe->class == XE_ENGINE_CLASS_VIDEO_ENHANCE) {
+		state.funcs = xcs_funcs;
+		state.num_funcs = ARRAY_SIZE(xcs_funcs);
 	}
 
 	if (xe_gt_WARN_ON(lrc->gt, !state.funcs))
-- 
2.48.0

