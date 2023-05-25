Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DFFC77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 21:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3044410E777;
	Thu, 25 May 2023 21:35:08 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16E310E789
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 21:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685050480; x=1716586480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d4t/psP1aiE0IiZspZJ1TLN0h2sGrOfWyHamz/lEDuo=;
 b=GnS9/jMH/uSz+v3cpc6vdxMQAIW0GRWs4YCkWXs2uKDI3W4vOfiNBGcy
 pE0XZUfLQrooL8y5TX5I43YOFndJjZyCUWI0RUtB+OP790cvDUNtx3unr
 wIDotA3CmXZvgb3mzB+HZUt59zIJWJpzYv5NnIarlocwK1PbigZl7gFsZ
 DsEHIm8HcVnRhFpVwATh+IP6hrPD3Mbp20f+4Xc0gqoaOpXlaJBE4/VzA
 xQSzpHTLLGLO80nF+/RpOLHwun20RmeLLEJQGYqFGZGuqt4+NNA6s+GhW
 +5lh8l5UdPq8vRn5HmDwMdD2sL1WCKDhuG6z4XxNPVNdRz/n/cGFdOYmj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334377919"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="334377919"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="737970778"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="737970778"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 14:34:05 -0700
Message-Id: <20230525213407.3907094-20-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525213407.3907094-1-lucas.demarchi@intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 19/21] drm/xe/guc: Port Wa_1509372804 to xe_wa
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Port Wa_1509372804 to xe_wa so it's reported as active.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        | 3 +--
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index cc58a2092236..3ed460d3b6ca 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -168,8 +168,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
 		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
 
-	/* Wa_1509372804 */
-	if (IS_PLATFORM_STEP(xe, XE_PVC, STEP_B0, STEP_C0))
+	if (XE_WA(gt, 1509372804))
 		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
 
 	return flags;
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 05c821a50680..fc9846af460c 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -11,3 +11,4 @@
 16015675438	PLATFORM(PVC)
 		PLATFORM(DG2)
 18020744125	PLATFORM(PVC)
+1509372804	PLATFORM(PVC), GRAPHICS_STEP(B0, C0)
-- 
2.40.1

