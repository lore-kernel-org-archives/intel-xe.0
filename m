Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F33C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 18:12:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F1710EF88;
	Fri, 10 May 2024 18:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gooJnU4n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBD210EF42
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 18:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715364760; x=1746900760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vAfAngcxga7WXimRbtEMtUtIhzx8LrFn/6PjiX4sE7w=;
 b=gooJnU4nFXcxur2kJ4ssIZY6JyRNYd9bu+cwWKcPlgFGSMfszXcgDNJi
 InbL4EcmTUuOsJUnJY8iUzATheN0669bgI9lPP9YivwVdzdaMFfp8PyQa
 ZA/js5IHlpev8Z8SJ50TqEQyEZOhSm80AKwWI8RME81tt81pggY5X3tlL
 B5ETgej1GlEu49D49Pnq24iWq9diOjPA7mM/qOTJKkMSIeGT19brPN36L
 c2sCAg1SOCbICChFocsm1JjLKRvlCZDQpf4a5HwMagZfi4qpOW6/WL4h5
 9Bu9zL5NAsGyd/AAyLNdVECmzRIY3RwXocK0CFbwy/aOghqYNevbCeLL/ w==;
X-CSE-ConnectionGUID: +Inpu7puRkCsd3cz0DubcA==
X-CSE-MsgGUID: KXYtTm3lRVaENZwXY4zBjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28844597"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28844597"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:40 -0700
X-CSE-ConnectionGUID: VQIm2v/fR42Qpjs/49uGCQ==
X-CSE-MsgGUID: YOrMpUfSS92FoqCuI1urzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60544101"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.149])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:38 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 10/20] drm/xe/irq: move irq_uninstall over to devm
Date: Fri, 10 May 2024 19:12:23 +0100
Message-ID: <20240510181212.264622-32-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240510181212.264622-22-matthew.auld@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
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
2.45.0

