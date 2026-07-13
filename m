Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4516C44501
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 23:08:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709D110EB7A;
	Mon, 13 Jul 2026 23:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bUEwvkNf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A952210EB7A
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 23:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783984113; x=1815520113;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=88iHlUE36Gnzdmxu7RFcmbezk5hmGz+JWIAE4o72a84=;
 b=bUEwvkNfnaw3E+yuBUIpW4iWxTurLVWEj8JgM3Fk8THbWSyXFzB45eku
 +kRy68AloJHkvVrh8uVeD5muk4Y0Ihodi81wEpv58B69Og/X8MmID9OHZ
 nRHvr1hLXnOyawEzKe9pgFFTRifQR5J8IXexQpSvJhbd1EK+HQP1OpwSC
 Y6eaD6HIl1WT1GoJ+IUeAziGIcFx4YN0mXmnySCIwYF5rOyzvO5E+k+O5
 B54MGLMyg+/1Wl9QSpD2S3KOL5yTWxgjdWB8srBa4EIbjDuOiEZP3PIIB
 8WrK+QNaSAO5tsHQ/OL2waCckND8pi4rMfR4QjhKJangL7aPZmDK1GZio A==;
X-CSE-ConnectionGUID: kEeFrMdpSSupwB7jvUvlPQ==
X-CSE-MsgGUID: gGFnUHLqQ6mg4F+uqg+EBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84564657"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84564657"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 16:08:33 -0700
X-CSE-ConnectionGUID: gO9UV0GmSdmAXEBhlTs+Cw==
X-CSE-MsgGUID: tdKlyTUBRh6X0tDMgZXBLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="278947310"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa002.fm.intel.com with ESMTP; 13 Jul 2026 16:08:32 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zongyao Bai <zongyao.bai@intel.com>, Bai@freedesktop.org
Subject: [PATCH] drm/xe/pt: Reset prepare state in xe_pt_update_ops_init()
Date: Mon, 13 Jul 2026 23:08:30 +0000
Message-ID: <20260713230830.2662760-1-zongyao.bai@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

xe_pt_update_ops_init() resets the per-prepare address range and
deferred state, but current_op was left unchanged. If the same
xe_vm_pgtable_update_ops is prepared again, new operations are appended
after the stale current_op value instead of starting from ops[0]. This
can make current_op exceed the number of operations allocated by
xe_vma_ops_alloc(), leading to out-of-bounds access to pt_update_ops->ops.
So, reset current_op when initializing the PT update ops.

Also reset needs_svm_lock and needs_invalidation. These flags are derived
during the same prepare pass as current_op and are consumed by
xe_pt_update_ops_run(); leaving them stale can select the SVM migrate ops
or request TLB invalidation even when the current prepared operations do
not require it.

Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: Bai, Zongyao <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index e466f714bf86..598c6b2571e7 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2371,8 +2371,11 @@ static void
 xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops *pt_update_ops)
 {
 	init_llist_head(&pt_update_ops->deferred);
+	pt_update_ops->current_op = 0;
 	pt_update_ops->start = ~0x0ull;
 	pt_update_ops->last = 0x0ull;
+	pt_update_ops->needs_svm_lock = false;
+	pt_update_ops->needs_invalidation = false;
 	xe_page_reclaim_list_init(&pt_update_ops->prl);
 }
 
-- 
2.43.0

