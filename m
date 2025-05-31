Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1409C5B543
	for <intel-xe@archiver.kernel.org>; Sat, 31 May 2025 00:13:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC9410E24A;
	Sat, 31 May 2025 00:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFlJA+8m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A65E10E24A
 for <intel-xe@lists.freedesktop.org>; Sat, 31 May 2025 00:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748650385; x=1780186385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6rnqPijX51lzm4qP4Y1JYsB1z5XDQWM058DcOSxLY5g=;
 b=nFlJA+8mMAzmVgWizhj5Vtlhw8Uui6DfdX81uRSYrmNlxObCg3MhQ1Ws
 YrcsvkhPDJUGDl410Bs8SHy8d6RvCVP0DNGgiO89TOIOjdHSqaaeXHuJl
 wHg0xWXyfrQhkOqlGGnbL5pn8cfOrPNCaeoNa2tc5GKg+2U1d4FMS+XqJ
 Rrx2+BHvomzav8OlO6WzTs0eBqQhnQ4Nsxsw/CggQZ+13jUtY4U5czgaV
 bObTxLt3NDbkyry/qZ/ix8opIu+iXO3D+yi34bdaXAvJ3GQJHedPmSxW6
 wQx7RAUbeuva4V9XAHmSbPV9rRlYOX5iySJ4QHJMZwFYgyoW35d5G1YZ4 g==;
X-CSE-ConnectionGUID: XkJjepCoTZ6EtJVOdHL6Vw==
X-CSE-MsgGUID: WXkWOI9wQ968LAF/aw5NpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50669554"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="50669554"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 17:13:05 -0700
X-CSE-ConnectionGUID: 95EUVHd3TIy9UEGBsxJqyQ==
X-CSE-MsgGUID: va37a6eTSJuzaYc8uYb4jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="143928022"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 17:13:04 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 5/5] drm/xe/oa: Enable OAM latency measurement
Date: Fri, 30 May 2025 17:12:59 -0700
Message-ID: <20250531001259.630681-6-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250531001259.630681-1-ashutosh.dixit@intel.com>
References: <20250531001259.630681-1-ashutosh.dixit@intel.com>
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

Enable OAM latency measurement for Xe3+ platforms.

Bspec: 58840

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_oa_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_oa.c           | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
index a79ad2da070c2..e693a50706f84 100644
--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -97,4 +97,7 @@
 #define OAM_STATUS(base)			XE_REG((base) + OAM_STATUS_OFFSET)
 #define OAM_MMIO_TRG(base)			XE_REG((base) + OAM_MMIO_TRG_OFFSET)
 
+#define OAM_COMPRESSION_T3_CONTROL		XE_REG(0x1c2e00)
+#define  OAM_LAT_MEASURE_ENABLE			REG_BIT(4)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 82b48b228ccbe..9b474a1f74a81 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -844,6 +844,9 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 
 	/* Reset PMON Enable to save power. */
 	xe_mmio_rmw32(mmio, XELPMP_SQCNT1, sqcnt1, 0);
+
+	if (stream->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM && GRAPHICS_VER(stream->oa->xe) >= 30)
+		xe_mmio_rmw32(mmio, OAM_COMPRESSION_T3_CONTROL, OAM_LAT_MEASURE_ENABLE, 0);
 }
 
 static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
@@ -1111,9 +1114,11 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 	 */
 	sqcnt1 = SQCNT1_PMON_ENABLE |
 		 (HAS_OA_BPC_REPORTING(stream->oa->xe) ? SQCNT1_OABPC : 0);
-
 	xe_mmio_rmw32(mmio, XELPMP_SQCNT1, 0, sqcnt1);
 
+	if (stream->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM && GRAPHICS_VER(stream->oa->xe) >= 30)
+		xe_mmio_rmw32(mmio, OAM_COMPRESSION_T3_CONTROL, 0, OAM_LAT_MEASURE_ENABLE);
+
 	/* Configure OAR/OAC */
 	if (stream->exec_q) {
 		ret = xe_oa_configure_oa_context(stream, true);
-- 
2.48.1

