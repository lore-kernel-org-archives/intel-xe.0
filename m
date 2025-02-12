Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF2CC021A7
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 19:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E8410E974;
	Wed, 12 Feb 2025 19:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jiidOZyb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9671410E206
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 19:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739388995; x=1770924995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YY7F4cmwOXMpLDqDaz2cu4qJ6OTG3L3OYxhTio6RCks=;
 b=jiidOZybuOXUu6/MQEROokU5UEfhcgcjswyghsXkzj567nV4TwGyLhVt
 c83f9qrlzt/dRIk6tDZrFMM++hQYJBijf8/HsP0lYRnWy/R5I7R1Rmm2d
 foS/OlazC3NEOWN3U4WBFMt3Drurq1RYAZppYoCqjw88bj4VuRu/iy0eq
 2bNdg1Ud7iToNn7yIGmDXMnGLL8dJcwSnH/51qxV06QfGdRPx8eHLH/hn
 uC7FjbHG0OPdQwhckmiuTs422hmMX0XnsbGJJvH9h2+HJWlKA8fEL23ol
 1PhTEsnWNaKVZkOwjnJb19pZdVuILYPEZVDLIIkAu1s/WQfRA5b3xqdrC A==;
X-CSE-ConnectionGUID: a841jA/LSpKR99z8J87dow==
X-CSE-MsgGUID: THQNLDMxRPa+4tdHHVGCIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40184238"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40184238"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:34 -0800
X-CSE-ConnectionGUID: rOG/Cg8kTYKhkuUXdPfBow==
X-CSE-MsgGUID: EV6dUCMRTrqoBGh9IBW7IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="113437861"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:34 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 03/13] drm/xe: Fix error handling in xe_irq_install()
Date: Wed, 12 Feb 2025 11:35:50 -0800
Message-ID: <20250212193600.475089-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212193600.475089-1-lucas.demarchi@intel.com>
References: <20250212193600.475089-1-lucas.demarchi@intel.com>
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
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
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

