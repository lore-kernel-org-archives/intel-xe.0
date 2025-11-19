Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17864CF3185
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 10:11:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C165410E5D8;
	Wed, 19 Nov 2025 10:11:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5A110E5CF;
 Wed, 19 Nov 2025 10:11:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/display/dp=5Fmst=3A_A?=
 =?utf-8?q?dd_protection_against_0_vcpi_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Nov 2025 10:11:09 -0000
Message-ID: <176354706938.8491.3583962379638491179@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251113043918.716367-1-suraj.kandpal@intel.com>
In-Reply-To: <20251113043918.716367-1-suraj.kandpal@intel.com>
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

Series: drm/display/dp_mst: Add protection against 0 vcpi (rev2)
URL   : https://patchwork.freedesktop.org/series/157471/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 54a0c901e1d19b8fee0d90fb97800bf42515cf05
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Wed Nov 19 15:16:50 2025 +0530

    drm/display/dp_mst: Add protection against 0 vcpi
    
    When releasing a timeslot there is a slight chance we may end up
    with the wrong payload mask due to overflow if the delayed_destroy_work
    ends up coming into play after a DP 2.1 monitor gets disconnected
    which causes vcpi to become 0 then we try to make the payload =
    ~BIT(vcpi - 1) which is a negative shift. VCPI id should never
    really be 0 hence skip changing the payload mask if VCPI is 0.
    
    Otherwise it leads to
    <7> [515.287237] xe 0000:03:00.0: [drm:drm_dp_mst_get_port_malloc
    [drm_display_helper]] port ffff888126ce9000 (3)
    <4> [515.287267] -----------[ cut here ]-----------
    <3> [515.287268] UBSAN: shift-out-of-bounds in
    ../drivers/gpu/drm/display/drm_dp_mst_topology.c:4575:36
    <3> [515.287271] shift exponent -1 is negative
    <4> [515.287275] CPU: 7 UID: 0 PID: 3108 Comm: kworker/u64:33 Tainted: G
    S U 6.17.0-rc6-lgci-xe-xe-3795-3e79699fa1b216e92+ #1 PREEMPT(voluntary)
    <4> [515.287279] Tainted: [S]=CPU_OUT_OF_SPEC, [U]=USER
    <4> [515.287279] Hardware name: ASUS System Product Name/PRIME Z790-P
    WIFI, BIOS 1645 03/15/2024
    <4> [515.287281] Workqueue: drm_dp_mst_wq drm_dp_delayed_destroy_work
    [drm_display_helper]
    <4> [515.287303] Call Trace:
    <4> [515.287304] <TASK>
    <4> [515.287306] dump_stack_lvl+0xc1/0xf0
    <4> [515.287313] dump_stack+0x10/0x20
    <4> [515.287316] __ubsan_handle_shift_out_of_bounds+0x133/0x2e0
    <4> [515.287324] ? drm_atomic_get_private_obj_state+0x186/0x1d0
    <4> [515.287333] drm_dp_atomic_release_time_slots.cold+0x17/0x3d
    [drm_display_helper]
    <4> [515.287355] mst_connector_atomic_check+0x159/0x180 [xe]
    <4> [515.287546] drm_atomic_helper_check_modeset+0x4d9/0xfa0
    <4> [515.287550] ? __ww_mutex_lock.constprop.0+0x6f/0x1a60
    <4> [515.287562] intel_atomic_check+0x119/0x2b80 [xe]
    <4> [515.287740] ? find_held_lock+0x31/0x90
    <4> [515.287747] ? lock_release+0xce/0x2a0
    <4> [515.287754] drm_atomic_check_only+0x6a2/0xb40
    <4> [515.287758] ? drm_atomic_add_affected_connectors+0x12b/0x140
    <4> [515.287765] drm_atomic_commit+0x6e/0xf0
    <4> [515.287766] ? _pfx__drm_printfn_info+0x10/0x10
    <4> [515.287774] drm_client_modeset_commit_atomic+0x25c/0x2b0
    <4> [515.287794] drm_client_modeset_commit_locked+0x60/0x1b0
    <4> [515.287795] ? mutex_lock_nested+0x1b/0x30
    <4> [515.287801] drm_client_modeset_commit+0x26/0x50
    <4> [515.287804] __drm_fb_helper_restore_fbdev_mode_unlocked+0xdc/0x110
    <4> [515.287810] drm_fb_helper_hotplug_event+0x120/0x140
    <4> [515.287814] drm_fbdev_client_hotplug+0x28/0xd0
    <4> [515.287819] drm_client_hotplug+0x6c/0xf0
    <4> [515.287824] drm_client_dev_hotplug+0x9e/0xd0
    <4> [515.287829] drm_kms_helper_hotplug_event+0x1a/0x30
    <4> [515.287834] drm_dp_delayed_destroy_work+0x3df/0x410
    [drm_display_helper]
    <4> [515.287861] process_one_work+0x22b/0x6f0
    <4> [515.287874] worker_thread+0x1e8/0x3d0
    <4> [515.287879] ? __pfx_worker_thread+0x10/0x10
    <4> [515.287882] kthread+0x11c/0x250
    <4> [515.287886] ? __pfx_kthread+0x10/0x10
    <4> [515.287890] ret_from_fork+0x2d7/0x310
    <4> [515.287894] ? __pfx_kthread+0x10/0x10
    <4> [515.287897] ret_from_fork_asm+0x1a/0x30
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6303
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 80939f90d3e68b92b868017ea450e6695f756666 drm-intel
54a0c901e1d1 drm/display/dp_mst: Add protection against 0 vcpi
-:82: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 9 lines checked


