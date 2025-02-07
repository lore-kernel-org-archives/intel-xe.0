Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C46C02194
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 14:20:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4476010EB0E;
	Fri,  7 Feb 2025 14:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AhbpVke0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1DC10EB0E
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 14:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738938016; x=1770474016;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CM2F3N5EsTyIl1p1Dt3rwsiicXolscV5XpIwiGfLUSI=;
 b=AhbpVke0FPTgNpp9qgtwENXIyBpgkKIj1r1Yw8XGKBaOztYy4uddq5Jr
 rp+mMGGcV8t+s9QNUpV8j9+LH3MxQmnLFj3lShXlbRi6aNf1FK9dsXSNc
 lzVgX/YUeEKBiMJzjvf91WqS9k7LZ+LHcsJMRM3KgT+AVqQhtfnyH1KnX
 KDpid9vVVmWlQXQy2k3uaCuYG+u1mtYLhklhrrEhh3AnLPSBsm4mSGaW8
 cxp9vS0OTvAgCYfgULc/zZEjiQgOmkAlGWgz+ftXBZjDYPlEtP49smucG
 4Olq3Kf7cX/g9s0mUdrVpgSBmwMpEFWzLOScDZpC1CG9idqLPFFicP7SK Q==;
X-CSE-ConnectionGUID: 6JiSJK5bRrqXM3yLqoizIw==
X-CSE-MsgGUID: YaODXI/ySSSpx8+ySq9B9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43339597"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="43339597"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 06:20:16 -0800
X-CSE-ConnectionGUID: qeqdLd5bSra+wFDptUl/Eg==
X-CSE-MsgGUID: /7I7QEDtS6+BiKWuXK91lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="148745456"
Received: from puneetse-mobl.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.111.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 06:20:15 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe2LPD DMC v2.28
Date: Fri,  7 Feb 2025 11:19:45 -0300
Message-ID: <20250207141948.39894-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.48.1
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
index 221d3abda791..7cd702917619 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -116,7 +116,7 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
 MODULE_FIRMWARE(XE3LPD_DMC_PATH);
 
-#define XE2LPD_DMC_PATH			DMC_PATH(xe2lpd)
+#define XE2LPD_DMC_PATH			"i915/xe2lpd_dmc_ver2_28.bin"
 MODULE_FIRMWARE(XE2LPD_DMC_PATH);
 
 #define BMG_DMC_PATH			DMC_PATH(bmg)
-- 
2.48.1

