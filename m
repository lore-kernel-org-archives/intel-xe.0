Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA1FCD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 03:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F936112DBB;
	Thu,  4 Apr 2024 03:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RjnF/0wz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458521130D1
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 03:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712202270; x=1743738270;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Uts7cCW25NNLc11tncKSRyWvVfykUJan2+LZ1DwT6Mg=;
 b=RjnF/0wz55DKJekmBPa1qpDO8ngAYj4tn0k0dArsk6uJBhjNoks1WOvs
 MyGTk4IIGWe0kpHSez0mYD2ir1AJUn/icGr4I79+dSkUcsRPlUtecibKx
 6KhaQi/ByVRhma841MRCaBBRCQecSOHr/w/Iq8Ytx5GdkD0PnIdloHKGd
 Vl0IEfxqWDVTOuWPM5LbauPUnejGpO+Jx7DN/jX9Ex06S/Er2y/yfLxV+
 SC4KvtLP7+D5AZy3a16sohOn3nXPGAcksNup4w3YWbcNJGxGYHENxyd3P
 Q9HlHvZYCdb38RMD+1ESSjHBMf2xvBnRBlhEDR4A60vgFsTaQL7bbBp3h A==;
X-CSE-ConnectionGUID: KqhwRiDbTmuTokW9gmP2Qg==
X-CSE-MsgGUID: Cta+DTsnRNGFj00xqknrtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11296504"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="11296504"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 20:44:30 -0700
X-CSE-ConnectionGUID: 3jyTMk0sQZiIF8u9J9sJlA==
X-CSE-MsgGUID: ux6QQ3FGSIOcL9KOUiCS3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="23405188"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 20:44:27 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 4/4] drm/xe/hwmon: Cast to output precision before
 multiplying operands
Date: Thu,  4 Apr 2024 09:24:41 +0530
Message-Id: <20240404035441.965590-5-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240404035441.965590-1-karthik.poosa@intel.com>
References: <20240404035441.965590-1-karthik.poosa@intel.com>
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

Address potential overflow in result of multiplication of two lower
precision (u32) operands before widening it to higher precision (u64).

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 114aadb54c8e..3c5764af8a23 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -297,7 +297,7 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 	 * As y can be < 2, we compute tau4 = (4 | x) << y
 	 * and then add 2 when doing the final right shift to account for units
 	 */
-	tau4 = ((1 << x_w) | x) << y;
+	tau4 = (u64)((1 << x_w) | x) << y;
 
 	/* val in hwmon interface units (millisec) */
 	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
@@ -338,7 +338,7 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
 	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
 	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
-	tau4 = ((1 << x_w) | x) << y;
+	tau4 = (u64)((1 << x_w) | x) << y;
 	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
 
 	if (val > max_win)
-- 
2.25.1

