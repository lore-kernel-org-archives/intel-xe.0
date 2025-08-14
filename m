Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B5ACA0ED1
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 10:32:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012CF10E845;
	Thu, 14 Aug 2025 10:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KxG8F2na";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E7010E845
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 10:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755167566; x=1786703566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=954s/z7rH/SJuSQUnMn49CF+qcUQ6yBwdZpVA1Tew8I=;
 b=KxG8F2nasJd7cHBiBNbLU1JU9bNxlZidFDQAhKfH6IgGyn+v5LaaUAwf
 B8k8DTfHZcRqx47q/qifbv4uVPeHa8zGT1qEqAjgiFgQMZbfp+qgZebJ2
 gLwS0qOJtDl/L8wEOYmSZIxLldXR7qeJj9NwD4Odb1n1Dr/Q8f6UyDuBh
 sYIoRliPqHy514z6ghDQx7HOICEKS+MVnLlSanqBylwa+iQUOkO4u6yck
 tUGqgnUcrl1C0+TWqkLgGP3j7xpn78uZfhY0+CelOoZAo8qCL5YEds+6a
 e+ofOjEU8xHO8E5R16P6invtOa1/5UjHkdSzlKi+OJGrNZEttUO4ctIm/ A==;
X-CSE-ConnectionGUID: eGbB6NmNTEOb4c2SmxEJGQ==
X-CSE-MsgGUID: /MKerjKbRLS1LH0w/LWKaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68083737"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="68083737"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 03:32:46 -0700
X-CSE-ConnectionGUID: YfY5twq1QBSu+ODHLnYPQQ==
X-CSE-MsgGUID: 23+52zvjTEyekxceWtgrrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="197579251"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 14 Aug 2025 03:32:43 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Caterina Shablia <caterina.shablia@collabora.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 02/24] drm/gpuvm: Kill drm_gpuva_init()
Date: Thu, 14 Aug 2025 16:29:28 +0530
Message-Id: <20250814105950.2177480-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
References: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
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

From: Boris Brezillon <boris.brezillon@collabora.com>

drm_gpuva_init() only has one internal user, and given we are about to
add new optional fields, it only add maintenance burden for no real
benefit, so let's kill the thing now.

v2
- Remove usage from msm

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c |  8 +++++++-
 include/drm/drm_gpuvm.h           | 15 ++++-----------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index e106428369ef..3e97d3d61430 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -371,6 +371,12 @@ struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 		u64 offset, u64 range_start, u64 range_end)
 {
+	struct drm_gpuva_op_map op_map = {
+		.va.addr = range_start,
+		.va.range = range_end - range_start,
+		.gem.obj = obj,
+		.gem.offset = offset,
+	};
 	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
 	struct drm_gpuvm_bo *vm_bo;
 	struct msm_gem_vma *vma;
@@ -399,7 +405,7 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 	if (obj)
 		GEM_WARN_ON((range_end - range_start) > obj->size);
 
-	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, offset);
+	drm_gpuva_init_from_op(&vma->base, &op_map);
 	vma->mapped = false;
 
 	ret = drm_gpuva_insert(&vm->base, &vma->base);
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index a9fa44148e0c..05347ac6cc73 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -160,15 +160,6 @@ struct drm_gpuva *drm_gpuva_find_first(struct drm_gpuvm *gpuvm,
 struct drm_gpuva *drm_gpuva_find_prev(struct drm_gpuvm *gpuvm, u64 start);
 struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuvm *gpuvm, u64 end);
 
-static inline void drm_gpuva_init(struct drm_gpuva *va, u64 addr, u64 range,
-				  struct drm_gem_object *obj, u64 offset)
-{
-	va->va.addr = addr;
-	va->va.range = range;
-	va->gem.obj = obj;
-	va->gem.offset = offset;
-}
-
 /**
  * drm_gpuva_invalidate() - sets whether the backing GEM of this &drm_gpuva is
  * invalidated
@@ -1089,8 +1080,10 @@ void drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
 static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
 					  struct drm_gpuva_op_map *op)
 {
-	drm_gpuva_init(va, op->va.addr, op->va.range,
-		       op->gem.obj, op->gem.offset);
+	va->va.addr = op->va.addr;
+	va->va.range = op->va.range;
+	va->gem.obj = op->gem.obj;
+	va->gem.offset = op->gem.offset;
 }
 
 /**
-- 
2.34.1

