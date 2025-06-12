Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341D1C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6AA10E2AE;
	Thu, 12 Jun 2025 22:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="flR9H1MT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BBB10E2AE
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 22:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749766194; x=1781302194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cnGMhjOtB4nXEAcFErvPJTq4YGryNSiY+k2a3HnZxVs=;
 b=flR9H1MTNxeeDRjWuxJJAU7zq5EGOEiI0WR6XzePBiics0OAPWlsuydd
 XiKs+f/gEDZpkHLqQWodsVZy3gKT5yXh57sBJNqCOWTpxbXBL4Vv0Sfi6
 iD8aR2lasGQW8fyr9V5na9jZbIM2T/uaNMEn3aRUW7yheaqVfQoscFMor
 fFpWIoOtF5RozADPpOkasxIA74rZzoX3dXyX1NEpiL9IObpcjw5NCxApz
 iPWmvgBFifInMFxHuO2FgLTR/azGjBxG46rjHqLKhO121F8rLUjePxzEN
 1SgvhXd8KNCGmqa7dYyUO0iZna4jue+TGy+kG/mtBvFLMK9MViYKfeXhd g==;
X-CSE-ConnectionGUID: BGyUeLlORbmW1zi4Y4p/YQ==
X-CSE-MsgGUID: SOUNN2mET4WuIzKiHkrVpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="54596253"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="54596253"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 15:09:53 -0700
X-CSE-ConnectionGUID: YuLZ9TGCTtCAkG5fP0OhfQ==
X-CSE-MsgGUID: TS2E2KScQQK6dxcPdeCFyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="152626843"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.176])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 15:09:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/xe/guc: Explicitly exit CT safe mode on unwind
Date: Fri, 13 Jun 2025 00:09:37 +0200
Message-Id: <20250612220937.857-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250612220937.857-1-michal.wajdeczko@intel.com>
References: <20250612220937.857-1-michal.wajdeczko@intel.com>
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

During driver probe we might be briefly using CT safe mode, which
is based on a delayed work, but usually we are able to stop this
once we have IRQ fully operational.  However, if we abort the probe
quite early then during unwind we might try to destroy the workqueue
while there is still a pending delayed work that attempts to restart
itself which triggers a WARN.

This was recently observed during unsuccessful VF initialization:

 [ ] xe 0000:00:02.1: probe with driver xe failed with error -62
 [ ] ------------[ cut here ]------------
 [ ] workqueue: cannot queue safe_mode_worker_func [xe] on wq xe-g2h-wq
 [ ] WARNING: CPU: 9 PID: 0 at kernel/workqueue.c:2257 __queue_work+0x287/0x710
 [ ] RIP: 0010:__queue_work+0x287/0x710
 [ ] Call Trace:
 [ ]  delayed_work_timer_fn+0x19/0x30
 [ ]  call_timer_fn+0xa1/0x2a0

Exit the CT safe mode on unwind to avoid that warning.

Fixes: 09b286950f29 ("drm/xe/guc: Allow CTB G2H processing without G2H IRQ")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 822f4c33f730..6e353757e204 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -35,6 +35,11 @@
 #include "xe_pm.h"
 #include "xe_trace_guc.h"
 
+static void receive_g2h(struct xe_guc_ct *ct);
+static void g2h_worker_func(struct work_struct *w);
+static void safe_mode_worker_func(struct work_struct *w);
+static void ct_exit_safe_mode(struct xe_guc_ct *ct);
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 enum {
 	/* Internal states, not error conditions */
@@ -189,14 +194,11 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc_ct *ct = arg;
 
+	ct_exit_safe_mode(ct);
 	destroy_workqueue(ct->g2h_wq);
 	xa_destroy(&ct->fence_lookup);
 }
 
-static void receive_g2h(struct xe_guc_ct *ct);
-static void g2h_worker_func(struct work_struct *w);
-static void safe_mode_worker_func(struct work_struct *w);
-
 static void primelockdep(struct xe_guc_ct *ct)
 {
 	if (!IS_ENABLED(CONFIG_LOCKDEP))
-- 
2.47.1

