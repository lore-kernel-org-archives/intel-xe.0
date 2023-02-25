Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C21C7EE2E
	for <intel-xe@archiver.kernel.org>; Sat, 25 Feb 2023 00:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74D710E5D9;
	Sat, 25 Feb 2023 00:16:29 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31D510E56E
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Feb 2023 00:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677284187; x=1708820187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gj8MnhSLgsIUPgKW7H7kYzswhZbXv7S5DcXC6eK5pKU=;
 b=SVE5eSzQtIg12gij/D7iGHohOVrFGmO88NH2j3/b3lEqfQVNyc64Fkln
 jIIFz288lY3Gxk0HFGOzk+PAzySfxwQ+DtulhCfgCbyI+qt0YbxioTvDw
 UKzZ4V53dwYWS9EZej7r2g0gi7KpCc+kafbv8NEgd3r8GQsllWs9Eq0hk
 ymurkJHms+9aQnCCu3Y3PAXDCf7JOwafN0BMyeJ0YZmIEMOScasul3Sei
 Yg72nGDShicgCYNLc0Pp5XVJsl8Y77g9ZEsCvXqKK4K1zRnHxn8QAXRmH
 cj8fOMgrCgLT4HeNE8OvJdBB2hgZ/pmfma6uJAWINy8kqMfmIkD12iB5g w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="332297343"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="332297343"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:16:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="761956564"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="761956564"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:16:20 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Feb 2023 16:15:37 -0800
Message-Id: <20230225001548.1743820-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230225001548.1743820-1-lucas.demarchi@intel.com>
References: <20230225001548.1743820-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 01/12] drm/i915: Move MCR_REG define to
 i915_reg_defs.h
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Define MCR_REG() in the same header where i915_mcr_reg_t is defined,
like i915_reg_t and _MMIO(). It's a more natural place for such a
definition so it's not mixed with the registers for the platforms.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h | 1 -
 drivers/gpu/drm/i915/i915_reg_defs.h    | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 3b9e20dd6039..12c5115f7b61 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -10,7 +10,6 @@
 #ifdef I915
 #include "display/intel_display_reg_defs.h"	/* VLV_DISPLAY_BASE */
 #endif
-#define MCR_REG(offset)	((const i915_mcr_reg_t){ .reg = (offset) })
 
 /*
  * The perf control registers are technically multicast registers, but the
diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
index b5e06b6a9478..a6080c983a77 100644
--- a/drivers/gpu/drm/i915/i915_reg_defs.h
+++ b/drivers/gpu/drm/i915/i915_reg_defs.h
@@ -136,6 +136,8 @@ typedef struct {
 	u32 reg;
 } i915_mcr_reg_t;
 
+#define MCR_REG(offset)	((const i915_mcr_reg_t){ .reg = (offset) })
+
 #define INVALID_MMIO_REG _MMIO(0)
 
 /*
-- 
2.39.0

