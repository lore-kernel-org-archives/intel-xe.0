Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1709C54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 16:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B58B10F11F;
	Thu, 14 Mar 2024 16:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YjP0sAGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DB210F11F
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 16:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710434964; x=1741970964;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x0Mh7Fd1wEpgK54SVPaqd2EvZQA8nqt4Z8BdoONY5sA=;
 b=YjP0sAGPAhaJ5qPyyIwM+ljub77aBu+s1Zcql5szowkWqvhT3eReaZj1
 kDVUE3mGeCzeVZ0+HqrNKY3AJOis1Uqlgn0n8Czq5+vA+oBTER1NrOwI3
 SXAI0o8eldAbmxan/FUis/4JSWxXm6ZwAsmN8GOPfGbrPnmMZYQCYTc1F
 Gg1p9p5HInGowmlM5EyvUvCKNY5HHu7Ia1iWV49fN2MZMAqrdIABNAHV2
 f9Ww2kARYcRzboAWxa3Y1xVBVQq9wEGGOVpg0jJYLbI9QdYjAgd+neTvC
 2071eEWJQzK/oJ2ZBhQ0uVqAaI68XK0tW4CFm7wxJdz0dxKuxv9pSkPn9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="9047022"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="9047022"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 09:49:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12290165"
Received: from unknown (HELO mwauld-mobl1.intel.com) ([10.245.244.240])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 09:49:22 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH] drm/xe/display: mark DPT with XE_BO_PAGETABLE
Date: Thu, 14 Mar 2024 16:49:06 +0000
Message-ID: <20240314164905.239449-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
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

Otherwise in the case where we use normal system memory, the CPU access
will always be cached, like when filling the DPT PTEs, which is likely
not what we want since HW access could be incoherent on platforms like
LNL. Marking as XE_BO_PAGETABLE will force wc/uc underneath on such
platforms.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 722c84a56607..b220f136be70 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -100,17 +100,20 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 					   ttm_bo_type_kernel,
 					   XE_BO_CREATE_VRAM0_BIT |
-					   XE_BO_CREATE_GGTT_BIT);
+					   XE_BO_CREATE_GGTT_BIT |
+					   XE_BO_PAGETABLE);
 	else
 		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 					   ttm_bo_type_kernel,
 					   XE_BO_CREATE_STOLEN_BIT |
-					   XE_BO_CREATE_GGTT_BIT);
+					   XE_BO_CREATE_GGTT_BIT |
+					   XE_BO_PAGETABLE);
 	if (IS_ERR(dpt))
 		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 					   ttm_bo_type_kernel,
 					   XE_BO_CREATE_SYSTEM_BIT |
-					   XE_BO_CREATE_GGTT_BIT);
+					   XE_BO_CREATE_GGTT_BIT |
+					   XE_BO_PAGETABLE);
 	if (IS_ERR(dpt))
 		return PTR_ERR(dpt);
 
-- 
2.44.0

