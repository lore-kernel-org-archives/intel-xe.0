Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CD6606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 14:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ChIqUkIq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFC010E05B;
	Fri, 23 Oct 2026 14:37:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC07F10E05B
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 14:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792766210; x=1824302210;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PdJzs/P/yu8NaYwMGKGi/7U+hv9xvusIkAKguimrx74=;
 b=ChIqUkIqr5DK1zotLpBoEMesn6FbCxZc3e4H+QjAcgqzfPChMN2CZjOI
 Pml4fBURa29F4vdUGHVkIzElE2KUttaH9zkVTTltygpfunFvzmnv0wMX0
 riV4FpW7153P+aKMlPTmT829b1ahmLFQgFMULLPak6xBLNlIICdiIkKIc
 hesNgTZj0wQR1mywI7KehihGhldTdGAq/Jl0cGCTm81e+hmFKo4Vj24ln
 NCu3oEVbs86mrs9ES2MZbhd7HgTre84oltEEzFPcVwS/NVj4NcmuyXi4+
 r+NnlQp/pRZxWwADD3Y01uKy7cm9xyLSlrX9De7EmExYhBsdaVz7GRVl8 w==;
X-CSE-ConnectionGUID: O+r2ORVNTJ2Lb0CVCHhPsQ==
X-CSE-MsgGUID: rc39fKqJSfy8tXHwhxnHmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1422610"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1422610"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 07:36:50 -0700
X-CSE-ConnectionGUID: +8WFaLSmSZ6Hbg2XQX4zOQ==
X-CSE-MsgGUID: wsONwFapQIKrEGcgarVG0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3754771"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 23 Oct 2026 07:36:47 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2] drm/xe/hwmon: Use overflows_type() for temperature range
 check
Date: Fri, 23 Oct 2026 20:06:33 +0530
Message-ID: <20261023143632.461084-2-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The temperature value is calculated as an s64 before being stored
in a long. Check whether the value fits in the target type using
overflows_type() instead of comparing against LONG_MAX directly.

This keeps the overflow check correct on both 32-bit and 64-bit
systems and avoids architecture-specific handling.

Fixes: 24ec15d64617 ("drm/xe/hwmon: Decode CRI temperature registers as IEEE-754")
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2:
- Use overflows_type(), instead of #ifdef. (Jani)
---
 drivers/gpu/drm/xe/xe_hwmon.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 42acfeb8818c..515b288f18e5 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -6,6 +6,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/hwmon.h>
 #include <linux/jiffies.h>
+#include <linux/overflow.h>
 #include <linux/types.h>
 #include <linux/units.h>
 
@@ -1322,8 +1323,8 @@ static int xe_hwmon_temperature_decode(u32 reg_val, long *temperature)
 		value = 0;
 	}
 
-	/* Ensure the magnitude fits in long, which is 32-bit on some arches. */
-	if (value > LONG_MAX)
+	/* Ensure the decoded value fits in a long. */
+	if (overflows_type(value, *temperature))
 		return -ERANGE;
 
 	if (reg_val & IEEE754_SIGN)
-- 
2.48.1

