Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0F9FED3FA
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 20:50:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB4810E41C;
	Fri, 24 Apr 2026 20:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQlMkn7l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFC110E125
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 20:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777063832; x=1808599832;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=/60LMVDGvTdImAPZl/Txo3QN+SrHqe8ORdqeATaSaao=;
 b=KQlMkn7l4Kq3LI/vOqRrTG3RknwNDvSE0sxaX41VZmx7RdF8M45S0MbT
 Fyo4YNmrZCslNalIMIFfOjF4nL48TVuqLX5PjBPIfIDo4toHMHbgihDZM
 hQKwK6AOhMbt7CzYN7yWwUq2yFniHTcMHs+X3uXjabDNTm4vCh70bBYPo
 fJp94tEpwcbrlFqpL9o9prbW2e2tD3lzXuXjh9t/TfhqGyrYlW8SAyI/W
 +dH+3TYY09v+ANjZTgcoVqo8cLUQpg3ajIbGi0BaiMymI9CYXoWuGNrLD
 sgXUPiU5+EUt+h+Yd/nPYRaPWyzOaUV+SXuWRH0VrnU1t1QGYkukHNwsK Q==;
X-CSE-ConnectionGUID: QDth47/DQd6INTkTqY/Ytw==
X-CSE-MsgGUID: DEU7mPUaSlCoD63Ahpi3eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="80634002"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="80634002"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 13:50:30 -0700
X-CSE-ConnectionGUID: aNEl8TzQQJWkMYEnInj2Tg==
X-CSE-MsgGUID: yVnaklaNSU+Rs/ZVEhAz0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="256560146"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 13:50:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 24 Apr 2026 13:48:18 -0700
Subject: [PATCH v2 08/10] drm/xe: Drop unnecessary STOP_RING clearing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-engine-setup-v2-8-59cc620a25f1@intel.com>
References: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
In-Reply-To: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3492;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=/60LMVDGvTdImAPZl/Txo3QN+SrHqe8ORdqeATaSaao=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp69eV7GjGvaEzguBjp9TAeYz40+J3nlXpZgvBs
 yW44kPcGiSJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaevXlQAKCRBNeSQFyHKQ
 BKhaEACxrwXdmp5e6zuWk8/ae1N5SaMmjWorDZssJ4bTRNotPhlFhbc/v1xHcs7pZtnm5va5RCs
 cGm7gI8gezMtF4nmp6SuOJx/NwzoJp5jGutjKkyoCgHRZWHBCFtZRl0KERE4/vEn5DuzBbuwPMb
 mDl3azHfyUxDxASE8Z+GkH6RHzWPvnCayG5ExBJH/kPLXH9NGpu446XJDODOmC9rbwnUqb4RNMU
 slRqUyK1+64A3O57o3hItYSAX3C9qZqCOLFqXxdZcjS86pgdTO4ey048wgC7PhxOpcplU47GF/s
 CHGT1TUc86AhzqRIJDXnjvya1hrWegE7wAHNAPdCCQDk0nDoQwArGsW6B92kKi/eOf7j/FmVEqd
 MiAF0cWho+lN0GsND7QcnUoblas3Bk90D/YqY7PUz9rEZ+Ai57DCtH0z9POZ1L7+6lMUj+O//gR
 N0JrjeO77FV+H7QnsnyYLk27OVF/qaUXlbtOSsj5zcPn08mvx8X0EahvwoofxioGF+yeiW/tNne
 QzekA4CG0KsG0iNnGuS9XXWqvYmE7Ez1DO0gSFCu4zaygo9U5WKLOF8+9eWyuJiOs0eUMjsHVEJ
 LOUJxAeaMiC8gaj0ef8kZlJeZk6djw3bN2gKFCy2t6VI9t7x/G0We+RLwSvEh3VmxroToGoDanX
 VFrSHdzhVsK8vXA==
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
index b380d3cf6d3a..91e644067cc4 100644
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

