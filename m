Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827C0C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 05:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2644710E0E9;
	Thu,  3 Apr 2025 05:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MDroKsqa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50EE10E0E9
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 05:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743658697; x=1775194697;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IScWvatlVu4zMIVWdLbRQLDt3pgAp5s4cc7dh4Spmuk=;
 b=MDroKsqaPlEryF6uEzjbTZe7sbVZtRWN0oLQ5qXN7O4M+TWl6KpJ3bPG
 1b4CniXOdDrr+z167Vm/2SZjBdnEXoIKAcvkjSV+zChoECWIpntmX8GUl
 xrs5PYcnh1gz7cV/sxzGX2HAzsww27UhQ6cmROY6sXmQdtBBaK3SYudj9
 cHrnrx6ydhA5zYOBdW7IZyrKrtcNZNAt2f+k6h6ZQ3XNk362Lw2VE6Yla
 zLKY02jCPh7phmvUltGJuWPtdFxQt4Ckq6X6EzyeomfBdIMInpUyiugoT
 CmPeByoDbLYRVPGYni2RaR5ib1kpGQv9vBdUMKEHdfqfJYLnRjUf+fBDC g==;
X-CSE-ConnectionGUID: 9B7BHDISSPCwHr0LvwuJ9g==
X-CSE-MsgGUID: +WF26tY8RP631r4JRXpmLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55676538"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="55676538"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 22:38:16 -0700
X-CSE-ConnectionGUID: 4smYxOSTQVWk61K7qlKHkA==
X-CSE-MsgGUID: L/WBvva3Rf6wbRkclUwApQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="126861807"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 22:38:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Fix taking invalid lock on wedge
Date: Wed,  2 Apr 2025 22:38:05 -0700
Message-ID: <20250402-warn-after-wedge-v1-1-93e971511fa5@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250402-warn-after-wedge-b4a7b77bcb05
X-Mailer: b4 0.15-dev-9a9c7
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

If device wedges on e.g. GuC upload, the submission is not yet enabled
and the state is not even initialized. Protect the wedge call so it does
nothing in this case. It fixes the following splat:

	[] xe 0000:bf:00.0: [drm] device wedged, needs recovery
	[] ------------[ cut here ]------------
	[] DEBUG_LOCKS_WARN_ON(lock->magic != lock)
	[] WARNING: CPU: 48 PID: 312 at kernel/locking/mutex.c:564 __mutex_lock+0x8a1/0xe60
	...
	[] RIP: 0010:__mutex_lock+0x8a1/0xe60
	[]  mutex_lock_nested+0x1b/0x30
	[]  xe_guc_submit_wedge+0x80/0x2b0 [xe]

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++++
 drivers/gpu/drm/xe/xe_guc_types.h  | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 31bc2022bfc2d..813c3c0bb2500 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -300,6 +300,8 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 
 	primelockdep(guc);
 
+	guc->submission_state.initialized = true;
+
 	return drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
 }
 
@@ -834,6 +836,13 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 
 	xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
 
+	/*
+	 * If device is being wedged even before submission_state is
+	 * initialized, there's nothing to do here.
+	 */
+	if (!guc->submission_state.initialized)
+		return;
+
 	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
 				       guc_submit_wedged_fini, guc);
 	if (err) {
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 63bac64429a5d..1fde7614fcc52 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -89,6 +89,11 @@ struct xe_guc {
 		struct mutex lock;
 		/** @submission_state.enabled: submission is enabled */
 		bool enabled;
+		/**
+		 * @submission_state.initialized: mark when submission state is
+		 * even initialized - before that not even the lock is valid
+		 */
+		bool initialized;
 		/** @submission_state.fini_wq: submit fini wait queue */
 		wait_queue_head_t fini_wq;
 	} submission_state;



