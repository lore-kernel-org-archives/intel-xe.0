Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC11103A9A9
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 11:08:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFA910E851;
	Wed, 25 Mar 2026 11:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/4qQ7jb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA09D10E851;
 Wed, 25 Mar 2026 11:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774436891; x=1805972891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/4Z3gfn4QWwwK/Z00f8oU5JwgXBjG1MzhngyT7Q6EMo=;
 b=L/4qQ7jbFxlr3ti1YxBEnLMx2fflh3Cx9QRFn2XGATZzuoecsd3D32fZ
 slOW6mBVavrTyUBxxnSSh6oUBUDbpflmDRGF57VYdKxKAXprydVhuXUl8
 HvbWj7f7vk+FjXphDhkIRxvNnl89Y+6mD+M+GKuV0xueF2DyBci/d6BM5
 5Z6GmShUmh+MHmm31ANqObjOdhk6JewbZavGB4wc2hX9Bz0nt03sRj/f9
 odI5g/A6eS7FqCQja5jOflk0WJ8uI6ZT/4Btle31IpywyDOwHJ4F/pcSO
 Qt2RpIYT0WQFIsl8nqvFNJJQKmlT/zPuCK17Py++yughBp4gC8K+0nXdR Q==;
X-CSE-ConnectionGUID: LCZ2RDGCSDypsjpiq983Dw==
X-CSE-MsgGUID: JAQjHig8RVGiXPXFnjPgyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93047511"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="93047511"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 04:08:11 -0700
X-CSE-ConnectionGUID: GEUFQ3g2SjK9P2VmswTgCQ==
X-CSE-MsgGUID: 8smMirSKQi60nlRF7vN9Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="219798348"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 25 Mar 2026 04:08:08 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: sowmiya.s@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com,
 chaitanya.kumar.borah@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 08/26] drm/i915/writeback: Define encoder->get_hw_state
Date: Wed, 25 Mar 2026 16:37:26 +0530
Message-Id: <20260325110744.1096786-9-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325110744.1096786-1-suraj.kandpal@intel.com>
References: <20260325110744.1096786-1-suraj.kandpal@intel.com>
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

Define the get_hw_state function for encoder which
get's the encoder state, pipe config.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/i915/display/intel_writeback.c    | 49 +++++++++++++++++++
 .../drm/i915/display/intel_writeback_reg.h    |  3 ++
 2 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index 765f62fa38f8..64769609aefe 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -17,7 +17,9 @@
 #include "intel_de.h"
 #include "intel_display_driver.h"
 #include "intel_display_types.h"
+#include "intel_display_utils.h"
 #include "intel_writeback.h"
+#include "intel_writeback_reg.h"
 
 struct intel_writeback_connector {
 	struct intel_connector connector;
@@ -98,6 +100,52 @@ static const struct drm_connector_helper_funcs conn_helper_funcs = {
 	.mode_valid = intel_writeback_mode_valid,
 };
 
+static bool
+intel_writeback_get_hw_state(struct intel_encoder *encoder,
+			     enum pipe *pipe)
+{
+	struct intel_display *display = to_intel_display(encoder);
+	u8 pipe_mask = 0;
+	u32 tmp;
+
+	/* TODO need to be done for both the wd transcoder */
+	tmp = intel_de_read(display,
+			    TRANSCONF_WD(TRANSCODER_WD_0));
+	if (!(tmp & WD_TRANS_ENABLE))
+		return false;
+
+	tmp = intel_de_read(display,
+			    WD_TRANS_FUNC_CTL(TRANSCODER_WD_0));
+
+	if (!(tmp & TRANS_WD_FUNC_ENABLE))
+		return false;
+
+	switch (tmp & WD_INPUT_SELECT_MASK) {
+	case WD_INPUT_PIPE_A:
+		pipe_mask |= BIT(PIPE_A);
+		break;
+	case WD_INPUT_PIPE_B:
+		pipe_mask |= BIT(PIPE_B);
+		break;
+	case WD_INPUT_PIPE_C:
+		pipe_mask |= BIT(PIPE_C);
+		break;
+	case WD_INPUT_PIPE_D:
+		pipe_mask |= BIT(PIPE_D);
+		break;
+	default:
+		MISSING_CASE(tmp & WD_INPUT_SELECT_MASK);
+		fallthrough;
+	}
+
+	if (pipe_mask == 0)
+		return false;
+
+	*pipe = ffs(pipe_mask) - 1;
+
+	return true;
+}
+
 int intel_writeback_init(struct intel_display *display)
 {
 	struct intel_encoder *encoder;
@@ -122,6 +170,7 @@ int intel_writeback_init(struct intel_display *display)
 	encoder->type = INTEL_OUTPUT_WRITEBACK;
 	encoder->pipe_mask = ~0;
 	encoder->cloneable = 0;
+	encoder->get_hw_state = intel_writeback_get_hw_state;
 
 	connector = &writeback_conn->connector;
 	ret = intel_writeback_connector_alloc(connector);
diff --git a/drivers/gpu/drm/i915/display/intel_writeback_reg.h b/drivers/gpu/drm/i915/display/intel_writeback_reg.h
index ffe302ef3dd9..5e7c6c99d191 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback_reg.h
+++ b/drivers/gpu/drm/i915/display/intel_writeback_reg.h
@@ -19,6 +19,9 @@
 /* Gen12 WD */
 #define _MMIO_WD(tc, wd0, wd1)	_MMIO_TRANS((tc) - TRANSCODER_WD_0, wd0, wd1)
 
+#define TRANSCONF_WD(tc)	_MMIO_WD(tc,\
+				PIPE_WD0_OFFSET,\
+				PIPE_WD1_OFFSET)
 #define WD_TRANS_ENABLE		REG_BIT(31)
 #define WD_TRANS_STATE		REG_BIT(30)
 
-- 
2.34.1

