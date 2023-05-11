Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F32C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 19:48:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B900E10E0D0;
	Thu, 11 May 2023 19:48:44 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C5E10E0BE
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 19:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683834524; x=1715370524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nrSDlcSZU3dAv1ou3Cw9RMVfKjNvgu7/sHVXRlfuBKw=;
 b=JRi+7X8vi+33cfhIfzwtZtfwn2/pvH/e4GwJk5lRNxg3+viNbLOuNLV+
 +b+lzJjV7hgGUv7iOb1ZuXiePYrCMZVGrQKzrbg1hZyoCH5Dm/vn8tbYC
 Wx1ureITZF+BV2HAn8KqYYluoTzJtAVu1lnFQK3RamCTDSGkdO8whYBMY
 q4mbzWnkNWhQQIpgZjJ0hZF/rGlPUVHDfjIkPmfHvRIbtHaE8k5icXdSr
 LYjJdD60HMb/XbfLmvr9Ik5gziHL2uSd+3SXPhmA7QLpJgnv1R7naHQb2
 iet5U60S7CexLt7fByLSOFOIO2u/nwTXFkRTrJxpUZ1PswTH4tcz8BttC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="436948176"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="436948176"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 12:48:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="789512311"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="789512311"
Received: from manojsix-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.255.34.137])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 12:48:42 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 11 May 2023 16:48:21 -0300
Message-Id: <20230511194822.626036-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511194822.626036-1-gustavo.sousa@intel.com>
References: <20230511194822.626036-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe: Get rid of MAKE_INIT_EXIT_FUNCS
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There is not much of a benefit from using that macro as of now and it
hurts grepability or other ways of cross-referencing.

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 6860586ce7f8..0b4541639bd1 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -39,12 +39,16 @@ struct init_funcs {
 	int (*init)(void);
 	void (*exit)(void);
 };
-#define MAKE_INIT_EXIT_FUNCS(name)		\
-	{ .init = xe_##name##_module_init,	\
-	  .exit = xe_##name##_module_exit, }
+
 static const struct init_funcs init_funcs[] = {
-	MAKE_INIT_EXIT_FUNCS(hw_fence),
-	MAKE_INIT_EXIT_FUNCS(sched_job),
+	{
+		.init = xe_hw_fence_module_init,
+		.exit = xe_hw_fence_module_exit,
+	},
+	{
+		.init = xe_sched_job_module_init,
+		.exit = xe_sched_job_module_exit,
+	},
 };
 
 static int __init xe_init(void)
-- 
2.40.1

