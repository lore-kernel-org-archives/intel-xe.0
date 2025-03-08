Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395A5C28B31
	for <intel-xe@archiver.kernel.org>; Sat,  8 Mar 2025 00:02:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36BD10EC52;
	Sat,  8 Mar 2025 00:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YSs3RJTZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A0710E1D6
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Mar 2025 00:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741392136; x=1772928136;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h6dqm9LrnBVG6iljkVkYoONK7ENFvWuz/syIkY6Nbf4=;
 b=YSs3RJTZl2iJHPH0g63pF94MozZWX8nBsmoGOn3kuHGB6qkRgmzLNBqu
 UUyNjeUSpdqTsee5h/9XbxypvCC9g9vJVUkNnMF4zf09TOvQr+p1ua19V
 /4LrHDbuawvW6U2Fj4iZafz51WoCKS7IuLLP88SFxO7IpnO1pl93TFuco
 GXOzhV1Ey3pFfAih0ZUkjpgKV5CYkU1VQC6mIupp/5pAtJuyX8BVCxLqz
 /CIwzSfpjpG/vJmD0W8YRG8gcSIeE06qy7PxT9c//amcxM8psVEZp2pgb
 S3q4yQoXoxLoa4ecKqA92PqOVCY9ePyL+yUo0W3nUOLazAoMASEp15yZq w==;
X-CSE-ConnectionGUID: ohu1K50pQtaOnfjkQoX+CQ==
X-CSE-MsgGUID: bbZ9kUpgQqWYF+d2+NZJGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42680416"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="42680416"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 16:02:16 -0800
X-CSE-ConnectionGUID: Gqy8SgAOQYiRcAfKz7uHKA==
X-CSE-MsgGUID: dK9lLXInQySicFBwQC49hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="119283081"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 16:02:16 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com
Subject: [PATCH v8 0/3] Allow scratch page under fault mode for certain
 platform
Date: Fri,  7 Mar 2025 19:18:26 -0500
Message-Id: <20250308001829.1459320-1-oak.zeng@intel.com>
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
 drivers/gpu/drm/xe/xe_pt.c           | 92 ++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm.c           | 31 ++++++++--
 drivers/gpu/drm/xe/xe_vm_types.h     |  2 +
 include/uapi/drm/xe_drm.h            |  6 +-
 6 files changed, 97 insertions(+), 41 deletions(-)

-- 
2.26.3

