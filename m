Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8E3E6BF3B
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 21:01:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00E010E95C;
	Fri, 30 Jan 2026 21:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fXNnJTBA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C3510E956
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 21:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769806899; x=1801342899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lHB3TZeNlmnfVdIvEiN5ae3YjfhP1OT4UlPG2JOujAo=;
 b=fXNnJTBAdyeaXt8E+XgImhkSYei+0oierivXS4KcMbanCRmJ4pJPe00M
 DDikvwLduwrqnTcoTrCFEWpbYc0Gn/ZGP3n4rxZ9U+vVmSzCgIfmx/ivC
 FXUCXX0IwkB+XAwSDQ931JZd+q/QbyBEwCW3agtApDmK5yFBCvX4HzBVw
 Ul1jmcJBDPU2kY5ZfsPqmOl3cmvncf6Y+8gznRnP7/DNsAZDBQy+notoN
 BcRTtrc2JYrrU8qNejOyWRwkpn5GARaQObdDZNztKnNAb0+d8wudIqaNU
 6qLOmXB5LOPwZzGMSHVAnUMOwXSTyIddk8SqY1mQ6jYAKesKXFal/ttzF Q==;
X-CSE-ConnectionGUID: joKqizwST1CCXUhpDjpUNg==
X-CSE-MsgGUID: NwLLEwHTSEuzx5S7MghQnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71041364"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="71041364"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 13:01:39 -0800
X-CSE-ConnectionGUID: SapuCEK9TSWA514PxbSePw==
X-CSE-MsgGUID: HDel96ydSQyi4JzDBH8TUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="208064941"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 13:01:38 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 1/3] drm/xe: Enable Wa_14025515070
Date: Fri, 30 Jan 2026 12:50:33 -0800
Message-ID: <20260130210120.2682085-6-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130210120.2682085-5-julia.filipchuk@intel.com>
References: <20260130210120.2682085-5-julia.filipchuk@intel.com>
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

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 10 ++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  5 +++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index e33bd622ab44..69e6d9f9650c 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -496,6 +496,7 @@ enum xe_guc_klv_ids {
 	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
 	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
 	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
+	GUC_WA_KLV_CLEAR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CONTEXT_REGISTRATION		= 0x900e,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index f4cbc030f4c8..1c563a01c12c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -360,6 +360,16 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 	if (XE_GT_WA(gt, 14020001231))
 		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
 				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);
+	if (XE_GT_WA(gt, 14025515070)) {
+		if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 53))
+			guc_waklv_enable(ads, NULL, 0, &offset, &remain,
+					 GUC_WA_KLV_CLEAR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CONTEXT_REGISTRATION);
+		else {
+			/* Disable indirect_ring_state when workaround not available. */
+			gt->info.has_indirect_ring_state = 0;
+			xe_gt_notice(gt, "indirect ring state requires workaround present in GuC firmware v70.53.+\n");
+		}
+	}
 
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 5cd7fa6d2a5c..1da3a8f96f98 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -69,6 +69,11 @@
 		MEDIA_VERSION(3002), FUNC(xe_rtp_match_psmi_enabled)
 16023683509	MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_psmi_enabled)
+14025515070	GRAPHICS_VERSION(2004)
+		MEDIA_VERSION_RANGE(1301, 3000)
+		MEDIA_VERSION(3002)
+		GRAPHICS_VERSION_RANGE(3000, 3001)
+		GRAPHICS_VERSION(3003)
 
 15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
 16026007364    MEDIA_VERSION(3000)
-- 
2.51.0

