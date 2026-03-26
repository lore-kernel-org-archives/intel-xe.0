Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D108310A62CA
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 13:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE6B10E2D5;
	Thu, 26 Mar 2026 13:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MiKqHw+Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE8D10E2B3
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 13:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774530545; x=1806066545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7O7p6H8d9LSQBwXyMMjDd+wJGgEqpxP/elca0T2BhzE=;
 b=MiKqHw+QgOwQlux6/Z3Wiylq507bT+HSEr+/Nya5Xx0oA3oMfNXCxCpL
 cqcMm88xvOArL9rY4qayQSMNLGyOqMj+0zsFkDC3YRJ6j2jQSV8G0ujyY
 ZE/Uwfhsi8X3vme2UJY9cwN/i54qakwnt/yKIrmdZFIAD1D6k2hiT8KuL
 i90PkP+uW20p2rYypzykw2kaxay6wij5VfTaaQHEjs9VIDVkBSlruYh2w
 GTqelvcnURoFLwJvwxggyO2t8lBRMZ97j6BtCdrkjSyyUsvgWPhk6uyEe
 f7/gQiUVUSBNVxRTvePgtGmARTUCcF0o89g6Yl/vbym1xh9XWBeGHfft3 Q==;
X-CSE-ConnectionGUID: c0apB1a0T5q+BaZFH7BfJw==
X-CSE-MsgGUID: SxD7O2myRtyJDPuSdkZKHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75784770"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75784770"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 06:09:05 -0700
X-CSE-ConnectionGUID: RDZtlEikRkmKntMmMimR6g==
X-CSE-MsgGUID: 05wf4vKST72UcEF3Q9Dd8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="224070534"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 06:09:02 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v9 04/12] drm/xe/bo: Block CPU faults to purgeable buffer
 objects
Date: Thu, 26 Mar 2026 18:38:30 +0530
Message-ID: <20260326130843.3545241-5-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326130843.3545241-1-arvind.yadav@intel.com>
References: <20260326130843.3545241-1-arvind.yadav@intel.com>
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

Block CPU page faults to buffer objects marked as purgeable (DONTNEED)
or already purged. Once a BO is marked DONTNEED, its contents can be
discarded by the kernel at any time, making access undefined behavior.
Return VM_FAULT_SIGBUS immediately to fail consistently instead of
allowing erratic behavior where access sometimes works (if not yet
purged) and sometimes fails (if purged).

For DONTNEED BOs:
- Block new CPU faults with SIGBUS to prevent undefined behavior.
- Existing CPU PTEs may still work until TLB flush, but new faults
  fail immediately.

For PURGED BOs:
- Backing store has been reclaimed, making CPU access invalid.
- Without this check, accessing existing mmap mappings would trigger
  xe_bo_fault_migrate() on freed backing store, causing kernel hangs
  or crashes.

The purgeable check is added to both CPU fault paths:
- Fastpath (xe_bo_cpu_fault_fastpath): Returns VM_FAULT_SIGBUS immediately
  under dma-resv lock, preventing attempts to migrate/validate
  DONTNEED/purged pages.
- Slowpath (xe_bo_cpu_fault): Returns -EFAULT under drm_exec lock,
  converted to VM_FAULT_SIGBUS.

This matches i915 semantics for purged buffer handling.

v2:
  - Added xe_bo_is_purged(bo) instead of atomic_read.
  - Avoids leaks and keeps drm_dev_exit() while returning.

v3:
  - Move xe_bo_is_purged check under a dma-resv lock (Matthew Brost)

v4:
  - Add purged check to fastpath (xe_bo_cpu_fault_fastpath) to prevent
    hang when accessing existing mmap of purged BO.

v6:
  - Block CPU faults to DONTNEED BOs with VM_FAULT_SIGBUS. (Thomas, Matt)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 40fb19d2c1a7..7da374c7a44e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1982,6 +1982,16 @@ static vm_fault_t xe_bo_cpu_fault_fastpath(struct vm_fault *vmf, struct xe_devic
 	if (!dma_resv_trylock(tbo->base.resv))
 		goto out_validation;
 
+	/*
+	 * Reject CPU faults to purgeable BOs. DONTNEED BOs can be purged
+	 * at any time, and purged BOs have no backing store. Either case
+	 * is undefined behavior for CPU access.
+	 */
+	if (xe_bo_madv_is_dontneed(bo) || xe_bo_is_purged(bo)) {
+		ret = VM_FAULT_SIGBUS;
+		goto out_unlock;
+	}
+
 	if (xe_ttm_bo_is_imported(tbo)) {
 		ret = VM_FAULT_SIGBUS;
 		drm_dbg(&xe->drm, "CPU trying to access an imported buffer object.\n");
@@ -2072,6 +2082,15 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
 		if (err)
 			break;
 
+		/*
+		 * Reject CPU faults to purgeable BOs. DONTNEED BOs can be
+		 * purged at any time, and purged BOs have no backing store.
+		 */
+		if (xe_bo_madv_is_dontneed(bo) || xe_bo_is_purged(bo)) {
+			err = -EFAULT;
+			break;
+		}
+
 		if (xe_ttm_bo_is_imported(tbo)) {
 			err = -EFAULT;
 			drm_dbg(&xe->drm, "CPU trying to access an imported buffer object.\n");
-- 
2.43.0

