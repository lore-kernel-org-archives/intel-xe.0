Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD64C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 07:43:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1002810E431;
	Wed, 26 Jul 2023 07:43:15 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A316010E42F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 07:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690357389; x=1721893389;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zC/rfUSdQWkU13HCahqxIFVMB1km1e36Jk8z9H2ZqnM=;
 b=PLIP5R3KIQlPpo4ybe5AdSqnKtdrXCyHKinfyueHEsef6MRTnQ08vRij
 cpPF5kcpJ1DLThPpfQj3l+y6FORSglHBEyL2w9/2zuqvuRS+BM0kAtBXO
 e+UmNP1xraoF/J6GbyQwQWEpo+g4xAwGlGabaBQXAJnc7Sljv/Xf6FnxL
 M0tcBITz5HUU6+OabCNdgRzwjrlgde1p0NgfiWSS3cru8w6EM9/tU5DtU
 RK7GQVDQPhSRWUxYYViHAB3knqWpC2/LSwbMW7+XxvJJYB+Kd6f0gThG9
 P1YZttqu3s4UjOoT9L24Tf7PISbatNs8hmH/ASksBlfJ16XwSjI8jEcoT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="357946521"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="357946521"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 00:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="900314523"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="900314523"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 00:43:06 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jul 2023 09:42:59 +0200
Message-Id: <20230726074300.13066-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Enable atomics on smem
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
Cc: joonas.lahtinen@linux.intel.com, lucas.demarchi@intel.com,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Atomics works on smem as well on supported platforms so
set AE PTE bit on smem as well if XE_VMA_ATOMIC_PTE_BIT
flag is set.

v2: Remove platform check(Lucas)

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d4660520ac2c..3bd6dd048305 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -768,10 +768,11 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
 	int ret;
 
+	if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
+		xe_walk.default_pte = XE_USM_PPGTT_PTE_AE;
+
 	if (is_vram) {
-		xe_walk.default_pte = XE_PPGTT_PTE_LM;
-		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
-			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
+		xe_walk.default_pte |= XE_PPGTT_PTE_LM;
 		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
 		xe_walk.cache = XE_CACHE_WB;
 	} else {
-- 
2.39.0

