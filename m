Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A73C3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 11:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4218A10E075;
	Fri, 16 May 2025 11:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AHdxEXyX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614AF10E075
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 11:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747395137; x=1778931137;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DI90Wz+apqXo1fwDAtWyjzhkmuPhF3HvX3zc0MqAM+Y=;
 b=AHdxEXyXu20MUIPF5hd3NwN36q9n5eXjbu3ZjC37FyqjfMMwJu0K0thM
 xr7mc3Xi6a6el7AJazNjKWBZwejlK/+KQdEVBndf8Rds9zR9W06J4gZ+n
 EQhmkHIiAe0HgkKURP2XVXNFtOT5d9uANPkzdP4VCBddZcC8GgM/eke76
 NYRR6uOUeQ9XHzOzU4qvb1Id+Y8v5+pgyC2rCuohp4WBi6T/wnFdHUaG2
 urxXFjSWlGZ1SiYT4jKho5Au/E1np1lMzDJZMfvdaJdvDxW7kH0joDb6w
 Y+T+TUC/Mvj8KDudCyWnYOjDxNtLCIIv5ZubL0g60gl/6+mpmBBKfcul2 Q==;
X-CSE-ConnectionGUID: SXHtEgn0SAuq5FQAtodHmQ==
X-CSE-MsgGUID: 2TfSGd0cSKeciYFIEKuOOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60002046"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="60002046"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 04:32:16 -0700
X-CSE-ConnectionGUID: T9jjKet+TYKKOD+pWLpfrQ==
X-CSE-MsgGUID: zp4ReFFZTLm2sowGLCPgvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="139152240"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa010.fm.intel.com with ESMTP; 16 May 2025 04:32:16 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [ONLY FOR INTERNAL REVIEW 0/3] CCS save restore for IGPU
Date: Fri, 16 May 2025 17:18:29 +0530
Message-ID: <20250516114832.19046-1-satyanarayana.k.v.p@intel.com>
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
Virtualization, this makes compression Meta data save/restore for VF as not
necessary (i.e. Compression Meta data space is automatically save/restore with
normal guest/VM memory).

With latest Xe2 architecture, compression is supported by Flat, physical domain.
Meta data/compression control surface (Aka CCS) and association is in physical
domain and data is located in BIOS/firmware-reserved CCS pool. In
virtualization/SRIOV when VF save/restore now have to account for save/restore
VF associated CCS. Without this feature any restore of compressed resource in
IGPU VF domain will have corruption as Meta data will not be restore correctly
as a part of VF save/restore flow. Making it must have/functional feature if we
are supporting compression and Save/restore of VF on IGPU platform.

This is the first in series which adds support for CCS save/restore for IGPU.

Satyanarayana K V P (3):
  drm/xe/vf: Create contexts for CCS read write
  drm/xe/vf: Attach and detach CCS copy commands with BO.
  drm/xe/vf: Register CCS read/write contexts with Guc

 drivers/gpu/drm/xe/Makefile          |   3 +-
 drivers/gpu/drm/xe/xe_bb.c           |  33 +++
 drivers/gpu/drm/xe/xe_bb.h           |   1 +
 drivers/gpu/drm/xe/xe_bo.c           |  13 ++
 drivers/gpu/drm/xe/xe_bo_types.h     |   3 +
 drivers/gpu/drm/xe/xe_device.c       |   2 +
 drivers/gpu/drm/xe/xe_device_types.h |  15 ++
 drivers/gpu/drm/xe/xe_gt_debugfs.c   |  17 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h     |   5 +
 drivers/gpu/drm/xe/xe_guc_submit.c   |  37 ++-
 drivers/gpu/drm/xe/xe_guc_submit.h   |   1 +
 drivers/gpu/drm/xe/xe_migrate.c      | 192 +++++++++++++---
 drivers/gpu/drm/xe/xe_migrate.h      |  44 +++-
 drivers/gpu/drm/xe/xe_pm.c           |   3 +
 drivers/gpu/drm/xe/xe_sriov.c        |  17 ++
 drivers/gpu/drm/xe/xe_sriov.h        |   1 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 327 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  16 ++
 18 files changed, 692 insertions(+), 38 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h

-- 
2.43.0

