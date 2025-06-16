Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F10C71159
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 06:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A8F10E28B;
	Mon, 16 Jun 2025 06:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZ8db9+v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C61210E060
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 06:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750054668; x=1781590668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tatd0Byp/yjhagnEUvgIxNy6AfIy5gp4CVjZ8+BJPp0=;
 b=GZ8db9+vp3TFXyXLL+i+lo3EJpOxk/b5dx17kV+wNkUY9j/Rzfz8BLk6
 RgzkFAc9baM2ci7esecJtLgLe2uPlyRyRI9tmg1fJV+TvF9MdYta67zUg
 LRzbRygSJpx0Mi8/oSR4DDZV+RNbZc+njl8xGZtjZ2MZDX7M8bTwk6JgE
 ic9EfF9KO1nmx5LCQvI+bfNyYvVZOl6Ya2bDpdWbi5lWJdKsa6cpDDuhx
 M2v5Zt1R6u+62+ZcexcKCo8KVqn5qeOVWmPC8+hX7sotxBZ7QyXyz27x4
 tj6cdcq+jXivvFySD7XOSdQLxGGVoLJ817uyiP1CWJXrhOnOt3E+y0BVB g==;
X-CSE-ConnectionGUID: F8XcM0FURImxI41cYQx7Cw==
X-CSE-MsgGUID: k9V64j45Ryy68hvse8hq1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62796303"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="62796303"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:17:47 -0700
X-CSE-ConnectionGUID: g//CGj2SSxyHzX/105Bpzg==
X-CSE-MsgGUID: d9LsqYvFT+So5mHhj/AP1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="148372327"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:17:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v4 2/3] drm/xe/xe_guc_pc: Lock once to update stashed
 frequencies
Date: Sun, 15 Jun 2025 23:17:35 -0700
Message-ID: <20250615-wa-22019338487-v4-2-704830697cbc@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250615-wa-22019338487-v4-0-704830697cbc@intel.com>
References: <20250615-wa-22019338487-v4-0-704830697cbc@intel.com>
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 53aaf937d4bec..d449eb0e3e8af 100644
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

