Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1384DC531CB
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 08:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD89210E562;
	Thu, 23 Jul 2026 08:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U0vskroq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0720510E562
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 08:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784795600; x=1816331600;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=POQYS07SlsXZRWO+9pS8L6NA+2m+vtb2IVRkwuc1AYw=;
 b=U0vskroqd7mp5tE3AqwSVDbIgVBTFk/e6Na96VijOQOADt/+C9gq9g1+
 HARcTqnPZC5LqGEIdCa1yniY0ak/Fd31RoxElh2yL9GVD5AEdr8G0o7/Z
 dDEfUnHBOpEANxDAT0jy/OuCv8NvY26+d5wvyO7ce1jRM2IEkM4z+ctfi
 0XzFlNRAAXCf1uQthRlxrOIUvahH+PiPS6ahB4yBd/K02WSvqt0mXkzay
 AwsRpsuzzqnLlzhZyBWAp4shMfdUOI/s2uZJ0LbpJtZa3T//mVJ+4O3/B
 PsZ42L0Zv2QOUO4DYmHlqklMvIHBPSs0Kp06Yi+Bev1cj8q1H3Y0AUXNH Q==;
X-CSE-ConnectionGUID: 8K4VTPXlTnypO6yN1Ow4og==
X-CSE-MsgGUID: s3vbul4zTEGNlRNTIREugg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85489862"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="85489862"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 01:33:19 -0700
X-CSE-ConnectionGUID: 1dkUvPkRQzaSACpxTs8xzQ==
X-CSE-MsgGUID: WWRwGYPIRt+Ia2jcZqdOTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="263318449"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa005.fm.intel.com with ESMTP; 23 Jul 2026 01:33:18 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe3LPD DMC v2.37
Date: Thu, 23 Jul 2026 14:03:16 +0530
Message-ID: <20260723083316.1791184-1-dnyaneshwar.bhadane@intel.com>
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
index a191eee24..d67f563de 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -131,7 +131,7 @@ MODULE_FIRMWARE(XE3P_LPD_DMC_PATH);
 #define XE3LPD_3002_DMC_PATH		DMC_PATH(xe3lpd_3002)
 MODULE_FIRMWARE(XE3LPD_3002_DMC_PATH);
 
-#define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
+#define XE3LPD_DMC_PATH			"i915/xe3lpd_dmc_ver2_37.bin"
 MODULE_FIRMWARE(XE3LPD_DMC_PATH);
 
 #define XE2LPD_DMC_PATH			DMC_PATH(xe2lpd)
-- 
2.54.0

