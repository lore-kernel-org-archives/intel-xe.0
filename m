Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB39EC43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 10:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF3710F088;
	Wed,  8 Jul 2026 10:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M7KjOFHZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203C610F088
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 10:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783505184; x=1815041184;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xGm32M15MBEblP+qv+1TibfsPBLobE8B5tIawENsJ1w=;
 b=M7KjOFHZAO2EN1saUZIcxzDyWnKaPc2sVCMbs7hVE/ODHVddhv7sqJ6o
 mNqlUFkUd22cwUSneFMjKe6QP5uAdk/S4NHfheLqml9PjH+m1fHFdKFTW
 OHJlfM4TuLM7qNNOlitFG7l2FUjGXxhq+OCXI5ET6pY75A1nIlGjwWWP6
 di8u5yBDrPCqbmeJDXZ7g66TT8JeRxgm7JPMQZxmDQP9BhscT4WamAVf/
 174j9oJuDQmEhlMK05YE1RcuwIftA02F6tomeY7aV0MJZwmuvaCIu5viy
 MZs7j8gX7yhEfasqpXFCsm12F6YRTjW14NmKOxcmVdGNqS/ZBxZhhYJuT Q==;
X-CSE-ConnectionGUID: 4Zz5Z4UXSIq/axo5pbwcWw==
X-CSE-MsgGUID: L9Etpi5bQQKn05gjuCgoig==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83275214"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="83275214"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 03:06:23 -0700
X-CSE-ConnectionGUID: QHOgiF95TlSYWIvVREakIQ==
X-CSE-MsgGUID: owKFU5W8QxupmItpVeJLAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="252508682"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.80])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 03:06:22 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/xe/uc: Apply RCS/CCS yield policy to SR-IOV VFs
Date: Wed,  8 Jul 2026 12:06:15 +0200
Message-ID: <20260708100616.1050537-1-marcin.bernatowicz@linux.intel.com>
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
---
 drivers/gpu/drm/xe/xe_uc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 75091bde0d50..c6f5fd966afb 100644
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
@@ -159,7 +160,9 @@ static int vf_uc_load_hw(struct xe_uc *uc)
 	if (err)
 		return err;
 
-	uc->guc.submission_state.enabled = true;
+	err = xe_guc_submit_enable(&uc->guc);
+	if (err)
+		return err;
 
 	err = xe_guc_opt_in_features_enable(&uc->guc);
 	if (err)
-- 
2.43.0

