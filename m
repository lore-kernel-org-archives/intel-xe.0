Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DA7C77B71
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 14:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDCE10E0F9;
	Fri, 21 Apr 2023 14:50:31 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CD210E117
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 14:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682088629; x=1713624629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P8vlMRnW3d7ojfVNiDb3gSJr3k6QNDRCdf8/6D34DoY=;
 b=OW344YuvdySpe8YKJJNxrcLNAEFHc5YGNvUy37/sF+u3PF5vVZ6ssvXI
 j9rkMcwdOZudd7eVVUnFde1QeXrwPUttn7w3g+WHiRTIKlNy/PGTPwAj2
 xF8Qm1oEMtnzGlNMar9+x9hwAqoCfdVeM8n3Ku52rd+7yYj+ehSFd9jDR
 5o1LrmVJig50o1U3AWnt0Nynjj1b20yFGVTd22nAmEywToEqjxbcWorIX
 a5w33OXJnHtkFKPsPoRCrOVAjMQ8vDIDUxplJvdhjm0e8M42DmcHrn1Op
 F2KhlCG8Pa9vJt/y2YTwV0kwf9d/Og5rkkNSqAbQGHbyGvbuQ2d8KaIvR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="330204807"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="330204807"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 07:50:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="724847466"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="724847466"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 07:50:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Apr 2023 07:50:06 -0700
Message-Id: <20230421145006.10940-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421145006.10940-1-matthew.d.roper@intel.com>
References: <20230421145006.10940-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 2/2] fixup! drm/xe/display: Implement display support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_de.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_de.h b/drivers/gpu/drm/xe/display/xe_de.h
index 9f92fdb4159a..000379f8702e 100644
--- a/drivers/gpu/drm/xe/display/xe_de.h
+++ b/drivers/gpu/drm/xe/display/xe_de.h
@@ -45,7 +45,7 @@ intel_de_write(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
 static inline u32
 intel_de_rmw(struct drm_i915_private *i915, i915_reg_t reg, u32 clear, u32 set)
 {
-	return xe_mmio_rmw32(to_gt(i915), reg.reg, ~clear, set);
+	return xe_mmio_rmw32(to_gt(i915), reg.reg, clear, set);
 }
 
 static inline int
-- 
2.40.0

