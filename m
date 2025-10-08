Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C2FCCD189
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 21:45:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E50610E8EB;
	Wed,  8 Oct 2025 21:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GlHRsWYt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006FC10E89D
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 21:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759959941; x=1791495941;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=43DjX4XeIiEK7BpiQ6DzR5g7+04qzLTzYTq/hTp2q88=;
 b=GlHRsWYtQx1+zJuoeqJ0ThH5CazPNRK/sQIhHOkDIcbC+6VaszNH2k8B
 gBEZqsq4KNyD65uuB8BQsitooU06hh17uWLRsoqqgMLvMjIi1j/F0Iu1T
 rodfHDyScuopFsQ5I9jz9Fc0SHXtVJd/++yHcQNslbhwqQM0W8yDY+iGD
 hP8Z98Am84LjFCwS02XmtIskChxS3T09ysyWgEIAKEeoqLM7DZ0mj16Oe
 +cijoUKdQbdVzkTWUDPAp2CrDyKlbJEO81n3T5opVOsVb+6ooPP2F7OLz
 JHLnqR7X5LhJWrWlcujuBYvoUz0h0tH++CtY5go3kUSDk/AGNekui2WhF Q==;
X-CSE-ConnectionGUID: t4u2Asq4Qh6jXhU43sj3SA==
X-CSE-MsgGUID: jdYw1Oj9SsKQoncPSVI+Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="49726850"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="49726850"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:40 -0700
X-CSE-ConnectionGUID: cSb5SltpTDu1p5zdbkG5SQ==
X-CSE-MsgGUID: tRCXqR+uStOkgOlv8QtxlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217635186"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v10 07/34] drm/xe: Make LRC W/A scratch buffer usage consistent
Date: Wed,  8 Oct 2025 14:45:05 -0700
Message-Id: <20251008214532.3442967-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008214532.3442967-1-matthew.brost@intel.com>
References: <20251008214532.3442967-1-matthew.brost@intel.com>
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
index 2c6eae2de1f2..b5083c99dd50 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1247,7 +1247,7 @@ static int setup_bo(struct bo_setup_state *state)
 
 static void finish_bo(struct bo_setup_state *state)
 {
-	if (!state->buffer)
+	if (!state->lrc->bo->vmap.is_iomem)
 		return;
 
 	xe_map_memcpy_to(gt_to_xe(state->lrc->gt), &state->lrc->bo->vmap,
-- 
2.34.1

