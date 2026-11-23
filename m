Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33163606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 05:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LM+DY3R1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC8510E09F;
	Mon, 23 Nov 2026 05:05:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BD210E09F
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 05:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795410347; x=1826946347;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s23wSO1u/9h6ctL2uk8Fbfbxa8s2qyrOG6xwVH56+/M=;
 b=LM+DY3R1ZbRkY9HPzUNsNZzRooxCqkn7vYCUr2KH6o7rYyYgG1dfRsvl
 w55OPuzktkFFO+bri3sJwrkZM5EPihCrxbsGatztWkjWs3o6Z/QitbbCi
 kU7Rbm/z3pvOKv5kzipeu4k/HQp69v5jtNICgHcV5477DKWfzSwrKNou2
 /0IraljPZQ5HNf3YNo3Yd7fMwDuAO7X1lRqcfe75Ou1761PysJhAuHo+q
 5oqnFn9ert5vc3trAZyUBxT8Ztpqbj+1G8GGPBT0Ubj7Z9t11hhzuaVfz
 EYPkZJqntCfeJE/8jp6x352kb57XnrOxYz9SC/VyuyCcMY2SgJ5QrUPDB w==;
X-CSE-ConnectionGUID: mOsbaxxaSQKFqgXk5lP0LQ==
X-CSE-MsgGUID: 8ZB/vqJISDOT6tzI6Lz17w==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4102841"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4102841"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 21:05:46 -0800
X-CSE-ConnectionGUID: J8QWZJY1RKGRhcjiPpMXiQ==
X-CSE-MsgGUID: CLfUBkacSoOLo0/FohSX/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11772153"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 21:05:45 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] drm/xe/bo: Fix async BO free teardown deadlock
Date: Mon, 23 Nov 2026 10:26:53 +0530
Message-ID: <20261123045652.3575516-4-sanjay.kumar.yadav@intel.com>
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

 drivers/gpu/drm/xe/xe_bo.c     | 20 +++++++++++++++++++-
 drivers/gpu/drm/xe/xe_bo.h     |  3 ++-
 drivers/gpu/drm/xe/xe_module.c |  5 +++--
 drivers/gpu/drm/xe/xe_pt.c     |  2 +-
 4 files changed, 25 insertions(+), 5 deletions(-)

-- 
2.52.0

