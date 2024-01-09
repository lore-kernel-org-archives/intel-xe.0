Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7FFC47073
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 11:24:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4204C10E41E;
	Tue,  9 Jan 2024 11:24:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3A610E41E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 11:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704799478; x=1736335478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ketp4h3vWg4yeHv99Akibt32liNVPE1Ix9E5Cs9Aj/M=;
 b=IGi0x6tkFGVlt6EA590EldZ3jv1aFdTtKsTYkv5Iog6qArevcO6jXtdd
 UYFnbHjlUktErQTs8hzup6MLOH14mVR2p6QfRdy8RA8uqPguiHG94mAyX
 JWRg2ZplLm1kvJLdQ7E1vzUZPSzBdynzIuT9MxNOdoTXJ2HhEkSU4jkSx
 97+Uqbo0Mn73J0D5nDGMIn3ghLYIKfiSC5/O5kK4Ef+5bdXmsch04C3Ep
 6zYTxby2ad4JP9CRVvkSt9BJRjWBkJB7JRC1l+g7owSpcB+fAqQlnOTlU
 VbD9r5Zzi1gL4wSdYiPrEskt85lxuzbddmYtwsyPgv5YsnJtzF3g/+mJ7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5537230"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="5537230"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 03:24:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="900737620"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="900737620"
Received: from djustese-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.147])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 03:24:30 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/4] drm/xe: Annotate xe_mem_region::mapping with __iomem
Date: Tue,  9 Jan 2024 12:24:03 +0100
Message-ID: <20240109112405.108136-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109112405.108136-1-thomas.hellstrom@linux.intel.com>
References: <20240109112405.108136-1-thomas.hellstrom@linux.intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The pointer points to IO memory, but the __iomem annotation was
incorrectly placed. Annotate it correctly, update its usage accordingly
and fix the corresponding sparse error.

Fixes: 0887a2e7ab62 ("drm/xe: Make xe_mem_region struct")
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 4 ++--
 drivers/gpu/drm/xe/xe_device_types.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 8e4a3b1f6b93..3cd29bd015a0 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -442,7 +442,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 
 		if (vram->mapping &&
 		    mem->placement & TTM_PL_FLAG_CONTIGUOUS)
-			mem->bus.addr = (u8 *)vram->mapping +
+			mem->bus.addr = (u8 __force *)vram->mapping +
 				mem->bus.offset;
 
 		mem->bus.offset += vram->io_start;
@@ -734,7 +734,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 			/* Create a new VMAP once kernel BO back in VRAM */
 			if (!ret && resource_is_vram(new_mem)) {
 				struct xe_mem_region *vram = res_to_mem_region(new_mem);
-				void *new_addr = vram->mapping +
+				void __iomem *new_addr = vram->mapping +
 					(new_mem->start << PAGE_SHIFT);
 
 				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 71f23ac365e6..171e8615d184 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -98,7 +98,7 @@ struct xe_mem_region {
 	 */
 	resource_size_t actual_physical_size;
 	/** @mapping: pointer to VRAM mappable space */
-	void *__iomem mapping;
+	void __iomem *mapping;
 };
 
 /**
-- 
2.43.0

