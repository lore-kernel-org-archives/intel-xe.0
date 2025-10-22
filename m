Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25544CCD1BC
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 16:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C040210E80C;
	Wed, 22 Oct 2025 16:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZ3vBs2/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C52D10E80A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 16:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761151191; x=1792687191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YxlGXqGmPq+1kuENkkNrYNbNNQn3i8MB59KNSnmfncY=;
 b=kZ3vBs2/y9+dNTzx/nsBPZLKrewPtZThftpgyGx2nGV5SiPha/iHIhfz
 YpVREGvkz9koudQ8HRoKiwuq6YEKuQFaFeg5Y4K9Vi4xLIJFM6k99DMvY
 pRk78la/WXWF2bofvODw64Hedg7XE6nIOQsHjx9l/fSxkzXHhNfDHwX51
 wsTeC3wdGDDAFHDMUWtk7tcWI96DXsJ6KbtX1YoAaFMDLbfvaC+znBdqA
 c2zvFWAYX4CR7Ty0oagYC95m25IUVEIW5c1qPQijsn9qx8vjHdtiZwpEp
 SNG7zvYWp6GM+rKyEyVRU4RA7lKXugWhR3s5M9KhmJ0vEsVQBeGFPldOd g==;
X-CSE-ConnectionGUID: BF6KN4B3Sqyd+MmPJNvguA==
X-CSE-MsgGUID: pggZAnEuQw+HW/QZdQbnKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73911735"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="73911735"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 09:39:51 -0700
X-CSE-ConnectionGUID: WIdWszSjT1GPI1a7GiLEdA==
X-CSE-MsgGUID: n0rgRMVDTH+Z3LVCBne1Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="189043681"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 09:39:50 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 1/7] drm/xe/migrate: fix offset and len check
Date: Wed, 22 Oct 2025 17:38:30 +0100
Message-ID: <20251022163836.191405-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022163836.191405-1-matthew.auld@intel.com>
References: <20251022163836.191405-1-matthew.auld@intel.com>
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

Restriction here is pitch of 4bytes to match pixel width (32b), and hw
restriction where src and dst must be aligned to 64bytes. If any of that
is not possible then we need a bounce buffer.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3112c966c67d..ce2ad876586c 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1883,7 +1883,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	unsigned long i, j;
 	bool use_pde = xe_migrate_vram_use_pde(sram_addr, len + sram_offset);
 
-	if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
+	if (drm_WARN_ON(&xe->drm, (!IS_ALIGNED(len, pitch)) ||
 			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
 		return ERR_PTR(-EOPNOTSUPP);
 
@@ -2103,8 +2103,9 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 	xe_bo_assert_held(bo);
 
 	/* Use bounce buffer for small access and unaligned access */
-	if (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||
-	    !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES)) {
+	if (!IS_ALIGNED(len, 4) ||
+	    !IS_ALIGNED(page_offset, XE_CACHELINE_BYTES) ||
+	    !IS_ALIGNED(offset, XE_CACHELINE_BYTES)) {
 		int buf_offset = 0;
 		void *bounce;
 		int err;
-- 
2.51.0

