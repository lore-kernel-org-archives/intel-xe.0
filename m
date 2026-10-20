Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E149606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 02:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QbB/4upF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161A010E2FA;
	Tue, 20 Oct 2026 02:37:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DE810E2FA
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 02:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792463851; x=1823999851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VAAc7V/IFdoFF5KS0qZ0A1/FWdcl7N1akS6SOF2bH5w=;
 b=QbB/4upFSAlBy1RNuUEd84+hh+TxlRLUYnHNX3WpOfSInwBEp9dLzIKt
 /FgmrTqnmpT5Jnn/asEH4h47jU1uSUH6ENdl5Bd1Gp+FJV/XQ+5bvkPnO
 afunGwj2jHaW8t7YiPWQKefNRz9Fi+Q79GbkVEUHSKmKe203w0p1XWvTB
 8QDT6DdBbRMGvtOMCxOii4o5v07g4J2wix9NWGV0nadwiTxNZYUujsOFG
 EqHjJgzDB0jokzKcDFMu8KNsdtmK/Zae4sBvpTpP79coyjH0aXrf0iwmW
 08CHbtZs/dkrdrKIXZw/G5vr8bfRAz0VlEIeZ8CzEc9m8OBPPypqy0QCH A==;
X-CSE-ConnectionGUID: wdgAdD2QRfe28p+TzyG6Pg==
X-CSE-MsgGUID: uC6S78B+Q3aqb2pcmD/nLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1040806"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1040806"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 19:37:30 -0700
X-CSE-ConnectionGUID: Y3CXI4s5QZieK/Halt4dqw==
X-CSE-MsgGUID: 75ifdVPvTk+8kGivtznqTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2648659"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 19 Oct 2026 19:37:28 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v13 3/9] drm/xe/hw_error: Guard csc_hw_error_work() with
 runtime PM
Date: Tue, 20 Oct 2026 08:06:03 +0530
Message-ID: <20261020023641.200658-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020023641.200658-1-raag.jadav@intel.com>
References: <20261020023641.200658-1-raag.jadav@intel.com>
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

xe_device_declare_wedged() callers are expected to hold a runtime PM
reference. Fix it.

Fixes: a7df563b45b0 ("drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v10: Guard wedge callers with runtime PM (Sashiko)
---
 drivers/gpu/drm/xe/xe_hw_error.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index f53a6b3055de..ac720710c8e8 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -14,6 +14,7 @@
 #include "xe_drm_ras.h"
 #include "xe_hw_error.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
 #include "xe_survivability_mode.h"
 
 #define GT_HW_ERROR_MAX_ERR_BITS		16
@@ -170,6 +171,7 @@ static void csc_hw_error_work(struct work_struct *work)
 	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
 	struct xe_device *xe = tile_to_xe(tile);
 
+	guard(xe_pm_runtime)(xe);
 	xe_survivability_mode_runtime_enable(xe);
 }
 
-- 
2.43.0

