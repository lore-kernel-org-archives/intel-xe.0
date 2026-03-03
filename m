Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D34DEDA685
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 15:20:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4132110E834;
	Tue,  3 Mar 2026 15:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJGqwuOx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B749F10E834
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 15:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772551246; x=1804087246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iCknHQXOVbfOZyPKxDYvPUukBPxAOHZqFuLYIL6KbCU=;
 b=iJGqwuOxhe/JeSZh9lbOjVvZdkQjD4v3HUTEKg6DcsCQG/RkGbULNKf2
 tVDz5Axpnu5dIbGGcfhXLenSaIE+Zi4s76KmVOB9XmZsjjJ941URiJWUU
 Uzkno+GONf1gmWXPpKJFIcrvy8dh7e50h8e7MjiuleZqwdx0SawTltpmV
 a/YRO/uhcuaZuO7zyItAnvKsgfaa/NuVdKEq9wsqIpy32fROwvzuYUT/8
 JLejIv23062ZX8QWU0f9NYLDJkddG9WTB2WcIQr2FezTCwzv09a1waf9I
 qJwUJrdb4bxi3u20BF4bUI1dcFdbTKJPD68xzFgHYkxQwNfGmxDqQIijU A==;
X-CSE-ConnectionGUID: kKgElm1GSW2IzupVvGk3DA==
X-CSE-MsgGUID: 9P8GyXcvQBW2ZawqcmfSGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73655914"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73655914"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:20:46 -0800
X-CSE-ConnectionGUID: 7PRCfIAVSfKPzdobZbDnBw==
X-CSE-MsgGUID: 35bNY9rfRUuirDd4i6NEAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="222506863"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:20:45 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [PATCH v6 04/12] drm/xe/bo: Block CPU faults to purgeable buffer
 objects
Date: Tue,  3 Mar 2026 20:50:00 +0530
Message-ID: <20260303152015.3499248-5-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303152015.3499248-1-arvind.yadav@intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
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

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 513f01aa2ddd..d05a73756905 100644
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

