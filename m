Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31377E8FDA7
	for <intel-xe@archiver.kernel.org>; Fri, 26 Dec 2025 17:05:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB28610E1F0;
	Fri, 26 Dec 2025 17:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h+YY98rw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A361310E1F0
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Dec 2025 17:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766768724; x=1798304724;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QB90J0efHXMEmq7srs6PefW2xuNVysFHBW4vQEe9TWI=;
 b=h+YY98rwNludPDfw0nPzlSdmibi4RoNLbeVDk0CEnhP6FlY995VYsNfR
 3G7RIXCr00hXQsFnafqBsgFdhzw1wgomuguKP2VYRWhWxE+DTGF91H9rr
 E+pkmPmhVOOOFXGhm6Dw+vGedrX2HII/KsLEE2a6HEpnseO9YmAypE+XQ
 bpn873f0pq21iRsg35YJ/w6Yf3cwKznhuLxsZzjqFhhdD8/HE9oQ9SCG5
 zYWUpyvJNd36qKM6mlwQYYGTU0KmmcABufht6T+NH7S2YI32ETRGrDdbK
 DH+SMYIJN7jHCsqUsBAIzn0Jl1vmfK8yXb7wL4mg7NIK9D3pclLjPaHIe g==;
X-CSE-ConnectionGUID: mI3DSPOETM2naU5X+zF6AQ==
X-CSE-MsgGUID: tK2gNj8AShiCq9kVM2cTyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="71100211"
X-IronPort-AV: E=Sophos;i="6.21,178,1763452800"; d="scan'208";a="71100211"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2025 09:05:23 -0800
X-CSE-ConnectionGUID: 7ncjvmoySV2noRsMTsXw3Q==
X-CSE-MsgGUID: IKgjChiLREOmVPeUvuxSUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,178,1763452800"; d="scan'208";a="200332225"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.124.220.241])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2025 09:05:21 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe3LPD_3002 DMC v2.28
Date: Fri, 26 Dec 2025 14:00:55 -0300
Message-ID: <20251226170510.73508-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.52.0
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

This failed to find the DMC blob in the previous 2 submissions ([1][2]), due to
some technical issues.  I just checked that CI should have the required blob
now, so hopefully now this one will find it!

[1] https://lore.kernel.org/intel-xe/20251224200401.47180-1-gustavo.sousa@intel.com/T/
[2] https://lore.kernel.org/intel-xe/20251226133354.21333-1-gustavo.sousa@intel.com/T/

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 2fb6fec6dc99..bb6d15ed75ae 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -130,7 +130,7 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define XE3P_LPD_DMC_PATH		DMC_PATH(xe3p_lpd)
 MODULE_FIRMWARE(XE3P_LPD_DMC_PATH);
 
-#define XE3LPD_3002_DMC_PATH		DMC_PATH(xe3lpd_3002)
+#define XE3LPD_3002_DMC_PATH		"i915/xe3lpd_3002_dmc_ver2_28.bin"
 MODULE_FIRMWARE(XE3LPD_3002_DMC_PATH);
 
 #define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
-- 
2.52.0

