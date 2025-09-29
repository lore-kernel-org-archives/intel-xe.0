Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B906CCA468
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 02:56:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EA510E32C;
	Mon, 29 Sep 2025 02:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMw0srBr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57EE10E120
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 02:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759114550; x=1790650550;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=J3pJvFmPSabnDHXbJsg5goRr4topEsbp+LCEmn6TvZ8=;
 b=WMw0srBrDX6NHO4JtwMlvlmMJK0z7cfFCoA9NQFjhH2Dfro7Yz+K3jIX
 6A3rYdvp6Aoy18opLvih+jqdwCTXxtn/SIDfKSSyXs7Qm/6caqrjIhPBW
 4+cHfn/kJqE2sbCrx/j8S3vA4RJrpcDRdhSL2w1a/gmLnLLhLv9mXlVbx
 k+wuM8N+yRa/CAyZIJXmZ197sWv76QwItgoxqZ7teA2Foyddj4ph/aMls
 4emM9dRIe8/QY0o0HP/8bq88IqGnsOqvnLihPOjMOijvwxeQiTrNumz8s
 nOboCxWfbom1SXrsM9pnca/YPKAIlSHwTGJgq7wiUvXeWQZOIaMAeltgp A==;
X-CSE-ConnectionGUID: BlydksPyQ5WzkI7aQr1lpQ==
X-CSE-MsgGUID: YMNQawjxTJ2dnVUSiW21qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61398526"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61398526"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 19:55:50 -0700
X-CSE-ConnectionGUID: 4WDB/CFuRYSF2irCWxdmkQ==
X-CSE-MsgGUID: FyHHCpLTSzuvRhT7aVF4/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; d="scan'208";a="182529259"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 19:55:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 10/36] drm/xe: Make LRC W/A scratch buffer usage consistent
Date: Sun, 28 Sep 2025 19:55:16 -0700
Message-Id: <20250929025542.1486303-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929025542.1486303-1-matthew.brost@intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
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

The LRC W/A currently checks for LRC being iomem in some places, while
in others it checks if the scratch buffer is non-NULL. This
inconsistency causes issues with the VF post-migration recovery code,
which blindly passes in a scratch buffer.

This patch standardizes the check by consistently verifying whether the
LRC is iomem to determine if the scratch buffer should be used.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index e1bc102a6cae..f13737ac707e 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1248,7 +1248,7 @@ static int setup_bo(struct bo_setup_state *state)
 
 static void finish_bo(struct bo_setup_state *state)
 {
-	if (!state->buffer)
+	if (!state->lrc->bo->vmap.is_iomem)
 		return;
 
 	xe_map_memcpy_to(gt_to_xe(state->lrc->gt), &state->lrc->bo->vmap,
-- 
2.34.1

