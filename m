Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AEBC7EE2C
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 21:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46ADD10E780;
	Thu, 25 May 2023 21:35:08 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F7210E788
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 21:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685050480; x=1716586480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yZIBGK08OfvFERA+TYEzWIBK8tXIXDM4xxjE4lwxD7Y=;
 b=DpQWJWqxUwMILIYbmrjjxVlWzT9y72dry8lCPIE6+TO2fop67QDqLKLD
 3rX2DZWc9WXSs/4TymddtcZPiMC7RHVV5i51hia31FIt8IOFfpkF/4NtB
 2wQI6WVINKZDA5CC00C0ghNUlEeexE1NJJQECnki5DNmv/Q/6zi4poQE3
 cWI8a/cfObXiG2YVHP4jrME+lmnjy8QXunNaOh1Q1cP8hE9yYb5RoVEOB
 z+gkQ0EwZhhqk5FnOwCyAB+q0cnIpNDnYowx4qZy1tYRKFgyDvH13l1Fg
 PUjLwTMb2YRi1jB4V6jFxtHEW+Zv8OLQtpgAWmK1nw+6lEfgc2+bGzwhJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334377918"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="334377918"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="737970775"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="737970775"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 14:34:04 -0700
Message-Id: <20230525213407.3907094-19-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525213407.3907094-1-lucas.demarchi@intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 18/21] drm/xe/guc: Port
 Wa_16015675438/Wa_18020744125 to xe_wa
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

Wa_16015675438 and Wa_18020744125 apply to DG2 using the same action and
conditions. Add both to the oob rules so they are both reported as
active. Note that previously they were not checking by platform or IP
version, hence making them not future-proof.  Those workarounds should
only be active in PVC and DG2, besides the check for "no render engine".

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        | 4 ++--
 drivers/gpu/drm/xe/xe_wa_oob.rules | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 1291f71348db..cc58a2092236 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -164,8 +164,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (XE_WA(gt, 22012727170) || XE_WA(gt, 22012727685))
 		flags |= GUC_WA_CONTEXT_ISOLATION;
 
-	/* Wa_16015675438, Wa_18020744125 */
-	if (!xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
+	if ((XE_WA(gt, 16015675438) || XE_WA(gt, 18020744125)) &&
+	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
 		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
 
 	/* Wa_1509372804 */
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index fecf9dd431c5..05c821a50680 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -8,3 +8,6 @@
 		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, FOREVER)
 22012727685	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
 		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, FOREVER)
+16015675438	PLATFORM(PVC)
+		PLATFORM(DG2)
+18020744125	PLATFORM(PVC)
-- 
2.40.1

