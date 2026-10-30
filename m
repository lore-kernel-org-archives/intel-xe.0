Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4896B606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 22:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UPppkSAX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B821112A48;
	Fri, 30 Oct 2026 22:58:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F00410E8F8
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 22:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793401095; x=1824937095;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=qBWIJzVRiG+Wm/EJVjNmvUGhny4SVn087t//o1fzG1I=;
 b=UPppkSAXSZTag3Bl/oIdBPUWIEGlC9MHoXCPE7SsRjExkAYxcbkEupps
 oH+yOuWa5cC0XXG54kJ1HwgaMTo4d26d2w+eL8YerN/L2sLd8bjNh2piL
 WhMmRo5TS1PE3nkE9W4uM/kGhqj3Sx7mbzi0R5Ejm4fSlpJWpMLY7UlIY
 LXNOTdZc1ByzhMNtmUROu5+lnjuQkHkKRQM8ILdVuzffHJJEibW3W2DA8
 GO3Q5MqpOObyAGoO47CjiuoVGexHRtI7YNkyewmT/0p/4dkyjK8oXbc6y
 zhdQ/7vXzxntu6rU+FOuhs2VKdeQn5F0VaBQkvpMPFjuMlYz/bp1l+7G6 A==;
X-CSE-ConnectionGUID: /C7Gvt/LTV+7hGeGpOq5Cw==
X-CSE-MsgGUID: UJd5Oiw7TGKWcwRxNdURIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2197995"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2197995"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:58:12 -0700
X-CSE-ConnectionGUID: dba6gdHhRWaSve5bTRyY3Q==
X-CSE-MsgGUID: savxsadmQDm4d8UPDGQZNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5637716"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.197])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:58:12 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 30 Oct 2026 19:57:44 -0300
Subject: [PATCH v2 05/10] drm/xe: Bail from adjust_idledly() if no
 applicable workaround
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-wa_16031259911-v2-5-919fa1c27070@intel.com>
References: <20261030-wa_16031259911-v2-0-919fa1c27070@intel.com>
In-Reply-To: <20261030-wa_16031259911-v2-0-919fa1c27070@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Atwood <matthew.s.atwood@intel.com>
X-Mailer: b4 0.15-dev
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

Re-organize adjust_idledly() so that we return and avoid touching the
hardware if no applicable workaround was found.

Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 01a7baf061eb..32d33c70e7f4 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -605,7 +605,7 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 	u64 idledly_ps, idledly_hw_ps;
 	u64 min_idledly_ps = 0;
 	u64 max_idledly_ps = -1;
-	bool inhibit_switch = false;
+	bool clear_inhibit_switch = false;
 	bool wa_applied = false;
 
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
@@ -616,12 +616,6 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 		if (!idledly_units_ps)
 			return;
 
-		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
-		inhibit_switch = idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
-		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
-		idledly_ps = idledly * idledly_units_ps;
-		idledly_hw_ps = idledly_ps;
-
 		if (XE_GT_WA(gt, 14025941587))
 			min_idledly_ps = max(min_idledly_ps, 5000000);
 
@@ -633,13 +627,24 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 					       max_idledly_ps,
 					       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
 
-			/* Clear the inhibit switch without disturbing a valid delay. */
-			if (inhibit_switch) {
-				idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
-				wa_applied = true;
-			}
+			clear_inhibit_switch = true;
 		}
 
+		/* No applicable workaround found. */
+		if (min_idledly_ps == 0 && max_idledly_ps == -1 && !clear_inhibit_switch)
+			return;
+
+		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
+
+		if (clear_inhibit_switch && idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED) {
+			idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
+			wa_applied = true;
+		}
+
+		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
+		idledly_ps = idledly * idledly_units_ps;
+		idledly_hw_ps = idledly_ps;
+
 		/*
 		 * min_idledly_ps is applied before max_idledly_ps, which takes
 		 * priority if the two ever conflict (not expected in practice).
@@ -671,7 +676,8 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 
 			xe_gt_dbg(gt, "idledly %s: set %llups min=%llups max=%llups inh=%u ts=%ups\n",
 				  hwe->name, idledly_ps, min_idledly_ps, max_idledly_ps,
-				  !!inhibit_switch, gt->info.timestamp_base);
+				  !!(idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED),
+				  gt->info.timestamp_base);
 			xe_mmio_write32(&gt->mmio,
 					RING_IDLEDLY(hwe->mmio_base),
 					idledly_reg_val);

-- 
2.56.0

