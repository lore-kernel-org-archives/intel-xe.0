Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F33EE4996
	for <intel-xe@archiver.kernel.org>; Mon, 21 Aug 2023 13:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AB610E267;
	Mon, 21 Aug 2023 13:54:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB7710E267
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Aug 2023 13:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692626040; x=1724162040;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kuQT8c+nbg5dOAAy2EfVH32CPQEwo0oI6TNrjwPDdks=;
 b=RZEJTE2GqZfAcesxnQ3dzqBsmTI/Z8s53e3PSWjHteMMvFtJ9uD3+lLT
 8+R/bra4gACn/K+C42UN+UQSUPq82EIoGKjLwVo271ompV4xo7TKMqfWr
 nm7r2pIx29+YH4uiLVFarvklNh3U/Yc3nUv6fdvtfXWnDDWMN4FYMNAA1
 Sr+HCqGjKRjk84i3KuTALNJhZJC5/ddzx39wNbD19emTXV5LJseCr0c7I
 i0qMWS+vzeU0xeTQ59ALkaMTZfQi9Vd9u04GDVdSaCyrQWw7m6yTZQ4e7
 vGzO0540J7hgiXHaNhK5qC0/bBKrPBajuMsx2bReWApssya3IahkRfSyC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377331474"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="377331474"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 06:53:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="982473829"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="982473829"
Received: from khschnei-mobl.ger.corp.intel.com (HELO 00d68fced57e.intel.com)
 ([10.249.41.47])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 06:53:58 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 21 Aug 2023 13:53:47 +0000
Message-Id: <20230821135347.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Add min/max cap for engine
 scheduler properties
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix typos in options descriptions.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.profile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
index 4bc080547d5f..ba17a25e8db3 100644
--- a/drivers/gpu/drm/xe/Kconfig.profile
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -5,7 +5,7 @@ config DRM_XE_JOB_TIMEOUT_MAX
 	  Configures the default max job timeout after which job will
 	  be forcefully taken away from scheduler.
 config DRM_XE_JOB_TIMEOUT_MIN
-	int "Default max job timeout (ms)"
+	int "Default min job timeout (ms)"
 	default 1 # milliseconds
 	help
 	  Configures the default min job timeout after which job will
@@ -31,14 +31,14 @@ config DRM_XE_PREEMPT_TIMEOUT
 	  an arbitration point and yield to HW before the timer expires, the
 	  HW will be reset to allow the more important context to execute.
 config DRM_XE_PREEMPT_TIMEOUT_MAX
-	int "Default max  preempt timeout (us)"
+	int "Default max preempt timeout (us)"
 	default 10000000 # microseconds
 	help
 	  Configures the default max preempt timeout after which context
 	  will be forcefully taken away and higher priority context will
 	  run.
 config DRM_XE_PREEMPT_TIMEOUT_MIN
-	int "Default min  preempt timeout (us)"
+	int "Default min preempt timeout (us)"
 	default 1 # microseconds
 	help
 	  Configures the default min preempt timeout after which context
-- 
2.34.1

