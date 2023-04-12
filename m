Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ECFC77B76
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 23:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A33410E9F1;
	Wed, 12 Apr 2023 23:29:08 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC0610E9E7
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 23:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681342145; x=1712878145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nFoF65GOYo+1gBrwa2B/LtC82q9EEVTd5bdQUo4xEi8=;
 b=c7NBkWlWgOr693MT3brOLeP4RAdw3wTECBFJjhUdtDP2ExR2g1wkSMS6
 DuKWKOGi+hSc5H24hSx5x2CgaoZlCEINV5i6oU5ETdC/KBZXVF/aZ9GCr
 Z048cgvRQMS/IrhshzuGRidK938pRBkBVbqpBvVOIOQ9bdlkUKHXj0Hrg
 4C7XbIa1mKRVi5fw8iuXcJQfDHI0/Vv+sPOR4X9T4jALNfA6weduk73fu
 +4ig1BQRAET1ZOWsgfutsTFlsyrA6e4fVWHWSdzckhxQpp3wiN7tR/yMd
 GziAx2E1O7Hw+nkvr3pXXRyrmbGmD2X3Q0YqGlthgLeIO0MHMjvLcz9ze A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="332747997"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="332747997"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 16:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="691711996"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="691711996"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 16:29:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 16:28:43 -0700
Message-Id: <20230412232846.3411883-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230412232846.3411883-1-lucas.demarchi@intel.com>
References: <20230412232846.3411883-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/6] fixup! drm/i915/display: Allow fbdev to
 allocate stolen memory
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 46447dd58f3f..2d2388cbc626 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -349,7 +349,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 		else
 			info->fix.smem_start =
 				pci_resource_start(pdev, 2) +
-				xe_bo_addr(obj, 0, GEN8_PAGE_SIZE, &lmem);
+				xe_bo_addr(obj, 0, XE_PAGE_SIZE, &lmem);
 
 		info->fix.smem_len = obj->ttm.base.size;
 	} else {
-- 
2.39.0

