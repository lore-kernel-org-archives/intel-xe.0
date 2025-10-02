Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0E4CCD18B
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 05:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE5A10E79A;
	Thu,  2 Oct 2025 05:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L4VS99Gw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C3610E787
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 05:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759384448; x=1790920448;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=J3pJvFmPSabnDHXbJsg5goRr4topEsbp+LCEmn6TvZ8=;
 b=L4VS99GwRuL8yTJVA1wqE9s1kIe74VAj0m9bH3gDinVYVmpI3QMSDkL7
 S79eHADMyO7IyE2+IMQKeLfsGaPIHp2MGyaoEXPJ7R2mcxCijJDqbbc8h
 0WJLBkuJr0nPOX1UUfRWsifd8FY18Uw8tLFEXllPKchvjAThn2wLHhCkx
 04KS5qKVdBk+JikZWGNLpKh05YzN31JruyQ2kyyOSGIDS8j5Ux1qWucHD
 vYxKoKqafvvH0pNrj/lZ+t3/kNrRF4pL+nQko1XVYEdeLif+krGwdfox/
 ThfR4kRfs/eSU6pVOGfLXDPjlZLtYjB3Pu1Uj+/q8m3G2raNDNN28oxoj Q==;
X-CSE-ConnectionGUID: o+XYjvPtRLGH1adR9ysm+w==
X-CSE-MsgGUID: xHOfh1VUQ4qmPBeuw8QyWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65304502"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="65304502"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
X-CSE-ConnectionGUID: IKOtGqSDTO+tk84mwaXWBA==
X-CSE-MsgGUID: xaiq6qVzQdOY89mqZFaY6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="216083532"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 09/34] drm/xe: Make LRC W/A scratch buffer usage consistent
Date: Wed,  1 Oct 2025 22:53:37 -0700
Message-Id: <20251002055402.1865880-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002055402.1865880-1-matthew.brost@intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
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

