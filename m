Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74563C19F2E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 15:53:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E0310EB27;
	Thu, 27 Feb 2025 15:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AuGc0kcn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFB710E396
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 15:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740671630; x=1772207630;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2La0W433SRLcI9DUlz9CyGOgQaYYHYYeekSLrRR0QxA=;
 b=AuGc0kcngxvWgPJh4TB3htSPxHPdiPLnr92XIXDX/OQ5wn+cQCNSveRR
 Xlq6vBGKnccUHeyTnWojLFLOSUR24h2F6vviegPxECdVy8iaQ+xPx/K44
 OgPJ6hUEk3R8owaNHcaE3OPuBI50+fPiEkWdKd3c9MTrLv4EcPhwXnBA8
 DEW2cbNtwxu3As3QmnZ/sGlnHrYo8+XQFeVYKGjAVhjuGQYtlVyUz2+Za
 vjCY4X8CtekqFvQII3pD2BjnNWn7Opgqhq83bSa9EHmfsa+KsgexdD/rP
 Or+MlffcwvzdOxSrfRi+2zOycRAkmbLn4MuMtAgnp7A0WzZdbv92w+hQV Q==;
X-CSE-ConnectionGUID: i0jOTP+SSMaFif0dzpAniw==
X-CSE-MsgGUID: uMafwip7QLijp4dTac0Aww==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41273510"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="41273510"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 07:53:50 -0800
X-CSE-ConnectionGUID: gR5/uwgBQhev9q2XYKgsiA==
X-CSE-MsgGUID: pkD4T5+WSR69HoZfTXN6cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121188672"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 07:53:49 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com
Subject: [PATCH v6 0/3] Allow scratch page under fault mode for certain
 platform
Date: Thu, 27 Feb 2025 11:09:49 -0500
Message-Id: <20250227160952.807885-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Normally scratch page is not allowed when a vm is operate under page
fault mode, i.e., in the existing codes, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
and DRM_XE_VM_CREATE_FLAG_FAULT_MODE are mutual exclusive. The reason
is fault mode relies on recoverable page to work, while scratch page
can mute recoverable page fault.

On xe2 and xe3, out of bound prefetch can cause page fault and further
system hang because xekmd can't resolve such page fault. SYCL and OCL
language runtime requires out of bound prefetch to be silently dropped
without causing any functional problem, thus the existing behavior
doesn't meet language runtime requirement.

At the same time, HW prefetching can cause page fault interrupt. Due to
page fault interrupt overhead (i.e., need Guc and KMD involved to fix
the page fault), HW prefetching can be slowed by many orders of magnitude.

Fix those problems by allowing scratch page under fault mode for xe2 and
xe3. With scratch page in place, HW prefetching could always hit scratch
page instead of causing interrupt.

A side effect is, scratch page could hide application program error.
Application out of bound accesses are hided by scratch page mapping,
instead of get reported to user.

igt test: https://patchwork.freedesktop.org/series/144907/, Test result on
BMG:

root@DUT1130BMGFRD:/home/szeng/dii-tools/igt-public/build/tests# ./xe_exec_fault_mode --run-subtest scratch-fault
IGT-Version: 1.30-gde1a3cb42 (x86_64) (Linux: 6.13.0-xe x86_64)
Using IGT_SRANDOM=1738684805 for randomisation
Opened device: /dev/dri/card0
Starting subtest: scratch-fault
Subtest scratch-fault: SUCCESS (0.080s)

Oak Zeng (3):
  drm/xe: Introduced needs_scratch bit in device descriptor
  drm/xe: Clear scratch page on vm_bind
  drm/xe: Allow scratch page under fault mode for certain platform

 drivers/gpu/drm/xe/xe_device_types.h |  2 +
 drivers/gpu/drm/xe/xe_pci.c          |  5 ++
 drivers/gpu/drm/xe/xe_pt.c           | 93 ++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm.c           | 32 ++++++++--
 drivers/gpu/drm/xe/xe_vm_types.h     |  2 +
 include/uapi/drm/xe_drm.h            |  6 +-
 6 files changed, 101 insertions(+), 39 deletions(-)

-- 
2.26.3

