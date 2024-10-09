Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2449CF044A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 10:36:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8317D10E6CC;
	Wed,  9 Oct 2024 10:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L6vASbQ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F05C10E6CA
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 10:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728470184; x=1760006184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IRVmcdj9ufbcQy4BZPvRkGmBMuDJLPvVixEcqpcJf0E=;
 b=L6vASbQ1kOICvJc6qr8DK4x2Wu2pG9Ct8rnKM4at5y0hGbbd8JrZa+cy
 +3RO9mUZRH68apVRBxdSyJNTmNx0CK0m5VZDdU5fePAcGC5qJ/NrK6qqO
 aZX1EE/HaOEO0gD1Aokb53JB9VtiU443XIaF1eG3Eu953eUIZCEIxTtjM
 K6BlUlvHmFE7nVtLfRw7wC0J6ITJHu3PwXBwO3HpxpH86o3rzqs66Us1o
 S0ufqLvZ4hEcJiGiWbcd/THbpvahwmginBDnSVwV//wzu59FkgwCdjyli
 WBh69BcTovMu38cDK82RgT1YTslgJoxGGWAnABa2KrWAXRHl18bTR7M9O w==;
X-CSE-ConnectionGUID: POSNuiipRWmiihHz2mb6eg==
X-CSE-MsgGUID: Z9dc9VuGR4KKt6q6iyzUYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="39152330"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="39152330"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 03:36:24 -0700
X-CSE-ConnectionGUID: 8uWwOkvSRlyWpQ80y9zbog==
X-CSE-MsgGUID: /56xUY7oQsagDnv5HVRwyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="80191505"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 03:36:21 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, john.c.harrison@intel.com,
 rodrigo.vivi@intel.com, matthew.brost@intel.com, matthew.auld@intel.com
Subject: [PATCH 1/3] drm/xe/guc/ct: Improve g2h request handling during async
 gt reset
Date: Wed,  9 Oct 2024 16:26:43 +0530
Message-Id: <20241009105645.1416588-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009105645.1416588-1-badal.nilawar@intel.com>
References: <20241009105645.1416588-1-badal.nilawar@intel.com>
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

It is possible that a g2h request may be cancelled while waiting for a
response due to an asynchronous gt reset. This commit ensures that in
such cases, caller will be notified by returning -ECANCELED.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index c7673f56d413..b93b2821e4e8 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -512,6 +512,9 @@ void xe_guc_ct_stop(struct xe_guc_ct *ct)
 {
 	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED);
 	stop_g2h_handler(ct);
+
+	/* Notify callers that CT stopped and G2H requests are cancelled */
+	wake_up_all(&ct->g2h_fence_wq);
 }
 
 static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
@@ -1018,6 +1021,19 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
 
+	/*
+	 * It is possible that the g2h request may be cancelled while waiting for a response due
+	 * to an asynchronous gt reset. In such cases, return -ECANCELED.
+	 */
+	mutex_lock(&ct->lock);
+	if (ct->state == XE_GUC_CT_STATE_STOPPED) {
+		xe_gt_dbg(gt, "H2G action %#x canceled as GT reset is in progress\n",
+			  action[0]);
+		mutex_unlock(&ct->lock);
+		return -ECANCELED;
+	}
+	mutex_unlock(&ct->lock);
+
 	/*
 	 * Ensure we serialize with completion side to prevent UAF with fence going out of scope on
 	 * the stack, since we have no clue if it will fire after the timeout before we can erase
-- 
2.34.1

