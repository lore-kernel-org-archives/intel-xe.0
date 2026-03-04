Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3CDEF8FF0
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 14:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F23E10EA2D;
	Wed,  4 Mar 2026 14:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRa6aryP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5942F10EA2B;
 Wed,  4 Mar 2026 14:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772635280; x=1804171280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=14cZhK6mVWHszRPXQ0yTRjWWHIPdUnxohKc1CxDlsS0=;
 b=iRa6aryPgWhsUJkTMfFgWSmRqz7HH1HZTIyzkogy35cifAb5Ax4NUv/1
 RjpXPEOJ/DQjS3yNHy2i2El2+PXJdwPrOWxffWGbX19Wt1ffnzFGmg399
 x4FUoEytGviLz4xOTozt8fQzn/ZFBGrFTkr/MLdQ1ZtEUka11jSvAL1z7
 9XCUfhnBBSYT6wcKy51kseAqVYkOk9MWc90lsHzIMk9AVwdxwzIK0I3HR
 ImSDCtl6oPRUXf/MqDkhpGAn053ZDE8YSR3K8Wy29nsKKqsFEuxxQW3TU
 J5dq2YBWIfrMeeQy9jXlWX35Y9F+QFRDYjAcpqFvKhc6L49NUTb2Xkdp0 w==;
X-CSE-ConnectionGUID: yhniMa7jQmGhZJocbwX+gw==
X-CSE-MsgGUID: OL8p9BTsSoKOPScoqEV/Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77300891"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="77300891"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 06:41:19 -0800
X-CSE-ConnectionGUID: zDdBwFmRQyibeiTRRY8W3Q==
X-CSE-MsgGUID: HTHvmcd2Rumu0jyIxG0OmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="218320162"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.84])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 06:41:17 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 4/8] drm/xe/compat: remove intel_step_name macro
Date: Wed,  4 Mar 2026 16:40:49 +0200
Message-ID: <5b2211f9bf2f35085e5defd286569a0873a8eee7.1772635152.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772635152.git.jani.nikula@intel.com>
References: <cover.1772635152.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

As there are no more compat users left for intel_step_name(), remove the
macro and use the more direct include for the enumerations.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/intel_step.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
index 2cf13a572ab0..0eabe2866f5f 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
@@ -6,9 +6,8 @@
 #ifndef __INTEL_STEP_H__
 #define __INTEL_STEP_H__
 
-#include "xe_step.h"
+#include "xe_step_types.h"
 
 #define intel_step xe_step
-#define intel_step_name xe_step_name
 
 #endif /* __INTEL_STEP_H__ */
-- 
2.47.3

