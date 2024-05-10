Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EDFC25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 18:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9861E10E34F;
	Fri, 10 May 2024 18:18:07 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F7510E34F;
 Fri, 10 May 2024 18:18:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_core=5Fhotunplug_improvem?=
 =?utf-8?q?ents?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 May 2024 18:18:05 -0000
Message-ID: <171536508565.2056703.483076559647129268@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240510181212.264622-22-matthew.auld@intel.com>
In-Reply-To: <20240510181212.264622-22-matthew.auld@intel.com>
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

Series: core_hotunplug improvements
URL   : https://patchwork.freedesktop.org/series/133462/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
57b97a66dd129aea93991dc66cd10477f7a05cf8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6c043bff1967dd164a2eaa1cfc21a93f6db0d048
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri May 10 19:12:33 2024 +0100

    drm/xe/display: move device_remove over to drmm
    
    i915 display calls this when releasing the drm_device, match this also
    in xe by using drmm. intel_display_device_remove() is freeing purely
    software state for the drm_device.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Andrzej Hajda <andrzej.hajda@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch afd593c3e9f9218ececa93e30c33182346295ac9 drm-intel
f2cc8205fe5b drm/drm_managed: try to improve the drmm DOC
5f92a217a75e drm/amdgpu: don't trample pdev drvdata
0891c1b63924 drm/xe/pci: remove broken driver_release
1760609797fb drm/xe: covert sysfs over to devm
cdf82178ac6b drm/xe/ggtt: use drm_dev_enter to mark device section
-:16: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#16: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1717

total: 0 errors, 1 warnings, 0 checks, 39 lines checked
26c68e93195c drm/xe/guc: move guc_fini over to devm
-:13: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#13: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1717

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
a61bdf6e5af0 drm/xe/guc: s/guc_fini/guc_fini_hw/
bbefb452533f drm/xe/guc_pc: move pc_fini to devm
6eff907b65c4 drm/xe/guc_pc: s/pc_fini/pc_fini_hw/
c280057f5c85 drm/xe/irq: move irq_uninstall over to devm
e3fc860f512d drm/xe/device: move flr to devm
c1fdc710349f drm/xe/device: move xe_device_sanitize over to devm
3467cf60a470 drm/xe/coredump: move over to devm
-:19: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#19: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1679

total: 0 errors, 1 warnings, 0 checks, 17 lines checked
36c887aba920 drm/xe/gt: break out gt_fini into sw vs hw state
ed6fc1a6bccf drm/xe: make gt_remove use devm
b23795ca6416 drm/xe/mmio: move mmio_fini over to devm
4c4b9e75a48c drm/xe: reset mmio mappings with devm
7389922c5733 drm/xe/display: move display fini stuff to devm
d013035c43ba drm/xe/display: stop calling domains_driver_remove twice
6c043bff1967 drm/xe/display: move device_remove over to drmm


