Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDECC982EA
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 02:20:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A7810E0B4;
	Mon, 21 Sep 2026 02:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6onEgoM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2110D10E046;
 Mon, 21 Sep 2026 02:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789957232; x=1821493232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/qSmphXfY64fijTBbJHR9b8ohHvxWThwweQt/8YjHdM=;
 b=K6onEgoMLjkV3N1Y2XC2eBPDRjpTZ8xJvIQylvouqDkc87IIaA7+BEsv
 XVafmFGNC6Esx1ta5T16fXZQWG1DeUeuKIG2tS6cNuPX7pHMvysjQ39Bl
 HtpCBzm6esP2vi8KhsHco2DSsWWR5aZdRpDE4QPh4UJrIQsetZoXbECSv
 joK3JHGBgjm43G/5LDtm1tOKjba04foCWIxRMLt0ysbXRx3jJ6YdhcDKc
 vPuOyx2H+9moGPIKWN/ThtT60cO/6Vbjjer3BTU01BVr01T+xaDI1j2mI
 8jaLTCAm0NHtIFy/dbaF9iPMB7NZ97bi6j/zCqdV1aULUvPAfYLBEyili A==;
X-CSE-ConnectionGUID: GmMrO/nrTY+F9lIA85Q2Ag==
X-CSE-MsgGUID: 4kXy0J1CREiNtLyYip0izw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="107950112"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
 d="scan'208,223";a="107950112"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2026 19:20:32 -0700
X-CSE-ConnectionGUID: jVdnqF+PSLWHjpbJyv358A==
X-CSE-MsgGUID: RsQ6yhEkTAWDfvOqo9UPHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
 d="scan'208,223";a="271582611"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa010.fm.intel.com with ESMTP; 20 Sep 2026 19:20:29 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Ramanaidu Naladala <ramanaidu.naladala@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH] drm/i915/xe3plpd: Map AUX power domains to DC_off
Date: Mon, 21 Sep 2026 07:50:17 +0530
Message-Id: <20260921022016.1525322-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918060426.1162123-1-suraj.kandpal@intel.com>
References: <20260918060426.1162123-1-suraj.kandpal@intel.com>
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

From Xe2Lpd we removed the step to disable DC5/6 because as per Bspec
for SNPS PHY Aux will be always up. But from Xe3p LT PHY was introduced
which powers down the PHY. Which means we need to make sure
"Disable DC5/6" of AUX Programming sequence is honored.
Add the AUX power domains to the DC_off power well on Xe3p_LPD+, so that
DC5/6 stays disabled for as long as an AUX power domain is held.

Bspec: 68851, 68967
Suggested-by: Imre Deak <imre.deak@intel.com>
Co-developed-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
Signed-off-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 .../i915/display/intel_display_power_map.c    | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power_map.c b/drivers/gpu/drm/i915/display/intel_display_power_map.c
index 3400080d78d2..e18eb49983fe 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_map.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_map.c
@@ -1759,6 +1759,44 @@ static const struct i915_power_well_desc_list wcl_power_wells[] = {
 	I915_PW_DESCRIPTORS(wcl_power_wells_aux),
 };
 
+I915_DECL_PW_DOMAINS(xe3plpd_pwdoms_dc_off,
+	POWER_DOMAIN_DC_OFF,
+	XE3LPD_PW_2_POWER_DOMAINS,
+	XE3LPD_PW_C_POWER_DOMAINS,
+	XE3LPD_PW_D_POWER_DOMAINS,
+	POWER_DOMAIN_AUDIO_MMIO,
+	POWER_DOMAIN_AUDIO_PLAYBACK,
+	POWER_DOMAIN_AUX_A,
+	POWER_DOMAIN_AUX_B,
+	POWER_DOMAIN_AUX_USBC1,
+	POWER_DOMAIN_AUX_USBC2,
+	POWER_DOMAIN_AUX_USBC3,
+	POWER_DOMAIN_AUX_USBC4,
+	POWER_DOMAIN_AUX_TBT1,
+	POWER_DOMAIN_AUX_TBT2,
+	POWER_DOMAIN_AUX_TBT3,
+	POWER_DOMAIN_AUX_TBT4,
+	POWER_DOMAIN_INIT);
+
+static const struct i915_power_well_desc xe3plpd_power_wells_dcoff[] = {
+	{
+		.instances = &I915_PW_INSTANCES(
+			I915_PW("DC_off", &xe3plpd_pwdoms_dc_off,
+				.id = SKL_DISP_DC_OFF),
+		),
+		.ops = &gen9_dc_off_power_well_ops,
+	},
+};
+
+static const struct i915_power_well_desc_list xe3plpd_power_wells[] = {
+	I915_PW_DESCRIPTORS(i9xx_power_wells_always_on),
+	I915_PW_DESCRIPTORS(icl_power_wells_pw_1),
+	I915_PW_DESCRIPTORS(xe3plpd_power_wells_dcoff),
+	I915_PW_DESCRIPTORS(xe3lpd_power_wells_main),
+	I915_PW_DESCRIPTORS(xe2lpd_power_wells_pica),
+	I915_PW_DESCRIPTORS(xelpdp_power_wells_aux),
+};
+
 static void init_power_well_domains(const struct i915_power_well_instance *inst,
 				    struct i915_power_well *power_well)
 {
@@ -1865,7 +1903,9 @@ int intel_display_power_map_init(struct i915_power_domains *power_domains)
 		return 0;
 	}
 
-	if (DISPLAY_VERx100(display) == 3002)
+	if (DISPLAY_VER(display) >= 35)
+		return set_power_wells(power_domains, xe3plpd_power_wells);
+	else if (DISPLAY_VERx100(display) == 3002)
 		return set_power_wells(power_domains, wcl_power_wells);
 	else if (DISPLAY_VER(display) >= 30)
 		return set_power_wells(power_domains, xe3lpd_power_wells);
-- 
2.34.1

