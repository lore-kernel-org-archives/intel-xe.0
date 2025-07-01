Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0063FC8303F
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 20:13:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3EB10E60B;
	Tue,  1 Jul 2025 20:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PP2XNGrh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACC610E616
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 20:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751400812; x=1782936812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i0a7TcdB+BeZj+YFbU4HblUsGibzD5sR0ZJlej7vEvg=;
 b=PP2XNGrhOOxN8Mj2Iz+mHA8LtdooWQ2L5B3uT7Rqgz7k8ey9pkjmaPws
 e7vAiQYpxA0xblogc9lltbNa1JALWbf/28X3gH7EvLUFpbJ6GPDWJSlCL
 5+RRRXJwbD8isIi+g6feg6+XMYegL5mTMmMfeDLzWdGEfWnhg4jfLAoJs
 E6lIHYaBuX15nIpTTJS7ljwNLApU3/3J5PlCUPw2VjMaq2PW9KyGWl2sQ
 1yA1onheNFY8/6VRO/ucYravHw0KzfFFdEMTvxQznmAM0vGn5xGO4myrz
 G/ei6ZiIAG/ue/YHttZjo3PzsxLBq1PtPQ8l1xzL6dO37046iN5lrhRfP w==;
X-CSE-ConnectionGUID: VdVakM6hRIan9R0ODKMICw==
X-CSE-MsgGUID: iij2HBaETpqEzepPkbfYww==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53545993"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53545993"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 13:13:31 -0700
X-CSE-ConnectionGUID: AyWtkSH9QkmlHRWbmdvtEg==
X-CSE-MsgGUID: oGl9rcDBSqq1N2sL1G8k0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="177539670"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 13:13:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 2/7] drm/xe: Export xe_step_name for kunit tests
Date: Tue,  1 Jul 2025 13:13:23 -0700
Message-ID: <20250701201320.2514369-11-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701201320.2514369-9-matthew.d.roper@intel.com>
References: <20250701201320.2514369-9-matthew.d.roper@intel.com>
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

xe_step_name() is used by xe_assert(), so adding assertions to functions
like xe_device_get_gt() will result in

  ERROR: modpost: "xe_step_name" [drivers/gpu/drm/xe/tests/xe_test.ko] undefined!

while building the kunit tests.  Export xe_step_name to avoid these
build failures when adding assertions.

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_step.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index c77b5c317fa0..10e88f2c9615 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -5,6 +5,7 @@
 
 #include "xe_step.h"
 
+#include <kunit/visibility.h>
 #include <linux/bitfield.h>
 
 #include "xe_device.h"
@@ -255,3 +256,4 @@ const char *xe_step_name(enum xe_step step)
 		return "**";
 	}
 }
+EXPORT_SYMBOL_IF_KUNIT(xe_step_name);
-- 
2.49.0

