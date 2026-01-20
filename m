Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8408D2ECF9
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 06:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C5810E074;
	Tue, 20 Jan 2026 06:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AaOn/Upv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9483A10E074
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 06:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768889362; x=1800425362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0StWIkKTnb3mWf+M5VlG00Inf5OvNwGLIqcKd1Lba1g=;
 b=AaOn/Upv7dV/3TT4iaaJuuP6jo/ydByB8iSJzTyGIStzCzpgnXf3M5zV
 aW5o3LrQheGJLEB5RqJxIAY2QDdX+A4NhZzKIBo5dJLW0UZYYFGCcMKne
 R6426zG8HaUoIrqteBGoq6fmejkYCSdDuODmedZnzb81rIryMkR3MJzvb
 Qf6N8mH/HPahRM0V3QpuAz+BiX5/kPod7XqwJLdhOJp3wIOcQD9yD0Dcl
 ZDnFRJ+UpdP+b7F3lyWwdV8wEWcZuLzTCP31rALFHv17nM56vdOBYViDt
 6Fg9zQdhoUhbg0AhxdqIPnH1VWwx6snZ2MRnIUmm8+6BkrR+GvZc5rq0D A==;
X-CSE-ConnectionGUID: la+h17FLSEiq7EhlkAxp1A==
X-CSE-MsgGUID: XUbF7yrcReWdN2CUUudZIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="72676992"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="72676992"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 22:09:22 -0800
X-CSE-ConnectionGUID: biFBXvtTSvuOUM71mRh9hw==
X-CSE-MsgGUID: Pvw6xWnJQW6Q02jWfdyNuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="205658605"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 22:09:21 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [PATCH v4 4/8] drm/xe/bo: Handle CPU faults on purged buffer objects
Date: Tue, 20 Jan 2026 11:38:50 +0530
Message-ID: <20260120060900.3137984-5-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120060900.3137984-1-arvind.yadav@intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
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

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d0a6d340b255..cc547915161d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1934,6 +1934,12 @@ static vm_fault_t xe_bo_cpu_fault_fastpath(struct vm_fault *vmf, struct xe_devic
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
@@ -2024,6 +2030,12 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
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

