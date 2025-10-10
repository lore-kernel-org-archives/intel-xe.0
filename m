Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B36CCAC5BB
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 10:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7BA10EBB8;
	Fri, 10 Oct 2025 10:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nOYQQbMu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCF810EBB6
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 10:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760092934; x=1791628934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WwR2NpGSSBmfCP6FRTLuSjABUuk2itDBc4LYtXCQC8A=;
 b=nOYQQbMurmaDMzHPhWdNu4Y67ohfKEPFg2blnvCMMFeT3KV1aO0XntU2
 am2NPTkb7JzEnEmLcpLQ2u5l+RYRqX3ZHsnSSfcHiRcRf2W/YnIC62PN3
 l90I+bRYsrsveExUG8K6bQhdsUXnX0ZEgdo8xxUfZx/vMj+4r0xo9O79a
 Pd4f/UJeh8rPBVVNN3axth/+Z2BmigmsRav7TZtXf8v36d/ilcMYjr+zc
 2mIAFK4Dpk1gyLS7l6h4rsCYvgQt6wy0moUC9QpXzTu7QKqTTsr7MvY6a
 BTXH2pBUzSooqwFVpMiSGzXhIyvmIPJIAbwI5V5nWqUFPHMWPkof7lChb Q==;
X-CSE-ConnectionGUID: DhhsbtoFSXOLSLvD7WV36A==
X-CSE-MsgGUID: 91/MmMHzTRuzLkQnMJXTSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="66166186"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="66166186"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 03:42:14 -0700
X-CSE-ConnectionGUID: TcagksFyS52PKoXhIDjE8A==
X-CSE-MsgGUID: /FhpyagjRLq0vj4VEpU4cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="186214909"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.154])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 03:42:13 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Allow mixed mappings for userptr
Date: Fri, 10 Oct 2025 12:41:49 +0200
Message-ID: <20251010104149.72783-3-thomas.hellstrom@linux.intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Compute kernels often issue memory copies immediately after completion.
If the memory being copied is an SVM pointer that was faulted into the
device and then bound via userptr, it is undesirable to move that
memory. Worse, if userptr is mixed between system and device memory, the
bind operation may be rejected.

Xe already has the necessary plumbing to support userptr with mixed
mappings. This update modifies GPUSVM's get_pages to correctly locate
pages in such mixed mapping scenarios.

v2:
- Rebase (Thomas Hellström)
v3:
- Remove Fixes tag.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c    | 6 ++++--
 drivers/gpu/drm/xe/xe_userptr.c | 4 +++-
 include/drm/drm_gpusvm.h        | 4 ++++
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index cb906765897e..73e550c8ff8c 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1363,7 +1363,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
 		if (is_device_private_page(page) ||
 		    is_device_coherent_page(page)) {
-			if (zdd != page->zone_device_data && i > 0) {
+			if (!ctx->allow_mixed &&
+			    zdd != page->zone_device_data && i > 0) {
 				err = -EOPNOTSUPP;
 				goto err_unmap;
 			}
@@ -1399,7 +1400,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		} else {
 			dma_addr_t addr;
 
-			if (is_zone_device_page(page) || pagemap) {
+			if (is_zone_device_page(page) ||
+			    (pagemap && !ctx->allow_mixed)) {
 				err = -EOPNOTSUPP;
 				goto err_unmap;
 			}
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index f16e92cd8090..0d9130b1958a 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -3,6 +3,7 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include "xe_svm.h"
 #include "xe_userptr.h"
 
 #include <linux/mm.h>
@@ -54,7 +55,8 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 	struct xe_device *xe = vm->xe;
 	struct drm_gpusvm_ctx ctx = {
 		.read_only = xe_vma_read_only(vma),
-		.device_private_page_owner = NULL,
+		.device_private_page_owner = xe_svm_devm_owner(xe),
+		.allow_mixed = true,
 	};
 
 	lockdep_assert_held(&vm->lock);
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index b92faa9a26b2..632e100e6efb 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -235,6 +235,9 @@ struct drm_gpusvm {
  * @read_only: operating on read-only memory
  * @devmem_possible: possible to use device memory
  * @devmem_only: use only device memory
+ * @allow_mixed: Allow mixed mappings in get pages. Mixing between system and
+ *               single dpagemap is supported, mixing between multiple dpagemap
+ *               is unsupported.
  *
  * Context that is DRM GPUSVM is operating in (i.e. user arguments).
  */
@@ -246,6 +249,7 @@ struct drm_gpusvm_ctx {
 	unsigned int read_only :1;
 	unsigned int devmem_possible :1;
 	unsigned int devmem_only :1;
+	unsigned int allow_mixed :1;
 };
 
 int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
-- 
2.51.0

