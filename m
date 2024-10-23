Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1BFCFA45C
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 18:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F02F10E188;
	Wed, 23 Oct 2024 18:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KgneYSku";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1869010E188
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 18:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729707120; x=1761243120;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SJUUFZX2F59jUDFM87QHuk4iDN0TRSarCg/NTCun/Ys=;
 b=KgneYSkuEsXXXfGOJMNwNc9+u8Myizq63Oj9zx9I6woMN/L+M5oR+Tj/
 bJxZKwxhwiF2xYZ4RacmCaGgLPdH50cev/2AE+Qlx39/Q4QUf7Jr0IDMz
 wnmz3EoM12KQIZiKWJ51MCLAm98o7AlMvv6Dag/Vay4s8f2E272sgkWuX
 5LtAy3oQgKgutZmCsVh2C51tCPlx196zikTx9apM6tNVeFyW8FiBwtcbY
 MO7q2dpS2vnzBLelz0tYyFPUMctZOJpBFfYk4kkwZnKSOLR4w1RT0KlMx
 fgofox9sfqaoD0I0QHaTTw8OI7eRNzHQkiacKqYBIWscCVv6sj3yOTHKn Q==;
X-CSE-ConnectionGUID: 8RYJxaj0TheVTCLDzBCDag==
X-CSE-MsgGUID: uo0wfyvKT0evIQ5o+gAuSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29418680"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="29418680"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 11:12:00 -0700
X-CSE-ConnectionGUID: RnfczmpNTiWc6ApFfzhNJA==
X-CSE-MsgGUID: r7MSSqp1TDaROt1uPqzM+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="85120106"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 11:12:00 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI] drm/xe/oa: Increase default OA buffer size to 128 M
Date: Wed, 23 Oct 2024 11:11:55 -0700
Message-ID: <20241023181155.1208100-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_oa_regs.h |  1 +
 drivers/gpu/drm/xe/xe_oa.c           | 10 +++++++++-
 drivers/gpu/drm/xe/xe_oa_types.h     |  2 +-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
index a9b0091cb7ee1..1188eca79a578 100644
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
index 5951ea1755330..aec44d1867099 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -379,6 +379,7 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
 {
 	struct xe_mmio *mmio = &stream->gt->mmio;
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
+	/* For 128M OA buffer size, x8 is done in xe_oa_enable_metric_set() */
 	u32 oa_buf = gtt_offset | OABUFFER_SIZE_16M | OAG_OABUFFER_MEMORY_SELECT;
 	unsigned long flags;
 
@@ -852,7 +853,6 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
 	struct xe_bo *bo;
 
 	BUILD_BUG_ON_NOT_POWER_OF_2(XE_OA_BUFFER_SIZE);
-	BUILD_BUG_ON(XE_OA_BUFFER_SIZE < SZ_128K || XE_OA_BUFFER_SIZE > SZ_16M);
 
 	bo = xe_bo_create_pin_map(stream->oa->xe, stream->gt->tile, NULL,
 				  XE_OA_BUFFER_SIZE, ttm_bo_type_kernel,
@@ -943,6 +943,13 @@ static u32 oag_report_ctx_switches(const struct xe_oa_stream *stream)
 			     0 : OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS);
 }
 
+static u32 oag_buf_size_select(void)
+{
+	BUILD_BUG_ON(XE_OA_BUFFER_SIZE != SZ_16M && XE_OA_BUFFER_SIZE != SZ_128M);
+	return _MASKED_FIELD(OAG_OA_DEBUG_BUF_SIZE_SELECT,
+			     XE_OA_BUFFER_SIZE == SZ_128M ? OAG_OA_DEBUG_BUF_SIZE_SELECT: 0);
+}
+
 static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 {
 	struct xe_mmio *mmio = &stream->gt->mmio;
@@ -975,6 +982,7 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 	xe_mmio_write32(mmio, __oa_regs(stream)->oa_debug,
 			_MASKED_BIT_ENABLE(oa_debug) |
 			oag_report_ctx_switches(stream) |
+			oag_buf_size_select() |
 			oag_configure_mmio_trigger(stream, true));
 
 	xe_mmio_write32(mmio, __oa_regs(stream)->oa_ctx_ctrl, stream->periodic ?
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 8862eca73fbe3..c5ca002237ffb 100644
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
2.41.0

