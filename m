Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCE8C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 03:31:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9394C10FA77;
	Wed, 24 Apr 2024 03:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9kx5yJs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5F710FA77
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 03:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713929484; x=1745465484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M1F3y8+Zm4OJtw9u6kLSNlsGNfWj/uDQe5sIXOxeNto=;
 b=d9kx5yJs5AhShN8dlhw+tt24+ewgH3O11tmu4b3pEErg0N8z7a71TVj2
 NF9e3xSI+EbSQvvXZUFkVbLdXNubJTJlvVtZpljfEGeCKuMi/yMQC/3mT
 Tx5jG/+AZ6AZYE6e+Ai6JOJD1meQVo81iZ03W/l94gbhcmt0ajgLZMWJY
 Vlkxx/r+Z05VWhHT3frg1d7ckJQrZMcMDiOgx8BdCegS0be63rmX9tPlO
 kcYnoiqUSmbwvvu02Ej5IAS+E/M6Cr8yOJPuBY0xPVgGlqf18Vw12O8Dh
 aIJiVHJ3Gj0rcifNLMh2+rRzBhUz4P4zmriNt85Zj7tmpVL4OXQ8xuXQo w==;
X-CSE-ConnectionGUID: /N26uztoS/CXzOMlprF/+g==
X-CSE-MsgGUID: ByeqykbyRQC2xdWFONYW7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9408524"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9408524"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 20:31:24 -0700
X-CSE-ConnectionGUID: 9ogj6Uo/TA+ZKEQmmeUwNQ==
X-CSE-MsgGUID: uppqXk1MRuyut4cfcXyxsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="24605688"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 23 Apr 2024 20:31:23 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 2/2] drm/xe: Use xe_bo_lock()/xe_bo_unlock() helpers
Date: Wed, 24 Apr 2024 09:15:15 +0530
Message-Id: <20240424034515.2161938-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424034515.2161938-1-himal.prasad.ghimiray@intel.com>
References: <20240424034515.2161938-1-himal.prasad.ghimiray@intel.com>
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

There is no change in functionality. Using the helper function
defined within the driver for locking/unlocking the reservation
object.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
 drivers/gpu/drm/xe/xe_vm.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 615bbc372ac6..2066d34ddf0b 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1382,7 +1382,7 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
 	if (!snapshot->lrc_snapshot)
 		goto put_bo;
 
-	dma_resv_lock(bo->ttm.base.resv, NULL);
+	xe_bo_lock(bo, false);
 	if (!ttm_bo_vmap(&bo->ttm, &src)) {
 		xe_map_memcpy_from(xe_bo_device(bo),
 				   snapshot->lrc_snapshot, &src, snapshot->lrc_offset,
@@ -1392,7 +1392,7 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
 		kvfree(snapshot->lrc_snapshot);
 		snapshot->lrc_snapshot = NULL;
 	}
-	dma_resv_unlock(bo->ttm.base.resv);
+	xe_bo_unlock(bo);
 put_bo:
 	xe_bo_put(bo);
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e9c8dc6d7b83..75fc3f219456 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3335,7 +3335,7 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 		}
 
 		if (bo) {
-			dma_resv_lock(bo->ttm.base.resv, NULL);
+			xe_bo_lock(bo, false);
 			err = ttm_bo_vmap(&bo->ttm, &src);
 			if (!err) {
 				xe_map_memcpy_from(xe_bo_device(bo),
@@ -3344,7 +3344,7 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 						   snap->snap[i].len);
 				ttm_bo_vunmap(&bo->ttm, &src);
 			}
-			dma_resv_unlock(bo->ttm.base.resv);
+			xe_bo_unlock(bo);
 		} else {
 			void __user *userptr = (void __user *)(size_t)snap->snap[i].bo_ofs;
 
-- 
2.25.1

