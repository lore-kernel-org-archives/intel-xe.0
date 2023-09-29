Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BB8E743E1
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 05:04:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D46310E0E0;
	Fri, 29 Sep 2023 05:04:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEA310E0E0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 05:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695963868; x=1727499868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H2Ss3Q3i7X5ehY59hBkUtTaCS4wdUSVg3/TiPOdhVzA=;
 b=e4ArPj48+s0pbtS7M63/33CnUYSnueCMzQcFtD3ybP0ltoB/dU00IU8c
 vu21npnLd43y9Hvu/jnysOXvzME4hbGn52KmG6/rkahb4FbHy5cr5MGBk
 Qv+uFpcY0941nrxZC/D5pf+n6BEzejAlsr/YaSWMOLIXuJ36kH6DrA/yE
 3ixLaCTMYu3p5NoFOpRGkSMckS/B0NX5OpqrG94mOGe0hIQV5NmK/7RdM
 mZ7CPgfS8l2dIWKtJrUfGQw/ScN0AsEdjRfu6SyDq2LExNS/l2xRP41bG
 bHkDivqT8PO9RL1CeseqfaTEEikD25zSsfYveiGSyYj20BskSzDTat+iy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="413142026"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="413142026"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 22:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="865570960"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="865570960"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 22:04:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 22:02:49 -0700
Message-Id: <20230929050253.3153804-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230929050253.3153804-1-lucas.demarchi@intel.com>
References: <20230929050253.3153804-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/7] drm/xe/xe2: Follow XeHPC for TLB invalidation
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Register GUC_TLB_INV_CR is gone in xe2. When GuC submission is not yet
enabled, make sure to follow the same path as XeHPC.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 99b54794917e..d7b3d008ce57 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -263,7 +263,7 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 	} else if (xe_device_uc_enabled(gt_to_xe(gt))) {
 		struct xe_device *xe = gt_to_xe(gt);
 
-		if (xe->info.platform == XE_PVC) {
+		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
 			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
 					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
 			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC0,
-- 
2.40.1

