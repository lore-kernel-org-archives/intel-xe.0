Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B5FEE645C
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 13:23:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF03710E62F;
	Fri, 15 Sep 2023 13:23:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0074310E62B;
 Fri, 15 Sep 2023 13:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694784218; x=1726320218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zTw/VD9litQxH1nnpka5mI3DjLdMs/tAibHVf0ADhC8=;
 b=iWfSDRBR6B3LGaHqvoKXpRzn1Vfx5/3u5aZt3bwUTPtIBGAv9We1hKt5
 J70aC7eT4V9BvRhZnhPcPbco8WseeVhlrGHwOSxqsy5lNaKvsiLG8nPpH
 PpU2zrt0Nf1NROey6h1EXQ2YDjO6As4bbDmm2vH8W+y0NrmDKkVxZ1bO6
 2B/6AsQjzWo8VjX0objupuIqnfS16wDN2yg93I3KM4ev7vx9/boDNAGhE
 fVYcgjjjAwz3MQVRNDQQ7H0NYgpvv66G2YbWqWSh30U4Yh6dDdM5q9qgD
 P/jqdhZDyHjDA9cOKjpmuHNsI7CZ1/Z4+5ZTQvY6bW8J9vQiTDC/IzC/6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="364292132"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="364292132"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:23:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="810515415"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="810515415"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:23:36 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Sep 2023 06:23:33 -0700
Message-Id: <20230915132346.1845909-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230915132346.1845909-1-lucas.demarchi@intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 01/14] lib/rendercopy: Use common mocs
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Do not duplicate what is done by lib/intel_mocs.[ch], just reuse it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

