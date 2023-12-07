Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE11CC10F05
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 15:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B1410E915;
	Thu,  7 Dec 2023 15:58:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D9210E91A
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 15:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701964709; x=1733500709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yiOBu7rMp1w3noK0g9i3ehd6AOoaCkDT5czzgALLvgc=;
 b=Muilz0/8zZ6jDwINihdxuY32bb0EuNZFwMe8bT7qC6UDpc0oGl4NzR1i
 HMoq1PkD9q3pm4tjHeIzdFV0GvJIZ8xr6uElLvfTl0AfYpOQa61u5jTQS
 4QwmEVId+2S+N/1fMJ81uTK5Lgp1STH7xoNT6GZ/o5d+XJAOvQPiRlFeD
 Ey+lvG+WP6xCLmq1d0HSu4Hn5vw0AKdoxWt73lxDJEIGQzAbf6Aj9+Enm
 TTAS9BV4dp7btlFJBOlUgqwtK5oep6srqE8h9g4907sEaf6x4FpXP/pna
 ufITn9e967Wtr9H2F95LGlePCs2LziNH8G0oNogZqjzLksFmi2saq23Z0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="384655280"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="384655280"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 07:58:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765151656"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="765151656"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 07:58:27 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 1/9] Revert "FIXME: drm/i915: xe intel_fb.c framebuffer
 init and destroy xe changes"
Date: Thu,  7 Dec 2023 17:58:07 +0200
Message-Id: <20231207155815.2467082-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207155815.2467082-1-jouni.hogander@intel.com>
References: <20231207155815.2467082-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 14d1d786caacdb3438d07ab86fabf2e36c8151cc.

Revert this as we are about to introduce implementation without any
ifdefs.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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

