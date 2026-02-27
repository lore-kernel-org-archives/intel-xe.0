Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD34FEFB6E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 17:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F56110EBD8;
	Fri, 27 Feb 2026 17:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XepxY9dI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B7210EBD7;
 Fri, 27 Feb 2026 17:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772212645; x=1803748645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+xR0iUOk9UXtgfodo7rVNLAP3SxnUFl+wAgxGDk+AU4=;
 b=XepxY9dI0LnlvMOKIBh9AsiaPLk20RB22/KxJ8mud4mvt40OtCwHiAoV
 XAau8Jw+XPcmReqMtzL100PsJ1ka97TAy4O123LDywjnIqnHbIAsPuE9a
 Ghx5CFV3Bfy+66dW+FBJ1CCLILQ0SvrdqT8fM6Q2MzWwaTUBa3YLn7pTj
 vAUgzpbROVOk3TJ5gWuS72y8zNbJlEsBGtpVZXyNI9TOMJ+u7j+1rj3yU
 bzJyJAG/VBfbGnVGAjQnp88z2HTmGDHsx/AdJ0DFl3Ql7B6q719YC6nyt
 301vRjQ612cIc1ceGpHzTiQZwN6K4inDYgWLbPHKR2y0I1HDsHwr2yhzT g==;
X-CSE-ConnectionGUID: ZCYUWWW6SO2G5dU1Qj8BYQ==
X-CSE-MsgGUID: qPNVcIrERlmJMAVhXAQ3fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="75902343"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="75902343"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:17:24 -0800
X-CSE-ConnectionGUID: egj6cwFVTiWkD68sPTewYA==
X-CSE-MsgGUID: 6wbhcMl+T2uily2Uuz23cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="213804025"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:17:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 1/4] drm/i915/fbdev: stop debug logging i915_ggtt_offset()
Date: Fri, 27 Feb 2026 19:17:11 +0200
Message-ID: <c3b84cb572c7ee94389e702aba4dcacb26c41673.1772212579.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772212579.git.jani.nikula@intel.com>
References: <cover.1772212579.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

The debug logging in fbdev is the only user of i915_ggtt_offset() in
display code. Just stop doing it to drop a dependency on i915_vma.h.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 44f4fcce526e..bdaaf3edba0c 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -47,7 +47,6 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
-#include "i915_vma.h"
 #include "intel_bo.h"
 #include "intel_display_core.h"
 #include "intel_display_rpm.h"
@@ -343,9 +342,7 @@ int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 
 	/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
 
-	drm_dbg_kms(display->drm, "allocated %dx%d fb: 0x%08x\n",
-		    fb->base.width, fb->base.height,
-		    i915_ggtt_offset(vma));
+	drm_dbg_kms(display->drm, "allocated %dx%d fb\n", fb->base.width, fb->base.height);
 	ifbdev->fb = fb;
 	ifbdev->vma = vma;
 	ifbdev->vma_flags = flags;
-- 
2.47.3

