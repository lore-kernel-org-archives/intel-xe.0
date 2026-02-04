Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5CAE9D3E3
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 14:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712E510E66C;
	Wed,  4 Feb 2026 14:18:04 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7AF10E66C;
 Wed,  4 Feb 2026 14:18:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pf=3A_Fix_sysfs_in?=
 =?utf-8?q?itialization_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Feb 2026 14:18:03 -0000
Message-ID: <177021468310.223259.10162888944717570832@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260203235332.1350-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260203235332.1350-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Fix sysfs initialization (rev2)
URL   : https://patchwork.freedesktop.org/series/161112/
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
commit 699b7da96953a8a3755f1ad041fa4e50d6dba32c
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Feb 4 00:53:32 2026 +0100

    drm/xe/pf: Fix sysfs initialization
    
    In case of devm_add_action_or_reset() failure the provided cleanup
    action will be run immediately on the not yet initialized kobject.
    This may lead to errors like:
    
     [ ] kobject: '(null)' (ff110001393608e0): is not initialized, yet kobject_put() is being called.
     [ ] WARNING: lib/kobject.c:734 at kobject_put+0xd9/0x250, CPU#0: kworker/0:0/9
     [ ] RIP: 0010:kobject_put+0xdf/0x250
     [ ] Call Trace:
     [ ]  xe_sriov_pf_sysfs_init+0x21/0x100 [xe]
     [ ]  xe_sriov_pf_init_late+0x87/0x2b0 [xe]
     [ ]  xe_sriov_init_late+0x5f/0x2c0 [xe]
     [ ]  xe_device_probe+0x5f2/0xc20 [xe]
     [ ]  xe_pci_probe+0x396/0x610 [xe]
     [ ]  local_pci_probe+0x47/0xb0
    
     [ ] refcount_t: underflow; use-after-free.
     [ ] WARNING: lib/refcount.c:28 at refcount_warn_saturate+0x68/0xb0, CPU#0: kworker/0:0/9
     [ ] RIP: 0010:refcount_warn_saturate+0x68/0xb0
     [ ] Call Trace:
     [ ]  kobject_put+0x174/0x250
     [ ]  xe_sriov_pf_sysfs_init+0x21/0x100 [xe]
     [ ]  xe_sriov_pf_init_late+0x87/0x2b0 [xe]
     [ ]  xe_sriov_init_late+0x5f/0x2c0 [xe]
     [ ]  xe_device_probe+0x5f2/0xc20 [xe]
     [ ]  xe_pci_probe+0x396/0x610 [xe]
     [ ]  local_pci_probe+0x47/0xb0
    
    Fix that by calling kobject_init() and kobject_add() separately
    and register cleanup action after the kobject is initialized.
    
    Also make this cleanup registration a part of the create helper to
    fix another mistake, as in the loop we were wronly passing parent
    kobject while registering cleanup action, and this resulted in some
    undetected leaks.
    
    Fixes: 5c170a4d9c53 ("drm/xe/pf: Prepare sysfs for SR-IOV admin attributes")
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 241994730989320c926da9f2d0a5ec80b48f993d drm-intel
699b7da96953 drm/xe/pf: Fix sysfs initialization
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
 [ ] kobject: '(null)' (ff110001393608e0): is not initialized, yet kobject_put() is being called.

total: 0 errors, 1 warnings, 0 checks, 92 lines checked


