Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6B0C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 07:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C94B10E7C8;
	Fri, 12 Apr 2024 07:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vs2FIR89";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8E310E009
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 07:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712908140; x=1744444140;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+ex5hm0wISmaPfyqRBRvuslykJ4oyXSLLX/zI5Ogtow=;
 b=Vs2FIR89Tz5nNZGoyc3F1MQMZzJSRYhMYISinEfRCPWydZo6Osh5do01
 O16ePRzJgK2TX03/qWv5THkdc36BvstyTdfhvmY3w7RFfDoOuzC/zZZ9f
 c8fsW/+LasEI9I1jLh3DGyDrHC9AMnrSjzjWKUfgHzV3CvLfw6ov3CdG1
 LTBVBZvc3Iqlk9m1A8IuhVr9bRlrefDklIPnVL4MkVMbm+l2d2dtXslfi
 +3keoxtppegk6lZL/S/GLfPiJdi/OgKLsIBB6uLUKNvoKelAgNnZkcwpf
 W1AjEvhFeniY+HvrD2DSXzFjVGmeSUVPWpXH3cdaNZ2PVROzRPDq5wfje A==;
X-CSE-ConnectionGUID: Q2NF7jCDTmmZ5oWeKn++Wg==
X-CSE-MsgGUID: IwYWxxDLTqChmEjvXSNW8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="11317204"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="11317204"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 00:49:00 -0700
X-CSE-ConnectionGUID: 3k960wLbQkazmbVvP5sJtg==
X-CSE-MsgGUID: C5XKi1l5RO+pPp0dl5IHoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21220715"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa009.fm.intel.com with ESMTP; 12 Apr 2024 00:48:58 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH 0/4] Cleanup and fixes in drmm_add_action_or_reset usage
Date: Fri, 12 Apr 2024 13:32:38 +0530
Message-Id: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
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
Himal Prasad Ghimiray (4):
  drm/xe: Simplify function return using drmm_add_action_or_reset()
  drm/xe: Incase of action add failure, remove sysfs only once.
  drm/xe: Incase of action add failure, free_gsc_pkt only once.
  drm/xe: Return NULL incase of drmm_add_action_or_reset failure
  drm/xe/gt: Abort driver load for sysfs creation failure
  drm/xe/tile: Abort driver load for sysfs creation failure
  drm/xe/pm: Capture errors and handle them

 drivers/gpu/drm/xe/display/xe_display.c       |  8 +----
 drivers/gpu/drm/xe/xe_device.c                |  6 +---
 drivers/gpu/drm/xe/xe_device_sysfs.c          | 12 +++----
 drivers/gpu/drm/xe/xe_device_sysfs.h          |  2 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c             |  7 +---
 drivers/gpu/drm/xe/xe_gt.c                    | 27 ++++++++-------
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c           | 17 ++++------
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h           |  2 +-
 drivers/gpu/drm/xe/xe_gt_freq.c               | 29 ++++++++--------
 drivers/gpu/drm/xe/xe_gt_freq.h               |  2 +-
 drivers/gpu/drm/xe/xe_gt_idle.c               | 17 ++++------
 drivers/gpu/drm/xe/xe_gt_idle.h               |  2 +-
 drivers/gpu/drm/xe/xe_gt_sysfs.c              | 15 +++-----
 drivers/gpu/drm/xe/xe_gt_sysfs.h              |  2 +-
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     | 11 +++---
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                |  6 +---
 drivers/gpu/drm/xe/xe_huc.c                   |  9 +----
 drivers/gpu/drm/xe/xe_hw_engine.c             |  6 +---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 28 +++++----------
 drivers/gpu/drm/xe/xe_pm.c                    | 34 +++++++++++++++----
 drivers/gpu/drm/xe/xe_pm.h                    |  2 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  2 +-
 drivers/gpu/drm/xe/xe_tile_sysfs.c            | 17 +++++-----
 drivers/gpu/drm/xe/xe_tile_sysfs.h            |  2 +-
 drivers/gpu/drm/xe/xe_vram_freq.c             | 21 +++++-------
 drivers/gpu/drm/xe/xe_vram_freq.h             |  2 +-
 27 files changed, 125 insertions(+), 165 deletions(-)

-- 
2.25.1

