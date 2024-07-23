Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BD8C3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 11:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C96C10E574;
	Tue, 23 Jul 2024 11:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOxjCznc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A9C10E57B
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 11:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721734341; x=1753270341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5bgR4x86M2otNMJCpVmnWXRbaA106IAUXDyXDA9f+Mg=;
 b=NOxjCzncfmwLb/q+tvM/ihdv3QDNIxugAqa4WLRw60vIQpf0o4d1X/rT
 Z210MsjYs8RKTFFbrz4TV2H9Ru839rOAYDU4FK+pcY8hszAvSIdlpUUmm
 BB3+GR+VNaEjkpJyVr8ocXA9JhIo5qE2ZoIHMF6Z7ve+3a5NlzDBQQtbH
 JY5XFxw6TeSYqxqjDwvqbwrFRu7l+Ov5woOjluJpR7+5oqOuoC5WWVMin
 8GL0I9ai/X1ceDLlhIz6cqKunFwGwfZNj6QRdtxnxt2FOaZ10q5MFUr7a
 H5j5Gfqo4TcjXHrVdcTY9M47YpxBg83nCxLFlySXaUKCUhB5ZSD9mTE0a g==;
X-CSE-ConnectionGUID: 774ClPSBSAiWeD9XdBUhoA==
X-CSE-MsgGUID: W+OS8F76RMu5905Pf96O/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="29942658"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="29942658"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 04:32:21 -0700
X-CSE-ConnectionGUID: Nzv4eBRjQDqP2g4t5rsPPA==
X-CSE-MsgGUID: ulZ8eXfOTxi/sEvaba7GBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="89671747"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 04:32:18 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: [PATCH 2/2] drm/xe: Create debugfs for tlb inval stats
Date: Tue, 23 Jul 2024 13:16:10 +0200
Message-ID: <20240723111610.21564-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240723111610.21564-1-nirmoy.das@intel.com>
References: <20240723111610.21564-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Create debugfs file for each GT to dump tlb sent/receive
stats.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c          | 9 +++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 7 +++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h | 2 ++
 3 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 5e7fd937917a..959d979927dd 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -17,6 +17,7 @@
 #include "xe_gt_mcr.h"
 #include "xe_gt_sriov_pf_debugfs.h"
 #include "xe_gt_sriov_vf_debugfs.h"
+#include "xe_gt_tlb_invalidation.h"
 #include "xe_gt_topology.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
@@ -269,6 +270,13 @@ static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
+static int tlb_stats(struct xe_gt *gt, struct drm_printer *p)
+{
+	xe_gt_tlb_dump(gt, p);
+
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
 	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
@@ -286,6 +294,7 @@ static const struct drm_info_list debugfs_list[] = {
 	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
 	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
 	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
+	{"tlb_stats", .show = xe_gt_debugfs_simple_show, .data = tlb_stats},
 };
 
 void xe_gt_debugfs_register(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index f84717c1aafa..62a6f42b6c60 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -540,3 +540,10 @@ void xe_gt_tlb_invalidation_fence_fini(struct xe_gt_tlb_invalidation_fence *fenc
 {
 	xe_pm_runtime_put(gt_to_xe(fence->gt));
 }
+
+void xe_gt_tlb_dump(struct xe_gt *gt, struct drm_printer *p)
+{
+	drm_printf(p, "GT%d, TLB Requests sent: %llu, received: %llu\n",
+		   gt->info.id, atomic64_read(&gt->tlb_invalidation.sent_count),
+		   atomic64_read(&gt->tlb_invalidation.received_count));
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index a84065fa324c..f420029ec02d 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -10,6 +10,7 @@
 
 #include "xe_gt_tlb_invalidation_types.h"
 
+struct drm_printer;
 struct xe_gt;
 struct xe_guc;
 struct xe_vma;
@@ -36,4 +37,5 @@ xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
 	dma_fence_wait(&fence->base, false);
 }
 
+void xe_gt_tlb_dump(struct xe_gt *gt, struct drm_printer *p);
 #endif	/* _XE_GT_TLB_INVALIDATION_ */
-- 
2.42.0

