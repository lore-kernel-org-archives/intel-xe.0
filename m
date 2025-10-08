Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799AFCCD184
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 11:11:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3931710E328;
	Wed,  8 Oct 2025 11:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDr20K8T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3692610E328
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 11:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759921875; x=1791457875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UfUhbHfAsTcuWmP3qyGr1HHyAWHwxnMFewLzW4JUdEk=;
 b=DDr20K8T6Pta8hyPiLywTFsMrX7sEJhgE3kr1KGuzPeM3P50EOI8PPba
 TRjQDAmkd1kYiF8/YglAkx9qtZygiRitx+y/sllDAYvG6l69Vucn2GJ8R
 jxSm+HdJKZk/FkE04uAUNHcLb2DZHObVZoFEzSZOM3yd7Sj4m1fNeyVkb
 wGNxYrvlX0/ImM/G7TZWU5MNIrQNRxgW2ovhz56InuxcqcdprHtHgBkir
 vt5lmWH059tSr4NHUZ3I//Gw5BAC90LMA+DCrzSRTChxh0AfaWghlzcjl
 qN+yqkm7FHIfhuiXfb2fDdIWbQEX1HvMdEY2vsuggB2d4CwiQhzyIMftq g==;
X-CSE-ConnectionGUID: L7YMgK80ShqGQsR4/e1ngw==
X-CSE-MsgGUID: sCyk8sF3QyWQ26SMoA7ZyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="62154443"
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="62154443"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:11:14 -0700
X-CSE-ConnectionGUID: hWiUjV0jSb20+SGbTUC9Qg==
X-CSE-MsgGUID: TIsyWFUPS5OUhHq30HFt1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="211358694"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:11:13 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 2/2] drm/xe: Allow mixed mappings for userptr
Date: Wed,  8 Oct 2025 13:10:50 +0200
Message-ID: <20251008111050.293151-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008111050.293151-1-thomas.hellstrom@linux.intel.com>
References: <20251008111050.293151-1-thomas.hellstrom@linux.intel.com>
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

Fixes: ("9e9787414882 drm/xe/userptr: replace xe_hmm with gpusvm")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com> #v1
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

