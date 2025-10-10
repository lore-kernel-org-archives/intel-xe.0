Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47465CCA476
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 10:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB7A10EBA8;
	Fri, 10 Oct 2025 10:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Na4sktcr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9439C10EBC2
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 10:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760092932; x=1791628932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dS3YiR+dwndIN5ko/UzHFIhVyFM1gKrs572y/FhGg/s=;
 b=Na4sktcriOfq79NxXdGIWPH8OtnI86NBvWViT/vPJeX0Vsqx4baQYBNJ
 8MX+85Mm1Uqb8KDhC2gs1VNj5VlwcxCJgEVKmwLMUDDUIL93S5IHc1bIK
 WlZSNTcErN/lrNZcqqr0cNFSQmuEO6vTcPrpTHSQ7Wgw9wsNbi1c2b7on
 NhVmiaPdi75ty46rfNo4SquI7npihdiNHM5CgubPsQZIti7pv1+3/D8q8
 E0YPuvwPrDGepKmEV65lsXivfd20UuHB/qALImMiTWxzw/mEaSpvKVxcL
 ZHUWzLJr+RMWd8m3g2+tKGDxi2bAgSQBsJNEjwWp3uYD8pFwp3kewLVtd w==;
X-CSE-ConnectionGUID: oQqwZiZPSGSvu3rsNSPbUQ==
X-CSE-MsgGUID: splpOCpvRhKCdzOjRpy1Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="66166184"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="66166184"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 03:42:12 -0700
X-CSE-ConnectionGUID: 3B8LfEyITpS48CEajnumgA==
X-CSE-MsgGUID: J0P3sYLwToiyz6EXH7mIbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="186214904"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.154])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 03:42:11 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 1/2] drm/xe/svm: Ensure data will be migrated to system if
 indicated by madvise.
Date: Fri, 10 Oct 2025 12:41:48 +0200
Message-ID: <20251010104149.72783-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010104149.72783-1-thomas.hellstrom@linux.intel.com>
References: <20251010104149.72783-1-thomas.hellstrom@linux.intel.com>
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

If the location madvise() is set to
DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, the drm_pagemap in the
SVM gpu fault handler will be set to NULL. However there is nothing
that explicitly migrates the data to system if it is already present
in device memory.

In that case, set the device memory owner to NULL to ensure
data gets properly migrated to system on page-fault.

v2:
- Remove redundant dpagemap assignment (Himal Prasad Ghimiray)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1
---
 drivers/gpu/drm/xe/xe_svm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 7e2db71ff34e..ef8c7aa485b5 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1034,6 +1034,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (err)
 		return err;
 
+	dpagemap = xe_vma_resolve_pagemap(vma, tile);
+	if (!dpagemap && !ctx.devmem_only)
+		ctx.device_private_page_owner = NULL;
 	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
 
 	if (IS_ERR(range))
@@ -1054,7 +1057,6 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	range_debug(range, "PAGE FAULT");
 
-	dpagemap = xe_vma_resolve_pagemap(vma, tile);
 	if (--migrate_try_count >= 0 &&
 	    xe_svm_range_needs_migrate_to_vram(range, vma, !!dpagemap || ctx.devmem_only)) {
 		ktime_t migrate_start = xe_svm_stats_ktime_get();
-- 
2.51.0

