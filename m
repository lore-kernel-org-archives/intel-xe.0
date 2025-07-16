Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0D6C83F37
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 20:55:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3A710E6BB;
	Wed, 16 Jul 2025 20:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZWz1HWQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D020110E68E
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 20:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752699356; x=1784235356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=67yAfFeLlw+frr5SpKjyE9Br/eaXhVO8Yc7Wd1/cfTI=;
 b=BZWz1HWQS7BQvUG4RCpAdZKOx0h58sbfDZEi2jh2oqwUeSXBKALtfmU0
 ysX67BgV50b84siAJST5+e6Qm49eUaQiTiZINLLFXXbWpgwqye4Q+NTSg
 /4MsEqZFfQYjAkyJCXgMC9sO64/klHD+7UFqNF3NHJC4rAO/BSENe1PK8
 h0opq6raRjiP3nhMw+NpS6O2kw/EHNrxWhs6hcOnoYRI41EvMx4gYi6pG
 wIkyfCxMmKC92sQlLecueCOZTWwfHtwvilB4lzf1X3Yg2LZamqArb++DJ
 d77dq4v+8C8pLypiDsZHRAUBaca1bBtsQmF+JUfHzCWHJLfR48lUgLjGA w==;
X-CSE-ConnectionGUID: wzqvsHAnRgy4u9N3/Wp57w==
X-CSE-MsgGUID: lfIiRnTQRFiVeq05RMGzQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58770468"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="58770468"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 13:55:55 -0700
X-CSE-ConnectionGUID: 4m94jl0CQpmAMGKnPjSfSg==
X-CSE-MsgGUID: /9Bc9GFeTrWmU342O1Rl3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="157686082"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 13:55:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH 3/4] drm/xe/psmi: Enable GuC Wa_14020001231
Date: Wed, 16 Jul 2025 13:55:46 -0700
Message-ID: <20250716-psmi-v1-3-674c13d7028e@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250716-psmi-v1-0-674c13d7028e@intel.com>
References: <20250716-psmi-v1-0-674c13d7028e@intel.com>
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

Enable GuC Wa_14020001231 to block psmi interrupts during C6 entry
exit flow.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 5 +++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 0366a9da59775..e52640d9ff8e8 100644
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
index 131cfc56be00a..fa5861a1e5d55 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -382,6 +382,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 					GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
 					&offset, &remain);
 
+	if (XE_WA(gt, 14020001231))
+		guc_waklv_enable_simple(ads,
+					GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT,
+					&offset, &remain);
+
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index e990f20eccfe3..91e717bba455f 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -66,6 +66,10 @@ no_media_l3	MEDIA_VERSION(3000)
 		MEDIA_VERSION_RANGE(1300, 3000)
 		MEDIA_VERSION(3002)
 		GRAPHICS_VERSION(3003)
+14020001231	GRAPHICS_VERSION_RANGE(2001,2004)
+		MEDIA_VERSION(2000)
+		MEDIA_VERSION(3000)
+		MEDIA_VERSION(3002)
 
 # SoC workaround - currently applies to all platforms with the following
 # primary GT GMDID

-- 
2.49.0

