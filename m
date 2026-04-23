Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B40FDEE4D
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 22:49:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CFF10E121;
	Thu, 23 Apr 2026 22:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hMXcWHKd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AF210E121
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 22:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776984549; x=1808520549;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=SpwShHTK6cDix3R6xayRBZMfBzwEd911TSiCaIdnTjk=;
 b=hMXcWHKdG/Zq5QOrRQ6SRuB1aXUxYDyfdYOewwxHMIf4C62x1AYCGkwz
 FEjHD0hw2IvaK/ty1TkxFl4UcBaBpOZr87/AD0EyALKB9sUxcfr3+PxuV
 qGUU0PP7HAR0zGeKonXqWCmCORoV6e/IsU0FKvkHwg7iHipHQ0nyVnCcw
 lFyv4wa6CXSk/o2MsGf5fTSHNHtymcaXj0vXvbpn5BQty+MYqJpN2nYo2
 teSSTqWyXExfECP6fv6z8lNmFotIqU8AQIwPkYD8uNsR+slAQ514rW2Nh
 g9D8Kl2jhlozs70Qt3PREPt+tqlXPUMe211oOvJEG/tzpeP+YWlzCNLDZ w==;
X-CSE-ConnectionGUID: iB+uhpHFQOmBAtEZVy+CiA==
X-CSE-MsgGUID: 2+VHt7sgQxqQyOYQPnZBeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="65497066"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="65497066"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:08 -0700
X-CSE-ConnectionGUID: VrlthNRPS2uu46UI1Ai21g==
X-CSE-MsgGUID: MFvXCWI3RC6XTKNuA530dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="232696209"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 23 Apr 2026 15:48:56 -0700
Subject: [PATCH 09/10] drm/xe: Drop xe_hw_engine_mmio_write32()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-engine-setup-v1-9-baa94014e3e5@intel.com>
References: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
In-Reply-To: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2179;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=SpwShHTK6cDix3R6xayRBZMfBzwEd911TSiCaIdnTjk=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp6qHf3JwbBMQIfu/20iwnAKvaviiQGluRBuLmm
 nBnyc/R0R2JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaeqh3wAKCRBNeSQFyHKQ
 BK/nD/wL5WOL8aW9j0MZ/WtE4BHnUUbzfuUmpIPSjiJQN0l0PvdihxH35jmFConDQmD1TLictm7
 0kkv174AAA285xOFKNMKAbNbRE77DJiYLlcko1hjw7OrHw9UHs8kIG2isH4ZZY7H61Fu1D6aMpA
 A4H/8p5tlEFtzEbtGU1RL6qYe3RfdNiADnYAvW/Ie5Cd8rGt66YdQOU76uGqiHZ2Fa/4LkmBaaD
 CctK6Xw7JwXm4oo9/vWpufRgpjfk4GV4q6or0SATph2Kwt3M+KPuiDOZoGzDbxDSf3qy1j9QogI
 sDYtA2QNEzR/RFqlcdHMjnw8pTFsq96yddGIGp5SqXlzJ5dz5W9L/H0DJIpnHVld1z6+no/1NzZ
 XAQ3VGcrw/D9bpTljbV/zGlC3xAeOfk0QzC+gIamuJhDa9bPxfFMwWD4dBJOYykDlcepK9D7+IU
 moZLYxqoIjhA5+VBJlhMzk0BRKjQLJWS8sq+MDisn1Kag3DKYMmzjfKlsdaCE6iZyQtx9XZJHKQ
 krHsRC8Y2L5M7Mly3shgykAEnJMqf3TkX63KR/Nj3HW3NotLm3GerjmlNfWRcMmjsosa9ThazdG
 uWUjpR6w3hrXqlnXXAe0DAciZ6/KqfvoKB4Ah2FaGvFW+KJUazTiWF6iVVmwOJTKZ+YATYfUn8M
 +l4k9pO6QG0fNhg==
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

xe_hw_engine_mmio_write32() is only used in a single place and is easily
replaced by a regular xe_mmio_write32() call.  Register read/write
interfaces are already complicated enough with MCR vs non-MCR handling,
so we should avoid adding extra wrappers that just make it more
confusing what to use.

xe_hw_engine_mmio_write32() did have a forcewake assertion that we're
dropping here, but that assertion wasn't entirely correct anyway.  It was
checking hwe->domain which is currently set to XE_FW_RENDER for the BCS
engine, even though BCS engines reside in the GT domain.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 154073027b51..a2a2b296af91 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -282,27 +282,6 @@ static void hw_engine_fini(void *arg)
 	hwe->gt = NULL;
 }
 
-/**
- * xe_hw_engine_mmio_write32() - Write engine register
- * @hwe: engine
- * @reg: register to write into
- * @val: desired 32-bit value to write
- *
- * This function will write val into an engine specific register.
- * Forcewake must be held by the caller.
- *
- */
-void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe,
-			       struct xe_reg reg, u32 val)
-{
-	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
-	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
-
-	reg.addr += hwe->mmio_base;
-
-	xe_mmio_write32(&hwe->gt->mmio, reg, val);
-}
-
 /**
  * xe_hw_engine_mmio_read32() - Read engine register
  * @hwe: engine
@@ -325,8 +304,8 @@ u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
 
 void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 {
-	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
-				  xe_bo_ggtt_addr(hwe->hwsp));
+	xe_mmio_write32(&hwe->gt->mmio, RING_HWS_PGA(hwe->mmio_base),
+			xe_bo_ggtt_addr(hwe->hwsp));
 }
 
 static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_device *xe,

-- 
2.53.0

