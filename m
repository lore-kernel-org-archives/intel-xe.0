Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E835C3600D
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 16:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D993810E4A0;
	Mon, 24 Mar 2025 16:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GejiZIU9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D6210E49D
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Mar 2025 16:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742835330; x=1774371330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RRB56Ol2hZt+jmU83bACLQOdbyzngocewERBTk+1LYo=;
 b=GejiZIU9M1u+8Se+6vMk9BKATtEMBDmGDmOqypHU+wBQMUWPfj3F81Ry
 9nCzjptXaZr3CENjzJEZcp1u9l2xhyRs6Mj1eWuJsHPJs0zBLv18/+7oO
 6ECHKnQWnFBoobsQgkHAchu9G/wwTELOBOO3cJuoeI1EOe5NcKqkHro5S
 wB35ziDFHDyotf4MYHHxl0uRxhpWmd76nZtG7hFgkrUwt08zP2u5pVy7X
 Z3uM6rqzSlQ1atKeAQ/UffpHWvohxXfWFCHM+RMdmErlVaZI4j3Ui4KHE
 Yqs3CQwG9mEl478QfYwd8DFSj39+A2khki0X4SNOZpl5oKir6jAoklP5O A==;
X-CSE-ConnectionGUID: AMECjY6NTO2zHfPJ7i3+4A==
X-CSE-MsgGUID: ZEG3uLknQGS2yo4PjuvQoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="54257248"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="54257248"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 09:55:29 -0700
X-CSE-ConnectionGUID: 5HwMT5ouRICPqNltSJBGQw==
X-CSE-MsgGUID: i4hwweZkRQex2tQ94MErRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="123912034"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.77])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 09:55:24 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, himal.prasad.ghimiray@intel.com,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v3 2/5] drm/xe/svm: Fix a potential bo UAF
Date: Mon, 24 Mar 2025 17:54:57 +0100
Message-ID: <20250324165500.20680-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250324165500.20680-1-thomas.hellstrom@linux.intel.com>
References: <20250324165500.20680-1-thomas.hellstrom@linux.intel.com>
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

If drm_gpusvm_migrate_to_devmem() succeeds, if a cpu access happens to the
range the bo may be freed before xe_bo_unlock(), causing a UAF.

Since the reference is transferred, use xe_svm_devmem_release() to
release the reference on drm_gpusvm_migrate_to_devmem() failure,
and hold a local reference to protect the UAF.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 52613dd8573a..c7424c824a14 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -702,11 +702,14 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 	list_for_each_entry(block, blocks, link)
 		block->private = vr;
 
+	xe_bo_get(bo);
 	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
 					   &bo->devmem_allocation, ctx);
-	xe_bo_unlock(bo);
 	if (err)
-		xe_bo_put(bo);	/* Creation ref */
+		xe_svm_devmem_release(&bo->devmem_allocation);
+
+	xe_bo_unlock(bo);
+	xe_bo_put(bo);
 
 unlock:
 	mmap_read_unlock(mm);
-- 
2.48.1

