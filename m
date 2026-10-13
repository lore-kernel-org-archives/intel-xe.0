Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D69CA9EC5
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 02:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DA310E70A;
	Tue, 13 Oct 2026 02:07:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1FE10E6F3
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 02:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791857273; x=1823393273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yS1RAybJleKB2ckj6P9qbShGccP3oqjpce5Jmegj9yg=;
 b=cDCq2MfqAsaO65egkijiEbwiPWiS15pxR4VgrBMAM5dOJhDbLuZ/b/Fh
 zgzUiQJdc37W/AbQRSVqat+tWwxtnQnoNULcSJePb3KEyzB98mQijKFQL
 6QbdQPSgeDE+uQn/ufn+hFBsN9tsu8U0XD3zGs1XVTbk0H//FjR6OjMIk
 nfYqEykqDuLG/XJIekNo9NQ/STGuot6qW5+uriRYRkkshrB/KoLOgTVgv
 tYArT3eDJDbXZkmNLReiJepSQGLBinSsAA3HY49t8O4oZ+UNeeDmN2kvf
 dRTZ+Gf1VIQi/CQ+cdrBuUFfcnR4tDtpq4jtuI/EWkX5hipHXxUdwE67M g==;
X-CSE-ConnectionGUID: L7nfBZlGSXy6mQTzERt4pg==
X-CSE-MsgGUID: 0w9RII/lRcmfRsMDx71hjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="670204"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="670204"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 19:07:53 -0700
X-CSE-ConnectionGUID: hgACzncPSz2vRUQobclN/w==
X-CSE-MsgGUID: vkxasqfLRc+3g9moqrmKeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1369199"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 19:07:50 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v11 09/16] drm/xe/hwmon: use CRI-specific package and VRAM
 temperature registers
Date: Tue, 13 Oct 2026 07:36:29 +0530
Message-Id: <20261013020636.447620-10-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261013020636.447620-1-karthik.poosa@intel.com>
References: <20261013020636.447620-1-karthik.poosa@intel.com>
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

Crescent Island uses different MMIO offsets for package and VRAM
temperature than Battlemage. Add CRI-specific register definitions
and select them in xe_hwmon_get_reg() for REG_TEMP handling.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_hwmon.c           | 9 ++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
index c63b409d7a82..a969661f0c95 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -28,6 +28,9 @@
 #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
 
 #define CRI_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
+#define CRI_PACKAGE_TEMPERATURE			XE_REG(0x138344)
+#define CRI_VRAM_TEMPERATURE			XE_REG(0x138348)
 #define CRI_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
+#define CRI_VRAM_TEMPERATURE_N(n)		XE_REG(0x138a00 + ((n) * (sizeof(u32))))
 
 #endif /* _XE_PCODE_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index d3cf90cf874d..08c4db36ced4 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -276,7 +276,14 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 
 	switch (hwmon_reg) {
 	case REG_TEMP:
-		if (xe->info.platform == XE_BATTLEMAGE || xe->info.platform == XE_CRESCENTISLAND) {
+		if (xe->info.platform == XE_CRESCENTISLAND) {
+			if (channel == CHANNEL_PKG)
+				return CRI_PACKAGE_TEMPERATURE;
+			else if (channel == CHANNEL_VRAM)
+				return CRI_VRAM_TEMPERATURE;
+			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
+				return CRI_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
+		} else if (xe->info.platform == XE_BATTLEMAGE) {
 			if (channel == CHANNEL_PKG)
 				return BMG_PACKAGE_TEMPERATURE;
 			else if (channel == CHANNEL_VRAM)
-- 
2.25.1

