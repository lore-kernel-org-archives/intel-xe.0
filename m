Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D20CCA5FDD
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 13:02:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB56410E5CF;
	Fri,  2 Oct 2026 13:02:49 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171D810E38E;
 Fri,  2 Oct 2026 13:02:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PCI/IOV=3A_Fix_SR-IOV_loc?=
 =?utf-8?q?king_races_and_AB-BA_deadlocks_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Benjamin Block" <bblock@linux.ibm.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Oct 2026 13:02:49 -0000
Message-ID: <179094616909.232662.1438397879804663247@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1790267348.git.bblock@linux.ibm.com>
In-Reply-To: <cover.1790267348.git.bblock@linux.ibm.com>
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

Series: PCI/IOV: Fix SR-IOV locking races and AB-BA deadlocks (rev2)
URL   : https://patchwork.freedesktop.org/series/174935/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a9b69b94066aa26cb02e450bc10399e2aa69e379
Author: Benjamin Block <bblock@linux.ibm.com>
Date:   Fri Oct 2 14:55:53 2026 +0200

    s390/pci: Fix circular/recursive deadlocks in PCI-bus and -device release
    
    When removing PCI device or PCI bus objects there are a couple of
    call-chains where it is possible that the kernel runs into a circular
    deadlock involving the central `pci_rescan_remove_lock`.
    
    Two examples:
    
    (A) Thread α receives a PCI event notifying the kernel that a PCI
    virtual function has been moved into Reserved state, and so the PCI
    subsystem will try to remove that PCI function. The call-chain for that
    looks like this:
      __zpci_event_availability()
        -> zpci_zdev_put()              # will   lock(zpci_add_remove_lock),
                                        # and    lock(zpci_list_lock)
        -> zpci_release_device()        # will unlock(zpci_list_lock)
        -> zpci_cleanup_bus_resources() # will   lock(pci_rescan_remove_lock)
    
    Thread β is triggered by userspace writing 0 into the SysFS attribute
    `sriov_numvfs` of the parent PCI physical function of the same function
    we just try to remove. This will also try to release the PCI virtual
    function; but this time the call-chain looks like this:
      sriov_numvfs_store()
        -> ... (device driver dependent)
        -> sriov_disable()
        -> sriov_del_vfs()              # will   lock(pci_rescan_remove_lock)
        -> ... (deep chain)
        -> pci_release_dev()
        -> pcibios_release_device()
        -> zpci_zdev_put()              # will   lock(zpci_add_remove_lock)
    
    If thread α and β coincide, this will result in a cyclic deadlock.
    
    (B) Thread γ receives a PCI event notifying the kernel that one or more
    PCI functions got hot plugged, and need to be configured. A possible
    call-chain that might happen while the PCI subsystem is trying to add
    those new function looks like this:
      __zpci_event_availability()
        -> ... (multiple ways in which a device gets added)
        -> zpci_add_device()            # will   lock(zpci_add_remove_lock)
        -> zpci_bus_device_register()
        -> zpci_bus_put()               # will   lock(zbus_list_lock)
        -> zpci_bus_release()           # will unlock(zbus_list_lock)
                                        # will   lock(pci_rescan_remove_lock)
    
    Now the same thread β as above in (A) might coincide, and again could
    result in a cyclic deadlock.
    
    `pci_rescan_remove_lock` has to be and is taken at a "high level" in
    most call-chains since it is intended to protect/mutual exclude all
    rescan and/or removal actions taken in the PCI subsystem. So to prevent
    the outlined deadlock scenarios above remove it instead from the "low
    level" release functions for both the PCI device and PCI bus objects.
    
    Instead, lock `pci_rescan_remove_lock` in all call-chains leading to
    those release functions:
      * initialization of the PCI subsystem;
      * processing of availability events (CRWs) for PCI functions;
      * processing of error events (CRWs) for PCI functions;
      * architecture specific release PCI device implementation.
    
    Additionally, remove `pci_rescan_remove_lock` from zpci_bus_scan_bus()
    since its only caller zpci_scan_devices() is now always called with
    `pci_rescan_remove_lock` already held.
    
    Lastly, document the new locking expectations after these changes. Add
    sparse and lockdep annotations to functions that previously locked
    `pci_rescan_remove_lock` explicitly, making sure the lock is now
    already held when called. Additionally also add the annotations to
    zpci_zdev_put() and zpci_bus_put() to make sure that every function that
    potentially drops the last reference already holds the lock to prevent
    surprises.
    
    Fixes: 05bc1be6db4b2 ("s390/pci: create zPCI bus")
    Fixes: ab909509850b2 ("PCI: s390: Fix use-after-free of PCI resources with per-function hotplug")
    Cc: stable@vger.kernel.org
    Signed-off-by: Benjamin Block <bblock@linux.ibm.com>
+ /mt/dim checkpatch 9a844a5028d85ae6d941dddfda6450f3f3887fed drm-intel
f4e8964a4743 PCI/IOV: Make pci_lock_rescan_remove() reentrant and protect sriov_add_vfs/sriov_del_vfs
d1d8e6118ba8 PCI: Fix AB-BA deadlock between device_lock and pci_rescan_remove_lock in remove_store
118973047c54 PCI: Move declaration of pci_rescan_remove_lock into public pci.h
be830271ef34 PCI: Provide lock guard for pci_rescan_remove_lock
a9b69b94066a s390/pci: Fix circular/recursive deadlocks in PCI-bus and -device release
-:331: WARNING:TABSTOP: Statements should start on a tabstop
#331: FILE: arch/s390/pci/pci_sysfs.c:81:
+	     if (_T) sysfs_unbreak_active_protection(_T),

-:331: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#331: FILE: arch/s390/pci/pci_sysfs.c:81:
+	     if (_T) sysfs_unbreak_active_protection(_T),

total: 1 errors, 1 warnings, 0 checks, 257 lines checked


