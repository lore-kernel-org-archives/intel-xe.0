Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3851C41513
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 12:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7847211224C;
	Tue, 28 May 2024 12:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TOtC02Nq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FB210E46B
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 12:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716899644; x=1748435644;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=qUerF/d1rDPz5mwJ0pwkNktJW90GVhV3zAQPVnDy+HY=;
 b=TOtC02NqB6JpNWyFH71oGQIfDfx+zDfpnXHAnJPUcVXoJIJDvKyP/U7V
 zwk5nkFP4oXRnsLIPHUP5zbBkYDEW9tQQVCkaj3lzcH0g1SJYMs1FPFo+
 2A8zRVNQny17eGQlnK8mviFWWhunZY4SaFZ9msdve+Fae5FDSC40dMiKE
 aWY7zQtQ+nBKpsuqW7RP+hd38m/YS0FSjocmqXTTzFLb/5YT+e/EdYcYG
 3hP4v3ByCfgngREwOR2UyebujuGSxElTYd4iV+y43GRSIIjKa2iRIwbI3
 lMv/P3D5AxgaP2a++SZAyRzo8BxRddIviio7DMGZj+PkkTMJqTI2cdT0k w==;
X-CSE-ConnectionGUID: QY4XVFdVS7OhNtDVgeKjXQ==
X-CSE-MsgGUID: 7upZnD8gSi+B9o9vOroKWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13065026"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13065026"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 05:34:04 -0700
X-CSE-ConnectionGUID: 1ZmxDXm2TdO77S6hqaSQ+w==
X-CSE-MsgGUID: nWPI5steQ6+tZtGhCroI+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="39880424"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.233])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 05:34:04 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v5 10/22] drm/ttm: Use fault-injection to test error paths
Date: Tue, 28 May 2024 14:33:31 +0200
Message-ID: <20240528123343.169970-11-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240528123343.169970-1-thomas.hellstrom@linux.intel.com>
References: <20240528123343.169970-1-thomas.hellstrom@linux.intel.com>
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

Use fault-injection to test partial TTM swapout and interrupted swapin.
Return -EINTR for swapin to test the callers ability to handle and
restart the swapin, and on swapout perform a partial swapout to test that
the swapin and release_shrunken functionality.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/Kconfig        | 10 ++++++++++
 drivers/gpu/drm/ttm/ttm_pool.c | 17 ++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 9703429de6b9..928cf13ff537 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -259,6 +259,16 @@ config DRM_GPUVM
 	  GPU-VM representation providing helpers to manage a GPUs virtual
 	  address space
 
+config DRM_TTM_BACKUP_FAULT_INJECT
+	bool "Enable fault injection during TTM backup"
+	depends on DRM_TTM
+	default n
+	help
+	  Inject recoverable failures during TTM backup and recovery of
+	  backed-up objects. For DRM driver developers only.
+
+	  If in doubt, choose N.
+
 config DRM_BUDDY
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 38e50cf81b0a..d32a1f2e5e50 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -431,6 +431,7 @@ static int ttm_pool_restore_tt(struct ttm_pool_tt_restore *restore,
 			       struct ttm_backup *backup,
 			       struct ttm_operation_ctx *ctx)
 {
+	static unsigned long __maybe_unused swappedin;
 	unsigned int i, nr = 1 << restore->order;
 	int ret = 0;
 
@@ -446,6 +447,13 @@ static int ttm_pool_restore_tt(struct ttm_pool_tt_restore *restore,
 			if (handle == 0)
 				continue;
 
+			if (IS_ENABLED(CONFIG_DRM_TTM_BACKUP_FAULT_INJECT) &&
+			    ctx->interruptible &&
+			    ++swappedin % 100 == 0) {
+				ret = -EINTR;
+				break;
+			}
+
 			ret = backup->ops->copy_backed_up_page
 				(backup, restore->first_page[i],
 				 handle, ctx->interruptible);
@@ -892,7 +900,14 @@ long ttm_pool_backup_tt(struct ttm_pool *pool, struct ttm_tt *ttm, bool purge,
 
 	alloc_gfp = GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN | __GFP_RETRY_MAYFAIL;
 
-	for (i = 0; i < ttm->num_pages; ++i) {
+	num_pages = ttm->num_pages;
+
+	/* Pretend doing fault injection by shrinking only half of the pages. */
+
+	if (IS_ENABLED(CONFIG_DRM_TTM_BACKUP_FAULT_INJECT))
+		num_pages = DIV_ROUND_UP(num_pages, 2);
+
+	for (i = 0; i < num_pages; ++i) {
 		page = ttm->pages[i];
 		if (unlikely(!page))
 			continue;
-- 
2.44.0

