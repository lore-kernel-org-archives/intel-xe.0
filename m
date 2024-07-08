Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E81C3DA41
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 18:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C314F10E258;
	Mon,  8 Jul 2024 18:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BY84+0Mx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB4910E258
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 18:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720464953; x=1752000953;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=u9zld/BaDVvY48S38PvoZXfiPSlcogPGI1CxcmVgjbE=;
 b=BY84+0MxcZH5xXvKNoMQvVxbpgAInbM2gjUomGpfkCGvAMIWAByPDJUw
 P+AwihfWmKs/8gOFiWiz1CyJofGyIEhltptbIuxjI70p6DsyQ6RsmnAP9
 9sS4vHbpPtUoo5HrjgIKmSvEmX0QRYWoHNinBziAxeQ0oDMkwW45yd31G
 4zS4Fagf01aNs5kSOUV57icZA2yby3kI88p8HBL7+W29kOVOhyrSfjokP
 FmZ7AvbmbSw6O0tWLP4U1rG3KtTisD6uvQN6dtymJJCjpF0NnBmj+URkB
 jJYQIPlXTTofkzRiYCD7PDPF9vKF+x1lYLwWC5f8q3VjBAfl0iGf2rJjE g==;
X-CSE-ConnectionGUID: KcX8vRxHSJ+9W/tGGEf0/g==
X-CSE-MsgGUID: Ny5qEqwMSOKVBZe5/2rVkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17820135"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="17820135"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 11:55:53 -0700
X-CSE-ConnectionGUID: yN0LDyIeRjOvzjEQtxfgaA==
X-CSE-MsgGUID: +Hj8LETdS2y2b1OZZQ1s8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="48019597"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 11:55:53 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 2/2] drm/xe/display: do not allocate the FB in stolen
Date: Mon,  8 Jul 2024 11:55:38 -0700
Message-ID: <20240708185538.2243957-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240708185538.2243957-1-daniele.ceraolospurio@intel.com>
References: <20240708185538.2243957-1-daniele.ceraolospurio@intel.com>
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

For CI only, to test if this helps with the observed hang when loading
the GSC

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c | 23 ++++-----------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
index 816ad13821a8..016d3f9fdf94 100644
--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
@@ -35,26 +35,11 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
 
 	size = mode_cmd.pitches[0] * mode_cmd.height;
 	size = PAGE_ALIGN(size);
-	obj = ERR_PTR(-ENODEV);
-
-	if (!IS_DGFX(xe)) {
-		obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe),
-					   NULL, size,
-					   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
-					   XE_BO_FLAG_STOLEN |
-					   XE_BO_FLAG_PINNED);
-		if (!IS_ERR(obj))
-			drm_info(&xe->drm, "Allocated fbdev into stolen\n");
-		else
-			drm_info(&xe->drm, "Allocated fbdev into stolen failed: %li\n", PTR_ERR(obj));
-	}
-	if (IS_ERR(obj)) {
-		obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe), NULL, size,
-					   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
-					   XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
-					   XE_BO_FLAG_PINNED);
-	}
 
+	obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe), NULL, size,
+				   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
+				   XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
+				   XE_BO_FLAG_PINNED);
 	if (IS_ERR(obj)) {
 		drm_err(&xe->drm, "failed to allocate framebuffer (%pe)\n", obj);
 		fb = ERR_PTR(-ENOMEM);
-- 
2.43.0

