Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7170DC02194
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 22:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3875B10E43D;
	Fri, 31 Jan 2025 22:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JXxfiXwj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395F310E226
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 22:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738362717; x=1769898717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sAhjr89bTYS/H/N+6KjIFqIkU4KefnOFSm33i7d9X3c=;
 b=JXxfiXwjyus5ITgBC+f9mA7WY+Pzp4COtx20Uzcx5xWe7ka6Io6Wf6RS
 ZR4HnHYtZzhCpuhQEfXl/4VYcAZxhE+jFqxt5JkEA5ppIHNT0zJ1bAEN8
 LR0cBFCY+wuBYwzEeiu1G7YNR1Yfb1XtLnNiLGB4Au6EPyXFENlU0Zn13
 elkcW0WZISYK7nZrjXwB4o1Qm05LTYkn7aCbI6NoM2o3iwGYHXzj6h/oE
 G/wNV3ywku7PK6MZuh4dro5xDhGf7kCwNVOMhL7UFuuiS68Tf2VJSfZGP
 CAeKtqAAt7PuAIfu83YrdUDOltmwj9ZLgTuvrXidVlJYTAQOq4J0rRt6J g==;
X-CSE-ConnectionGUID: MJT3a79/Svy+3gnrjsRjxA==
X-CSE-MsgGUID: uSH9t4QTT86uIrXtRjQsFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38149061"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="38149061"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 14:31:56 -0800
X-CSE-ConnectionGUID: IdQ0WYTgT1mPP/4UyTWIZQ==
X-CSE-MsgGUID: aLMbKBXqSHuoRjecIMUQuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110622313"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 14:31:56 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Dani Liberman <dliberman@habana.ai>, Ohad Sharabi <osharabi@habana.ai>
Subject: [PATCH 2/7] drm/xe: Fix error handling in xe_irq_install()
Date: Fri, 31 Jan 2025 14:31:35 -0800
Message-ID: <20250131223140.4144292-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250131223140.4144292-1-lucas.demarchi@intel.com>
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
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

Cc: Dani Liberman <dliberman@habana.ai>
Cc: Ohad Sharabi <osharabi@habana.ai>
Fixes: 14d25d8d684d ("drm/xe: change old msi irq api to a new one")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  2 +-
 drivers/gpu/drm/xe/xe_irq.c    | 14 +-------------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 589bbe21c32b4..2e874906d4f31 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -846,7 +846,7 @@ int xe_device_probe(struct xe_device *xe)
 
 	err = xe_irq_install(xe);
 	if (err)
-		goto err;
+		return err;
 
 	for_each_gt(gt, xe, id) {
 		last_gt = id;
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 32f5a67a917b5..08552ee3fb94b 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -757,19 +757,7 @@ int xe_irq_install(struct xe_device *xe)
 
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
2.48.0

