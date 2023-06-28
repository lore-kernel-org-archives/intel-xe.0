Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0959CEB64D9
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 00:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B5D10E012;
	Wed, 28 Jun 2023 00:16:54 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BEE110E012
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 00:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687911412; x=1719447412;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mv9DucxlMjGt+IC7wyc8NXiRNGnRz3/Hb30+IGXgaGA=;
 b=OJ6PoYY6tsi4vIhBoW5y7NRCdq3kOz5nx3C62SsVKWM7V2pqTYX5zU/R
 MuKnRvQS0r5UjMapLtfX5iY8gJgumNHqSHlob3IHUVJwl8AbZh7dMkFKk
 IHxm1/xdQVduWhxFWuoiOxZ9qqMKkVBkxS/daiYOLAbKO4q52EkTyROeF
 lXtP96XKoJ9IpoQ9kY/1zVgxYY22PJ4Dy9ZIOfZRbtCDsOTy0LhIXMzlR
 LlidwLxxBxepm+JXEvm0l6eR47/CMshB+/tSp6ZwWk3J8U1STrSH15DR6
 KF1zNcskGijZXwL2YA4oakuIwPhG165ytPenEBP8z6y5tPTPdCvsgGALF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="448097879"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="448097879"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 17:16:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="829861892"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="829861892"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 17:16:51 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 27 Jun 2023 17:16:42 -0700
Message-ID: <20230628001642.3170070-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/slpc: Start SLPC before GuC submission on
 reset
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The SLPC code has a strict 5ms timeout from when the start command is
queued to when we expect the reply to appear in memory. This works if
the CT channel is empty, but if the channel is busy there might be an
extra delay that causes the process to exceeded the timeout. We see
this issue when a reset occurs while userspace keeps submitting,
because the submission code is re-enabled first and it will start using
the channel to service those submissions.
To fix this, we can simply start SLPC before re-enabling submission.
This has also the benefit of not allowing submissions to go through with
an uninitialized SLPC.

Reference: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/375
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 43f862aaacbe..8a9857c78309 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -802,14 +802,10 @@ int xe_guc_start(struct xe_guc *guc)
 {
 	int ret;
 
-	ret = xe_guc_submit_start(guc);
-	if (ret)
-		return ret;
-
 	ret = xe_guc_pc_start(&guc->pc);
 	XE_WARN_ON(ret);
 
-	return 0;
+	return xe_guc_submit_start(guc);;
 }
 
 void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
-- 
2.41.0

