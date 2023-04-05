Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2439DC7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015FD10E9FD;
	Wed,  5 Apr 2023 15:41:17 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A8610E9FD
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709274; x=1712245274;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=evRBCt2Yn062bBYG300v0te9qYekse08lQ8q0UbHvOQ=;
 b=dgrpb8CJ1Bn91Tfwv2hD+Df2MU7MMMjmoHVaXE9aua715bOYbFiXxi09
 dxto35eLcLt1ZY4RAbPn7C98qZWuEcNjp/7hOvyK67g+v/xEsP+sons1D
 vc1JBjFoncOymzxJBfbifKliAueSdveTEX9bJYrGf+6Li6tvG+X98g+Ks
 1Wle+S4ZvcPD28HAB6qh89GZFgqDC4YDLj84UpmloJowrtwo1TjhMEu9X
 9furXCWR7aNVv1zYpe04f67dMeSycRnOKAOx1LzFThxV8ghKVg4HHGfWY
 XH2ZcJIxCMSzS8PWjMgihsA8fIMxdiV3Xz+1LE1i0PCnP+uf4//+GUxAw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="341211206"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="341211206"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:41:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="717090981"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="717090981"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:41:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:39:20 +0300
Message-Id: <20230405153920.926583-22-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 21/21] fixup! drm/xe/display: Implement display
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
Cc: tvrtko.ursulin@linux.intel.com, Jani Nikula <jani.nikula@intel.com>,
 joonas.lahtinen@linux.intel.com, lucas.demarchi@intel.com, daniel@ffwll.ch,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove intel overlay stubs

No longer needed with the intel_overlay.h conditional build.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 923b2212f422..ae25bb02896a 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -176,9 +176,6 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 #define assert_dsi_pll_enabled(xe) BUG_ON(1)
 
 #define intel_has_gpu_reset(a) (a && 0)
-#define intel_overlay_switch_off(a) (a && 0)
-#define intel_overlay_cleanup(a) do { (void)a; } while (0)
-#define intel_overlay_setup(a) do { (void)a; } while (0)
 
 #include "intel_wakeref.h"
 
-- 
2.39.2

