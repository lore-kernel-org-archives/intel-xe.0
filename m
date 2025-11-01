Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE02CCCFA0C
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 01:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF9A10E310;
	Sat,  1 Nov 2025 01:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DmTXcGEG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F2D10E058
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Nov 2025 01:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761958953; x=1793494953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A12Ylo6khqVK5cl1XCkZzIoq2NFELJY6EwlW5guLZEQ=;
 b=DmTXcGEG0crCTNuL7b40uI5mklO2bKf6rQqlHKfpMERK2M+Fdmkweb6b
 DeTjoOAMlK068V8qbWHecylvrM9gTkGNp4IIqTDSQAO8Vepwky/o/ilEe
 5K8DJB76+tMTWA8ooNaTuRDssIUYguUao01XKxEFz+8HCtq7dyUPE/Nln
 qWIuJScEheIGEkMrwDp024JFbKgoYRng7vTCgkhpH/peCxUoR8BxjZT/i
 r/b/upSrLdbF1FlfVOATbrEtwQt62M8mp5XnlVOAH2gQ6Sq7Tt2j/vZQ6
 d1RoHte+ydnpj1z7PMIwW9I/jG2/+7g0y1rGCloPl6u40lq3JRvX9pAcu g==;
X-CSE-ConnectionGUID: DZzktgVqR4ygmtOE1VPLlQ==
X-CSE-MsgGUID: dOuhhi7gRAu7prmBIxYn6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75575692"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="75575692"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:32 -0700
X-CSE-ConnectionGUID: ovnk+xgkR66KVTTd/YGHlg==
X-CSE-MsgGUID: Oa11x2g5TjCKr6w4VABzww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="217020173"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH 05/12] drm/xe: Taint TLB invalidation seqno lock with
 GFP_KERNEL
Date: Fri, 31 Oct 2025 18:02:18 -0700
Message-Id: <20251101010225.3095457-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251101010225.3095457-1-matthew.brost@intel.com>
References: <20251101010225.3095457-1-matthew.brost@intel.com>
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

Taint TLB invalidation seqno lock with GFP_KERNEL as TLB invalidations
can be in the path of reclaim (e.g., MMU notifiers).

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 918a59e686ea..7ee081b94f90 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -114,6 +114,16 @@ static void tlb_inval_fini(struct drm_device *drm, void *arg)
 	xe_tlb_inval_reset(tlb_inval);
 }
 
+static void primelockdep(struct xe_tlb_inval *tlb_inval)
+{
+	if (!IS_ENABLED(CONFIG_LOCKDEP))
+		return;
+
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&tlb_inval->seqno_lock);
+	fs_reclaim_release(GFP_KERNEL);
+}
+
 /**
  * xe_gt_tlb_inval_init - Initialize TLB invalidation state
  * @gt: GT structure
@@ -140,6 +150,8 @@ int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	primelockdep(tlb_inval);
+
 	tlb_inval->job_wq = drmm_alloc_ordered_workqueue(&xe->drm,
 							 "gt-tbl-inval-job-wq",
 							 WQ_MEM_RECLAIM);
-- 
2.34.1

