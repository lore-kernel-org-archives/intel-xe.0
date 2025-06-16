Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B6DC71135
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 06:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3187510E060;
	Mon, 16 Jun 2025 06:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/tiH300";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF7F10E13D
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 06:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750054668; x=1781590668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SJ8dK6Ef1IGwdVwe7nTPMcEc22Zt8x8uhyRKwcyXDQ8=;
 b=Z/tiH3009+Lk6/ZRjl1MHXb76cALA+TFmtFX5M9h7beOE6FU3NJCarb6
 P62zMfLAgOk/XEKhCjn8bLRpS7frRAYZwsyJFrZzYuOxFxxY767hSz3os
 J0oc/tEV/7RfAeCsDN4q6ETsAGWRCSLW490l25/0z1j79MZPhijne+Gai
 dGjvVXVP4h3go38+ZMPXZbgQfiPxAv3EGeZDDMTFmMTpWqEL9AcDG8YLW
 yRW7m8fa79B+KbAgIlU+dGr4OyFPqXK3aYC0ARBLJIH7vXBpWtB1c6yMU
 3lHfe+Af2OK5nLiSBXNpqvXt8CXxBmuATjprC71m92w3+fnN3K18YbtIJ Q==;
X-CSE-ConnectionGUID: fOm/H2/RQ+ir54tqpE8nig==
X-CSE-MsgGUID: Ig5zpo3wSBCyrugsmRr/zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62796302"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="62796302"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:17:47 -0700
X-CSE-ConnectionGUID: InMYe4bLTKmKc7RJA4vJxg==
X-CSE-MsgGUID: 8HOA8mmcSPGWFFQe9O7LFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="148372324"
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
Subject: [PATCH v4 1/3] drm/xe/guc_pc: Add _locked variant for min/max freq
Date: Sun, 15 Jun 2025 23:17:34 -0700
Message-ID: <20250615-wa-22019338487-v4-1-704830697cbc@intel.com>
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

There are places in which the getters/setters are called one after the
other causing a multiple lock()/unlock(). These are not currently a
problem since they are all happening from the same thread, but there's a
race possibility as calls are added outside of the early init when the
max/min and stashed values need to be correlated.

Add the _locked() variants to prepare for that.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 124 +++++++++++++++++++++++------------------
 1 file changed, 70 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 39d2acb2f30f6..53aaf937d4bec 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -5,6 +5,7 @@
 
 #include "xe_guc_pc.h"
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/ktime.h>
 
@@ -554,6 +555,25 @@ u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc)
 	return pc->rpn_freq;
 }
 
+static int xe_guc_pc_get_min_freq_locked(struct xe_guc_pc *pc, u32 *freq)
+{
+	int ret;
+
+	lockdep_assert_held(&pc->freq_lock);
+
+	/* Might be in the middle of a gt reset */
+	if (!pc->freq_ready)
+		return -EAGAIN;
+
+	ret = pc_action_query_task_state(pc);
+	if (ret)
+		return ret;
+
+	*freq = pc_get_min_freq(pc);
+
+	return 0;
+}
+
 /**
  * xe_guc_pc_get_min_freq - Get the min operational frequency
  * @pc: The GuC PC
@@ -563,27 +583,29 @@ u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc)
  *         -EAGAIN if GuC PC not ready (likely in middle of a reset).
  */
 int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
+{
+	guard(mutex)(&pc->freq_lock);
+
+	return xe_guc_pc_get_min_freq_locked(pc, freq);
+}
+
+static int xe_guc_pc_set_min_freq_locked(struct xe_guc_pc *pc, u32 freq)
 {
 	int ret;
 
-	xe_device_assert_mem_access(pc_to_xe(pc));
+	lockdep_assert_held(&pc->freq_lock);
 
-	mutex_lock(&pc->freq_lock);
-	if (!pc->freq_ready) {
-		/* Might be in the middle of a gt reset */
-		ret = -EAGAIN;
-		goto out;
-	}
+	/* Might be in the middle of a gt reset */
+	if (!pc->freq_ready)
+		return -EAGAIN;
 
-	ret = pc_action_query_task_state(pc);
+	ret = pc_set_min_freq(pc, freq);
 	if (ret)
-		goto out;
+		return ret;
 
-	*freq = pc_get_min_freq(pc);
+	pc->user_requested_min = freq;
 
-out:
-	mutex_unlock(&pc->freq_lock);
-	return ret;
+	return 0;
 }
 
 /**
@@ -596,25 +618,30 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
  *         -EINVAL if value out of bounds.
  */
 int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
+{
+	guard(mutex)(&pc->freq_lock);
+
+	return xe_guc_pc_set_min_freq_locked(pc, freq);
+}
+
+
+static int xe_guc_pc_get_max_freq_locked(struct xe_guc_pc *pc, u32 *freq)
 {
 	int ret;
 
-	mutex_lock(&pc->freq_lock);
-	if (!pc->freq_ready) {
-		/* Might be in the middle of a gt reset */
-		ret = -EAGAIN;
-		goto out;
-	}
+	lockdep_assert_held(&pc->freq_lock);
 
-	ret = pc_set_min_freq(pc, freq);
+	/* Might be in the middle of a gt reset */
+	if (!pc->freq_ready)
+		return -EAGAIN;
+
+	ret = pc_action_query_task_state(pc);
 	if (ret)
-		goto out;
+		return ret;
 
-	pc->user_requested_min = freq;
+	*freq = pc_get_max_freq(pc);
 
-out:
-	mutex_unlock(&pc->freq_lock);
-	return ret;
+	return 0;
 }
 
 /**
@@ -626,25 +653,29 @@ int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
  *         -EAGAIN if GuC PC not ready (likely in middle of a reset).
  */
 int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq)
+{
+	guard(mutex)(&pc->freq_lock);
+
+	return xe_guc_pc_get_max_freq_locked(pc, freq);
+}
+
+static int xe_guc_pc_set_max_freq_locked(struct xe_guc_pc *pc, u32 freq)
 {
 	int ret;
 
-	mutex_lock(&pc->freq_lock);
-	if (!pc->freq_ready) {
-		/* Might be in the middle of a gt reset */
-		ret = -EAGAIN;
-		goto out;
-	}
+	lockdep_assert_held(&pc->freq_lock);
 
-	ret = pc_action_query_task_state(pc);
+	/* Might be in the middle of a gt reset */
+	if (!pc->freq_ready)
+		return -EAGAIN;
+
+	ret = pc_set_max_freq(pc, freq);
 	if (ret)
-		goto out;
+		return ret;
 
-	*freq = pc_get_max_freq(pc);
+	pc->user_requested_max = freq;
 
-out:
-	mutex_unlock(&pc->freq_lock);
-	return ret;
+	return 0;
 }
 
 /**
@@ -658,24 +689,9 @@ int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq)
  */
 int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
 {
-	int ret;
-
-	mutex_lock(&pc->freq_lock);
-	if (!pc->freq_ready) {
-		/* Might be in the middle of a gt reset */
-		ret = -EAGAIN;
-		goto out;
-	}
-
-	ret = pc_set_max_freq(pc, freq);
-	if (ret)
-		goto out;
+	guard(mutex)(&pc->freq_lock);
 
-	pc->user_requested_max = freq;
-
-out:
-	mutex_unlock(&pc->freq_lock);
-	return ret;
+	return xe_guc_pc_set_max_freq_locked(pc, freq);
 }
 
 /**

-- 
2.49.0

