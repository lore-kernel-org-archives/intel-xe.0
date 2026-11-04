Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DA7606A328
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 18:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ShelQ91U
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906F910E590;
	Wed,  4 Nov 2026 18:13:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFF910E590
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 18:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793815999; x=1825351999;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yMxsiiNkYM3Isqt3nSYsxNVyCvCTZC/AYBP+ZaZ1W98=;
 b=ShelQ91Uh/z8rJyumdA/ybeeTOibG/vtKBvimB9VT0fbON/lplMif8Ex
 6PVQwfAgBBRUmr5XDf9RQHbJVRG8zhkKSxmrMyTMtuDyL4nMM0mXPF5oI
 7eCAhlFDFNThdpIGiQ4CHNnyWT8F3gz0HcOSFvPkq2PU9xbd/1Od9GCrg
 UzE6VsAAAJNE1qTai6U+ec3yAn3uC24O4kx4ERoVq8/7SFCeQXz87I9vs
 h4KNCC5A2skvZ+8cUHloLh92slBpDT44kDHlXKzQcFVINRt32cyvQXRfn
 Nrke7pbI4hiEt2VkyNV2oP1D3GRiViyO/9t3MBgdZPxJvdeKtP5FSYi74 g==;
X-CSE-ConnectionGUID: lMGde7c3Q8CjI+mE9LrXUQ==
X-CSE-MsgGUID: OgXuPSM/SLSoCp/KbSdlmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2489383"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2489383"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 10:13:18 -0800
X-CSE-ConnectionGUID: J8gz22JKTze7bYkGGxOFkg==
X-CSE-MsgGUID: 3uM7p2ClRwuKY3Bb6q6izA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6915792"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa005.fm.intel.com with ESMTP; 04 Nov 2026 10:13:16 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH] drm/xe: Exclude imported dma-buf BOs from the TT budget
Date: Wed,  4 Nov 2026 23:47:34 +0530
Message-ID: <20261104181733.779688-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The TT ("system") resource manager budget is sized to total host RAM
and enforced in xe_ttm_sys_mgr_new(). Imported dma-buf BOs
(ttm_bo_type_sg) placed in XE_PL_TT are backed by external pages and
never allocate from this device's TTM pool, so they consume no host
RAM. Charging them against the host-RAM-sized budget can falsely trip
it (e.g. many peer mappings on multi-GPU systems), surfacing as a
spurious -ENOSPC/OOM while memory is actually free.

Track the bytes of ttm_bo_type_sg BOs in a new per-device counter,
mem.sys_mgr_sg_usage, and subtract it from the usage compared against
the budget. The counter is maintained in xe_ttm_sys_mgr_new() and
xe_ttm_sys_mgr_del().

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---

Notes:
    This fixes it xe-locally. The same issue is generic: external
    (ttm_bo_type_sg / TTM_TT_FLAG_EXTERNAL) resources occupy a manager slot
    but consume none of the manager's budgeted memory, so it could instead
    be handled in TTM core (e.g. a man->external_usage counter excluded from
    the budget). Kept driver-local here for a minimal, low-risk fix.

 drivers/gpu/drm/xe/xe_device_types.h |  7 +++++++
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c  | 19 +++++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index e334cfa5b3d2..6c59bc9da1a4 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -298,6 +298,13 @@ struct xe_device {
 		struct xe_vram_region *vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
+		/**
+		 * @mem.sys_mgr_sg_usage: Bytes of externally-backed (dma-buf
+		 * imported, e.g. peer-GPU VRAM mapped for P2P) BOs placed in
+		 * the TT manager. These consume no host RAM and are excluded
+		 * from the host-RAM-sized TT budget.
+		 */
+		atomic64_t sys_mgr_sg_usage;
 		/** @mem.shrinker: system memory shrinker. */
 		struct xe_shrinker *shrinker;
 		/** @mem.stolen_mgr: stolen memory manager. */
diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 9d77ba605aec..926c4372e45a 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -30,6 +30,7 @@ static int xe_ttm_sys_mgr_new(struct ttm_resource_manager *man,
 			      const struct ttm_place *place,
 			      struct ttm_resource **res)
 {
+	struct xe_device *xe = container_of(man, struct xe_device, mem.sys_mgr);
 	struct xe_ttm_sys_node *node;
 	int r;
 
@@ -40,8 +41,18 @@ static int xe_ttm_sys_mgr_new(struct ttm_resource_manager *man,
 	node->tbo = tbo;
 	ttm_resource_init(tbo, place, &node->base.base);
 
-	if (!(place->flags & TTM_PL_FLAG_TEMPORARY) &&
-	    ttm_resource_manager_usage(man) > (man->size << PAGE_SHIFT)) {
+	/*
+	 * Imported dma-buf BOs (e.g. peer-GPU VRAM mapped for P2P) are backed
+	 * by external pages and never allocate from this device's TTM pool, so
+	 * they consume no host RAM and must not be charged against the
+	 * host-RAM-sized TT budget.
+	 */
+	if (tbo->type == ttm_bo_type_sg) {
+		atomic64_add(node->base.base.size, &xe->mem.sys_mgr_sg_usage);
+	} else if (!(place->flags & TTM_PL_FLAG_TEMPORARY) &&
+		   ttm_resource_manager_usage(man) -
+		   atomic64_read(&xe->mem.sys_mgr_sg_usage) >
+		   (man->size << PAGE_SHIFT)) {
 		r = -ENOSPC;
 		goto err_fini;
 	}
@@ -63,8 +74,12 @@ static int xe_ttm_sys_mgr_new(struct ttm_resource_manager *man,
 static void xe_ttm_sys_mgr_del(struct ttm_resource_manager *man,
 			       struct ttm_resource *res)
 {
+	struct xe_device *xe = container_of(man, struct xe_device, mem.sys_mgr);
 	struct xe_ttm_sys_node *node = to_xe_ttm_sys_node(res);
 
+	if (node->tbo->type == ttm_bo_type_sg)
+		atomic64_sub(res->size, &xe->mem.sys_mgr_sg_usage);
+
 	ttm_resource_fini(man, res);
 	kfree(node);
 }
-- 
2.43.0

