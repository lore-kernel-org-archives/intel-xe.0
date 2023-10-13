Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF4CCDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 06:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA45D10E5BF;
	Fri, 13 Oct 2023 06:57:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8CD10E5BF
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 06:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697180275; x=1728716275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J379LdRhSfJ7eZgJgiSTbxhti3prH+jkjvmcjrt7A/k=;
 b=LUgGq/L1urybhsoXHMEA79ciZOs9ebKL9YrsdLdz67AjF47n9z7IJOk5
 MVDoTZhGUZPiTLQ3Kn0OITwknPDxfEOFrL/tbZOairX5Trp0yuJYT8HLY
 A5KY7N0T64kbia14+DguRr6dH6jlPBxb86oxA5SWMTQ1YXyE8k5V2/zR2
 N1CwgtHqOAkmFv7AGGiGHzyN+Iwtlw/kJBDmLjf1m9t5uQztKLrYfj8UF
 7QLSn5FvniBNHbpNwpi1YFk0DkPsXS+iN77GTljjnX2+wBMBFLHpOuK2B
 /H5Bvj70i1DCGjwhKZ81bMcCTLbKkN/bEbe7KABj+eFG2UXvsxxBtNw41 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="384954553"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="384954553"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 23:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="731243482"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="731243482"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orsmga006.jf.intel.com with ESMTP; 12 Oct 2023 23:57:50 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 13 Oct 2023 12:23:18 +0530
Message-Id: <20231013065323.2233783-2-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231013065323.2233783-1-chaitanya.kumar.borah@intel.com>
References: <20231013065323.2233783-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/6] Revert "FIXME: drm/i915/dmc: xe way of
 getting at stepping"
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
Cc: lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit a0cdbefc3aea03c1d3f30460c1d89678705d57bb.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 51e0463518fb..1623c0c5e8a1 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -30,18 +30,6 @@
 #include "intel_dmc.h"
 #include "intel_dmc_regs.h"
 
-#ifndef I915
-#include "xe_uc_fw.h"
-
-#define INTEL_UC_FIRMWARE_URL XE_UC_FIRMWARE_URL
-
-__printf(2, 3)
-static inline void
-i915_error_printf(struct drm_i915_error_state_buf *e, const char *f, ...)
-{
-}
-#endif
-
 /**
  * DOC: DMC Firmware Support
  *
@@ -321,11 +309,8 @@ static const struct stepping_info *
 intel_get_stepping_info(struct drm_i915_private *i915,
 			struct stepping_info *si)
 {
-#ifdef I915
 	const char *step_name = intel_step_name(RUNTIME_INFO(i915)->step.display_step);
-#else
-	const char *step_name = xe_step_name(i915->info.step.display);
-#endif
+
 	si->stepping = step_name[0];
 	si->substepping = step_name[1];
 	return si;
-- 
2.25.1

