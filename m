Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A942CD4F3C
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 15:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC1D10E37D;
	Tue, 19 May 2026 15:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NiejNta5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5A010E37D
 for <intel-xe@lists.freedesktop.org>; Tue, 19 May 2026 15:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779205274; x=1810741274;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e0OjYY71126eBJ+X5jF6n0M0q3/NNULHjzxawUFGC7A=;
 b=NiejNta54s3b/89oTCSZWWqdT2omCX+6AAsF2O+yWETUSl2faq6uApI0
 BdgvcuXJ7Km7Ufwl86d3uCs1XIGvpCIomPZtd/ZonYYiNJSZRVm4B9/CV
 y9OHQ1pFG0Sbgqjan700OvoaUlvoOHhI8w+M63jA61UYDxwsO1orAPebm
 8Tt1Cmf5t1BTn1Re3IToOn4zp2T+4UMKkNX5p+uQcmx04SXSgdSIkJ7RC
 fkmC7ApDMVzVyY5V0B4pKShMEDsJ6h1dTAb2H9R4kqhW1UkQeiC5OzBXx
 se1DQbdWAU4G1NfS2aXa0KPIFTGamT3dNYvqxk55h2ckhhv4tUWLbD1aC g==;
X-CSE-ConnectionGUID: XGeLfe6mSMWefp0C8xF+yw==
X-CSE-MsgGUID: 8vsCcCCwRF+SUI0c3ZRscg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79939001"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="79939001"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 08:41:14 -0700
X-CSE-ConnectionGUID: vEI3gM6fTZie002A2dqqnA==
X-CSE-MsgGUID: 68rcuMxdSa6WBV23mRkI9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="239656503"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa008.jf.intel.com with ESMTP; 19 May 2026 08:41:13 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe3LPD DMC v2.35
Date: Tue, 19 May 2026 21:11:09 +0530
Message-ID: <20260519154109.1382415-1-dnyaneshwar.bhadane@intel.com>
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
index 481fb65b7..a02252d2d 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -131,7 +131,7 @@ MODULE_FIRMWARE(XE3P_LPD_DMC_PATH);
 #define XE3LPD_3002_DMC_PATH		DMC_PATH(xe3lpd_3002)
 MODULE_FIRMWARE(XE3LPD_3002_DMC_PATH);
 
-#define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
+#define XE3LPD_DMC_PATH			"i915/xe3lpd_dmc_ver2_35.bin"
 MODULE_FIRMWARE(XE3LPD_DMC_PATH);
 
 #define XE2LPD_DMC_PATH			DMC_PATH(xe2lpd)
-- 
2.54.0

