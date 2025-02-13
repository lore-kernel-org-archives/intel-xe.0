Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA249C021AE
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 19:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8724710EB94;
	Thu, 13 Feb 2025 19:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhKohiob";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E0410EB8B
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 19:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739474975; x=1771010975;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=YY7F4cmwOXMpLDqDaz2cu4qJ6OTG3L3OYxhTio6RCks=;
 b=BhKohiobeOQR4vANY9zCk1/3KmLwZ6E5AidtxrG11X4qH9GrkqcC6wS+
 GhaoFHk/CrzUeu/eLgMM1XZZOQE8b/6pk8OY/2c2x4rnvPF8xnaZrzeeK
 30Z71jjIEKBcvY2dK+9fjiw5GBpDcRbI8QWHV/IflRUUwI8l/IibJjB6Z
 8opKOQyy6FwqMX7kk9B6zMsSeUfLRErQfshLdOSIx8X9GX93aBlN1vNXz
 QsK9hIa0ocbaJLHM7r8WHb9nFH21QFbqs0QgtbATdp22FCaNwr5nOxGTP
 gBL02yvCdQmA/hO6Dv6FbmuRrwKWEs12laztMQ4K1NQJpPKCOIflhtqso Q==;
X-CSE-ConnectionGUID: ZwNhUGTOQ764zqgwz5nBOw==
X-CSE-MsgGUID: vT9lHS1CR3ykPEdTMJjwxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40127923"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40127923"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:29:35 -0800
X-CSE-ConnectionGUID: uNDbIgqAS2mwWJIC2dGxqQ==
X-CSE-MsgGUID: 1ovWUlhCQ0y26To+2jm0MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="150416863"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:29:35 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 03/13] drm/xe: Fix error handling in xe_irq_install()
Date: Thu, 13 Feb 2025 11:28:59 -0800
Message-ID: <20250213192909.996148-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213192909.996148-1-lucas.demarchi@intel.com>
References: <20250213192909.996148-1-lucas.demarchi@intel.com>
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

