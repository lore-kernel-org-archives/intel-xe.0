Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA52D358D2
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 07:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C11810E7D8;
	Thu, 29 Jan 2026 07:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MhvAhbgS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C7410E7D8
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 07:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769671639; x=1801207639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IPW1W39qGnqSLG7kU7Q7fFG/bxAv1OXmqZBFe514jo0=;
 b=MhvAhbgSEyfMfBYblrVP5gb4QTMHY4uAunfeg9kDeYO410DChWAFb5nz
 oPuxilZwJbbqiolNSJtMO714dpaqLXnrfDP1lDpITTr8JyElPWPQyduCr
 c0BJT9wnXhpB3m/rWHF+/Jvk4CiKgOxyu1Sx0N6l+6O9FfgouYHeoI06Q
 hTUd8BqE9iGYXpvxSkayZl2Ej230UBNuXLgAI0mHV8H2yj7G6BSwtGEaX
 1UTSuY11F/AfPHG74wujJHcv0tkV8gY8ItWgdKD1lEueeQftM/7ivkkkF
 BjRIIev9fDVIK2bfycfmQZ5UC+Uj9pOvUSl4L2OyuGDxmYEZZ9uFFsHyQ A==;
X-CSE-ConnectionGUID: T/7Ra/CRSS6uLrywjmZxHQ==
X-CSE-MsgGUID: inhc6nIqRyO6SUAowD6+Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="93561865"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="93561865"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 23:27:19 -0800
X-CSE-ConnectionGUID: kLQm81f5QaG4AdFFmNjdOA==
X-CSE-MsgGUID: ITf4SjsOTKmuzAOymtuNuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="212579495"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 23:27:19 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 1/3] drm/xe: Enable Wa_14025515070
Date: Wed, 28 Jan 2026 23:26:59 -0800
Message-ID: <20260129072706.2587551-6-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260129072706.2587551-5-julia.filipchuk@intel.com>
References: <20260129072706.2587551-5-julia.filipchuk@intel.com>
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
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  6 ++++++
 3 files changed, 17 insertions(+)

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
index 5cd7fa6d2a5c..e0e5645384eb 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -69,6 +69,12 @@
 		MEDIA_VERSION(3002), FUNC(xe_rtp_match_psmi_enabled)
 16023683509	MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_psmi_enabled)
+14025515070	MEDIA_VERSION(1301)
+		MEDIA_VERSION(2000)
+		MEDIA_VERSION(3000)
+		MEDIA_VERSION(3002)
+		GRAPHICS_VERSION_RANGE(3000, 3001)
+		GRAPHICS_VERSION(3003)
 
 15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
 16026007364    MEDIA_VERSION(3000)
-- 
2.51.0

