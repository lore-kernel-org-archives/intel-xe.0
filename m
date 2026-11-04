Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8A2606A31B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 13:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I3UZ9/LS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CB010E23E;
	Wed,  4 Nov 2026 13:52:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68C910E23E
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793800361; x=1825336361;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i1xIvmncW3N2r/jrP3jLt+zMATq1NkLmj7Mr9lcCkA4=;
 b=I3UZ9/LS07nd7ILtJkCSNL29vkilbLtoyzynQ41ipjxyDkEGL04n29dP
 JxL2pn+EZlTAPv0+/N8wyKQcLq7ha1XMxfcWgu2fR0IlzAaIcFCom+fnV
 w9HVXFG71MofEFFCHXYCFcyj84S3Tn39MRTIlA3emphehgkl0cKK+P60n
 tkaY4CiFjxyitY+eiwF9u6+HFxN5AVS2m5w/LYu8LTdwcZJSmxg3YocMg
 5LwI1RNwyMxDfIbwXGa77Ak8xDWs/jOUrPlDAZlal6XjRNmQ8bV7SAP7Y
 ShPbfQ6V0vTPo0j4Iqev7SyC2DlKx8dPw+B9a3jLemX1wTBlOw2WddnLs Q==;
X-CSE-ConnectionGUID: JxkjVzTST52wyKccVqPOPw==
X-CSE-MsgGUID: g/7GQwUtQmaWofYPjWBD6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2454525"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2454525"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 05:52:23 -0800
X-CSE-ConnectionGUID: 4DW+JuvpTkSvl8fQQhWpTg==
X-CSE-MsgGUID: dQQZqWFNTGmGYcnBj3Qu7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6858507"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 05:52:21 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 himal.prasad.ghimiray@intel.com, joonas.lahtinen@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe/pm: Refuse suspend/hibernate when used VRAM exceeds
 available memory
Date: Wed,  4 Nov 2026 19:21:33 +0530
Message-Id: <20261104135133.139627-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

On PM_SUSPEND_PREPARE and PM_HIBERNATION_PREPARE the driver evicts VRAM
contents to system memory. If more VRAM is in use than system memory can
hold, eviction fails in the notifier, which only logs it, and the
transition then fails later during device suspend.

Compare VRAM usage across all VRAM regions with available system memory
(si_mem_available()) plus free swap, since evicted user BOs can be
swapped out by the shrinker. If it doesn't fit, fail with -ENOMEM before
taking the runtime PM reference or starting eviction, so the transition
is cancelled cleanly up front.

This is a best-effort check: usage can change between the check and the
eviction, and pinned BO backups cannot be swapped.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f7e2770252ec..85698361f2ba 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -9,6 +9,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/suspend.h>
 #include <linux/dmi.h>
+#include <linux/mm.h>
+#include <linux/swap.h>
 
 #include <drm/drm_managed.h>
 #include <drm/ttm/ttm_placement.h>
@@ -439,6 +441,24 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 	case PM_SUSPEND_PREPARE:
 	{
 		struct xe_validation_ctx ctx;
+		struct ttm_resource_manager *man;
+		u64 vram_used = 0, sys_avail;
+		int i;
+
+		for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
+			man = ttm_manager_type(&xe->ttm, i);
+			if (man)
+				vram_used += ttm_resource_manager_usage(man);
+		}
+
+		/* Evicted user BOs may be swapped out by the shrinker */
+		sys_avail = (u64)(si_mem_available() + get_nr_swap_pages()) << PAGE_SHIFT;
+		if (vram_used > sys_avail) {
+			drm_warn(&xe->drm,
+				 "Used VRAM %llu MiB exceeds available system memory %llu MiB, refusing suspend/hibernate\n",
+				 vram_used / SZ_1M, sys_avail / SZ_1M);
+			return notifier_from_errno(-ENOMEM);
+		}
 
 		reinit_completion(&xe->pm_block);
 		xe_pm_block_begin_signalling();
-- 
2.25.1

