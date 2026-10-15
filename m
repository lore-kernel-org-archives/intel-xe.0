Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E2BCC6B34
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 07:16:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7AC11120FC;
	Thu, 15 Oct 2026 07:16:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9345E1120E8
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 07:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792048558; x=1823584558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ja0l56W5+LdTtMVr5n9V3moxTy2m/iCk+eBXJuaODLo=;
 b=GBZNsmRCgk2kSMiVIBjm5JZS4Cb6FHYyXwjPD7queoWpc6QWailebB2G
 7WYDiYPPVFrKveAU6K0eevxrB9IX0r0WAz5nExovxopsv1GpxDH+8Gd8+
 HDaX6hSsNuFmaAyGBxP14k9DLdFm9/CIENYKKzxmvXGX+F4pUYqKZ/+a+
 GF0pHihkeDgw8FdWC04bMcqJwGS/YRP/lU7ZM1raW4li2etoOUCsa1JRr
 JcZJOG+4uatwK5sq0/4Wmm6hMZvAzI+a3UhgOZl+XIzjWLjQBBAWYXMAq
 4Ktxm0GHh3C3pVCBG3Nt2jHHwWsX/BPKyc5Kihk1NgPqhb75FuEh/VU2h Q==;
X-CSE-ConnectionGUID: ddFz8Rb9TraBXB8bosWqtA==
X-CSE-MsgGUID: XQbT59kIQXOW9K39OJcvIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="707173"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="707173"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 00:15:58 -0700
X-CSE-ConnectionGUID: mDPWRkpLSDyNcfMxhGG9Eg==
X-CSE-MsgGUID: m9i4/TpTSWubYuZRnKoRZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1508999"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 00:15:56 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v14 09/16] drm/xe/hwmon: use CRI-specific package and VRAM
 temperature registers
Date: Thu, 15 Oct 2026 12:44:27 +0530
Message-Id: <20261015071434.1063785-10-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261015071434.1063785-1-karthik.poosa@intel.com>
References: <20261015071434.1063785-1-karthik.poosa@intel.com>
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
index f1463652f293..45b08d053940 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -306,7 +306,14 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 
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

