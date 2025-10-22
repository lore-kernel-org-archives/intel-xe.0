Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6AECCF9E0
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 07:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B665910E155;
	Wed, 22 Oct 2025 07:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="OvGkU4iX";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6A510E6D0
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 07:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vgy7e21UDRkTYMl8oiyWdjhTflqybbqrMYH9HTO+GZU=; b=OvGkU4iXTQk6TXUtLETO4e+QSD
 ocXmrMpAY0Va5Tpwp/8hqSnnc+zYNQsyqToPHzAtJieng89rO7gR87F1CvPJxzPgOEWGuPvNqbEID
 wQ6UGppjfCodmEWKF1fHY2GAU7ZzPaRaf1pFv5nrSaFgooMJOzT6nkrT7NVTuUlPLZXuwcY/Sb7BE
 B8TSMRo2Qo5ywh234mtA2vgvc3wnPnZlf3xj7QSb+7s5zhJGvLPh3YVzMW3/7d2nvOSiNPbZlqnHK
 JV8qZrU8gwl+Ii9Oo/CHSRmfIQ4YYMcrhwJsI9Hx2cxZcMsymDWe6u5awU6rSrDN4gVYr8sK7/TEc
 rd78rbPQ==;
Received: from [90.242.12.242] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vBTIW-00CswI-QF
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 09:30:16 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 08/13] drm/xe/xelp: Add AuxCCS invalidation to the indirect
 context workarounds
Date: Wed, 22 Oct 2025 08:30:00 +0100
Message-ID: <20251022073010.71285-9-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251022073010.71285-1-tvrtko.ursulin@igalia.com>
References: <20251022073010.71285-1-tvrtko.ursulin@igalia.com>
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
 drivers/gpu/drm/xe/xe_lrc.c | 42 +++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index b5083c99dd50..7543df0160dd 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -27,6 +27,7 @@
 #include "xe_map.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
+#include "xe_ring_ops.h"
 #include "xe_sriov.h"
 #include "xe_trace_lrc.h"
 #include "xe_vm.h"
@@ -74,6 +75,21 @@ lrc_to_xe(struct xe_lrc *lrc)
 	return gt_to_xe(lrc->fence_ctx.gt);
 }
 
+static bool
+xe_engine_supports_auxccs(struct xe_device *xe, enum xe_engine_class class)
+{
+	if (GRAPHICS_VERx100(xe) >= 1200 &&
+	    GRAPHICS_VERx100(xe) <= 1210 &&
+	    (class == XE_ENGINE_CLASS_RENDER ||
+	     class == XE_ENGINE_CLASS_COMPUTE ||
+	     class == XE_ENGINE_CLASS_COPY ||
+	     class == XE_ENGINE_CLASS_VIDEO_DECODE ||
+	     class == XE_ENGINE_CLASS_VIDEO_ENHANCE))
+		return true;
+
+	return false;
+}
+
 static bool
 gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
 {
@@ -88,6 +104,10 @@ gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
 					       class, NULL))
 		return true;
 
+	/* For AuxCCS invalidation */
+	if (xe_engine_supports_auxccs(xe, class))
+		return true;
+
 	return false;
 }
 
@@ -1188,6 +1208,26 @@ static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
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
+	if (!xe_engine_supports_auxccs(xe, class))
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
@@ -1320,9 +1360,11 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 {
 	static const struct bo_setup rcs_funcs[] = {
 		{ .setup = setup_timestamp_wa },
+		{ .setup = setup_invalidate_auxccs_wa },
 		{ .setup = setup_configfs_mid_ctx_restore_bb },
 	};
 	static const struct bo_setup xcs_funcs[] = {
+		{ .setup = setup_invalidate_auxccs_wa },
 		{ .setup = setup_configfs_mid_ctx_restore_bb },
 	};
 	struct bo_setup_state state = {
-- 
2.48.0

