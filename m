Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EF7CAC5AE
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 02:34:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1256010E825;
	Thu, 25 Sep 2025 02:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N09Q+1ca";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E48910E825
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 02:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758767655; x=1790303655;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WFSTj7IFOMT7rqL6lMU/RT3jwKVntsWXuUDQZOZEapg=;
 b=N09Q+1caMRJbHbr4f6Sqj/wUGecx3oT98zPcqBH3mXDXAhH/ckLxihCX
 iGaQrhkqScQkihBhoMbEj9xQdpumrREq0A+2JrIIdBWPqlXwrgOWMonqR
 84+gWAudPLVsmW/O/YSb8mMKLHmarLY4z1120IMYAUineBPBfRLhtSiiN
 7pZXQ5gUO63hCqqq5Vl5U516B6YeVp6eIQTFJ31ilsvAH2Iu63XRrVbQP
 yJ8XVBGZ3beipvsZ6FdTfDeNn4DULkRvacOSL/V6p8a9DnRx0t/PbTy0b
 reon8VgyzzQ/nEIIFAPVqbXZLXkK6vapkwp/ByUOdg0cmrdKuFIJHh62E A==;
X-CSE-ConnectionGUID: w8L3nC1nQWmSWOuPqSLjPA==
X-CSE-MsgGUID: F0cXlv5QSra9ntQHSDftpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="63703325"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="63703325"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 19:34:15 -0700
X-CSE-ConnectionGUID: C/yTwMVTSCGDQ3ZOFvVDqg==
X-CSE-MsgGUID: Psc0Dl48TXC4pMQBITxYSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="176797453"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa007.fm.intel.com with ESMTP; 24 Sep 2025 19:34:14 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH] drm/xe/hw_engine_group: Fix double write lock release in
 error path
Date: Thu, 25 Sep 2025 02:31:46 +0000
Message-ID: <20250925023145.1203004-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
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

In xe_hw_engine_group_get_mode(), a write lock is acquired before
calling switch_mode(), which in turn invokes
xe_hw_engine_group_suspend_faulting_lr_jobs().

On failure inside xe_hw_engine_group_suspend_faulting_lr_jobs(),
the write lock is released there, and then again in
xe_hw_engine_group_get_mode(), leading to a double release.

Fix this by keeping both acquire and release operation in
xe_hw_engine_group_get_mode().

Fixes: 770bd1d34113 ("drm/xe/hw_engine_group: Ensure safe transition between execution modes")
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 58bee3ffe881..fa4db5f23342 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -213,17 +213,13 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
 
 		err = q->ops->suspend_wait(q);
 		if (err)
-			goto err_suspend;
+			return err;
 	}
 
 	if (need_resume)
 		xe_hw_engine_group_resume_faulting_lr_jobs(group);
 
 	return 0;
-
-err_suspend:
-	up_write(&group->mode_sem);
-	return err;
 }
 
 /**
-- 
2.49.0

