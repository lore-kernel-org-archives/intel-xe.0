Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E882C021A9
	for <intel-xe@archiver.kernel.org>; Mon, 17 Feb 2025 14:46:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3796E10E325;
	Mon, 17 Feb 2025 14:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fqkgtnCX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94ABF10E325
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Feb 2025 14:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739803615; x=1771339615;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T1v4q53CPAKE/YFfO8kiC/R26bAbMLde6VFWjj+Hn+s=;
 b=fqkgtnCXrDUguoeCTdD1Bt3ph/T1yrLv4xW4xAeCytHm1yuQuYtMNJki
 stg9FLpMb7YCEAdHJI+jp+C4s4eDQ4wpQ2I7tVhaj+9yxyky7sDhlc86m
 6eEtXaUqWZE24zIrbe/l9XMPltFNEro1u+srUQdgsZxvcMHYuvTzvDuOB
 G2DANaoCUV1jQeFuPlECwGrgkxcJ12WByqg3E1CFll5h/GW0eBPR372l7
 813w//k3B64IYw1ZS8cpbHM8uppVrP5TRjXMvuVtinyJHAVUH6EVpvAw1
 ttehcGdfw0tLssNdQvaUuU01ndy69z/sBtyI+vy+UobMfbWOI4jSECFXH Q==;
X-CSE-ConnectionGUID: kavnnGtMRFu02hkv87lzWg==
X-CSE-MsgGUID: gBzA/NWNSVGlSPQck2iPsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="58015993"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="58015993"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 06:46:54 -0800
X-CSE-ConnectionGUID: lAdhuRzkRl66JszcMRuuGg==
X-CSE-MsgGUID: 2Y7eCIuwQV6CzlebdChssw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114614145"
Received: from inaky-mobl1.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.109.142])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 06:46:53 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe3LPD DMC v2.17
Date: Mon, 17 Feb 2025 11:46:38 -0300
Message-ID: <20250217144640.30606-1-gustavo.sousa@intel.com>
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
index fa6944e55d95..1d1c924d39b8 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -113,7 +113,7 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define DISPLAY_VER13_DMC_MAX_FW_SIZE	0x20000
 #define DISPLAY_VER12_DMC_MAX_FW_SIZE	ICL_DMC_MAX_FW_SIZE
 
-#define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
+#define XE3LPD_DMC_PATH			"i915/xe3lpd_dmc_ver2_17.bin"
 MODULE_FIRMWARE(XE3LPD_DMC_PATH);
 
 #define XE2LPD_DMC_PATH			DMC_PATH(xe2lpd)
-- 
2.48.1

