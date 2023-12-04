Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC60C10F14
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 06:49:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD4110E22D;
	Mon,  4 Dec 2023 06:49:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB25610E165
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 06:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701672596; x=1733208596;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S0ssUHOtV78W1cwAHhTeXIzW8rS0MAZgUdtLQNji59M=;
 b=OUe662CXkTtM/8Vjxv2F4BwRAMi3sXtNpA/f2gDXfeyqjmocI1imM1x6
 oV8b5PWk+Npgib45bFHK6GB781cPc3Mdo4+Vrwhe3JAd1g4w4n5yIu51Z
 W4zj+xdfDWKPiohCDfE23C3zMtW9e7SYGt1wV0y0zb08XiQnSHmV8XJp4
 QdCYHrzsRoERJEWtAb8QNeYdvkINN96jai2A1+/k7CVQpgMS/RCx1V88E
 vIEVVrUrlYZrGOvS947IU3sIVOVucXtYW8sM2qTg4qosI8PJbftXz8JfD
 kk1KA6VK2qcTxvYtxIXZ9/3aRuMqoH5JzpG/YGD24cynTY6Nrsfv5pSML w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="373880069"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="373880069"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 22:49:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="836482789"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="836482789"
Received: from martinro-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.46.174])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 22:49:54 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  4 Dec 2023 08:49:24 +0200
Message-Id: <20231204064932.869215-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204064932.869215-1-jouni.hogander@intel.com>
References: <20231204064932.869215-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/9] Revert "FIXME: drm/i915: xe intel_fb.c
 framebuffer init and destroy xe changes"
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 14d1d786caacdb3438d07ab86fabf2e36c8151cc.

Revert this as we are about to introduce implementation without any
ifdefs.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 16c37a508552..f7675284907f 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1891,17 +1891,6 @@ static void intel_user_framebuffer_destroy_vm(struct drm_framebuffer *fb)
 
 	if (intel_fb_uses_dpt(fb))
 		intel_dpt_destroy(intel_fb->dpt_vm);
-#ifndef I915
-	if (intel_fb_obj(fb)->flags & XE_BO_CREATE_PINNED_BIT) {
-		struct xe_bo *bo = intel_fb_obj(fb);
-
-		/* Unpin our kernel fb first */
-		xe_bo_lock(bo, false);
-		xe_bo_unpin(bo);
-		xe_bo_unlock(bo);
-	}
-	xe_bo_put(intel_fb_obj(fb));
-#endif
 }
 
 static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
@@ -2174,10 +2163,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 
 		intel_fb->dpt_vm = vm;
 	}
-#ifndef I915
-	/* Hold a reference to object while fb is alive */
-	xe_bo_get(obj);
-#endif
 
 	ret = drm_framebuffer_init(&dev_priv->drm, fb, &intel_fb_funcs);
 	if (ret) {
-- 
2.34.1

