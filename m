Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DA3D167E7
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 09:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A473F10E857;
	Fri,  9 Jan 2026 09:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sd8xsjhM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9017B10E857
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 09:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767951580; x=1799487580;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qy2rcXk3fX9H/Fo16/QwXPIOGr2fxp64EcyVlJnqTg0=;
 b=Sd8xsjhMy4tbI+nDslOYe1IeePxcF2s5P6CSgXYuGPF0jTQrximL/+9P
 YoMPYZCbnSYVc30HkK9s/fPxqPASZEPF5N9mR3kDtRzNv0Vezy2nSRF0l
 WGT7v4smcDGO6587muPRk2C6lUvSaQFuWNmBwV1iHBalUpsAZYH8QQYAk
 Cq528Za71SAnS8gZglcUb1LoFWNW8ihPvQb6/dhINeXK6F/QtJEvx+NZ6
 QanYCZErd5LlZpyApswblv8Bt2gYaRtpYIK8XeAE/FAjBSpioN6mBC5S6
 sbKkqXQOQnftQwGwPHJkWniaVqwS90PgM2LvOpDQi1ufV/M5691tYWxac w==;
X-CSE-ConnectionGUID: LGBz3eomSru22nEWXcxEhQ==
X-CSE-MsgGUID: cvAdoMR5RAm71CTLJJ8Khg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69381764"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="69381764"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 01:39:39 -0800
X-CSE-ConnectionGUID: YurlJwAMTGajFGosPi+hvg==
X-CSE-MsgGUID: kt19j5OwT/GoGFTc4ewVHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="203710610"
Received: from nakshtra-system-product-name.iind.intel.com ([10.190.238.69])
 by fmviesa008.fm.intel.com with ESMTP; 09 Jan 2026 01:39:38 -0800
From: nakshtra.goyal@intel.com
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/xe_query: Removing check for gt
Date: Fri,  9 Jan 2026 15:09:37 +0530
Message-Id: <20260109093937.53584-1-nakshtra.goyal@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

Removing check for gt as '>=' condition is not correct,
check fails for gt1 tile1 and correction check for gt is already there

Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 75490683bad2..b7b4261968e0 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -142,9 +142,6 @@ query_engine_cycles(struct xe_device *xe,
 		return -EINVAL;
 
 	eci = &resp.eci;
-	if (eci->gt_id >= xe->info.max_gt_per_tile)
-		return -EINVAL;
-
 	gt = xe_device_get_gt(xe, eci->gt_id);
 	if (!gt)
 		return -EINVAL;
-- 
2.34.1

