Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBF3D65520
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 16:43:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBE210E951;
	Tue, 26 Nov 2024 16:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eTQVAVFM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A984C10E951
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Nov 2024 16:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732639429; x=1764175429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1/l7dyopzg6LBkuYadBRlCxGfM7APdei9/Oyqanr6Lc=;
 b=eTQVAVFM8gB/2DlkX/IGh9q4zc8rGoWzb7+5CmFjSKANQRhEGIBfpVB8
 ApHcsvFd5FZpC3ZM3+RLD7ThLso8wljtQ2drkWHGPIYO1Y8fcgtFRGWhL
 tbWlgnUDR5hIbeqcjLr3omBdnwN2D9FBvYYNSKesDheFRuulzMwIruhiv
 ITy8VNsyCngUktf/KkvKaub7UXQktPRTgO0Fy7D8UXsbQSNFwRnfZ/say
 EEG+BhNHCNwzA9UIOrXcfipGm9ZLygaHl2iVDYm4uKIuIA55ZEXPc13Qq
 DjK0k7Xhe3eAOdgWweggCVmU/VvxRkmj5ysTsS+q9sSLIjB9jHqjR1Io5 w==;
X-CSE-ConnectionGUID: RTEmJLdjRdCLAuTI7ons8A==
X-CSE-MsgGUID: ga5azH/oRt+bwvJU0ANIkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43307121"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="43307121"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:43:49 -0800
X-CSE-ConnectionGUID: 0Y4Rf5XeSk+kBMgFUVLJhA==
X-CSE-MsgGUID: uZQO9RNWRZiUb9Yj54Ervw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="122512862"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:43:47 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH v2 1/3] drm/xe/oa: Increase default OA buffer size to 128 M
Date: Tue, 26 Nov 2024 22:05:51 +0530
Message-Id: <20241126163553.449850-2-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126163553.449850-1-sai.teja.pottumuttu@intel.com>
References: <20241126163553.449850-1-sai.teja.pottumuttu@intel.com>
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

From: Ashutosh Dixit <ashutosh.dixit@intel.com>

Increase default OA buffer size to 128 MB from the current 16 MB. A larger
OA buffer allows more flexibility to userland to read data before overrun's
occur.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_oa_regs.h |  1 +
 drivers/gpu/drm/xe/xe_oa.c           | 10 +++++++++-
 drivers/gpu/drm/xe/xe_oa_types.h     |  2 +-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
index a9b0091cb7ee..1188eca79a57 100644
--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -63,6 +63,7 @@
 #define OAG_OA_DEBUG XE_REG(0xdaf8, XE_REG_OPTION_MASKED)
 #define  OAG_OA_DEBUG_DISABLE_MMIO_TRG			REG_BIT(14)
 #define  OAG_OA_DEBUG_START_TRIGGER_SCOPE_CONTROL	REG_BIT(13)
+#define  OAG_OA_DEBUG_BUF_SIZE_SELECT			REG_BIT(12)
 #define  OAG_OA_DEBUG_DISABLE_START_TRG_2_COUNT_QUAL	REG_BIT(8)
 #define  OAG_OA_DEBUG_DISABLE_START_TRG_1_COUNT_QUAL	REG_BIT(7)
 #define  OAG_OA_DEBUG_INCLUDE_CLK_RATIO			REG_BIT(6)
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 8dd55798ab31..0e1049079905 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -405,6 +405,7 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
 {
 	struct xe_mmio *mmio = &stream->gt->mmio;
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
+	/* For 128M OA buffer size, x8 is done in xe_oa_enable_metric_set() */
 	u32 oa_buf = gtt_offset | OABUFFER_SIZE_16M | OAG_OABUFFER_MEMORY_SELECT;
 	unsigned long flags;
 
@@ -906,7 +907,6 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
 	struct xe_bo *bo;
 
 	BUILD_BUG_ON_NOT_POWER_OF_2(XE_OA_BUFFER_SIZE);
-	BUILD_BUG_ON(XE_OA_BUFFER_SIZE < SZ_128K || XE_OA_BUFFER_SIZE > SZ_16M);
 
 	bo = xe_bo_create_pin_map(stream->oa->xe, stream->gt->tile, NULL,
 				  XE_OA_BUFFER_SIZE, ttm_bo_type_kernel,
@@ -1087,6 +1087,13 @@ static u32 oag_report_ctx_switches(const struct xe_oa_stream *stream)
 			     0 : OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS);
 }
 
+static u32 oag_buf_size_select(void)
+{
+	BUILD_BUG_ON(XE_OA_BUFFER_SIZE != SZ_16M && XE_OA_BUFFER_SIZE != SZ_128M);
+	return _MASKED_FIELD(OAG_OA_DEBUG_BUF_SIZE_SELECT,
+			     (XE_OA_BUFFER_SIZE == SZ_128M) ? OAG_OA_DEBUG_BUF_SIZE_SELECT : 0);
+}
+
 static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 {
 	struct xe_mmio *mmio = &stream->gt->mmio;
@@ -1119,6 +1126,7 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 	xe_mmio_write32(mmio, __oa_regs(stream)->oa_debug,
 			_MASKED_BIT_ENABLE(oa_debug) |
 			oag_report_ctx_switches(stream) |
+			oag_buf_size_select() |
 			oag_configure_mmio_trigger(stream, true));
 
 	xe_mmio_write32(mmio, __oa_regs(stream)->oa_ctx_ctrl, stream->periodic ?
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index fea9d981e414..539c75f57c09 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -15,7 +15,7 @@
 #include "regs/xe_reg_defs.h"
 #include "xe_hw_engine_types.h"
 
-#define XE_OA_BUFFER_SIZE SZ_16M
+#define XE_OA_BUFFER_SIZE SZ_128M
 
 enum xe_oa_report_header {
 	HDR_32_BIT = 0,
-- 
2.34.1

