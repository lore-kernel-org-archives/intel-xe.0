Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC28F436B9
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 16:19:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C79A10EA82;
	Fri, 17 Apr 2026 16:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQ1YxJuK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D2B10EA80
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 16:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776442756; x=1807978756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oc5XKM8t7fTPWSG84LN4SG8mvCXelk19O/V3nwgDhLg=;
 b=EQ1YxJuKY6eg2sAtFufS67sU6+gymp/dauRJXteGL0kXnvVcFy1SFfv0
 NYpk7sBMoLmAZFO1pUIw2E6R83/g5dDKj7a9Zy6OX3mJTRYKAZcYPXCSJ
 GZ3MoXA6YDyEsXgmNI1PFwOl+lXIKMS+RbYeEm/GtrPaBnIOeu/l9/PHU
 OmBnlcMRYQVGlZuBT6DaWkW06kXRX1bsdX8aCPIirbsd9otrca3Pa3j7r
 HqeJ5lvXSg72IRDbFrWj8g0GulmKOYNxuelb9ELcQDR4kqbIRmBzMEO06
 yLN/EXQ3HfQf4MENveL9+C6qFsRd8IuHEtGjajn+G55088yf7Y5uy+8Hj w==;
X-CSE-ConnectionGUID: tNt+CUC4QXWozR2Liou7Lg==
X-CSE-MsgGUID: lExUYR2GTDe6uLLzYyRePw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="87760131"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="87760131"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 09:19:16 -0700
X-CSE-ConnectionGUID: umm3b2bITYmGvoi/c/PZkQ==
X-CSE-MsgGUID: irPe4R7BTN+8o1qOc4Xy9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="230222165"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa010.jf.intel.com with ESMTP; 17 Apr 2026 09:19:15 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 1/2] drm/xe/gsc: Fix double-free of managed BO in error path
Date: Fri, 17 Apr 2026 16:19:00 +0000
Message-Id: <20260417161901.3416021-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260417161901.3416021-1-shuicheng.lin@intel.com>
References: <20260417161901.3416021-1-shuicheng.lin@intel.com>
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

The error path in xe_gsc_init_post_hwconfig() explicitly frees a BO
allocated with xe_managed_bo_create_pin_map() via
xe_bo_unpin_map_no_vm(). Since the managed BO already has a devm
cleanup action registered, this causes a double-free when devm
unwinds during probe failure.

Remove the explicit free and let devm handle it, consistent with
all other xe_managed_bo_create_pin_map() callers.

Fixes: 2e5d47fe7839 ("drm/xe/uc: Use managed bo for HuC and GSC objects")
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 0d13e357fb43..aab59dc647fb 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -482,8 +482,7 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
 				 EXEC_QUEUE_FLAG_PERMANENT, 0);
 	if (IS_ERR(q)) {
 		xe_gt_err(gt, "Failed to create queue for GSC submission\n");
-		err = PTR_ERR(q);
-		goto out_bo;
+		return PTR_ERR(q);
 	}
 
 	wq = alloc_ordered_workqueue("gsc-ordered-wq", 0);
@@ -506,8 +505,6 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
 
 out_q:
 	xe_exec_queue_put(q);
-out_bo:
-	xe_bo_unpin_map_no_vm(bo);
 	return err;
 }
 
-- 
2.43.0

