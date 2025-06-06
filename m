Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D79C61CE7
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 16:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF30A10EAF1;
	Fri,  6 Jun 2025 16:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYn50/0n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2BC10EAEF
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749225784; x=1780761784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=20ZbVaWNjTwNd+5HOi5LwujitQR+pixrvkapfZaX0B0=;
 b=bYn50/0naxPTJmxKV7HoL5CHXF63LNmFNCx7OAuGKSh5+W5RuP3tyW8n
 Vk2FRVuc1E8gNFFl3P+CUeaTeqr6luyZrfOUwKaNhbCFdX8hH1GLY6C77
 wpkQ6i5SEAxBiT2hGaPfKUNQXQb/747GGT5uG7LkMStJMKgIoHQiGqOEX
 cUvoFKh3fbzu32mfsCLExpJJZ4uzTsZml8XVLuVeTzhMwgTz+6BdtZMEU
 nNigcbqpKSyprGq5jKhHTun4ZGkLcnWpozYtud3rqH9py2bxPTzmFduOE
 ks3Go7BIj1pJ2eY7cPfl3OFwzfJgqtHkKGKk5BmqXg27i/NaFfsAGXLF3 w==;
X-CSE-ConnectionGUID: JgVxSbCCQWOZWJPktg1mvA==
X-CSE-MsgGUID: KWvm0oSwSDmK1E0nxqbGIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51526360"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51526360"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 09:03:03 -0700
X-CSE-ConnectionGUID: FA3SUrdySHGV1p3NpFJu+Q==
X-CSE-MsgGUID: t0u/seBiQlSSXJeSGOTd/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="145748904"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 09:03:03 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 5/5] drm/xe/oa: Enable OAM latency measurement
Date: Fri,  6 Jun 2025 09:02:53 -0700
Message-ID: <20250606160253.4054668-6-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250606160253.4054668-1-ashutosh.dixit@intel.com>
References: <20250606160253.4054668-1-ashutosh.dixit@intel.com>
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

