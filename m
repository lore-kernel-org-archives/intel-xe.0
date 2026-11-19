Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76332606A325
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 11:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X6QwXPnV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D30A1122C9;
	Thu, 19 Nov 2026 11:19:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F1E1122B8
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 11:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795087166; x=1826623166;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=o+4MIcBTmO+KKRLQyYn1thEWhnjzRz6ouJXwbFqewiQ=;
 b=X6QwXPnVxedWjk4HEAr2BRkoJFP66YczQRJ48I4KTC04ieFbK085XQkM
 YgWuQSgHWeM08ovkYS90/VfsHJOx2TC+aogbxdpfEeYszbSQhJEn7wu+I
 lzv1M7g06jAyAB3KVilPNMWPfinht3V8T+QeDTywCF+j7cNOd/K5n7d2a
 RJtY+Po6Md5W4V6ysyLs/T6c2u/BZGJ4yccDBfN73Rp4/C7O27Ao9TvzJ
 5kbjjMOQemeQwSsn4FZR9fujxndeGXiyakMqdBnT0BlpCsH4zfIcTq4lF
 w7maBDIuJBC+ctLVRfkwp8dZUj4X43z2TEzN0wjgSULXTu30A5JDK+/GC g==;
X-CSE-ConnectionGUID: CVx+aA2tSqS/+G0zs76W6A==
X-CSE-MsgGUID: NtJTLkkNSa2vhcAt9gcqhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3828765"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3828765"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 03:19:26 -0800
X-CSE-ConnectionGUID: JhbIzhXCQ6WTcHSygc0JCA==
X-CSE-MsgGUID: EEutD617QvmwNqvEFBu0RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10402254"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [192.168.0.182])
 ([10.245.245.108])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 03:19:24 -0800
From: Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 0/5] Non-fatal repin retries and NUMA-local rebind worker
Date: Thu, 19 Nov 2026 11:14:31 +0000
Message-Id: <20261119-userptr-repin-v1-0-af2e327833a9@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0ML3VKghoKSIt2i1ILMPF1TIxNLS0tjs0RD42QloJ6CotS0zAqwedG
 xtbUA/GavUF8AAAA=
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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

Entire series is not necessarily intended to be merged upstream as-is.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
Matthew Auld (2):
      drm/xe/vm: restore userptr invalidations on VMA op unwind
      drm/xe: run compute rebind worker on device NUMA node

Thomas Hellström (3):
      drm/xe: Requeue the rebind worker instead of retrying in-line on -EAGAIN
      drm/xe: Add a userptr repin timeout sysfs attribute
      drm/xe/userptr: Make the repin retry loop non-fatal

 drivers/gpu/drm/xe/xe_device.c       |  13 +++-
 drivers/gpu/drm/xe/xe_device.h       |   2 +
 drivers/gpu/drm/xe/xe_device_sysfs.c |  56 ++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  18 ++++-
 drivers/gpu/drm/xe/xe_exec.c         |   9 ++-
 drivers/gpu/drm/xe/xe_pagefault.c    |   4 +
 drivers/gpu/drm/xe/xe_userptr.c      |  47 ++++++++++--
 drivers/gpu/drm/xe/xe_userptr.h      |  53 +++++++++++++
 drivers/gpu/drm/xe/xe_vm.c           | 145 ++++++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_vm.h           |   6 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c   |  23 +++++-
 drivers/gpu/drm/xe/xe_vm_types.h     |   8 ++
 12 files changed, 328 insertions(+), 56 deletions(-)
---
base-commit: 84508686117ca3be5756049acdf15e3e47fd2683
change-id: 20261118-userptr-repin-52499936a13c

