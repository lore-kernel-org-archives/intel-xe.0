Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E71606A326
	for <intel-xe@archiver.kernel.org>; Sat,  7 Nov 2026 17:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fobITDpF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C08F10E0E0;
	Sat,  7 Nov 2026 17:27:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692AD10E092
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Nov 2026 17:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794072469; x=1825608469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KDg/Krv27Tk1wQsX/EBEkS46HR1SZbs4MRRZFnD67+U=;
 b=fobITDpFk+7r0f39PtsDCUtIPtwSRklWHuhTQ74ExcpWnF8y6Gie/oWt
 X7xKMECYgA1TqT5BIH0Njc+kTKVQ90YIToWJdYZXNp2WRa5oI5SIfm3WZ
 9tAXa7oLycbhIMi1p29dEoo6w1n5kkz/X7ZsQYfVceQnzZSRRkfAI3C0K
 GjE5ifY/+z1kjTjldEMlkgRs3OkLrFkcbqZJtQVv+LBzAAdzkVg1uXCts
 s6o4cLtECKQ3a1ZHY+bzmFsqXWmez4TkmvfDFgBNgl9AbteOE/7okcrY6
 /g0LzpduEXXrDv1Hq81Dttpc3en/fONN1312vATIerFqta3tYcr8e90NT A==;
X-CSE-ConnectionGUID: 3CWqL51URha7Ep23NDLxXg==
X-CSE-MsgGUID: nVaLvsx2Sdaa6sHO+iRhtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2901543"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2901543"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2026 09:27:46 -0800
X-CSE-ConnectionGUID: uCikNMQxQb2CY4h4zqd6VQ==
X-CSE-MsgGUID: 0FJMV8CrRoKgbyMwAQy7cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="9382481"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2026 09:27:45 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 3/3] drm/ttm, drm/xe: Drop the ttm_tt on null moves to VRAM
Date: Sat,  7 Nov 2026 17:26:52 +0000
Message-ID: <20261107-oom-fun-v1-3-be9eb05b82ed@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107-oom-fun-v1-0-be9eb05b82ed@intel.com>
References: <20261107-oom-fun-v1-0-be9eb05b82ed@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

A BO created with DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING starts in system
placement with an unpopulated ttm_tt. Its initial move to VRAM has no
source data and uses ttm_bo_move_null(), which unlike
ttm_bo_move_accel_cleanup() leaves bo->ttm attached. If the VRAM BO is
later exported, ttm_bo_setup_export() populates that stale ttm_tt,
pinning unused, unshrinkable host pages equal to the BO size and
potentially exhausting host RAM.

Add ttm_bo_move_null_drop_tt() to destroy the ttm_tt when moving to a
manager that doesn't use one, and use it in xe_bo_move().

Fixes: 91494dee1091 ("xe: populate buffers before exporting them.")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.c        |  6 +++---
 include/drm/ttm/ttm_bo.h          |  2 ++
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index f9458a4d5a09..0ab52be3a5f7 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -756,6 +756,26 @@ void ttm_bo_move_sync_cleanup(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_move_sync_cleanup);
 
+/**
+ * ttm_bo_move_null_drop_tt - assign memory without moving data, dropping the TT
+ * @bo: The buffer object.
+ * @new_mem: The memory to be assigned.
+ *
+ * Like ttm_bo_move_null(), but if the memory manager of @new_mem doesn't use
+ * a struct ttm_tt, also destroy @bo's ttm_tt, mimicking what
+ * ttm_bo_move_accel_cleanup() does. The caller must hold the bo's
+ * reservation, and the ttm_tt must not hold data that needs to be preserved.
+ */
+void ttm_bo_move_null_drop_tt(struct ttm_buffer_object *bo,
+			      struct ttm_resource *new_mem)
+{
+	if (!ttm_manager_type(bo->bdev, new_mem->mem_type)->use_tt)
+		ttm_bo_tt_destroy(bo);
+
+	ttm_bo_move_null(bo, new_mem);
+}
+EXPORT_SYMBOL(ttm_bo_move_null_drop_tt);
+
 /**
  * ttm_bo_pipeline_gutting - purge the contents of a bo
  * @bo: The buffer object
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 0181f73ef66d..6628db44951f 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1178,7 +1178,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	}
 
 	if ((move_lacks_source && !needs_clear)) {
-		ttm_bo_move_null(ttm_bo, new_mem);
+		ttm_bo_move_null_drop_tt(ttm_bo, new_mem);
 		goto out;
 	}
 
@@ -1313,7 +1313,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 						new_mem);
 		if (ret) {
 			dma_fence_wait(fence, false);
-			ttm_bo_move_null(ttm_bo, new_mem);
+			ttm_bo_move_null_drop_tt(ttm_bo, new_mem);
 			ret = 0;
 		}
 	} else {
@@ -1324,7 +1324,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		 */
 		dma_resv_add_fence(ttm_bo->base.resv, fence,
 				   DMA_RESV_USAGE_KERNEL);
-		ttm_bo_move_null(ttm_bo, new_mem);
+		ttm_bo_move_null_drop_tt(ttm_bo, new_mem);
 	}
 
 	/*
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 32791c4db2a9..123ef68bd849 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -480,6 +480,8 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 			      struct ttm_resource *new_mem);
 void ttm_bo_move_sync_cleanup(struct ttm_buffer_object *bo,
 			      struct ttm_resource *new_mem);
+void ttm_bo_move_null_drop_tt(struct ttm_buffer_object *bo,
+			      struct ttm_resource *new_mem);
 int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo);
 pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
 		     pgprot_t tmp);

-- 
2.56.0
