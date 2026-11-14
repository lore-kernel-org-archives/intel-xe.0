Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9289606A33E
	for <intel-xe@archiver.kernel.org>; Sat, 14 Nov 2026 03:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JvdLFqtI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF8010E08C;
	Sat, 14 Nov 2026 03:58:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9ED10E08C
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Nov 2026 03:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794628692; x=1826164692;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tVmhDVqXIKiqvw9atg3QDZPaoZTXs2pQgURPMSNtH4g=;
 b=JvdLFqtIBSaJ0RpAAttkRaxauR2VaS5lJcZ86OsQgCIkGIGyJ5QkC36C
 Jbq1dLbL2Z9eGK7Mg+p8lEF5dzSt6FssbRHEl5KFPkl4VNVSWbsTapG4J
 sysGDTY2cnhrxZvpmnEF0pMEYChJLibSga4eg8AtxNONkuFKFwSRaRVOy
 AJp2WIFQ8oqO6zJCdDsOQq2Y1K668DEhXOE3iE4mFIH1PzCVC/mfyiYi5
 6LrFNnK7QzDivFoqF4rq4y6fOF1yPkUh9AbjH4UTe8uQvgd3FQpJDYlDX
 QuAiy9Z5ioBkRjI4MwA81EOsZ+RfarbCAOCtlaTRTNYRa/tMHY6xPCdyW A==;
X-CSE-ConnectionGUID: sJPe+bIESHyEJ+077hjwSQ==
X-CSE-MsgGUID: hfyrC21SRqmeZyFxRiRM3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3478159"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3478159"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 19:58:11 -0800
X-CSE-ConnectionGUID: aLPkSul7QK+ZO/uOAa2VBA==
X-CSE-MsgGUID: T220ll7/Rwqtcz8LkrZgmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9513132"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 19:58:09 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 arvind.yadav@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2] drm/xe: fix UAF race between exec-queue teardown and GuC
 CT pause-abort
Date: Sat, 14 Nov 2026 09:27:54 +0530
Message-ID: <20261114035753.3027117-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
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

xe_guc_submit_pause_abort() walks guc->submission_state.exec_queue_lookup
and unconditionally calls guc_exec_queue_kill() on every entry found,
without verifying the queue hasn't already begun/finished its own
independent teardown. guc_exec_queue_fini() (run once a queue's own
refcount drops to zero via the normal close path) only erases its xarray
entry partway through its body, via release_guc_id() -- so there is a
window where a queue's refcount is already 0 but its xarray entry is
still present.

This was caught as a debug assertion firing on both BMG and CRI:

	xe 0000:00:03.0: [drm] Assertion `kref_read(&q->refcount)` failed!
	WARNING: drivers/gpu/drm/xe/xe_guc_submit.c:2242 at guc_exec_queue_kill+0x2e2/0x360
	 guc_exec_queue_kill+0x2e2/0x360 [xe]
	 xe_guc_submit_pause_abort+0x8e/0xf0 [xe]
	 guc_submit_fini+0x11f/0x180 [xe]
	 devm_action_release+0x15/0x30
	 ...
	 device_release_driver_internal+0x230/0x270
	 unbind_store+0xac/0xc0                          [BMG: igt@xe_configfs, sysfs unbind]
	 pci_iov_remove_virtfn+0xd1/0x140
	 sriov_disable+0x42/0x100
	 pci_disable_sriov+0x23/0x40
	 xe_pci_sriov_configure+0x2b9/0x1350 [xe]
	 sriov_numvfs_store+0x136/0x1f0           [CRI: igt@xe_pmu, SR-IOV VF disable]

Pin the queue with kref_get_unless_zero() before touching it, skipping the
redundant guc_exec_queue_kill() for entries that have already
independently reached a zero refcount instead of operating on an object
that's already being torn down elsewhere.

V2(Sashiko):
-xe_sched_submission_start(sched) must still run unconditionally for every
non-duplicate entry regardless of that refcount check

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d76f125f9c3a..c333010693c2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3310,8 +3310,25 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
 		if (q->guc->id != index)
 			continue;
 
+		/*
+		 * Resume the scheduler unconditionally so any pending message
+		 * (e.g. STATIC_MSG_CLEANUP queued by a concurrent
+		 * guc_exec_queue_destroy()) still gets processed, even if q
+		 * is skipped below.
+		 */
 		xe_sched_submission_start(sched);
+
+		/*
+		 * q may have already dropped to a zero refcount via its own
+		 * independent teardown (guc_exec_queue_fini(), xarray entry
+		 * not yet erased); let that teardown finish via the resumed
+		 * scheduler instead of killing an object already being freed.
+		 */
+		if (!kref_get_unless_zero(&q->refcount))
+			continue;
+
 		guc_exec_queue_kill(q);
+		xe_exec_queue_put(q);
 	}
 	mutex_unlock(&guc->submission_state.lock);
 }
-- 
2.52.0

