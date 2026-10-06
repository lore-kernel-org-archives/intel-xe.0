Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF67CA5FF0
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 03:36:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35A010E2C5;
	Tue,  6 Oct 2026 03:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wkdsw9C+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0427910E2C4
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Oct 2026 03:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791257815; x=1822793815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=usFWkWjP6h7KaH/R9PpJYp3AyN4p4fF6wii1qYlzBwM=;
 b=Wkdsw9C+DL3Wt26x8FgVn7egXxbsSw4jWT37yVEn6uFF0u2sQwFKuZrC
 L2Kb5N7OTYsRZ2gnr75V1yX7VEgW6ABLHZSu2MkUGCfABRhd/XBZMrBYH
 dPG/LvryTYg5iQfewFvFp79U4CrNmgzBcSRXQ+C8cL7I4cbLrA4UA7wu3
 34CI0CyUS6B92AtiuEMJZofeyDfaZIYdLFANdVdDIe4a24Ue4qpKIG6kh
 p2AADtBHQy0a/9+YsWti0ZZ4n1J7i+UStI2NaPDAubwN9WpeqIohZ9OJJ
 Q9OYveM1cgLaNwIMw6IlbHnDfS1+Jo2WaAOEicgmyZ2ADb0aSx6DRdbm/ Q==;
X-CSE-ConnectionGUID: Trxrk/znQD+iWPc/lggzuw==
X-CSE-MsgGUID: uM0FZIk/QkSozMS/FP0BlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94427412"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="94427412"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 20:36:55 -0700
X-CSE-ConnectionGUID: 8DqNZ7J1RKmHsUnShqic8A==
X-CSE-MsgGUID: pVVKsjWNSd65jgBTGDWfXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="273400968"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 20:36:52 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v8 09/15] drm/xe/hwmon: use CRI-specific package and VRAM
 temperature registers
Date: Tue,  6 Oct 2026 09:05:28 +0530
Message-Id: <20261006033534.3583967-10-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261006033534.3583967-1-karthik.poosa@intel.com>
References: <20261006033534.3583967-1-karthik.poosa@intel.com>
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
index b8682eb233e4..bafa175f8457 100644
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

