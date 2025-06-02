Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56DBC5B549
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 07:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A086A10E268;
	Mon,  2 Jun 2025 07:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GhJWCdwn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C8610E1E8
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 07:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748850927; x=1780386927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xUN1ywx+pKArJYtFCA69fa3JEwzcWuToJCODyDuy6zc=;
 b=GhJWCdwn+U4MTkc5WF8uORmastt5SOqtTkhJZPR6tC5uahQ4vu/pyY6l
 UaQDgj28BpqSwtI8qPELBgWsKJTiOBQucA2IF3tzwgEcPufITjm04CzWs
 7hzcda6e6R8Z4gYOdWZy3Qtghx6rgRkUAphNgqDLx5glc3biW6YZbRHZ8
 CyU3qCdbklZSSX5Yg7Nw8gcC8pT6pL2CvqxgqFmAfYPHFh3YBPoTV31zA
 n6cB1v0QjjUsmqPCaOjGp9P3Fo6uqEq2lUSMKlrDrMs8em6JfmFFQ/yIn
 G/G36fotNf2r+r2C0uU+2QpX447QdfcAJq54loKiU0udX+yC40iVeCKNy A==;
X-CSE-ConnectionGUID: PwHY45MaRN2818AXVSSCGg==
X-CSE-MsgGUID: SNoMEUk2SSCIk8ea2EdI2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="68403895"
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; d="scan'208";a="68403895"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 00:55:27 -0700
X-CSE-ConnectionGUID: 0SG7ND+hTHye7z6+eoW1+w==
X-CSE-MsgGUID: UkJP94STSGqoOWLlc7zN/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; d="scan'208";a="167647565"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa002.fm.intel.com with ESMTP; 02 Jun 2025 00:55:27 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 1/3] drm/xe/bmg: Update Wa_14022085890
Date: Mon,  2 Jun 2025 00:53:28 -0700
Message-Id: <20250602075330.1728243-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250602075330.1728243-1-vinay.belgaumkar@intel.com>
References: <20250602075330.1728243-1-vinay.belgaumkar@intel.com>
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

Set GT min frequency to 1200Mhz once driver load is
complete.

v2: Review comments (Rodrigo)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c     | 7 ++++++-
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 18c623992035..a0c205de67bb 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -51,6 +51,7 @@
 
 #define LNL_MERT_FREQ_CAP	800
 #define BMG_MERT_FREQ_CAP	2133
+#define BMG_MIN_FREQ		1200
 
 #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no need for precision */
 #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at pc_start */
@@ -877,8 +878,12 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
 		 * Get updated min/max and stash them.
 		 */
 		ret = xe_guc_pc_get_min_freq(pc, &pc->stashed_min_freq);
-		if (!ret)
+		if (!ret) {
+			if (XE_WA(pc_to_gt(pc), 14022085890))
+				pc->stashed_min_freq = max(BMG_MIN_FREQ, pc->stashed_min_freq);
 			ret = xe_guc_pc_get_max_freq(pc, &pc->stashed_max_freq);
+		}
+
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 9efc5accd43d..75fbdab68d44 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -59,3 +59,4 @@ no_media_l3	MEDIA_VERSION(3000)
 		MEDIA_VERSION_RANGE(1301, 3000)
 16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
 		MEDIA_VERSION_RANGE(1300, 3000)
+14022085890	GRAPHICS_VERSION(2001)
-- 
2.38.1

