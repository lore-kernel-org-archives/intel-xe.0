Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3751BCA0EE4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 17:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5CC10E4C0;
	Mon, 18 Aug 2025 17:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gRsIES8S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC1410E4B4
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 17:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755538704; x=1787074704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lSyJ66GP7tSZqSs7oGrKadyEG/x6l8NICDuVqDC56Rg=;
 b=gRsIES8Sd4PK+YUXaltIhmfceLgJToxmIGtKsPidNtr7qDpSVXKPqxyA
 xIA0Jg2TaS4Xs9zen28kfedxZ6/hqQpVPqcpv6v4O3OcI0aguS7UzmCWX
 kERHHc6IIjppJcJ9QztQ7uzgjLrwdEBVP/3dMIb+a1ItCtR9/cHdJTxJC
 ngiEUVbgsFs15Mh7NZkbX4pALRyCjkRTVM2PeAYOBEwt9tO0q1uVugH0W
 6eutyFuFJ50YsQLUG/KXzu0AYSkMFmWApsG/m4MRmKtHYTs3LdZrSMdm9
 +LwgsSZMLX8XtN6F98MQou887eaTQWu2q92uUMdWBijPBGu0+1rMRt3Yv w==;
X-CSE-ConnectionGUID: klFv1ub/T3+xnyUlSKnVTw==
X-CSE-MsgGUID: VOehPLzcRKKu3YL2XeXhgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57918650"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57918650"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:38:24 -0700
X-CSE-ConnectionGUID: +eH1csNxTmyIXn7bog5q8w==
X-CSE-MsgGUID: 8LlmUwS1SJOBbzP2OxcHhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="172838869"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:38:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com, Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH v4 04/13] drm/xe/psmi: Add Wa_14020001231
Date: Mon, 18 Aug 2025 10:37:29 -0700
Message-ID: <20250818-psmi-v4-4-a330783ce1c0@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818-psmi-v4-0-a330783ce1c0@intel.com>
References: <20250818-psmi-v4-0-a330783ce1c0@intel.com>
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

