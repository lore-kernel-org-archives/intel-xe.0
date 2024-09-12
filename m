Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D052EE57FD
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 01:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE9510E6B0;
	Thu, 12 Sep 2024 01:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dZGrwdMI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D5910E916
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 01:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726104495; x=1757640495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=heJQeJnI1aC5fTfgCQPhLujaBdz/+R8hY9mLjXxTJ+U=;
 b=dZGrwdMIe/NyD8ImMMWaFZguxwQjPX+6qj/A2WWLtqfge+/ZhDISm91m
 oMSpaHsnxH/WaDXs7f/MXHM+6N3X4HjQGihiD+plxfSZwrxBcg7PndHQY
 DbW4OXs8umfETEudgookXNUR82zjoJksJjzWfoV84pPM8AA4VBTEBT1zo
 EphUD6H6844a+/yAvu1WP3Zq4BdB4VUQmVIgHrUK83AipVtqs9rdrb6eN
 8J7PI2N0gmlQQUpqiVmFcCY3cgK9WnQ12uGRw2J/yGhjxYwIl0lY7G2AB
 E4+OsIOgGsSNRkKnRO//3LMprB+CIY0WwxHrS5EpfmDs+j4tpQJZg3Ep4 g==;
X-CSE-ConnectionGUID: D5mNcDYQSuuRmwTsVQa/rw==
X-CSE-MsgGUID: 3YSw5LD8QfmnYQKUK8GMAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25068016"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="25068016"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 18:28:15 -0700
X-CSE-ConnectionGUID: +lqIwxDIQyqGCsu/5gYx3w==
X-CSE-MsgGUID: NjGH7NhPQkK3J1P14aNhEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="68336548"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orviesa008.jf.intel.com with ESMTP; 11 Sep 2024 18:28:14 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/2] drm/xe/display: Do not do intel_fbdev_set_suspend during
 runtime
Date: Thu, 12 Sep 2024 06:55:45 +0530
Message-ID: <20240912012545.702032-3-suraj.kandpal@intel.com>
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

Do not do intel_fbdev_set_suspend during runtime_suspend/resume
functions. This cause a big circular lock_dep splat.

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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 39da79069b5a..a3131a67e5b1 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -322,7 +322,9 @@ static void __xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 	 * properly.
 	 */
 	intel_power_domains_disable(xe);
-	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
+	if (!runtime)
+		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
+
 	if (!runtime && has_display(xe)) {
 		drm_kms_helper_poll_disable(&xe->drm);
 		intel_display_driver_disable_user_access(xe);
@@ -457,7 +459,8 @@ static void __xe_display_pm_resume(struct xe_device *xe, bool runtime)
 
 	intel_opregion_resume(display);
 
-	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
+	if (!runtime)
+		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
 
 	intel_power_domains_enable(xe);
 }
-- 
2.43.2

