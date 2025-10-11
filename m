Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95675CCD184
	for <intel-xe@archiver.kernel.org>; Sat, 11 Oct 2025 12:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC3B10E070;
	Sat, 11 Oct 2025 12:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkJRbu2N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB3910E070
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Oct 2025 12:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760185720; x=1791721720;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mIgtIilEsyYm60JlUu2X9gltQfJAdvQc8BzOCHljoh0=;
 b=jkJRbu2N8XXxwXiwqxv+sNPLRJ6FVmSHPaO+eEASWuPBZ3Lb4RJHu8mo
 8ZUa5gSzWERefPJyCtDptI+6EpYPjZ3KXiUtI8j3E/UsuTjaRI0B/3Oss
 1Fj+anzG94NHBxOFBZS8/KUfBK8uqMY5K4pnZL7i0SDkvSiRXxi0WU+P6
 j4fVzotLG3fh4H5f5WEg91095MIzoZ1ngZp8R/aWls9uMc58c4A1HUfNO
 dQbxkCz2iWmdaGzlxZ11GlqEByC+NBJzpkrS3mL4WbgecbtOyT8qLWz0u
 FHG5xpgKpXRsEASx6f1w1ye7sl10bIHdo6yFxNj4/e7V2wgBxmTrZfsDM A==;
X-CSE-ConnectionGUID: jZwYJhDtQ7GQ6ERP04C/oA==
X-CSE-MsgGUID: athdN8TeQZSj3ZyzRDVSsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="85011868"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="85011868"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 05:28:39 -0700
X-CSE-ConnectionGUID: P3jdPHTjQru/9H03QWjAPQ==
X-CSE-MsgGUID: +PXd2ZhxRyyn/B14l/qOJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="181201380"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa008.jf.intel.com with ESMTP; 11 Oct 2025 05:28:37 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe3LPD 3002 DMC v2.27
Date: Sat, 11 Oct 2025 17:58:35 +0530
Message-ID: <20251011122835.1040745-1-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.51.0
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

NOT TO BE REVIEWED/MERGED

Hardcode path to DMC firmware for CI purposes only.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 77a0199f9ea5..135e824b4426 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -127,6 +127,9 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define DISPLAY_VER13_DMC_MAX_FW_SIZE	0x20000
 #define DISPLAY_VER12_DMC_MAX_FW_SIZE	ICL_DMC_MAX_FW_SIZE
 
+#define XE3LPD_3002_DMC_PATH		"i915/xe3lpd_3002_dmc_ver2_27.bin"
+MODULE_FIRMWARE(XE3LPD_3002_DMC_PATH);
+
 #define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
 MODULE_FIRMWARE(XE3LPD_DMC_PATH);
 
@@ -183,9 +186,10 @@ static const char *dmc_firmware_default(struct intel_display *display, u32 *size
 {
 	const char *fw_path = NULL;
 	u32 max_fw_size = 0;
-
-	if (DISPLAY_VERx100(display) == 3002 ||
-	    DISPLAY_VERx100(display) == 3000) {
+	if (DISPLAY_VERx100(display) == 3002) {
+		fw_path = XE3LPD_3002_DMC_PATH;
+		max_fw_size = XE2LPD_DMC_MAX_FW_SIZE;
+	} else if (DISPLAY_VERx100(display) == 3000) {
 		fw_path = XE3LPD_DMC_PATH;
 		max_fw_size = XE2LPD_DMC_MAX_FW_SIZE;
 	} else if (DISPLAY_VERx100(display) == 2000) {
-- 
2.51.0

