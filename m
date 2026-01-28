Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8948D46C15
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 23:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964F710E77C;
	Wed, 28 Jan 2026 23:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ep6gmcH9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09FC10E77B
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 23:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769642197; x=1801178197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tcla4w8PYLT4x5u+02hG0dxcvnI0LgSjQIJy37qT4WI=;
 b=ep6gmcH9mkqO/NsmcaOSObK5z/C6AwfPJELrnmgqUxOPTwLS4GbOpmLH
 5aZG7pZ0jwC5kz0teIZ91oDgV23SBBk4JUH6uhSw2UXbv/Cw5gtV64hoZ
 XVpiMYV1Kmcj2GEbywwmUivWyrCNHYXbxHNklFvV1SGjRhWShktrnYlhu
 ebdxoZmPieiaSJRgYb29KSdQ3hCePZiHtQMIU4dtT5QsBPkoTD7deo9Xb
 jIV2O++y0OKosZ8mIZYDaMBOxDZ97ALW3rz0xTJmqqdLo0B1L6vrLKYNx
 UP0z1PJMIyX0BhWf92hwg3d2fzz2hoWJD628kp/VvVBdHZGoqAvHGXI53 w==;
X-CSE-ConnectionGUID: 0GnGR6RbSOiq1uLeX+lpZw==
X-CSE-MsgGUID: 9wTBA28iSe2PJHQGJjxOeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="73462221"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="73462221"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 15:16:36 -0800
X-CSE-ConnectionGUID: rbZTnHJMRxy/+enkjF2brA==
X-CSE-MsgGUID: snpnTihlTXOXIQJ+Mp65MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="213266648"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa004.fm.intel.com with ESMTP; 28 Jan 2026 15:16:36 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v5 4/6] drm/xe: Use XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET enum
 instead of magic number
Date: Wed, 28 Jan 2026 18:16:32 -0500
Message-Id: <20260128231634.982494-5-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128231634.982494-1-zhanjun.dong@intel.com>
References: <20260128231634.982494-1-zhanjun.dong@intel.com>
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
index 612ded5878fd..bdeca09a9530 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1341,12 +1341,13 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
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

