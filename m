Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF3DF4BB65
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 17:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3279C10E5F9;
	Tue, 24 Feb 2026 17:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vp+C56my";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80FE10E5F9
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 17:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771955378; x=1803491378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rxJ3xBsjL0+bUl2H1o4LXiRN+5yd9IyUYG9WE77xc1Q=;
 b=Vp+C56myd0o16iK6fdK06n7Yw+zqvc1vWGcoTXvN/mbTP4ELrgKQDiFK
 jutRxcylVdZDHzQknqz6A6GV1iywMqBKF1vSwujk7FLYYzLTslappJUnx
 VnPfvLh0BRr7qq56DUopaq+0c2Byb/eo5M3lzgYRx6eYGPJxSLRFJ+cv2
 kzyj8+OycgcKvWGSHou7t2TCsHoL6G4EuStrWpmKtQnqRegMFYhteCOzZ
 /UzhZQIyGD61FxgwSU57sD5WVkeVYT2sdhejXZCzfaG0YxJ8IVa/zsIqq
 8JT+qxxnbzdZKLMd8ncqQ4w18xusqxz9pic3+x2ClK+EqyJDXZheiQSTr w==;
X-CSE-ConnectionGUID: MhVxklQ9TIi/iBFE/smtTQ==
X-CSE-MsgGUID: Lqzh7c+fR0mLKCEonVWvCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72855815"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="72855815"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 09:49:38 -0800
X-CSE-ConnectionGUID: a4GkBFOKTKqmn+JSKuryhw==
X-CSE-MsgGUID: rFI8pqg6T2e6qfdQL17U7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="253725376"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 09:49:38 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v7 1/1] drm/xe: Enable Wa_14025515070
Date: Tue, 24 Feb 2026 09:47:50 -0800
Message-ID: <20260224174918.616779-4-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260224174918.616779-3-julia.filipchuk@intel.com>
References: <20260224174918.616779-3-julia.filipchuk@intel.com>
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

This Wa requires GuC 70.53+ (uapi 1.26+).  If indirect_ring_state is
enabled and Wa is unavailable, notify and disable indirect_ring_state.

Added additional XE_RTP_PASTE macros for expansion of longer rules.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc.c           | 8 ++++++++
 drivers/gpu/drm/xe/xe_guc_ads.c       | 3 +++
 drivers/gpu/drm/xe/xe_rtp_helpers.h   | 2 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 7 +++++++
 5 files changed, 21 insertions(+)

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
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 54d2fc780127..0c14e321bd67 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -777,6 +777,14 @@ int xe_guc_init(struct xe_guc *guc)
 	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 14, 0))
 		xe->info.has_page_reclaim_hw_assist = false;
 
+	/* Disable indirect_ring_state if missing GuC 70.53+ WA 14025515070. */
+	if (gt->info.has_indirect_ring_state
+	    && XE_GT_WA(gt, 14025515070)
+	    && GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 26, 0)) {
+		gt->info.has_indirect_ring_state = 0;
+		xe_gt_notice(gt, "indirect ring state requires WA in GuC submit ver 1.26+\n");
+	}
+
 	if (IS_SRIOV_VF(xe)) {
 		ret = devm_add_action_or_reset(xe->drm.dev, vf_guc_fini_hw, guc);
 		if (ret)
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index f4cbc030f4c8..d737be03aaed 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -360,6 +360,9 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 	if (XE_GT_WA(gt, 14020001231))
 		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
 				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);
+	if (XE_GT_WA(gt, 14025515070) && GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 53))
+		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
+				 GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG);
 
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
index a33b0ae98bbc..86eee60c04a1 100644
--- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
+++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
@@ -66,6 +66,8 @@
 #define XE_RTP_PASTE_10(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_9(prefix_, sep_, _XE_TUPLE_TAIL args_)
 #define XE_RTP_PASTE_11(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_10(prefix_, sep_, _XE_TUPLE_TAIL args_)
 #define XE_RTP_PASTE_12(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_11(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_13(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_12(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_14(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_13(prefix_, sep_, _XE_TUPLE_TAIL args_)
 
 /*
  * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a initializer
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 80b54b195f20..f8a185103b80 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -51,6 +51,13 @@
 		MEDIA_VERSION_RANGE(2000, 3002), FUNC(xe_rtp_match_psmi_enabled)
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

