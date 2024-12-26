Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E429CE77188
	for <intel-xe@archiver.kernel.org>; Thu, 26 Dec 2024 21:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E6310E173;
	Thu, 26 Dec 2024 21:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhmtkjF+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE96A10E173
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Dec 2024 21:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735248300; x=1766784300;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eeWowpQf53Mj+gOvDDKT273/sx0UKFg3H+lBVO4igk4=;
 b=BhmtkjF+7AbdOWJB5NoKm4HdvidpHF7ZO68Hi1QhxNJgSUAb+A+XFcRL
 mwyHSckWgsbLPO0hCHqpZwTK7bGxbCBdNWifmbrHXhnChjJlou2vySwtE
 fJk3FvN4JJ9g+vSmmFS7ImX3XrqCoa1BHwT1Y3eXhJr2YHhFZ2J7dxL8p
 beMCow+X5a8At/TiizpD0149oek+mLMXqqyPMRWx5b2kolmUpwgQS0CWz
 IfShAjPQ9pQr972um2sz5HXAH9XR6no6xXIFNnGKXcK7+YnBAYjDfj3+8
 qE9PyEvCOAorvXJTRAwGcP8XOrEuelUnkQ+5KuSt7ey8aKNBKMDzWDu+8 Q==;
X-CSE-ConnectionGUID: rB+hxumcRaqWwrU5NPt6BA==
X-CSE-MsgGUID: XPlXf5UzST2H+FEA4f1Mqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="35547361"
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; d="scan'208";a="35547361"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2024 13:24:56 -0800
X-CSE-ConnectionGUID: 83AezAGUR3uvq4wgHXjamg==
X-CSE-MsgGUID: cpbUYk20Q1KW3ZkNjrUQMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; d="scan'208";a="100198490"
Received: from dwoodwor-mobl2.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.109.45])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2024 13:24:36 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe2LPD DMC v2.27
Date: Thu, 26 Dec 2024 18:24:22 -0300
Message-ID: <20241226212424.74544-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.47.1
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
index 221d3abda791..7a20ac9640d6 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -116,7 +116,7 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
 MODULE_FIRMWARE(XE3LPD_DMC_PATH);
 
-#define XE2LPD_DMC_PATH			DMC_PATH(xe2lpd)
+#define XE2LPD_DMC_PATH			"i915/xe2lpd_dmc_ver2_27.bin"
 MODULE_FIRMWARE(XE2LPD_DMC_PATH);
 
 #define BMG_DMC_PATH			DMC_PATH(bmg)
-- 
2.47.1

