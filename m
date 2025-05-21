Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A424C54ED0
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 13:57:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F7410EA57;
	Wed, 21 May 2025 13:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNBINFyp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E0910F1EA
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 13:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747835739; x=1779371739;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cFnxGM8H72yi7qoYhcgO0GvFSwiUfnKVCcPHe6wEsJ4=;
 b=bNBINFypt5XgJPBEZp7i2TQFse6cs3MR5mqA+gq4/CAyN0knzSc1YjjL
 E7MS3Au/ppkbdL+ldh91Et6Pcm7DHi3qVF4HhHDTG42v2EwRwlpbGvTyi
 uK6gVnPFPPkXVEEPC/YAe1Het7hAnCgIQBfnu8IOdrRXF7FEvQStpjRbh
 eWP3qxGL3X0U8Ejw8MY6VDIZWiauluIC3UNbQPvARx/yCKG5oN5FjH1eJ
 qmbGnZ91FscdL9HfT8S5a1VhwpBhtQhTxRo15pdTSI+LIXbmCWSjeXJvE
 6B0WY5IqsNn+HQ4XcAC2PMUh8V3jhRR57l7axy4F806c7IheQnVpuO1My w==;
X-CSE-ConnectionGUID: G/mDS0BcSMiPasw/rNsm/w==
X-CSE-MsgGUID: GOcFj4ApQ1yHEtPe9y2AKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49075040"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49075040"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 06:55:24 -0700
X-CSE-ConnectionGUID: uuqk2VgAQt+G67o9qF7tvg==
X-CSE-MsgGUID: WCF2LMlAQM6q9e9ACwpbig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="177235245"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa001.jf.intel.com with ESMTP; 21 May 2025 06:55:23 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v4 0/3] CCS save restore for IGPU
Date: Wed, 21 May 2025 19:41:38 +0530
Message-ID: <20250521141141.17572-1-satyanarayana.k.v.p@intel.com>
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

 drivers/gpu/drm/xe/Makefile                |   3 +-
 drivers/gpu/drm/xe/xe_bb.c                 |  33 +++
 drivers/gpu/drm/xe/xe_bb.h                 |   1 +
 drivers/gpu/drm/xe/xe_bo.c                 |  21 ++
 drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
 drivers/gpu/drm/xe/xe_device.c             |   4 +
 drivers/gpu/drm/xe/xe_device_types.h       |   4 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c         |  36 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h           |   5 +
 drivers/gpu/drm/xe/xe_guc_submit.c         |  37 ++-
 drivers/gpu/drm/xe/xe_guc_submit.h         |   1 +
 drivers/gpu/drm/xe/xe_migrate.c            | 191 ++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h            |  11 +
 drivers/gpu/drm/xe/xe_pm.c                 |   4 +
 drivers/gpu/drm/xe/xe_sriov.c              |  20 ++
 drivers/gpu/drm/xe/xe_sriov.h              |   1 +
 drivers/gpu/drm/xe/xe_sriov_types.h        |   5 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 322 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  17 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  35 +++
 20 files changed, 751 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h

-- 
2.43.0

