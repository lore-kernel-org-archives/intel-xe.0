Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0721C369A1
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 16:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7B210E26F;
	Thu,  3 Apr 2025 16:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fM6+MEIs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F0810E26F
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 16:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743698192; x=1775234192;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kHB7rKwQ/UmksXUjWstavikGte5kCkgFgWZHWUo8M7I=;
 b=fM6+MEIsF9Ri+omVVnBZAz8XvugXFl0yoc2ksxvd3sgVHdk789XOI+qI
 tHhB3+Ub8jIKV6XhFtvPo9RWVKdcGjno8j4QGQ7TdBTOR3KRfjd6Wdnn0
 ewAH674ZhKBQlou9etGVDEkhebGFBRaFta4VU1T/HG//dCL8o2qahhZi1
 ws4H1d69lxzI1l90AQcAIR6Z7Jr9WMCRZUpdrckIMy3h+5TrkivwA7ZCa
 YJaS0S5Pa7TZBL0eOjPfV7ObDD2qLnRtNLkR42PgPTDRx+rQNqixYdbjZ
 q8ruxC64cbQp04rZ2YR09ZwEXXIpK07qkXPprsAMrasIRX6K/4/oRoZSS A==;
X-CSE-ConnectionGUID: iGBr1jWOSPupAIzyf/9d9A==
X-CSE-MsgGUID: QEiVxaHqSKGED2rwJ5I5/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="62521593"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="62521593"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 09:36:32 -0700
X-CSE-ConnectionGUID: RyKrah7pTqW5TCrQWEu7cg==
X-CSE-MsgGUID: emINQXoTSeK4BTgfj42KNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="126864614"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 09:36:31 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v10 0/3] Allow scratch page under fault mode for certain
 platform
Date: Thu,  3 Apr 2025 12:53:25 -0400
Message-Id: <20250403165328.2438690-1-oak.zeng@intel.com>
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
 drivers/gpu/drm/xe/xe_pt.c           | 99 ++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm.c           | 31 +++++++--
 drivers/gpu/drm/xe/xe_vm_types.h     |  2 +
 include/uapi/drm/xe_drm.h            |  6 +-
 6 files changed, 102 insertions(+), 43 deletions(-)

-- 
2.26.3

