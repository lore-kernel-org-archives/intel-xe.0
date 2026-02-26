Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8073FFD8FE1
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 17:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C2810E9E4;
	Thu, 26 Feb 2026 17:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FWm5eJlY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A2F10E9E4;
 Thu, 26 Feb 2026 17:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772127535; x=1803663535;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zt3Ovb6evvdvteGU1cc4DoTRjHSh00mSl8Y4b5c7Uig=;
 b=FWm5eJlYkWUrGBClMQvgwd/aZOl00hVNE4t5907s5/WzrCh/YBts0A1q
 LxCcPoFxh9rHNru2KnGptSC2IeaMIDyLmDyXufBjGTcngJ68OG2KRKW5e
 nLLnmfEtcWJ09kRcK/IdFEAJPzbUfUlqWcTSiYWO3pnfHYuus0w1+3IxC
 ayP50/IRJ6bBT0zKIS6YELlq9QDkVNQjjq4O4tlAIp/ASNEXSl8g9NZ/O
 UL319zZeQXJg2ySRIy9gOed5OorWrHMH8BOAhNvm5S1dvf8zbl7/ljJ63
 e2VotnrRM4TgaDxDt5BWTjyZDnI5ziBAmzf06whgHAsRk+zpC3DIfGcQj w==;
X-CSE-ConnectionGUID: +5cc5lASSlO63OxsVWqK0Q==
X-CSE-MsgGUID: WRBVvlS6QDOfqR56YNmuuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="84551748"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="84551748"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:38:55 -0800
X-CSE-ConnectionGUID: ei03aTDIQ4WBqJWRt94qbg==
X-CSE-MsgGUID: hVnF2sJbR4uHDLcD4fIHAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="214871035"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa007.fm.intel.com with ESMTP; 26 Feb 2026 09:38:54 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH] drm/xe/compat: Remove unused i915_reg.h from compat header
Date: Thu, 26 Feb 2026 23:25:31 +0530
Message-ID: <20260226175531.2324526-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Display Code is made independent of i915_reg.h, hence
it can be dropped from compat header.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h | 6 ------
 1 file changed, 6 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
deleted file mode 100644
index 8619ec015ad4..000000000000
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-#include "../../i915/i915_reg.h"
-- 
2.50.1

