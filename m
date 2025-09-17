Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA35ECAC598
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 18:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AED710E579;
	Wed, 17 Sep 2025 18:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SNxpuc9A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6089E10E579
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 18:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758133701; x=1789669701;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6HScZOavhRlL6YX6x7B/1qcJK0BNO8dj7XNtsfkLhaE=;
 b=SNxpuc9A0oyDyO9KUS8olY16OhqY5zBAOW85VE/+UbYX/dbCCzQbUS8Q
 bWlPVyEp6tQyoCiRHcBfS8Ue4QM1ioHwLDjryXafGJ5PNWymDv/z+ga4H
 EdqNSz+8wfh8t/oIePQnT12El9ikLQmuDcLew8xOMp3JXnhnUGzpxn7rg
 GhvQ/RjerrTD3T64WGAWPSdCCDxMxdsjKKfGzY7R2AryEqJfC2EuLPsnr
 +/bNQVgeT04WnyXkT6xjdwxAvDoq1d/AAMzRT9cDoey405YIWmoM6WKY5
 nYTkpIdnfzzwV+ap843WVu+eDiMjRwwsmGD1PAWTbveSvgviz7vjZgBtN Q==;
X-CSE-ConnectionGUID: gOQlfdjdT8KI3NuHvbnnpw==
X-CSE-MsgGUID: OdBL47PMSpmJ5h2h6LI3Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="85891705"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="85891705"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 11:28:21 -0700
X-CSE-ConnectionGUID: lFGKzD/VT5WJ/p2Y8+Hn4A==
X-CSE-MsgGUID: 0ZVypQXoTH2ZSV1jROMpKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="180455102"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 11:28:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Allow mixed mappings for userptr
Date: Wed, 17 Sep 2025 11:28:17 -0700
Message-Id: <20250917182817.3995998-1-matthew.brost@intel.com>
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

Compute kernels often issue memory copies immediately after completion.
If the memory being copied is an SVM pointer that was faulted into the
device and then bound via userptr, it is undesirable to move that
memory. Worse, if userptr is mixed between system and device memory, the
bind operation may be rejected.

Xe already has the necessary plumbing to support userptr with mixed
mappings. This update modifies GPUSVM's get_pages to correctly locate
pages in such mixed mapping scenarios.

Fixes: ("9e9787414882 drm/xe/userptr: replace xe_hmm with gpusvm")
Signed-off-bt: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c    | 6 ++++--
 drivers/gpu/drm/xe/xe_userptr.c | 1 +
 include/drm/drm_gpusvm.h        | 4 ++++
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index eeeeb99cfdf6..64c0ea70eae3 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1361,7 +1361,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
 		if (is_device_private_page(page) ||
 		    is_device_coherent_page(page)) {
-			if (zdd != page->zone_device_data && i > 0) {
+			if (!ctx->allow_mixed &&
+			    zdd != page->zone_device_data && i > 0) {
 				err = -EOPNOTSUPP;
 				goto err_unmap;
 			}
@@ -1397,7 +1398,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		} else {
 			dma_addr_t addr;
 
-			if (is_zone_device_page(page) || pagemap) {
+			if (is_zone_device_page(page) ||
+			    (pagemap && !ctx->allow_mixed)) {
 				err = -EOPNOTSUPP;
 				goto err_unmap;
 			}
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 91d09af71ced..c628f58c085c 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -54,6 +54,7 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 	struct xe_device *xe = vm->xe;
 	struct drm_gpusvm_ctx ctx = {
 		.read_only = xe_vma_read_only(vma),
+		.allow_mixed = true,
 	};
 
 	lockdep_assert_held(&vm->lock);
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 5434048a2ca4..97d2f57914bb 100644
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
@@ -245,6 +248,7 @@ struct drm_gpusvm_ctx {
 	unsigned int read_only :1;
 	unsigned int devmem_possible :1;
 	unsigned int devmem_only :1;
+	unsigned int allow_mixed :1;
 };
 
 int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
-- 
2.34.1

