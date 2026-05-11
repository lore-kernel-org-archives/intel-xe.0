Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC22CD37B2
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 15:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98A110E1D4;
	Mon, 11 May 2026 15:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UTgaB5QI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2306110E1D4
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 15:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778514106; x=1810050106;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PJriS10ar4SoIyHS1Uz86VpWuI2MdaljdU7h2GOXvZw=;
 b=UTgaB5QIDgM3vovbtGn6Nr/ji5vHpYVyJVXZ6JHxr3+8dVtWEi3Zhra2
 +9bzuFaJqne1T1LmIy7WEkhCO2j8oNYx9cQULvht6N59lX05RWf6j8ixQ
 VaYmjhEz4m4JJcX+HEoJ767sjDYs1zbnf9rcvou/Oax4Z9lChFbYhtN3Q
 o1JYrh4j2bDP7gzmXT9Vxe4Kjmycdi1ETFQ7GZ+FU7A2ugDgAG/AwKZwL
 IWL0XvPqdTmNSXxkUw93ew0YtRuMNeu15DEIL6SwWZD7W6Nl1/xP8sfKg
 hYSMzyX6aNHlBpbLJvYkwTuJrQRc0GOrcmmTdI/oAmxsQdlsg4lozZR2p g==;
X-CSE-ConnectionGUID: AJjRmiT9SDy25JsTwPkW6g==
X-CSE-MsgGUID: WazGO8XBSpuU2C5gb1iTaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79351760"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="79351760"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 08:41:45 -0700
X-CSE-ConnectionGUID: YRwXfUunQAuMxWoTi7eD6Q==
X-CSE-MsgGUID: P3JPi0q5TU+UZ3GyFRRx3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="236633321"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa010.jf.intel.com with ESMTP; 11 May 2026 08:41:43 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/xe/gsc: Fix double-free of managed BO in error path
Date: Mon, 11 May 2026 15:41:34 +0000
Message-Id: <20260511154134.223696-1-shuicheng.lin@intel.com>
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

The error path in xe_gsc_init_post_hwconfig() explicitly frees a BO
allocated with xe_managed_bo_create_pin_map() via
xe_bo_unpin_map_no_vm(). Since the managed BO already has a devm
cleanup action registered, this causes a double-free when devm
unwinds during probe failure.

Remove the explicit free and let devm handle it, consistent with
all other xe_managed_bo_create_pin_map() callers.

Fixes: 2e5d47fe7839 ("drm/xe/uc: Use managed bo for HuC and GSC objects")
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
Resend for CI.
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

