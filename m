Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01426CCD19E
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 02:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFD910EAEA;
	Fri, 17 Oct 2025 02:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NNhQxEcN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5433F10EAE9
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 02:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760668037; x=1792204037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VE6xoBlH2a+VX0sk1Vh42dEf1b3l8+OiLy1m7ON6zSY=;
 b=NNhQxEcN11gXymkMig9uSRs6BLM2c/tVpLQN5tBZamkh+5RR0u+JGBQg
 Fqr3OTxoj08mxnEtwi9OOM0kDixb2KjeuK8LRoA1bsBivLRV7nv/rYhu5
 qr1uAZAMkTB+DBc1bLdhSpwWdyjJa4orj1SLEMHXcQSh5CyyFuCLiWVNj
 Ha/LQ+aH6eua8f3ila6+5XF8cAvJpwDYBJefVnYiJ3xb2OBdwFKsVJUi8
 uFKKRV71S8azY9xH1hTmrgelBepBo7vvz7EwqD1Pyh+J8+S11nsc05tEq
 dWHPfLf1b0Mj/C4DVVJsLJNeETkyZXPieVR3eLtuXs6nxXoigfgmFj1vU Q==;
X-CSE-ConnectionGUID: 9C7WbJpsQDiosMmubo1OzQ==
X-CSE-MsgGUID: gGznHtW/Qi2/aA/ZGtCUAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66739210"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66739210"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:17 -0700
X-CSE-ConnectionGUID: rjc/EOWJTQiimIq9Igch/g==
X-CSE-MsgGUID: Eh14tt7ySEG+6Qbft/096Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183089177"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 07/24] drm/xe/xe3p: Stop programming RCU_MODE's fixed slice
 mode setting
Date: Thu, 16 Oct 2025 19:26:26 -0700
Message-ID: <20251016-xe3p-v3-7-3dd173a3097a@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Matt Roper <matthew.d.roper@intel.com>

Since the hardware load balancing is no longer supported, the
programming in RCU_MODE is no longer necessary.

Bspec: 60382
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index cba4375525c7e..b08a6d42c8ffc 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -350,6 +350,13 @@ static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_device *xe,
 						 const struct xe_gt *gt,
 						 const struct xe_hw_engine *hwe)
 {
+	/*
+	 * Xe3p no longer supports load balance mode, so "fixed cslice" mode
+	 * is automatic and no RCU_MODE programming is required.
+	 */
+	if (GRAPHICS_VER(gt_to_xe(gt)) >= 35)
+		return false;
+
 	return xe_gt_ccs_mode_enabled(gt) &&
 	       xe_rtp_match_first_render_or_compute(xe, gt, hwe);
 }

-- 
2.51.0

