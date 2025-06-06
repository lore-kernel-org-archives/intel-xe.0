Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FADC677C4
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 19:26:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FD210EBFA;
	Fri,  6 Jun 2025 19:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoJBXM00";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2287110EBF0
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 19:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749237982; x=1780773982;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=20ZbVaWNjTwNd+5HOi5LwujitQR+pixrvkapfZaX0B0=;
 b=XoJBXM00xv0OD5BlSceTC8RUQ3EUi25FzeUO6zOJL4a3wFBLKdc2cxND
 /PpZ31Wq1gxvmw27KGY8kJAwlWYC+N4m2rHoW2Dko5tuHeftHyaa8K1/g
 O8O6kh4xlPpn3nrkUafMYZ04sJMIH7ebYERslZoitxyTFkY/E1W+yu+it
 9ZLfhCeexBMNnJtMrRQTo3ohSC8+HWw9WssYfaIDo2T1P8wohfQ8q77XH
 SMfWmvIKarTCBqB8BpMcLuKUh/7CBLveCO7eapxAOlI3h1mkuX6Qa3GD8
 i1XpkLY3oYmmA/aztsMh53h1Usrm5USfefIWiFI/EMkoyhyhIYzomngAL w==;
X-CSE-ConnectionGUID: pHGQ/LKeTvGi7fH48rZeNA==
X-CSE-MsgGUID: SPpDO8MLRgaldQ3slDc6jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="61663147"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="61663147"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 12:26:21 -0700
X-CSE-ConnectionGUID: hhBhH2EkT/e1JRzUAg6yMQ==
X-CSE-MsgGUID: SjM6vKjPSM+83EDT5KGI3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="150742753"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 12:26:21 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/5] drm/xe/oa: Enable OAM latency measurement
Date: Fri,  6 Jun 2025 12:26:17 -0700
Message-ID: <20250606192618.4133817-6-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250606192618.4133817-1-ashutosh.dixit@intel.com>
References: <20250606192618.4133817-1-ashutosh.dixit@intel.com>
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

v2: Introduce DRM_XE_OA_UNIT_TYPE_OAM_SAG

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_oa_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_oa.c           | 11 ++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

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
index f41dac107e4a3..679ee69502530 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -844,6 +844,11 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 
 	/* Reset PMON Enable to save power. */
 	xe_mmio_rmw32(mmio, XELPMP_SQCNT1, sqcnt1, 0);
+
+	if ((stream->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM ||
+	     stream->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM_SAG) &&
+	    GRAPHICS_VER(stream->oa->xe) >= 30)
+		xe_mmio_rmw32(mmio, OAM_COMPRESSION_T3_CONTROL, OAM_LAT_MEASURE_ENABLE, 0);
 }
 
 static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
@@ -1111,9 +1116,13 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 	 */
 	sqcnt1 = SQCNT1_PMON_ENABLE |
 		 (HAS_OA_BPC_REPORTING(stream->oa->xe) ? SQCNT1_OABPC : 0);
-
 	xe_mmio_rmw32(mmio, XELPMP_SQCNT1, 0, sqcnt1);
 
+	if ((stream->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM ||
+	     stream->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM_SAG) &&
+	    GRAPHICS_VER(stream->oa->xe) >= 30)
+		xe_mmio_rmw32(mmio, OAM_COMPRESSION_T3_CONTROL, 0, OAM_LAT_MEASURE_ENABLE);
+
 	/* Configure OAR/OAC */
 	if (stream->exec_q) {
 		ret = xe_oa_configure_oa_context(stream, true);
-- 
2.48.1

