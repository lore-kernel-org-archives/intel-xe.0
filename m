Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21541C67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 12:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C4610FDC2;
	Mon,  8 Apr 2024 12:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dh6dKsMZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C208510F948
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 12:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712579692; x=1744115692;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aGyseHeBBIqiM/96qp69Y9MZmOpR4PmcWtxf/bgDyTg=;
 b=dh6dKsMZGzY3CV9k/AFAuUPLGyedyADI6DC5rWSwHZphR6Xzmsr44y/A
 9tNXNyZHoI0jQ4zqxWttuc2IeEo6gXFCn/4dg19kP+32Mutd5URGxHKqE
 88dSKywQm4hJt73xBKU3IHc86Q+/B1ih+cS9ZIMlDj4om7pAfVGYsAZ0f
 oEC7oiG0igRE15ZQbJEUEbLCSDFKTPe/EbNkAMVTncbRUhHBFwBtbszZn
 wydsObhhh1g3kukoLFrViaZY9xPS2WToAfvE90J6JZ9DWRLzCti1WWbA/
 dqE+4DTm9uEmBemLfZ7fVFiw/GmPEv/b/9E10KSYbKfxAv2e+SAfXIlsV A==;
X-CSE-ConnectionGUID: Zzr3RLBASryaBgwFeVkx5g==
X-CSE-MsgGUID: NjSSaVJmRWGKRqyYLDTDhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="25301545"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="25301545"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 05:34:52 -0700
X-CSE-ConnectionGUID: T+vnRCJ4RzmvuMKnD6RVxg==
X-CSE-MsgGUID: zVDG5QFIQqGWfDe4uSIDOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19828648"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa010.fm.intel.com with ESMTP; 08 Apr 2024 05:34:50 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH 0/4] Cleanup and fixes in drmm_add_action_or_reset usage
Date: Mon,  8 Apr 2024 18:18:26 +0530
Message-Id: <20240408124830.591903-1-himal.prasad.ghimiray@intel.com>
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
warning messages upon failure, offering no additional value. Removed few 
of these redundant warnings calls.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Himal Prasad Ghimiray (4):
  drm/xe: Simplify function return using drmm_add_action_or_reset()
  drm/xe: Incase of action add failure, remove sysfs only once.
  drm/xe: Incase of action add failure, free_gsc_pkt only once.
  drm/xe: Return NULL incase of drmm_add_action_or_reset failure

 drivers/gpu/drm/xe/xe_device.c                |  6 +----
 drivers/gpu/drm/xe/xe_gsc_proxy.c             |  7 +-----
 drivers/gpu/drm/xe/xe_gt.c                    |  6 +----
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c           |  7 ++----
 drivers/gpu/drm/xe/xe_guc_pc.c                |  6 +----
 drivers/gpu/drm/xe/xe_huc.c                   |  9 +-------
 drivers/gpu/drm/xe/xe_hw_engine.c             |  6 +----
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 22 +++++--------------
 8 files changed, 13 insertions(+), 56 deletions(-)

-- 
2.25.1

