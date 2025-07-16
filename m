Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4275AC83F27
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 20:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034AA10E699;
	Wed, 16 Jul 2025 20:45:47 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBF910E68E
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 20:45:44 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe: Disable display irqs during suspend sequence
Date: Wed, 16 Jul 2025 22:45:40 +0200
Message-ID: <20250716204537.217329-6-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250716204537.217329-4-dev@lankhorst.se>
References: <20250716204537.217329-4-dev@lankhorst.se>
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

When suspending, we disable the interrupts later than i915, which means
some hotplug may fall through despite flushing. Disable interrupts to
ensure no new failures occur.

The following dmesg happened in kms_cursor_crc@cursor_suspend:

PM: late suspend of devices complete after 16.116 msecs
xe 0000:03:00.0: [drm:intel_power_well_enable [xe]] enabling DC_off
xe 0000:03:00.0: [drm:gen9_set_dc_state.part.0 [xe]] Setting DC state from 4000000b to 00
xe 0000:03:00.0: [drm] *ERROR* DC state mismatch (0x8 -> 0x4000000b)
xe 0000:03:00.0: [drm] *ERROR* Writing dc state to 0xbffffff4 failed, now 0xffffffff
xe 0000:03:00.0: [drm:gen9_set_dc_state.part.0 [xe]] Rewrote dc state to 0xbffffff4 100 times
------------[ cut here ]------------
Missing case (dssm == 3758096384)
WARNING: CPU: 2 PID: 2765 at drivers/gpu/drm/i915/display/intel_cdclk.c:1678 bxt_get_cdclk+0x23c/0x330 [xe]
...
RIP: 0010:bxt_get_cdclk+0x23c/0x330 [xe]
...
Call Trace:
 <TASK>
 intel_cdclk_get_cdclk+0x12/0x30 [xe]
 gen9_disable_dc_states+0xc6/0x270 [xe]
 gen9_dc_off_power_well_enable+0xe/0x20 [xe]
 intel_power_well_enable+0x5c/0x80 [xe]
 intel_power_well_get+0x28/0x40 [xe]
 __intel_display_power_get_domain.part.0+0x59/0x90 [xe]
 intel_display_power_get+0x49/0x70 [xe]
 ? __pfx_xelpdp_aux_data_reg+0x10/0x10 [xe]
 intel_dp_aux_xfer+0xe7/0x740 [xe]
 intel_dp_aux_transfer+0xd4/0x340 [xe]
 ? usleep_range_state+0x6e/0xe0
 ? usleep_range_state+0x93/0xe0
 drm_dp_dpcd_access+0xc0/0x160 [drm_display_helper]
 drm_dp_dpcd_probe+0x3c/0x100 [drm_display_helper]
 intel_dp_read_dprx_caps+0x85/0xa0 [xe]
 intel_dp_hpd_pulse+0xa9/0x6b0 [xe]
 i915_digport_work_func+0x101/0x1b0 [xe]
 process_one_work+0x22b/0x6f0
 worker_thread+0x1e8/0x3d0
 ? __pfx_worker_thread+0x10/0x10
 kthread+0x11c/0x250
 ? rt_spin_unlock+0x4a/0xc0
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x26c/0x2e0
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1a/0x30
 </TASK>
...
---[ end trace 0000000000000000 ]---

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_display.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index e2e0771cf2749..65c015b9a8e31 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -338,6 +338,9 @@ void xe_display_pm_suspend(struct xe_device *xe)
 		intel_display_driver_suspend(display);
 	}
 
+	/* Disable and flush display IRQs */
+	xe_display_irq_reset(xe);
+	xe_irq_synchronize(xe);
 	xe_display_flush_cleanup_work(xe);
 
 	intel_hpd_cancel_work(display);
@@ -368,7 +371,10 @@ void xe_display_pm_shutdown(struct xe_device *xe)
 		intel_display_driver_suspend(display);
 	}
 
+	xe_display_irq_reset(xe);
+	xe_irq_synchronize(xe);
 	xe_display_flush_cleanup_work(xe);
+
 	intel_dp_mst_suspend(display);
 	intel_hpd_cancel_work(display);
 
@@ -459,6 +465,8 @@ void xe_display_pm_resume(struct xe_device *xe)
 	if (!xe->info.probe_display)
 		return;
 
+	xe_display_irq_postinstall(xe, xe_device_get_root_tile(xe));
+
 	intel_dmc_resume(display);
 
 	if (has_display(xe))
-- 
2.45.2

