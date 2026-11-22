Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1314D606A330
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 13:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RozYjUXq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDBC10E9C8;
	Sun, 22 Nov 2026 13:04:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D1710E9C8
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 13:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795352693; x=1826888693;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n9PGjfJmv32pYwg+rp0L7n3dx51wZjVAXYsurW4WoR8=;
 b=RozYjUXqmxRxIN7m66XbcsWJlK7+xblKDWoSASt7IZtk4/tviYSP2ngC
 2vMHj6EWX+D5R5gmZu2KkfbibqlrVjAQavYNvdTuuG7mSCZDvfBCxDbht
 gGQPnaVzGqlaFsy2RLcrSU/RK/e2UuZgIYz2h2NjO2prECA+qDsgr3a9y
 MFI6VhnDF7jZQ7F2gKtPM4bwrHIv2qY8KNoAqS9Ec57KrgcgKOXSDcoUE
 sPoYCCkZAJfSNaI60EVcrGDj8GuCr6mwW2JAn/n7qzw+lMegbyt0UtQVb
 9H2PyVALGtBix6X/WFhB9kdZSvFtb5vkm2HrMN9L/Q7TV35lvIwI4i0e2 Q==;
X-CSE-ConnectionGUID: 52ejv13jTy6wAjCIY9IHCA==
X-CSE-MsgGUID: Qt7BmBPzQiCivKmeJKBtYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4066997"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4066997"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 05:04:53 -0800
X-CSE-ConnectionGUID: oJncMwh8SDKk3yq9TYz2JA==
X-CSE-MsgGUID: TiQ+GMNQRma0MpAYsSE3Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; d="scan'208";a="11022605"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 05:04:52 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2][CI-ONLY] drm/xe/bo: Fix async BO free teardown deadlock
Date: Sun, 22 Nov 2026 18:26:06 +0530
Message-ID: <20261122125605.3508411-4-sanjay.kumar.yadav@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The async BO free worker can drop the last drm_device reference when
freeing a page-table BO (BO -> VM -> drm_gpuvm_free() -> drm_dev_put()).
Device teardown then runs from the worker and xe_bo_dev_fini() flushes
the work it is running on, deadlocking.

  WARNING: possible recursive locking detected
  kworker/7:0/50249 is trying to acquire lock:
  ((work_completion)(&bo_dev->async_free)), at: __flush_work+0x25d/0x640
  but task is already holding lock:
  ((work_completion)(&bo_dev->async_free)), at: process_one_work+0x26d/0x890
  ...
  Workqueue: events xe_bo_dev_work_func [xe]
  Call Trace:
   flush_work+0x2d/0x40
   xe_bo_dev_fini+0xe/0x20 [xe]
   xe_device_destroy+0x19/0xa0 [xe]
   drm_managed_release+0x8b/0x170
   drm_dev_put+0x69/0x90
   drm_gpuvm_free+0xc2/0x2e0 [drm_gpuvm]
   drm_gpuvm_put+0x48/0x80 [drm_gpuvm]
   xe_ttm_bo_destroy+0xfa/0x320 [xe]
   ttm_bo_release+0x70/0x310 [ttm]
   ttm_bo_fini+0x3c/0x70 [ttm]
   xe_gem_object_free+0x1a/0x30 [xe]
   drm_gem_object_free+0x1d/0x40
   xe_bo_dev_work_func+0x3a/0x60 [xe]
   process_one_work+0x2ad/0x890
   worker_thread+0x200/0x3f0

Patch 1 fixes the deadlock by holding a device reference in the worker
and not self-flushing from xe_bo_dev_fini().

Patch 2 moves the work to the module-lifetime xe_destroy_wq, so module
unload cannot free the xe text while the worker is still finishing a
teardown it triggered.

Sanjay Yadav (2):
  drm/xe/bo: Fix self-flush deadlock in async BO free
  drm/xe/bo: Queue async BO free on the module-lifetime destroy wq

 drivers/gpu/drm/xe/xe_bo.c     | 24 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_bo.h     |  3 ++-
 drivers/gpu/drm/xe/xe_module.c |  5 +++--
 drivers/gpu/drm/xe/xe_pt.c     |  2 +-
 4 files changed, 29 insertions(+), 5 deletions(-)

-- 
2.52.0

