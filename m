Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53195C3ABDD
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 14:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120B210E663;
	Tue, 20 May 2025 14:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aiia4NC2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D0110E5E5
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 14:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747752811; x=1779288811;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kj/SoCkU6CqhP4FMqzDwnrq/4S2jpnDqVniuFEKnlV0=;
 b=Aiia4NC2m1y0tBug2hGe28/+AnFwu6YZPVHI8rXK+LV1LjODNECJsNEZ
 gf8lfQXKXiP/buYKTp13eDKW8yCvYCJcrEfzQj3o14jwbP70xAV9/XMFm
 JhaTcUWSVwLLxrmR2rF66QztgPfx/O5zz2Yt1wbDGo2oyrFYVNp9bhS2k
 79QoMMeCGHfpwZyX6EzI5hrFZ//UV8VXUwdJBy/1M1IYxtQCO3QIsoWS2
 OhBcunKk/CGGDeoVeaxMJAo39ozQgSgNCwL2DOy3RUBB1jJcHg0yVDDa6
 L2He1E9nEF1JfyRr720/hC2Lbvdy0oDhGcffpuIjXpKj3OSeyEV6tMs2d w==;
X-CSE-ConnectionGUID: HSCw5mp6TbC/FvUugjPmqg==
X-CSE-MsgGUID: 1fQUDLAoShiGbBCvIpEyvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="48945596"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="48945596"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 07:53:31 -0700
X-CSE-ConnectionGUID: DThIh/UfRG+xqK3/4KKV2A==
X-CSE-MsgGUID: dNSkNeCaRRiZ1impY4m+UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="140724458"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa009.fm.intel.com with ESMTP; 20 May 2025 07:53:29 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [RFC v3 0/3] CCS save restore for IGPU
Date: Tue, 20 May 2025 20:39:42 +0530
Message-ID: <20250520150946.4034-1-satyanarayana.k.v.p@intel.com>
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

 drivers/gpu/drm/xe/Makefile                |   3 +-
 drivers/gpu/drm/xe/xe_bb.c                 |  33 +++
 drivers/gpu/drm/xe/xe_bb.h                 |   1 +
 drivers/gpu/drm/xe/xe_bo.c                 |  14 +
 drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
 drivers/gpu/drm/xe/xe_device.c             |   4 +
 drivers/gpu/drm/xe/xe_device_types.h       |   4 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c         |  36 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h           |   5 +
 drivers/gpu/drm/xe/xe_guc_submit.c         |  37 ++-
 drivers/gpu/drm/xe/xe_guc_submit.h         |   1 +
 drivers/gpu/drm/xe/xe_migrate.c            | 191 ++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h            |  11 +
 drivers/gpu/drm/xe/xe_pm.c                 |   3 +
 drivers/gpu/drm/xe/xe_sriov.c              |  20 ++
 drivers/gpu/drm/xe/xe_sriov.h              |   1 +
 drivers/gpu/drm/xe/xe_sriov_types.h        |   5 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 321 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  17 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  35 +++
 20 files changed, 742 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h

-- 
2.43.0

