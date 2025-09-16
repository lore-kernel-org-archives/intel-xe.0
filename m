Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5DECAC599
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 11:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD8C10E78A;
	Tue, 16 Sep 2025 11:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/yM3Of3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980D010E78A
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 11:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758023623; x=1789559623;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f3ug77VTTlM8GNGq94U23n+muzx/9bvmLCQ/zV60Bu4=;
 b=A/yM3Of3Bb5qRDan2WJocIQSLeqzFXNeizCLd/F1RLuxfR90XOZ/SIHr
 P1nZkcQvgG7dV9z+Y8eeKQr4YYkv2rcP6E7oVju14ecJqsoSN13wJzD3T
 yjLhATUwJ9gYR4ayAQYFY62QPaaPHA4SmGIZvfoGPm6MtJgoLXmH6UfuP
 nnS5Tq1VxYn0yyidMEkxpAlLfTiNg3PD+S8aIJTULtkOUhCTRSoKcsiuV
 lbjXz/n440udC6JRYTYXl8zdsqvVh6xcDADR7tq4i76SIfKww8l8itmhi
 fKrY+BW+DKphDlXY+2vCNsDkdJg7yGRmy41b+9sHUItEzizko35vxb87b A==;
X-CSE-ConnectionGUID: UUCQVFQ1QsWDfgdbzlnHfg==
X-CSE-MsgGUID: IbQTSJrhTXCbQMuVTlsUvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="64119834"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="64119834"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 04:53:42 -0700
X-CSE-ConnectionGUID: eofuor8uTTaCAROiuZ1yKg==
X-CSE-MsgGUID: T00oLmrjSvqteWd5yAYrPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="175703647"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fedora)
 ([10.245.245.138])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 04:53:40 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [RFC PATCH] drm/xe/dma-buf: Allow pinning of p2p dma-buf
Date: Tue, 16 Sep 2025 13:53:22 +0200
Message-ID: <20250916115322.23293-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

Cc: Dave Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 13 +++++++++
 drivers/gpu/drm/xe/xe_dma_buf.c       | 41 +++++++++++++++++----------
 2 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index a7e548a2bdfb..1f88ca71820c 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -31,6 +31,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
 			    struct drm_exec *exec)
 {
 	struct dma_buf_test_params *params = to_dma_buf_test_params(test->priv);
+	struct dma_buf_attachment *attach;
 	u32 mem_type;
 	int ret;
 
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

