Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69ED1CA0EC0
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 17:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C02D10E975;
	Fri,  8 Aug 2025 17:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3kp2YjI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE1010E965
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 17:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754674210; x=1786210210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1jTz5+2rm7jPV8QrMd4yy1DYoAByUkwdoNyFcTwPKVQ=;
 b=O3kp2YjIaHnsSTSGTnbb2ZE6P2Zx41SK08Dhtl4XZAFMqRp/GiImfUea
 w3Ghzs7b+LFu489cJigBex9vNFuZm8gogQbce3I//Tl4BUOCSBA0MX0tZ
 t9PsCgCQP7h42Zhru7/0c3zUEBOrnRzRzjmHgP6Tir+erl5+J8UaiaUbz
 oKBGHOamTEL2GBa0t5+e2rbOojRsi7EP6czrjHjoISlB8Me3/aRe04Iba
 YDQMSfOpKjkrLyL64bzBmq4wYLjseL+VujwbJMk7w5sW9PIieEJXXz+SZ
 cL/jo8/qdoIlzEVBf4UV5G8ewlqVwXLg10d0+COBaRUUur31KLhYL7tn+ A==;
X-CSE-ConnectionGUID: kw/K5Q2pTv2pQRJE6cG1ng==
X-CSE-MsgGUID: E6vyZnWqQ2SyttmZVXPN1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68109820"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68109820"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:09 -0700
X-CSE-ConnectionGUID: dVJ7I3MYTRmmLrb65NjBDw==
X-CSE-MsgGUID: nNppix0fSXGMQ6586u7y8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165387407"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com, Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH v3 04/13] drm/xe/psmi: Add Wa_14020001231
Date: Fri,  8 Aug 2025 10:29:47 -0700
Message-ID: <20250808-psmi-v3-4-a111e9f1e4b7@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-858c0
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
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2:
 - Enable only when PSMI is enabled
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
index 2ceaa197cb2f0..c42fc78798ca0 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -359,6 +359,10 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 				 GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG);
 	}
 
+	if (XE_WA(gt, 14020001231))
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

