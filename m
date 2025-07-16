Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0EFC83F1B
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 20:51:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D4110E67A;
	Wed, 16 Jul 2025 20:51:01 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0726D10E3CB;
 Wed, 16 Jul 2025 20:51:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_hotplug_aft?=
 =?utf-8?q?er_device_suspend?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Jul 2025 20:51:00 -0000
Message-ID: <175269906002.167933.9575485651721798010@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250716204537.217329-4-dev@lankhorst.se>
In-Reply-To: <20250716204537.217329-4-dev@lankhorst.se>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Fix hotplug after device suspend
URL   : https://patchwork.freedesktop.org/series/151728/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit aabdf0676de718235b46af087241bda43c52b7b5
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Wed Jul 16 22:45:40 2025 +0200

    drm/xe: Disable display irqs during suspend sequence
    
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
+ /mt/dim checkpatch e7058b7a607f5fdfd7bc4586644756d7ef002331 drm-intel
3d9fedff4fcd drm/xe: Export xe_irq_synchronize and use it in display
aabdf0676de7 drm/xe: Disable display irqs during suspend sequence
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
xe 0000:03:00.0: [drm:gen9_set_dc_state.part.0 [xe]] Setting DC state from 4000000b to 00

-:91: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 27 lines checked


