Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCEFC072A2
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 17:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F01B10E30F;
	Fri, 17 Nov 2023 17:56:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D6910E310
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 17:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700243801; x=1731779801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fKO7xBuhDtz+eoH69mNYcN8MJpxYRY6y/osOsXEatgI=;
 b=B/kxibXUOQTefxi9jdYcj4avSq6vpmuBnB9aiHFfyU/SWLdisLsGp4JV
 eUnitGY/HKIym8OKgDVFVVhzj9ughdmOBgUkQJgD3+i+jdlSMG7snaf8A
 KfyMbwZ8CkShvvYFwSC9pYHqRkOr4WhO7Fx/OoGS0ySfPl5ZAqcnUnBEh
 5PjihVgdL++JexnPu9/QZECoMRu82RDqX3ZMMNd6vZ21EXYREmp7sFzAh
 FiK2UK5DDrWNphuF7Bq6oMukQtlEMQ/pVF6l4B4767Nh1jnN8QjuOCK6K
 pu8AKxAmC/A9Pt9J2c8pGaKOEViVEGAAs9+4/4t9wVwHDEpacAiFPQxeR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="422434022"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="422434022"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 09:56:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="856403079"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="856403079"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 09:56:41 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Nov 2023 09:56:23 -0800
Message-Id: <20231117175624.535520-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231117175624.535520-1-lucas.demarchi@intel.com>
References: <20231117175624.535520-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] fixup! drm/xe/display: Implement display
 support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add missing header to fix warning while building with W=1:

	  CC [M]  drivers/gpu/drm/xe/display/intel_fbdev_fb.o
	../drivers/gpu/drm/xe/display/intel_fbdev_fb.c:14:25: error: no previous prototype for ‘intel_fbdev_fb_alloc’ [-Werror=missing-prototypes]
	   14 | struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
	      |                         ^~~~~~~~~~~~~~~~~~~~
	../drivers/gpu/drm/xe/display/intel_fbdev_fb.c:77:5: error: no previous prototype for ‘intel_fbdev_fb_fill_info’ [-Werror=missing-prototypes]
	   77 | int intel_fbdev_fb_fill_info(struct drm_i915_private *i915, struct fb_info *info,
	      |     ^~~~~~~~~~~~~~~~~~~~~~~~
	cc1: all warnings being treated as errors

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
index 961b26e267ec..51ae3561fd0d 100644
--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include "intel_fbdev_fb.h"
+
 #include <drm/drm_fb_helper.h>
 
 #include "xe_gt.h"
-- 
2.40.1

