Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F92CD11DD
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 16:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD2E1124C7;
	Thu, 28 Mar 2024 16:17:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878BA1124C7;
 Thu, 28 Mar 2024 16:17:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_ASoC=3A_SOF=3A_Core=3A_Ad?=
 =?utf-8?q?d_remove=5Flate=28=29_to_sof=5Finit=5Fenvironment_failure_path?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Mar 2024 16:17:47 -0000
Message-ID: <171164266755.1064396.10874779324083463870@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328135233.1204694-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240328135233.1204694-1-rodrigo.vivi@intel.com>
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

Series: ASoC: SOF: Core: Add remove_late() to sof_init_environment failure path
URL   : https://patchwork.freedesktop.org/series/131766/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5007d8243eac0cb075d3497685b349d40d94c014
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Thu Mar 28 09:52:33 2024 -0400

    ASoC: SOF: Core: Add remove_late() to sof_init_environment failure path
    
    In cases where the sof driver is unable to find the firmware and/or
    topology file [1], it exits without releasing the i915 runtime
    pm wakeref [2]. This results in dmesg warnings[3] during
    suspend/resume or driver unbind. Add remove_late() to the failure path
    of sof_init_environment so that i915 wakeref is released appropriately
    
    [1]
    
    [    8.990366] sof-audio-pci-intel-mtl 0000:00:1f.3: SOF firmware and/or topology file not found.
    [    8.990396] sof-audio-pci-intel-mtl 0000:00:1f.3: Supported default profiles
    [    8.990398] sof-audio-pci-intel-mtl 0000:00:1f.3: - ipc type 1 (Requested):
    [    8.990399] sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file: intel/sof-ipc4/mtl/sof-mtl.ri
    [    8.990401] sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file: intel/sof-ace-tplg/sof-mtl-rt711-2ch.tplg
    [    8.990402] sof-audio-pci-intel-mtl 0000:00:1f.3: Check if you have 'sof-firmware' package installed.
    [    8.990403] sof-audio-pci-intel-mtl 0000:00:1f.3: Optionally it can be manually downloaded from:
    [    8.990404] sof-audio-pci-intel-mtl 0000:00:1f.3:    https://github.com/thesofproject/sof-bin/
    [    8.999088] sof-audio-pci-intel-mtl 0000:00:1f.3: error: sof_probe_work failed err: -2
    
    [2]
    
    ref_tracker: 0000:00:02.0@ffff9b8511b6a378 has 1/5 users at
         track_intel_runtime_pm_wakeref.part.0+0x36/0x70 [i915]
         __intel_runtime_pm_get+0x51/0xb0 [i915]
         intel_runtime_pm_get+0x17/0x20 [i915]
         intel_display_power_get+0x2f/0x70 [i915]
         i915_audio_component_get_power+0x23/0x120 [i915]
         snd_hdac_display_power+0x89/0x130 [snd_hda_core]
         hda_codec_i915_init+0x3f/0x50 [snd_sof_intel_hda]
         hda_dsp_probe_early+0x170/0x250 [snd_sof_intel_hda_common]
         snd_sof_device_probe+0x224/0x320 [snd_sof]
         sof_pci_probe+0x15b/0x220 [snd_sof_pci]
         hda_pci_intel_probe+0x30/0x70 [snd_sof_intel_hda_common]
         local_pci_probe+0x4c/0xb0
         pci_device_probe+0xcc/0x250
         really_probe+0x18e/0x420
         __driver_probe_device+0x7e/0x170
         driver_probe_device+0x23/0xa0
    
    [3]
    [  484.105070] ------------[ cut here ]------------
    [  484.108238] thunderbolt 0000:00:0d.2: PM: pci_pm_suspend_late+0x0/0x50 returned 0 after 0 usecs
    [  484.117106] i915 0000:00:02.0: i915 raw-wakerefs=1 wakelocks=1 on cleanup
    [  484.792005] WARNING: CPU: 2 PID: 2405 at drivers/gpu/drm/i915/intel_runtime_pm.c:444 intel_runtime_pm_driver_release+0x6c/0x80
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
    Tested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    [This commit is still under review on the sof tree, but likely targeting 6.10
    Adding to topic branch to unblock RPM in LNL VLK-56970]
    Link: https://github.com/thesofproject/linux/pull/4878
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 6d6c1e3e8368fdfb13873ec86b1dfa44a74773f8 drm-intel
5007d8243eac ASoC: SOF: Core: Add remove_late() to sof_init_environment failure path


