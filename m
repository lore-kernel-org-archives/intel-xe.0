Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DB1C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 23:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA1210E0D3;
	Tue, 14 May 2024 23:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nv0bLxEr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408CC10E0D3
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 23:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715728967; x=1747264967;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YaH709Oz/lVOmSIKO3Dd4eJLqnpE2D3uvFe5qgY57YI=;
 b=nv0bLxErizIMG0u93/AZtc5Z2YrMA4WE+i1G1kgmqFNLtScD16wQ1lLW
 R1nNHfUM8Gab1dC1P4x3+TUilvu/Imzp4xAUdWkdrqTwGrrU/Herr99rW
 5mxVQKM0mvxb2hNRlZUNVYsgMfWgyGe8qtU/MMZ9oVGayIR+93c/Lx3mQ
 BF83Ve5lC/bwEKIzcb8rfx1wUUn3uDOua9MPdlmj/D+G8dfSahMEnt5Eq
 auZZ/9a2ysv4cpJpPS4MxYfNFnkNHor99Tljp91ehkkbJvOBre+AbaZaT
 NE5X4Dn2oge5oCX9wHEEHV90l91US+SI5sUs59w39ZV8M2F8yfoydV4DG A==;
X-CSE-ConnectionGUID: Ury4tShoRISLmjz+jra9Cg==
X-CSE-MsgGUID: NEvwTehFRuOgbgL+8P8zRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11526416"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; d="scan'208";a="11526416"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 16:22:46 -0700
X-CSE-ConnectionGUID: 37Ex6zvhTaKf174R5tZ8QA==
X-CSE-MsgGUID: R9xSSWICTEueR4a1TFyLJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; d="scan'208";a="30966945"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 16:22:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Only zap PTEs as needed
Date: Tue, 14 May 2024 16:23:25 -0700
Message-Id: <20240514232325.84508-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

If PTEs are already invalidated no need to invalidate again.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 7f792b7feb06..d8817673c097 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -815,8 +815,9 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
 		.tile = tile,
 	};
 	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
+	u8 pt_mask = (vma->tile_present & ~vma->tile_invalidated);
 
-	if (!(vma->tile_present & BIT(tile->id)))
+	if (!(pt_mask & BIT(tile->id)))
 		return false;
 
 	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
-- 
2.34.1

