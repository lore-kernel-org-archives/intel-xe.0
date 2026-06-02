Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695D5CD6E68
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 16:36:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AC910F392;
	Tue,  2 Jun 2026 16:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WFp/cH5f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F1310F391
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jun 2026 16:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780418160; x=1811954160;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=WPOSMXVr90wOpCrPxbLJ2XnOY9zqVbUPLBwovMGasTY=;
 b=WFp/cH5f4ZdNMPMl6rUfe5jn1K3r3JYVOAGoHJDNLuVJijHECwV/R9Vp
 aW9nRfEj3N3jyinFMr9YVv76A8b4eWLepdbsF+IcFuxZ0KfljMtaJ+hcj
 Yb3ON7EDsRAIAQMwDKQG5H41yynpQPZpRDkaHHnWNMH6MeemulAJc230S
 arfdmpYwYcuX5yUC35NXjyTXdFEDTZmDiT6fXYTWo8XIRZK8qzpzT6kRm
 lVLWqjLl5/aqLWIDakqDYWpNnLCPkdMxxlnEVzLXb6d5VZzbMknqrq21z
 GDgpAmkfLK4xLwI2dbcuMf9qGxXxykC3cZmOdjZB69qPWFPzHjnARg5TH Q==;
X-CSE-ConnectionGUID: w8iXawt5TFCk99WorhPBpg==
X-CSE-MsgGUID: 0bpmetbmSjGCW15bLhakxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="83792004"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="83792004"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 09:36:00 -0700
X-CSE-ConnectionGUID: nxsNDVw4SoScQW5eIPyz+w==
X-CSE-MsgGUID: oTsxbyPtRp+s9vOxu3Z1yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="243798997"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa008.jf.intel.com with ESMTP; 02 Jun 2026 09:35:59 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, daniele.ceraolospurio@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/xe: explicit TLB flush for context based tlb
 invalidation
Date: Tue,  2 Jun 2026 22:05:35 +0530
Message-ID: <20260602163535.3124689-4-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260602163535.3124689-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260602163535.3124689-1-tilak.tirumalesh.tangudu@intel.com>
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
Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
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

