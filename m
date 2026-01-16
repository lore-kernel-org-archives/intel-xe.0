Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31A9C98305
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41A710E28B;
	Fri, 16 Jan 2026 22:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DFDu36EX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7D710E1FD
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601867; x=1800137867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nuhR59VrLoVddJRQZWd8UoMAfLT7llT2kc4uIy/5vP8=;
 b=DFDu36EXZ8KB8epZ5xtFfT+Tu92qlSGXF5AKp5yWXotU/F0rYOs6L2fS
 TcGcGMu3iCZkM/GDaU/FMIT/9KUCF6dm2RvxIYZWF73VPXRdUJwRNNzPS
 a3sVlWveHv107xHHWfrn7rIRjBqOyKjZpxwhuG76W5WYat4t3ai70VSZ/
 fH24cpfaOeb5SbLrvvNBNJ3kxncc+ixRQcWGvrZ+O10RVabBC0f1vA0YP
 UO58zGizq6WTk6ov8R0XkAj8tY3Sjv92TbsH8YPDOzu632EeirUyJRfzK
 QX3Nufy9fY4j4hQyUBgh+/JHQV1J/eozeFI1cAxto3nTbyS/ANz7wqGUz w==;
X-CSE-ConnectionGUID: tQ94hAEbQbWc0j9OkejkSg==
X-CSE-MsgGUID: PKDRGFj9S+WZyOxE9Ty9ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123351"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123351"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:17:46 -0800
X-CSE-ConnectionGUID: J5EvXUcRTTOvvXxXhdLxEw==
X-CSE-MsgGUID: /bbP4q8wQvig4bQnkYYjrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204962708"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:17:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v5 06/11] drm/xe: Taint TLB invalidation seqno lock with
 GFP_KERNEL
Date: Fri, 16 Jan 2026 14:17:26 -0800
Message-Id: <20260116221731.868657-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116221731.868657-1-matthew.brost@intel.com>
References: <20260116221731.868657-1-matthew.brost@intel.com>
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
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Tested-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index e837888367c4..21fef337f29c 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -111,6 +111,16 @@ static void tlb_inval_fini(struct drm_device *drm, void *arg)
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
@@ -137,6 +147,8 @@ int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	primelockdep(tlb_inval);
+
 	tlb_inval->job_wq = drmm_alloc_ordered_workqueue(&xe->drm,
 							 "gt-tbl-inval-job-wq",
 							 WQ_MEM_RECLAIM);
-- 
2.34.1

