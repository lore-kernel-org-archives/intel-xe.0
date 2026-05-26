Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADD3CD5BB4
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 08:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E09E10E60F;
	Tue, 26 May 2026 08:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RY6gNGc7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D119A10E465
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 08:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779784055; x=1811320055;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+WiOAvbPTYn/L+ZEo9lY2M3Y02v3ZFBacxMl/6IJkNE=;
 b=RY6gNGc7fB4/FsEx+x01hTiEjUiluUDSejRlb/iQyKZsBpyOGx63KLBZ
 RZJxzTUkSBbFEYMKKRZpzwsn25OVawiaJHnOZZoKd1hXhhB0rwUPARwMG
 PYdQsoeow6LbNcVJULeQoIankA4BOr7g61nlsWDbFiJmQLg8gbasxSyAq
 BC326MKbW+w62gfKGUsN/wOqCRFD+WoUeG6LlWsTXAGsTC3B0odP5dgjf
 k8GLOSo/iQQQ2LATEqF4Wu2W4oFF0EbNTom9CsSeFxr3uE9k6AhPxvCUG
 9VqzH+VZ7OMhQ29mj9MrjSQ5ohFvHvznEaTIuaoCCFAIYhi8Jl23OT5T1 A==;
X-CSE-ConnectionGUID: PcobCBdmRQqOQHPKyiN4jw==
X-CSE-MsgGUID: mJQN4eeaSVqsWZP0RsANrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91698425"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="91698425"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 01:27:34 -0700
X-CSE-ConnectionGUID: flEXjXNmSYGRc3QWbMjKXA==
X-CSE-MsgGUID: OZFqM7FVQ6i59RjvDDwBtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="239251765"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa008.fm.intel.com with ESMTP; 26 May 2026 01:27:32 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, matthew.d.roper@intel.com,
 thomas.hellstrom@intel.com, daniele.ceraolospurio@intel.com,
 matthew.auld@intel.com, stuart.summers@intel.com, x.wang@intel.com,
 brian3.nguyen@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 5/5] drm/xe: drm/xe: include suspended queues in TLB
 invalidation
Date: Tue, 26 May 2026 13:57:00 +0530
Message-ID: <20260526082700.1383831-6-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260526082700.1383831-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260526082700.1383831-1-tilak.tirumalesh.tangudu@intel.com>
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

From: Nguyen Brian3 <brian3.nguyen@intel.com>

Context-based TLB invalidation currently selects only active exec
queues. During rebind flows, queues may be suspended while still
associated with the VM, causing them to be skipped from invalidation.

Include suspended queues in the ctx invalidation selection path so they
are invalidated as well.

This avoids missing TLB invalidation on suspended queues in LR flows.

Signed-off-by: Nguyen Brian3 <brian3.nguyen@intel.com>
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index ced58f46f846..d85704a5b617 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -225,8 +225,10 @@ static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
 	struct xe_vm *vm;
 	LIST_HEAD(tlb_inval_list);
 	int err = 0, id = guc_to_gt(guc)->info.id;
+	bool has_ctx_tlb_inval = xe->info.has_ctx_tlb_inval;
 
 	lockdep_assert_held(&tlb_inval->seqno_lock);
+	xe_assert(xe, has_ctx_tlb_inval);
 
 	if (xe->info.force_execlist)
 		return -ECANCELED;
@@ -256,8 +258,8 @@ static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
 
 	/*
 	 * Move exec queues to a temporary list to issue invalidations. The exec
-	 * queue must active and a reference must be taken to prevent concurrent
-	 * deregistrations.
+	 * queue must be active or suspended (ctx invalidation path only), and a
+	 * reference must be taken to prevent concurrent deregistrations.
 	 *
 	 * List modification is safe because we hold 'vm->exec_queues.lock' for
 	 * reading, which prevents external modifications. Using a per-GT list
@@ -266,7 +268,9 @@ static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
 	 */
 	list_for_each_entry_safe(q, next, &vm->exec_queues.list[id],
 				 vm_exec_queue_link) {
-		if (q->ops->active(q) && xe_exec_queue_get_unless_zero(q)) {
+		if ((q->ops->active(q) ||
+		     (has_ctx_tlb_inval && xe_exec_queue_is_suspended(q))) &&
+		    xe_exec_queue_get_unless_zero(q)) {
 			last_q = q;
 			list_move_tail(&q->vm_exec_queue_link, &tlb_inval_list);
 		}
-- 
2.46.0

