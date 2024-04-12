Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70363C04FF8
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 17:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DF510F773;
	Fri, 12 Apr 2024 17:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n4+/LV9L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A57010F6A9
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 17:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712944707; x=1744480707;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mo5UGMVj2ySunaJYeSYvcMqsYjciTxdxT7RpJ/WKtWw=;
 b=n4+/LV9LdZLDRQQl8hqWgGO0jEZrBX+bsY3EGQiL1NV9HvQfXc29Ock4
 KM7dRlgXpX8YqsjXKBu5ja941dwd9p3/cwqnu6FGkI1VsRApLqJT5Q8au
 QmEVTR8QdQsDFKyl5Iju0ejR1T4zN9jLz1uYOepA4DMgqsMXUrR9Knj/H
 OUmKCTuSJ/viqggqTxI9M7AbnOKEKi7ri961WLOyND/pwvY+kZcUmVjIv
 /l/gJH091JK9DggM9qNkSTuBesx1ut33ESm9zFzK0qPIRciIlxoUZI8YM
 SSIJ5Cq73l3KALWEGZtBJY55l2XHNFDVFGgjQugwOp3HA1bLnHwb6q47V g==;
X-CSE-ConnectionGUID: rFdWfjjSSDaQ80QxtKebJA==
X-CSE-MsgGUID: WUzkAt1kQp20fe84XnOI0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8628125"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8628125"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 10:58:26 -0700
X-CSE-ConnectionGUID: MEnKFk4wTIGCplQErVXkRA==
X-CSE-MsgGUID: qxtKU3ZtSZufvmHWgiY5vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21369084"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa007.fm.intel.com with ESMTP; 12 Apr 2024 10:58:23 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v4 0/7] Cleanup and fixes in drmm_add_action_or_reset usage
Date: Fri, 12 Apr 2024 23:42:04 +0530
Message-Id: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

drmm_add_action_or_reset automatically triggers the corresponding action
if there's a failure. However, certain functions were previously relying
on return codes to trigger cleanup, leading to redundant calls. Removed
these functions to prevent multiple invocations.

In case of a failure, drmm_add_action_or_reset automatically triggers a
warning message, such as 'failed to add action "action_name" for
"drm_device".' Despite this, the driver was redundantly issuing similar
warning messages upon failure, offering no additional value. Remove these 
redundant warnings calls.

When encountering failures in sysfs creations or
drmm_add_action_or_reset, errors were previously suppressed. Now,
escalate these errors up the call chain, ensuring they are appropriately
handled in the caller.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Himal Prasad Ghimiray (7):
  drm/xe: Simplify function return using drmm_add_action_or_reset()
  drm/xe: Remove sysfs only once on action add failure
  drm/xe: call free_gsc_pkt only once on action add failure
  drm/xe: Return NULL in case of drmm_add_action_or_reset failure
  drm/xe/gt: Abort driver load for sysfs creation failure
  drm/xe/tile: Abort driver load for sysfs creation failure
  drm/xe/pm: Capture errors and handle them

 drivers/gpu/drm/xe/display/xe_display.c       |  8 +----
 drivers/gpu/drm/xe/xe_device.c                |  6 +---
 drivers/gpu/drm/xe/xe_device_sysfs.c          | 12 +++----
 drivers/gpu/drm/xe/xe_device_sysfs.h          |  2 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c             |  7 +---
 drivers/gpu/drm/xe/xe_gt.c                    | 26 +++++++-------
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c           | 19 ++++------
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h           |  2 +-
 drivers/gpu/drm/xe/xe_gt_freq.c               | 25 ++++++-------
 drivers/gpu/drm/xe/xe_gt_freq.h               |  2 +-
 drivers/gpu/drm/xe/xe_gt_idle.c               | 16 +++------
 drivers/gpu/drm/xe/xe_gt_idle.h               |  2 +-
 drivers/gpu/drm/xe/xe_gt_sysfs.c              | 14 +++-----
 drivers/gpu/drm/xe/xe_gt_sysfs.h              |  2 +-
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     | 13 +++----
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                |  6 +---
 drivers/gpu/drm/xe/xe_huc.c                   |  9 +----
 drivers/gpu/drm/xe/xe_hw_engine.c             |  6 +---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 28 ++++-----------
 drivers/gpu/drm/xe/xe_pci.c                   | 12 +++++--
 drivers/gpu/drm/xe/xe_pm.c                    | 36 ++++++++++++++-----
 drivers/gpu/drm/xe/xe_pm.h                    |  4 +--
 drivers/gpu/drm/xe/xe_tile.c                  |  2 +-
 drivers/gpu/drm/xe/xe_tile_sysfs.c            | 16 ++++-----
 drivers/gpu/drm/xe/xe_tile_sysfs.h            |  2 +-
 drivers/gpu/drm/xe/xe_vram_freq.c             | 20 +++++------
 drivers/gpu/drm/xe/xe_vram_freq.h             |  2 +-
 28 files changed, 124 insertions(+), 177 deletions(-)

-- 
2.25.1

