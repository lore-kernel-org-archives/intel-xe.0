Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC0D104891E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 21:54:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F4310EC58;
	Fri, 27 Feb 2026 21:54:15 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEB010EC49;
 Fri, 27 Feb 2026 21:54:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pf=3A_Take_pci=5Fr?=
 =?utf-8?q?escan=5Fremove=5Flock_mutex_when_disabling_VFs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Feb 2026 21:54:14 -0000
Message-ID: <177222925416.297701.601271790940105908@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260227214048.12649-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260227214048.12649-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Take pci_rescan_remove_lock mutex when disabling VFs
URL   : https://patchwork.freedesktop.org/series/162346/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 302a032f50b095b3e934f202c05299d12e008c71
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Feb 27 22:40:47 2026 +0100

    drm/xe/pf: Take pci_rescan_remove_lock mutex when disabling VFs
    
    Since recent commit a5338e365c45 ("PCI/IOV: Fix race between SR-IOV
    enable/disable and hotplug") the driver pci_driver.sriov_configure
    hook is called with the mutex pci_rescan_remove_lock already taken.
    
    As we are using this hook as-is during driver removal, we get:
    
     [ ] xe 0000:4d:00.0: [drm:xe_pci_sriov_configure [xe]] PF: disabling 1 VF
     [ ] ------------[ cut here ]------------
     [ ] debug_locks && !(lock_is_held(&(&pci_rescan_remove_lock)->dep_map) != 0)
     [ ] WARNING: drivers/pci/remove.c:130 at pci_stop_and_remove_bus_device+0x4c/0x50, CPU#32: rmmod/6476
     [ ] RIP: 0010:pci_stop_and_remove_bus_device+0x4c/0x50
     [ ] Call Trace:
     [ ]  <TASK>
     [ ]  pci_iov_remove_virtfn+0xd1/0x140
     [ ]  sriov_disable+0x42/0x100
     [ ]  pci_disable_sriov+0x34/0x50
     [ ]  xe_pci_sriov_configure+0x2d0/0x1150 [xe]
     [ ]  xe_pci_remove+0x7c/0x190 [xe]
     [ ]  pci_device_remove+0x41/0xb0
     [ ]  device_remove+0x43/0x80
     [ ]  device_release_driver_internal+0x215/0x280
     [ ]  driver_detach+0x50/0xb0
     [ ]  bus_remove_driver+0x86/0x120
     [ ]  driver_unregister+0x2f/0x60
     [ ]  pci_unregister_driver+0x22/0xc0
     [ ]  xe_unregister_pci_driver+0x15/0x20 [xe]
     [ ]  xe_exit+0x1f/0x34 [xe]
    
    Fix that by taking a pci_rescan_remove_lock as it is now expected.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1 drm-intel
302a032f50b0 drm/xe/pf: Take pci_rescan_remove_lock mutex when disabling VFs
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
 [ ] debug_locks && !(lock_is_held(&(&pci_rescan_remove_lock)->dep_map) != 0)

-:82: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 34 lines checked


