Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B49CD6E65
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 12:26:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725DE10E77C;
	Wed, 11 Oct 2023 12:26:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083AC10E77C
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 12:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697027201; x=1728563201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zUM1rq8IQig4vfjFur7vVKGEwUe6dAZ9UdPoHRWIGHE=;
 b=TMhKxzJYC3Dc9w/r7ah/YWx4iLN7VpSqI+1n3gUWisywNTwjFWn9XuSH
 MX6Ab8V3XWdh0EYaP1iqNfO/IRK3e7JGKDTZD2LT0+rz2vK7m7gsbtlFm
 YoC47eCEdL2pm5tVC8h/5cECBItpZPDxUkcTh5L/d//oaI0DptcD3s1u7
 xfT1LJ+/qiOJYita4YkaO8LQI/fyAWA42uFJImPODSGTwt5+H+eq+22XR
 f96zoIlUYThCp5XJrEtlyKdR2oM5qpVZo6XUAClubGseRqChQCxUxZ2kl
 pq2cZhs2fOX+HUkDcrcH2a7JdqgBmYl8Q1oaWRoVKObetwFM0i+Q4ZrVg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="364010303"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="364010303"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:26:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="844543813"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="844543813"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Oct 2023 05:26:39 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 17:52:10 +0530
Message-Id: <20231011122215.2025850-2-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231011122215.2025850-1-chaitanya.kumar.borah@intel.com>
References: <20231011122215.2025850-1-chaitanya.kumar.borah@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit a0cdbefc3aea03c1d3f30460c1d89678705d57bb.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
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

