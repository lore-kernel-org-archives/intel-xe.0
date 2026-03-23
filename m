Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9D6F483F8
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 21:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701DB10E4A2;
	Mon, 23 Mar 2026 21:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4tHYl3c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8085E10E4A2
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 21:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774300668; x=1805836668;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fxHvkKE7AP+VJgPJs+pXHe0Vf8oNQESxhiBmxOnVOvg=;
 b=f4tHYl3chRijVu5dXKzsmnul08LtmRe4QXQfETyPO/iNFImmPQ3W+n77
 3dB/+viVfxs4+cEMw8lzaEZ47lWYCRIimFYGB689x+k9Yz7862pyq6L/U
 wQTGTU4igqwkcoZf+u0AJoSVdRaQgY8cQ2F/uuTS4sc7ZcXoy16iNwxqe
 I3EeySLfF53OEIYin2NqawR6veMcxdxLTeUKxTNfyQ7+p06C/2H3xHG/U
 4DpkC1l62L3NKbHFbvLlQv/sqvA+Vv2kNPkezl8ichTxA+nUZuq6IACHR
 qpPebo8OQL6kvhe95I8PaY908pmy2XZgciGSd+DutoRXWP0GvYDaA3OYJ Q==;
X-CSE-ConnectionGUID: Lh+TssyWT5qtTcuoU0Tm2w==
X-CSE-MsgGUID: 0X4C5/IkQXGXDD4teJNjiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74492842"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="74492842"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 14:17:46 -0700
X-CSE-ConnectionGUID: gItJ5wlVRwGGhBtAhIPcWg==
X-CSE-MsgGUID: PZIueBSeTSqLsdQbDSZmDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="224160186"
Received: from dut4407arlh.fm.intel.com ([10.105.10.83])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 14:17:46 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, niranjana.vishwanathapura@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH] drm/xe: Always invalidate TLBs on userptr invalidation
Date: Mon, 23 Mar 2026 21:17:42 +0000
Message-ID: <20260323211743.285064-1-stuart.summers@intel.com>
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

Right now we are only invalidating TLBs when we are
running in fault mode. For non-fault mode based userptr
VMs, we then rely on context switches after an MMAP has
happened to ensure the TLB is clean for the next submission.

With context based TLB invalidation, we can no longer rely
on the implicit invalidation happening during context switch,
so remove the fault mode limiter and simply always perform
that invalidation.

I was able to see this behavior using the following test:
xe_exec_compute_mode --r twice-userptr-invalidate

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_userptr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 6761005c0b90..dfd679dd98d9 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -102,7 +102,7 @@ xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvma, bool is_d
 				    false, MAX_SCHEDULE_TIMEOUT);
 	XE_WARN_ON(err <= 0);
 
-	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
+	if (userptr->initial_bind) {
 		if (!userptr->finish_inuse) {
 			/*
 			 * Defer the TLB wait to an extra pass so the caller
-- 
2.43.0

