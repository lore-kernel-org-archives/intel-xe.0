Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28146C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 11:57:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C543E10F0AD;
	Fri, 22 Mar 2024 11:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ji20U6Rk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F9910F0AD
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 11:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711108634; x=1742644634;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KwBqltdTVQ3VwfkXqfSfBnI6vR340cOsbKRpOSPGi8U=;
 b=ji20U6RkoO/pZiSKjiEdUIh+XhQvgoFA/1kEfXlbs5OyKE5RgIDbtIpC
 D+nBTUd7M4YAENtY7HYiKDmkj4GsaqwIK2hQ/tEbIp+MqAZ75odyt7o/b
 SEKAydGJTA+HsCITZ8BedPsFd0QP0/U6aHJexYVihGbXTVdzDwSVvU9kp
 Mer59b5xHhN+3kIPjAxDeyiz+QQsCIPh+4afazJOXCokKzmKWy925rkZi
 c7PbYP8FxhOLBy+t3+WvWVQz58n6X7di0kVVGtaE9iASosyE6BoVxP8lV
 i2ZfrHo0R3w/4m0W+S7QSI9vLreT+ePz4YlUnYyu9yCXlPQecOX3ocgha g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6007261"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="6007261"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 04:57:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="19576347"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa004.jf.intel.com with ESMTP; 22 Mar 2024 04:57:13 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH] drm/xe: Revert "drm/i915: Disable DSB in Xe KMD"
Date: Fri, 22 Mar 2024 17:12:14 +0530
Message-Id: <20240322114214.1501078-1-animesh.manna@intel.com>
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
index 4baaa92ceaec..e06e94ee2f5c 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -468,10 +468,6 @@ struct intel_dsb *intel_dsb_prepare(const struct intel_crtc_state *crtc_state,
 	if (!HAS_DSB(i915))
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

