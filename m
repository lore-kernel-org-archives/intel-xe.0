Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9C1E9E311
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 15:27:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2330010E622;
	Wed, 11 Feb 2026 15:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3y/4d4p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B192110E616
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 15:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770823627; x=1802359627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FOWeRyAp2KXdvXmK//1BMbRNX9TtjizOD7mbroEg2s0=;
 b=K3y/4d4p2JjAh7VQEjkJ0JVMuE72T/xqyxyQg4raUf9lRv/7r7RMcBDy
 DmrNBaSIu4VsRIzyzgpEmI1EU1eGGDkRs7DuxCCktVldjfNcCSER0g7i6
 HIylKR4/tDQ42uRzDp5aQBNV3cJYg8VMi9yjb0+dvB0Mmm4DfrHep0LWp
 7fp0gJiLyw45/5E8BK4wZGiT20LPRxrtay6vPxm1MYTjrqAs+QEZPoaZk
 cY7DOw3tMmdHGfyrtUFttKys6NokP9rrALml2I/nAduWX25JcaUx7HN2m
 gnU/puDm9ogE8vPyLCpPKA6kTqBqCcVSZvkDOF6+F+GJv7KgoIoI2Gm4W Q==;
X-CSE-ConnectionGUID: 35B0eqC5TyaMMwnQWOBwbQ==
X-CSE-MsgGUID: rFKWv/8cSSC/R3/nBsV8Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89564291"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="89564291"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 07:27:07 -0800
X-CSE-ConnectionGUID: mcOy3iaBR3ClBaM8218TRg==
X-CSE-MsgGUID: jI/Rve+gQmalR/IZLF/x2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211388134"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 07:27:06 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [PATCH v5 4/9] drm/xe/bo: Handle CPU faults on purged buffer objects
Date: Wed, 11 Feb 2026 20:56:33 +0530
Message-ID: <20260211152644.1661165-5-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211152644.1661165-1-arvind.yadav@intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Return error when CPU attempts to access a purged buffer object.
Purged BOs have their backing store reclaimed by the kernel, making
CPU access invalid. The fault handler returns SIGBUS to userspace,
matching i915 semantics.

The purged check is added to both CPU fault paths:
- Fastpath (xe_bo_cpu_fault_fastpath): Returns error immediately
  under dma-resv lock, preventing attempts to migrate/validate freed pages
- Slowpath (xe_bo_cpu_fault): Returns -EFAULT under drm_exec lock,
  converted to VM_FAULT_SIGBUS

Without the fastpath check, accessing existing mmap mappings of purged BOs
would trigger xe_bo_fault_migrate() on freed backing store, causing kernel
hangs or crashes.

v2:
  - Added xe_bo_is_purged(bo) instead of atomic_read.
  - Avoids leaks and keeps drm_dev_exit() while returning.

v3:
  - Move xe_bo_is_purged check under a dma-resv lock (Matthew Brost)

v4:
  - Add purged check to fastpath (xe_bo_cpu_fault_fastpath) to prevent
    hang when accessing existing mmap of purged BO

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 87cde4b2fe59..7ee85c8eadde 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1978,6 +1978,12 @@ static vm_fault_t xe_bo_cpu_fault_fastpath(struct vm_fault *vmf, struct xe_devic
 	if (!dma_resv_trylock(tbo->base.resv))
 		goto out_validation;
 
+	/* Purged BOs have no backing store - fault to userspace */
+	if (xe_bo_is_purged(bo)) {
+		ret = VM_FAULT_SIGBUS;
+		goto out_unlock;
+	}
+
 	if (xe_ttm_bo_is_imported(tbo)) {
 		ret = VM_FAULT_SIGBUS;
 		drm_dbg(&xe->drm, "CPU trying to access an imported buffer object.\n");
@@ -2068,6 +2074,12 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
 		if (err)
 			break;
 
+		/* Purged BOs have no backing store - fault to userspace */
+		if (xe_bo_is_purged(bo)) {
+			err = -EFAULT;
+			break;
+		}
+
 		if (xe_ttm_bo_is_imported(tbo)) {
 			err = -EFAULT;
 			drm_dbg(&xe->drm, "CPU trying to access an imported buffer object.\n");
-- 
2.43.0

