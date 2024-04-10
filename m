Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028E5CD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 17:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E107112C29;
	Wed, 10 Apr 2024 17:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCecwyX8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B93E1130F2
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 17:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712769436; x=1744305436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lnL1yEi35beqSfZ+Q62A1YhavDzbHR4/S+JjcG/tjD4=;
 b=DCecwyX8IELsttNxK4JO6t03b0StS9IN5AIzY3CDMZl2iPbfCo1UtOQu
 VqUkOEPCSXCo37XDfC32ikPg8x+fDm+9lfaFAdoGnCxUPG+tNnfXcpeVS
 noQPZcxD7NLQbWmKXMoAESZGhrbfnyAwla2DlNWvVFi33GBOs2XDUr6wr
 s7wtp7ce/D+vMArFOyJp9myolxyOmpX7joCDZ041Zykvb1a/hhOZPcHqk
 pDljK2oULt8/hVoeZdRFQn3qeocMGOHnA2ZOzmHfT9RatbAcYF2+3R4k8
 e0gv9tjtecQFq2wPJb1/muWR370mv5nDpcDFUQlshN3A2NPIGCnEvKQwH w==;
X-CSE-ConnectionGUID: XqQCzTekTyyWXxC26PMudw==
X-CSE-MsgGUID: x6WpYFZ0QKKXIExltaMnLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8009732"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8009732"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:17:09 -0700
X-CSE-ConnectionGUID: /3W9ED5rR0KPYiDzje9Ylg==
X-CSE-MsgGUID: 4dTEblBWTbCQdKfT5chiVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20717902"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:17:08 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 2/3] drm/xe: Add function to check if BO has single placement
Date: Wed, 10 Apr 2024 19:03:07 +0200
Message-ID: <20240410170308.409-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240410170308.409-1-nirmoy.das@intel.com>
References: <20240410170308.409-1-nirmoy.das@intel.com>
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

