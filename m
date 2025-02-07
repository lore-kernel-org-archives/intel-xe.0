Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008D8C021A3
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 22:22:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE4510EBC4;
	Fri,  7 Feb 2025 22:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fd3iqVwz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E33810EBB5
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 22:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738966802; x=1770502802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ojq0w+QpGfrSNxzkliFDOUj9P45fP+/x7YIDACC09ng=;
 b=fd3iqVwzDA12UR3HhuyQniz7/07/uG9YS0eqyGLvTwPZ54zg2dMgHU2/
 78fGyP/wHPsJJVQCjqes9yaeiTybX4Y2iL0skVqHO0BSCniSAK6xNnycx
 5oR6124aSD4swmEXVmVFzWJrgkLpMNaP26mxzptKrIsKPCYgMLduGN0AH
 F0VGnYKXbLcVTOB2lgT6LraWLuUtQhUpGk7r4R3dz7NxwMQBrsKfsjZWj
 jdlXm64rei8iTdSLCj+4xNMxUc31YnZmxn60TQvgP+mB/W2LNqPB/pFD/
 u7OIVGLLcEqSFD6nxK9pDjFPAWexjnSfjXpNWa8UEfUHxqmxRcLYblEvf A==;
X-CSE-ConnectionGUID: zKwSGvyGTNiRqLHKfFRzCw==
X-CSE-MsgGUID: ZU70L6h5ROKJRDZwLa64YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51050681"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51050681"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 14:20:01 -0800
X-CSE-ConnectionGUID: z0zjvs+tTOuJ7DbQjbxHiA==
X-CSE-MsgGUID: wpdneG/oRK6yau2m/yWwqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="112158401"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 14:20:01 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 02/13] drm/xe: Fix error handling in xe_irq_install()
Date: Fri,  7 Feb 2025 14:19:34 -0800
Message-ID: <20250207221945.2878241-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207221945.2878241-1-lucas.demarchi@intel.com>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
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

When devm_add_action_or_reset() fails, it already calls the function
passed as parameter and that function is already free'ing the irqs.
Drop the goto and just return.

The caller, xe_device_probe(), should also do the same thing instead of
wrongly doing `goto err` and calling the unrelated xe_display_fini()
function.

Fixes: 14d25d8d684d ("drm/xe: change old msi irq api to a new one")
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index bf092e6391c7d..5362d3174b060 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -775,19 +775,7 @@ int xe_irq_install(struct xe_device *xe)
 
 	xe_irq_postinstall(xe);
 
-	err = devm_add_action_or_reset(xe->drm.dev, irq_uninstall, xe);
-	if (err)
-		goto free_irq_handler;
-
-	return 0;
-
-free_irq_handler:
-	if (xe_device_has_msix(xe))
-		xe_irq_msix_free(xe);
-	else
-		xe_irq_msi_free(xe);
-
-	return err;
+	return devm_add_action_or_reset(xe->drm.dev, irq_uninstall, xe);
 }
 
 static void xe_irq_msi_synchronize_irq(struct xe_device *xe)
-- 
2.48.1

