Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B04C87FC5
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 01:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF17610E86C;
	Thu, 24 Jul 2025 01:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9JVSwBR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4422410E1A9
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 01:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753319083; x=1784855083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fuuZDV4OpAIkvuC6iEdN6fcjAKeLh0ZRnw79hDBX0ig=;
 b=E9JVSwBRmrFWSteS0VxzMMdBaT84zTRuOqZBrsDNiwZCwK7KZJZ/co5E
 pueHsoUufKriZG9xrQkNNX2ZIxqnojV9ooEgjlEFIf1Kcw4dPftYyW20x
 O+VD4P9HA6gY45XoLLPy+tynYZiT7NbuU/6EnMKsWlIGUw7zvcQ/fSxiP
 gimj4PdSFsPQLoeQDPSlAsBPFBoRW3TPSmS8g54g7JJ0JiEk3BwnM8/CT
 n6ix8/mwbBv9LJAMPAJI5kfbeuuY4FeN8hDxlBECr5Kbt6CUU2bCChugc
 anxkV0FFHXV9Kc5D8XbgXSH+lO7QSUdUF15PPY6dP4mXkNIh54yMRIxD2 A==;
X-CSE-ConnectionGUID: T07mfVIEQuuszLnkjnVC5Q==
X-CSE-MsgGUID: A+TuXWUXTNGc2tgot0LWpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55766484"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="55766484"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 18:04:43 -0700
X-CSE-ConnectionGUID: CFZezMGiR023W5nOvLCiJg==
X-CSE-MsgGUID: +MD48B07SdCkb4EEq9PV2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="160106407"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 18:04:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH v2 4/7] drm/xe/psmi: Add Wa_14020001231
Date: Wed, 23 Jul 2025 18:04:25 -0700
Message-ID: <20250723-psmi-v2-4-84a04b5a3c04@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723-psmi-v2-0-84a04b5a3c04@intel.com>
References: <20250723-psmi-v2-0-84a04b5a3c04@intel.com>
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
index e990f20eccfe3..ba58fa0ed8fcf 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -66,6 +66,10 @@ no_media_l3	MEDIA_VERSION(3000)
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

