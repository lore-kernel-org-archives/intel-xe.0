Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E5DC531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 20:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273D310E0A6;
	Fri, 24 Jul 2026 20:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Db5KeMGq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DA310E0A6
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 20:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784923894; x=1816459894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bw36+KMxSO+5gKkXeFJ517wVNBpTmdSP0JhEPOHdafQ=;
 b=Db5KeMGq8BMi0O2iSZzai38zm75FYBX4T7BaypgvwFYeIfvRHnE0deB/
 YGmErhjqA8qnLJ2SnA6Hy6D148/vZSutJQyTjdCA7AoHq0X49WSTdMmk9
 6wY7EKzypoBAyszlZ0xPg0D7GxeiGTn73I1VapmNwzM+ZrYpXYmIb16dN
 UqiwKbiD71+65tadXHxaBfFClPUkq3G6FKCQy8pPpEXPywcY8lg4s7PnF
 sZB9ESN7Cizxzo6DgrL9zGTCrb6lil+0YMWGE8BQqbg/UEbzuqoJb983m
 Tjp4AFDT+AlMqqRvvtG4E9rMVIAZdXPogQLghtHOeMhWayKlfKwNvX/oB w==;
X-CSE-ConnectionGUID: 8HErxmvlQ1aUJ5wK04AWzA==
X-CSE-MsgGUID: W60lZrWAR/yJmGjoR6ybXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="89268050"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="89268050"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 13:11:33 -0700
X-CSE-ConnectionGUID: Ny09Iko5THerzuMmcSpgYg==
X-CSE-MsgGUID: w7AcyvgXRhC2Tm1unakbyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="258241796"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 13:11:33 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/2] drm/xe/mcr: Take vcs1/vecs1 into account for first media
 slice
Date: Fri, 24 Jul 2026 13:11:28 -0700
Message-ID: <20260724201129.2814030-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260724201129.2814030-1-ashutosh.dixit@intel.com>
References: <20260724201129.2814030-1-ashutosh.dixit@intel.com>
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

vcs1 and vecs1 may also be present on the first media slice, so take
vcs1/vecs1 also into account when determining if the first media slice is
absent.

Bspec: 77977

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 9799ffadf85d2..d069d141b54d6 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -454,9 +454,10 @@ static void init_steering_oaddrm(struct xe_gt *gt)
 {
 	/*
 	 * First instance is only terminated if the entire first media slice
-	 * is absent (i.e., no VCS0 or VECS0).
+	 * is absent (i.e., no VCS0, VCS1, VECS0 or VECS1).
 	 */
-	if (gt->info.engine_mask & (XE_HW_ENGINE_VCS0 | XE_HW_ENGINE_VECS0))
+	if (gt->info.engine_mask & (XE_HW_ENGINE_VCS0 | XE_HW_ENGINE_VCS1 |
+				    XE_HW_ENGINE_VECS0 | XE_HW_ENGINE_VECS0))
 		gt->steering[OADDRM].group_target = 0;
 	else
 		gt->steering[OADDRM].group_target = 1;
-- 
2.54.0

