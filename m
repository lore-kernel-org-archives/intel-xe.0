Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E57CCFA04
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 23:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B574E10E106;
	Tue,  4 Nov 2025 23:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AowZ1l/h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E9210E106
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 23:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762299622; x=1793835622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RGg49fXSDbLDbyuCjrHqYQfSYJ7ep24NDGeLE/upqk8=;
 b=AowZ1l/ht1c2pmdWP/epyyqGP/FQSiiVXBu9ni+17QzVNENh4gXv9vrs
 PkeC2klfX0qI50RUjgR7XkmCrxRCtwwek28ADiaaPqE9QQpeaSd8a+pzK
 BGKvJqfnEj+BQV1vXZWnLzxGq0Oa5Wp8h/WDFJsUhH1Bo5kkl2jJN860h
 Tvnl9O/lxNpu+07PHefxeDoLFGFaUWjQNza4AIafP3+OXT/tYoAOEBZUL
 2l1+z09YBZ1vrD8j94AgbjUbQ9Fe5qYEHK9jPvLopJOB7LVzFW/XDk2Zc
 igO2X0m026Y14QM10KVD9mROiaxe8o2+1ZNEMFftBRC7jUceKTSNvTrZd g==;
X-CSE-ConnectionGUID: t/IK1ihiSMO/7VwFazFAKQ==
X-CSE-MsgGUID: lgjMFebsTkKlaK1sS+P9/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75516981"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="75516981"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 15:40:21 -0800
X-CSE-ConnectionGUID: 1c2lBvxWQ5iF6pnUSvxSSA==
X-CSE-MsgGUID: 7X4awuOLSrikD0B7Z84BrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="191590420"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa005.fm.intel.com with ESMTP; 04 Nov 2025 15:40:19 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe/guc: Fix resource leak in xe_guc_ct_init_noalloc()
Date: Tue,  4 Nov 2025 23:37:09 +0000
Message-ID: <20251104233708.1001391-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251104221613.795865-2-shuicheng.lin@intel.com>
References: <20251104221613.795865-2-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

xe_guc_ct_init_noalloc() allocates the CT workqueue and other helpers
before it tries to initialize ct->lock. If drmm_mutex_init() fails
we currently bail out without releasing those resources because the
guc_ct_fini() hasn’t been registered yet.

Since destroy_workqueue() in guc_ct_fini() may flush the workqueue, which
in turn can take the ct lock, the initialization sequence is restructured
to first initialize the ct->lock, then set up all CT state, and finally
register guc_ct_fini().

v2: guc_ct_fini() does take ct lock. (Matt)

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 671d69958ce7..42a625723db1 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -225,6 +225,10 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
 
 	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
 
+	err = drmm_mutex_init(&xe->drm, &ct->lock);
+	if (err)
+		return err;
+
 	ct->g2h_wq = alloc_ordered_workqueue("xe-g2h-wq", WQ_MEM_RECLAIM);
 	if (!ct->g2h_wq)
 		return -ENOMEM;
@@ -240,10 +244,6 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
 	init_waitqueue_head(&ct->wq);
 	init_waitqueue_head(&ct->g2h_fence_wq);
 
-	err = drmm_mutex_init(&xe->drm, &ct->lock);
-	if (err)
-		return err;
-
 	primelockdep(ct);
 
 	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
-- 
2.49.0

