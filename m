Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8E4C43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 07:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E5410F453;
	Thu,  9 Jul 2026 07:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6RLfHFO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEA610F453
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 07:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783583995; x=1815119995;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x5QDvJPY6qXeQysKpkzXRemF8+v4ABJSv3XCVP2gXVI=;
 b=D6RLfHFOECFWzGI5IOTekQ42/JV1OWTGmNGLAaxj4kKM9vT+HLAPWLxx
 IodeIhKXMUXQ6qBpP7Lw8Ts3IESZdJ88DfjmuFQrQGdILL/M7W3n3asH0
 6maQQTZ+Fg4wQ/RN8bHQKP7Z+JHNfWakcUbxTCP1u6UGwFUWcLaqmgAji
 yXmcxpkk0CABIIHjlTv3Z8gh/8xU0Mk6sZErii1q3NzIjP8JtlZ1/u4JW
 9PRZwjitonA4BkbQ+4WXY3w2r3jWwjHRfaTflYsYgiLVOEUFe+zmUQy+4
 Y0eT1ZVinDkeYpzIp+6lKFBTWh6VBNKuIcy9Rwln6O2eZtxg40+To8p7Z w==;
X-CSE-ConnectionGUID: zmaCV3F6SEa5qkPz8nb31Q==
X-CSE-MsgGUID: kHVsgEemQyeA9n5D0KZQiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101685478"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="101685478"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 00:59:55 -0700
X-CSE-ConnectionGUID: eO6s7rIeQWqE17+60KxO+Q==
X-CSE-MsgGUID: XKmdJ5YMS5WlEZwXquPcLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="251861564"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.80])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 00:59:53 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2] drm/xe/uc: Apply RCS/CCS yield policy to SR-IOV VFs
Date: Thu,  9 Jul 2026 09:59:45 +0200
Message-ID: <20260709075945.1337660-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

VFs were missing the call to apply the global scheduling policy.
Call xe_guc_submit_enable() during vf_uc_load_hw() to ensure VFs
get the same policy enforcement as PF.

Fixes: 26caeae9fb48 ("drm/xe/guc: Set RCS/CCS yield policy")
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
v2: Keep VF init order aligned with PF: call xe_guc_submit_enable() after
    xe_guc_opt_in_features_enable(). (Daniele)
---
 drivers/gpu/drm/xe/xe_uc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 75091bde0d50..65f59f06177f 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -15,6 +15,7 @@
 #include "xe_guc_pc.h"
 #include "xe_guc_rc.h"
 #include "xe_guc_engine_activity.h"
+#include "xe_guc_submit.h"
 #include "xe_huc.h"
 #include "xe_sriov.h"
 #include "xe_wopcm.h"
@@ -159,12 +160,14 @@ static int vf_uc_load_hw(struct xe_uc *uc)
 	if (err)
 		return err;
 
-	uc->guc.submission_state.enabled = true;
-
 	err = xe_guc_opt_in_features_enable(&uc->guc);
 	if (err)
 		return err;
 
+	err = xe_guc_submit_enable(&uc->guc);
+	if (err)
+		return err;
+
 	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
 	if (err)
 		return err;
-- 
2.43.0

