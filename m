Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717BEC77B6C
	for <intel-xe@archiver.kernel.org>; Thu, 13 Apr 2023 06:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2996C10EA35;
	Thu, 13 Apr 2023 06:56:59 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE13510EA35
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Apr 2023 06:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681369016; x=1712905016;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TElkNVR4mPHmytQyd3I9V2GQ+jp75sTAOtCjUQ9p348=;
 b=MEaS614fYyaLC+SPWwgiv1fhHU04LZyYZL12Tv3r1F4eHvLyYgjeNpNl
 6OtwLOiIA4cT8zoCitTA64Ep+P4US7ntXfMgMwm40l8FCioYA3Jjb+4up
 H+4qoumi1rnLmEGz4xnjg8nc8eYrKngGCLrpDB1RIxycaquXnsxCfMEmV
 T2vx4y1cPNgHhi3dAImucS590v3RtTR8NN7MKhxdUfN2xgANkcUwMdWL2
 h8tlbfl7xlYKXb24FJ8neEkRsfPFLgAA3JxnAMGZyUou3TH82YDQD62WY
 2vskxy9/xBp2jADhX01sYUtf7wLqsOp7RaMvhksLRAY0dMXGCTf9wzupC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="406941934"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="406941934"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 23:56:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="758574058"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="758574058"
Received: from ntusk-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.31.104])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 23:56:53 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Apr 2023 08:56:45 +0200
Message-Id: <20230413065645.187171-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] xe/xe_bo: Reject bo creation of unaligned size
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

From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

For xe bo creation we request passing size which matches system or
vram minimum page alignment. This way we want to ensure userspace
is aware of region constraints and not aligned allocations will be
rejected returning EINVAL.

Signed-off-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 23 ++++++++++++++++-------
 include/uapi/drm/xe_drm.h  |  5 ++---
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3ab404e33fae..d3972c84bcce 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1090,6 +1090,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	};
 	struct ttm_placement *placement;
 	uint32_t alignment;
+	size_t aligned_size;
 	int err;
 
 	/* Only kernel objects should set GT */
@@ -1098,22 +1099,30 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	if (XE_WARN_ON(!size))
 		return ERR_PTR(-EINVAL);
 
-	if (!bo) {
-		bo = xe_bo_alloc();
-		if (IS_ERR(bo))
-			return bo;
-	}
-
 	if (flags & (XE_BO_CREATE_VRAM_MASK | XE_BO_CREATE_STOLEN_BIT) &&
 	    !(flags & XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT) &&
 	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) {
-		size = ALIGN(size, SZ_64K);
+		aligned_size = ALIGN(size, SZ_64K);
+		if (type != ttm_bo_type_device)
+			size = ALIGN(size, SZ_64K);
 		flags |= XE_BO_INTERNAL_64K;
 		alignment = SZ_64K >> PAGE_SHIFT;
+
 	} else {
+		aligned_size = ALIGN(size, SZ_4K);
+		flags &= ~XE_BO_INTERNAL_64K;
 		alignment = SZ_4K >> PAGE_SHIFT;
 	}
 
+	if (type == ttm_bo_type_device && aligned_size != size)
+		return ERR_PTR(-EINVAL);
+
+	if (!bo) {
+		bo = xe_bo_alloc();
+		if (IS_ERR(bo))
+			return bo;
+	}
+
 	bo->gt = gt;
 	bo->size = size;
 	bo->flags = flags;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b0b80aae3ee8..d3e64af7eabb 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -259,9 +259,8 @@ struct drm_xe_gem_create {
 	__u64 extensions;
 
 	/**
-	 * @size: Requested size for the object
-	 *
-	 * The (page-aligned) allocated size for the object will be returned.
+	 * @size: Size of the object to be created, must match region
+	 * (system or vram) minimum alignment.
 	 */
 	__u64 size;
 
-- 
2.34.1

