Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1E6CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 13:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB3E10EA3D;
	Thu,  9 Oct 2025 13:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U3m3cpBS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01B610EA3D
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 13:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760015194; x=1791551194;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1Nb1UrgImVIUG1zfYuLdOHWhP17ztMJiM3tUP/ENfuY=;
 b=U3m3cpBSjttTb7jTNU/J21O5ADzwXn94lCt4tsFmg072/t9rjxn0HYr8
 GYo7EDR2VBV+LrJW+aliqEX+dSOq8I6QMQjrNeYFtraZ61+CtWHwO74P3
 VIqY8bFtTPRwfybmpzsDGUXOLUD/dChY8nQojlG05RyjgrEKD4KuQijQB
 BJ5508iOyUWA6CQRz4nthnIgKbNRRy/7I/thDMYJkHZUJPThcKMEUKsms
 nIKkj/ftAsv4CuH2IQGC2NjAS/7oZKFfR3A5xNwhaJye7W6C2cduwNHs1
 zEwWmQ2+m9YoQzI8ZdpHsoXFFN7sIbsxWXycVkYZhTwTPVW48I5mNepDl w==;
X-CSE-ConnectionGUID: htFaCoQuTVqurYSNU1uJpw==
X-CSE-MsgGUID: 52i0XhyGTb+hFsZOd4INdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62265249"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="62265249"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 06:06:34 -0700
X-CSE-ConnectionGUID: h6r7SwIORhWCyO6ddpSKVw==
X-CSE-MsgGUID: lV1rup4YToKXHXvs8t+tCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="180734009"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 06:06:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com
Subject: [PATCH] drm/xe: Handle mixed mappings and existing VRAM on atomic
 faults
Date: Thu,  9 Oct 2025 06:06:29 -0700
Message-Id: <20251009130629.3531962-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Moving to VRAM will fail if mixed mappings are present or if the page is
already located in VRAM. Atomic faults that require a move to VRAM
currently retry without attempting to evict mixed mappings or locate
existing VRAM mappings.

This patch fixes the issue by attempting to evict mixed mappings or find
existing VRAM pages when a move to VRAM fails during atomic fault
handling.

Fixes: a9ac0fa455b0 ("drm/xe: Strict migration policy for atomic SVM faults")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 7e2db71ff34e..b268ee0d2271 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1073,7 +1073,17 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 				drm_dbg(&vm->xe->drm,
 					"VRAM allocation failed, falling back to retrying fault, asid=%u, errno=%pe\n",
 					vm->usm.asid, ERR_PTR(err));
-				goto retry;
+
+				/*
+				 * In the devmem-only case, mixed mappings may
+				 * be found. The get_pages function will fix
+				 * these up to a single location, allowing the
+				 * page fault handler to make forward progress.
+				 */
+				if (ctx.devmem_only)
+					goto get_pages;
+				else
+					goto retry;
 			} else {
 				drm_err(&vm->xe->drm,
 					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
@@ -1083,6 +1093,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		}
 	}
 
+get_pages:
 	get_pages_start = xe_svm_stats_ktime_get();
 
 	range_debug(range, "GET PAGES");
-- 
2.34.1

