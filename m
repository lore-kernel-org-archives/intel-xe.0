Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D19C282C1
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 15:14:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8B410ECD3;
	Fri, 28 Feb 2025 15:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LeWC93h5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848B510ECD3
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 15:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740755696; x=1772291696;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=slHYZ08pHT9Mmu6h6PQexwpAVxLfrWgz6xbvOlZtxv4=;
 b=LeWC93h5B6aJDFpRpeKnhwuB6SuBubgzOihRFvSxwtXGg95KBFBDiON0
 0IYdoqKW84r+giK9dD6u3WZICU8nUzCVnnRmj8hzwyW6Tc7Wy1Y9Xq8do
 jXGlMa19Al4WHixsiTD2f5Xuk64jo5a6qQK43dBAye77HJ+Ti6/7IP1ox
 p831CGKOad9kKtOmhFbZnA0+1zkg20it964eIftAbFWK/ZTOTPyxI1tyd
 0C8vdWBwZeU6rGZTBIEw69TdVRtUYW4pluz22V7ZW3s8POY8VnlA+zkbW
 7qPY4YCaYEAx46gCuDwju4jds7s2uXFXJk0sQuQAu9hZJ+S1lubuY2Dcs A==;
X-CSE-ConnectionGUID: 3l8vZ8UuSdmqVtfBjgui7g==
X-CSE-MsgGUID: 0jt0cv4YRHK9do+4CGvbhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="67064332"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="67064332"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 07:14:55 -0800
X-CSE-ConnectionGUID: J8xNEMFZTwGpAoEUbd4MlA==
X-CSE-MsgGUID: rJuQg/h2QlagTwofnfL0EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="117113407"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 07:14:55 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com
Subject: [PATCH v7 0/3] Allow scratch page under fault mode for certain
 platform
Date: Fri, 28 Feb 2025 10:30:55 -0500
Message-Id: <20250228153058.1039188-1-oak.zeng@intel.com>
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
 drivers/gpu/drm/xe/xe_vm.c           | 29 +++++++--
 drivers/gpu/drm/xe/xe_vm_types.h     |  2 +
 include/uapi/drm/xe_drm.h            |  6 +-
 6 files changed, 98 insertions(+), 39 deletions(-)

-- 
2.26.3

