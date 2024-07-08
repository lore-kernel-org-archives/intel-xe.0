Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223E0C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 06:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7D710E1CC;
	Mon,  8 Jul 2024 06:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U8K66Lf6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E1010E1CC
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 06:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720419213; x=1751955213;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H0bcyLAFw2oTfUCE6dGmkl9Co3HIdTS9Xl7krfpBoUo=;
 b=U8K66Lf64WEzXzNlC3tWAAqieD2MFqqZmqhgIfWtraoUadA2z96GDMjD
 0hWiQcO9mcz/DkbJbluQ7ncH8VKUsZZ3ciw1xXc5ZXZJy/8vk+/rAqaf5
 OBecYqcfR09xJBkz19ddlstQZwKQo1V2c2oQ8ugXSyjxumkSvYtlqAHc4
 fnvCIU+RChjDawR7B8doVIDVt6cvjCmGeXTZg7DXqZlTRw/0LoUNPLh8/
 Jt5q+Xo3kJhje1QsVeSKoItqhR+7BrhKASZy//b8kYqsPxLBivXOrYl/R
 sQElC81Uga91tvdOO0m9VYfqSYRPfhSJK/R4s4c9tpjmohPHCeM9J6ayA Q==;
X-CSE-ConnectionGUID: fsBaaM64TFG5BCObs0PluA==
X-CSE-MsgGUID: Nihdxdv9RviKh9bEdQLgKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="35137411"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="35137411"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 23:13:33 -0700
X-CSE-ConnectionGUID: wynJnecVTDG95bIcftpslg==
X-CSE-MsgGUID: ZLnSTKIYRWOSfm9md7xsgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="47459032"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa010.fm.intel.com with ESMTP; 07 Jul 2024 23:13:31 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH] drm/xe: Revert "drm/i915: Disable DSB in Xe KMD"
Date: Mon,  8 Jul 2024 11:26:30 +0530
Message-Id: <20240708055630.4058818-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
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

This reverts commit c27f010aa1884276ee5dae72034d84987060c769.

After fix from [1] dsb timeout issue is not reproducible on local testing
with xe driver. Checking CI result to confirm and not for review.

[1] https://patchwork.freedesktop.org/series/130783/

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 2ab3765f6c06..e9c4835a2c30 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -463,10 +463,6 @@ struct intel_dsb *intel_dsb_prepare(struct intel_atomic_state *state,
 	if (!i915->display.params.enable_dsb)
 		return NULL;
 
-	/* TODO: DSB is broken in Xe KMD, so disabling it until fixed */
-	if (!IS_ENABLED(I915))
-		return NULL;
-
 	dsb = kzalloc(sizeof(*dsb), GFP_KERNEL);
 	if (!dsb)
 		goto out;
-- 
2.29.0

