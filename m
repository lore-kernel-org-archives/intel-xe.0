Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8BF606A331
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 13:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iiKgvzqJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C51210F5C6;
	Tue, 24 Nov 2026 13:59:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E166E10F5D1;
 Tue, 24 Nov 2026 13:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795528744; x=1827064744;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uNe1VhC9KnwwRSohsBCfR2+ip/zghJfs1Sv7lRDKqCk=;
 b=iiKgvzqJBxLPbpBJ0Gu8Hz5oNb/lVEpwpj8vhfJ6Nj+Gy8LMTCCl8vuA
 Eeht5S26LXUe8biXX4c6H/YEwETuoIIZDjnsLide0r9MO58lraZYfppyP
 sL4hs7Sb303MvdVlnykaj2C/lzCofuwl/il/BikHM5iohGY0Coirikdsp
 5HyK7cZ2TyjPUtdilw3bIcA78232e5emWsjsUmKuJTGex8cUcOh5jy4gs
 wOoyBq9P8yJIbaHJ3D56mVfnJ0TKLJfkEoEHr6PNYFskmwSAzet44cUQi
 FFgVj8UcUVeT8iOLHFHLmiQqPhG+/Aca+xJGkNMpJKxD53Ad9sk7cwj/4 w==;
X-CSE-ConnectionGUID: OJeKyEuMQpOaqzm/pf91rA==
X-CSE-MsgGUID: 2oNuVa34R3ulIdXhvRSCFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4358733"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4358733"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 05:59:02 -0800
X-CSE-ConnectionGUID: bOLmZ8qHTrSsqqGYAFCmHA==
X-CSE-MsgGUID: SleyQiDaT+eUH9lA31TkUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11584029"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 05:58:57 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/i915/bios: drop _INTEL_BIOS_PRIVATE check from
 intel_vbt_defs.h
Date: Tue, 24 Nov 2026 15:58:52 +0200
Message-ID: <20261124135852.1542458-1-jani.nikula@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

intel_vbt_defs.h remains private to intel_bios.c (and gvt/opregion.c),
but drop the extra check to ensure it's only included from said places.

This allows running

$ make HEADER_CHECK=drivers/gpu/drm/i915 headercheck

without any exclusions.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 | 8 +-------
 drivers/gpu/drm/i915/display/intel_bios.c     | 4 +---
 drivers/gpu/drm/i915/display/intel_vbt_defs.h | 3 ---
 drivers/gpu/drm/i915/gvt/opregion.c           | 1 -
 4 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index ba7eecfffdca..43f7c433c447 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -446,14 +446,8 @@ ifdef CONFIG_DRM_I915_WERROR
 endif
 
 # header test
-
-# exclude some broken headers from the test coverage
-no-header-test := \
-	display/intel_vbt_defs.h
-
 always-$(CONFIG_DRM_I915_WERROR) += \
-	$(patsubst %.h,%.hdrtest, $(filter-out $(no-header-test), \
-		$(shell cd $(src) && find * -name '*.h')))
+	$(patsubst %.h,%.hdrtest, $(shell cd $(src) && find * -name '*.h'))
 
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
       cmd_hdrtest = $(CC) $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S -o /dev/null -x c /dev/null -include $<; \
diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 7b6a6f8c3cf1..deb6c7912631 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -42,10 +42,8 @@
 #include "intel_display_utils.h"
 #include "intel_gmbus.h"
 #include "intel_rom.h"
-#include "intel_vdsc.h"
-
-#define _INTEL_BIOS_PRIVATE
 #include "intel_vbt_defs.h"
+#include "intel_vdsc.h"
 
 /**
  * DOC: Video BIOS Table (VBT)
diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
index 0dc13d080e8a..6858d2318b2d 100644
--- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
@@ -30,9 +30,6 @@
  *
  * Please do NOT include anywhere else.
  */
-#ifndef _INTEL_BIOS_PRIVATE
-#error "intel_vbt_defs.h is private to intel_bios.c"
-#endif
 
 #ifndef _INTEL_VBT_DEFS_H_
 #define _INTEL_VBT_DEFS_H_
diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
index d6e76ba31d60..ff77ba0df2fe 100644
--- a/drivers/gpu/drm/i915/gvt/opregion.c
+++ b/drivers/gpu/drm/i915/gvt/opregion.c
@@ -30,7 +30,6 @@
  * Note: Only for GVT-g virtual VBT generation, other usage must
  * not do like this.
  */
-#define _INTEL_BIOS_PRIVATE
 #include "display/intel_vbt_defs.h"
 
 #define OPREGION_SIGNATURE "IntelGraphicsMem"
-- 
2.47.3

