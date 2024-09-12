Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B86EE57FC
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 01:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D5710E983;
	Thu, 12 Sep 2024 01:34:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF3E10E983;
 Thu, 12 Sep 2024 01:34:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Move_some_functions_out_o?=
 =?utf-8?q?f_runtime_sus/resume_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Sep 2024 01:34:04 -0000
Message-ID: <172610484425.989265.9137394238396684045@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912012545.702032-1-suraj.kandpal@intel.com>
In-Reply-To: <20240912012545.702032-1-suraj.kandpal@intel.com>
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

Series: Move some functions out of runtime sus/resume (rev2)
URL   : https://patchwork.freedesktop.org/series/138532/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1eb4e0fa50bcf7e096cc3750a48cee3e964fdd42
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Thu Sep 12 06:55:45 2024 +0530

    drm/xe/display: Do not do intel_fbdev_set_suspend during runtime
    
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
+ /mt/dim checkpatch 024375dea928f05b859b457ceaff8c2b33609121 drm-intel
505d5837c2cb drm/xe/display: Do not suspend resume dp mst during runtime
1eb4e0fa50bc drm/xe/display: Do not do intel_fbdev_set_suspend during runtime


