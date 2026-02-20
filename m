Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF00CC5ACD9
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:02:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD28E10E818;
	Fri, 20 Feb 2026 17:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QoYTOIiD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8369E10E818
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771606921; x=1803142921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FxGeGjkD4U9y03dd1a8Gpuk28Ic//0GM15AdYiT0qQ8=;
 b=QoYTOIiDXYbJIToSmIj2Hd++q/grEWFhgRxGYbOASQhtK9wZnNSGTFVm
 tADK9kml409UaYj5vmGGMKNLhdQ5ak0PxYLunvFJYrKsj8DUz4IshFcEl
 tHghGdOUsRGPCzqmpYCB8FSWMLOgWgDK0TeG1rczwh4XTRboEFnfvKDio
 lQ4yMuZ226cpnpJNhuGHZwhNnyBODA8hsevy34ff42aYsBfHStYV0N7kO
 75t2bG+wxMgxVDfDScj798UbE1WlN4EOjI8JJ5FStwgUIba3iAvmXUaC7
 3j6XluPCKbQdB1D3KX2gVc9+yeiqeuM6ozMy4PAdMHaZqQ9j9Fy6fP6lG Q==;
X-CSE-ConnectionGUID: /Aeoons/TBKhTnqp06QkTA==
X-CSE-MsgGUID: FFPPhi+UTLa9OoWvn/IlcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="98163628"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="98163628"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:02:01 -0800
X-CSE-ConnectionGUID: i1nkCt5ZSoK9vByskDQk1Q==
X-CSE-MsgGUID: q3IEEjaYQYC3K4yuplOBcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="237860815"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:02:01 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v6 1/3] drm/xe: Enable Wa_14025515070
Date: Fri, 20 Feb 2026 09:01:37 -0800
Message-ID: <20260220170137.328131-6-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260220170137.328131-5-julia.filipchuk@intel.com>
References: <20260220170137.328131-5-julia.filipchuk@intel.com>
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

This Wa requires GuC 70.53+ (uapi 1.26+).  If Wa is unavailable, notify
and disable indirect_ring_state.

Added additional XE_RTP_PASTE macros for expansion of longer rules.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc.c           | 6 ++++++
 drivers/gpu/drm/xe/xe_guc_ads.c       | 3 +++
 drivers/gpu/drm/xe/xe_rtp_helpers.h   | 2 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 7 +++++++
 5 files changed, 19 insertions(+)

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
index cbbb4d665b8f..a595a7a5c534 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -780,6 +780,12 @@ int xe_guc_init(struct xe_guc *guc)
 	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 14, 0))
 		xe->info.has_page_reclaim_hw_assist = false;
 
+	/* Disable indirect_ring_state if missing GuC 70.53+ WA 14025515070. */
+	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 26, 0)) {
+		gt->info.has_indirect_ring_state = 0;
+		xe_gt_notice(gt, "indirect ring state requires WA in GuC 70.53+\n");
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
index ac08f94f90a1..b5e9cab34da7 100644
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

