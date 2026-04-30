Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E62CCD13D3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 16:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3910410F3BB;
	Thu, 30 Apr 2026 16:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXUN8YEV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A9310F3BB
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 16:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777565704; x=1809101704;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JWmFCMM58n6J+ahfMnLO/cVHxit6tBYqDhSOOTCSzCI=;
 b=DXUN8YEVuFdTxJHL558esshioRUwWAg3jziR5Jy+CYX1Y8REqGgCf89+
 juc/IAZDE9ohYD8LI8d4xpszt1wXtxdL48XPeki0bIyFYw2kLc/P0CVQM
 7MjHdemJm/FzzZJHJMz9V110fIHDCF0yV5W2Ry9RW69w2b8Ojp3nyn7C9
 j5cdBK8jpgkRJGpeGJiXGKQ9+DJVCYos4nodJTVZs5VkNIyhFVal4l/lq
 zrVOI79XElItx1iAjPMG6QNyCUzv41NYq39iQxfzHAV7/W9GSDIB2FVIB
 aN/p8rohMM0qxTlMdcslArJmph8AUUQTU2t5kyV96BPb5HhL7ygEnAKVN A==;
X-CSE-ConnectionGUID: 8BkemqLrR6+emeUePEGcPg==
X-CSE-MsgGUID: qQTE/LS+SBO4xaNwa28kXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="89620096"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="89620096"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 09:15:03 -0700
X-CSE-ConnectionGUID: 6jPExkBcQIWP55X3zb9TXA==
X-CSE-MsgGUID: 9Qa7gURvTHS2EqS1gHr5CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="238609920"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 09:15:03 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/4] drm/xe/oa: MERTOA Wa_14026779378
Date: Thu, 30 Apr 2026 09:14:59 -0700
Message-ID: <20260430161459.2892545-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430161459.2892545-1-ashutosh.dixit@intel.com>
References: <20260430161459.2892545-1-ashutosh.dixit@intel.com>
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

Do not allow SYS_MEM_LAT_MEASURE_EN bit to be set in SYS_MEM_LAT_MEASURE
register. Doing so can cause memory corruption.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_oa_regs.h      | 3 +++
 drivers/gpu/drm/xe/xe_device_wa_oob.rules | 1 +
 drivers/gpu/drm/xe/xe_oa.c                | 4 ++++
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
index 04a729e610aa9..aa66af7e99fee 100644
--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -6,6 +6,9 @@
 #ifndef __XE_OA_REGS__
 #define __XE_OA_REGS__
 
+#define SYS_MEM_LAT_MEASURE		XE_REG(0x145194)
+#define   SYS_MEM_LAT_MEASURE_EN	REG_BIT(31)
+
 #define RPM_CONFIG1			XE_REG(0xd04)
 #define   GT_NOA_ENABLE			REG_BIT(9)
 
diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index 0793b9e635495..d8dc41851425c 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -6,3 +6,4 @@
 14026539277	PLATFORM(NOVALAKE_P), PLATFORM_STEP(A0, B0)
 14026633728	PLATFORM(CRESCENTISLAND)
 14026746987	PLATFORM(CRESCENTISLAND)
+14026779378	PLATFORM(CRESCENTISLAND)
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 7e1e8a86d19c0..7c9071abb44f1 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2251,6 +2251,10 @@ static bool xe_oa_is_valid_mux_addr(struct xe_oa *oa, u32 addr)
 
 static bool xe_oa_is_valid_config_reg(struct xe_oa *oa, u32 addr, u32 val)
 {
+	if (XE_DEVICE_WA(oa->xe, 14026779378) &&
+	    addr == SYS_MEM_LAT_MEASURE.addr && val & SYS_MEM_LAT_MEASURE_EN)
+		return false;
+
 	return xe_oa_is_valid_flex_addr(oa, addr) ||
 		xe_oa_is_valid_b_counter_addr(oa, addr) ||
 		xe_oa_is_valid_mux_addr(oa, addr);
-- 
2.54.0

