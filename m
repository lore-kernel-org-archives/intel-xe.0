Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE64FC4707C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 18:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522E710EB9C;
	Fri, 12 Jan 2024 18:29:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F349410EB8B
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 18:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705084195; x=1736620195;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oxe6nyqTmtYSbv6IB+Ud3G6PuB+N54u7BcL9NAcJ+Yc=;
 b=eNOjQ2Ut7qtnbM5r6WkuyAyCWW4xG5mxzTQdeExtHvpUw5f8afbnQsm+
 CFUh5NyvvnzKoAmZOs93vRjQPbsXo3+fY92ZEvYFNkC2qTtnVUVZbiXgP
 Ugwpj1nG1NNmZsZ9FX+5JPHs7lWFdV+IF5T9Hr5LlBCD2AbhsmDeOh4ih
 nEI9Jqn1M3x6RbLbbdYYd/9UGMKt6loN+hqlWkoMf6QCIXu70uJLL1+Y6
 b/MyTdPNblVt65mwMZY2ZfL5MshTPOSZsvwhv+lrNMHY+OTQXa7K/Zehu
 itAp+K15TnxOt0pTwHXkppDxBujBv9WHBKLSk7mYdgJLL5QneLZ0OSRLa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="403016698"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="403016698"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 10:29:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="24792986"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 10:29:56 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Initialize freq_lock even with skip_guc_pc
Date: Fri, 12 Jan 2024 10:29:50 -0800
Message-ID: <20240112182949.181403-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: matthew.d.roper@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

gucpc isn't initialized when skip_guc_pc is used, but some of the sysfs
frequency entries still try to grab the uninitialized frequency mutex
before realizing that they need to bail out.  Tweak the init/fini code
flows so that the mutex is always initialized properly.

Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index f71085228cb3..67ce24fae79d 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -964,11 +964,12 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
 
 	if (xe->info.skip_guc_pc) {
 		xe_gt_idle_disable_c6(pc_to_gt(pc));
-		return;
+		goto out;
 	}
 
 	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
 	XE_WARN_ON(xe_guc_pc_stop(pc));
+out:
 	mutex_destroy(&pc->freq_lock);
 }
 
@@ -984,11 +985,11 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	struct xe_bo *bo;
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
 
-	if (xe->info.skip_guc_pc)
-		return 0;
-
 	mutex_init(&pc->freq_lock);
 
+	if (xe->info.skip_guc_pc)
+		return 0;
+
 	bo = xe_managed_bo_create_pin_map(xe, tile, size,
 					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
 					  XE_BO_CREATE_GGTT_BIT);
-- 
2.43.0

