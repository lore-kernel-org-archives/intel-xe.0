Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66BBC87FCF
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 20:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891C810EA12;
	Fri, 25 Jul 2025 20:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aeId60sH";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B137910EA11
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 20:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=glEINTGWpsv+FbWQU1b8Uw8rT3Z18h7fBVbpwuevd7Q=; b=aeId60sHr4H1M+8oMK9808icLW
 gvu5aIE69lAPM2w1H19vDSg29Z+zZ5VqIuI3tBa5emiY4lOUvkZ+1e0Y4g2aPIxgp6z+D44Ihmkjt
 w24ZZ1cOEraj0cVNIoyi+ywD1NwvXAVNmtuBTEbdu8v3/SZ5+mINfHA94tuqNMbsjEcie3ArwYy19
 vYkaP3rA3wQuS5tl3x029sLyh7vJRGPnKpipFRIaldaCXBch3h5Ahf6Eg7/uYDuWIv3hjDSj1YAR/
 DkexDZUdmptVjE2QxYPw1HnJlQeLO0Eu/BTGQq174ugR2LNeGGehzfIjbxU3ikCcUs8YXiokNrbRW
 GpPsW8Sg==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ufOe7-003rhe-0l; Fri, 25 Jul 2025 22:03:59 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v9 07/12] drm/xe/xelp: Add AuxCCS invalidation to the indirect
 context workarounds
Date: Fri, 25 Jul 2025 21:03:41 +0100
Message-ID: <20250725200349.99038-8-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250725200349.99038-1-tvrtko.ursulin@igalia.com>
References: <20250725200349.99038-1-tvrtko.ursulin@igalia.com>
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
index 540f044bf425..47cdd54cef6f 100644
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
@@ -76,11 +77,23 @@ lrc_to_xe(struct xe_lrc *lrc)
 static bool
 gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+
 	if (XE_WA(gt, 16010904313) &&
 	    (class == XE_ENGINE_CLASS_RENDER ||
 	     class == XE_ENGINE_CLASS_COMPUTE))
 		return true;
 
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
 
@@ -1076,6 +1089,31 @@ static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
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
@@ -1186,6 +1224,10 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 {
 	static struct bo_setup rcs_funcs[] = {
 		{ .setup = setup_timestamp_wa },
+		{ .setup = setup_invalidate_auxccs_wa },
+	};
+	static struct bo_setup xcs_funcs[] = {
+		{ .setup = setup_invalidate_auxccs_wa },
 	};
 	struct bo_setup_state state = {
 		.lrc = lrc,
@@ -1202,6 +1244,11 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
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

