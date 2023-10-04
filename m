Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96B5E8FDC3
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 03:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC70610E323;
	Wed,  4 Oct 2023 03:10:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2C510E0B8;
 Wed,  4 Oct 2023 03:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696389007; x=1727925007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sp0H0/Nh23DWx8zokrue4ojvLHoWqP6zo2UxAluHj20=;
 b=VxaH8DlYcO5AGL05kLr6pz5cExUAsnHOHvbGmQqFrp1+HJySr4nJ9uzr
 PRzyTtnj3PvRSyjun/Th+p68vYIC/0qze28sayDZ5japRFIKo0vztoq9p
 8B/veteJ7z3wBx4BCY2lshPgAVlk2oOrevUTxMrVjNup6s8J2jHfylfLF
 uk9sCa83AApepnWNzVKJRF5PfBSVjuqnQdeFjp1iATDq8bFqVLnhv0ocB
 JFnQqRrJbDeva5HUy7yrmHwRUmsmAGiHc/UYAEyUddTebu/gu9ZIYHGeV
 ANsrEJ8AodX3cAjvuFanehbo++oTIJ+X1YIoLKm7PVq8WArzXvc/WEKRF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="363308395"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="363308395"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="894760356"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="894760356"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:08:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 20:10:11 -0700
Message-Id: <20231004031023.3444455-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004031023.3444455-1-lucas.demarchi@intel.com>
References: <20231004031023.3444455-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t v2 01/13] lib/rendercopy: Use common mocs
 function
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Do not duplicate what is done by lib/intel_mocs.[ch], just reuse it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/rendercopy_gen9.c | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index db67b5ee3..b8959d073 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -19,6 +19,7 @@
 #include "intel_bufops.h"
 #include "intel_batchbuffer.h"
 #include "intel_io.h"
+#include "intel_mocs.h"
 #include "rendercopy.h"
 #include "gen9_render.h"
 #include "intel_reg.h"
@@ -135,34 +136,6 @@ static const uint32_t gen12p71_render_copy[][4] = {
 	{ 0x80041131, 0x00000004, 0x50007144, 0x00c40000 },
 };
 
-/*
- * Gen >= 12 onwards don't have a setting for PTE,
- * so using I915_MOCS_PTE as mocs index may lead to
- * some undefined MOCS behavior.
- * Correct MOCS index should be referred from BSpec
- * and programmed accordingly.
- * This helper function is providing appropriate UC index.
- */
-static uint8_t
-intel_get_uc_mocs(int fd) {
-
-	uint16_t devid = intel_get_drm_devid(fd);
-	uint8_t  uc_index;
-
-	if (IS_DG1(devid))
-		uc_index = 1;
-	else if (IS_GEN12(devid))
-		uc_index = 3;
-	else
-		uc_index = I915_MOCS_PTE;
-
-	/*
-	 * BitField [6:1] represents index to MOCS Tables
-	 * BitField [0] represents Encryption/Decryption
-	 */
-	return uc_index << 1;
-}
-
 /* Mostly copy+paste from gen6, except height, width, pitch moved */
 static uint32_t
 gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
-- 
2.40.1

