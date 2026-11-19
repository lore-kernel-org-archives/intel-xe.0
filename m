Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E99606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 17:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kEgdMmC+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA4810F03A;
	Thu, 19 Nov 2026 17:51:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F54410E268
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 17:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795110671; x=1826646671;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dFixzXf9UFgd4WvCjo6sQubIu318E33kRd4EHA99Omk=;
 b=kEgdMmC+4s9vJLt+QAuXAu00tE7oEzTvtAqInFUTb1LmWHlSqYpngR7F
 LKMeH/HXtu3Ik6nnFXOIt+92HVie+WHRoM3z3IfexTV8CXKxdJqELNtpm
 FUv2GsZi9M7rEcurroeVrn7GdJtBmMSOR/3vpXN28HkND9rj0Pey0iQJH
 INzUi8Tg+NTA8u69Bph9PDjZdQ+sEbFDR3RbKtK29yLccII9FBj7mYoTI
 RxFNdGV3LAeUqhMb8JPjea19+0sd5ZcI40A8YKDoZmD7hmQ50oo3GVfsm
 64Ysp6jdKkAAKm/AU7Qy09Na+7Yaqr0cwivkgxf77gRXUEb1OGEX2oHGD Q==;
X-CSE-ConnectionGUID: 0fJcNAj1QWiT/65D780Dlg==
X-CSE-MsgGUID: GX6rA8oNRuSzf5FGjewVvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3866154"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3866154"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 09:51:11 -0800
X-CSE-ConnectionGUID: XLlJr8HhRrS9fxGrJ85gxQ==
X-CSE-MsgGUID: sVomv1azQzmRoCCBjD4ZBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10582813"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2026 09:51:11 -0800
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: x.wang@intel.com, jia.yao@intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com, Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH v6 0/4] FD close cleanup for XE
Date: Thu, 19 Nov 2026 09:46:17 -0800
Message-ID: <20261119174621.1311154-1-daniel.charles@intel.com>
X-Mailer: git-send-email 2.43.0
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On FD close, serialized TDR cleanup can lag behind VM teardown. GuC
may continue scheduling contexts while their page tables are being
torn down, leading to CAT errors and repeated engine resets.

This series keeps the early scheduling disable outside the serialized
TDR path and makes FD close wait before releasing queue references.
FD close first kills all queues, then waits for each queue before
dropping its reference.

Changes since v5:
 - Rebase onto drm-tip d05450d36ef3 (2026-11-19).
 - Patch 2 retains the upstream state-clear ordering and memory barrier
   in SCHED_DONE handling, and wakes the per-queue state waitqueue.
 - Patch 3 retains the upstream kernel-queue reinitialization helper.

Changes since v4:
 - Patch 1 is unchanged.
 - Patch 2 adds per-queue scheduling-state waitqueues as a standalone
   prerequisite. SCHED_DONE wakes waiters on the affected queue after
   updating its state, without waking unrelated CT waiters.
 - Patch 3 restricts early group DISABLE to the primary's own KILL.
   It also allows pending disable on a killed queue in run_job and
   avoids issuing a second DISABLE from TDR if KILL already disabled
   scheduling.
 - Patch 4 requires a KILL acknowledgement before accepting a disabled
   scheduling state, so FD close cannot finish the wait before KILL
   runs. Multi-queue members wait for their primary's acknowledgement
   and scheduling state on its per-queue waitqueue, replacing the
   shared kill_wq from v4.

v4: https://patchwork.freedesktop.org/series/175996/#rev4

Daniel Charles (2):
  drm/xe: Notify scheduling-state waiters per exec queue
  drm/xe: Synchronously wait for queue kill on FD close

Matthew Brost (2):
  drm/xe: Read scheduler message opcode under lock
  drm/xe: Disable scheduling early on FD close to avoid CAT error
    cascade

 drivers/gpu/drm/xe/xe_device.c               |   5 +
 drivers/gpu/drm/xe/xe_exec_queue.c           |  13 ++
 drivers/gpu/drm/xe/xe_exec_queue.h           |   1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |   2 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        |  13 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c          |   1 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  10 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 181 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.h           |   1 +
 10 files changed, 206 insertions(+), 23 deletions(-)

-- 
2.43.0

