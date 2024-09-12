Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824C2EE57FC
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 01:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3764710EAC1;
	Thu, 12 Sep 2024 01:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SNQ6yR/4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B12A10EABE
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 01:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726104493; x=1757640493;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ALbjLirQ3Tu+aiEpJcyBe/OTcYpgkSp/gBGQcjLsNTY=;
 b=SNQ6yR/4MDeuldR4T1l11Bv26dSrWq8GufvoswofJ7TlYb5rbFeG5iI7
 PUDP6ZxLaQS8TAkDZnXw9k0+IgihBBji7FgKuhBEYaOr5/++ODtkShVum
 LqGi2mWfoVASzURwNtD+3hWLv2/eG1Bndvax/I1hpIXayjH8EhdNYqDiR
 P8dcvaIoy3iL9U7FIWmBiznJG+icIe3WqoizOgEJKMeNCMsuNWstDucrt
 7Sj3RzTfWtgbZ+hZ1q7O/WfJpfek8T43Fl+H0/VYVpptEIF6p4r1Mt3+r
 qQbFiHCgVp5uenBx3dv5CdeT970inwZjPA4BboACIpAgA8M8hfY3rw8iG g==;
X-CSE-ConnectionGUID: sVwz8s7HSYm3XnH24l7/lw==
X-CSE-MsgGUID: PaXX5yDsRqWX7sID8wLWGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25068011"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="25068011"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 18:28:12 -0700
X-CSE-ConnectionGUID: wdi2L4WyTuWfUIwpa4ocXA==
X-CSE-MsgGUID: psIQC517TvuTx/5T3LgXnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="68336522"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orviesa008.jf.intel.com with ESMTP; 11 Sep 2024 18:28:11 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 0/2] Move some functions out of runtime sus/resume 
Date: Thu, 12 Sep 2024 06:55:43 +0530
Message-ID: <20240912012545.702032-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
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

This patch series aims to fix two different lock_dep splats that
we see by moving intel_fbdev_set_suspend and intel_dp_mst_suspend/
resume functions out of xe_pm_runtime_suspend/resume functions

The splats are 

1)
<4> [76.011119] kworker/4:2/192 is trying to acquire lock:
<4> [76.011122] ffff8881120b3210 (&mgr->lock#2){+.+.}-{3:3}, at:
drm_dp_mst_topology_mgr_suspend+0x33/0xd0 [drm_display_helper]
<4> [76.011142] 
but task is already holding lock:
<4> [76.011144] ffffffffa0bc3420
(xe_pm_runtime_lockdep_map){+.+.}-{0:0}, at:
xe_pm_runtime_suspend+0x51/0x3f0 [xe]
<4> [76.011223] 
which lock already depends on the new lock.
<4> [76.011226] 
the existing dependency chain (in reverse order) is:
<4> [76.011229] 
-> #2 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}:
<4> [76.011233]        pm_runtime_lockdep_prime+0x2f/0x50 [xe]
<4> [76.011306]        xe_pm_runtime_resume_and_get+0x29/0x90 [xe]
<4> [76.011377]        intel_display_power_get+0x24/0x70 [xe]
<4> [76.011466]        intel_digital_port_connected_locked+0x4c/0xf0
[xe]
<4> [76.011551]        intel_dp_aux_xfer+0xb8/0x7c0 [xe]
<4> [76.011633]        intel_dp_aux_transfer+0x166/0x2e0 [xe]
<4> [76.011715]        drm_dp_dpcd_access+0x87/0x150
[drm_display_helper]
<4> [76.011726]        drm_dp_dpcd_probe+0x3d/0xf0 [drm_display_helper]
<4> [76.011737]        drm_dp_dpcd_read+0xdd/0x130 [drm_display_helper]
<4> [76.011747]        intel_dp_get_colorimetry_status+0x3a/0x70 [xe]
<4> [76.011886]        intel_dp_init_connector+0x4ff/0x1030 [xe]
<4> [76.011969]        intel_ddi_init+0xc5b/0x1030 [xe]
<4> [76.012058]        intel_bios_for_each_encoder+0x36/0x60 [xe]
<4> [76.012145]        intel_setup_outputs+0x201/0x460 [xe]
<4> [76.012233]        intel_display_driver_probe_nogem+0x155/0x1e0 [xe]
<4> [76.012320]        xe_display_init_noaccel+0x27/0x70 [xe]

2)
 kworker/0:4/198 is trying to acquire lock:
<4> [77.185594] ffffffff83398500 (console_lock){+.+.}-{0:0}, at:
intel_fbdev_set_suspend+0x169/0x1f0 [xe]
<4> [77.185947] 
but task is already holding lock:
<4> [77.185949] ffffffffa09e9460
(xe_pm_runtime_lockdep_map){+.+.}-{0:0}, at:
xe_pm_runtime_suspend+0x51/0x3f0 [xe]
<4> [77.186262] 
which lock already depends on the new lock.
<4> [77.186264] 
the existing dependency chain (in reverse order) is:
<4> [77.186266] 
-> #2 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}:
<4> [77.186276]        pm_runtime_lockdep_prime+0x2f/0x50 [xe]
<4> [77.186572]        xe_pm_runtime_resume_and_get+0x29/0x90 [xe]
<4> [77.186867]        intelfb_create+0x150/0x390 [xe]
<4> [77.187197]
__drm_fb_helper_initial_config_and_unlock+0x31c/0x5e0 [drm_kms_helper]
<4> [77.187243]        drm_fb_helper_initial_config+0x3d/0x50
[drm_kms_helper]
<4> [77.187274]        intel_fbdev_client_hotplug+0xb1/0x140 [xe]
<4> [77.187603]        drm_client_register+0x87/0xd0 [drm]
<4> [77.187704]        intel_fbdev_setup+0x51c/0x640 [xe]
<4> [77.188033]        intel_display_driver_register+0xb7/0xf0 [xe]
<4> [77.188438]        xe_display_register+0x21/0x40 [xe]
<4> [77.188809]        xe_device_probe+0xa8d/0xbf0 [xe]
<4> [77.189035]        xe_pci_probe+0x333/0x5b0 [xe]
<4> [77.189330]        local_pci_probe+0x48/0xb0
<4> [77.189341]        pci_device_probe+0xc8/0x280
<4> [77.189351]        really_probe+0xf8/0x390
<4> [77.189362]        __driver_probe_device+0x8a/0x170
<4> [77.189373]        driver_probe_device+0x23/0xb0

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (2):
  drm/xe/display: Do not suspend resume dp mst during runtime
  drm/xe/display: Do not do intel_fbdev_set_suspend during runtime

 drivers/gpu/drm/xe/display/xe_display.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

-- 
2.43.2

