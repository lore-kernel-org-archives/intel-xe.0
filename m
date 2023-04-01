Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98943C6FD1D
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 08:42:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F3A10E080;
	Sat,  1 Apr 2023 08:42:49 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E5D10E080
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 08:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680338566; x=1711874566;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=18jGac6ENZnyuSrP9nEjF1Y3ZmPAiXW4+4/4NBMkL7c=;
 b=hQXwAFmfpBx6x3VAyUBs6InehNYsDDE1Ilc8n8fLx11tjBur9oNsZ0Ph
 rdORjK65r1t87DN4owI51S7F2RrXKBOWMpJmKNrM9snTCUOhAgH65oXH4
 FWKEJBJwMas8fMubBc6bzp1SIm2PdmoiJBg7qzpNOYWgZSVf4SgR+lI0E
 QVwW0SpHS+1UawRC2RHm2TMfWT75T3eLI/IOB6wFToJODnf1BpVSjqjvi
 J44QW8qqq2zGi8C0MDsnlkJNb9T5ecfjXZ6Mjh4il5muJtm2HYM3PzD6i
 RcdTVTwccyUugR2j3Wr5R7yCKzIBIKZyb7kzJejVQrOWvTjBuSXcYzLfi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="406666993"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="406666993"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 01:42:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="774621171"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="774621171"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 01:42:45 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sat,  1 Apr 2023 01:42:14 -0700
Message-Id: <20230401084214.1784236-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe/pat: Move PAT setup to a dedicated
 file
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

drm/xe/pat: Add missing include

Fix build error with W=1:

	../drivers/gpu/drm/xe/xe_pat.c:73:6: error: no previous prototype for ‘xe_pat_init’ [-Werror=missing-prototypes]
	   73 | void xe_pat_init(struct xe_gt *gt)
	      |      ^~~~~~~~~~~

Add xe_pat.h includes like commonly done.

Fixes: d2ceb4f09a00 ("drm/xe/pat: Move PAT setup to a dedicated file")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 266cf6f43a3c..293e4ff16107 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include "xe_pat.h"
+
 #include "regs/xe_reg_defs.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
-- 
2.39.0

