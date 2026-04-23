Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FC0FDEE58
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 22:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D6710E376;
	Thu, 23 Apr 2026 22:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZT/pxtz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33FB10E121
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 22:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776984549; x=1808520549;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=efKT8TV4l5gIg8k8S7LA8ioXvvQ3FLJApwc8PfSfeIE=;
 b=GZT/pxtzzYz/GlFSzhyNre1hNOk5B2Hm8Ss+zUirv4vSrlTEGD4Au7+7
 1pzDODpCwQprk56KGncWOkqViB8lzEU2kg5wWyJo4x0dFhv3F5MXDktYB
 DXkBjwRptlV0uYPjqIGGQ28ueJfEKr8Kvp9DTWnSXqPGG1kLTMVfUDCon
 un2VEyk2kf1a8eTfOXF95vMc6x3D168NQaAZ8xni7DQrApZKez9gMHj/s
 xwhrBkOZ+V88dQQMdcRG8ikUC5nsYqIYuvHF/XxZWcFlzkMPaEkzWXZ6D
 We2SEMTSpL3xMizq6tfXL+AI6Yv2Xv37+gvD2ccrZDPkIvmMD9epN1GK4 w==;
X-CSE-ConnectionGUID: x1wwRnW1RBu9xycyU/bsLw==
X-CSE-MsgGUID: SnOLL/YFRGK0aWt2No4NFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="65497069"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="65497069"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:08 -0700
X-CSE-ConnectionGUID: tITCK/XDQQy/PZXcTQBFNw==
X-CSE-MsgGUID: bbEAsRroRkKQwAbjnYSKRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="232696199"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 23 Apr 2026 15:48:53 -0700
Subject: [PATCH 06/10] drm/xe: Const-ify parameters to xe_device_has_*
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-engine-setup-v1-6-baa94014e3e5@intel.com>
References: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
In-Reply-To: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1954;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=efKT8TV4l5gIg8k8S7LA8ioXvvQ3FLJApwc8PfSfeIE=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp6qHeC0O0Msnqap06BU306V7tM2cHzit073ZrG
 eZ2wHdvnwaJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaeqh3gAKCRBNeSQFyHKQ
 BLiMEACvN65Pmsr2OINj2MuUF8YRdXe7zT/RPHjskTf+HB/DcpnOWWE0oNS8EH5Og7cpyWW4MBJ
 Qlr6geXHIFXh7ox+2wbzJxMlXBNGfRHfNvU1yPhxMIMi1vqnwYMEuc0pNPFMajvECq37iaoFfQS
 1Ltv75CtJ/0f13A1QbfQrEaaKmyXXAzsJifNM65HjigEcFvl4CNDEgUmQodB+iDbGCRM+EZTCHf
 EJW33lA8uge44nJREUZg1kdH2PfqIAPhfEdMLhTKLalRdFg1vD8hKfiIf/g6UmHWZR0CpLctTZf
 NJZsoaiVOdCz7fIPW/YJMyTg+C81gZRvfnIKb4f8DQGCfncQPQq1iHoUm3Z7A3qeZXAlaVcDAgV
 ERtQ4hBVuWOLyR0SGIvdU5aZzDU2Tfx5iRrVuzz4vkBWjvzwPXLfVW6nwfGoZK33PIEzxHztnpN
 6UUHv95kP4JYr01U12oJgL0XtIqT2Nc2RsasCqmylPzMzfbjzrljxrvXYyqTMY88rsLMa1Lrjmt
 UzGSSpP4cpCnFKWsqp319oNnqXIZZIuICdczFyJZe2A3JGMqJ9+WDCleVQ4DzTmXnYkkA1sFAfZ
 5ctGJQ058ve82LWe7uiqmxVDYCygpK2Qi3XYYtzZK6AWWSZLmfyNT1v5Mf1jHVK9ehtPwuSgr9f
 34Ig6sYqnUSCtrg==
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

None of these functions modify the Xe device parameter, and marking it
as const will avoid warnings when the callsite wants to pass a const
pointer.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 555c191f7510..355d69dc8f54 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -146,37 +146,37 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 
 void xe_device_assert_mem_access(struct xe_device *xe);
 
-static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
+static inline bool xe_device_has_flat_ccs(const struct xe_device *xe)
 {
 	return xe->info.has_flat_ccs;
 }
 
-static inline bool xe_device_has_sriov(struct xe_device *xe)
+static inline bool xe_device_has_sriov(const struct xe_device *xe)
 {
 	return xe->info.has_sriov;
 }
 
-static inline bool xe_device_has_msix(struct xe_device *xe)
+static inline bool xe_device_has_msix(const struct xe_device *xe)
 {
 	return xe->irq.msix.nvec > 0;
 }
 
-static inline bool xe_device_has_memirq(struct xe_device *xe)
+static inline bool xe_device_has_memirq(const struct xe_device *xe)
 {
 	return GRAPHICS_VERx100(xe) >= 1250;
 }
 
-static inline bool xe_device_uses_memirq(struct xe_device *xe)
+static inline bool xe_device_uses_memirq(const struct xe_device *xe)
 {
 	return xe_device_has_memirq(xe) && (IS_SRIOV_VF(xe) || xe_device_has_msix(xe));
 }
 
-static inline bool xe_device_has_lmtt(struct xe_device *xe)
+static inline bool xe_device_has_lmtt(const struct xe_device *xe)
 {
 	return IS_DGFX(xe);
 }
 
-static inline bool xe_device_has_mert(struct xe_device *xe)
+static inline bool xe_device_has_mert(const struct xe_device *xe)
 {
 	return xe->info.has_mert;
 }

-- 
2.53.0

