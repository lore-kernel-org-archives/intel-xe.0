Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2359C25B7A
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 10:22:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4A510E194;
	Wed, 22 May 2024 10:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKQo+4eS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EBC10F491
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 10:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716373332; x=1747909332;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=t9qVNIJOgUI6GviHq0QaQxSeFY+veWWDDU6f2Z8phsQ=;
 b=PKQo+4eSSnPrZu4dEDV3k6MZdTXC1QnsGLJa98aA7riG8qFSSHcmBYUd
 SL7iXWDiZz0eYnuvyduKTU5V2H/usyWpb7SL9OzQosd4Yqti0g7Nz8vud
 BV78RLdcXV7CwyaA8eFdRQzgZXKYQS92W3zJITcyoaq/f3LhzXHQEik0N
 WQJa1pkTbvP/Kq5Nwum6q5PKmtQtrDUcD6clE7fGfaWZxAtoCvsXj2YO4
 anjsC3Q5Vl5ey/PxQLtvTlB2VSvCS+fC25QC50v4Wrzg8b5dEzbyYYKXj
 rWcm38MJflQR1ZALCIzpHArqo/X3jqkR8D4nWrB7dfS6TorxaPXDXTwax g==;
X-CSE-ConnectionGUID: GrVPwLooQMecShwum3GPAQ==
X-CSE-MsgGUID: wReyq+o0Q4SOT20q0rxvog==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="15562688"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="15562688"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:11 -0700
X-CSE-ConnectionGUID: dcoWWdOrQPCZBLU6E0nCsQ==
X-CSE-MsgGUID: x94XSsBRRnSlLEfgc4tVFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="38195275"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.245.124])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:11 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 08/18] drm/xe/irq: move irq_uninstall over to devm
Date: Wed, 22 May 2024 11:21:51 +0100
Message-ID: <20240522102143.128069-26-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522102143.128069-19-matthew.auld@intel.com>
References: <20240522102143.128069-19-matthew.auld@intel.com>
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

