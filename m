Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C70C44501
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 23:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A4410E086;
	Tue, 14 Jul 2026 23:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T/PNCdo2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C95E10E086
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 23:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784071475; x=1815607475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KV57zEaBOQEPvFv/X/GjFa0YhFxJlImTSEAGcrrXJuI=;
 b=T/PNCdo2wVC2SEchBegU8pWrEqy0JieKXf7LMl5XrQhPFLxqLM+8UT6q
 LRxIzFYpYTkef8OHjqsYOqyKNe3FhjMK0NsFAPwn7R6iQ0OlijkzO05pR
 IdETNmlnrgWwG2l3E/UWwx8S7bd5+yldYnU2+nB0cYzXx71PD1NeVecH8
 514M7n2cK5c/3k5NJWtTkGBC7QSgeGJ+3XP42Ln7H9gx1aCyu8DrbxKl7
 yzci4nstb40QNADYHxTmEuxV2kArqk2vctZcBfasCgs9TeZ0xtWR9hDE+
 3PmlV/gPeWTd7MEqknq+CeVd91EmvqWz4UrWVu0aMvQIw7kikjIf/4dxN w==;
X-CSE-ConnectionGUID: Ff0scJ9nTB+IobFQQ+CpfQ==
X-CSE-MsgGUID: kZUnqyy1QFi7ubwkSCQsnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83826293"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="83826293"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 16:24:34 -0700
X-CSE-ConnectionGUID: kGqiNYYeTuWawuXXGmMlPw==
X-CSE-MsgGUID: KhnYWDRcSfy3Yfm3Cig86g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="259573795"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa003.jf.intel.com with ESMTP; 14 Jul 2026 16:24:35 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, Zongyao Bai <zongyao.bai@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, stable@vger.kernel.org
Subject: [PATCH v2] drm/xe/pt: Reset current_op in xe_pt_update_ops_init()
Date: Tue, 14 Jul 2026 23:24:32 +0000
Message-ID: <20260714232433.2737533-1-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713230830.2662760-1-zongyao.bai@intel.com>
References: <20260713230830.2662760-1-zongyao.bai@intel.com>
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

xe_pt_update_ops_init() fails to reset current_op to 0. On the
vm_bind path, ops_execute() calls xe_pt_update_ops_prepare() inside
the xe_validation_guard() / drm_exec_until_all_locked() loop. When
that loop retries due to lock contention or OOM eviction
(drm_exec_retry_on_contention() / xe_validation_retry_on_oom()),
xe_pt_update_ops_prepare() runs again on the same vops, and each
call to bind_op_prepare() increments current_op without resetting it.

After N retries current_op exceeds the array size allocated by
xe_vma_ops_alloc(), causing an out-of-bounds write into
SLUB-poisoned memory and a subsequent UAF crash in
xe_migrate_update_pgtables_cpu() when reading the corrupted pt_op->bind.

Also reset needs_svm_lock and needs_invalidation which are derived in
the same prepare pass and would otherwise cause wrong migrate ops
selection and redundant TLB invalidation on retry.

Fix this by resetting current_op, needs_svm_lock and needs_invalidation
in xe_pt_update_ops_init().

v2 (Matt):
   - Add details in commit message.
   - Add Fixes tag and Cc to stable@vger.kernel.org

Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into single job")
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Cc: stable@vger.kernel.org
Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
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

