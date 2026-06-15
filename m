Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71E7CD98CF
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 15:28:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AD910E505;
	Mon, 15 Jun 2026 15:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="naKvnPKj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6A410E505;
 Mon, 15 Jun 2026 15:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781537324; x=1813073324;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jbJy6h47RtheuI3fo3h3cMXQoSr559B606X+Z4Cx0ZU=;
 b=naKvnPKjyejdGCyhdOLsbIwZlmH7J8xldvL+TP3YZFmyrzp3/Oe5J8Ar
 SuJviQzoUNW65gygxSftJa5Wh6YinWNb3Mqe8nbQeFyrNheNKJenHwc7U
 pDgXbYxPQbNctsW32Tt+tLkAPeOHdZOfbuT+rd9NaaU1/rDC1dtJB0g3G
 IvT5pJM/vXqO4H0ZO8kWNgPQUh/KD9rJPb1AJ+/l0lKvmbauno4Zj6p5K
 CecQtg8SppwIV4lSS7Tjl0AQtqEoC8dkGGWxtzYxK39ISWvFYgUcFu7p2
 hmxdWuZQON+JYsEj7QtMjiqO8Iq5AMuNu6GvexA6aR9r9tKUnOmtC0TIO A==;
X-CSE-ConnectionGUID: Z7Nr7O3YR9Kdh53vsVV6OA==
X-CSE-MsgGUID: h48CdmGbTrWF+4ywSazEpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="86181128"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="86181128"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 08:28:44 -0700
X-CSE-ConnectionGUID: jIkCG+CYTZarRAMFdLnLuQ==
X-CSE-MsgGUID: W7nwjW6qTDem5rZ180wDjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="243335475"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 08:28:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/intel: drop driver include from mchbar_regs.h
Date: Mon, 15 Jun 2026 18:28:37 +0300
Message-ID: <20260615152837.1898991-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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

Headers under include/ aren't supposed to try to include headers from
driver directories, such as i915_reg_defs.h. Remove it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/intel/mchbar_regs.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/drm/intel/mchbar_regs.h b/include/drm/intel/mchbar_regs.h
index ca0d421be16c..66498ca5e40b 100644
--- a/include/drm/intel/mchbar_regs.h
+++ b/include/drm/intel/mchbar_regs.h
@@ -6,8 +6,6 @@
 #ifndef __INTEL_MCHBAR_REGS__
 #define __INTEL_MCHBAR_REGS__
 
-#include "i915_reg_defs.h"
-
 /*
  * MCHBAR mirror.
  *
-- 
2.47.3

