Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C70C48BF6
	for <intel-xe@archiver.kernel.org>; Sun, 25 Feb 2024 00:14:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CB410E008;
	Sun, 25 Feb 2024 00:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eSfBw2Uq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F90010E008
 for <intel-xe@lists.freedesktop.org>; Sun, 25 Feb 2024 00:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708820078; x=1740356078;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jU2G8vSINJuC1y114HoywoTr4zF7ojhZ153cvPv7lgc=;
 b=eSfBw2UqzwJTvJrGhmiMvO+yREldeNMwHRQjBx5AIy0J4/o8qawhAT+F
 Pe5kfxvKTVX9qAKJY/HWXwfGGtjC1JK9qjm95nw9jOQI5IrGf0IOfBGjL
 mp80hmn1t32Cm4mwtUwUXifE293HHZdGhq4nTgwffAtkzv1CwoyZhrbOB
 Vw5Bv1A5jdoHVoockvgRPn2TjrCTob2+rEo/321mR7TZ5HppdVEoFWUOq
 Y2WIuEUbLCOQBF5vxYvqmt/GHhszycRfr31ihQlk3fthNmAj3qMXqFQEy
 zMp62Uc/FC76exeBOCLKQLb5sbVmWTkjtTrEwGuWmipCceRSimBn7F+r/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="2994934"
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="2994934"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2024 16:14:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; d="scan'208";a="11072258"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2024 16:14:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/xe: Fix build error in xe_ggtt.c
Date: Sat, 24 Feb 2024 16:14:48 -0800
Message-Id: <20240225001448.81513-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Need to include io-64-nonatomic-lo-hi.h for writeq function.

Fixes: 3121fed0c51b drm/xe: ("Cleanup some layering in GGTT")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402241903.R5J8hKVI-lkp@intel.com/
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 5d46958e3144..717d0e76277a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -5,6 +5,7 @@
 
 #include "xe_ggtt.h"
 
+#include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/sizes.h>
 
 #include <drm/drm_managed.h>
-- 
2.34.1

