Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39023CD37B9
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E545510E64E;
	Wed,  4 Sep 2024 00:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bl0S2B8g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076A310E641
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409278; x=1756945278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ee1bl/F+3gwCW06Ge/IeUpJLV3mqBChY496zzm5vzcA=;
 b=Bl0S2B8ggQrRE0upE7CenZN9AlXsusBnsS9sX684zYinwleifLlbFOcO
 9pcki5KLNFdRmOJsT94+QpjsYDi07dDj1abug9kpYySJZjlMjtWFhdDx+
 8b6D0G0P05Bk8N+1cMW5B+8hj/7YzDwviukjE+Bbv6FwYhC2+LTEU5EKp
 jqm+DNjg7sWDyZ2IIUSVsozb2sq4E3BNZNmgigR1EY8wxxJ4axKVFFPQd
 bGP/nUPfILCXXiEDyu7Rf5Hh3t2lWFl1UIDj2+CHAR5634IwUBCz7tA05
 2Rahx8aNU+qC8P79AQ4Fz10tAY3kJTPfeqMqcwqN15OLmB8YfXStUAo6P w==;
X-CSE-ConnectionGUID: kaGpbtZ6Q5aAktYQmID50g==
X-CSE-MsgGUID: fNX6+eFARNC18D/OcKZe+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904824"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904824"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:17 -0700
X-CSE-ConnectionGUID: 3sKjEcTDTWC13R5z7nb9jQ==
X-CSE-MsgGUID: SL41CZRVSbaQnaMxXZtWew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944315"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 34/43] drm/xe/gt_clock: Convert register access to use xe_mmio
Date: Tue,  3 Sep 2024 17:21:35 -0700
Message-ID: <20240904002100.2023834-79-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

