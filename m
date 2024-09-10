Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5720BEE01F9
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810F210E94A;
	Tue, 10 Sep 2024 23:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OXCcPPL2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8EB10E941
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012049; x=1757548049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J8Li877WQRc899X/2VTeVMa8q2x8w5VcjCO0HDF/trQ=;
 b=OXCcPPL2lbx/kyY/OXttPEChA6vNFTZpjOkcJdvrcuydzYHVrJ7K48ev
 eMHMMsULWhhQybcYKvDApsd0bVdFgAHW2kdZjmxtD3LQOlI4KKsgLGDeL
 B+4vhM/GggWNEmBPesLI308E805/Z5b/vJLZ66akld0+x5LE/eAcoL3k4
 yh5DTSsrD7VENyAMfhE8XmGKUuK8ipP4Ar8eL5RuxBBxOqrxRrD14Tqna
 q2TiAm2iw9G56yRHS/lGSfMfsE69qHDypMLpc0cU3z1MM025Jv1dhPz1i
 ogutwDReoEWsFNTtlQLRxGm7m8iKaQppny2/9f9vyRhUR7818Q1dQQqKy Q==;
X-CSE-ConnectionGUID: ccV2CdU0RUe+tM1xKVMqaw==
X-CSE-MsgGUID: T/XotF2iTAOc+/lJEAO7gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144326"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144326"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:29 -0700
X-CSE-ConnectionGUID: UEKmsHwASZeVvLl5Kr2PeA==
X-CSE-MsgGUID: Lc8bhuM1Qzu9+N3r5q+b0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989650"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 34/43] drm/xe/gt_clock: Convert register access to use
 xe_mmio
Date: Tue, 10 Sep 2024 16:47:54 -0700
Message-ID: <20240910234719.3335472-79-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910234719.3335472-45-matthew.d.roper@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_clock.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 86c2d62b4bdc..cc2ae159298e 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -17,7 +17,7 @@
 
 static u32 read_reference_ts_freq(struct xe_gt *gt)
 {
-	u32 ts_override = xe_mmio_read32(gt, TIMESTAMP_OVERRIDE);
+	u32 ts_override = xe_mmio_read32(&gt->mmio, TIMESTAMP_OVERRIDE);
 	u32 base_freq, frac_freq;
 
 	base_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK,
@@ -57,7 +57,7 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
 
 int xe_gt_clock_init(struct xe_gt *gt)
 {
-	u32 ctc_reg = xe_mmio_read32(gt, CTC_MODE);
+	u32 ctc_reg = xe_mmio_read32(&gt->mmio, CTC_MODE);
 	u32 freq = 0;
 
 	/* Assuming gen11+ so assert this assumption is correct */
@@ -66,7 +66,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
 	if (ctc_reg & CTC_SOURCE_DIVIDE_LOGIC) {
 		freq = read_reference_ts_freq(gt);
 	} else {
-		u32 c0 = xe_mmio_read32(gt, RPM_CONFIG0);
+		u32 c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
 
 		freq = get_crystal_clock_freq(c0);
 
-- 
2.45.2

