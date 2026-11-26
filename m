Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A77E606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 16:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FoPD2sYE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1511125FD;
	Thu, 26 Nov 2026 16:58:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2DF112604
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 16:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795712309; x=1827248309;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rlcrUUWOY5flXCvzVTAjWBmwIVaLGhoBUrAmyjm8OTA=;
 b=FoPD2sYEfjU9kjollHsyJZgRe2l+j59YpnJzNyIGxJrKZdI57RsdnCSH
 METBEfK2Nr6Mo60zLArHTtSdouWDSefe8CwlnUaY+o5mjsV18FTheb0ma
 FhZhWFWQzej6QRDff0qSJb3NF8Iyd21fe/8v/f+vakwuE0fFkjoB4cgzg
 GLArSukv6L6w7oSdANfzxqKP2an64qKuEPLGmZxjXYf9U5CYccstkF/TL
 8xKnw3r9EE1QsD3zcm6O953JVUcGf4VfZShJJKMyTln1oEqXY+m6IFJx/
 iprlnim04JvhIAAR1Tri3e1YiNT9wpdqoMU+uHm9kHhr9g3Yodh6p2NrY g==;
X-CSE-ConnectionGUID: Lq2FJt8lQHmYfrUVcHLlLg==
X-CSE-MsgGUID: NtONIDHgQQ23I7IQnNk7ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4532782"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4532782"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 08:58:29 -0800
X-CSE-ConnectionGUID: /hPmpUxaQOS3eB3mzd/pLg==
X-CSE-MsgGUID: tVVijFX2TSKLu724HuoR8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12549162"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 08:58:28 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/2] drm/xe/bo: Fix device teardown from BO destroy workers
Date: Thu, 26 Nov 2026 22:19:24 +0530
Message-ID: <20261126164923.3892097-4-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Since drm_gpuvm holds a device reference, the final VM put from BO
destroy can drop the last device reference and run device teardown in a
worker that teardown itself waits for.

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

The TTM delayed delete worker can hit the same, as ttm_device_fini()
drains its workqueue.

Patch 1 defers the final VM put from xe_ttm_bo_destroy() to the
module-lifetime xe_destroy_wq.

Patch 2 moves the async BO free work to xe_destroy_wq, so module unload
drains it.

Sanjay Yadav (2):
  drm/xe/bo: Defer the final VM put from BO destroy
  drm/xe/bo: Queue async BO free on the module-lifetime destroy wq

 drivers/gpu/drm/xe/xe_bo.c       | 16 ++++++++++++----
 drivers/gpu/drm/xe/xe_bo.h       |  3 ++-
 drivers/gpu/drm/xe/xe_module.c   |  5 +++--
 drivers/gpu/drm/xe/xe_pt.c       |  2 +-
 drivers/gpu/drm/xe/xe_vm.c       | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h       |  2 ++
 drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
 7 files changed, 51 insertions(+), 8 deletions(-)

-- 
2.52.0

