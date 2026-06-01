Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE042CD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 14:30:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759BE10E80A;
	Mon,  1 Jun 2026 14:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W8K0q5y9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B46B10E80A
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 14:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780324231; x=1811860231;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EHTjUAz3dJs2IFMrOmS2WieJU0rZgHfZRhWOVtYxRp4=;
 b=W8K0q5y9iVzxfA/3XLg2/r45ewdiOXvPkm257klAHL7cFmDb9TM8axvE
 xNsle1gWkgRCfCoWWJVMUzgRCXzpR2rDiAncrVCM78xC+XUpzUDbPxArE
 MoLrzjuxA5XZd308FB8SH74jKlHJ4FWRdNhj7GKjei0yezsUtfWoPCK75
 8xAjdsxpB8ZYrh8Ft0sEm4ZpOIpAwGp8sT2hUN+OaT6aA3uURwuQLsHFl
 v54im0RQNcQH1qsdCBegoepukmPu/Zi5gY0YoB172216E6FzBxkFeWkYf
 LMn3Bzk9p7G5BgFQj6oknbHMpb6kJvy/U8H1W6ELTzBpj6npZDXeTdP00 g==;
X-CSE-ConnectionGUID: 3YPRUGF2QsGV67MG3wxN9A==
X-CSE-MsgGUID: WEPZ3LspRgaph8NorK8G/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="92195399"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="92195399"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 07:30:31 -0700
X-CSE-ConnectionGUID: 23QPPpe3RY6H6HbjPoTUKQ==
X-CSE-MsgGUID: KgZVspkDSXW+ImSovBxzVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="245408806"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa004.fm.intel.com with ESMTP; 01 Jun 2026 07:30:29 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, matthew.d.roper@intel.com,
 thomas.hellstrom@intel.com, daniele.ceraolospurio@intel.com,
 matthew.auld@intel.com, stuart.summers@intel.com, x.wang@intel.com,
 brian3.nguyen@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/xe: explicit TLB flush for context based tlb
 invalidation
Date: Mon,  1 Jun 2026 20:00:00 +0530
Message-ID: <20260601143000.2830227-4-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260601143000.2830227-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260601143000.2830227-1-tilak.tirumalesh.tangudu@intel.com>
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

v3: Knit-Remove unrelated change.-Thomas

Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 6 ++++++
 1 file changed, 6 insertions(+)

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
-- 
2.46.0

