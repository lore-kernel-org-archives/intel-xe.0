Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E84D78337
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 17:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B130010E7CA;
	Mon,  2 Dec 2024 17:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f67w0WY+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D5810E7CA
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Dec 2024 17:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733158918; x=1764694918;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0SgL8NmSMfUqK+mNZ1V+sG6UtPwg4GxxQ8VcDj+/EnM=;
 b=f67w0WY+HzmHh860BAvQ0nlCSAodt9gcdJ+rU5x00KpNfGh7DsbKLfWb
 K6e75A86f2U15N6PM3ZHN8QnC8YvbEwh3dJeUH1V6rNHAaSc5E2Fv5h7V
 ckUtcIAYZVRc97zpbvHvNqjsPENKfUdIpbumTMrx5e9H570jMdPsUNnzf
 lPvEvKYnENPSHWrO4L47k9CdEa5bm9toirGLISAoRV1W6ge1plsuwXs3X
 yWubEi+YOB6W11GUsu1NMDatLpSgy5LWvPURTO2+Nmqr/Hk2GeoF5ay7t
 jOaswWvD+fOC/BkpQTIaVVE8kSlsfSqRZaMQlNLa3rGUURcwCsNC8n4S8 g==;
X-CSE-ConnectionGUID: xVsroTktQLej1hXhdp4ybA==
X-CSE-MsgGUID: LFucaZ1BQZq7WiLhykY47A==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43823826"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="43823826"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 09:01:17 -0800
X-CSE-ConnectionGUID: IeZSSChFQYOpkZaw8wIRIA==
X-CSE-MsgGUID: f3Yg3g6fR064+STBvBVxsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="93067811"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.79])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 09:01:15 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2] drm/xe/display: fix ttm_bo_access() usage
Date: Mon,  2 Dec 2024 17:01:03 +0000
Message-ID: <20241202170102.88893-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.47.0
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

ttm_bo_access() returns the size on success. Account for that otherwise
the caller incorrectly thinks this is an error in
intel_atomic_prepare_plane_clear_colors().

v2 (Thomas)
 - Make sure we check for the partial copy case. Also since this api is
   easy to get wrong, wrap the whole thing in a new helper to hide the
   details and then convert the existing users over.

Fixes: b6308aaa24a7 ("drm/xe/display: Update intel_bo_read_from_page to use ttm_bo_access")
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3661
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/intel_bo.c |  2 +-
 drivers/gpu/drm/xe/xe_bo.c            | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h            |  1 +
 drivers/gpu/drm/xe/xe_vm.c            |  8 ++------
 4 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
index 43141964f6f2..b463f5bd4eed 100644
--- a/drivers/gpu/drm/xe/display/intel_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_bo.c
@@ -41,7 +41,7 @@ int intel_bo_read_from_page(struct drm_gem_object *obj, u64 offset, void *dst, i
 {
 	struct xe_bo *bo = gem_to_xe_bo(obj);
 
-	return ttm_bo_access(&bo->ttm, offset, dst, size, 0);
+	return xe_bo_read(bo, offset, dst, size);
 }
 
 struct intel_frontbuffer *intel_bo_get_frontbuffer(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index f51d86511cb9..af85e5b8895f 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1320,6 +1320,30 @@ static int xe_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 	return ret;
 }
 
+/**
+ * xe_bo_read() - Read from an xe_bo
+ * @bo: The buffer object to read from.
+ * @offset: The byte offset to start reading from.
+ * @dst: Location to store the read.
+ * @size: Size in bytes for the read.
+
+ * Read @size bytes from the @bo, starting from @offset, storing into @dst.
+ *
+ * Return: Zero on success, or negative error.
+ */
+int xe_bo_read(struct xe_bo *bo, u64 offset, void *dst, int size)
+{
+	int ret;
+
+	ret = ttm_bo_access(&bo->ttm, offset, dst, size, 0);
+	if (ret >= 0 && ret != size)
+		ret = -EIO;
+	else if (ret == size)
+		ret = 0;
+
+	return ret;
+}
+
 static const struct vm_operations_struct xe_gem_vm_ops = {
 	.fault = xe_gem_fault,
 	.open = ttm_bo_vm_open,
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index d0dce44317c7..d9386ab03140 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -228,6 +228,7 @@ xe_bo_ggtt_addr(struct xe_bo *bo)
 
 int xe_bo_vmap(struct xe_bo *bo);
 void xe_bo_vunmap(struct xe_bo *bo);
+int xe_bo_read(struct xe_bo *bo, u64 offset, void *dst, int size);
 
 bool mem_type_is_vram(u32 mem_type);
 bool xe_bo_is_vram(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2492750505d6..7788680da4e5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3321,12 +3321,8 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 		}
 
 		if (bo) {
-			err = ttm_bo_access(&bo->ttm, snap->snap[i].bo_ofs,
-					    snap->snap[i].data, snap->snap[i].len, 0);
-			if (!(err < 0) && err != snap->snap[i].len)
-				err = -EIO;
-			else if (!(err < 0))
-				err = 0;
+			err = xe_bo_read(bo, snap->snap[i].bo_ofs,
+					 snap->snap[i].data, snap->snap[i].len);
 		} else {
 			void __user *userptr = (void __user *)(size_t)snap->snap[i].bo_ofs;
 
-- 
2.47.0

