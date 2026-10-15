Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46B8CCA465
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 19:02:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15FB10E3AA;
	Thu, 15 Oct 2026 19:02:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF14112447
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 19:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792090953; x=1823626953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qe1osRcVIHX/90JCHkQ0loE9zjZHUunuv9MjBxTgGWg=;
 b=LKsllCd7LPSr/YUXCI1gFdkUox/klySzEtj8fOKOhd+An9v57u28Y8Ey
 IK5zQ3XefqSazeZA00XD4Lbfg0eza8vXvzvh13H868tlVfVaRUc4oZfkR
 NI5in2365D0qTZ0FQ9b7SF7C/VR9BI+3neprd6uUzEn0H+6Uy1jSAorhN
 lpbR8rn0gpjcFM1OeoM3hk1kvB3/BpP4+nDtcVhSU8kb5jDLhVPm77dvZ
 cp7T06EwK0O61PJMFU1JBpucZpbi0i/pWajsFykOFDnDudr24BdJ1iZq4
 P7p8ru/qhbyY1MS4h0w7AltasqFx8wu6Y9q7kMoSS3xYQw9mb+lnZ1Obw g==;
X-CSE-ConnectionGUID: NV2OIh/ZSYSFkBXilNTd0w==
X-CSE-MsgGUID: Y1u9sW7RT4CSpmLKRttiHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="751533"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="751533"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:02:33 -0700
X-CSE-ConnectionGUID: 8Pgqbz+NTFSZbAMQ0yudqg==
X-CSE-MsgGUID: uX7aAVd2RYOos0Hzdu2nOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1774660"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:02:30 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe/hwmon: Enable fan support for CRI
Date: Fri, 16 Oct 2026 00:31:13 +0530
Message-Id: <20261015190113.1268522-11-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261015190113.1268522-1-karthik.poosa@intel.com>
References: <20261015190113.1268522-1-karthik.poosa@intel.com>
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

Enable fan control support for CRI.
Use new fan 3 speed register offset for CRI.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h | 1 +
 drivers/gpu/drm/xe/xe_hwmon.c           | 3 ++-
 drivers/gpu/drm/xe/xe_pci.c             | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
index d9e4847dd68e..23f21e9e425d 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -28,6 +28,7 @@
 #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
 
 #define CRI_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
+#define CRI_FAN_3_SPEED                         XE_REG(0x138174)
 #define CRI_MSU_VRAM_ENABLE			XE_REG(0x138340)
 #define CRI_PACKAGE_TEMPERATURE			XE_REG(0x138344)
 #define CRI_VRAM_TEMPERATURE			XE_REG(0x138348)
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index a61520dc4295..507bf5dac002 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -503,7 +503,8 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 		else if (channel == FAN_2)
 			return BMG_FAN_2_SPEED;
 		else if (channel == FAN_3)
-			return BMG_FAN_3_SPEED;
+			return (xe->info.platform == XE_CRESCENTISLAND) ? CRI_FAN_3_SPEED :
+				BMG_FAN_3_SPEED;
 		break;
 	default:
 		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 605c452a9c33..bce590b4ed34 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -476,6 +476,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_display = false,
 	.has_device_uid = true,
 	.has_drm_ras = true,
+	.has_fan_control = true,
 	.has_flat_ccs = false,
 	.has_gsc_nvm = 1,
 	.has_i2c = true,
-- 
2.25.1

