Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCCFC04FFF
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 03:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368711129A2;
	Tue, 16 Apr 2024 03:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WUMx01gS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959EA1129A1
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 03:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713236708; x=1744772708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LOuq7qEYUGz5IszKFImI/QK+y/H2ZArTjAkUOhhHtpw=;
 b=WUMx01gSQ3iFSk3se+UuRe+gU1Gwm04g34NU3MFMbkg/P0rVV3EY0M8o
 Wu94V7lpIq5JFEFf6jjWvGNdgo1ns8aalGE09idHY7Jn+oRWuZKR/i1ZA
 m4r9J72jpPFv/MxjVDX3FJAwrfTibCox3IVHQWar63R0hWbFCIMwm2f0m
 hZtw1PARvaV9nFFGEPFrkm3LQeoFAvLYY2HUIAELiQRToCk1QhOQ8SjFI
 XQGwK8fjz0kINtd/C/CWnEhlwGOF7eApxLs80ERM8xhbE3WzYHNUDFkXY
 idcif6uyHMIcxpfKxYGGQ2t+cVrKfsuarK75U7EFXu4XElQBUm8tNuu2B w==;
X-CSE-ConnectionGUID: pc+VAdQ+S+2AD4AAXhh7HA==
X-CSE-MsgGUID: DFCYIm0xRX+gI4QIH4D+xw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19213837"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="19213837"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 20:05:06 -0700
X-CSE-ConnectionGUID: gHY+E5gTSmaBx8G0KTJW4Q==
X-CSE-MsgGUID: jag68hExQq2igxzPDsJXvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="26895696"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 20:05:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/7] drm/xe/lrc: Add helper to capture context timestamp
Date: Mon, 15 Apr 2024 20:04:48 -0700
Message-ID: <20240416030454.3739862-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240416030454.3739862-1-lucas.demarchi@intel.com>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Add a helper to capture CTX_TIMESTAMP from the context image so it can
be used to calculate the runtime.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  1 +
 drivers/gpu/drm/xe/xe_lrc.c             | 11 +++++++++++
 drivers/gpu/drm/xe/xe_lrc.h             |  2 ++
 drivers/gpu/drm/xe/xe_lrc_types.h       |  3 +++
 4 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index 1825d8f79db6..8780e6c6b649 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -11,6 +11,7 @@
 #define CTX_RING_TAIL			(0x06 + 1)
 #define CTX_RING_START			(0x08 + 1)
 #define CTX_RING_CTL			(0x0a + 1)
+#define CTX_TIMESTAMP			(0x22 + 1)
 #define CTX_PDP0_UDW			(0x30 + 1)
 #define CTX_PDP0_LDW			(0x32 + 1)
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 615bbc372ac6..4bfd8f9c3b46 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -751,6 +751,7 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	lrc->tile = gt_to_tile(hwe->gt);
 	lrc->ring.size = ring_size;
 	lrc->ring.tail = 0;
+	lrc->ctx_timestamp = 0;
 
 	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
 			     hwe->fence_irq, hwe->name);
@@ -786,6 +787,7 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 			xe_drm_client_add_bo(vm->xef->client, lrc->bo);
 	}
 
+	xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP, 0);
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_START, __xe_lrc_ring_ggtt_addr(lrc));
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, 0);
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
@@ -1444,3 +1446,12 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
 		xe_bo_put(snapshot->lrc_bo);
 	kfree(snapshot);
 }
+
+u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
+{
+	*old_ts = lrc->ctx_timestamp;
+
+	lrc->ctx_timestamp = xe_lrc_read_ctx_reg(lrc, CTX_TIMESTAMP);
+
+	return lrc->ctx_timestamp;
+}
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index d32fa31faa2c..ed8af14bd0c0 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -60,4 +60,6 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
 void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p);
 void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot);
 
+u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index b716df0dfb4e..5765d771b901 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -41,6 +41,9 @@ struct xe_lrc {
 
 	/** @fence_ctx: context for hw fence */
 	struct xe_hw_fence_ctx fence_ctx;
+
+	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
+	u32 ctx_timestamp;
 };
 
 struct xe_lrc_snapshot;
-- 
2.43.0

