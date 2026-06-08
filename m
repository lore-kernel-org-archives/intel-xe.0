Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE71BCD6E79
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:28:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B0A10F6ED;
	Mon,  8 Jun 2026 16:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IG52ZQZl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECA010F6ED
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780936089; x=1812472089;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2nt49AScAE7TppioqpmeqUzXG9whkAq5/BjY1+zOUT0=;
 b=IG52ZQZlfpUgqVCASdTj5/5fWw4gelgizVb6c12stYgcRDfMAHa2P6zU
 34mM09p2aMuZPFIeMDOdgJfg0/BgGNWNUY4P3anxdojCEkTuPsMZl/UEq
 gylGQp4nErp0ylisJndBIC2LiMgPzz40kXyz56SZRAMRLAksEzTGpRwwR
 FmW1bMAkSyGtbS8mk97E0oxrIaAGvWcmtvv3mF3R71WAuEiZ/H51In+4B
 6cZ7ndyR+m5du0nkZzsqsBVS8gFWlybRwc8pJHzcGMjMSZTYU+nbY37VX
 FBKEFGKaUCqTzmhzaTgOw3mMs6FKJ/NYr2gLa56loMzkoYss/YKxkJmMX A==;
X-CSE-ConnectionGUID: MoqBgd9tTjeeZf8aupHCQg==
X-CSE-MsgGUID: w0wDADvkR4W8oCCaeJiIig==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="80704057"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="80704057"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:28:09 -0700
X-CSE-ConnectionGUID: W21MHvF1Q6OKTMc3IBA3tA==
X-CSE-MsgGUID: 2bnoDJXXRz+RP4xzWYei4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="242632666"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa007.fm.intel.com with ESMTP; 08 Jun 2026 09:28:07 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, thomas.hellstrom@intel.com,
 daniele.ceraolospurio@intel.com, matthew.auld@intel.com,
 stuart.summers@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe: include all registered queues in TLB invalidation
Date: Mon,  8 Jun 2026 21:57:44 +0530
Message-ID: <20260608162745.338725-2-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260608162745.338725-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260608162745.338725-1-tilak.tirumalesh.tangudu@intel.com>
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Context-based TLB invalidation currently selects only scheduling-active
exec queues via q->ops->active(). During rebind flows, queues may be
suspended (or transitioning through resume) while still owning valid
translations, causing them to be skipped from invalidation and leading
to missed TLB invalidations on LR rebinds.

The underlying issue is a TOCTOU: q->guc->state bits are flipped lock-free
from enable_scheduling(), disable_scheduling{,_deregister}(), the
suspend/resume sched-msg handlers, handle_sched_done(), and
guc_exec_queue_stop(); nothing in send_tlb_inval_ctx_ppgtt() serializes
against them, so any state-based predicate can race.

Include all the registered queues so that TLB invalidations are not
missed. This is race-free because list membership on vm->exec_queues.list
is stable under vm->exec_queues.lock held by the caller. The performance
impact is expected to be minimal and harmless. If it does turn out to be
a concern, we can come back with a race-safe solution to ignore certain
queues.

Fixes: 6cdaa5346d6f ("drm/xe: Add context-based invalidation to GuC TLB invalidation backend")
Assisted-by: Claude:claude-opus-4.6
Suggested-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index ced58f46f846..cf6d106e6036 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -255,9 +255,8 @@ static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
 #undef EXEC_QUEUE_COUNT_FULL_THRESHOLD
 
 	/*
-	 * Move exec queues to a temporary list to issue invalidations. The exec
-	 * queue must active and a reference must be taken to prevent concurrent
-	 * deregistrations.
+	 * Move exec queues to a temporary list to issue invalidations. A
+	 * reference must be taken to prevent concurrent deregistrations.
 	 *
 	 * List modification is safe because we hold 'vm->exec_queues.lock' for
 	 * reading, which prevents external modifications. Using a per-GT list
@@ -266,7 +265,7 @@ static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
 	 */
 	list_for_each_entry_safe(q, next, &vm->exec_queues.list[id],
 				 vm_exec_queue_link) {
-		if (q->ops->active(q) && xe_exec_queue_get_unless_zero(q)) {
+		if (xe_exec_queue_get_unless_zero(q)) {
 			last_q = q;
 			list_move_tail(&q->vm_exec_queue_link, &tlb_inval_list);
 		}
-- 
2.46.0

