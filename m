Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851FE606A325
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 15:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jCXSTwRU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F15A10EEF1;
	Thu, 19 Nov 2026 15:16:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296E510E8B5;
 Thu, 19 Nov 2026 15:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795101411; x=1826637411;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mxaDl8y88XXUc+I4uWr6ok25nhI4NNQGNZOoIddyxvE=;
 b=jCXSTwRUXkl+tAeEPIqRDEesH7MaHFg6h5gFWAVr6chu2cXiN3ngaxOZ
 oIIis0Pa0ZlnZ9Yr0atUlD0hkya6lPhO7tLAjE91piTTwSsWHOXjpbhNQ
 ZZn7QuqtFUZHxAm7Y8grxwna+61nOkekPaBOASj+p9n6RUCHgHGSYPvQu
 BgPNcmSKbdJywYNfju5X6Y6V+nl8XCtSkk79BaadZ2tu/aM1q4zYbPKkl
 rxaz5Y1idfTYdp4zQ7siqbw5SbCHNDXHjpphlh6nvr19yNn+F/YT9y2KG
 Dmq33h5do5oBrwfvwv1fuA1o/H5sJYuozDiRHNz2YEPrpX+2FfYv+sjVB Q==;
X-CSE-ConnectionGUID: 7zoTqlLfQ625mMuDFHMkUA==
X-CSE-MsgGUID: e/vQRCIyTMiYQvuhQE93vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3840341"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3840341"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 07:16:50 -0800
X-CSE-ConnectionGUID: OK2+9K1aTOa+GExCPer7jA==
X-CSE-MsgGUID: 3+Cpc5CuSP2TEIABG2Y+MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10835495"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.162])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 07:16:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 1/2] drm/i915: drop unnecessary display/ includes
Date: Thu, 19 Nov 2026 17:16:43 +0200
Message-ID: <20261119151644.4097956-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Remove intel_display_core.h from uncore, and intel_crtc.h from initial
plane as unnecessary.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_initial_plane.c | 1 -
 drivers/gpu/drm/i915/intel_uncore.c       | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_initial_plane.c b/drivers/gpu/drm/i915/i915_initial_plane.c
index d7792b65ec15..9dcb858b9e04 100644
--- a/drivers/gpu/drm/i915/i915_initial_plane.c
+++ b/drivers/gpu/drm/i915/i915_initial_plane.c
@@ -6,7 +6,6 @@
 #include <drm/drm_print.h>
 #include <drm/intel/display_parent_interface.h>
 
-#include "display/intel_crtc.h"
 #include "display/intel_display_types.h"
 #include "display/intel_fb.h"
 #include "gem/i915_gem_lmem.h"
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index b53059c1a782..4e10a02f5750 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -27,7 +27,6 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
-#include "display/intel_display_core.h"
 #include "gt/intel_engine_regs.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_regs.h"
-- 
2.47.3

