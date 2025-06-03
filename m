Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C230C61CE7
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 20:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F51510E919;
	Tue,  3 Jun 2025 20:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lWZb8Gmv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BBC10E8F3
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 20:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748982109; x=1780518109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Mb0wgbOU80pYMYPp2b2aaV5QW8BJGECdQj+5tqTd4I=;
 b=lWZb8GmvIt5qrAslurFEm/tTO6oXIczNCjh7tR3Ju97oRSSycXP5iUOa
 xDuKhw5dCF8Cq178by+TNth54oz5Rc/mugS3vuKV0iyfl6TjKeQVQV94W
 jjtRd5RA2nQcRwNiAHf1R6yQSIVp9I4Y5BSpOFShMoMWTDdO+Za2ymfKF
 +XnnOuqdzORvC/vLlWli2JMKjLeDgnhSrI8g3x5lZMONw8M3GHuHzA7D3
 0lYUcfrgJ9YpM6+MGzrL3YwHr3+lnP9iVsokzh2bz8W4BJGnCdx2sIlH1
 D4uvS60iM+PGtsgiMSKSs4afRDVKu5EuBLG1F56wL6jHFkf8gfOsbACUD g==;
X-CSE-ConnectionGUID: dUQQlEbJSfCsfdz++HN19Q==
X-CSE-MsgGUID: s4qqKj1gRe6iObVFwXt6wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="76427539"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="76427539"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:21:49 -0700
X-CSE-ConnectionGUID: Xxr9BcdUT3eSPBr3tF5ckg==
X-CSE-MsgGUID: LUY21s/nQuSMYKvfP4Ejpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="175833215"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:21:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 5/5] drm/xe/oa: Enable OAM latency measurement
Date: Tue,  3 Jun 2025 13:21:33 -0700
Message-ID: <20250603202133.2713863-6-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250603202133.2713863-1-ashutosh.dixit@intel.com>
References: <20250603202133.2713863-1-ashutosh.dixit@intel.com>
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
index 35157424010bb..5aa68bd63b00d 100644
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

