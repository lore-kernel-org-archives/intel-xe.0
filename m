Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0083CD13DA
	for <intel-xe@archiver.kernel.org>; Sat,  2 May 2026 18:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19F910E090;
	Sat,  2 May 2026 18:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBBM7tnL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874A610E090
 for <intel-xe@lists.freedesktop.org>; Sat,  2 May 2026 18:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777745122; x=1809281122;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pn9MwgLB+7vgJTCgzBbRWeLFDRP9y/jA7sarzGMw/n8=;
 b=XBBM7tnLhRetvNUlH6CWXd/5/T+DCJe5Os4I2ioE9lK0dOBy5j5cbJZ9
 LuRzd7LPDVpfMtK3rm5M6j72xDUB4isib/OCGmdNjeWGP+aKs4fcmaAC9
 WWsNvJPbo4l538pX/KHjKuM9oXp3YpYSTOSvd3EjYKbfDZDhi6SzZvzew
 WgzAmucLWkiGN3PLY/6YPWemMxwfKzekFT6x3rAHYkTsRfPcAUMpkYCwC
 rPuU3SI/WcHDQxCQTEG8k4pi+zAx9V5STsBGXpI+NBQtR6z7Z97uoltFn
 kZ/JCZGqIzT96b97dk4volH9P6DzUMREwNCB/UQ8lWVHLW9FynSEqWBep Q==;
X-CSE-ConnectionGUID: 2yAFj/Q4QRCzW1gmtBiJng==
X-CSE-MsgGUID: Qg5UQGqOTXWGi/GSqlTofg==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="77833389"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; d="scan'208";a="77833389"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2026 11:05:21 -0700
X-CSE-ConnectionGUID: Qev66k+ESM+O7aQN9prCyQ==
X-CSE-MsgGUID: aU9hd/SpT1WkurWehosKwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; d="scan'208";a="232488119"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 02 May 2026 11:05:20 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/hw_error: Cleanup array map
Date: Sat,  2 May 2026 23:31:43 +0530
Message-ID: <20260502180143.1450266-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

xe_hw_error_map[] is not worth the memory needed to map two components.
Clean it up and use switch() instead, which also, in turn, simplifies
bounds checking logic.

add/remove: 0/1 grow/shrink: 0/1 up/down: 0/-425 (-425)
Function                                     old     new   delta
xe_hw_error_map                              136       -    -136
xe_hw_error_irq_handler                     3728    3439    -289
Total: Before=7700, After=7275, chg -5.52%

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 9e8dcdf911e4..84dc4cb330ff 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -36,11 +36,6 @@ static const char * const hec_uncorrected_fw_errors[] = {
 	"Data Corruption"
 };
 
-static const unsigned long xe_hw_error_map[] = {
-	[XE_GT_ERROR]	= DRM_XE_RAS_ERR_COMP_CORE_COMPUTE,
-	[XE_SOC_ERROR]	= DRM_XE_RAS_ERR_COMP_SOC_INTERNAL,
-};
-
 enum gt_vector_regs {
 	ERR_STAT_GT_VECTOR0 = 0,
 	ERR_STAT_GT_VECTOR1,
@@ -65,6 +60,18 @@ static enum drm_xe_ras_error_severity hw_err_to_severity(const enum hardware_err
 	return DRM_XE_RAS_ERR_SEV_UNCORRECTABLE;
 }
 
+static inline u32 err_src_to_id(u32 err_bit)
+{
+	switch (err_bit) {
+	case XE_GT_ERROR:
+		return DRM_XE_RAS_ERR_COMP_CORE_COMPUTE;
+	case XE_SOC_ERROR:
+		return DRM_XE_RAS_ERR_COMP_SOC_INTERNAL;
+	default:
+		return 0;
+	}
+}
+
 static const char * const pvc_master_global_err_reg[] = {
 	[0 ... 1]	= "Undefined",
 	[2]		= "HBM SS0: Channel0",
@@ -475,14 +482,8 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 		const char *name;
 		u32 error_id;
 
-		/* Check error bit is within bounds */
-		if (err_bit >= ARRAY_SIZE(xe_hw_error_map))
-			break;
-
-		error_id = xe_hw_error_map[err_bit];
-
-		/* Check error component is within max */
-		if (!error_id || error_id >= DRM_XE_RAS_ERR_COMP_MAX)
+		error_id = err_src_to_id(err_bit);
+		if (!error_id)
 			continue;
 
 		name = info[error_id].name;
-- 
2.43.0

