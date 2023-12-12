Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D26C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 18:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC7910E662;
	Tue, 12 Dec 2023 18:17:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B6310E660
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 18:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702405068; x=1733941068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GfMYG+65GgPgDnGw3B1a2jjdmAYo/fQfsMJFpL5kdvI=;
 b=IiIhn3BL9Zam2XD85/HAcfpNFYEeQy110dvox5ciyVMvRanNnJ06IShn
 V+XBbViHo9qr1QcHZbbfgiM9cW0lqh/ZxxdNyrPFsNwbFCuPWN/qkZIrN
 f0rZON4bQi2/SbxnOUhARDIJJlRY+VgMJp6FgEaWpJLtvhY0FyKjQvE0f
 zOX31IrITEkvVv2a5FEy0xCQf3BqCUwzfG+sZqSkYfDQ3JSRkSHjZIOfy
 SRraRCzH5xVV6upgLmmPF0D3AyeZ65cNAD52eau/Em/rLTU4DqPOmdWHl
 31E2xdYAPMEX2CbEodCjmqJ6oRINLZsBIBicVBN0YmWStQ0dL+Qzo2xib Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="425968001"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="425968001"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 10:17:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="749806388"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="749806388"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga006.jf.intel.com with ESMTP; 12 Dec 2023 10:17:46 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 03/10] drm/xe/xe2: Allocate extra pages for ccs during bo
 create
Date: Tue, 12 Dec 2023 23:55:26 +0530
Message-Id: <20231212182533.1722705-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212182533.1722705-1-himal.prasad.ghimiray@intel.com>
References: <20231212182533.1722705-1-himal.prasad.ghimiray@intel.com>
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

Incase of bo move from PL_TT to PL_SYSTEM these pages will be used to
store ccs metadata from flat ccs. And during bo move to PL_TT from
PL_SYSTEM the metadata will be copied from extra pages to flat ccs. This
copy of ccs metadata ensures ccs remains unaltered between swapping out
of bo to disk and its restore to PL_TT.

Bspec:58796

v2:
 - For dgfx ensure system bit is not set.
 - Modify comments.(Thomas)

v3:
 - Separate out patch to modify main memory to ccs memory ratio.(Matt)

v4:
 - Update description for commit message.
 - Make bo allocation routine more readable.(Matt)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 13ebe33bb7a2..c10aa5a63a70 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2160,19 +2160,24 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
  * placed in system memory.
  * @bo: The xe_bo
  *
- * If a bo has an allowable placement in XE_PL_TT memory, it can't use
- * flat CCS compression, because the GPU then has no way to access the
- * CCS metadata using relevant commands. For the opposite case, we need to
- * allocate storage for the CCS metadata when the BO is not resident in
- * VRAM memory.
- *
  * Return: true if extra pages need to be allocated, false otherwise.
  */
 bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
 {
-	return bo->ttm.type == ttm_bo_type_device &&
-		!(bo->flags & XE_BO_CREATE_SYSTEM_BIT) &&
-		(bo->flags & XE_BO_CREATE_VRAM_MASK);
+	struct xe_device *xe = xe_bo_device(bo);
+
+	if (!xe_device_has_flat_ccs(xe) || bo->ttm.type != ttm_bo_type_device)
+		return false;
+
+	/* On discrete GPUs, if the GPU can access this buffer from
+	 * system memory (i.e., it allows XE_PL_TT placement), FlatCCS
+	 * can't be used since there's no CCS storage associated with
+	 * non-VRAM addresses.
+	 */
+	if (IS_DGFX(xe) && (bo->flags & XE_BO_CREATE_SYSTEM_BIT))
+		return false;
+
+	return true;
 }
 
 /**
-- 
2.25.1

