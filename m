Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385ECC44508
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 23:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA4910E8B0;
	Wed, 21 Jan 2026 23:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LMHFgVsE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B3C10E8B0
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 23:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769039981; x=1800575981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7jABGicwvIkFGZkiO1K+zGXWLDfPz5OR7sNdFNxE7Fw=;
 b=LMHFgVsE50f9gYuQd/lgxM/Amb8uWBnvj7cRCXSPzHQaOh8jqO1mWtuu
 v0NzbJW99qUEoIrWco4aTfwKLHPSR+ebYlkKc6jNyx933+QF+FFw5wUZv
 sgQJvqn8wAcLYh0NX0crSQPT8lsMm9/NKdB0eowdzWHnWKH0pp141zhGr
 xlU6K3mfKlwturBPjgvGELGf6Q/9cwq5i1KAxuYEYwsZAjEj4LqWQAv5y
 akNps1vGmjZdJ+IqWYiv4uBWSO4V/4B5WrE4RbclafhuloK8HF4GebUH3
 GVwkDlxUrEJ1gtGxSUYd8U9liCsE0XrWZKS4wiC1KhGXSq5FioQRXJOcE A==;
X-CSE-ConnectionGUID: CQ2AhjthQMKXe5rhO5Xt2g==
X-CSE-MsgGUID: e48RU6YFSRSIkiMAWQ0jaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="57839581"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="57839581"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 15:59:41 -0800
X-CSE-ConnectionGUID: s/CD5k56Qp+wjhiIwQ6SZA==
X-CSE-MsgGUID: zCpgVgnnRwWqHMthk9d20Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="207017463"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa009.fm.intel.com with ESMTP; 21 Jan 2026 15:59:40 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 2/2] drm/xe: Log module init failure as error
Date: Wed, 21 Jan 2026 23:56:21 +0000
Message-ID: <20260121235618.3138251-6-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260121235618.3138251-4-shuicheng.lin@intel.com>
References: <20260121235618.3138251-4-shuicheng.lin@intel.com>
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

Module init abort is fatal, so log it with pr_err() instead of pr_info()
to make the failure visible in typical log-level configurations.

Also reorder internal includes to be alphabetically sorted.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index a0048f64ed12..3344811585ff 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -10,13 +10,13 @@
 
 #include <drm/drm_module.h>
 
+#include "xe_configfs.h"
 #include "xe_device_types.h"
 #include "xe_drv.h"
-#include "xe_configfs.h"
 #include "xe_hw_fence.h"
+#include "xe_observation.h"
 #include "xe_pci.h"
 #include "xe_pm.h"
-#include "xe_observation.h"
 #include "xe_sched_job.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
@@ -157,7 +157,7 @@ static int __init xe_init(void)
 	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
 		err = xe_call_init_func(init_funcs + i);
 		if (err) {
-			pr_info("%s: module_init aborted at %ps %pe\n",
+			pr_err("%s: module_init aborted at %ps %pe\n",
 				DRIVER_NAME, init_funcs[i].init, ERR_PTR(err));
 			while (i--)
 				xe_call_exit_func(init_funcs + i);
-- 
2.50.1

