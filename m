Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A718CD8CAA
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 18:31:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A41E10E37D;
	Mon,  8 Jun 2026 18:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0Lexyje";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F247310E367;
 Mon,  8 Jun 2026 18:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780943461; x=1812479461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RldC2cDF4RpDdP5p9H9nCiXWXjDmECkaqbqpm9gy3SI=;
 b=J0LexyjeTtZdxN+5Ccepnnr31vBtzkbjaGoHoKTzlFa5jsxAusA0InEI
 cbcfdPsvPfzMoEucvZCcCOJjB1VMhtfzBgtbUOJ2hL6i6ZhTMC8lrLkvF
 EYzOJGjkBIAU8rx57e5NB97fsvh8D8C3NtKVy13ZfT2EYLzF2MiVldvL8
 sPxZ10XTDJRhjtE5C3m8qvOmfcFwQqzciGb2po65TjJfAhleZ9RAT33I2
 ALRY++AFxPJCUJBje2qqQmtC/ZAFY1Wobhap/BUnBbirzSbC7ECO/0uf3
 9z/EPbNglczpFbw+Eh8ac/3MOR/TCyMRFqGdktcd1GXKVg0z1BwjLrY6r A==;
X-CSE-ConnectionGUID: j90po1yYQLW6GD6bPBB8Mw==
X-CSE-MsgGUID: u+uiA3GYRB2NtjcVcYDg8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85543985"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="85543985"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 11:31:01 -0700
X-CSE-ConnectionGUID: jeudAQF+Sceho2j8jReV2g==
X-CSE-MsgGUID: 3oTc+QAqTh+sSJbqG+4o9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="249542024"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 11:30:59 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 raag.jadav@intel.com, Michal.Wajdeczko@intel.com
Subject: [PATCH v4 2/5] drm/xe/heci: Use xe print functions in xe_heci_gsc.c
Date: Tue,  9 Jun 2026 02:30:47 +0800
Message-ID: <20260608183050.3875235-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608183050.3875235-1-jonathan.cavitt@intel.com>
References: <20260608183050.3875235-1-jonathan.cavitt@intel.com>
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

Update xe_heci_gsc.c to use the xe error reporting helper functions in
xe_printk.h instead of directly calling the associated drm print
functions from drm_print.h.  While we're here, we should update the
error messages to print the error codes in a more friendly way.

v2:
- Update the error messages to print the error codes in a more friendly
  way (Wajdeczko)

v3:
- Update heci_gsc_add_device() error messages (Wajdeczko)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_heci_gsc.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index 5af8903e10af..194849edec11 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -8,12 +8,11 @@
 #include <linux/pci.h>
 #include <linux/sizes.h>
 
-#include <drm/drm_print.h>
-
 #include "xe_device_types.h"
 #include "xe_heci_gsc.h"
 #include "regs/xe_gsc_regs.h"
 #include "xe_platform_types.h"
+#include "xe_printk.h"
 #include "xe_survivability_mode.h"
 
 #define GSC_BAR_LENGTH  0x00000FFC
@@ -112,13 +111,13 @@ static int heci_gsc_irq_setup(struct xe_device *xe)
 
 	heci_gsc->irq = irq_alloc_desc(0);
 	if (heci_gsc->irq < 0) {
-		drm_err(&xe->drm, "gsc irq error %d\n", heci_gsc->irq);
+		xe_err(xe, "GSC: irq allocation failed (%pe)\n", ERR_PTR(heci_gsc->irq));
 		return heci_gsc->irq;
 	}
 
 	ret = heci_gsc_irq_init(heci_gsc->irq);
 	if (ret < 0)
-		drm_err(&xe->drm, "gsc irq init failed %d\n", ret);
+		xe_err(xe, "GSC: irq initialization failed (%pe)\n", ERR_PTR(ret));
 
 	return ret;
 }
@@ -151,7 +150,7 @@ static int heci_gsc_add_device(struct xe_device *xe, const struct heci_gsc_def *
 
 	ret = auxiliary_device_init(aux_dev);
 	if (ret < 0) {
-		drm_err(&xe->drm, "gsc aux init failed %d\n", ret);
+		xe_err(xe, "GSC: aux device init failed (%pe)\n", ERR_PTR(ret));
 		kfree(adev);
 		return ret;
 	}
@@ -159,7 +158,7 @@ static int heci_gsc_add_device(struct xe_device *xe, const struct heci_gsc_def *
 	heci_gsc->adev = adev; /* needed by the notifier */
 	ret = auxiliary_device_add(aux_dev);
 	if (ret < 0) {
-		drm_err(&xe->drm, "gsc aux add failed %d\n", ret);
+		xe_err(xe, "GSC: aux device add failed (%pe)\n", ERR_PTR(ret));
 		heci_gsc->adev = NULL;
 
 		/* adev will be freed with the put_device() and .release sequence */
@@ -190,7 +189,7 @@ int xe_heci_gsc_init(struct xe_device *xe)
 	}
 
 	if (!def || !def->name) {
-		drm_warn(&xe->drm, "HECI is not implemented!\n");
+		xe_warn(xe, "HECI is not implemented!\n");
 		return 0;
 	}
 
@@ -215,7 +214,7 @@ void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir)
 		return;
 
 	if (!xe->info.has_heci_gscfi) {
-		drm_warn_once(&xe->drm, "GSC irq: not supported");
+		xe_warn_once(xe, "GSC: unexpected irq %#x\n", iir);
 		return;
 	}
 
@@ -224,7 +223,7 @@ void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir)
 
 	ret = generic_handle_irq_safe(xe->heci_gsc.irq);
 	if (ret)
-		drm_err_ratelimited(&xe->drm, "error handling GSC irq: %d\n", ret);
+		xe_err_ratelimited(xe, "GSC: irq handling failed (%pe)\n", ERR_PTR(ret));
 }
 
 void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir)
@@ -235,7 +234,7 @@ void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir)
 		return;
 
 	if (!xe->info.has_heci_cscfi) {
-		drm_warn_once(&xe->drm, "CSC irq: not supported");
+		xe_warn_once(xe, "CSC: unexpected irq %#x\n", iir);
 		return;
 	}
 
@@ -244,5 +243,5 @@ void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir)
 
 	ret = generic_handle_irq_safe(xe->heci_gsc.irq);
 	if (ret)
-		drm_err_ratelimited(&xe->drm, "error handling GSC irq: %d\n", ret);
+		xe_err_ratelimited(xe, "CSC: irq handling failed (%pe)\n", ERR_PTR(ret));
 }
-- 
2.53.0

