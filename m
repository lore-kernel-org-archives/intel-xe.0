Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487FCEE57FD
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 01:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE18110EAA2;
	Thu, 12 Sep 2024 01:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJTj3697";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA87A10EACB
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 01:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726104494; x=1757640494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/2iNkFoPknhxSoKTXDHmT5d8zMiRLHrm83BpFmIIKMw=;
 b=gJTj3697v/w370hcSOeHHSu7JBEYDIin9P84RpjwNvf6fraNMpkCEllQ
 aG9cmxFDDfwk0Xayf2Gxd7cwtt7NxNu0kY5BJzbJJc5qTzMXIJ9ugmvPS
 J/1NgE1yvnAiYF37ZfH8Gdj9T+r28CicGLsPFCSGllTCTV01hdQbRmfXl
 Km+Tmb62bmcEnRs5yHjalSzg3nFN7SpqYpXrqc8v31rHdo9GrFIPwclPM
 DCaHsj+CbFKV034WD2zGNkuOyn7CnLfwhT9gZQjQZZVSEN9LwzL+ys3Rr
 +1d60PmUSlcFISOlw5zRsIvlffVST+UVtZHiZv2k8vjKEGjt9qHIXDPwn Q==;
X-CSE-ConnectionGUID: VuGw2FpwT7ymjVfpXgHekw==
X-CSE-MsgGUID: dbvrbEMlSdq1G76mJw8qww==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25068013"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="25068013"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 18:28:13 -0700
X-CSE-ConnectionGUID: OegfBFvDQgmgHwpRgwuvXg==
X-CSE-MsgGUID: E1mPr4xvQWGMSyR+7JPz7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="68336537"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orviesa008.jf.intel.com with ESMTP; 11 Sep 2024 18:28:12 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/2] drm/xe/display: Do not suspend resume dp mst during
 runtime
Date: Thu, 12 Sep 2024 06:55:44 +0530
Message-ID: <20240912012545.702032-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240912012545.702032-1-suraj.kandpal@intel.com>
References: <20240912012545.702032-1-suraj.kandpal@intel.com>
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

Remove intel_dp_mst_suspend/resume from runtime suspend resume
sequences. It is incorrect as it depends on AUX transfers which
itself depend on the device being runtime resumed. This is
also why we see a lock_dep splat here.

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

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index e65e7d70f989..39da79069b5a 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -331,7 +331,8 @@ static void __xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 
 	xe_display_flush_cleanup_work(xe);
 
-	intel_dp_mst_suspend(xe);
+	if (!runtime)
+		intel_dp_mst_suspend(xe);
 
 	intel_hpd_cancel_work(xe);
 
@@ -444,7 +445,9 @@ static void __xe_display_pm_resume(struct xe_device *xe, bool runtime)
 		intel_display_driver_resume_access(xe);
 
 	/* MST sideband requires HPD interrupts enabled */
-	intel_dp_mst_resume(xe);
+	if (!runtime)
+		intel_dp_mst_resume(xe);
+
 	if (!runtime && has_display(xe)) {
 		intel_display_driver_resume(xe);
 		drm_kms_helper_poll_enable(&xe->drm);
-- 
2.43.2

