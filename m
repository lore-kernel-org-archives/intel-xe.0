Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114E3CAC59F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 09:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A3210E686;
	Thu, 18 Sep 2025 09:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m7mzPYIV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EE310E686
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 09:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758187354; x=1789723354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dPdsuZuT9BL5dfcbgioJuckIH98zT4JR4cM5tdOP4C0=;
 b=m7mzPYIVLygdrrWK+zRWaJ31rjQ0ftv8l7N5o5/L0fNCpkC+jneIOVDz
 GcQcAWGPxCXsjIvHBRc+uxu8NczCqWBsFOvQiVcFfrdPZAEnCfPO9Fn0O
 xZbZNuCJ011LbIyV3uKqqeVw0WMS3RDpYNObxrHGzKgzhzB1vrXB6UUY5
 NXwIyX87VL6mexOnbKlbZFwJDM3kbe0J/Z8ZhA9ujI/3QBb1Qrx2QVC/U
 4RWzI57dLssiKRSk2UefUP5Dk4Q2+wKKXaGhXxCUJlk8EoJPzjsdHHvs4
 +p/SIhmz0P72/ERooQqNNLsdaiBhJoqXLNLQcb2UcRHzVnqYeuwZPsh6C w==;
X-CSE-ConnectionGUID: ZToNwCSxSdiC8kXawOKGww==
X-CSE-MsgGUID: pFo/ACDxQe658u0If0tPZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="48081694"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="48081694"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 02:22:34 -0700
X-CSE-ConnectionGUID: Lam+3A+aTtCOk4Md+bOHaw==
X-CSE-MsgGUID: PSXzQV+oQLCay+2j3jCBqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="206284872"
Received: from abityuts-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.244.175])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 02:22:32 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v2 3/3] drm/xe/dma-buf: Allow pinning of p2p dma-buf
Date: Thu, 18 Sep 2025 11:22:07 +0200
Message-ID: <20250918092207.54472-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918092207.54472-1-thomas.hellstrom@linux.intel.com>
References: <20250918092207.54472-1-thomas.hellstrom@linux.intel.com>
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

RDMA NICs typically requires the VRAM dma-bufs to be pinned in
VRAM for pcie-p2p communication, since they don't fully support
the move_notify() scheme. We would like to support that.

However allowing unaccounted pinning of VRAM creates a DOS vector
so up until now we haven't allowed it.

However with cgroups support in TTM, the amount of VRAM allocated
to a cgroup can be limited, and since also the pinned memory is
accounted as allocated VRAM we should be safe.

An analogy with system memory can be made if we observe the
similarity with kernel system memory that is allocated as the
result of user-space action and that is accounted using __GFP_ACCOUNT.

Ideally, to be more flexible, we would add a "pinned_memory",
or possibly "kernel_memory" limit to the dmem cgroups controller,
that would additionally limit the memory that is pinned in this way.
If we let that limit default to the dmem::max limit we can
introduce that without needing to care about regressions.

Considering that we already pin VRAM in this way for at least
page-table memory and LRC memory, and the above path to greater
flexibility, allow this also for dma-bufs.

v2:
- Update comments about pinning in the dma-buf kunit test
  (Niranjana Vishwanathapura)

Cc: Dave Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 17 +++++++++--
 drivers/gpu/drm/xe/xe_dma_buf.c       | 41 +++++++++++++++++----------
 2 files changed, 41 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index a7e548a2bdfb..5df98de5ba3c 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -31,6 +31,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
 			    struct drm_exec *exec)
 {
 	struct dma_buf_test_params *params = to_dma_buf_test_params(test->priv);
+	struct dma_buf_attachment *attach;
 	u32 mem_type;
 	int ret;
 
@@ -46,7 +47,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
 		mem_type = XE_PL_TT;
 	else if (params->force_different_devices && !is_dynamic(params) &&
 		 (params->mem_mask & XE_BO_FLAG_SYSTEM))
-		/* Pin migrated to TT */
+		/* Pin migrated to TT on non-dynamic attachments. */
 		mem_type = XE_PL_TT;
 
 	if (!xe_bo_is_mem_type(exported, mem_type)) {
@@ -88,6 +89,18 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
 
 	KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, mem_type));
 
+	/* Check that we can pin without migrating. */
+	attach = list_first_entry_or_null(&dmabuf->attachments, typeof(*attach), node);
+	if (attach) {
+		int err = dma_buf_pin(attach);
+
+		if (!err) {
+			KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, mem_type));
+			dma_buf_unpin(attach);
+		}
+		KUNIT_EXPECT_EQ(test, err, 0);
+	}
+
 	if (params->force_different_devices)
 		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(imported, XE_PL_TT));
 	else
@@ -150,7 +163,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 			xe_bo_lock(import_bo, false);
 			err = xe_bo_validate(import_bo, NULL, false, exec);
 
-			/* Pinning in VRAM is not allowed. */
+			/* Pinning in VRAM is not allowed for non-dynamic attachments */
 			if (!is_dynamic(params) &&
 			    params->force_different_devices &&
 			    !(params->mem_mask & XE_BO_FLAG_SYSTEM))
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index a7d67725c3ee..54e42960daad 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -48,32 +48,43 @@ static void xe_dma_buf_detach(struct dma_buf *dmabuf,
 
 static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
 {
-	struct drm_gem_object *obj = attach->dmabuf->priv;
+	struct dma_buf *dmabuf = attach->dmabuf;
+	struct drm_gem_object *obj = dmabuf->priv;
 	struct xe_bo *bo = gem_to_xe_bo(obj);
 	struct xe_device *xe = xe_bo_device(bo);
 	struct drm_exec *exec = XE_VALIDATION_UNSUPPORTED;
+	bool allow_vram = true;
 	int ret;
 
-	/*
-	 * For now only support pinning in TT memory, for two reasons:
-	 * 1) Avoid pinning in a placement not accessible to some importers.
-	 * 2) Pinning in VRAM requires PIN accounting which is a to-do.
-	 */
-	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo, XE_PL_TT)) {
+	if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
+		allow_vram = false;
+	} else {
+		list_for_each_entry(attach, &dmabuf->attachments, node) {
+			if (!attach->peer2peer) {
+				allow_vram = false;
+				break;
+			}
+		}
+	}
+
+	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo, XE_PL_TT) &&
+	    !(xe_bo_is_vram(bo) && allow_vram)) {
 		drm_dbg(&xe->drm, "Can't migrate pinned bo for dma-buf pin.\n");
 		return -EINVAL;
 	}
 
-	ret = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
-	if (ret) {
-		if (ret != -EINTR && ret != -ERESTARTSYS)
-			drm_dbg(&xe->drm,
-				"Failed migrating dma-buf to TT memory: %pe\n",
-				ERR_PTR(ret));
-		return ret;
+	if (!allow_vram) {
+		ret = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
+		if (ret) {
+			if (ret != -EINTR && ret != -ERESTARTSYS)
+				drm_dbg(&xe->drm,
+					"Failed migrating dma-buf to TT memory: %pe\n",
+					ERR_PTR(ret));
+			return ret;
+		}
 	}
 
-	ret = xe_bo_pin_external(bo, true, exec);
+	ret = xe_bo_pin_external(bo, !allow_vram, exec);
 	xe_assert(xe, !ret);
 
 	return 0;
-- 
2.51.0

