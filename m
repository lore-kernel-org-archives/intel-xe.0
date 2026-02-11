Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF43EECD6F9
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 22:20:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E56D10E1EE;
	Wed, 11 Feb 2026 22:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhfixQ0y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D3189701
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 22:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770848424; x=1802384424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/s1GMi7gWg1IrYbZAWLEg5F8cSQRD1dV7Z5nj5e3yds=;
 b=ZhfixQ0yX3pGzKX6WT3q4ElEDh6QipVlmJz8jzXd/s+KdkCaJlvPw3zx
 mORe1HS9Gt3+uDR99aNCYFK0SDYP2xsIPjRWQDbdRkrPQBYVX/iu6WYMs
 XeHhiPhPwRtNJIXagrmlfMvuCwBeH4rxCCnFiFYlPItkiQhpDz5eufVRy
 dMIc5hvSue+WOdAf0u6zS2/VwvUFagKiwjiJq4KEwNJB///nlhi+QUxId
 J1H7B0nMt6h+8jF5OGmWk6SZ6XrMXayxdmAbI2emfY9M357nknz2PUVxW
 95uKr4uZYaEFuzks/sJ+Wzp1BXY8ex7zXYee6OW+bBWCMH+wZQcDqXKQ7 g==;
X-CSE-ConnectionGUID: tHqOluSnTH2E0rejcEgs1Q==
X-CSE-MsgGUID: jBsjRVyDTJKUAexrXBAafg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89415213"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="89415213"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 14:20:24 -0800
X-CSE-ConnectionGUID: thQ8gW0YS5y1zh3Crik3tg==
X-CSE-MsgGUID: XZI04GYtTsCQqYGDIG84zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="212479585"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa007.jf.intel.com with ESMTP; 11 Feb 2026 14:20:24 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v6 4/6] drm/xe: Use XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET enum
 instead of magic number
Date: Wed, 11 Feb 2026 17:20:18 -0500
Message-Id: <20260211222020.848341-5-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260211222020.848341-1-zhanjun.dong@intel.com>
References: <20260211222020.848341-1-zhanjun.dong@intel.com>
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

Replace the magic number 2 with the proper enum value
XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET for better code readability
and maintainability.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 91c7600a59f5..cd434caec9c2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1334,12 +1334,13 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 	if (!guc->submission_state.initialized)
 		return;
 
-	if (xe->wedged.mode == 2) {
+	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
 		err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
 					       guc_submit_wedged_fini, guc);
 		if (err) {
-			xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
-				  "Although device is wedged.\n");
+			xe_gt_err(gt, "Failed to register clean-up on wedged.mode=%s; "
+				  "Although device is wedged.\n",
+				  xe_wedged_mode_to_string(XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET));
 			return;
 		}
 
-- 
2.34.1

