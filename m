Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAC0C04FFF
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 15:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D69A112662;
	Mon, 15 Apr 2024 15:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cFqASc+P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BDC11265C
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 15:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713193604; x=1744729604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lnL1yEi35beqSfZ+Q62A1YhavDzbHR4/S+JjcG/tjD4=;
 b=cFqASc+PyH4klmMN0gLFt6Ak+czitMGChPDnwWSc1QPqcX7WHcXFiZpJ
 w6TTL3kKtJObp2C85467qPvmf58qNbp7mKFkG05Ztl8FdnU3peHqmakoY
 /VWLvWprj6GZG+std+lpV6IEpP7ivjMDuplqqVD0rcjJefaApvPYu660V
 MLnFediZYYHPJtWb/beBpOeWMbUZOXhE9FzapOKbsTBLZLtOKT78rK52D
 sthI7gtNqMgF3DpZGF3h8elQoq0xLVkx4AwsPRgMmMhJsCwUqNfx4dEEl
 baj2Wr7HcOSYlHECRl6olkUMPFtlZldGH5vvqUz2lwXGt+xQSFR/y3Pdx w==;
X-CSE-ConnectionGUID: gyAhmvfjTxK78vI93AWkXw==
X-CSE-MsgGUID: p7d8VUhkTa6YzLSy820apA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="20013309"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="20013309"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 08:06:43 -0700
X-CSE-ConnectionGUID: gdk5ZeuCQ6OL6zOlwIDQog==
X-CSE-MsgGUID: PmkIZZszTkqJm8vz4pYxqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22414853"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 08:06:42 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v3 3/7] drm/xe: Add function to check if BO has single
 placement
Date: Mon, 15 Apr 2024 16:52:10 +0200
Message-ID: <20240415145214.25641-4-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240415145214.25641-1-nirmoy.das@intel.com>
References: <20240415145214.25641-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

A new helper function xe_bo_has_single_placement() to check
if a BO has single placement.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index fdeb3691d3f6..281126667ba7 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -94,6 +94,20 @@ bool xe_bo_is_stolen(struct xe_bo *bo)
 	return bo->ttm.resource->mem_type == XE_PL_STOLEN;
 }
 
+/**
+ * xe_bo_has_single_placement - check if BO is placed only in one memory location
+ * @bo: The BO
+ *
+ * This function checks whether a given BO is placed in only one memory location.
+ *
+ * Returns: true if the BO is placed in a single memory location, false otherwise.
+ *
+ */
+bool xe_bo_has_single_placement(struct xe_bo *bo)
+{
+	return bo->placement.num_placement == 1;
+}
+
 /**
  * xe_bo_is_stolen_devmem - check if BO is of stolen type accessed via PCI BAR
  * @bo: The BO
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index a885b14bf595..6de894c728f5 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -206,6 +206,7 @@ bool mem_type_is_vram(u32 mem_type);
 bool xe_bo_is_vram(struct xe_bo *bo);
 bool xe_bo_is_stolen(struct xe_bo *bo);
 bool xe_bo_is_stolen_devmem(struct xe_bo *bo);
+bool xe_bo_has_single_placement(struct xe_bo *bo);
 uint64_t vram_region_gpu_offset(struct ttm_resource *res);
 
 bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
-- 
2.42.0

