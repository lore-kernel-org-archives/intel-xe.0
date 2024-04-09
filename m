Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5E2CD129D
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7C0112EFA;
	Tue,  9 Apr 2024 20:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQBdb0ca";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94318112F25
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693095; x=1744229095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qv1cpVR5yQ8ZSXQI4tEUbPmaGpl2MmJOI4a+J/f95KQ=;
 b=UQBdb0caEoASAxRwkJPNV4c8bMLV7+PVYNvah++o76xZhgi8MrM7VEeR
 Nkk8nRBKvVPlM0F8MITUEVfRfDEKDBmZDmSNflKg6j0pTpdoOhzvJQ3Lf
 LOn5u7gU9LfPXkQp/NY09I3SnUg9/K5lkRCzuSL6zoyB8UoIBQLE8lgsO
 mQaTgsobKs6E/0aHDv3ESdupKmzA/nPIdS/hGPPfn3Cu2o1LEE8i23jei
 zfupFX7qUsh6H/cpLvFkFV12dFKzP02R7zqEUnUQyveQM3qcgIzJyKTfn
 rD2MiKPtkAdNAPth/BV5P5Av4kLpVdmTTPp+LmINhUZgrp0U277HAGH7o A==;
X-CSE-ConnectionGUID: k32UzsdQSIKfbF0Ftogyqw==
X-CSE-MsgGUID: Pf+Zo9bOQGq4vswFwSgHPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803761"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803761"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
X-CSE-ConnectionGUID: vFCOMujESrO2CRfMCp48TA==
X-CSE-MsgGUID: TuHycIOpSYC8NsS8F2Awqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773769"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 19/31] drm/xe/svm: Determine a vma is backed by device memory
Date: Tue,  9 Apr 2024 16:17:30 -0400
Message-Id: <20240409201742.3042626-20-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
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

With system allocator, a userptr can now be back by device
memory also. Introduce a helper function xe_vma_is_devmem
to determine whether a vma is backed by device memory.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 846e896edcb5..525092111be9 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -577,6 +577,17 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
 	.pt_entry = xe_pt_stage_bind_entry,
 };
 
+static bool xe_vma_is_devmem(struct xe_vma *vma)
+{
+	if (xe_vma_is_userptr(vma)) {
+		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
+		return uvma->userptr.is_device_pages;
+	} else {
+		struct xe_bo *bo = xe_vma_bo(vma);
+		return bo && (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
+	}
+}
+
 /**
  * xe_pt_stage_bind() - Build a disconnected page-table tree for a given address
  * range.
@@ -601,8 +612,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_bo *bo = xe_vma_bo(vma);
-	bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
-		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
+	bool is_devmem = xe_vma_is_devmem(vma);
 	struct xe_res_cursor curs;
 	struct xe_pt_stage_bind_walk xe_walk = {
 		.base = {
-- 
2.26.3

