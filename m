Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B19C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 13:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B603D10E644;
	Wed, 14 May 2025 13:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="etuw/qK1";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C3910E644
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 13:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xche8ijxN6Bd+1a8iZju+5jeFfI2IaReN945uRTBAIA=; b=etuw/qK1OAxDR2DPTBPwxnEl6K
 TNu3x+FjfxtOoxaqCJpUJZqw9oZoX4Bseqaj932f5LrZbvrZdtuSK/hPvlZeXyOFX+BzKb23pePVv
 JjRHK4HH6AHTSeldC0Cwotg5y7OrhnCjFIIj4Q44Xbblzn4DvNcOjnItVp8JDu5AI+nXFktenbDA8
 LJmCaJI69qxSKwTZ1YSL+6gM5nTCjgSPHPSKiY0fxi2CNyE8ekphq7L6xo7yu3qDY6s4xjF9a88m2
 Vp+4qR6cMcUZ2qSmDDkxYK8crXl5u/cc3eO6rrfbkuFk6w2KRVdbJV3rMRlVDBgj/z5T0UlDUsWSX
 W0kGktaw==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uFCEm-008Aao-60; Wed, 14 May 2025 15:39:17 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v6 13/19] drm/xe/xelp: Add AuxCCS invalidation to the indirect
 context workarounds
Date: Wed, 14 May 2025 14:38:55 +0100
Message-ID: <20250514133904.12131-14-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250514133904.12131-1-tvrtko.ursulin@igalia.com>
References: <20250514133904.12131-1-tvrtko.ursulin@igalia.com>
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
 drivers/gpu/drm/xe/xe_lrc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index d729d79ae802..78327105064c 100644
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
@@ -1049,6 +1050,8 @@ xelp_setup_indirect_ctx_rcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (XE_WA(lrc->gt, 1607983814))
 		cmd = xelp_invalidate_state_cache(cmd);
 
+	cmd = xe_emit_aux_table_inv(hwe, cmd);
+
 	return cmd;
 }
 
@@ -1060,6 +1063,11 @@ xelp_setup_indirect_ctx_xcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	cmd = xelp_emit_timestamp_wa(lrc, cmd);
 	cmd = xelp_emit_restore_scratch(lrc, cmd);
 
+	if (hwe->class == XE_ENGINE_CLASS_COPY ||
+	    hwe->class == XE_ENGINE_CLASS_VIDEO_DECODE ||
+	    hwe->class == XE_ENGINE_CLASS_VIDEO_ENHANCE)
+		cmd = xe_emit_aux_table_inv(hwe, cmd);
+
 	return cmd;
 }
 
-- 
2.48.0

