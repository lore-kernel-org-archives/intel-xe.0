Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F143C77B78
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 13:10:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250B610E29A;
	Wed,  3 May 2023 13:10:56 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81BA10E29A
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 13:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683119453; x=1714655453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CUIjncvsA5m8HNMvXA2EEZP99+fyGphkCvo0mpBbiYc=;
 b=JOMEYHZoODVh+kF7U0305/frUbakPl2ttLCr3OEytUBHsUmm58u6vE5V
 2QX0oRCP2AChAM2Ez/5/Kj3DaRusXw8E1GbzYFumLfCaC4NFPXzRN1NPd
 O3elAPu+LYGLs3LqmWWywGHwLova6vnKUJzU6ddp1qLlU/Zd/IjYdmNwG
 dcpWTGW6emIzM0emN3Xckyf79P9Tiwk7tdR33AqE8G46iP/3LLrfeqmIE
 4e3gjJPGZMG+qhoUIob+oNN0TNXKFE4e9YWWtVKrWSF17mdmmQfIGgRBI
 g+WpCtcbioilduOiWezRU3GldjNOwdpDcc8pnqCaURyFhO/bPEjB+NPAM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="414109663"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="414109663"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:10:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="870933107"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="870933107"
Received: from ebrosekx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.204])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:10:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  3 May 2023 16:09:55 +0300
Message-Id: <20230503131005.1602412-9-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503131005.1602412-1-jani.nikula@intel.com>
References: <20230503131005.1602412-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 08/18] fixup! drm/i915/display: Add more macros
 to remove all direct calls to uncore
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Revert "drm/i915/display: Add more macros to remove all direct calls to
uncore". Remove the entire commit from history. Move to pcode glue
layer.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h | 38 -------------------------
 1 file changed, 38 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 22907719bb1e..ab711b2cba12 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -9,7 +9,6 @@
 #include "i915_drv.h"
 #include "i915_trace.h"
 #include "intel_uncore.h"
-#include "intel_pcode.h"
 
 static inline u32
 intel_de_read(struct drm_i915_private *i915, i915_reg_t reg)
@@ -136,41 +135,4 @@ intel_de_write_notrace(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
 	intel_uncore_write_notrace(&i915->uncore, reg, val);
 }
 
-static inline void
-intel_de_write_samevalue(struct drm_i915_private *i915, i915_reg_t reg)
-{
-	spin_lock_irq(&i915->uncore.lock);
-	intel_de_write_fw(i915, reg, intel_de_read_fw(i915, reg));
-	spin_unlock_irq(&i915->uncore.lock);
-}
-
-static inline int
-intel_de_pcode_write_timeout(struct drm_i915_private *i915, u32 mbox, u32 val,
-			    int fast_timeout_us, int slow_timeout_ms)
-{
-	return snb_pcode_write_timeout(&i915->uncore, mbox, val,
-				       fast_timeout_us, slow_timeout_ms);
-}
-
-static inline int
-intel_de_pcode_write(struct drm_i915_private *i915, u32 mbox, u32 val)
-{
-
-	return snb_pcode_write(&i915->uncore, mbox, val);
-}
-
-static inline int
-intel_de_pcode_read(struct drm_i915_private *i915, u32 mbox, u32 *val, u32 *val1)
-{
-	return snb_pcode_read(&i915->uncore, mbox, val, val1);
-}
-
-static inline int intel_de_pcode_request(struct drm_i915_private *i915, u32 mbox,
-					 u32 request, u32 reply_mask, u32 reply,
-					 int timeout_base_ms)
-{
-	return skl_pcode_request(&i915->uncore, mbox, request, reply_mask, reply,
-				 timeout_base_ms);
-}
-
 #endif /* __INTEL_DE_H__ */
-- 
2.39.2

