Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B38CD6E44
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 12:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7349410F129;
	Thu, 28 May 2026 12:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQAZfpcb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6A010F129
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 12:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779972251; x=1811508251;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+ol79kYlhpxInyphS1UhzxNXoWm31QDdtoZjJGLJa1g=;
 b=dQAZfpcbYV06z/2oTY9X7uKFF+0fnecEk+YO+1Qk+E+/q+NsgfngjkXG
 3x3gU5S0mu16SYhAi+35kxQXflmw+nIEtVMx+bI5D1XYGq5ferAZalyKi
 Aa9Q9+1zFuNk3NPWQmhn+eXfthChhfmHBqPs1lpboqq/8uwwvziKr+CnF
 Lz+LtM4XmfIIBk8qFNltvxY0psQs6buS7dQ2bTYgodjdzGRTufPBKj5Ye
 dzWm+xKzk1v1q0S+tOvmZ0sn89hZub/2tOx6g9G3S3LpNM+Jhb3GXdnIK
 i53BfukySKLP6Ie4mEvLf6/O5DGzDqKZ9bFndl4O+7nzbtJMTosUNXp0O g==;
X-CSE-ConnectionGUID: 7hfyWPkNQu6Ug7CJcJgjbQ==
X-CSE-MsgGUID: /eAR2qUUSLiOHgEOBrrXHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91499324"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="91499324"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 05:44:11 -0700
X-CSE-ConnectionGUID: zhK3wPrvTsmvYVE38y9C5A==
X-CSE-MsgGUID: UsJsWqxTQreQXEUTlM45Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="272871037"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa002.jf.intel.com with ESMTP; 28 May 2026 05:44:08 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, matthew.d.roper@intel.com,
 thomas.hellstrom@intel.com, daniele.ceraolospurio@intel.com,
 matthew.auld@intel.com, stuart.summers@intel.com, x.wang@intel.com,
 brian3.nguyen@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/xe: explcit TLB flush for context based tlb
 invalidation
Date: Thu, 28 May 2026 18:13:40 +0530
Message-ID: <20260528124340.1864215-4-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260528124340.1864215-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260528124340.1864215-1-tilak.tirumalesh.tangudu@intel.com>
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

In LR preempt-fence mode, on devices with context based
TLB Invalidation, rebind operations for VMAs require
an explicit invalidation request.

Request explicit TLB Invalidation in notifier path
and in PT path.

Userptr VMAs are excluded in PT path since the notifier path
already submits invalidation, preventing duplicate
requests for the same rebind window.

v2: Remove explicit TLB Invalidation in notifier path as
PT path is sufficient.
Refactor of above to remove exclusion of userptr VMAs n
PT path.- Thomas

Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c      | 6 ++++++
 drivers/gpu/drm/xe/xe_userptr.c | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 2669ff5ee747..15ce77ce7793 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2010,6 +2010,9 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 		 * automatically when the context is re-enabled by the rebind worker,
 		 * or in fault mode it was invalidated on PTE zapping.
 		 *
+		 * If rebind, we have to invalidate TLB on context based TLB invalidation
+		 * LR vms, as they cannot be relied on context re-enable.
+		 *
 		 * If !rebind, and scratch enabled VMs, there is a chance the scratch
 		 * PTE is already cached in the TLB so it needs to be invalidated.
 		 * On !LR VMs this is done in the ring ops preceding a batch, but on
@@ -2019,6 +2022,9 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
 		     xe_vm_in_lr_mode(vm)))
 			pt_update_ops->needs_invalidation = true;
+		else if (pt_op->rebind && xe_vm_in_preempt_fence_mode(vm) &&
+			 vm->xe->info.has_ctx_tlb_inval)
+			pt_update_ops->needs_invalidation = true;
 		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
 			/* We bump also if batch_invalidate_tlb is true */
 			vm->tlb_flush_seqno++;
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 6761005c0b90..78f9b520492b 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -102,7 +102,7 @@ xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvma, bool is_d
 				    false, MAX_SCHEDULE_TIMEOUT);
 	XE_WARN_ON(err <= 0);
 
-	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
+	if ((xe_vm_in_fault_mode(vm) && userptr->initial_bind)) {
 		if (!userptr->finish_inuse) {
 			/*
 			 * Defer the TLB wait to an extra pass so the caller
-- 
2.46.0

