Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51759EE6B6A
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 22:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1014210E958;
	Fri,  6 Feb 2026 22:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oIR62iDg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1292510E956
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 22:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770418596; x=1801954596;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/94l0u0ia9VklxBSa7fGY4V4/BwOMpzIRQlDFaoqyPs=;
 b=oIR62iDgr5kGJSAe4JF++ATusVttom4n5ALGhmNm90kDR3+2G0HDa2xd
 8EDjqX4fzqfiICscwZCe43ulJ4TO9Er8Dhpk6TjW7xnk8+aHcij9EyALj
 lnlLD6guz2FJRbHZ6hU+96cNvgH2oEoR3cCVP9Qa2HYDUiw90hHfqkKQ3
 LYrqNq+OhPQJvUlkKSD03+IKuYBKyGKL7MPxo3eJvkYYrMKX9s3YtmiNX
 2jRz3ABi8W3liP2IdP8CVevpep+M4pp3NHiBWpg85eNzMcvDEb4EK/tIv
 9WoROzTImQK7U2z3NrKscgRh3CLkvWdQyzbXILJosu3cs0s+9ocVF45WX g==;
X-CSE-ConnectionGUID: GhcTqchyTEmKP8n03nL4bA==
X-CSE-MsgGUID: 8SV1K8k7SGaGsBrTb7LgWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71351663"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="71351663"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 14:56:36 -0800
X-CSE-ConnectionGUID: NUk8ftRqSh+O2JjHIoC8qg==
X-CSE-MsgGUID: Vm9CqwF5RdSq6o/LRBwkDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="210762214"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 14:56:36 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v3 1/3] drm/xe: Enable Wa_14025515070
Date: Fri,  6 Feb 2026 14:55:22 -0800
Message-ID: <20260206225610.3232909-6-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260206225610.3232909-5-julia.filipchuk@intel.com>
References: <20260206225610.3232909-5-julia.filipchuk@intel.com>
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

Corrects a failure on context switch. On registration of context with
indirect ring state will correct state of targeted and idle command
streamers.

If Wa is unavailable, notify and disable indirect_ring_state.

Added additional XE_RTP_PASTE macros for expansion of longer rules.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 10 ++++++++++
 drivers/gpu/drm/xe/xe_rtp_helpers.h   |  4 ++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  7 +++++++
 4 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index e33bd622ab44..f0815500177b 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -496,6 +496,7 @@ enum xe_guc_klv_ids {
 	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
 	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
 	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
+	GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG			= 0x900e,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index f4cbc030f4c8..6a5863a54215 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -360,6 +360,16 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 	if (XE_GT_WA(gt, 14020001231))
 		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
 				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);
+	if (XE_GT_WA(gt, 14025515070)) {
+		if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 53))
+			guc_waklv_enable(ads, NULL, 0, &offset, &remain,
+					 GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG);
+		else {
+			/* Disable indirect_ring_state when workaround not available. */
+			gt->info.has_indirect_ring_state = 0;
+			xe_gt_notice(gt, "indirect ring state requires WA in GuC 70.53+\n");
+		}
+	}
 
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
index a33b0ae98bbc..e462a4d5ad69 100644
--- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
+++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
@@ -66,6 +66,10 @@
 #define XE_RTP_PASTE_10(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_9(prefix_, sep_, _XE_TUPLE_TAIL args_)
 #define XE_RTP_PASTE_11(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_10(prefix_, sep_, _XE_TUPLE_TAIL args_)
 #define XE_RTP_PASTE_12(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_11(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_13(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_12(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_14(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_13(prefix_, sep_, _XE_TUPLE_TAIL args_)
+
+
 
 /*
  * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a initializer
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 5cd7fa6d2a5c..3e677c911960 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -69,6 +69,13 @@
 		MEDIA_VERSION(3002), FUNC(xe_rtp_match_psmi_enabled)
 16023683509	MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_psmi_enabled)
+14025515070	GRAPHICS_VERSION(2004)
+		MEDIA_VERSION_RANGE(1301, 3000)
+		MEDIA_VERSION(3002)
+		GRAPHICS_VERSION_RANGE(3000, 3001)
+		GRAPHICS_VERSION_RANGE(3003, 3005)
+		MEDIA_VERSION(3500)
+		GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)
 
 15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
 16026007364    MEDIA_VERSION(3000)
-- 
2.51.0

