Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A67C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 12:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF8E10E0B5;
	Thu,  5 Jun 2025 12:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TrL6389H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1044F10E0B5
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 12:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749125616; x=1780661616;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ogmkx/CGCmnqTkUW4b3shZInnb9Bq2yQ8sRP5ktvz/M=;
 b=TrL6389H5+s82KBJBO25o2fdNtFYrw0yd1vm9eA/XcTRj5P+puUigxkj
 l6fXaZOA8geEi5/JdxOtL+QOe2IiE08sb8BK0xKCUO4hUJQ9ueiT2G7gA
 vul7JWwJn8AGUESr8mFs55nriAneyhpqdr9PxIS95u2128u2+GwcBwCtI
 xgDT/i5RSshKJyERTz7+hXOcDc4kvluR33tSAOr70LtidUyELNP35VmBw
 hFl1rC67DpDQKXVA4s6YPyapPLvtaFxl0PbnbriU6cpSNyO47pHgQ99/4
 uRT40gIg8KFeUitsR6ngSY/k/ySRgw4T/VDKCpMX+ojzh8Zd4hnOMvFtw A==;
X-CSE-ConnectionGUID: zcxl9TQFSsqjoS8uuas21Q==
X-CSE-MsgGUID: /YywYh/9R6yB+iWxB7PEuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51155885"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="51155885"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 05:13:36 -0700
X-CSE-ConnectionGUID: Foo8AzdFQFGtGgSeYhVcHQ==
X-CSE-MsgGUID: Oja+Tlm4Q82jxHjzQ77XwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="145370509"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa006.fm.intel.com with ESMTP; 05 Jun 2025 05:13:34 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v5 0/3] CCS save restore for IGPU
Date: Thu,  5 Jun 2025 17:59:53 +0530
Message-ID: <20250605122956.10685-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

Prior IGPU design had compression supported in GPU VA domain. For
Virtualization, this makes compression Meta data save/restore for VF as
not necessary (i.e. Compression Meta data space is automatically
save/restore with normal guest/VM memory).

With latest Xe2 architecture, compression is supported by Flat, physical
domain. Meta data/compression control surface (Aka CCS) and association
is in physical domain and data is located in BIOS/firmware-reserved CCS
pool. In virtualization/SRIOV when VF save/restore now have to account for
save/restore VF associated CCS. Without this feature any restore of
compressed resource in IGPU VF domain will have corruption as Meta data
will not be restore correctly as a part of VF save/restore flow. Making it
must have/functional feature if we are supporting compression and
Save/restore of VF on IGPU platform.

This is the first in series which adds support for CCS save/restore for
IGPU.

V4 -> V5:
- Modified read/write contexts to enums from #defines (Matthew Brost).
- The CCS BB pool size is calculated based on the system memory size (Michal
  Wajdeczko & Matthew Brost).
- Fixed review comments (Matthew Brost & Matthew Auld)
- Create a list of BBs for the given BO and fixed memory leak while
  detaching BOs. (Matthew Brost).
- Yet to cleanup xe_migrate_ccs_rw_copy() function.

V3 -> V4:
- Fixed issues reported by patchworks.

V2 -> V3:
- Added new variable which denotes the initialization of contexts.
- Attach and detach functions check for IS_VF_CCS_READY().
- Made xe_migrate structure private as per review comments.
- Created new xe_migrate functions to get lrc and exec_queue.

V1 -> V2:
- Fixed review comments.

Satyanarayana K V P (3):
  drm/xe/vf: Create contexts for CCS read write
  drm/xe/vf: Attach and detach CCS copy commands with BO
  drm/xe/vf: Register CCS read/write contexts with Guc

 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_bb.c                 |  34 ++
 drivers/gpu/drm/xe/xe_bb.h                 |   3 +
 drivers/gpu/drm/xe/xe_bb_types.h           |   1 +
 drivers/gpu/drm/xe/xe_bo.c                 |  19 ++
 drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
 drivers/gpu/drm/xe/xe_device.c             |   4 +
 drivers/gpu/drm/xe/xe_device_types.h       |   4 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c         |  36 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h           |   5 +
 drivers/gpu/drm/xe/xe_guc_submit.c         |  37 ++-
 drivers/gpu/drm/xe/xe_guc_submit.h         |   1 +
 drivers/gpu/drm/xe/xe_migrate.c            | 187 +++++++++++
 drivers/gpu/drm/xe/xe_migrate.h            |  11 +
 drivers/gpu/drm/xe/xe_pm.c                 |   4 +
 drivers/gpu/drm/xe/xe_sriov.c              |  19 ++
 drivers/gpu/drm/xe/xe_sriov.h              |   1 +
 drivers/gpu/drm/xe/xe_sriov_types.h        |   5 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 353 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  17 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  52 +++
 21 files changed, 795 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h

-- 
2.43.0

