Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6A8C98318
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 20:55:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F34310E1F3;
	Thu, 24 Sep 2026 20:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i1Hdrfov";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC3510E55F
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 20:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790283347; x=1821819347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Dt9PGaaMk/HHthmfEbSubat9UAqJq3HSO5+znoiut8=;
 b=i1HdrfovvKihS+iFiNre7Ms0Pq1MBvfrHstMBwf9rystb5MzACLvt/4/
 Pei++NLYkyHMi3Qlm2w8MwOyz5UEQj9iCacSAP0eawzanFdDRcUtPDXUa
 XKNeso2iMfi2LT1bT4ToIjQKS6/vr5IASG1WW/E5kruTDAp+wEBnJKfQq
 8G2w1DqzBz3lzYbCDeLWMLJ/sgk1dhsmR8EK31DWSpooSdzpRIgb5KX2i
 LBwWDwc/N2wqXEkG//Rg3hmoOlkw+6+rEdjd+w9cwd2YbDvQSJJKTN7yZ
 FYoLk3TrGxUDYFR3Ky1W847B6xlne/EIU/9xUN+PtUFm5Ga5SpxxnCogl w==;
X-CSE-ConnectionGUID: Gn5CT8suRWGVVghJSrsebg==
X-CSE-MsgGUID: zWwIhA8iSzmxXqav5mcWpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="94886195"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="94886195"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 13:55:46 -0700
X-CSE-ConnectionGUID: 12nv9xaSR0KyM2OIzU6Tlw==
X-CSE-MsgGUID: i3wKedM8QiiCkxbhtq1acA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="273347429"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 13:55:43 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v6 09/13] drm/xe/hwmon: use CRI-specific package and VRAM
 temperature registers
Date: Fri, 25 Sep 2026 02:24:25 +0530
Message-Id: <20260924205429.2846256-10-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260924205429.2846256-1-karthik.poosa@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
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
---
v2: Update VRAM individual channel temperatures register offset
    for CRI.

v3:
 - Remove unused CRI_MSU_VRAM_ENABLE register.
 - Sort the CRI HWMON registers by increasing offset in xe_pcode_regs.h.

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
index 92280248f1e9..1b2e2fbe43c8 100644
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

