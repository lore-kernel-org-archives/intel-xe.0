Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B06C44524
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 08:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF1210E562;
	Thu, 23 Jul 2026 08:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dmxnsuep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53CB10E562
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 08:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784795653; x=1816331653;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CGo0SRn2Z4doMz0rZi2WAU10J3/uyG1RoiAhO332McA=;
 b=DmxnsuepfkiXeqxyVnMekXcCqn5fIuFnwpC3R6FDK8YwN5vDPk8QEtQL
 kREvBqFdl3d1E72pPLhfHJ7qFPxYXyixSj0mvFBZX45jxonIy36hQEkXc
 TH4vMs4ByD8BJsYMAOrBQ/5i40y5yF/AYSvODrM3Q2+N5mYhuGEGXUfCT
 54y7JKLveQi8/LzezpbCRLq8zKNvsZeUIkVAGKnK7xZffglFKf7snDEGC
 0723B+B77Xc+wKemqCsxgHNjvjg6XmTeX3HbLPEEIcoXHl7UFs0HZQhsd
 sgtZZaoz7vukxb/GwM+uqIgyGg80NGnPxTUbB2H0YQujQGqY4Py21EmJ1 g==;
X-CSE-ConnectionGUID: W0BsK6yXTXaN3WKpxeJLbw==
X-CSE-MsgGUID: m3CKsy2/S4qvl5X1wxxXDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96101502"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="96101502"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 01:34:12 -0700
X-CSE-ConnectionGUID: CAVZ0MgbTXWKvQoysa/3/w==
X-CSE-MsgGUID: N9DtT0EETL+xDL8U4YJWhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="259034491"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa009.jf.intel.com with ESMTP; 23 Jul 2026 01:34:12 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe3LPD_3002 DMC v2.32
Date: Thu, 23 Jul 2026 14:04:08 +0530
Message-ID: <20260723083408.1791364-1-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
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
 drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index a191eee24..ac2395993 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -128,7 +128,7 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define XE3P_LPD_DMC_PATH		DMC_PATH(xe3p_lpd)
 MODULE_FIRMWARE(XE3P_LPD_DMC_PATH);
 
-#define XE3LPD_3002_DMC_PATH		DMC_PATH(xe3lpd_3002)
+#define XE3LPD_3002_DMC_PATH		"i915/xe3lpd_3002_dmc_ver2_32.bin"
 MODULE_FIRMWARE(XE3LPD_3002_DMC_PATH);
 
 #define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
-- 
2.54.0

