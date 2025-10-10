Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECA5CCD185
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 18:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84DAC10EC6C;
	Fri, 10 Oct 2025 18:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvV9sT3v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F7010EC6B
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 18:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760119373; x=1791655373;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1b5xFTXI32frQL7nDT53O7BeXqYE4KrhZd1i16Z582c=;
 b=fvV9sT3vyGOitbpHvBsdsW7pF1ulifHqqyb6NJQorRJTTiXZvrEjza7G
 /Ipwbrrr9l71CvozPMiOKvi5Z6Jcxy/2NPuwYlpat5QfZBVR9jTDN1zFl
 n13f5764MV2OUe1i/CYW6dnriDrKWMktjeq3TwLeraGWyv9vubjpTARXv
 kwKgqX8CqUwxbqJvaoeGpjgqBhw8mUd6u0qLsLqO9S109sSQG+t78OhKR
 5kSbMBVZS8VZUbfaakTSQUJjr5VTHBv7FUQHARU6C4tQzxK86T8aTTf9c
 xWcQSA7v8UlgBNQEjYCxJXMUJPKkvaidIyXpdY6jbUisOjZ9i47g/i0Xd A==;
X-CSE-ConnectionGUID: Alf8nZluTf2uEzacYZhIrw==
X-CSE-MsgGUID: yKo7svSJTuq/bHflaOok7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62045774"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="62045774"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 11:02:53 -0700
X-CSE-ConnectionGUID: rCRcVIvIRI+BN84Kzmsdtw==
X-CSE-MsgGUID: X1vZkn48RXWHZOizg1U0mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="185419776"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.124.221.150])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 11:02:52 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe3LPD DMC v2.32
Date: Fri, 10 Oct 2025 15:02:36 -0300
Message-ID: <20251010180240.1032699-1-gustavo.sousa@intel.com>
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
index 517bebb0b4aa..16ddb64ff7f4 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -127,7 +127,7 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define DISPLAY_VER13_DMC_MAX_FW_SIZE	0x20000
 #define DISPLAY_VER12_DMC_MAX_FW_SIZE	ICL_DMC_MAX_FW_SIZE
 
-#define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
+#define XE3LPD_DMC_PATH			"i915/xe3lpd_dmc_ver2_32.bin"
 MODULE_FIRMWARE(XE3LPD_DMC_PATH);
 
 #define XE2LPD_DMC_PATH			DMC_PATH(xe2lpd)
-- 
2.51.0

