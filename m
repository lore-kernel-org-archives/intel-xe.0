Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2DEFDEE4D
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 22:49:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFD610E12F;
	Thu, 23 Apr 2026 22:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YwBruIBz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F6710E17C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 22:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776984549; x=1808520549;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=umV+nCGv0fpUsitbhXhIUtJk6mNyrXUUkx2adJqYOXU=;
 b=YwBruIBz+M4CS4otUONJt0Ler+9PL31KPlGwdT+0taDEeLIMrlmuFXpU
 D2LUI/qoqWkea/k3OCVqsoLrfUlrfbdNVdQP8kxUEMhKhnu3qeGVXh4pL
 Fp5FdoSelofbRyO84l2CZQ0cMwDAj0E4aSrPtw4zMq1FJijgPxGohIOxW
 vgzGeUNGW+USZax/N3rQMNO1BhL1u2w+zdvN/vijwUcrsirQqDp4X7hY3
 morJyFzqLAGcU3An7HW1JMcdPGRhhGO3X+He7+QgQW9FnE8jbao26hldM
 UAezxqMNIF2Q0f1IHxQtzPtYkqVUUItUOF2OeXrMRY1u7ikIzyPxjNFJj w==;
X-CSE-ConnectionGUID: gz0JwqyJTfGl+n0XtbUyEw==
X-CSE-MsgGUID: zx3Hd9fnQSGqNKyiiRZP7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="65497070"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="65497070"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:08 -0700
X-CSE-ConnectionGUID: Tzh8WluERL2XiJkQgVmMIg==
X-CSE-MsgGUID: MORG/rFDQUuqWYI0zqMVdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="232696205"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 23 Apr 2026 15:48:55 -0700
Subject: [PATCH 08/10] drm/xe: Drop unnecessary STOP_RING clearing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-engine-setup-v1-8-baa94014e3e5@intel.com>
References: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
In-Reply-To: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3492;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=umV+nCGv0fpUsitbhXhIUtJk6mNyrXUUkx2adJqYOXU=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp6qHfZUPongjuKwIpojoOcDUPKWrRmADBe27Fn
 WkFeQtoIMqJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaeqh3wAKCRBNeSQFyHKQ
 BN8WD/9ASGd8XrKgEb7fa38dTRuYOejqPBgXl4CfG9/9DdDDxC/kR/O/+Gx8yJYiCR3PCX7k30i
 LfeLJ2byFMWp7KnuU9y1EYNYrhfss7KOy01wd8iLcmW8VR42fPrVb++hqF7AkGsmxz5NPWRzmbN
 XvYPuN1Xm+5OaeL0t2DrNMrvrcfBsemyo0zIMzXrpslyBJslXCX9EMjJLFN76krw/1gm7Ie52LQ
 ins+jh0hkfikzI1bYNvPIYd3aAA0IDdK7oiAsvgNqDWzo0Mzl29kJ9Rie5SdpYYo/1XL57RLP6q
 wBZ9FSoHtdB70JMfJqtI1D/JWyAiFtgsfpqeXyRmLwv0DPhG9e1zhYStnHsSgeOKiOiJoB7sxxd
 F+7Nyp9i8xahUp88P/VoHKId+IFG969jOa1MGaiUSur8c9gVYTe97YRQW3tUM0U2iDdWSgzmjeW
 MRoZAs0aYZeYx4gRZSpOGsoiDSfs5OvgvbyVWJZ/yEgyiTev9zCFgOSLx5wElfMhaVcp9v4hM4+
 +T9NNOFle/rytuKon9Qhtc7D7iTdrIyUUpzIEGG73FzU4qrichfXNHfcTfQv4mSarvgHMC2Ce8F
 wDLT8SkavfjatP6t88Os6L8K66Fni57+MgrZkwt6WKKCXkyGIyS8qei5NwnDiAstTkCBZP/RjQo
 v9VzXlsEBOgbY4w==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

The STOP_RING bit in MI_MODE is already clear by default out of hardware
reset and will only be '1' if the driver intentionally sets it after
that.  Furthermore, MI_MODE is part of the CSFE context, so even if the
hardware bit did somehow get set, a fresh value with the bit clear would
be re-loaded from the LRC (which is initialized zeroed).

The logic of clearing this bit appears to originate from very
early (pre-GuC, pre-execlist) code in i915 where we needed to stop the
ring before performing a host-initiated engine reset; after the reset
the STOP_RING bit needed to be cleared to allow execution to resume.

None of that is relevant to Xe (or even modern i915) since STOP_RING
isn't necessary for execlist-based engine resets (and even if it were,
Xe doesn't initiate any engine resets; the GuC handles that now).

Bspec: 60356, 60184
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 -
 drivers/gpu/drm/xe/xe_hw_engine.c        |  3 ---
 drivers/gpu/drm/xe/xe_lrc.c              | 20 --------------------
 3 files changed, 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 4d5cd1b6f50d..c4c879a9e555 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -176,7 +176,6 @@
 #define RING_TIMESTAMP_UDW(base)		XE_REG((base) + 0x358 + 4)
 #define   RING_VALID_MASK			0x00000001
 #define   RING_VALID				0x00000001
-#define   STOP_RING				REG_BIT(8)
 
 #define RING_CTX_TIMESTAMP(base)		XE_REG((base) + 0x3a8)
 #define RING_CTX_TIMESTAMP_UDW(base)		XE_REG((base) + 0x3ac)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 8d54f943f507..154073027b51 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -327,9 +327,6 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 {
 	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
 				  xe_bo_ggtt_addr(hwe->hwsp));
-	xe_hw_engine_mmio_write32(hwe, RING_MI_MODE(0),
-				  REG_MASKED_FIELD_DISABLE(STOP_RING));
-	xe_hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
 }
 
 static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_device *xe,
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index c725cde4508d..9db914584347 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -682,25 +682,6 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
 	}
 }
 
-static int lrc_ring_mi_mode(struct xe_hw_engine *hwe)
-{
-	struct xe_device *xe = gt_to_xe(hwe->gt);
-
-	if (GRAPHICS_VERx100(xe) >= 1250)
-		return 0x70;
-	else
-		return 0x60;
-}
-
-static void reset_stop_ring(u32 *regs, struct xe_hw_engine *hwe)
-{
-	int x;
-
-	x = lrc_ring_mi_mode(hwe);
-	regs[x + 1] &= ~STOP_RING;
-	regs[x + 1] |= STOP_RING << 16;
-}
-
 static inline bool xe_lrc_has_indirect_ring_state(struct xe_lrc *lrc)
 {
 	return lrc->flags & XE_LRC_FLAG_INDIRECT_RING_STATE;
@@ -980,7 +961,6 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
 	set_offsets(regs, reg_offsets(gt_to_xe(gt), hwe->class), hwe);
 	set_context_control(regs, hwe);
 	set_memory_based_intr(regs, hwe);
-	reset_stop_ring(regs, hwe);
 	if (xe_gt_has_indirect_ring_state(gt)) {
 		regs = data + xe_gt_lrc_size(gt, hwe->class) -
 		       LRC_INDIRECT_RING_STATE_SIZE;

-- 
2.53.0

