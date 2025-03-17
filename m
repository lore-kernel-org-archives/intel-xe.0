Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165EEC35FF3
	for <intel-xe@archiver.kernel.org>; Mon, 17 Mar 2025 10:41:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF95410E273;
	Mon, 17 Mar 2025 10:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SjVxgPTh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF70D10E273
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Mar 2025 10:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742208114; x=1773744114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XyD9AP1tNEBR9EtZyXgTn9w2JTabbGJ6HBZQblevDw8=;
 b=SjVxgPThU40l8fsPsR3kbK/Qjw+wMuUW1qCo2gyhdcLX9grqFbmPx9FJ
 3NEWWQxde16z6VVOnV0K3L0K+PO1y72rjrvdc2h2PyQ80Ucpp5aOBdqGD
 rfd1Bq0B2akmhA5TGqvhgfyDvoUUKFWrtDUgvTsXyFsw0QxUsVrW6bFYX
 5Eg8v9h96cBXzwPZc9xgAqL3zfbCGBgvga4rjCf1TT4KisPlmuJIHL/YM
 3lyShPkS6E5xM0L6HiplPwzsMRmh/8QnS+wJL8WnZMW1iEtXDoK7JHaTs
 BaGKQYPnQjHfPrn0auc2AnHAUOypfyWN7LI34YpzM+bjk6M6ZWuHBBS9u Q==;
X-CSE-ConnectionGUID: h8vSGKEfRyCzA5Eh8QHk3Q==
X-CSE-MsgGUID: oBL7FaiSQxm3mTly6T9HcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="42470914"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="42470914"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 03:41:54 -0700
X-CSE-ConnectionGUID: M32Rw4mZSF6M7R5Mzpsv9A==
X-CSE-MsgGUID: 2FfoMgGOTOmuInDWVTjZ6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="122377075"
Received: from carterle-desk.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.66])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 03:41:52 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 2/5] drm/xe/svm: Fix a potential bo UAF
Date: Mon, 17 Mar 2025 11:41:29 +0100
Message-ID: <20250317104132.8200-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317104132.8200-1-thomas.hellstrom@linux.intel.com>
References: <20250317104132.8200-1-thomas.hellstrom@linux.intel.com>
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
---
 drivers/gpu/drm/xe/xe_svm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index c305d4c351d7..1a8e17a0005d 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -701,11 +701,14 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
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

