Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A86C10F13
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 13:34:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E8310E41B;
	Mon, 11 Dec 2023 13:34:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F98D10E3F8
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 13:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702301669; x=1733837669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OshuMZLpWTHSKgZA7tWim8d3s/T8zyOQok00M6V5wIo=;
 b=hf8pEg71IRjobuIG8PtUc6i1nmAd4OfiWgWMzNQZylr8r6Ii+y/GKEpo
 OC4T8wgDaVDnkHsppumZ3lS/Y2kibl+iTc+Iv0qAbnOpxdi4hEEU0cv6k
 8UFlEk011cKXYG1zBkj3EMFCjafmgi/FZPTYlvBvna8KZuboG1a0KLpRu
 4Tdyrp2XJEs0QBUg7JJQ45ImQiYiljwcpAakkQI2FoOKUeR7uqTOZezN0
 D9ZnpmbgnGbAJ9NX3G1D8/goi1HWcOV8k9fLc4V7E9qgX+kVDu5vDHTjw
 Sbgyx6w7+eXcZf8Esz4PAVl487INXwlvgazklLZzJ/M+eqvFvbbKMOIRp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="461126589"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="461126589"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 05:33:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="722788047"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="722788047"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga003.jf.intel.com with ESMTP; 11 Dec 2023 05:33:37 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 03/10] drm/xe/xe2: Allocate extra pages for ccs during bo
 create
Date: Mon, 11 Dec 2023 19:11:16 +0530
Message-Id: <20231211134123.1645793-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211134123.1645793-1-himal.prasad.ghimiray@intel.com>
References: <20231211134123.1645793-1-himal.prasad.ghimiray@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Allocate extra pages to handle ccs region for igfx too.

Bspec:58796

v2:
 - For dgfx ensure system bit is not set.
 - Modify comments.(Thomas)

v3:
 - Seperate out patch to modify main memory to ccs memory ratio.(Matt)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7e25c8b7a01a..0df8f6a77040 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2183,8 +2183,8 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
  * placed in system memory.
  * @bo: The xe_bo
  *
- * If a bo has an allowable placement in XE_PL_TT memory, it can't use
- * flat CCS compression, because the GPU then has no way to access the
+ * For dgfx if a bo has an allowable placement in XE_PL_TT memory, it can't
+ * use flat CCS compression, because the GPU then has no way to access the
  * CCS metadata using relevant commands. For the opposite case, we need to
  * allocate storage for the CCS metadata when the BO is not resident in
  * VRAM memory.
@@ -2193,9 +2193,13 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
  */
 bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
 {
-	return bo->ttm.type == ttm_bo_type_device &&
-		!(bo->flags & XE_BO_CREATE_SYSTEM_BIT) &&
-		(bo->flags & XE_BO_CREATE_VRAM_MASK);
+	struct xe_device *xe = xe_bo_device(bo);
+
+	return (xe_device_has_flat_ccs(xe) &&
+		bo->ttm.type == ttm_bo_type_device &&
+		((IS_DGFX(xe) && (bo->flags & XE_BO_CREATE_VRAM_MASK) &&
+		  !(bo->flags & XE_BO_CREATE_SYSTEM_BIT)) ||
+		(!IS_DGFX(xe) && (bo->flags & XE_BO_CREATE_SYSTEM_BIT))));
 }
 
 /**
-- 
2.25.1

