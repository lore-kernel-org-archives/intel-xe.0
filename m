Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26B4C76196
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 18:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25CB10E1E2;
	Mon, 10 Apr 2023 18:32:30 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473AE10E187
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 18:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681151547; x=1712687547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0FDKulKdvbNRhJ+lYaqRosQR4HfSiS3SVQeGAHjGP7Q=;
 b=YtSv3SGJ2R4DwNGtwGE3QOtv+8aM7dXi3ewlqNUhI6kpDI4ACUPCBxm3
 3DuPvB6AoQgUJSg/wQLzxB0fnrGxLpe3jelxp47xWeEJFJwnz28aABa3V
 K4jb6G948VSFhiiJ8ThvaE1/hTEkHyaOpTpX1Yx7Unuf3gvsnnOGkbpnB
 pYMyPqyk9nzive3ksl/hLAIa7gWsJ5n6lwEjQiH6pLjmJowDFb/WSaq4i
 58+XnAlk4rxgtIDOcLElP2RM/c8EI/6nOlBaYFYfHDx3TETDtcPSy13nq
 mpBy9W3JEFnrPuCNCv5timvbrgpZtWljHtVYbqw2HdIRDCX5qL6eThp8G A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="408563412"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="408563412"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 11:32:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="681800982"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="681800982"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 11:32:26 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 10 Apr 2023 11:32:16 -0700
Message-Id: <20230410183219.191543-3-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410183219.191543-1-jose.souza@intel.com>
References: <20230410183219.191543-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/6] fixup! drm/i915/display: Remaining
 changes to make xe compile
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_core.h | 3 ---
 drivers/gpu/drm/i915/i915_driver.c                | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index cc058eb303ee8..d2346d43d1162 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -266,9 +266,6 @@ struct intel_wm {
 	 */
 	struct mutex wm_mutex;
 
-	/* protects DSPARB registers on pre-g4x/vlv/chv */
-	spinlock_t dsparb_lock;
-
 	bool ipc_enabled;
 };
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 6fe1a97cc246d..617b3d0da267d 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -214,7 +214,6 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 	spin_lock_init(&dev_priv->irq_lock);
 	spin_lock_init(&dev_priv->gpu_error.lock);
 	spin_lock_init(&dev_priv->display.fb_tracking.lock);
-	spin_lock_init(&dev_priv->display.wm.dsparb_lock);
 	mutex_init(&dev_priv->display.backlight.lock);
 
 	mutex_init(&dev_priv->sb_lock);
-- 
2.40.0

