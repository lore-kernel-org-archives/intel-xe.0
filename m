Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCC7EC01B3
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 09:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DD010E48F;
	Mon, 23 Mar 2026 09:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8xt3o2s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF5010E3E3
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 09:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774258282; x=1805794282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OCWnvDJTHbVn/oudB8yq0wzfqfTe9G1NhqExXKif7ZI=;
 b=N8xt3o2syOmE51n4Tjl2UNULRVh7mq9fCpgrFeRzZLBVSEyUrfUdK0f4
 EAD7zZUh+dNylblFWX3KUrE4sHTjPCQEYK6yzqy17vA+hSI5kBienqZn6
 UQRlpE8g3wGzwtcUKu08CGegN/v9iM2Gu/xxl8sKWx3wipetbxhVnYtvH
 zef9Nt11V3+1uJiuYHAsAe0rLstQfIcafcts37n8s0VaKO7vCqO8VUS8Q
 06Hl3Ch/m1XZO0Bs+/W1AkMWX3NapbyDRu5g1FcB0lDLgXl2tz3eOTD9h
 HjDqayThX7zxrL16UaOZ2v7x2js9/ot4ECERnaLDMgmhgHyhJ8/ikgDdT w==;
X-CSE-ConnectionGUID: fgmHf+kFQfyE3wijEpLsuQ==
X-CSE-MsgGUID: 48W5nLlPTEaXjkSFU6RN9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75221755"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75221755"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:31:22 -0700
X-CSE-ConnectionGUID: SEIAVdfaTL+z1vi79Dn0UQ==
X-CSE-MsgGUID: fxyGAIctQs68CLuyXtdVeg==
X-ExtLoop1: 1
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:31:21 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v7 04/12] drm/xe/bo: Block CPU faults to purgeable buffer
 objects
Date: Mon, 23 Mar 2026 15:00:53 +0530
Message-ID: <20260323093106.2986900-5-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323093106.2986900-1-arvind.yadav@intel.com>
References: <20260323093106.2986900-1-arvind.yadav@intel.com>
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
index b6055bb4c578..da18b43650e3 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1979,6 +1979,16 @@ static vm_fault_t xe_bo_cpu_fault_fastpath(struct vm_fault *vmf, struct xe_devic
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
@@ -2069,6 +2079,15 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
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

