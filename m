Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F6CCCD185
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 18:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D7F10EC6B;
	Fri, 10 Oct 2025 18:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mN9d+RCg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6812F10EC6B
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 18:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760119314; x=1791655314;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sOt2miwXOfswK87v9UTiZIIPJgsO8o9giaBY2AuE8Ks=;
 b=mN9d+RCg+krxUTsA2dH1BS8DnTUVd63Vw82agFaR0JhezpRymEPiiZcm
 vj98lsWyNYQ8uUY9Rvfp5SbOb7rnDWmRYnw9pmM0Nt8D7dyvOxeppSelv
 rT7IySlAZxbCMSofeCWYCDtV4pIcKZS/Nt7oxxRmgnlXzloZOm0qLKSCD
 zKuyS6BP08jcmY6DnWksNG5PzNMyQjG/BPIhoGID/nVAGo0DSP0DoVJpP
 rWWO5m94ePNbYfsewkTNVmMy2BtB9VK93rZP1F7zlCaeGmrQy/6MKCrT8
 WH9+8e6Q5tqTYlErfFfc2K6vfJ5MtycjIqj1HjCfb6D9N5lwd+cDK1h1N Q==;
X-CSE-ConnectionGUID: WMyn3v4+Qpiu8PEqxdMDsQ==
X-CSE-MsgGUID: KGMKjoQ4SVybJOou1+obSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="84968068"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="84968068"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 11:01:54 -0700
X-CSE-ConnectionGUID: 3YblDyNERqu7E8tpb/nA2Q==
X-CSE-MsgGUID: fvdRxS3RRau+FdKogjpnzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="185058164"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.124.221.150])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 11:01:53 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe2LPD DMC v2.29
Date: Fri, 10 Oct 2025 15:01:26 -0300
Message-ID: <20251010180138.1032250-1-gustavo.sousa@intel.com>
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

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 517bebb0b4aa..32c7525df152 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -130,7 +130,7 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
 MODULE_FIRMWARE(XE3LPD_DMC_PATH);
 
-#define XE2LPD_DMC_PATH			DMC_PATH(xe2lpd)
+#define XE2LPD_DMC_PATH			"i915/xe2lpd_dmc_ver2_29.bin"
 MODULE_FIRMWARE(XE2LPD_DMC_PATH);
 
 #define BMG_DMC_PATH			DMC_PATH(bmg)
-- 
2.51.0

