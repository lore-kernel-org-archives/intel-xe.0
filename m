Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35D3606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 05:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XhkpcY7e
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C7F112313;
	Thu, 22 Oct 2026 05:13:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D4B112312
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 05:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792646013; x=1824182013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7ojbM9FDdwyBLRHKHbMbKtxzaUklw3rdWP2DkqEPPHY=;
 b=XhkpcY7etnnJ7VUdz40DuUn7krXC2f/iypHIkS3qwrIA0qjMA69VPHSc
 zB9zKTf7p5vhRhTjoJqOGuXF2s2USu+JB8H+e20a1EcD6Mr9mknmIw3NP
 PdsAMNG7oFGq3/qlhdA5shppSA0q4K8DLRZwmsabuBAd6EZ2CuSFW/8XQ
 XQMqMlNH2auP1osFGxhYhfRclqfUSUx2ir8XGPhHvyj56nriFgDJlgSIS
 b8TGe0DKaY5kCRwvkyxdntIGEE5NQmrSnaQEoBT3mPyED+YoDeWLCqDk7
 yENjXWA+AY2Xmg2F0bSvLujd+8vSOJwYQjHLOpkwYkZWd4QqperTkvRvI g==;
X-CSE-ConnectionGUID: F34TLf4vTuGKe+kugbNdqA==
X-CSE-MsgGUID: yRnJOuzYTzqRTCS1hWv/pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1393933"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1393933"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:13:32 -0700
X-CSE-ConnectionGUID: WS5smfU7Qg2FDOHfteJ0mQ==
X-CSE-MsgGUID: v6xMsWh0Tva9VIppvl3uEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3268727"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 21 Oct 2026 22:13:30 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v14 3/9] drm/xe/hw_error: Guard csc_hw_error_work() with
 runtime PM
Date: Thu, 22 Oct 2026 10:42:27 +0530
Message-ID: <20261022051303.282805-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022051303.282805-1-raag.jadav@intel.com>
References: <20261022051303.282805-1-raag.jadav@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xe_device_declare_wedged() callers are expected to hold a runtime PM
reference. Fix it.

Fixes: a7df563b45b0 ("drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
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

