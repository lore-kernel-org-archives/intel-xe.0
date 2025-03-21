Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431D8C36005
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 16:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C1E10E195;
	Fri, 21 Mar 2025 16:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8NFSyDa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F8610E17C
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Mar 2025 16:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742574875; x=1774110875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RRB56Ol2hZt+jmU83bACLQOdbyzngocewERBTk+1LYo=;
 b=G8NFSyDa2Me+J0DDpak2D0mQuBaOfhHlpuC7FSiFzdDtDi5BlPeKmuRU
 H1QRRTUs30PXtdaiIGj6QylLIEOPF01EAK83cQ1GUDl3Cp/spukhmj0lM
 So0n4PrlExR2LFCg+lcVPElv98w7IefXE4UIDfSrc0TF9uve90M6Dvt9K
 FMliZ2wVhn4wqABc9q7gH2gb8Aa3sqS+sw1iqe9P2OaAsU+xmDW/I9S75
 1F8CvjzEvaf2LuEjzJfV/PH3gtqwZeUU0NJuoNdjAjbRqg8FosaWotjwB
 tuhWl2DJFwk7xiEhMyUwdxvAAjza+uYj9851NeajgvQwKypd/2Iuoamxi g==;
X-CSE-ConnectionGUID: qWy2RFT0QwWN3G7zaAd1tw==
X-CSE-MsgGUID: oAd+js0bT0K2lAm7KyO3dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43725621"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="43725621"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 09:34:35 -0700
X-CSE-ConnectionGUID: qCbCyIrORRKYVzOdRCWmJA==
X-CSE-MsgGUID: eYFGEEedTF26t1k5dszltA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="128665381"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 09:34:33 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, himal.prasad.ghimiray@intel.com,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 2/5] drm/xe/svm: Fix a potential bo UAF
Date: Fri, 21 Mar 2025 17:34:13 +0100
Message-ID: <20250321163416.45217-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250321163416.45217-1-thomas.hellstrom@linux.intel.com>
References: <20250321163416.45217-1-thomas.hellstrom@linux.intel.com>
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

