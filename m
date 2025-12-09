Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1A8D3B994
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 21:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23F210E4E1;
	Tue,  9 Dec 2025 21:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxmy+gMZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D589110E4E1
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 21:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765315537; x=1796851537;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2kK4KclX5NyhQWMpQLdYTPq0TG/CE7TcD1cBktTcWBE=;
 b=fxmy+gMZytGZ3+rU3veM9oYU3r4PBu2Vyq84h4fNezxaXcOXORt3QE6y
 lMMdGr2MXxBoTCg05nq5iucuTpkYxYuWz2AeLtS0KG7YbkAHdWi9RklLs
 kBUalDeV5+yGznd9gXkbkn/43d1XuU2Fp+KCzz7MX0agmPfHI8GJTnhlI
 LjLtyZBKK23FL542k5mcPbMn3Ol+S6wniHjan0jtpsrERCwYQ7Hqu0dht
 KddatuNzZly8Q92luxg06f2WQdR/kCu8OZPqsRUb74KRiCHMXEmV1MUOC
 HYWw9/NT/RP+dPX+rFNwPTbSeKC9zJ4UbrsPq83APu8QrzFD/6lnhwd6F w==;
X-CSE-ConnectionGUID: gWAwzlEPRe6w80eo7tNFpQ==
X-CSE-MsgGUID: e/uo83oqS0mHTaWy/Z/Y9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67241135"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67241135"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 13:25:37 -0800
X-CSE-ConnectionGUID: B6XFqn7jTSCxHW8Wu8HsVQ==
X-CSE-MsgGUID: fNPw8qMDTYql7ioXZObq0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="195932263"
Received: from dut4419lnl.fm.intel.com ([10.105.10.210])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 13:25:36 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com
Subject: [PATCH] drm/xe/xe_guc_ct: Prevent compiler read/write optimization
 breaks
Date: Tue,  9 Dec 2025 21:25:36 +0000
Message-ID: <20251209212535.159493-2-jonathan.cavitt@intel.com>
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

Use READ_ONCE and WRITE_ONCE when operating on ct->state and the
g2h_fence->done values to prevent the compiler from ignoring these
necessary operations.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 6 +++---
 drivers/gpu/drm/xe/xe_guc_ct.h | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 648f0f523abb..9129c50f5370 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -206,7 +206,7 @@ static void g2h_fence_cancel(struct g2h_fence *g2h_fence)
 {
 	g2h_fence->cancel = true;
 	g2h_fence->fail = true;
-	g2h_fence->done = true;
+	WRITE_ONCE(g2h_fence->done, true);
 }
 
 static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
@@ -527,7 +527,7 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
 	if (ct->g2h_outstanding)
 		xe_pm_runtime_put(ct_to_xe(ct));
 	ct->g2h_outstanding = 0;
-	ct->state = state;
+	WRITE_ONCE(ct->state, state);
 
 	xe_gt_dbg(gt, "GuC CT communication channel %s\n",
 		  state == XE_GUC_CT_STATE_STOPPED ? "stopped" :
@@ -1496,7 +1496,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
 
-	g2h_fence->done = true;
+	WRITE_ONCE(g2h_fence->done, true);
 	smp_mb();
 
 	wake_up_all(&ct->g2h_fence_wq);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 5599939f8fe1..cb1335f1d66f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -30,12 +30,12 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
 
 static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
 {
-	return ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED;
+	return READ_ONCE(ct->state) != XE_GUC_CT_STATE_NOT_INITIALIZED;
 }
 
 static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
 {
-	return ct->state == XE_GUC_CT_STATE_ENABLED;
+	return READ_ONCE(ct->state) == XE_GUC_CT_STATE_ENABLED;
 }
 
 static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
-- 
2.43.0

