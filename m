Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C734FC25B10
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 12:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743FD112BFB;
	Mon, 29 Apr 2024 12:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MyV/0ONW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95E9112BFD
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 12:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714392953; x=1745928953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x8c2fiOB2OclnhuaqtPK9g0iV+RhOJO7G2CU7PMA/UU=;
 b=MyV/0ONWrgpH/wr0zgqjvyW2UZswRxxOjkg0yiiSQ/7QKO5D9VcpIX+9
 NwfqgGAv17t+53PyR8XXO3pGAueiMUAS1TtcsIzcHQU05Q6VLgpwdVPep
 xXjEzmCYfhOCbee03JRvvpY5pgLxtsTnBJ9ZrYdMFDEsAj2lMw3A1M1+r
 +bEvzdkLq5EFy1J1jeRcSxi9FvBNWX7WWsKaRwAFHuxj90QFF5iDFHwHs
 Iq/HBem0Xt8F2pl8TtDev0LWRguFqRnebxgGB4zAgVmAk0DT1RNwJIsEp
 AdnRt9nQ092Nt3BlDRSKxAvZR+AFctDrHUkt4DblohLSED4Eigl0hmdt+ g==;
X-CSE-ConnectionGUID: vpLGqq6JSiaMJlTx3ndftQ==
X-CSE-MsgGUID: 9B0tDdUZTFqkhJ2DxbOQHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9878398"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9878398"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:15:53 -0700
X-CSE-ConnectionGUID: rFRlJ12ETPKbjpvjkpxMSg==
X-CSE-MsgGUID: ZYegXiVCT/Wc8+E/dyXePg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="49303406"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.199])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:15:51 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 6/8] drm/xe/irq: move irq_uninstall over to devm
Date: Mon, 29 Apr 2024 13:14:42 +0100
Message-ID: <20240429121436.33013-14-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429121436.33013-9-matthew.auld@intel.com>
References: <20240429121436.33013-9-matthew.auld@intel.com>
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

Makes sense to trigger this when the device is removed.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 996806353171..8ee3c300c5e4 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -663,7 +663,7 @@ static irq_handler_t xe_irq_handler(struct xe_device *xe)
 		return xelp_irq_handler;
 }
 
-static void irq_uninstall(struct drm_device *drm, void *arg)
+static void irq_uninstall(void *arg)
 {
 	struct xe_device *xe = arg;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -723,7 +723,7 @@ int xe_irq_install(struct xe_device *xe)
 
 	xe_irq_postinstall(xe);
 
-	err = drmm_add_action_or_reset(&xe->drm, irq_uninstall, xe);
+	err = devm_add_action_or_reset(xe->drm.dev, irq_uninstall, xe);
 	if (err)
 		goto free_irq_handler;
 
@@ -737,7 +737,7 @@ int xe_irq_install(struct xe_device *xe)
 
 void xe_irq_shutdown(struct xe_device *xe)
 {
-	irq_uninstall(&xe->drm, xe);
+	irq_uninstall(xe);
 }
 
 void xe_irq_suspend(struct xe_device *xe)
-- 
2.44.0

