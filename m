Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6B4CD128A
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 16:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E28E10F281;
	Mon,  1 Apr 2024 16:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KARv2r6P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A4C10F282
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 16:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711987562; x=1743523562;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R+2npuuRl8R3jqAY+Ew/8f1drFqqhEZq282pVJ/8IX4=;
 b=KARv2r6PyscHcXwvVWkT0u+aJDpMi3nuqUcVlV4p8kQ0jWX6+2qY1a06
 DmGbhP+VUfHP2IQDemWvyjxwL1bEE3KslZdtaMRFOpqGZoQOKWmjG7ySz
 M6ahr9pjJXMFsCrmd+byQydvV8TK/ga1do9vSPWgW+zQhf/mnLnvuQLQt
 SiKst/Ufn56HDTZTpV1beORzj2bcuqRryZds7RZQKutDXDVCB/l42yRYO
 rysaNzgictgXovu2dPK2lwFS2fukqvJ5w1tfBm4yMeHaz/EGBIUvmXn6R
 I4avlsp+7JgwQW46E9TjKmuQvjTJpatacZX8S1wwH4y5qQ4qM85aps3zG g==;
X-CSE-ConnectionGUID: pZznmIj6RFm1dJ2WOZgrDA==
X-CSE-MsgGUID: EGkX6O6SSUmq0XqxYC6jQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="32522332"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="32522332"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:05:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="22245563"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa003.fm.intel.com with ESMTP; 01 Apr 2024 09:05:33 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2] drm/xe/xe2: Add workaround 18033852989
Date: Mon,  1 Apr 2024 21:49:07 +0530
Message-Id: <20240401161907.3820563-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

This workaround applies to RCS engine's context, hence added as
LRC workaround.

v2
- Fix commit description as lrc workaround instead of engine.(Lucas)

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index d5b21f03beaa..9728d9da9931 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -98,6 +98,7 @@
 #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
 
 #define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
+#define   DISABLE_BOTTOM_CLIP_RECTANGLE_TEST	REG_BIT(14)
 
 #define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
 #define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 74b33a3845f2..c904e55ced9c 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -579,6 +579,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE), ENABLE_SEMAPHORE_POLL_BIT))
 	},
+	{ XE_RTP_NAME("18033852989"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
+	},
 
 	{}
 };
-- 
2.25.1

