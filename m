Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579F0C7115B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 18:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86CA10E549;
	Wed, 18 Jun 2025 18:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LX1TZtPA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E1C10E43D
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 18:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750272612; x=1781808612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f8Q78MS2tYerza5HApzE7Y+O5gUA9J+1JlxXvUJzovY=;
 b=LX1TZtPAVP1mN/KUgWmNcrxW2sOs3uWtHhJIGvHvb8Ea8MEXaaE+Gvxo
 F8BoUeV3Kozb7cfNcDqT/VJe8pKaX0oLUUKMa38RxtGsXOzcy3scbWMei
 TmK0/DuOuZ4LjUkIafFdgFQ3FBOFXVdAjNdTHhduk76x6OmIao4mDQJYJ
 9zY3Z2SfxOcq+6uvnX/R5rib49Iu3IB0JA45MYDawBOsr38Kgn7n57++3
 kTe157yAAwIPC9Y2z5HGgPZk9DAq3JbmDcr1vq/EokRha0kSGw2v/M0nF
 Q9s+ClRUCQVsWq0+9egnUY28qAiwp9w1a/xspJoSkWoX31GCezufQvEEv A==;
X-CSE-ConnectionGUID: O+yGTLqIQl6iYKuKk0UxDQ==
X-CSE-MsgGUID: N9pH74EhT2yK8zpRB+y3Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="75036857"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="75036857"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 11:50:11 -0700
X-CSE-ConnectionGUID: gxJJiRwrQmiTB7OapIzG5Q==
X-CSE-MsgGUID: 6SWrHIWDTaaVZ7h1zaKq1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="150730688"
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
Subject: [PATCH v5 1/4] drm/xe/guc_pc: Add _locked variant for min/max freq
Date: Wed, 18 Jun 2025 11:49:58 -0700
Message-ID: <20250618-wa-22019338487-v5-1-b888388477f2@intel.com>
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

There are places in which the getters/setters are called one after the
other causing a multiple lock()/unlock(). These are not currently a
problem since they are all happening from the same thread, but there's a
race possibility as calls are added outside of the early init when the
max/min and stashed values need to be correlated.

Add the _locked() variants to prepare for that.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 124 +++++++++++++++++++++++------------------
 1 file changed, 70 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 9fab5f5b10fa3..a01fbe1ac4d46 100644
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

