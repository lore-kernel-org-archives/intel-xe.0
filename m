Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E685C19F4E
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 18:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29ECA11A768;
	Thu, 25 Apr 2024 18:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F0UZl4V0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2705A112117
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 18:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714069430; x=1745605430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nHrFFTT3SffY/d5aZFaf+owtMCVARbP0rMD2e+ky+KE=;
 b=F0UZl4V0CIFdYQ8HtrqwDxaX4R+sKSE/QpFEIPaM5SMXHdlEH70i/+17
 6ydJ+h3LyBYhR5a5KzXjuNC6Ov91O9yAdInSKTRo//TyaOb9rz2M2fKj0
 T0BqoycULFr2L9/RCLXFBzACYE+toTYdr0sTeWW6pvUE4BajgZmpN7shP
 +GqZh12NSQ8sRr4xgiQzMM6QPHlukr0woQ4Ut9xrU2OH/YJYiz47ubT3O
 mLKmLlslykmrZCzaRCepxetQo4jME5KZ6b6NaucAkCVuZmzv5kKD0kAhN
 KbcjANtvErbjosK9RosV4nqekdwX9138fF1copWQgGGyyc5XvHqV1l1Cy Q==;
X-CSE-ConnectionGUID: U7BjosFoRM68WRlFcRPL2w==
X-CSE-MsgGUID: cBB0u0JPSYeFzJROhLW8Dg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9605760"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9605760"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 11:23:49 -0700
X-CSE-ConnectionGUID: xvPDcRlgQGSSNAgOhYHuFA==
X-CSE-MsgGUID: yR9RREFfQZ6vZHxlCWRvkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="25157831"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 11:23:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: vinay.belgaumkar@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 michal.winiarski@intel.com, matthew.brost@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 5/5] drm/xe: Move sw-only pcode initialization
Date: Thu, 25 Apr 2024 11:24:10 -0700
Message-ID: <20240425182410.2705061-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240425182410.2705061-1-lucas.demarchi@intel.com>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
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

Move it to xe_gt_init_early() that initializes the sw-only part for each
gt.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 ---
 drivers/gpu/drm/xe/xe_gt.c     | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d090c4e7d57a..c0f2cf0dc006 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -596,9 +596,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	for_each_gt(gt, xe, id)
-		xe_pcode_init(gt);
-
 	err = xe_display_init_noirq(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 2e8efce2799a..b6ab3e0cfb64 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -44,6 +44,7 @@
 #include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_pat.h"
+#include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_mocs.h"
 #include "xe_reg_sr.h"
@@ -329,6 +330,7 @@ int xe_gt_init_early(struct xe_gt *gt)
 	xe_tuning_process_gt(gt);
 
 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
+	xe_pcode_init(gt);
 
 	return 0;
 }
-- 
2.43.0

