Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322F8606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rz4XSQVT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC321112A33;
	Fri, 20 Nov 2026 13:03:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6A110E878
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 13:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795179800; x=1826715800;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=I5UcUtBwm+AJJ5Txk/65W6OIXCMgESlRVUsMAH7Oj4E=;
 b=Rz4XSQVTCWWoq51FfiwWqko2XDFLB2rZp996mosjA+YEKNYyNPxQXiyp
 PWSm1Phxx3MAtxb4KgKXr2wzvqz2YPeiaDHSDLv/NeVqSMWUr/Lsy1M3+
 077MSgG7kEf+l16Hva/zn0ubFB5PkzCwBBoIAZvdDD6XXXd5tSd0ZinAi
 OJuvVRsaNTZexp8cpVqKU0zPqv0Xu8lXrToncMsWbFJhBjfUNdO3Wq7LA
 Vz5BnmbH4aED7lj2KLUgOCwsr6VwYr3nmT456842diGaIeVYA9tfWmCec
 qxpT/P9xL0rvjOVTNZCk+2K3M7zW15slVG/HINnJpwSbiAvaq69JxzxcU w==;
X-CSE-ConnectionGUID: IUMK910xTpK+NRPH4xvl2Q==
X-CSE-MsgGUID: 1TW771JaRFmg/5CYxdg3nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4072677"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4072677"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 05:03:19 -0800
X-CSE-ConnectionGUID: euGyrOtYTqGKoejc7clgzw==
X-CSE-MsgGUID: e86GfbS/S8eq9Ztgm1y3Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10639232"
Received: from slindbla-desk.ger.corp.intel.com (HELO [192.168.0.182])
 ([10.245.244.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 05:03:18 -0800
From: Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 0/6] Non-fatal repin retries and NUMA-local rebind
 worker
Date: Fri, 20 Nov 2026 13:02:15 +0000
Message-Id: <20261120-userptr-repin-v2-0-65e1f6e582ef@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MQQ7CIBCF4as0sxZTQGvpynuYLghO7SRKyYBE0
 3B3sYkbl/9L3rdCRCaMMDQrMGaKtPgaateAm62/oaBrbVCt6qSUvXjWQ0gsGAN5cVQHY4zurNQ
 O6icwTvTavMtYe6aYFn5vfJbf9SeZPylL0Qo7KdTq1GttzZl8wvveLQ8YSykftlWQxaoAAAA=
X-Change-ID: 20261118-userptr-repin-52499936a13c
To: Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 Stuart Summers <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
X-Mailer: b4 0.14.3
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

drm_gpusvm_get_pages() fails with -EBUSY after a fixed 1s budget when
CPU mappings keep changing during a userptr repin (for instance under
AutoNUMA balancing or concurrent mapping churn), which Xe currently
treats as fatal.

Retry userptr repins with locks dropped up to a configurable
userptr_repin_timeout_ms sysfs timeout (requeuing the compute rebind
worker on -EAGAIN), restore userptr invalidations lost on VMA op unwind,
and run the compute rebind worker on the device's NUMA node so HMM
faults do not trigger remote AutoNUMA migrations (hopefully).

First patch is mostly orthogonal bug fix, however series here could
potentially make the race more likely, so included it here.

---
Changes in v2:
- Reduce the timeout, also give more time for known NUMA config.
- Move the compute rebind worker away from 1-at-a-time.
- Tweak the teardown order for rebind wq.
- Split one fix out from Thomas' patch.
- Link to v1: https://lore.kernel.org/r/20261119-userptr-repin-v1-0-af2e327833a9@intel.com

---
Matthew Auld (2):
      drm/xe/vm: restore userptr invalidations on VMA op unwind
      drm/xe: run compute rebind worker on device NUMA node

Thomas Hellström (4):
      drm/xe/vf: Free preempt fences on rebind worker retry
      drm/xe: Requeue the rebind worker instead of retrying in-line on -EAGAIN
      drm/xe: Add a userptr repin timeout sysfs attribute
      drm/xe/userptr: Make the repin retry loop non-fatal

 drivers/gpu/drm/xe/xe_device.c       |  12 ++-
 drivers/gpu/drm/xe/xe_device.h       |   3 +
 drivers/gpu/drm/xe/xe_device_sysfs.c |  57 ++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  14 +++-
 drivers/gpu/drm/xe/xe_exec.c         |   9 ++-
 drivers/gpu/drm/xe/xe_pagefault.c    |   4 +
 drivers/gpu/drm/xe/xe_userptr.c      |  47 ++++++++++--
 drivers/gpu/drm/xe/xe_userptr.h      |  53 +++++++++++++
 drivers/gpu/drm/xe/xe_vm.c           | 139 ++++++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_vm.h           |   6 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c   |  23 +++++-
 drivers/gpu/drm/xe/xe_vm_types.h     |   8 ++
 12 files changed, 319 insertions(+), 56 deletions(-)
---
base-commit: 5273820504a824f0c81ed31f939599dd0da3fc69
change-id: 20261118-userptr-repin-52499936a13c

