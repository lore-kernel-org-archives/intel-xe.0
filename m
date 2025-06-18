Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9A9C7115A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 18:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB1E10E43D;
	Wed, 18 Jun 2025 18:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TykTZNb5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3810B10E29D
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 18:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750272612; x=1781808612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P/68RebJsfIfgx2fLhNtTDtd8lIkSFt7k2jALZMTDKU=;
 b=TykTZNb5cukwr32YiMR+vm/wS9fV/G3W+d0+yK5pay0CIsQ+jhuojtjF
 Zr3EeBnOjQyDrbyHWX/oPf0hShmIyD7x8xh3wfQECBvjJ0DpMhnJ31R1u
 xTSULrxmXRZRQ57C1QJYSQ9XvO4LF4ws3hPEWlGNYbZqnI4yB+MeC7kbf
 yV1INMtlCGY5q+BMgDxTf/U2Idl+Bjk0Hg8HFR62FgQx/0BtiHBL9d0Cm
 zzSMfFayCwDaiAl3uNg2rmZ8Dd+kdv/duKucuyFdroft60hud9VvjxflM
 1Rkn9sK9ba5cg40qVmfM/agb/7EG6mxrqRzZexDpDrFRQ9mkTNEQeh+9K w==;
X-CSE-ConnectionGUID: LXsKsNPBTa+3sDBx+8akdw==
X-CSE-MsgGUID: Yh1a6lpBS5aO10S5hKfLMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="75036859"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="75036859"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 11:50:11 -0700
X-CSE-ConnectionGUID: xbdz2VP4QzWIBUxoWrDjQg==
X-CSE-MsgGUID: krCEdVkBROeeNcySnv/biQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="150730696"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 11:50:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v5 2/4] drm/xe/xe_guc_pc: Lock once to update stashed
 frequencies
Date: Wed, 18 Jun 2025 11:49:59 -0700
Message-ID: <20250618-wa-22019338487-v5-2-b888388477f2@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618-wa-22019338487-v5-0-b888388477f2@intel.com>
References: <20250618-wa-22019338487-v5-0-b888388477f2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-a7f9c
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

pc_set_mert_freq_cap() currently lock()/unlock() the mutex multiple times
to stash the current frequencies. It's not a problem since
xe_guc_pc_restore_stashed_freq() is guaranteed to be called only later
in the init sequence. However, now that we have _locked() variants for
this functions, use them and avoid potential issues when called from
other places or using the same pattern.

While at it, prefer and early return for the WA check to reduce
indentation.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index a01fbe1ac4d46..538b4ea61c17c 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -891,27 +891,28 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
 
 static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
 {
-	int ret = 0;
+	int ret;
 
-	if (XE_WA(pc_to_gt(pc), 22019338487)) {
-		/*
-		 * Get updated min/max and stash them.
-		 */
-		ret = xe_guc_pc_get_min_freq(pc, &pc->stashed_min_freq);
-		if (!ret)
-			ret = xe_guc_pc_get_max_freq(pc, &pc->stashed_max_freq);
-		if (ret)
-			return ret;
+	if (!XE_WA(pc_to_gt(pc), 22019338487))
+		return 0;
 
-		/*
-		 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
-		 */
-		mutex_lock(&pc->freq_lock);
-		ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
-		if (!ret)
-			ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
-		mutex_unlock(&pc->freq_lock);
-	}
+	guard(mutex)(&pc->freq_lock);
+
+	/*
+	 * Get updated min/max and stash them.
+	 */
+	ret = xe_guc_pc_get_min_freq_locked(pc, &pc->stashed_min_freq);
+	if (!ret)
+		ret = xe_guc_pc_get_max_freq_locked(pc, &pc->stashed_max_freq);
+	if (ret)
+		return ret;
+
+	/*
+	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
+	 */
+	ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
+	if (!ret)
+		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
 
 	return ret;
 }

-- 
2.49.0

