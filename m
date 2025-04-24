Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5F0C369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 16:14:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DED910E064;
	Thu, 24 Apr 2025 16:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PTjTnTLT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026BF10E064
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Apr 2025 16:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745511297; x=1777047297;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zlaHWrhvYriV502n0OWJXuAo06jJ6hPjbtAPOhH2s0c=;
 b=PTjTnTLTBFa7tFaMnvf+GXsIjwvvwwyLhfiFZprtQNr4qhZ+whoen6Yw
 30nvi5lumCqyJntf5EgzvJ8mXYQmROZVSkz+PmayYU7UK0gHT41FNW0U2
 P0K1eePxEF6XduZMIzE7thOCPf535gx0BFoj5I5qp6LR8BpBLqcrf4Dsb
 ZqGIu1fwHwiK2QftNEoXg4XryUHx+tjXejSrWMAhaEppWt3UGM7jKfZly
 T4Lk3wcqUfHWk1LxHi7ULbTewReBXS6VN7mvcnX+N/QrZ9u2/cu0UEgjf
 x09FIyPHgRxFjp+MscDrJmaxY2lG1s97bzp7BmG0Saedz9yK6pmFqUV/f g==;
X-CSE-ConnectionGUID: VOwgOWIRRVmjHbHam9nzKQ==
X-CSE-MsgGUID: AaOyWERaRbmbTz6InYDocA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="69645163"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="69645163"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 09:14:56 -0700
X-CSE-ConnectionGUID: F0nReNcmQVeW3oT6iaejvQ==
X-CSE-MsgGUID: /Uh1maIAQ/Oar93dObvg3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="169874904"
Received: from ldmartin-builder2.jf.intel.com ([10.165.21.143])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 09:14:56 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe3LPD DMC v2.23
Date: Thu, 24 Apr 2025 13:05:15 -0300
Message-ID: <20250424160521.1122988-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.43.0
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
index b58189d24..d0515f48f 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -119,7 +119,7 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define DISPLAY_VER13_DMC_MAX_FW_SIZE	0x20000
 #define DISPLAY_VER12_DMC_MAX_FW_SIZE	ICL_DMC_MAX_FW_SIZE
 
-#define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
+#define XE3LPD_DMC_PATH			"i915/xe3lpd_dmc_ver2_23.bin"
 MODULE_FIRMWARE(XE3LPD_DMC_PATH);
 
 #define XE2LPD_DMC_PATH			DMC_PATH(xe2lpd)
-- 
2.43.0

