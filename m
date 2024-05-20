Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C857C04FFE
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 15:45:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53EE10E4C2;
	Mon, 20 May 2024 15:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hS3t0Xnz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4A810E4C2
 for <intel-xe@lists.freedesktop.org>; Mon, 20 May 2024 15:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716219944; x=1747755944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t9qVNIJOgUI6GviHq0QaQxSeFY+veWWDDU6f2Z8phsQ=;
 b=hS3t0XnzOxHH8xJzI7xiNFzCJjyiUQFlXEdwm8/4/gSrynBOO/PmpGBE
 bm9S8JWR6JPtR7glfWLzYDf7ixpyafESrkwO3RaAMaiGdjZ8yjkVJ5BjR
 CHlUWFs7jA5aFWNdjBp5NBYkJJ/VbU3xvbds1gKREXXf0/hAQ4y+LwhLb
 hrYWFYVf+DAWD3kl/d7xyMEd9unfPxlbZqMT9lcZZOL6+nO8BJsRdI8Tn
 oWcS/5KBLhXXpJo7NIMewX0hjI75uVH692KlTGsYPTO15/rXX2Vf9F9z8
 ohPTVEttZVCKjeuiQar3x/nOavK08avqhbAmXmeleBkuLyuWm7iNeSWQ2 w==;
X-CSE-ConnectionGUID: NqeRCHdqQKSG+3ogho6dag==
X-CSE-MsgGUID: xp1rOM9ASs+q6mmCfGzq2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="34873160"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="34873160"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:44 -0700
X-CSE-ConnectionGUID: 1nlkEINyTUaUbjPLH4Qsow==
X-CSE-MsgGUID: RgVmIxMATJmFzf94n7styQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32610469"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:43 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [CI v2 08/18] drm/xe/irq: move irq_uninstall over to devm
Date: Mon, 20 May 2024 16:42:57 +0100
Message-ID: <20240520154249.52888-26-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520154249.52888-19-matthew.auld@intel.com>
References: <20240520154249.52888-19-matthew.auld@intel.com>
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
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
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
2.45.1

