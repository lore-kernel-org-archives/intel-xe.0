Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF03FCA0FE2
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 16:18:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7655B10E38F;
	Thu, 21 Aug 2025 16:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMApqq0q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C6F10E38D
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 16:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755793116; x=1787329116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gjoi8oH7n72sgC645eZHlAFnXckoNk1r+2hqI47In+M=;
 b=IMApqq0q1DPQUc0MvmI21QrMXm+OVvEYs2/an/eXIJeS2ZdXq5rYXM2E
 5qYBQQ/nGgSITC9NgntmDI6VdxiQ9Dovg+rkZTS1NO3iYOYA64OkKEkts
 pJWCpBAT2rmEotbkuxoPZjOFAZRpyoz7llXE16dxV2woyRnwrZ65F7Ak/
 BxLQvZPbp+iyfVwhwp5JgxJMFgfUPWwqSIv3NKGPyygLhBQ9hjgPGI3+V
 XMagEbQ/s/QGe2Fe34xsLJ6xlh8vXKlMOGZpWHhWzuum1RFww2I8kRhbj
 OVYYrGPNS5JW0itjJs9BRloSvevucxIx1aJNrwMP/7Lpk74WzFaxP8jkd w==;
X-CSE-ConnectionGUID: oSa5+4q8ThuDJAuTVTtutA==
X-CSE-MsgGUID: FAGBEvblRYK3tKG5bONUgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69527885"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="69527885"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:18:35 -0700
X-CSE-ConnectionGUID: 5sfQuvT2R1yyffUG/7icuw==
X-CSE-MsgGUID: +f6nIpkbRSSGErUxmR7qbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="199326711"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:18:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com, Badal Nilawar <badal.nilawar@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v5 04/12] drm/xe/psmi: Add Wa_14020001231
Date: Thu, 21 Aug 2025 09:17:59 -0700
Message-ID: <20250821-psmi-v5-4-34ab7550d3d8@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821-psmi-v5-0-34ab7550d3d8@intel.com>
References: <20250821-psmi-v5-0-34ab7550d3d8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

From: Badal Nilawar <badal.nilawar@intel.com>

Enable Wa 14020001231 to block psmi interrupts during C6 entry exit
flow. It's only enabled if PSMI is enabled in runtime.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2:
 - Enable only when PSMI is enabled
v3:
 - s/XE_WA/XE_GT_WA/ to follow rename
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 4 ++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 4 ++++
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 31dbfeee289e7..0e78351c6ef5a 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -390,6 +390,7 @@ enum  {
  */
 enum xe_guc_klv_ids {
 	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
+	GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT		= 0x9004,
 	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING				= 0x9005,
 	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE				= 0x9007,
 	GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE			= 0x9008,
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index d7da676370792..5631722f34f53 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -359,6 +359,10 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 				 GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG);
 	}
 
+	if (XE_GT_WA(gt, 14020001231))
+		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
+				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);
+
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 8d0aabab67773..303a5e05d9932 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -68,6 +68,10 @@ no_media_l3	MEDIA_VERSION(3000)
 		MEDIA_VERSION_RANGE(1300, 3000)
 		MEDIA_VERSION(3002)
 		GRAPHICS_VERSION(3003)
+14020001231	GRAPHICS_VERSION_RANGE(2001,2004), FUNC(xe_rtp_match_psmi_enabled)
+		MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
+		MEDIA_VERSION(3000), FUNC(xe_rtp_match_psmi_enabled)
+		MEDIA_VERSION(3002), FUNC(xe_rtp_match_psmi_enabled)
 
 # SoC workaround - currently applies to all platforms with the following
 # primary GT GMDID

-- 
2.50.1

